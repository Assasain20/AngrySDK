local g_powerups = {
  "superseed",
  "kingsling",
  "slingscope",
  "birdquake"
}
DailyReward = ui.Frame:inherit()
function DailyReward:new(game_hud, o)
  o = o or {}
  o.game_hud = game_hud
  return ui.Frame.new(self, o)
end
function DailyReward:init()
  ui.Frame.init(self)
  self.streak = self.streak or 0
  self.streak = _G.math.min(self.streak, 5)
  self.movein_offset = 1
  self.state = "MOVE_UP"
  local slots = ui.Image:new({name = "slots"})
  slots:setImage("REWARDS2_SLOTS")
  self:addChild(slots)
  for i = 1, 3 do
    local powerup_roller1 = PowerupRoller:new()
    powerup_roller1.name = "powerup_roller" .. i
    slots:addChild(powerup_roller1)
  end
  local winning_number = _G.math.random(100)
  local percentage = {
    superseed = 15,
    kingsling = 35,
    slingscope = 15,
    birdquake = 35
  }
  if winning_number <= percentage[g_powerups[1]] then
    self.winning_index = 1
  elseif winning_number <= percentage[g_powerups[1]] + percentage[g_powerups[2]] then
    self.winning_index = 2
  elseif winning_number <= percentage[g_powerups[1]] + percentage[g_powerups[2]] + percentage[g_powerups[3]] then
    self.winning_index = 3
  else
    self.winning_index = 4
  end
  self.winning_object = g_powerups[self.winning_index]
  for i = 1, 3 do
    slots:getChild("powerup_roller" .. i).winner = self.winning_object
  end
  if deviceModel == "android" then
    local win_images = {
      "REWARDS2_SUPERSEED",
      "REWARDS2_KINGSLING",
      "REWARDS2_SLINGSCOPE",
      "REWARDS2_BIRDQUAKE"
    }
    local android_win_image = ui.Image:new()
    android_win_image.name = "android_win_image"
    android_win_image:setImage(win_images[self.winning_index])
    android_win_image:setVisible(false)
    self:addChild(android_win_image)
  end
  self:setVisible(true)
end
function DailyReward:reset(streak)
  self.streak = streak
  self.stop_countdown = nil
  self.increase_count = nil
  self.hold_timer = nil
  self.android_win_countdown = nil
  self.moved_down_once = nil
  self.initial_powerup_amount = 0
  self:removeAllChildren()
  self:init()
  _G.res.playAudio(getAudioName("slot_machine"), 1, true)
end
function DailyReward:onExit()
  _G.res.stopAudio("slot_machine")
  ui.Frame.onExit(self)
end
function DailyReward:layout()
  ui.Frame.layout(self)
  local slots = self:getChild("slots")
  slots.x = screenWidth / 2
  local _, slots_h = _G.res.getSpriteBounds(slots.image)
  slots.y = screenHeight + slots_h * self.movein_offset
  if deviceModel == "android" then
    local powerup_button = self.game_hud:getChild("powerup_button")
    local android_win_image = self:getChild("android_win_image")
    local powerup_button_w, _ = _G.res.getSpriteBounds("BUTTON_EMPTY")
    local win_image_w, _ = _G.res.getSpriteBounds(android_win_image.image)
    android_win_image.x = powerup_button.x + powerup_button_w / 2 + win_image_w / 2
    android_win_image.y = powerup_button.y
  end
  local roller_interval = slots.w * 0.29
  for i = 1, 3 do
    local powerup_roller = slots:getChild("powerup_roller" .. i)
    powerup_roller.x = -roller_interval + roller_interval * (i - 1)
    powerup_roller.base_coord = {
      x = slots.x,
      y = slots.y - slots.h
    }
    powerup_roller.roller_height = slots.h * 0.87
    powerup_roller.slot_number = i
    powerup_roller.clip_offset = slots.y - screenHeight
  end
end
function DailyReward:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  return result, meta, self
end
function DailyReward:update(dt, time)
  local slots = self:getChild("slots")
  local roller1 = slots:getChild("powerup_roller1")
  local roller2 = slots:getChild("powerup_roller2")
  local roller3 = slots:getChild("powerup_roller3")
  if self.state == "MOVE_UP" then
    slots.y = screenHeight + slots.h * self.movein_offset
    self.movein_offset = self.movein_offset - dt * (screenHeight / 300)
    if self.movein_offset <= 0 then
      local powerup_button = self.game_hud:getChild("powerup_button")
      local powerup = powerup_button:getChild("powerup" .. self.winning_index)
      local powerup_counter = powerup:getChild("counter")
      self.initial_powerup_amount = _G.tonumber(powerup_counter.text)
      addPowerups(self.winning_object, self.streak)
      eventManager:notify({
        id = events.EID_DAILYREWARD_RECEIVED,
        powerup_type = self.winning_object
      })
      self.state = "WAIT_RUNNING"
      slots.y = screenHeight
      if deviceModel == "android" then
        local powerup_button = self.game_hud:getChild("powerup_button")
        powerup_button:setEnabled(false)
        powerup_button.status = "CLOSING"
      end
    end
  end
  if self.state == "WAIT_RUNNING" then
    if not self.stop_countdown then
      self.stop_countdown = 0.5
    end
    if 0 >= self.stop_countdown then
      self.state = "STOPPED"
    end
    self.stop_countdown = self.stop_countdown - dt
  end
  if self.state == "STOPPED" then
    if roller1.state == "RUNNING" then
      roller1.state = "STOPPING"
    end
    if roller1.stopped and roller2.state == "RUNNING" then
      roller2.state = "STOPPING"
    end
    if roller2.stopped and roller3.state == "RUNNING" then
      roller3.state = "STOPPING"
    end
    if roller3.state == "WIN" then
      roller3.state = "FINISHED"
      local powerup_button = self.game_hud:getChild("powerup_button")
      if deviceModel ~= "android" then
        self.state = "SHOW_INCREASE"
      else
        self.state = "SHOW_INCREASE_ANDROID"
      end
    end
    if self.game_hud:getChild("pausePage").visible then
      roller1.show_particles = false
      roller2.show_particles = false
      roller3.show_particles = false
      clearParticles()
    else
      roller1.show_particles = true
      roller2.show_particles = true
      roller3.show_particles = true
    end
  end
  if self.state == "SHOW_INCREASE" then
    local powerup_button = self.game_hud:getChild("powerup_button")
    local powerup = powerup_button:getChild("powerup" .. self.winning_index)
    local powerup_counter = powerup:getChild("counter")
    local powerup_button = self.game_hud:getChild("powerup_button")
    if powerup_button.state ~= "OPEN" and powerup_button.state ~= "OPENING" and not eagleBaitLaunched then
      powerup_button:toggle()
    end
    if powerup_button.state == "OPEN" or eagleBaitLaunched then
      if not self.increase_count then
        self.increase_count = 0
        self.fail_timer = 0.5
        self.counter_init_scale = {
          x = powerup_counter.scaleX,
          y = powerup_counter.scaleY
        }
      end
      powerup.scaleX = powerup.scaleX - dt * 2.1
      powerup.scaleY = powerup.scaleY - dt * 2.1
      local powerup_bg = powerup:getChild("bg")
      powerup_bg.scaleX = 1 / powerup.scaleX
      powerup_bg.scaleY = 1 / powerup.scaleY
      powerup_counter.scaleX = self.counter_init_scale.x / powerup.scaleX
      powerup_counter.scaleY = self.counter_init_scale.y / powerup.scaleY
      self.fail_timer = self.fail_timer - dt
      if 0.5 > powerup.scaleY or 0 >= self.fail_timer then
        powerup.scaleX = 1
        powerup.scaleY = 1
        powerup.y = 0
        powerup_bg.scaleX = 1
        powerup_bg.scaleY = 1
        powerup_counter.scaleX = self.counter_init_scale.x
        powerup_counter.scaleY = self.counter_init_scale.y
        self.increase_count = self.increase_count + 1
        powerup_counter.text = self.initial_powerup_amount + self.increase_count
        if not self.game_hud:getChild("pausePage").visible and not eagleBaitLaunched then
          _G.res.playAudio(getAudioName("powerup_awarded2"), 1, false)
          _G.particles.addParticles("dailyRewardCount", 15, powerup.x + powerup_button.x, powerup.y + powerup_button.y, 1, 1, 0, true, true)
        end
        self.fail_timer = 0.5
      end
      if self.increase_count >= self.streak then
        self.state = "HOLD_CLOSING"
      end
    end
  end
  if self.state == "HOLD_CLOSING" then
    if not self.hold_timer then
      self.hold_timer = 0.5
    end
    if 0 >= self.hold_timer then
      self.state = "MOVE_DOWN"
    end
    self.hold_timer = self.hold_timer - dt
  end
  if self.state == "SHOW_INCREASE_ANDROID" then
    local android_win_image = self:getChild("android_win_image")
    if not self.android_win_countdown then
      self.android_win_countdown = 2
      android_win_image:setVisible(true)
    end
    if self.android_win_countdown > 0.2 then
      android_win_image.scaleX = (2 - self.android_win_countdown) * 3
      android_win_image.scaleY = (2 - self.android_win_countdown) * 3
      if android_win_image.scaleX > 1 then
        android_win_image.scaleX = 1
        android_win_image.scaleY = 1
      end
    else
      android_win_image.scaleX = android_win_image.scaleX - dt * 5
      android_win_image.scaleY = android_win_image.scaleY - dt * 5
      if android_win_image.scaleX < 0.1 then
        android_win_image:setVisible(false)
      end
    end
    self.android_win_countdown = self.android_win_countdown - dt
    if 0 >= self.android_win_countdown then
      self.state = "MOVE_DOWN"
    end
  end
  if self.state == "MOVE_DOWN" then
    local slots = self:getChild("slots")
    slots.y = screenHeight + slots.h * self.movein_offset
    self.movein_offset = self.movein_offset + dt * (screenHeight / 300)
    if not self.moved_down_once then
      if not eagleBaitLaunched then
        self.game_hud:getChild("powerup_button"):setEnabled(true)
        if deviceModel ~= "android" then
          self.game_hud:getChild("powerup_button"):toggle()
        end
      end
      self.game_hud:updatePowerupCounters()
      self.moved_down_once = true
    end
    if self.movein_offset > 1 then
      self:setVisible(false)
    end
  end
  if self.state ~= "IDLE" then
    roller1.clip_offset = slots.y - screenHeight
    roller2.clip_offset = slots.y - screenHeight
    roller3.clip_offset = slots.y - screenHeight
  end
  ui.Frame.update(self, dt, time)
end
function DailyReward:draw(x, y)
  ui.Frame.draw(self, x, y)
end
PowerupRoller = ui.Frame:inherit()
function PowerupRoller:init()
  self.state = "RUNNING"
  self.roll_speed = self.roll_speed or screenHeight * 0.6
  self.roller_height = self.roller_height or screenHeight
  self.base_coord = self.base_coord or {x = 0, y = 0}
  self.clip_offset = self.clip_offset or 0
  self.slot_number = self.slot_number or 1
  self.show_particles = true
  local powerup_seed = ui.Image:new()
  powerup_seed.name = "superseed"
  powerup_seed:setImage("REWARDS2_SUPERSEED")
  self:addChild(powerup_seed)
  local powerup_sling = ui.Image:new()
  powerup_sling.name = "kingsling"
  powerup_sling:setImage("REWARDS2_KINGSLING")
  self:addChild(powerup_sling)
  local powerup_quake = ui.Image:new()
  powerup_quake.name = "birdquake"
  powerup_quake:setImage("REWARDS2_BIRDQUAKE")
  self:addChild(powerup_quake)
  local powerup_scope = ui.Image:new()
  powerup_scope.name = "slingscope"
  powerup_scope:setImage("REWARDS2_SLINGSCOPE")
  self:addChild(powerup_scope)
end
function PowerupRoller:onEntry()
  self.slotSpacing = screenHeight * 0.01
  local powerup = self:getChild(g_powerups[1])
  local _, powerup_height = _G.res.getSpriteBounds(powerup.image)
  self.total_height = (powerup_height + self.slotSpacing) * #g_powerups
  local y_start = -self.total_height / 2
  for i, powerup_name in _G.ipairs(g_powerups) do
    local powerup = self:getChild(powerup_name)
    local _, powerup_height = _G.res.getSpriteBounds(powerup.image)
    powerup.x = 0
    powerup.y = y_start + powerup_height * (i - 1) + self.slotSpacing * (i - 1)
    y_pos = powerup.y + powerup_height / 2
  end
end
function PowerupRoller:update(dt, time)
  for i, powerup_name in _G.ipairs(g_powerups) do
    local powerup = self:getChild(powerup_name)
    powerup.y = powerup.y + self.roll_speed * dt * 2
    local bottom_edge = self.total_height / 2
    if bottom_edge < powerup.y then
      powerup.y = -self.total_height / 2 + (powerup.y - bottom_edge)
      if self.state == "STOPPING" and powerup_name == self.winner then
        self.state = "STOP_NOW"
      end
    end
  end
  if self.state == "STOP_NOW" then
    local winner_powerup = self:getChild(self.winner)
    if winner_powerup.y > -(self.roller_height / 2) + winner_powerup.h * 0.1 then
      self.roll_speed = -screenHeight * 0.1
      self.stopped = true
      self.state = "ROLL_BACK"
      if self.slot_number == 3 then
        _G.res.stopAudio("slot_machine")
      end
      _G.res.playAudio(getAudioName("slot_" .. self.slot_number), 1, false)
      if self.show_particles then
        _G.particles.addParticles("dailyRewardWin", 20, self.base_coord.x + self.x, screenHeight - self.roller_height / 2, 1, 1, 0, true, true)
      end
    end
  end
  if self.state == "ROLL_BACK" then
    local winner_powerup = self:getChild(self.winner)
    if winner_powerup.y < -(self.roller_height / 2) then
      self.roll_speed = 0
      winner_powerup.y = -(self.roller_height / 2)
      self.state = "WIN"
    end
  end
  ui.Frame.update(self, dt, time)
end
function PowerupRoller:draw(x, y)
  _G.res.setClipRect(0, screenHeight - self.roller_height + self.clip_offset, screenWidth, screenHeight)
  ui.Frame.draw(self, x, y)
  _G.res.setClipRect(0, 0, screenWidth, screenHeight)
end
filename = "daily_reward.lua"
