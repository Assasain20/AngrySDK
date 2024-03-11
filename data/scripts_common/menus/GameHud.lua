Frame = gamelua.ui.Frame
ui = gamelua.ui
PauseButton = gamelua.ui.ImageButton:inherit()
local g_showRestartButton = gamelua.deviceModel == "windows" or gamelua.deviceModel == "osx" or gamelua.g_isAccelerometerControl
if gamelua.deviceModel == "osx" then
  function PauseButton:draw(x, y)
    if not gamelua.g_usingGestureControls then
      gamelua.ui.ImageButton.draw(self, x, y)
    end
  end
end
SkipButton = ui.ImageButton:inherit()
function SkipButton:init()
  ui.ImageButton.init(self)
  self.scale_multiplier = 0
  self.state = "HIDDEN"
end
function SkipButton:update(dt, time)
  ui.ImageButton.update(self, dt, time)
  if self.state == "APPEAR" then
    self.scale_multiplier = self.scale_multiplier + dt * 3
    if self.scale_multiplier >= 1 then
      self.scale_multiplier = 1
      self.state = "ONSCREEN"
    end
  elseif self.state == "DISAPPEAR" then
    self.returnValue = nil
    self.scale_multiplier = self.scale_multiplier - dt * 3
    if self.scale_multiplier <= 0 then
      self.scale_multiplier = 0
      self.state = "GONE"
      self:setVisible(false)
    end
  elseif self.state == "CLICKED" then
    self.returnValue = nil
  end
end
PowerupButton = ui.ImageButton:inherit()
function SkipButton:draw(x, y, sx, sy, a, hs)
  ui.ImageButton.draw(self, x, y, sx * self.scale_multiplier, sy * self.scale_multiplier, a, hs)
end
GameHud = gamelua.ui.Frame:inherit()
function GameHud:init()
  self.name = "gameHud"
  if g_showRestartButton then
    local restart_button = PauseButton:new({
      name = "restart_button",
      returnValue = "RESTART_LEVEL"
    })
    restart_button:setImage("BUTTON_INGAME_RESTART")
    self:addChild(restart_button)
  end
  if gamelua.useAds() then
    local purchaseAdsOffButton = gamelua.ui.ImageButton:new({
      name = "purchaseAdsOffButton",
      returnValue = "PURCHASE_ADS_OFF"
    })
    purchaseAdsOffButton:setImage("BUTTON_X_CLOSE")
    purchaseAdsOffButton.visible = gamelua.useAds() and gamelua.isIapEnabled()
    self:addChild(purchaseAdsOffButton)
  end
  self.frame = 0
  if gamelua.deviceModel == "osx" then
    local gesture_menu = gamelua.OSX.GestureMenu:new()
    gesture_menu.visible = false
    self:addChild(gesture_menu)
  end
  local skip_button = SkipButton:new()
  skip_button.name = "skip_button"
  skip_button:setImage("BUTTON_NEXTLEVEL_SKIP")
  skip_button:setVisible(false)
  skip_button.activateOnRelease = true
  skip_button.returnValue = "SKIP_TO_LEVEL_END"
  self:addChild(skip_button)
  if gamelua.g_isAccelerometerControl then
    pauseButton.hover_enabled = false
    self:getChild("restart_button").hover_enabled = false
  end
  if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    local components = {
      center = "INGAME_POWERUP_OVERLAYMIDDLE",
      right = "INGAME_POWERUP_OVERLAYEND"
    }
    local powerup_button = ui.Slider:new()
    powerup_button.name = "powerup_button"
    powerup_button:setButtonImage("INGAME_BUTTON_EMPTY", "INGAME_BUTTON_POWERUP")
    powerup_button:setIndicatorImage("INGAME_BUTTON_POWERUPANIM", "")
    powerup_button:setToggleResult("TOGGLE_POWERUPS", "TOGGLE_POWERUPS_DISABLED")
    powerup_button:setDirection("RIGHT")
    powerup_button:setComponents(components)
    powerup_button:setOpenFunction("cubic-out")
    self:addChild(powerup_button)
    if self:isHudHidingNeeded() then
      powerup_button:setVisible(false)
    end
    local icons = {
      "INGAME_POWERUP_SEED",
      "INGAME_POWERUP_SLING",
      "INGAME_POWERUP_SCOPE",
      "INGAME_POWERUP_EARTHQ"
    }
    local powerups = {
      "superseed",
      "kingsling",
      "slingscope",
      "birdquake"
    }
    for i = 1, 4 do
      local powerup = ui.ImageButton:new()
      powerup.name = "powerup" .. i
      powerup:setImage(icons[i], icons[i] .. "_INACTIVE")
      powerup:setVisible(true)
      powerup.activateOnRelease = true
      powerup.returnValue = "ACTIVATE_POWERUP_" .. i
      powerup.meta = powerups[i]
      powerup_button:addChild(powerup)
      local bg = ui.Image:new()
      bg.name = "bg"
      bg:setImage("INGAME_BUTTON_SCOREBAR")
      powerup:addChild(bg)
      local counter = ui.Text:new()
      if gamelua.deviceModel == "iphone" then
        counter.font = "FONT_POWERUP_AMOUNT"
      elseif gamelua.deviceModel == "iphone4" then
        counter.font = getFontBasic
      else
        counter.font = "FONT_LS_SMALL"
      end
      counter.name = "counter"
      counter.text = "0"
      counter.hanchor = "RIGHT"
      counter.vanchor = "VCENTER"
      powerup:addChild(counter)
    end
    if gamelua.birdsShot == gamelua.birdCount then
      for i = 1, 3 do
        powerup_button:getChild("powerup" .. i):setEnabled(false)
      end
    end
    self.powerup_slider = powerup_button
    local dailyRewardPage = gamelua.DailyReward:new(self)
    dailyRewardPage.name = "dailyRewardPage"
    dailyRewardPage:setVisible(false)
    dailyRewardPage.state = "IDLE"
    self:addChild(dailyRewardPage)
  end
  local eagleButton = gamelua.ui.MightyEagleButton:new({
    name = "eagleButton",
    returnValue = "ME_BUTTON_CLICKED"
  })
  self:addChild(eagleButton)
  local pauseButton = PauseButton:new({
    name = "pauseButton",
    returnValue = "PAUSE_GAME"
  })
  pauseButton:setImage("INGAME_BUTTON_PAUSE")
  self:addChild(pauseButton)
  local pausePage = gamelua.ui.PausePage:new({name = "pausePage"})
  self:addChild(pausePage)
  self.show_skip_button = false
end
function GameHud:prepareForDynamicAssets()
  gamelua.dynamic.setRequirements(self, {
    "mightyEagleDemoPage",
    gamelua.settingsWrapper:getCurrentMainMenuTheme()
  })
end
function GameHud:onEntry()
  if not gamelua.startedFromEditor then
    gamelua.eventManager:addEventListener(gamelua.events.EID_LEVEL_LOADING_DONE, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_GAME_PAUSED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_PAUSE_CLICKED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_GAME_RESUMED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_TUTORIALS_DONE, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_ADS_REMOVED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_LEVEL_GOALS_CLEARED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_LEVEL_COMPLETE_INIT, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_POWERUP_WAS_USED, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_ALL_BIRDS_SHOT, self)
    gamelua.eventManager:addEventListener(gamelua.events.EID_IAP_COMPLETED, self)
  end
  gamelua.eventManager:addEventListener(gamelua.events.EID_EAGLE_BAIT_LAUNCHED, self)
  local audioButton = self:getChild("buttonSounds")
  if gamelua.settingsWrapper:isAudioEnabled() then
    audioButton:setState(1)
  else
    audioButton:setState(2)
  end
  self.showAds = gamelua.useAds()
  self.eagleHighscore = 0
  local highscores = gamelua.highscores
  local levelName = gamelua.levelName
  if highscores[levelName] ~= nil then
    if 0 < highscores[levelName].score then
      self.highscore = highscores[levelName].score
    end
    if highscores[levelName].eagleScore ~= nil and 0 < highscores[levelName].eagleScore then
      self.eagleHighscore = highscores[levelName].eagleScore
    end
  end
  if #gamelua.birdTutorialPopups == 0 then
    self:runDailyReward()
  end
  self:updatePowerupCounters()
  if gamelua.g_powerups_enabled and gamelua.settingsWrapper:isChildlockOn() and not gamelua.isPowerupsDisabled() then
    local powerup_button = self:getChild("powerup_button")
    powerup_button:setEnabled(false)
    powerup_button:setButtonImage("INGAME_BUTTON_POWERUP_DISABLED_TRANSP", "INGAME_BUTTON_POWERUP_DISABLED_TRANSP")
    powerup_button:setIndicatorImage("", "")
  end
  Frame.onEntry(self)
end
function GameHud:updatePowerupCounters()
  if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    local powerup_button = self:getChild("powerup_button")
    if powerup_button then
      for i = 1, 4 do
        local button = powerup_button:getChild("powerup" .. i)
        if gamelua.isPowerupUsedInLevel(button.meta) then
          button:setEnabled(false)
        end
        local counter = button:getChild("counter")
        counter.text = _G.math.min(gamelua.settingsWrapper:getItemAmount(button.meta), 9999)
      end
      if g_keep_powerup_slider_open and #gamelua.g_powerups_used < gamelua.g_max_powerups_per_level then
        powerup_button:open()
      end
      if #gamelua.g_powerups_used == gamelua.g_max_powerups_per_level then
        powerup_button:setEnabled(false)
        powerup_button:setButtonImage("INGAME_BUTTON_POWERUP_DISABLED_TRANSP", "INGAME_BUTTON_POWERUP_DISABLED_TRANSP")
        powerup_button:setIndicatorImage("", "")
      end
    end
  end
end
function GameHud:layout()
  local sx = 1
  local sy = 1
  if gamelua.isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
  end
  local pauseButton = self:getChild("pauseButton")
  pauseButton:refresh()
  pauseButton.x = pauseButton.px * 1.1 + gamelua.g_layoutMargin.x
  pauseButton.y = pauseButton.py * 1.1 + gamelua.g_layoutMargin.y
  self.last_button = pauseButton
  local eagleButton = self:getChild("eagleButton")
  eagleButton:refresh()
  if g_showRestartButton then
    local restart_button = self:getChild("restart_button")
    restart_button:refresh()
    restart_button.x = pauseButton.px * 3.2 + gamelua.g_layoutMargin.x
    restart_button.y = pauseButton.y
    self.last_button = restart_button
  end
  local purchaseAdsOffButton = self:getChild("purchaseAdsOffButton")
  if purchaseAdsOffButton ~= nil then
    purchaseAdsOffButton.visible = gamelua.useAds() and gamelua.isIapEnabled()
  end
  if gamelua.subsystemsapi:isAndroid() and not gamelua.settingsWrapper:isPremium() and gamelua.screenWidth <= 480 then
    eagleButton.x = eagleButton.px * 1.1 + gamelua.g_layoutMargin.x
    eagleButton.y = eagleButton.h + eagleButton.py + gamelua.g_layoutMargin.y
  else
    eagleButton.x = pauseButton.px * 3.2 + gamelua.g_layoutMargin.x
    eagleButton.y = pauseButton.y
  end
  if gamelua.showEagleUIElements() then
    self.last_button = eagleButton
  end
  local skip_button = self:getChild("skip_button")
  skip_button:refresh()
  skip_button.scaleX = sx
  skip_button.scaleY = sy
  skip_button.x = gamelua.screenWidth - skip_button.w * 0.55 * sx - gamelua.g_layoutMargin.x
  skip_button.y = gamelua.screenHeight - skip_button.h * 0.55 * sy - gamelua.g_layoutMargin.y
  if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    local have_eagle_button = gamelua.showEagleUIElements() and not gamelua.isEagleDisabled(gamelua.levelName)
    local powerup_button = self:getChild("powerup_button")
    local bw, _ = _G.res.getSpriteBounds("INGAME_BUTTON_EMPTY")
    if gamelua.deviceModel == "android" then
      powerup_button.x = _G.math.floor(pauseButton.px * 1.1)
      powerup_button.y = _G.math.floor(gamelua.screenHeight - pauseButton.py * 1.05)
    else
      if have_eagle_button then
        powerup_button.x = _G.math.floor(pauseButton.px * 5.3 + gamelua.g_layoutMargin.x)
      else
        powerup_button.x = _G.math.floor(pauseButton.px * 3.2 + gamelua.g_layoutMargin.x)
      end
      powerup_button.y = pauseButton.y
    end
    powerup_button:setChildSize(_G.math.floor(pauseButton.px * 2))
    powerup_button:setGap(_G.math.floor(pauseButton.px * 0.1))
    powerup_button:setPadding(_G.math.floor(pauseButton.px * 0.5), 0)
    for i = 1, 4 do
      local button = powerup_button:getChild("powerup" .. i)
      local bg = button:getChild("bg")
      bg.x = 0
      bg.y = 0
      local sw, sh = _G.res.getSpriteBounds(bg.image)
      local px, py = _G.res.getSpritePivot(bg.image)
      local counter = button:getChild("counter")
      counter.x = _G.math.floor(px - sw * 0.1)
      counter.y = _G.math.floor(sh * 0.5 - py)
      if gamelua.deviceModel == "ipad3" then
        counter.scaleX = sx
        counter.scaleY = sy
      end
    end
  end
  if gamelua.startedFromEditor then
    self:getChild("eagleButton"):setVisible(true)
  end
  Frame.layout(self)
end
function GameHud:update(dt, time)
  self:updateTutorials()
  gamelua.ui.Frame.update(self, dt, time)
  self.frame = self.frame + 1
  if gamelua.cheatsEnabled and gamelua.g_powerups_enabled and gamelua.keyCombination("D", "R") then
    local dailyRewardPage = self:getChild("dailyRewardPage")
    dailyRewardPage:reset(1)
    dailyRewardPage:layout()
  end
end
function GameHud:updateTutorials()
  if self.frame > 1 and #gamelua.birdTutorialPopups > 0 and (gamelua.g_tutorialActive == nil or gamelua.g_tutorialActive.ready_for_next_tutorial) then
    local from
    if self:getChild("pausePage").visible then
      from = "PAUSE_PAGE"
    else
      from = "INGAME"
      self:getChild("pauseButton").visible = false
      self:getChild("eagleButton"):setVisible(false)
      if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
        self:getChild("powerup_button"):setVisible(false)
      end
      if g_showRestartButton then
        self:getChild("restart_button"):setVisible(false)
      end
      self.tutorials_shown = true
    end
    gamelua.eventManager:notify({
      id = gamelua.events.EID_SHOW_TUTORIAL,
      tutorial = gamelua.birdTutorialPopups[1],
      from = from
    })
  elseif self.tutorials_shown and #gamelua.birdTutorialPopups == 0 and gamelua.g_tutorialActive == nil then
    self:getChild("pauseButton").visible = true
    self:getChild("eagleButton"):setVisible(true)
    if gamelua.g_powerups_enabled and not self:isHudHidingNeeded() and not gamelua.isPowerupsDisabled() then
      self:getChild("powerup_button"):setVisible(true)
    end
    if g_showRestartButton then
      self:getChild("restart_button"):setVisible(true)
    end
    self.tutorials_shown = nil
  end
  if gamelua.startedFromEditor then
    self:getChild("eagleButton"):setVisible(true)
  end
end
function GameHud:showPauseMenu()
  self:getChild("pauseButton").visible = false
  self:getChild("eagleButton"):setVisible(false)
  self:getChild("skip_button"):setVisible(false)
  if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    local powerup_button = self:getChild("powerup_button")
    self:getChild("powerup_button"):setVisible(false)
  end
  if g_showRestartButton then
    self:getChild("restart_button"):setVisible(false)
  end
  self:getChild("pausePage"):showPage()
end
function GameHud:instantlyHidePauseMenu()
  self:getChild("pauseButton").visible = true
  self:getChild("eagleButton"):setVisible(true)
  self:getChild("skip_button"):setVisible(self.show_skip_button)
  if gamelua.g_powerups_enabled and not self:isHudHidingNeeded() and not gamelua.isPowerupsDisabled() then
    local powerup_button = self:getChild("powerup_button")
    self:getChild("powerup_button"):setVisible(true)
  end
  if g_showRestartButton then
    self:getChild("restart_button"):setVisible(true)
  end
  self:getChild("pausePage").extendState = 0
  self:getChild("pausePage"):layout()
  self:getChild("pausePage"):hidePage()
  self:getChild("pausePage").visible = false
end
function GameHud:instantlyShowPauseMenu()
  self:getChild("pauseButton").visible = false
  self:getChild("eagleButton"):setVisible(false)
  self:getChild("skip_button"):setVisible(false)
  if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    local powerup_button = self:getChild("powerup_button")
    self:getChild("powerup_button"):setVisible(false)
  end
  if g_showRestartButton then
    self:getChild("restart_button"):setVisible(false)
  end
  self:getChild("pausePage").extendState = 1
  self:getChild("pausePage"):layout()
  self:getChild("pausePage"):showPage()
  self:getChild("pausePage").visible = true
end
function GameHud:returnToMenu()
  if gamelua.g_level_started_from_mattel_ge then
    gamelua.Mattel.g_mattel_return_function()
    gamelua.g_level_started_from_mattel_ge = false
  elseif gamelua.g_currentChallenge == nil then
    gamelua.eventManager:queueEvent({
      id = gamelua.events.EID_CHANGE_SCENE,
      from = "INGAME",
      target = "LEVEL_SELECTION_" .. gamelua.currentThemeNumber
    })
  else
    gamelua.eventManager:queueEvent({
      id = gamelua.events.EID_CHANGE_SCENE,
      target = "CHALLENGE_PAGE"
    })
  end
end
if not gamelua.g_isAccelerometerControl then
  function GameHud:onKeyEvent(eventType, key)
    if eventType == "RELEASE" then
      if key == "BACK" and self:getChild("pausePage").visible == true then
        if gamelua.g_tutorialActive ~= nil then
          gamelua.eventManager:notify({
            id = gamelua.events.EID_SKIP_TUTORIALS
          })
        else
          gamelua.setPhysicsEnabled(false)
          gamelua.setGameMode(function()
          end)
          gamelua.eventManager:notify({
            id = gamelua.events.EID_LEAVE_GAME,
            reason = "PAUSE_BACK_BUTTON"
          })
          self:returnToMenu()
        end
      elseif key == "KEY_MENU" or key == "ESCAPE" or key == "P" then
        if self:getChild("pausePage").visible == true and gamelua.g_tutorialActive == nil then
          self:returnToGame()
        end
      elseif key == "R" and not self:getChild("pausePage").visible then
        gamelua.skipInput = true
        gamelua.levelRestartedFrom = "keyboard command"
        gamelua.eventManager:queueEvent({
          id = gamelua.events.EID_LEVEL_RESTART_CLICKED
        })
      end
    end
  end
else
  function GameHud:onKeyEvent(eventType, key)
    local result, meta, item = Frame.onKeyEvent(self, eventType, key)
    if eventType == "RELEASE" and gamelua.g_tutorialActive == nil then
      if key == "BACK" then
        if self:getChild("pausePage").visible == true then
          gamelua.eventManager:notify({
            id = gamelua.events.EID_LEAVE_GAME,
            reason = "PAUSE_BACK_BUTTON"
          })
          self:returnToMenu()
        elseif gamelua.deviceModel == "freebox" then
          gamelua.cancelBirdDrag()
          gamelua.goToMenu()
        end
      elseif key == "PAUSE" or key == "KEY_MENU" then
        if self:getChild("pausePage").visible == false then
          gamelua.cancelBirdDrag()
          gamelua.goToMenu()
        elseif self:getChild("pausePage").visible == true then
          self:returnToGame()
        end
      elseif key == "RIGHT" and gamelua.deviceModel ~= "roku" then
        if self:getChild("pausePage").visible == true then
          self:returnToGame()
        elseif self.show_skip_button then
          gamelua.g_skip_wait_for_moving_objects = true
          self:getChild("skip_button").state = "CLICKED"
        end
      elseif key == "RESTART" then
        gamelua.skipInput = true
        gamelua.levelRestartedFrom = "keyboard command"
        gamelua.eventManager:queueEvent({
          id = gamelua.events.EID_LEVEL_RESTART_CLICKED
        })
      elseif key == "FORWARD" and self.show_skip_button and self:getChild("pausePage").visible == false then
        gamelua.g_skip_wait_for_moving_objects = true
        self:getChild("skip_button").state = "CLICKED"
      end
    end
    return result, meta, item
  end
end
function GameHud:returnToGame()
  self:getChild("pauseButton").visible = true
  self:getChild("eagleButton"):setVisible(not self:isHudHidingNeeded())
  self:getChild("skip_button"):setVisible(self.show_skip_button)
  if gamelua.g_powerups_enabled and not self:isHudHidingNeeded() and not gamelua.isPowerupsDisabled() then
    local powerup_button = self:getChild("powerup_button")
    self:getChild("powerup_button"):setVisible(true)
  end
  if g_showRestartButton then
    self:getChild("restart_button"):setVisible(true)
  end
  self:getChild("pausePage"):hidePage()
  gamelua.eventManager:queueEvent({
    id = gamelua.events.EID_BACK_TO_GAME_CLICKED
  })
  gamelua.cancelBirdDrag()
end
function GameHud:isHudHidingNeeded()
  return gamelua.eagleBaitLaunched or gamelua.isLevelEnding()
end
function GameHud:onPointerEvent(eventType, x, y)
  local result, meta, item = Frame.onPointerEvent(self, eventType, x, y)
  if gamelua.g_isAccelerometerControl and not gamelua.g_rokuCursorVisible then
    return result, meta, item
  end
  if gamelua.g_tutorialActive == nil and result then
    if result == "ME_BUTTON_CLICKED" and gamelua.g_tutorialActive == nil then
      if not gamelua.g_powerups_active then
        gamelua.skipInput = true
        self:getChild("eagleButton"):setVisible(false)
        gamelua.eventManager:notify({
          id = gamelua.events.EID_MIGHTY_EAGLE_BUTTON_CLICKED,
          from = "INGAME"
        })
      end
    elseif result == "PAUSE_GAME" and gamelua.g_tutorialActive == nil then
      if not gamelua.startedFromEditor then
        gamelua.goToMenu(true)
      else
        gamelua.returnToEditor()
      end
    elseif result == "BACK_TO_GAME" then
      self:returnToGame()
    elseif result == "BACK_TO_LEVEL_SELECTION" then
      gamelua.eventManager:notify({
        id = gamelua.events.EID_LEAVE_GAME,
        reason = "PAUSE_MENU_BUTTON"
      })
      self:returnToMenu()
    elseif result == "RESTART_LEVEL" then
      gamelua.skipInput = true
      gamelua.levelRestartedFrom = "pause menu"
      self:getChild("pausePage").rovio_news:setVisible(false)
      gamelua.eventManager:queueEvent({
        id = gamelua.events.EID_LEVEL_RESTART_CLICKED,
        hidden = g_rovio_news_loaded
      })
    elseif result == "TOGGLE_SOUNDS" then
      local audioButton = self:getChild("buttonSounds")
      gamelua.changeAudio()
    elseif result == "SHOW_TUTORIALS" then
      if gamelua.settingsWrapper:isAudioEnabled() then
        gamelua.setMusicVolume(1)
        gamelua.setEffectsVolume(1)
      end
      gamelua.eventManager:notify({
        id = gamelua.events.EID_SHOW_TUTORIALS,
        from = "PAUSE_PAGE"
      })
    elseif result == "PURCHASE_ADS_OFF" then
      gamelua.eventManager:notify({
        id = gamelua.events.EID_ADS_PURCHASE_OFF_CLICKED_INGAME
      })
    elseif result == "SKIP_TO_LEVEL_END" then
      gamelua.skipToLevelEnd()
      self:getChild("skip_button").state = "CLICKED"
    elseif result == "ACTIVATE_POWERUP_1" then
      if gamelua.settingsWrapper:getItemAmount("superseed") > 0 then
        if not gamelua.g_powerups_active and gamelua.activateSuperSeed() then
          item:setEnabled(false)
        end
      else
        self:gotoShopFromGame("superseed")
      end
    elseif result == "ACTIVATE_POWERUP_2" then
      if 0 < gamelua.settingsWrapper:getItemAmount("kingsling") then
        if not gamelua.g_powerups_active and gamelua.activateKingSling() then
          item:setEnabled(false)
        end
      else
        self:gotoShopFromGame("kingsling")
      end
    elseif result == "ACTIVATE_POWERUP_3" then
      if 0 < gamelua.settingsWrapper:getItemAmount("slingscope") then
        if not gamelua.g_powerups_active and gamelua.activateSlingScope() then
          item:setEnabled(false)
        end
      else
        self:gotoShopFromGame("slingscope")
      end
    elseif result == "ACTIVATE_POWERUP_4" then
      if 0 < gamelua.settingsWrapper:getItemAmount("birdquake") then
        if not gamelua.g_powerups_active and gamelua.activateBirdQuake() then
          item:setEnabled(false)
        end
      else
        self:gotoShopFromGame("birdquake")
      end
    elseif result == "GOTO_SHOP_FROM_PAUSE" then
      self:getChild("pausePage").news_disabled = true
      self:gotoShopFromGame(nil)
    elseif result == "GOTO_SHOP_DISABLED" then
      self:getChild("pausePage").rovio_news:setVisible(false)
      self:getChild("pausePage").news_disabled = true
      local function reactivate_news()
        self:getChild("pausePage").rovio_news:setVisible(true)
        self:getChild("pausePage").news_disabled = false
      end
      gamelua.powerupChildLockPrompt({close_call = reactivate_news})
    elseif result == "TOGGLE_POWERUPS" then
      g_keep_powerup_slider_open = not g_keep_powerup_slider_open
    elseif result == "TOGGLE_POWERUPS_DISABLED" and gamelua.settingsWrapper:isChildlockOn() then
      gamelua.setPhysicsEnabled(false)
      gamelua.setGameMode(function()
      end)
      self:getChild("pausePage").rovio_news:setVisible(false)
      self:getChild("pausePage").news_disabled = true
      local function reactivate_game()
        if not self:getChild("pausePage").visible then
          gamelua.setPhysicsEnabled(true)
          gamelua.setGameMode(gamelua.updateGame)
        else
          self:getChild("pausePage").rovio_news:setVisible(true)
        end
        self:getChild("pausePage").news_disabled = false
      end
      gamelua.powerupChildLockPrompt({close_call = reactivate_game})
    end
    if eventType ~= "HOVER" then
      gamelua.skipInput = true
    end
  end
  do
    local lb = self.last_button
    local bx = lb.x - lb.px + lb.w
    local by = lb.y - lb.py + lb.h
    if x < bx and y < by then
      gamelua.g_skip_trigger_specialty = true
    end
  end
  if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    local slider = self.powerup_slider
    local sw, _ = slider:getContentDimensions()
    local _, t, r, b = slider:getButtonBounds()
    if gamelua.deviceModel == "android" then
      if x < sw + r and y > t then
        gamelua.g_skip_trigger_specialty = true
      end
    elseif x < sw + r and y < b then
      gamelua.g_skip_trigger_specialty = true
    end
  end
  return result, meta, item
end
function GameHud:gotoShopFromGame(product)
  if not gamelua.showPowerupPurchaseElements() then
    return
  end
  if gamelua.adSystem then
    gamelua.adSystem:hideAd()
    gamelua.adSystem:hideExpandable()
  end
  gamelua.setPhysicsEnabled(false)
  gamelua.drawGame()
  gamelua.setGameOn(false)
  gamelua.setGameMode(function()
  end)
  local profileName = gamelua.selectFontProfile()
  local function load_function()
    gamelua.changeResolution = true
    gamelua.wantedResolution = "HALF"
    gamelua.g_resetCameras = true
    gamelua.releaseImages({
      "LEVELSELECTION",
      "TUTORIALS"
    })
    _G.res.createBitmapFont(gamelua.fontPath .. "/" .. profileName .. "/FONT_SHOP_AMOUNT.dat")
    gamelua.loadAssets({"SHOP"})
  end
  if product == nil then
    local goto_shop = {
      id = gamelua.events.EID_CHANGE_SCENE,
      target = gamelua.ProductPage:new({from = "PAUSE"})
    }
    gamelua.eventManager:notify({
      id = gamelua.events.EID_DO_LOADING,
      items = {load_function},
      completion_event = goto_shop,
      hidden = g_rovio_news_loaded
    })
  else
    local goto_shop = {
      id = gamelua.events.EID_CHANGE_SCENE,
      target = gamelua.ProductPage:new({from = "INGAME", current_product = product})
    }
    gamelua.eventManager:notify({
      id = gamelua.events.EID_DO_LOADING,
      items = {load_function},
      completion_event = goto_shop
    })
  end
end
function GameHud:setTextRenderState()
  if gamelua.isRetinaGraphicsEnabled() then
    gamelua.setRenderState(-gamelua.screenWidth / 2, 0, 2, 2)
  else
    gamelua.setRenderState(0, 0, 1, 1)
  end
end
function GameHud:draw(x, y, scaleX, scaleY, angle)
  local setFont = gamelua.setFont
  local fontBasic = gamelua.fontBasic
  setFont(fontBasic)
  local draw = true
  if gamelua.currentGameMode == gamelua.updateGame then
    draw = false
  end
  if gamelua.g_tutorialActive then
    draw = true
  end
  if draw then
    gamelua.drawGame()
  end
  self:setTextRenderState()
  local sx = 1
  local sy = 1
  if gamelua.isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
  end
  local currentScoreString = _G.string.format("%d", gamelua.score)
  local scoreLen = _G.res.getStringWidth(currentScoreString) * sx
  local screenWidth = gamelua.screenWidth
  local screenHeight = gamelua.screenHeight
  local scoreLen = _G.res.getStringWidth(currentScoreString) * sx
  local highscoreStr = _G.res.getString("TEXTS_BASIC", "MI_HIGH_SCORE")
  local scoreStr = _G.res.getString("TEXTS_BASIC", "MI_SCORE")
  local yAdd = 0
  local levelName = gamelua.levelName
  local highscores = gamelua.highscores
  if oldScoreLen == nil then
    oldScoreLen = scoreLen
  end
  scoreLen = _G.math.max(scoreLen, oldScoreLen)
  oldScoreLen = scoreLen
  local bannerOffset = 0
  if gamelua.adSystem ~= nil and gamelua.adSystem.scoreAdOffsetY ~= nil and gamelua.useAds() then
    bannerOffset = _G.math.min(_G.math.max(gamelua.adSystem.scoreAdOffsetY, 0), gamelua.adSystem.bannerHeight) * sy
    local purchaseAdsOffButton = self:getChild("purchaseAdsOffButton")
    if purchaseAdsOffButton ~= nil then
      purchaseAdsOffButton.visible = gamelua.subsystemsapi:isInPlayMode() and gamelua.isIapEnabled()
      if screenWidth <= 480 then
        local pauseButton = self:getChild("pauseButton")
        purchaseAdsOffButton.x = pauseButton.x + pauseButton.w + purchaseAdsOffButton.px
      else
        purchaseAdsOffButton.x = gamelua.screenWidth - gamelua.screenHeight - purchaseAdsOffButton.w * 0.5
      end
      purchaseAdsOffButton.y = bannerOffset - gamelua.adSystem.bannerHeight * 0.5
    end
  end
  local flyingBird = gamelua.flyingBird
  local isEagleBaitLaunched = gamelua.subsystemsapi.isEagleBaitLaunched()
  if flyingBird ~= nil and flyingBird.name ~= nil and gamelua.objects.world[flyingBird.name] then
    local bDef = gamelua.getObjectDefinition(flyingBird.name)
    gamelua.drawExtraTutorial(bDef.sprite)
  end
  if not isEagleBaitLaunched and not gamelua.g_special_game_mode then
    local xMargin = screenWidth - 3 - gamelua.g_layoutMargin.x
    local yMargin = _G.math.max(bannerOffset * 1.2, gamelua.g_layoutMargin.y)
    yAdd = _G.res.getFontLeading() + 1
    if self.highscore then
		-- availables: vanilla, modernSeasons, promo, modernClassic, oldClassic
		if gamelua.scoreCounterStyle == nil or gamelua.scoreCounterStyle == "vanilla" then
		  _G.res.drawString("TEXTS_BASIC", highscoreStr, xMargin, yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.highscore), xMargin, yAdd + yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", scoreStr, xMargin, yAdd * 2 + yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd * 3 + yMargin, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "modernSeasons" then
		  _G.res.drawString("TEXTS_BASIC", scoreStr, xMargin, yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd + yMargin, "TOP", "RIGHT")
		  local scaleScore = 0.68
		  gamelua.setRenderState(0, 0, scaleScore, scaleScore)
		  _G.res.drawString("TEXTS_BASIC", highscoreStr, xMargin/scaleScore, (yAdd * 2 + yMargin)/scaleScore, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.highscore), xMargin/scaleScore, (yAdd * (2 + scaleScore ) + yMargin)/scaleScore, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "promo" then
		  _G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.highscore), xMargin, yAdd*0.5 + yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd*2 + yMargin, "TOP", "RIGHT")
		  local scaleScore = 0.5
		  gamelua.setRenderState(0, 0, scaleScore, scaleScore)
		  _G.res.drawString("TEXTS_BASIC", "Highscore", xMargin/scaleScore, (yMargin)/scaleScore, "TOP", "RIGHT")		  
		  _G.res.drawString("TEXTS_BASIC", "Score", xMargin/scaleScore, (yAdd*1.5 + yMargin)/scaleScore, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "modernClassic" then
		  _G.res.drawString("TEXTS_BASIC", "Score", xMargin, yAdd*0.25 + yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd*1.5 + yMargin, "TOP", "RIGHT")
		  local scaleScore = 0.68
		  gamelua.setRenderState(0, 0, scaleScore, scaleScore)
		  _G.res.drawString("TEXTS_BASIC", "Highscore", xMargin/scaleScore, (yAdd * 2.75 + yMargin)/scaleScore, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.highscore), xMargin/scaleScore, (yAdd * (3 + scaleScore ) + yMargin)/scaleScore, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "oldClassic" then
		  local t_maxScoreLen = _G.res.getStringWidth(" " .. 999999)
		  _G.res.drawString("TEXTS_BASIC", highscoreStr, xMargin - t_maxScoreLen, yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.highscore), xMargin, yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", scoreStr, xMargin - t_maxScoreLen, yAdd + yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd + yMargin, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "rio" then
		  local scoreGap = 0.2
		  _G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.highscore), xMargin, yAdd*0.5 + yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd*(2+scoreGap) + yMargin, "TOP", "RIGHT")
		  local scaleScore = 0.5		   
		  gamelua.setRenderState(0, 0, scaleScore, scaleScore)
		  _G.res.drawString("TEXTS_BASIC", "Highscore", xMargin/scaleScore, (yMargin)/scaleScore, "TOP", "RIGHT")		  
		  _G.res.drawString("TEXTS_BASIC", "Score", xMargin/scaleScore, (yAdd*(1.5+scoreGap) + yMargin)/scaleScore, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "dynamicClassic" then
		  local maxHighscoreLen = nil
		  if _G.tonumber(currentScoreString) > _G.tonumber(_G.string.format("%d", self.highscore)) then
			maxHighscoreLen = _G.res.getStringWidth(" " .. currentScoreString)			
			_G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yMargin, "TOP", "RIGHT")
		  else
		    maxHighscoreLen = _G.res.getStringWidth(" " .. _G.string.format("%d", self.highscore))		
			_G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.highscore), xMargin, yMargin, "TOP", "RIGHT")		    
		  end		  
		  local t_maxScoreLen = _G.res.getStringWidth(" " .. currentScoreString)	
		  _G.res.drawString("TEXTS_BASIC", highscoreStr, xMargin - maxHighscoreLen, yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", scoreStr, xMargin - t_maxScoreLen, yAdd + yMargin, "TOP", "RIGHT")
		  _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd + yMargin, "TOP", "RIGHT")
		end
    else
		if gamelua.scoreCounterStyle == nil or gamelua.scoreCounterStyle == "vanilla" then
			_G.res.drawString("TEXTS_BASIC", scoreStr, xMargin, yMargin, "TOP", "RIGHT")
			_G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd + yMargin, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "modernSeasons" then
			_G.res.drawString("TEXTS_BASIC", scoreStr, xMargin, yMargin, "TOP", "RIGHT")
		    _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd + yMargin, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "promo" then
		    _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd*0.5 + yMargin, "TOP", "RIGHT")
			local scaleScore = 0.5
		    gamelua.setRenderState(0, 0, scaleScore, scaleScore)
			_G.res.drawString("TEXTS_BASIC", "Score", xMargin/scaleScore, (yMargin)/scaleScore, "TOP", "RIGHT")	
        elseif gamelua.scoreCounterStyle == "modernClassic" then
			_G.res.drawString("TEXTS_BASIC", "Score", xMargin, yMargin, "TOP", "RIGHT")
		    _G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd + yMargin, "TOP", "RIGHT")	
		elseif gamelua.scoreCounterStyle == "oldClassic" then
			local t_maxScoreLen = _G.res.getStringWidth(" " .. 999999)
			_G.res.drawString("TEXTS_BASIC", scoreStr, xMargin - t_maxScoreLen, yMargin, "TOP", "RIGHT")
			_G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yMargin, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "rio" then
			_G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yAdd*0.5 + yMargin, "TOP", "RIGHT")
			local scaleScore = 0.5
		    gamelua.setRenderState(0, 0, scaleScore, scaleScore)
			_G.res.drawString("TEXTS_BASIC", "Score", xMargin/scaleScore, (yMargin)/scaleScore, "TOP", "RIGHT")
		elseif gamelua.scoreCounterStyle == "dynamicClassic" then
			local t_maxScoreLen = _G.res.getStringWidth(" " .. currentScoreString)
			_G.res.drawString("TEXTS_BASIC", scoreStr, xMargin - t_maxScoreLen, yMargin, "TOP", "RIGHT")
			_G.res.drawString("TEXTS_BASIC", currentScoreString, xMargin, yMargin, "TOP", "RIGHT")
		end
    end
    local floatingScores = gamelua.floatingScores
    setFont("FONT_SCORE")
    for i = 1, #floatingScores do
      local fs = floatingScores[i]
      local fx, fy = gamelua.physicsToWorldTransform(fs.x, fs.y)
      local wScale = gamelua.worldScale
      if gamelua.tempWorldScale ~= nil then
        wScale = gamelua.tempWorldScale
      end
      fx = (fx - gamelua.screen.left) * wScale
      fy = (fy - gamelua.screen.top) * wScale
      local xs = fs.xs
      gamelua.setRenderState(0, 0, xs, xs)
      if fs.text ~= nil then
        _G.res.drawString("TEXTS_BASIC", fs.text, fx / xs, fy / xs, "BOTTOM", "HCENTER")
      end
      if fs.sprite ~= nil then
        _G.res.drawSprite("MENU_ELEMENTS_1", fs.sprite, _G.math.floor(fx / xs), _G.math.floor(fy / xs), "BOTTOM", "HCENTER")
      end
    end
  end
  self:setTextRenderState()
  setFont(fontBasic)
  if isEagleBaitLaunched then
    local highScoreLen = _G.res.getStringWidth(self.eagleHighscore .. "%")
    local _, episode, _, _ = gamelua.getLevelById(gamelua.levelName)
    local eagleHighscoreTextItem = gamelua.g_episodes[episode].mightyPower and gamelua.g_episodes[episode].mightyPower.highscoreTextItem or "TEXT_EAGLE_HIGHSCORE"
    local highscoreStr = _G.res.getString("TEXTS_BASIC", eagleHighscoreTextItem)
    _G.res.drawString("TEXTS_BASIC", highscoreStr .. " ", screenWidth - 3 - highScoreLen, bannerOffset * 1.2, "TOP", "RIGHT")
    _G.res.drawString("TEXTS_BASIC", _G.string.format("%d", self.eagleHighscore) .. "%", screenWidth - 3, bannerOffset * 1.2, "TOP", "RIGHT")
  end
  Frame.draw(self, x, y, scaleX, scaleY)
end
function GameHud:eventTriggered(event)
  if gamelua.g_tutorialActive == nil and event.id == gamelua.events.EID_GAME_PAUSED or event.id == gamelua.events.EID_PAUSE_CLICKED then
    self:showPauseMenu()
    gamelua.setPhysicsEnabled(false)
    gamelua.setGameMode(function()
    end)
    gamelua.loginfo("showing pause menu")
  end
  if event.id ~= gamelua.events.EID_GAME_RESUMED or event.mode == "INGAME" then
  end
  if event.id == gamelua.events.EID_LEVEL_LOADING_DONE then
  end
  if event.id == gamelua.events.EID_EAGLE_BAIT_LAUNCHED then
    self:getChild("eagleButton"):setVisible(false)
    self:getChild("skip_button").state = "DISAPPEAR"
    if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
      local powerup_button = self:getChild("powerup_button")
      powerup_button:setEnabled(false)
      powerup_button:disappear()
    end
  end
  if event.id == gamelua.events.EID_TUTORIALS_DONE then
    self:instantlyHidePauseMenu()
    self:runDailyReward()
  end
  if event.id == gamelua.events.EID_ADS_REMOVED then
    local purchaseAdsOffButton = self:getChild("purchaseAdsOffButton")
    if purchaseAdsOffButton ~= nil then
      purchaseAdsOffButton.visible = false
    end
  end
  if event.id == gamelua.events.EID_LEVEL_GOALS_CLEARED then
    if not gamelua.eagleBaitLaunched and not gamelua.g_usingGestureControls then
      self:getChild("skip_button"):setVisible(true)
      self:getChild("skip_button").state = "APPEAR"
      self.show_skip_button = true
    end
    if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
      local powerup_button = self:getChild("powerup_button")
      powerup_button:setEnabled(false)
      powerup_button:disappear()
      gamelua.g_level_completing = true
    end
  end
  if event.id == gamelua.events.EID_LEVEL_COMPLETE_INIT and gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    local powerup_button = self:getChild("powerup_button")
    powerup_button:disappear()
  end
  if event.id == gamelua.events.EID_POWERUP_WAS_USED then
    self:updatePowerupCounters()
    if gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() and #gamelua.g_powerups_used >= gamelua.g_max_powerups_per_level then
      local powerup_button = self:getChild("powerup_button")
      powerup_button:setEnabled(false)
      powerup_button:setButtonImage("INGAME_BUTTON_EMPTY", "INGAME_BUTTON_POWERUP_DISABLED_TRANSP")
      powerup_button:setIndicatorImage("INGAME_BUTTON_POWERUPANIM", "")
    end
  end
  if event.id == gamelua.events.EID_ALL_BIRDS_SHOT and gamelua.g_powerups_enabled and not gamelua.isPowerupsDisabled() then
    for i = 1, 3 do
      self:getChild("powerup" .. i):setEnabled(false)
    end
  end
  if event.id == gamelua.events.EID_IAP_COMPLETED then
    self:updatePowerupCounters()
  end
end
function GameHud:runDailyReward()
  if gamelua.g_powerups_enabled and not gamelua.settingsWrapper:isChildlockOn() and not gamelua.isPowerupsDisabled() then
    local last_reward = gamelua.settingsWrapper:getLastRewardDate()
    local current_time = gamelua.getCurrentTime()
    local difference = gamelua.getTimeDifference(last_reward, current_time)
    local rewardNow = false
    if difference.days == 1 or last_reward.year == 0 then
      local streak = gamelua.settingsWrapper:getDailyRewardStreak()
      gamelua.settingsWrapper:setDailyRewardStreak(streak + 1)
      rewardNow = true
    elseif difference.days > 1 then
      gamelua.settingsWrapper:setDailyRewardStreak(1)
      rewardNow = true
    end
    if rewardNow then
      gamelua.settingsWrapper:setLastRewardDate(current_time)
      local dailyRewardPage = self:getChild("dailyRewardPage")
      gamelua.eventManager:notify({
        id = gamelua.events.EID_PLAYER_RETURNED,
        streak = gamelua.settingsWrapper:getDailyRewardStreak(),
        days_since_last_play = difference.days
      })
      dailyRewardPage:reset(1)
      dailyRewardPage:layout()
      gamelua.saveLuaFileWrapper("settings.lua", "settings", true)
    end
  end
end
function GameHud:onExit()
  if not gamelua.startedFromEditor then
    gamelua.eventManager:removeEventListener(gamelua.events.EID_LEVEL_LOADING_DONE, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_GAME_PAUSED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_PAUSE_CLICKED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_GAME_RESUMED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_TUTORIALS_DONE, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_ADS_REMOVED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_LEVEL_GOALS_CLEARED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_LEVEL_COMPLETE_INIT, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_POWERUP_WAS_USED, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_ALL_BIRDS_SHOT, self)
    gamelua.eventManager:removeEventListener(gamelua.events.EID_IAP_COMPLETED, self)
  end
  gamelua.eventManager:removeEventListener(gamelua.events.EID_EAGLE_BAIT_LAUNCHED, self)
  Frame.onExit(self)
end
filename = "GameHud.lua"
