LevelEffect = {}
function LevelEffect:setup_metatable(o)
  local o = o or {}
  _G.setmetatable(o, self)
  self.__index = self
  return o
end
function LevelEffect:inherit()
  return self:setup_metatable()
end
function LevelEffect:new(o)
  o = o or {}
  self:setup_metatable(o)
  o:init()
  return o
end
function LevelEffect:init()
end
function LevelEffect:update(dt, time)
end
function setLevelEffects(theme)
  g_level_effects = {}
  if blockTable.themes[theme].effects then
    local _ENV = _G.getfenv(1)
    for _, v in _G.ipairs(blockTable.themes[theme].effects) do
      local fx = _ENV[v.type]:new(v.params)
      _G.table.insert(g_level_effects, fx)
    end
  end
end
function updateLevelEffects(dt, time)
  for _, v in _G.ipairs(g_level_effects) do
    v:update(dt, time)
  end
end
g_thunder_duration_cap = 1.5
g_thunder_durations = {
  {
    chance = 1,
    min = 0.7,
    max = 0.8
  },
  {
    chance = 3,
    min = 0.3,
    max = 0.66
  }
}
g_thunder_duration_in = 0.15
g_thunder_duration_out = 0.25
g_thunder_interval_min = 3
g_thunder_interval_max = 20
g_thunder_sound_delay_min = 0.2
g_thunder_sound_delay_max = 2.2
Thunder = LevelEffect:inherit()
function Thunder:init()
  self.thunder_active = false
  self.thunder_interval = _G.math.random(3, 6)
  self.sound_played = true
  for _, v in _G.ipairs(self.flash_layers) do
    setThemeRectColour(v - 1, 255, 255, 255, 0)
  end
  for _, v in _G.ipairs(self.shadow_layers) do
    setThemeRectColour(v - 1, 0, 0, 0, 0)
  end
end
function Thunder:update(dt, time)
  if self.thunder_active then
    self:updateThunder(dt)
  else
    self.thunder_interval = self.thunder_interval - dt
    if self.thunder_interval <= 0 then
      self:doThunder()
    end
  end
  if not self.sound_played then
    self.sound_timer = self.sound_timer - dt
    if 0 >= self.sound_timer then
      playAudio(getAudioName("lightning"), 1, false)
      self.sound_played = true
    end
  end
end
function Thunder:doThunder()
  local tc = 0
  for _, v in _G.ipairs(g_thunder_durations) do
    tc = tc + v.chance
  end
  local r = _G.math.random(1, tc)
  local cc = 0
  local d = 1
  for k, v in _G.ipairs(g_thunder_durations) do
    if r > cc then
      d = k
    end
    cc = cc + v.chance
  end
  local dur = g_thunder_durations[d]
  self.thunder_duration = dur.min + _G.math.random() * (dur.max - dur.min)
  self.thunder_timer = 0
  self.sound_timer = g_thunder_sound_delay_min + _G.math.random() * (g_thunder_sound_delay_max - g_thunder_sound_delay_min)
  self.thunder_interval = g_thunder_interval_min + _G.math.random() * (g_thunder_interval_max - g_thunder_interval_min)
  self.sound_played = false
  self.thunder_active = true
  self.previous_alpha = 0
  self.alpha = 0
  self.alpha_change_timer = 0
end
function Thunder:updateThunder(dt)
  local total_duration = self.thunder_duration + g_thunder_duration_in + g_thunder_duration_out
  local alpha_change_delay = 0.06
  self.thunder_timer = _G.math.min(self.thunder_timer + dt, total_duration)
  self.alpha_change_timer = self.alpha_change_timer + dt
  if alpha_change_delay <= self.alpha_change_timer then
    local new_alpha = 0
    if self.thunder_timer < g_thunder_duration_in then
      new_alpha = self.thunder_timer / g_thunder_duration_in
    elseif self.thunder_timer < g_thunder_duration_in + self.thunder_duration then
      local scalar = g_thunder_duration_cap + self.thunder_duration / (g_thunder_duration_cap * 3)
      new_alpha = _G.math.max(1 - scalar + _G.math.random() * scalar, 0)
    else
      new_alpha = 1 - (self.thunder_timer - (g_thunder_duration_in + self.thunder_duration)) / g_thunder_duration_out
    end
    self.previous_alpha = self.alpha
    self.alpha = new_alpha
    self.alpha_change_timer = 0
  end
  local alpha = tweenLinear(self.alpha_change_timer, self.previous_alpha, self.alpha - self.previous_alpha, alpha_change_delay)
  if self.thunder_timer == total_duration then
    self.thunder_active = false
    alpha = 0
  end
  for _, v in _G.ipairs(self.flash_layers) do
    setThemeRectColour(v - 1, 255, 255, 255, _G.math.floor(alpha * 255))
  end
  for _, v in _G.ipairs(self.shadow_layers) do
    setThemeRectColour(v - 1, 0, 0, 0, _G.math.floor(alpha * 255))
  end
end
g_foam_margin = 0.1
g_max_foam = 0.5
g_water_margin = 0.2
g_wave_frequecy = 1
g_foam_fall_speed = 0.6
Waves = LevelEffect:inherit()
function Waves:init()
  _, self.foam_h = _G.res.getSpriteBounds(self.foam_layer.sprite)
  _, self.water_h = _G.res.getSpriteBounds(self.water_layer.sprite)
  _, self.ground_h = _G.res.getSpriteBounds(self.ground_layer.sprite)
  self.last_foam_offset = 0
  self.run_time = 0
  self:updateWaves(0)
end
function Waves:update(dt, time)
  self:updateWaves(dt)
end
function Waves:updateWaves(dt)
  self.run_time = self.run_time + dt
  local water_high = self.water_h * g_water_margin
  local water_movement = (self.ground_h - water_high) / 2
  local water_offset = _G.math.sin(self.run_time * g_wave_frequecy) * water_movement + (water_high + water_movement)
  local foam_offset = self.last_foam_offset + self.foam_h * g_foam_fall_speed * dt
  if foam_offset > water_offset - self.foam_h * g_foam_margin then
    foam_offset = water_offset - self.foam_h * g_foam_margin
  elseif foam_offset < water_offset - (self.foam_h - self.foam_h * g_max_foam) then
    foam_offset = water_offset - (self.foam_h - self.foam_h * g_max_foam)
  end
  setThemeForegroundOffsetY(self.water_layer.index - 1, water_offset)
  setThemeForegroundOffsetY(self.foam_layer.index - 1, foam_offset)
  self.last_foam_offset = foam_offset
end
Blink = LevelEffect:inherit()
function Blink:init()
  self.on_min = self.on_min or 1
  self.on_max = self.on_max or 4
  self.off_min = self.off_min or 1
  self.off_max = self.off_max or 30
  self.timer = 0
  self.animate_after = _G.math.random(self.off_min, self.off_max) / 10
  self.active = false
  setThemeRectColour(self.layer - 1, 255, 255, 255, 0)
end
function Blink:update(dt, time)
  self.timer = self.timer + dt
  if self.timer >= self.animate_after then
    self.timer = 0
    if self.active then
      self.animate_after = _G.math.random(self.off_min, self.off_max) / 10
      self.active = false
      setThemeRectColour(self.layer - 1, 255, 255, 255, 0)
    else
      self.animate_after = _G.math.random(self.on_min, self.on_max) / 10
      self.active = true
      setThemeRectColour(self.layer - 1, 255, 255, 255, 255)
    end
  end
end
Fade = LevelEffect:inherit()
function Fade:init()
  self.phases = {
    {name = "HIDDEN", starting_alpha = 0},
    {name = "FADEIN", starting_alpha = 0.5},
    {name = "SHOWN", starting_alpha = 1},
    {name = "FADEOUT", starting_alpha = 0.5}
  }
  self.tween_functions = {
    linear = tweenLinear,
    cubic_in = tweenEaseCubicIn,
    cubic_out = tweenEaseCubicOut,
    cubic_in_out = tweenEaseCubicInOut,
    bounce_out = tweenEaseBounceOut
  }
  self.phase = self.phase or 1
  self.tween = self.tween or "linear"
  self.duration = self.duration or 2
  self.down_time = self.down_time or 1
  self.timer = self.duration * self.phases[self.phase].starting_alpha
  setThemeRectColour(self.layer - 1, 255, 255, 255, _G.math.floor(255 * self.phases[self.phase].starting_alpha))
end
function Fade:update(dt, time)
  self.timer = self.timer + dt
  local phase = self.phases[self.phase].name
  if phase == "FADEIN" or phase == "FADEOUT" then
    local alpha = _G.math.floor(self.tween_functions[self.tween](self.timer, 0, 255, self.duration))
    if phase == "FADEOUT" then
      alpha = 255 - alpha
    end
    setThemeRectColour(self.layer - 1, 255, 255, 255, alpha)
    if self.timer > self.duration then
      setThemeRectColour(self.layer - 1, 255, 255, 255, phase == "FADEIN" and 255 or 0)
      self.phase = self.phase + 1
      self.timer = 0
    end
  elseif self.timer > self.down_time then
    self.timer = 0
    self.phase = self.phase + 1
  end
  if self.phase > #self.phases then
    self.phase = 1
  end
end
filename = "level_effects.lua"
