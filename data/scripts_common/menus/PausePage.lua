Frame = gamelua.ui.Frame
PausePage = gamelua.ui.Frame:inherit()
g_pausePageW = 0.2
g_noAudioOnPausePage = true
if gamelua.deviceModel == "windows" or gamelua.deviceModel == "osx" then
  g_noAudioOnPausePage = false
end
function PausePage.getTotalW()
  local w, h = _G.res.getSpriteBounds("BUTTON_RESUME")
  return _G.math.ceil(_G.math.max(gamelua.screenWidth, gamelua.screenHeight) * g_pausePageW + w / 1.5), w / 1.5
end
function PausePage:init()
  self.name = "pausePage"
  self.eventTimer = gamelua.subsystems.Timer.new(gamelua.g_time or 0)
  self.show = false
  self.extendState = self.extendState or 0
  self.extendSpeed = 5
  self.visible = false
  local dummyFrame = gamelua.ui.Frame:new({name = "dummyFrame"})
  self:addChild(dummyFrame)
  local buttonBackToMenu = gamelua.ui.ImageButton:new({
    name = "buttonBackToMenu",
    returnValue = "BACK_TO_LEVEL_SELECTION",
    activateOnRelease = true
  })
  buttonBackToMenu:setImage("BUTTON_MENU")
  dummyFrame:addChild(buttonBackToMenu)
  local buttonResume = gamelua.ui.ImageButton:new({
    name = "buttonResume",
    returnValue = "BACK_TO_GAME",
    activateOnRelease = true
  })
  buttonResume:setImage("BUTTON_RESUME")
  dummyFrame:addChild(buttonResume)
  local buttonTutorials = gamelua.ui.ImageButton:new({
    name = "buttonTutorials",
    returnValue = "SHOW_TUTORIALS",
    activateOnRelease = true
  })
  buttonTutorials:setImage("MENU_TUTORIALS")
  dummyFrame:addChild(buttonTutorials)
  local buttonSounds = gamelua.ui.ToggleButton:new({
    name = "buttonSounds",
    returnValue = "TOGGLE_SOUNDS",
    activateOnRelease = true
  })
  buttonSounds:setImage({
    "BUTTON_SFX",
    "BUTTON_SFX_OFF"
  })
  dummyFrame:addChild(buttonSounds)
  local buttonRestart = gamelua.ui.ImageButton:new({
    name = "buttonRestart",
    returnValue = "RESTART_LEVEL",
    activateOnRelease = true
  })
  buttonRestart:setImage("BUTTON_RESTART")
  dummyFrame:addChild(buttonRestart)
  local levelNumberText = gamelua.ui.Text:new({
    name = "levelNumberText"
  })
  levelNumberText:setFont(gamelua.getFontMenu)
  levelNumberText.textBoxSize = gamelua.screenWidth
  levelNumberText.vanchor = "VCENTER"
  levelNumberText.hanchor = "HCENTER"
  dummyFrame:addChild(levelNumberText)
  if gamelua.showPowerupPurchaseElements() then
    local shop_button = gamelua.ui.ImageButton:new()
    shop_button.name = "shop_button"
    shop_button:setImage("BUTTON_SHOP", "BUTTON_SHOP_DISABLED")
    shop_button.returnValue = "GOTO_SHOP_FROM_PAUSE"
    shop_button.disabledReturnValue = "GOTO_SHOP_DISABLED"
    shop_button.activateOnRelease = true
    dummyFrame:addChild(shop_button)
  end
  local rovio_news = gamelua.ui.RovioNews:new()
  rovio_news.name = "rovio_news"
  self:addChild(rovio_news)
  self.rovio_news = rovio_news
  self.dummyFrame = dummyFrame
end
function PausePage:onEntry()
  local levelNumberText = self:getChild("levelNumberText")
  levelNumberText.text = gamelua.getLevelDisplayNumber(gamelua.levelName)
  Frame.onEntry(self)
  local shop_button = self:getChild("dummyFrame"):getChild("shop_button")
  if gamelua.showPowerupPurchaseElements() then
    if gamelua.settingsWrapper:isChildlockOn() then
      shop_button:setEnabled(false)
    else
      shop_button:setEnabled(true)
    end
  end
  if gamelua.deviceModel == "windows" or gamelua.deviceModel == "osx" then
    gamelua.eventManager:addEventListener(gamelua.events.EID_AUDIO_STATE_CHANGED, self)
  end
end
function PausePage:layout()
  local sx = 1
  local sy = 1
  if gamelua.isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
  end
  local display_shop = gamelua.showPowerupPurchaseElements() and self:getChild("shop_button") ~= nil
  self.dummyFrame.x = 0
  self.dummyFrame.y = 0
  local buttonResume = self:getChild("buttonResume")
  local sw, sh = _G.res.getSpriteBounds(buttonResume.image)
  buttonResume.x, buttonResume.y = -sw * 0.52 * sx * 0, gamelua.screenHeight * 0.5
  local buttonRestart = self:getChild("buttonRestart")
  local sw, sh = _G.res.getSpriteBounds(buttonRestart.image)
  buttonRestart.x = -PausePage.getTotalW() * 0.5
  if not display_shop then
    buttonRestart.y = gamelua.screenHeight * 0.5 - sh * 0.65 * sy
  else
    buttonRestart.y = gamelua.screenHeight * 0.5 - sh * 1 * sy
  end
  local buttonBackToMenu = self:getChild("buttonBackToMenu")
  local sw, sh = _G.res.getSpriteBounds(buttonBackToMenu.image)
  buttonBackToMenu.x = -PausePage.getTotalW() * 0.5
  if not display_shop then
    buttonBackToMenu.y = gamelua.screenHeight * 0.5 + sh * 0.65 * sy
  else
    buttonBackToMenu.y = gamelua.screenHeight * 0.5
  end
  if display_shop then
    local shop_button = self:getChild("shop_button")
    shop_button.x = buttonRestart.x
    shop_button.y = buttonBackToMenu.y + (buttonBackToMenu.y - buttonRestart.y)
  end
  local buttonTutorials = self:getChild("buttonTutorials")
  local sw, sh = _G.res.getSpriteBounds(buttonTutorials.image)
  buttonTutorials.x, buttonTutorials.y = -PausePage.getTotalW() * 0.5 + sw * 0.5 * sx, gamelua.screenHeight - sh * sy * 0.75
  local buttonSounds = self:getChild("buttonSounds")
  local sw, sh = _G.res.getSpriteBounds(buttonSounds.image)
  buttonSounds.x, buttonSounds.y = -PausePage.getTotalW() * 0.5 - sw * 0.5 * sx, buttonTutorials.y
  local levelNumberText = self:getChild("levelNumberText")
  gamelua.setFont(levelNumberText.font)
  local _, py = _G.res.getSpritePivot(buttonRestart.image)
  levelNumberText.x = -PausePage.getTotalW() * 0.5
  levelNumberText.y = (buttonRestart.y - py) * 0.5
  for _, v in _G.ipairs(self.dummyFrame.children) do
    v.scaleX = sx
    v.scaleY = sy
  end
  Frame.layout(self)
end
function PausePage:update(dt, time)
  self.eventTimer:update(dt, time)
  if self.extendState == 0 and not self.show then
    return
  end
  if self.extendState < 1 and self.show then
    self.extendState = _G.math.min(self.extendState + self.extendSpeed * dt, 1)
    if self.extendState == 1 then
      gamelua.eventManager:notify({
        id = gamelua.events.EID_PAUSE_PAGE_EXTENDED
      })
    end
  elseif self.extendState > 0 and not self.show then
    self.extendState = _G.math.max(self.extendState - self.extendSpeed * dt, 0)
    if self.extendState <= 0 then
      gamelua.eventManager:notify({
        id = gamelua.events.EID_PAUSE_PAGE_HIDE_COMPLETED
      })
      self.visible = false
    end
  end
  if self.visible and self.show and self.extendState == 1 and _G.res.isAudioPlaying(gamelua.currentMusic) == false and gamelua.currentMusic ~= nil then
    _G.res.playAudio(gamelua.currentMusic, 1, true, 7)
  end
  if self.visible and self.show and self.extendState == 1 and not gamelua.g_tutorialActive then
    if not self.rovio_news.visible and not self.news_disabled then
      self.rovio_news:setVisible(true)
    end
  elseif self.rovio_news.visible then
    self.rovio_news:setVisible(false)
  end
  self.dummyFrame.x = self.extendState * PausePage.getTotalW()
  Frame.update(self, dt, time)
end
function PausePage:draw(x, y, scaleX, scaleY)
  if self.visible == true and gamelua.g_tutorialActive == nil then
    gamelua.drawRect(0, 0, 0, self.extendState * 0.75, 0, 0, gamelua.screenWidth, gamelua.screenHeight, false)
    gamelua.drawRect(0, 0, 0, self.extendState * 1, 0, 0, PausePage.getTotalW() * self.extendState, gamelua.screenHeight, false)
    Frame.draw(self, x, y, scaleX, scaleY)
  end
end
function PausePage:showPage()
  if g_noAudioOnPausePage and gamelua.settingsWrapper:isAudioEnabled() then
    gamelua.audioRampVolume = _G.res.getTrackVolume(7)
    gamelua.audioRampLength = -0.5
  end
  self.show = true
  self.visible = true
  if gamelua.deviceModel == "freebox" then
    local buttonRestart = self:getChild("buttonRestart")
    gamelua.setMousePosition(-buttonRestart.x, buttonRestart.y)
    gamelua.captureMouse(true)
    self.eventTimer:once(nil, function()
      gamelua.captureMouse(false)
    end, 1)
  end
  gamelua.showPauseMenu(dt)
end
function PausePage:hidePage()
  if g_noAudioOnPausePage and gamelua.settingsWrapper:isAudioEnabled() then
    gamelua.audioRampVolume = _G.res.getTrackVolume(7)
    gamelua.audioRampLength = 0.5
  end
  self.show = false
  gamelua.loginfo("Closing pause page from hide page()")
  gamelua.eventManager:notify({
    id = gamelua.events.EID_PAUSE_PAGE_CLOSED
  })
end
function PausePage:onExit()
  if g_noAudioOnPausePage and gamelua.settingsWrapper:isAudioEnabled() then
    gamelua.audioRampVolume = _G.res.getTrackVolume(7)
    gamelua.audioRampLength = 0.5
  end
  gamelua.ui.Frame.onExit(self)
  gamelua.loginfo("Closing pause page from onExit()")
  gamelua.eventManager:notify({
    id = gamelua.events.EID_PAUSE_PAGE_CLOSED
  })
  if gamelua.deviceModel == "windows" or gamelua.deviceModel == "osx" then
    gamelua.eventManager:removeEventListener(gamelua.events.EID_AUDIO_STATE_CHANGED, self)
  end
end
function PausePage:eventTriggered(event)
  if event.id == gamelua.events.EID_AUDIO_STATE_CHANGED and event.from == "KEYBOARD_COMMAND" then
    local audio_button = self:getChild("buttonSounds")
    if gamelua.settingsWrapper:isAudioEnabled() then
      audio_button:setState(2)
    else
      audio_button:setState(1)
    end
  end
end
function PausePage:onPointerEvent(eventType, x, y)
  local result, meta, item = gamelua.ui.Frame.onPointerEvent(self, eventType, x, y)
  if g_noAudioOnPausePage and result == "TOGGLE_SOUNDS" then
    gamelua.settingsWrapper:toggleAudioEnabled()
    return nil, nil, nil
  end
  return result, meta, item
end
filename = "PausePage.lua"
