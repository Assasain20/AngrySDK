Frame = gamelua.ui.Frame
print = gamelua.print
MightyEagleButton = gamelua.ui.ImageButton:inherit()
EAGLE_BUTTON_SCALE_TIME = 4
function MightyEagleButton:init()
  Frame.init(self)
  local _, episode, _, _ = gamelua.getLevelById(gamelua.levelName)
  local buttonEnabled = episode and gamelua.g_episodes[episode].mightyPower and gamelua.g_episodes[episode].mightyPower.buttonEnabled or "INGAME_BUTTON_EAGLE"
  local buttonDisabled = episode and gamelua.g_episodes[episode].mightyPower and gamelua.g_episodes[episode].mightyPower.buttonDisabled or "BUTTON_USE_EAGLE_DISABLED"
  self:setImage(buttonEnabled, buttonDisabled)
  local timerText = gamelua.ui.Text:new({
    text = "",
    name = "timerText",
    font = gamelua.getFontBasic
  })
  timerText.vanchor = "TOP"
  self:addChild(timerText)
  self.timerText = timerText
  self.timerText.hcenter = "HCENTER"
  self.timerText.vcenter = "VCENTER"
  self.result = "ME_BUTTON_CLICKED"
  self.from = self.from or "INGAME"
  self.disabledReturnValue = "ME_BUTTON_CLICKED_DISABLED"
  self.returnValue = "ME_BUTTON_CLICKED"
  self.eagleButtonState = nil
  self.want_visible = true
end
function MightyEagleButton:onEntry()
  if not gamelua.startedFromEditor then
    gamelua.eventManager:addEventListener(gamelua.events.EID_MIGHTY_EAGLE_AVAILABLE, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_LEVEL_GOALS_CLEARED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_LEVEL_COMPLETE_INIT, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_FREE_EAGLE_ENABLED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_FREE_EAGLE_DISABLED, self)
    local first_time = true
    if gamelua.highscores[gamelua.levelName] and gamelua.highscores[gamelua.levelName].completed then
      first_time = false
    end
    self:setEnabled(not gamelua.isEagleUnavailableForShot() or not first_time)
    self:setVisible(self.want_visible)
  else
    self:setEnabled(true)
    self:setVisible(self.want_visible)
  end
  gamelua.ui.ImageButton.onEntry(self)
  if gamelua.levelCompleted then
    self:setVisible(false)
  end
end
function MightyEagleButton:layout()
  local sx = 1
  local sy = 1
  if gamelua.isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
  end
  local w, h = _G.res.getSpriteBounds(self.image)
  self.timerText.x = 0
  self.timerText.y = h * 0.42
  self.timerText.scaleX = sx
  self.timerText.scaleY = sy
end
function MightyEagleButton:eventTriggered(event)
  if event.id == gamelua.events.EID_MIGHTY_EAGLE_AVAILABLE then
    self:setEnabled(true)
    if not gamelua.isLevelEnding() then
      if gamelua.isEagleEnabled() then
        _G.res.playAudio("goldenegg", 1, false)
      end
      self:setEnabled(true)
    end
  elseif event.id == gamelua.events.EID_LEVEL_GOALS_CLEARED then
    if self.enabled then
      self.inGameEagleButtonScalingTimer = 0
      self.eagleButtonState = "BOUNCE"
    end
    if not gamelua.subsystemsapi.isEagleEnabled() then
      self.eagleButtonState = "DISAPPEAR"
    end
  elseif event.id == gamelua.events.EID_LEVEL_COMPLETE_INIT then
    self.eagleButtonState = "DISAPPEAR"
    self.inGameEagleButtonScalingTimer = 1
    if not gamelua.subsystemsapi.isEagleEnabled() then
      self:setVisible(false)
    end
  elseif event.id == gamelua.events.EID_FREE_EAGLE_ENABLED then
    self:setVisible(self.want_visible)
  elseif event.id == gamelua.events.EID_FREE_EAGLE_DISABLED then
    self:setVisible(self.want_visible)
  end
end
function MightyEagleButton:onPointerEvent(eventType, x, y)
  local result, meta = gamelua.ui.ImageButton.onPointerEvent(self, eventType, x, y)
  if result == "ME_BUTTON_CLICKED_DISABLED" then
    self.showEagleTimeLeftTimer = 3
    return -1
  end
  if self.eagleButtonState ~= "DISAPPEAR" then
    return result, meta
  end
  return nil
end
function MightyEagleButton:draw(x, y)
  if self.visible then
    gamelua.ui.ImageButton.draw(self, x, y)
    if self.timerText.visible == true then
    end
  end
end
function MightyEagleButton:setVisible(visible)
  local canBeVisible = gamelua.showEagleUIElements() == true and not gamelua.isEagleDisabled(gamelua.levelName) and not gamelua.eagleBaitLaunched and self.eagleButtonState ~= "DISAPPEAR"
  self.want_visible = visible
  if canBeVisible == true and visible == true then
    self.visible = true
  else
    self.visible = false
  end
end
function MightyEagleButton:update(dt, time)
  if not self.visible then
    return
  end
  if self.showEagleTimeLeftTimer ~= nil and gamelua.eagleLockedTime ~= nil and gamelua.settingsWrapper:getEagleUsedTime() ~= nil then
    self.timerText.visible = true
    local timeLeft = gamelua.eagleLockedTime - gamelua.timeDiff(gamelua.currentTime(), gamelua.settingsWrapper:getEagleUsedTime())
    timeLeft = gamelua.formatTime(timeLeft)
    if self.timerText.text ~= timeLeft then
      self.timerText.text = timeLeft
      self.timerText:clip()
    end
    self.showEagleTimeLeftTimer = self.showEagleTimeLeftTimer - dt
    if self.showEagleTimeLeftTimer < 0 then
      self.showEagleTimeLeftTimer = nil
    end
  else
    self.timerText.visible = false
  end
  if self.eagleButtonState ~= nil and self.inGameEagleButtonScalingTimer ~= nil then
    local scaleMultiplier = 1
    if gamelua.isRetinaGraphicsEnabled() then
      scaleMultiplier = 1
    end
    if self.eagleButtonState == "BOUNCE" then
      self.inGameEagleButtonScalingTimer = self.inGameEagleButtonScalingTimer + dt
      local scale = 0.75 + _G.math.cos(_G.math.pi * self.inGameEagleButtonScalingTimer * 2) * 0.25
      self.scaleX = scale * scaleMultiplier
      self.scaleY = scale * scaleMultiplier
    else
      self.inGameEagleButtonScalingTimer = self.inGameEagleButtonScalingTimer - dt * 3
      self.scaleX = _G.math.max(self.inGameEagleButtonScalingTimer * scaleMultiplier, 0)
      self.scaleY = _G.math.max(self.inGameEagleButtonScalingTimer * scaleMultiplier, 0)
      if 0 > self.inGameEagleButtonScalingTimer then
        self.inGameEagleButtonScalingTimer = nil
        self.eagleButtonState = nil
        self:setVisible(false)
      end
    end
  end
end
function MightyEagleButton:onExit()
  if not gamelua.startedFromEditor then
    gamelua.eventManager:removeEventListener(gamelua.events.EID_MIGHTY_EAGLE_AVAILABLE, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_LEVEL_GOALS_CLEARED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_LEVEL_COMPLETE_INIT, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_FREE_EAGLE_ENABLED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_FREE_EAGLE_DISABLED, self)
  end
  gamelua.ui.ImageButton.onExit(self)
end
filename = "MightyEagleButton.lua"
