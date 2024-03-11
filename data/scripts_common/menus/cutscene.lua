CutScene = ui.Frame:inherit()
function CutScene:new(cutscene, end_event, o)
  local o = o or {}
  o.cutscene = cutscene
  o.data = cutscenes[cutscene]
  o.end_event = end_event
  o.name = "CutScene"
  return ui.Frame.new(self, o)
end
function CutScene:init()
  ui.Frame.init(self)
  local skip_button = ui.ImageButton:new()
  skip_button.name = "skip_button"
  if deviceModel == "android" and screenHeight < 320 then
    skip_button:setImage("BUTTON_SKIP_CUTSCENE_QVGA")
  else
    skip_button:setImage("BUTTON_SKIP_CUTSCENE")
  end
  skip_button:setVisible(false)
  skip_button.activateOnRelease = true
  self:addChild(skip_button)
end
function CutScene:prepareForDynamicAssets()
  dynamic.setRequirements(self, {
    settingsWrapper:getCurrentMainMenuTheme(),
    settingsWrapper:getCurrentMainMenuTheme() .. "_menu"
  })
end
function CutScene:onEntry()
  self.scroll_x = 0
  self.scroll_y = 0
  self.scale = 1
  self.offset_x = 0
  self.offset_y = 0
  self.x_multiplier = 1
  self.y_multiplier = 1
  self.dataPosition = 1
  self.timeElapsed = 0
  self.sprites = {}
  self.fit = "none"
  self.result = nil
  self.no_scroll = false
  self.borders = true
  self.draw_game = false
  ui.Frame.onEntry(self)
  _G.res.stopAllAudio()
  if keyHold.LBUTTON then
    self.ldown = true
  end
  if settingsWrapper:canSkipCutscene(self.cutscene) then
    self:getChild("skip_button"):setVisible(true)
  end
  if g_isAccelerometerControl then
    g_rokuCursorVisible = false
  end
end
function CutScene:update(dt, time)
  self.timeElapsed = self.timeElapsed + dt
  while self.data[self.dataPosition] and self.data[self.dataPosition].time <= self.timeElapsed do
    self:processCommand(self.data[self.dataPosition])
    self.dataPosition = self.dataPosition + 1
  end
  if self.scroll and not self.no_scroll then
    local scroll = self.scroll
    local scroll_progress
    if scroll.type == "linear" then
      scroll_progress = (self.timeElapsed - scroll.begin_time) / (scroll.end_time - scroll.begin_time)
    elseif scroll.type == "cubic_in_out" then
      scroll_progress = tweenEaseCubicInOut(self.timeElapsed - scroll.begin_time, 0, 1, scroll.end_time - scroll.begin_time)
    end
    if scroll_progress >= 1 then
      self.scroll = nil
      self.scroll_x = scroll.end_x
      self.scroll_y = scroll.end_y
    else
      self.scroll_x = scroll.begin_x + scroll_progress * (scroll.end_x - scroll.begin_x)
      self.scroll_y = scroll.begin_y + scroll_progress * (scroll.end_y - scroll.begin_y)
    end
  end
  ui.Frame.update(self, dt, time)
end
function CutScene:processCommand(command)
  if command.action == "playsound" then
    _G.res.playAudio(command.sound, command.volume or 1, command.loop or false, command.track)
  elseif command.action == "createsprite" then
    local sprite = {
      image = command.image,
      layer = command.layer or 0,
      x = command.x * self.x_multiplier,
      y = command.y * self.y_multiplier,
      z = command.z or 0,
      flip_x = command.flip_x or false,
      flip_y = command.flip_y or false,
      scale_x = command.scale_x or 1,
      scale_y = command.scale_y or 1,
      angle = command.angle or 0
    }
    self.sprites[command.name] = sprite
  elseif command.action == "deletesprite" then
    self.sprites[command.name] = nil
  elseif command.action == "set_bg_colour" then
    setBGColor(command.r, command.g, command.b)
    self.backgroundColour = {
      r = command.r,
      g = command.g,
      b = command.b,
      a = 1
    }
  elseif command.action == "fitheight" then
    self.fit = "height"
    if command.image then
      local image = command.image or self.sprites[command.sprite].image
      local sw, sh = self:getCompoSpriteBounds(image)
      self.ref_width = sw
      self.ref_height = sh
    else
      self.ref_width = command.width
      self.ref_height = command.height
    end
    self:layout()
    print("fitting cutscene to h=" .. self.ref_height .. " scale=" .. self.scale .. "\n")
  elseif command.action == "fitwidth" then
    self.fit = "width"
    if command.image then
      local image = command.image or self.sprites[command.sprite].image
      local sw, sh = self:getCompoSpriteBounds(image)
      self.ref_width = sw
      self.ref_height = sh
    else
      self.ref_width = command.width
      self.ref_height = command.height
    end
    self:layout()
    print("fitting cutscene to w=" .. self.ref_width .. " scale=" .. self.scale .. "\n")
  elseif command.action == "fitcenter" then
    self.fit = "center"
    self.ref_width = screenWidth
    self.ref_height = screenHeight
  elseif command.action == "setreferencesize" then
    local sw, sh = _G.res.getSpriteBounds(command.image)
    self.x_multiplier = sw / command.width
    self.y_multiplier = sh / command.height
  elseif command.action == "createnonfullscreencutscene" then
    local sprite = {
      image = command.image,
      layer = command.layer or 0,
      x = command.x * screenWidth,
      y = command.y * screenHeight,
      z = command.z or 0,
      flip_x = command.flip_x or false,
      flip_y = command.flip_y or false,
      scale_x = command.scale_x or 1,
      scale_y = command.scale_y or 1,
      angle = command.angle or 0
    }
    self.sprites[command.name] = sprite
    if command.button then
      local bw, bh = _G.res.getSpriteBounds(command.image)
      local sprite = {
        image = command.button,
        layer = command.layer or 0,
        x = command.x * screenWidth + bw * 0.3,
        y = command.y * screenHeight + bh * 0.5,
        z = command.z + 0.01 or 0.01,
        flip_x = command.flip_x or false,
        flip_y = command.flip_y or false,
        scale_x = command.scale_x or 1,
        scale_y = command.scale_y or 1,
        angle = command.angle or 0
      }
      self.sprites[command.button] = sprite
    end
  elseif command.action == "set_scroll_position" then
    local target = self.sprites[command.scroll_target.sprite]
    local sw, sh = self:getCompoSpriteBounds(target.image)
    self.scroll_x = target.x + command.scroll_target.x * sw - command.scroll_cursor.x * (screenWidth / self.scale - self.offset_x * 2)
    self.scroll_y = target.y + command.scroll_target.y * sh - command.scroll_cursor.y * (screenHeight / self.scale - self.offset_y * 2)
    print("setting scroll position to [" .. self.scroll_x .. ";" .. self.scroll_y .. "]\n")
  elseif command.action == "scroll" then
    local scroll = {}
    local target = self.sprites[command.scroll_target.sprite]
    local sw, sh = self:getCompoSpriteBounds(target.image)
    local px, py = _G.res.getSpritePivot(target.image)
    local scw = g_cutsceneFilm and _G.math.max(screenWidth, g_cutsceneDimensions.width) or screenWidth
    local sch = g_cutsceneFilm and _G.math.max(screenHeight, g_cutsceneDimensions.height) or screenHeight
    local cursor_x = self.scroll_x + command.scroll_cursor.x * (scw / self.scale - self.offset_x * 2)
    local cursor_y = self.scroll_y + command.scroll_cursor.y * (sch / self.scale - self.offset_y * 2)
    local target_x = target.x + command.scroll_target.x * sw
    local target_y = target.y + command.scroll_target.y * sh
    print("CURSOR: " .. cursor_x .. "; TARGET: " .. target_x .. "\n")
    scroll.begin_x = self.scroll_x
    scroll.end_x = self.scroll_x + (target_x - cursor_x)
    scroll.begin_y = self.scroll_y
    scroll.end_y = self.scroll_y + (target_y - cursor_y)
    scroll.begin_time = command.time
    scroll.end_time = command.time + command.duration
    scroll.type = command.type or "linear"
    self.scroll = scroll
  elseif command.action == "end" then
    settingsWrapper:setCutsceneWatched(self.cutscene)
    saveLuaFileWrapper("settings.lua", "settings", true)
    if self.end_event then
      eventManager:notify(self.end_event)
    end
  elseif command.action == "toggle_borders" then
    self.borders = command.value
  elseif command.action == "toggle_draw_game" then
    self.draw_game = command.value
  end
end
function CutScene:getCompoSpriteBounds(sprite)
  return _G.res.getSpriteBounds(sprite)
end
function CutScene:layout()
  self.offset_x = 0
  self.offset_y = 0
  self.scale = 1
  self.no_scroll = false
  local asset_scaling = g_cutscene_asset_scale
  if self.fit == "height" then
    if self.ref_height * asset_scaling > screenHeight then
      self.scale = screenHeight / (self.ref_height * asset_scaling)
      self.offset_y = 0
    else
      self.scale = 1
      self.offset_y = (screenHeight - self.ref_height * asset_scaling) * 0.5
    end
    if self.ref_width * asset_scaling < screenWidth and not g_cutsceneFilm then
      self.offset_x = (screenWidth - self.ref_width * asset_scaling) * 0.5
      self.no_scroll = true
    end
  elseif self.fit == "width" then
    if self.ref_width * asset_scaling > screenWidth then
      self.scale = screenWidth / (self.ref_width * asset_scaling)
      self.offset_x = 0
    else
      self.scale = 1
      self.offset_x = (screenWidth - self.ref_width * asset_scaling) * 0.5
    end
  elseif self.fit == "center" then
    self.offset_x = (screenWidth - self.ref_width) / 2
    self.offset_y = (screenHeight - self.ref_height) / 2
  end
  if g_cutsceneFilm then
    if screenWidth > g_cutsceneDimensions.width then
      self.offset_x = (screenWidth - g_cutsceneDimensions.width) * 0.5
    end
    if screenHeight > g_cutsceneDimensions.height then
      self.offset_y = (screenHeight - g_cutsceneDimensions.height) * 0.5
    elseif screenHeight < g_cutsceneDimensions.height then
      self.offset_y = (screenHeight - g_cutsceneDimensions.height) * 0.5
    end
    print("<cutscene player> film strip mode, offset x=" .. _G.tostring(self.offset_x) .. " y=" .. _G.tostring(self.offset_y) .. "\n")
    self.scale = 1
  end
  local skip_button = self:getChild("skip_button")
  local sw, sh = _G.res.getSpriteBounds(skip_button.image)
  skip_button.x = screenWidth - sw * 0.55 - g_layoutMargin.x
  skip_button.y = screenHeight - sh * 0.55 - g_layoutMargin.y
  self.scale = self.scale * asset_scaling
  ui.Frame.layout(self)
end
function CutScene:onExit()
  _G.res.stopAllAudio()
  ui.Frame.onExit(self)
  if g_isAccelerometerControl then
    g_rokuCursorVisible = true
  end
end
function CutScene:draw(x, y)
  if self.draw_game then
    drawGame()
  end
  if g_cutsceneFilm then
    local bgw, bgh = _G.res.getSpriteBounds("CUTSCENE_BG")
    local bgdim = _G.math.min(bgw, bgh)
    local size = _G.math.max(screenWidth, screenHeight)
    local scale = _G.math.max(size / bgdim, 1)
    setRenderState(0, 0, scale, scale)
    _G.res.drawSprite("CUTSCENE_BG", screenWidth * 0.5 / scale, screenHeight * 0.5 / scale)
  end
  local drawlist = {}
  for _, v in _G.pairs(self.sprites) do
    _G.table.insert(drawlist, v)
  end
  _G.table.sort(drawlist, function(a, b)
    return a.z < b.z
  end)
  local asset_scaling = g_cutscene_asset_scale
  local scale_x = self.scale
  local scale_y = self.scale
  local offset_x = -_G.math.floor(self.scroll_x)
  local offset_y = -_G.math.floor(self.scroll_y)
  offset_y = offset_y + self.offset_y / asset_scaling
  offset_x = offset_x + self.offset_x
  setRenderState(0, 0, 1, 1)
  if not g_cutsceneFilm and 0 < self.offset_y and self.borders then
    drawRect(0, 0, 0, 1, 0, 0, screenWidth, _G.math.ceil(self.offset_y), false)
    drawRect(0, 0, 0, 1, 0, _G.math.floor(screenHeight - self.offset_y), screenWidth, screenHeight, false)
  end
  if not g_cutsceneFilm and 0 < self.offset_x and self.borders then
    drawRect(0, 0, 0, 1, 0, 0, _G.math.ceil(self.offset_x), screenHeight, false)
    drawRect(0, 0, 0, 1, _G.math.floor(screenWidth - self.offset_x), 0, screenWidth, screenHeight, false)
    _G.res.setClipRect(self.offset_x, 0, screenWidth - 2 * self.offset_x, screenHeight)
  end
  if g_cutsceneFilm and self.backgroundColour then
    drawRect(self.backgroundColour.r / 255, self.backgroundColour.g / 255, self.backgroundColour.b / 255, 1, self.offset_x, self.offset_y, screenWidth - self.offset_x, screenHeight - self.offset_y, false)
  end
  if 0 < self.offset_y or 0 < self.offset_x then
    _G.res.setClipRect(self.offset_x, self.offset_y, screenWidth - 2 * self.offset_x, screenHeight - 2 * self.offset_y)
  end
  for i = 1, #drawlist do
    local sprite = drawlist[i]
    local flip_x = 1
    local flip_y = 1
    if sprite.flip_x then
      flip_x = -1
    end
    if sprite.flip_y then
      flip_y = -1
    end
    local px, py = _G.res.getSpritePivot(sprite.image)
    local xs = scale_x * flip_x
    local ys = scale_y * flip_y
    setRenderState(offset_x + sprite.x * scale_x / xs, offset_y + sprite.y * scale_y / ys, xs, ys, sprite.angle, px, py)
    _G.res.drawSprite(sprite.image, 0, 0)
  end
  setRenderState(0, 0, 1, 1, 0, 0, 0)
  _G.res.setClipRect(0, 0, screenWidth, screenHeight)
  if g_cutsceneFilm then
    _G.res.drawSprite("CUTSCENE_FILMSTRIP_TOP", screenWidth * 0.5, self.offset_y)
    _G.res.drawSprite("CUTSCENE_FILMSTRIP_BOTTOM", screenWidth * 0.5, screenHeight - self.offset_y)
    _G.res.drawSprite("CUTSCENE_FILMSTRIP_LEFT", self.offset_x, self.offset_y)
    _G.res.drawSprite("CUTSCENE_FILMSTRIP_RIGHT", screenWidth - self.offset_x, self.offset_y)
  end
  ui.Frame.draw(self, x, y)
end
function CutScene:skip()
  _G.res.stopAllAudio()
  settingsWrapper:setCutsceneWatched(self.cutscene)
  eventManager:notify(self.end_event)
end
if not g_isAccelerometerControl then
  function CutScene:onPointerEvent(eventType, x, y)
    local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
    if eventType == "LRELEASE" and (settingsWrapper:canSkipCutscene(self.cutscene) or cheatsEnabled) then
      if self.ldown then
        self.ldown = nil
      else
        self:skip()
      end
    end
    return result, meta, item
  end
else
  function CutScene:onPointerEvent(eventType, x, y)
  end
  function CutScene:onKeyEvent(eventType, key)
    if eventType == "RELEASE" and key == "FORWARD" and (settingsWrapper:canSkipCutscene(self.cutscene) or cheatsEnabled) then
      self:skip()
    end
  end
end
filename = "cutscene.lua"
