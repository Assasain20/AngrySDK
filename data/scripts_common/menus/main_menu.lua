MainMenuRoot = ui.Frame:inherit()
g_bird_animations = {}
g_bird_sprites = {}
local disableExternalLinks = not g_hasWebBrowser
function MainMenuRoot:init()
  self.name = "mainMenuRoot"
  self.backgroundColour = {
    r = 11,
    g = 101,
    b = 76,
    a = 255
  }
end
function MainMenuRoot:onEntry()
  ui.Frame.onEntry(self)
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  if theme and blockTable.themes[theme] and blockTable.themes[theme].color then
    local c = blockTable.themes[theme].color
    self.backgroundColour = {
      r = c.r,
      g = c.g,
      b = c.b,
      a = 255
    }
  end
  self:buildBirdList()
end
function MainMenuRoot:buildBirdList()
  local spritescale = 1
  if deviceModel == "iphone" and screenWidth >= 960 or deviceModel == "ipad" and screenWidth == 2048 then
    spritescale = 0.5
  end
  g_bird_sprites = {}
  local tutorials = settingsWrapper:getTutorials()
  for k, v in _G.pairs(tutorials) do
    if k == "BAIT_SARDINE" then
      _G.table.insert(g_bird_sprites, {
        sprite = k,
        reward = 1,
        scale = 1
      })
    else
      _G.table.insert(g_bird_sprites, {
        sprite = k,
        reward = 0,
        scale = 1
      })
    end
  end
  if #g_bird_sprites == 0 then
    _G.table.insert(g_bird_sprites, {
      sprite = "BIRD_RED",
      reward = 0,
      scale = 1
    })
  end
  local total_worlds = 0
  for _, k in _G.ipairs(g_episodeIds) do
    local v = g_episodes[k]
    for j = 1, #v.pages do
      if not v.pages[j].extra and not v.pages[j].disregard_in_rewards then
        total_worlds = total_worlds + 1
      end
    end
    local types = {projectile = 1, balloon = 2}
    if v.reward_three_stars and settingsWrapper:isEpisodeThreeStarred(k) then
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_three_stars.sprite,
        reward = types[v.reward_three_stars.type],
        scale = spritescale
      })
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_three_stars.sprite,
        reward = types[v.reward_three_stars.type],
        scale = spritescale
      })
    elseif v.reward_completion and isEpisodeCompleted(v) then
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_completion.sprite,
        reward = types[v.reward_completion.type],
        scale = spritescale
      })
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_completion.sprite,
        reward = types[v.reward_completion.type],
        scale = spritescale
      })
    end
  end
  local feathers, max_feathers = calculateAllFeathers()
  if feathers >= 200 then
    _G.table.insert(g_bird_sprites, {
      sprite = "REWARD_EAGLE",
      reward = 1,
      scale = spritescale
    })
    _G.table.insert(g_bird_sprites, {
      sprite = "REWARD_EAGLE",
      reward = 1,
      scale = spritescale
    })
  end
end
function MainMenuRoot:layout()
  self.current_zoom_level = settingsWrapper:getCurrentZoomLevelMainMenu()
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  local bW, bH = _G.res.getSpriteBounds("BUTTON_EMPTY")
  local topCamera = -2 * screenHeight / (screenHeight / (450 * self.current_zoom_level * 0.605)) + bH * 2.15 / (screenHeight / (450 * self.current_zoom_level * 0.5))
  local worldScale = 0.5 * screenHeight / 400 / (self.current_zoom_level * 0.66)
  self.camera_top = topCamera
  setWorldScale(worldScale)
  setTheme(theme)
  setLevelEffects(theme)
  if blockTable.themes[theme].menuWater then
    objects.waterLevel = 20
  else
    objects.waterLevel = nil
  end
  ui.Frame.layout(self)
end
function MainMenuRoot:draw(x, y, scaleX, scaleY, angle)
  self:drawSelf()
  ui.Frame.draw(self, x, y, scaleX, scaleY, angle)
end
function MainMenuRoot:drawSelf()
  if not settingsWrapper:isGfxLowQuality() then
    drawBackgroundNative()
  end
  self:drawBirds()
  drawForegroundNative()
end
function MainMenuRoot:drawBirds()
  for k, v in _G.pairs(g_bird_animations) do
    if v.layer == 3 then
      local scale = v.scale * 0.7 * (screenHeight / 640)
      setRenderState(0, 0, scale, scale, v.angle, _G.res.getSpritePivot(v.sheet, v.sprite))
      _G.res.drawSprite(v.sheet, v.sprite, _G.math.floor(v.x / scale), _G.math.floor(v.y / scale - screenHeight * 0.2 / v.scale))
    end
  end
  for k, v in _G.pairs(g_bird_animations) do
    if v.layer == 4 then
      local scale = v.scale * 0.8 * (screenHeight / 640)
      setRenderState(0, 0, scale, scale, v.angle, _G.res.getSpritePivot(v.sheet, v.sprite))
      _G.res.drawSprite(v.sheet, v.sprite, _G.math.floor(v.x / scale), _G.math.floor(v.y / scale - screenHeight * 0.125 / v.scale))
    end
  end
  for k, v in _G.pairs(g_bird_animations) do
    if v.layer == 5 then
      local scale = v.scale * 0.9 * (screenHeight / 640)
      setRenderState(0, 0, scale, scale, v.angle, _G.res.getSpritePivot(v.sheet, v.sprite))
      _G.res.drawSprite(v.sheet, v.sprite, _G.math.floor(v.x / scale), _G.math.floor(v.y / scale))
    end
  end
end
function MainMenuRoot:update(dt, time)
  ui.Frame.update(self, dt, time)
  setTopLeft(50 * time, self.camera_top)
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  if theme and blockTable.themes[theme] and not blockTable.themes[theme].no_birds_in_main_menu then
    self:animateBirds(dt)
  elseif #g_bird_animations > 0 then
    g_bird_animations = {}
  end
  if _G.res.isAudioPlaying(currentMainMenuSong) == false and currentMainMenuSong ~= nil then
    _G.res.playAudio(currentMainMenuSong, 0.8, true, 7)
  end
  updateLevelEffects(dt, time)
end
function MainMenuRoot:animateBirds(dt)
  local itemsPerCategory = 0.75
  local itemsInTotal = #g_bird_sprites * itemsPerCategory
  if itemsInTotal > #g_bird_animations and _G.math.random(1, 5) == 1 then
    local layer = _G.math.random(3, 5)
    local tx = _G.math.random(-screenWidth * 0.75, screenWidth * 0.75)
    local ty = screenHeight + 30 * screenHeight / 320
    local tempBirdSprite = g_bird_sprites[_G.math.random(#g_bird_sprites)]
    local sprite = tempBirdSprite.sprite
    local reward = tempBirdSprite.reward
    local angleSpeed = 0
    local scale = layer * 0.2 * (tempBirdSprite.scale or 1)
    local txVel = _G.math.random(100, 350) * scale * (screenWidth / 480 + 1) / 2
    local tyVel = _G.math.random(-400, -150) * scale * (screenHeight / 320 + 1) / 2
    if layer == 1 then
      tyVel = tyVel * 1.75
      txVel = txVel * 1.75
    end
    local _, spriteHeight = _G.res.getSpriteBounds("", sprite)
    if reward == 1 then
      angleSpeed = _G.math.random() * _G.math.pi * 1.5
    elseif reward == 2 then
      tx = _G.math.random(screenWidth * 0.1, screenWidth * 0.9)
      tyVel = _G.math.random(-250, -150) * scale * (screenHeight / 320 + 1) * 0.175
      txVel = 0
    end
    local yell_sprite = sprite .. "_YELL"
    if sprite == "BIRD_PUFFER_1" then
      yell_sprite = "BIRD_PUFFER_YELL"
    elseif sprite == "BIRD_PINK" then
      yell_sprite = "BIRD_PINK_BLINK"
    end
    _G.table.insert(g_bird_animations, {
      sprite = sprite,
      yell_sprite = yell_sprite,
      angle = 0,
      angleSpeed = angleSpeed,
      x = tx,
      y = ty,
      xVel = txVel,
      yVel = tyVel,
      scale = scale,
      layer = layer,
      spriteHeight = spriteHeight,
      reward = reward
    })
  end
  for i = #g_bird_animations, 1, -1 do
    local v = g_bird_animations[i]
    if v.reward == 2 then
      v.angle = _G.math.sin(v.angleSpeed) * 0.15
      v.angleSpeed = (v.angleSpeed + dt * 2) % (_G.math.pi * 2)
      v.x = v.x - v.angle * v.layer * dt * 30
    else
      v.yVel = v.yVel + 150 * dt
      v.angle = v.angle + v.angleSpeed * dt
    end
    v.x = v.x + v.xVel * dt
    v.y = v.y + v.yVel * dt
    if v.y > screenHeight + 50 * screenHeight / 320 or (v.reward == 2 or v.reward == 2) and v.y < -v.spriteHeight then
      _G.table.remove(g_bird_animations, i)
    end
  end
end
MainMenuSlider = ui.BackgroundBox:inherit()
function MainMenuSlider:init()
  ui.BackgroundBox.init(self)
  self:setState("CLOSED")
  self.slide_amount = 0
  self.components = {
    topLeft = "MENU_SLIDER_BG_TOP_LEFT",
    left = "MENU_SLIDER_BG_LEFT",
    right = "MENU_SLIDER_BG_RIGHT",
    topRight = "MENU_SLIDER_BG_TOP_RIGHT",
    topMiddle = "MENU_SLIDER_BG_TOP_MIDDLE",
    center = "MENU_SLIDER_BG_CENTER"
  }
  self.hanchor = "HCENTER"
  self.vanchor = "BOTTOM"
  self.element_width = 0
  self.element_height = 0
  self.element_gap = 0
  self.bottom_margin = 0
  self.width = 0
  self.height = 0
end
function MainMenuSlider:setState(state)
  self.state = state
  local visibility = state ~= "CLOSED"
  self.visible = visibility
  for _, child in _G.ipairs(self.children) do
    child.visible = visibility
  end
end
function MainMenuSlider:onEntry()
  ui.BackgroundBox.onEntry(self)
  self.height = 0
  self:setState("CLOSED")
end
function MainMenuSlider:toggle()
  if self.state == "OPEN" or self.state == "OPENING" then
    self:setState("CLOSING")
  elseif self.state == "CLOSED" or self.state == "CLOSING" then
    self:setState("OPENING")
  end
end
function MainMenuSlider:update(dt, time)
  local total_height = #self.children * self.element_height + (#self.children - 1) * self.element_gap + self.bottom_margin
  if self.state == "OPENING" then
    self.height = self.height + dt * screenHeight * 0.8
    if total_height <= self.height then
      self.height = total_height
      self:setState("OPEN")
    end
  elseif self.state == "CLOSING" then
    self.height = self.height - dt * screenHeight * 0.8
    if self.height < 0 then
      self.height = 0
      self:setState("CLOSED")
    end
  end
  if self.state == "OPEN" or self.state == "CLOSING" or self.state == "CLOSED" then
    for i = 1, #self.children do
      self.children[i].y = -self.height + (i - 1) * (self.element_gap + self.element_height) + self.element_height * 0.5
      if 0 <= self.children[i].y then
        self.children[i].y = 0
      end
    end
  elseif self.state == "OPENING" then
    for i = 1, #self.children do
      self.children[i].y = -total_height + (i - 1) * (self.element_gap + self.element_height) + self.element_height * 0.5
      if -self.children[i].y > self.height then
        self.children[i].y = 0
      end
    end
  end
  ui.BackgroundBox.update(self, dt, time)
end
function MainMenuSlider:onPointerEvent(eventType, x, y)
  local result, meta, item
  if self.state == "OPEN" then
    result, meta, item = ui.BackgroundBox.onPointerEvent(self, eventType, x, y)
  end
  return result, meta, item
end
ToggleIndicator = ui.Image:inherit()
function ToggleIndicator:init()
  ui.Image.init(self)
  self.state = "CLOSED"
end
function ToggleIndicator:onEntry()
  ui.Image.onEntry(self)
  self.state = "CLOSED"
end
function ToggleIndicator:toggle()
  if self.state == "OPEN" or self.state == "OPENING" then
    self.state = "CLOSING"
  elseif self.state == "CLOSED" or self.state == "CLOSING" then
    self.state = "OPENING"
  end
end
function ToggleIndicator:update(dt, time)
  if self.state == "OPENING" then
    self.angle = self.angle + dt * 16
    if self.angle >= 3.14159 then
      self.angle = 3.14159
      self.state = "OPEN"
    end
  elseif self.state == "CLOSING" then
    self.angle = self.angle - dt * 16
    if self.angle < 0 then
      self.angle = 0
      self.state = "CLOSED"
    end
  end
end
AdSplashPage = ui.Image:inherit()
function AdSplashPage:init()
  ui.Image.init(self)
  self:setImage("MAIN_MENU_AD_IMAGE")
  local ok_button = ui.ImageButton:new()
  ok_button.name = "ok_button"
  ok_button:setImage("MENU_YES")
  ok_button.returnValue = "OPEN_AD_SPLASH_LINK"
  ok_button.activateOnRelease = true
  self:addChild(ok_button)
  local cancel_button = ui.ImageButton:new()
  cancel_button.name = "cancel_button"
  cancel_button:setImage("MENU_NO")
  cancel_button.returnValue = "CLOSE_AD_SPLASH"
  cancel_button.activateOnRelease = true
  self:addChild(cancel_button)
end
function AdSplashPage:layout()
  ui.Image.layout(self)
  self.x = screenWidth * 0.5
  self.y = screenHeight * 0.5
  local ok_button = self:getChild("ok_button")
  local cancel_button = self:getChild("cancel_button")
  local sw, sh = _G.res.getSpriteBounds(self.image)
  local bsw, bsh = _G.res.getSpriteBounds(ok_button.image)
  ok_button.x = sw * 0.5 - 0.12 * bsw
  ok_button.y = sh * 0.5
  cancel_button.x = sw * -0.5 + 0.12 * bsw
  cancel_button.y = sh * 0.5
end
function AdSplashPage:draw(x, y)
  setRenderState(0, 0, 1, 1)
  drawRect(0, 0, 0, 0.65, 0, 0, screenWidth, screenHeight, false)
  ui.Image.draw(self, x, y)
end
function AdSplashPage:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Image.onPointerEvent(self, eventType, x, y)
  if result then
    return result, meta, item
  end
  return "BLOCK", nil, self
end
LoginButton = ui.ImageButton:inherit()
function LoginButton:init()
  ui.ImageButton.init(self)
  self.state = "NOT_REGISTERED"
end
function LoginButton:update(dt, time)
  ui.ImageButton.update(self)
  if self.state == "NOT_REGISTERED" then
    local size_change = 0.2
    local front_time = 1.5
    local back_time = 1.8
    self.animation_timer = (self.animation_timer or 0) + dt
    local scale = 1
    if front_time > self.animation_timer then
      scale = tweenLinear(self.animation_timer, 1 - size_change, size_change, front_time)
    else
      scale = tweenEaseCubicInOut(self.animation_timer - front_time, 1, -size_change, back_time)
      if self.animation_timer >= front_time + back_time then
        self.animation_timer = 0
      end
    end
    self.scaleX = scale
    self.scaleY = scale
  end
end
function LoginButton:setState(state)
  if state == "NOT_REGISTERED" then
    self:setImage("BUTTON_SIGN_UP")
  elseif state == "NOT_LOGGED" then
    self:setImage("BUTTON_SIGN_UP")
  elseif state == "LOGGED" then
    self:setImage("BUTTON_PROFILE")
  end
  self.scaleX = 1
  self.scaleY = 1
  self.state = state
end
MainMenu = MainMenuRoot:inherit()
function MainMenu:init()
  MainMenuRoot.init(self)
  self.quadClickCount = 0
  self.quadClickTimer = 0
  self.disableAdSplash = false
  local options_slider = MainMenuSlider:new()
  options_slider.name = "optionsSlider"
  self:addChild(options_slider)
  self:createOptionsSliderButtons(options_slider)
  local play_button
  if not self.forcePlayButtonImage and deviceModel ~= "windows" and deviceModel ~= "osx" and deviceModel ~= "roku" and deviceModel ~= "freebox" then
    play_button = ui.BackgroundBox:new()
    play_button.name = "playButton"
    play_button.components = {
      left = "PLAY_BUTTON_BG_LEFT",
      center = "PLAY_BUTTON_BG_MIDDLE",
      right = "PLAY_BUTTON_BG_RIGHT"
    }
    play_button.hanchor = "HCENTER"
    play_button.vanchor = "VCENTER"
    function play_button:onPointerEvent(eventType, x, y)
      if eventType == "LRELEASE" and x >= self.x - self.width * 0.5 and x <= self.x + self.width * 0.5 and y >= self.y - self.height * 0.5 and y <= self.y + self.height * 0.5 then
        _G.res.playAudio("menu_confirm", 1, false)
        return "PLAY", nil, self
      end
    end
  else
    play_button = ui.ImageButton:new()
    play_button.name = "playButton"
    play_button.returnValue = "PLAY"
    play_button.clickSound = "menu_confirm"
    play_button.activateOnRelease = true
  end
  self:addChild(play_button)
  self.playEvent = {
    id = events.EID_CHANGE_SCENE,
    target = "PLAY",
    from = "MAIN_MENU"
  }
  local play_text = ui.ImageButton:new()
  play_text.name = "playText"
  play_text.returnValue = "GOTO_EPISODE_SELECTION"
  play_text.clickSound = "menu_confirm"
  play_button:addChild(play_text)
  local game_logo = ui.Image:new()
  game_logo.name = "gameLogo"
  game_logo:setImage("MENU_LOGO")
  self:addChild(game_logo)
  local options_button = ui.ImageButton:new()
  options_button.name = "optionsButton"
  options_button:setImage("BUTTON_EMPTY")
  options_button.returnValue = "TOGGLE_OPTIONS"
  self:addChild(options_button)
  local options_image = ToggleIndicator:new()
  options_image.name = "optionsImage"
  options_image:setImage("BUTTON_OPTIONS")
  options_button:addChild(options_image)
  if not disableExternalLinks then
    local external_slider = MainMenuSlider:new()
    external_slider.name = "externalSlider"
    self:addChild(external_slider)
    local external_button = ui.ImageButton:new()
    external_button.name = "externalButton"
    external_button:setImage("BUTTON_EMPTY")
    external_button.returnValue = "TOGGLE_EXTERNAL"
    self:addChild(external_button)
    local external_image = ToggleIndicator:new()
    external_image.name = "externalImage"
    external_image:setImage("BUTTON_SLIDER")
    external_button:addChild(external_image)
    self:createExternalSliderButtons(external_slider)
  end
  self.mid_buttons = {}
  local eagle_button = ui.ImageButton:new()
  eagle_button.name = "eagleButton"
  eagle_button:setImage("BUTTON_EAGLE_BUY")
  eagle_button.returnValue = "GOTO_EAGLE_PAGE"
  eagle_button.visible = false
  eagle_button.clickSound = "menu_confirm"
  eagle_button.activateOnRelease = true
  self:addChild(eagle_button)
  local magic_places_button = ui.ImageButton:new()
  magic_places_button.name = "magicPlacesButton"
  magic_places_button:setImage("BTN_MAGIC")
  magic_places_button.returnValue = "GOTO_MAGIC_MAP"
  magic_places_button.visible = false
  magic_places_button.clickSound = "menu_confirm"
  magic_places_button.activateOnRelease = true
  self:addChild(magic_places_button)
  if not releaseBuild and showEditor then
    local editor_button = ui.ImageButton:new()
    editor_button.name = "editorButton"
    editor_button:setImage("BUTTON_EMPTY")
    editor_button.returnValue = "GOTO_EDITOR"
    self:addChild(editor_button)
    local editor_text = ui.Text:new({font = getFontBasic})
    editor_text.name = "editorText"
    editor_text.text = "EDITOR"
    editor_text.scaleX = 0.75
    editor_text.scaleY = 0.75
    editor_button:addChild(editor_text)
  end
  if gameCenterSupported or not releaseBuild and iOS then
    self:initGameCenter()
  end
  if gamerService then
    local gsButtons = ui.gamerservices.Buttons:new({name = "gsButtons", service = gamerService})
    self:addChild(gsButtons)
  end
  if ABIDEnabled then
    local ABID_button = ui.ImageButton:new({
      name = "ABID_button",
      returnValue = "ABID_CLICKED"
    })
    ABID_button:setImage("BUTTON_EMPTY")
    self:addChild(ABID_button)
    local ABID_text = ui.Text:new({
      name = "ABID_text",
      font = getFontBasic,
      text = "ABID"
    })
    ABID_text:clip()
    ABID_button:addChild(ABID_text)
  end
  if deviceModel == "windows" or deviceModel == "osx" then
    local exit_button = ui.ImageButton:new()
    exit_button.name = "exit_button"
    exit_button:setImage("MENU_QUIT_EN")
    exit_button.returnValue = "EXIT"
    exit_button.clickSound = "menu_confirm"
    exit_button.activateOnRelease = true
    self:addChild(exit_button)
  end
  if g_updateCheckEnabled then
    local update_button = ui.ImageButton:new()
    update_button.name = "update_button"
    update_button:setImage("BUTTON_CLASSIC_ONLINE")
    update_button.returnValue = "UPDATE_GAME"
    update_button.clickSound = "menu_confirm"
    update_button.activateOnRelease = true
    update_button:setVisible(false)
    self:addChild(update_button)
  end
  if g_registrationEnabled then
    local register_button = ui.ImageButton:new()
    register_button.name = "register_button"
    register_button:setImage("BUTTON_ACTIVATE_FULL")
    register_button.returnValue = "OPEN_REGISTER_WINDOW"
    register_button.clickSound = "menu_confirm"
    register_button.activateOnRelease = true
    self:addChild(register_button)
  end
  if g_updateCheckEnabled then
    local update_button = ui.ImageButton:new()
    update_button.name = "update_button"
    update_button:setImage("BUTTON_CLASSIC_ONLINE")
    update_button.returnValue = "UPDATE_GAME"
    update_button.clickSound = "menu_confirm"
    update_button.activateOnRelease = true
    update_button:setVisible(false)
    self:addChild(update_button)
  end
  local rovio_login_button = LoginButton:new()
  rovio_login_button.name = "rovio_login_button"
  rovio_login_button.returnValue = "ROVIO_LOGIN"
  rovio_login_button:setState("NOT_REGISTERED")
  rovio_login_button.activateOnRelease = true
  rovio_login_button:setVisible(false)
  rovio_login_button.clickSound = "menu_confirm"
  self:addChild(rovio_login_button)
  if not g_loadTimed then
    g_loadTimed = true
    if _G.Flurry then
      local tempGameTimer = "" .. getGameTimer()
      _G.Flurry.logEvent("Loading time - splash to menu", {seconds = tempGameTimer})
    end
  end
end
function MainMenu:prepareForDynamicAssets()
  dynamic.setRequirements(self, {
    "mainMenuRoot",
    settingsWrapper:getCurrentMainMenuTheme()
  })
end
function MainMenu:createOptionsSliderButtons(slider)
  if g_allowLowQualityGraphics then
    local quality_button = ui.ToggleButton:new()
    quality_button.name = "qualityButton"
    quality_button:setImage({
      "BUTTON_LQ",
      "BUTTON_LOW_QUALITY"
    })
    quality_button.returnValue = "TOGGLE_QUALITY"
    if settingsWrapper:isGfxLowQuality() then
      quality_button:setState(2)
    end
    slider:addChild(quality_button)
  end
  if iOS and isIapEnabled() and not settingsWrapper:isMightyEagleEnabled() then
    local iap_restore_button = ui.ImageButton:new()
    iap_restore_button.name = "iap_restore_button"
    iap_restore_button:setImage("BUTTON_EAGLE_RESTORE")
    iap_restore_button.returnValue = "IAP_RESTORE_CLICKED"
    iap_restore_button.clickSound = "menu_confirm"
    slider:addChild(iap_restore_button)
  end
  if g_powerups_enabled then
    local childlock_button = ui.ToggleButton:new()
    childlock_button.name = "childlockButton"
    childlock_button:setImage({
      "BUTTON_MENU_POWERUP",
      "BUTTON_CHILDLOCK_ON"
    })
    childlock_button.returnValue = "TOGGLE_CHILDLOCK"
    if settingsWrapper:isChildlockOn() then
      childlock_button:setState(2)
    end
    slider:addChild(childlock_button)
  end
  local credits_button = ui.ImageButton:new()
  credits_button.name = "creditsButton"
  credits_button:setImage("BUTTON_ABOUT_SMALL")
  credits_button.returnValue = "GOTO_CREDITS"
  credits_button.clickSound = "menu_confirm"
  slider:addChild(credits_button)
  local sound_button = ui.ToggleButton:new()
  sound_button.name = "soundButton"
  sound_button:setImage({
    "BUTTON_SOUNDS_SMALL",
    "BUTTON_MAINMENU_SFX_OFF"
  })
  sound_button.returnValue = "TOGGLE_SOUND"
  slider:addChild(sound_button)
  if deviceModel == "windows" or deviceModel == "osx" then
    local fullscreen_button = ui.ImageButton:new()
    fullscreen_button.name = "fullscreen_button"
    fullscreen_button:setImage("BUTTON_FULLSCREEN")
    fullscreen_button.returnValue = "TOGGLE_FULLSCREEN"
    fullscreen_button.clickSound = "menu_confirm"
    slider:addChild(fullscreen_button)
  end
end
function MainMenu:createExternalSliderButtons(slider)
  if g_GCButtonsInExternalLinksSlider and (gameCenterSupported or not releaseBuild and iOS) then
    self:createGameCenterExternalSliderButtons(slider)
  end
  if not disableExternalLinks then
    local youtube_button = ui.ImageButton:new()
    youtube_button.name = "youtubeButton"
    youtube_button:setImage("BUTTON_TRAILER_SMALL")
    youtube_button.returnValue = "GOTO_TRAILER"
    slider:addChild(youtube_button)
  end
  if not disableExternalLinks then
    if not applyChinaRestictions then
      local facebook_button = ui.ImageButton:new()
      facebook_button.name = "facebookButton"
      facebook_button:setImage("BUTTON_FACEBOOK_SMALL")
      facebook_button.returnValue = "GOTO_FACEBOOK"
      local twitter_button = ui.ImageButton:new()
      twitter_button.name = "twitterButton"
      twitter_button:setImage("BUTTON_TWITTER_SMALL")
      twitter_button.returnValue = "GOTO_TWITTER"
      slider:addChild(facebook_button)
      slider:addChild(twitter_button)
    else
      local tencentWeibo_button = ui.ImageButton:new()
      tencentWeibo_button.name = "tencentButton"
      tencentWeibo_button:setImage("BUTTON_WEIBO_2_SMALL")
      tencentWeibo_button.returnValue = "GOTO_TENCENT_WEIBO"
      slider:addChild(tencentWeibo_button)
      local sinaweibo_button = ui.ImageButton:new()
      sinaweibo_button.name = "tencentButton"
      sinaweibo_button:setImage("BUTTON_WEIBO_1_SMALL")
      sinaweibo_button.returnValue = "GOTO_SINA_WEIBO"
      slider:addChild(sinaweibo_button)
      local qzone_button = ui.ImageButton:new()
      qzone_button.name = "qzonetButton"
      qzone_button:setImage("BUTTON_QZONE_SMALL")
      qzone_button.returnValue = "GOTO_QZONE"
      slider:addChild(qzone_button)
    end
  end
end
function MainMenu:onEntry()
  MainMenuRoot.onEntry(self)
  eventManager:notify({
    id = events.EID_MAIN_MENU_ENTERED
  })
  self:refreshMiddleButtons()
  local audio_button = self:getChild("optionsSlider"):getChild("soundButton")
  if settingsWrapper:isAudioEnabled() then
    audio_button:setState(1)
  else
    audio_button:setState(2)
  end
  self:getChild("optionsButton"):getChild("optionsImage").angle = 0
  if not disableExternalLinks then
    self:getChild("externalButton"):getChild("externalImage").angle = 0
  end
  eventManager:addEventListener(events.EID_AUDIO_STATE_CHANGED, self)
  eventManager:addEventListener(events.EID_IAP_ITEMS_RESTORED, self)
  eventManager:addEventListener(events.EID_SERVICE_AVAILABILITY_CHANGED, self)
  eventManager:addEventListener(events.EID_ROVIO_ID_LOGIN_SUCCESS, self)
  eventManager:addEventListener(events.EID_ROVIO_ID_LOGOUT, self)
  if g_updateCheckEnabled then
    eventManager:addEventListener(events.EID_UPDATE_AVAILABLE, self)
    local update_button = self:getChild("update_button")
    update_button:setVisible(g_updateAvailable)
  end
  if not g_mainMenuAdChecked and iOS then
    local timeBetweenAdChecks
    if releaseBuild then
      timeBetweenAdChecks = 10800
    else
      timeBetweenAdChecks = 60
    end
    if timeBetweenAdChecks < getTimeDifferenceInSeconds(getCurrentTime(), settingsWrapper:getMainMenuAdLastCheckedTime()) then
      local url = MAIN_MENU_AD_URL .. "&ts=" .. settingsWrapper:getMainMenuAdTimeStamp()
      print("<splash> Initiating main menu ad check with URL: " .. url .. "\n")
      g_mainMenuAdChecked = true
      checkMainMenuAd(url)
      settingsWrapper:setMainMenuAdLastCheckedTime(getCurrentTime())
    else
      print("<splash> Too short a time from last main menu ad check, not checking now\n")
    end
  end
  if g_startup_rewards and _G.tonumber(g_startup_rewards) and 0 < _G.tonumber(g_startup_rewards) and g_powerups_enabled then
    addPowerups("slingscope", g_startup_rewards)
    addPowerups("birdquake", g_startup_rewards)
    addPowerups("kingsling", g_startup_rewards)
    addPowerups("superseed", g_startup_rewards)
    settingsWrapper:setRewardCollected("firststart")
    g_startup_rewards = nil
  end
end
function MainMenu:onExit()
  MainMenuRoot.onExit(self)
  eventManager:removeEventListener(events.EID_AUDIO_STATE_CHANGED, self)
  eventManager:removeEventListener(events.EID_IAP_ITEMS_RESTORED, self)
  eventManager:removeEventListener(events.EID_ROVIO_ID_LOGIN_SUCCESS, self)
  if g_updateCheckEnabled then
    eventManager:removeEventListener(events.EID_UPDATE_AVAILABLE, self)
  end
  self.disableAdSplash = false
end
function MainMenu:refreshMiddleButtons()
  self.mid_buttons = {}
  if isIapEnabled() and not settingsWrapper:isMightyEagleEnabled() then
    _G.table.insert(self.mid_buttons, "eagleButton")
    self:getChild("eagleButton").visible = true
  else
    self:getChild("eagleButton").visible = false
  end
  if not g_GCButtonsInExternalLinksSlider and (gameCenterSupported or not releaseBuild and iOS) then
    self:refreshGameCenterButtons()
  end
  if g_registrationEnabled then
    if not g_isRegistered then
      _G.table.insert(self.mid_buttons, "register_button")
      self:getChild("register_button").visible = true
    else
      self:getChild("register_button").visible = false
    end
  end
  if g_rovio_account_enabled and g_rovio_account_available then
    _G.table.insert(self.mid_buttons, "rovio_login_button")
    self:getChild("rovio_login_button"):setVisible(true)
  else
    self:getChild("rovio_login_button"):setVisible(false)
  end
  if g_magic_places_enabled and _G.magicplaces then
    _G.table.insert(self.mid_buttons, "magicPlacesButton")
    self:getChild("magicPlacesButton").visible = true
  else
    self:getChild("magicPlacesButton").visible = false
  end
  self:layout()
end
function MainMenu:layout()
  MainMenuRoot.layout(self)
  local play_button = self:getChild("playButton")
  play_button.x = screenWidth * 0.5
  play_button.y = screenHeight * 0.555
  local play_sprite = getPlayButtonSprite()
  if not self.forcePlayButtonImage and deviceModel ~= "windows" and deviceModel ~= "osx" and deviceModel ~= "roku" and deviceModel ~= "freebox" then
    play_button:getChild("playText"):setImage(play_sprite)
    local sw, sh = _G.res.getSpriteBounds(play_sprite)
    play_button.width = sw
    play_button.height = sh * 1.7
  else
    play_button:setImage(play_sprite)
  end
  local game_logo = self:getChild("gameLogo")
  game_logo.x = screenWidth * 0.5
  game_logo.y = screenHeight * 0.021875
  local button_w, button_h = _G.res.getSpriteBounds("BUTTON_EMPTY")
  local slider_button_w, slider_button_h = _G.res.getSpriteBounds("BUTTON_ABOUT_SMALL")
  local options_slider = self:getChild("optionsSlider")
  if deviceModel ~= "windows" and deviceModel ~= "osx" then
    options_slider.x = button_w * 0.55 + g_layoutMargin.x
  else
    options_slider.x = screenWidth - button_w * 1.65 - g_layoutMargin.x
  end
  options_slider.y = screenHeight - button_h * 0.55 - g_layoutMargin.y
  options_slider.width = button_w * 0.5
  options_slider.bottom_margin = button_h * 0.5
  options_slider.element_height = slider_button_h
  local options_button = self:getChild("optionsButton")
  options_button.x = options_slider.x
  options_button.y = options_slider.y
  if not disableExternalLinks then
    local external_slider = self:getChild("externalSlider")
    external_slider.x = screenWidth - button_w * 0.55 - g_layoutMargin.x
    external_slider.y = screenHeight - button_h * 0.55 - g_layoutMargin.y
    external_slider.width = button_w * 0.5
    external_slider.bottom_margin = button_h * 0.5
    external_slider.element_height = slider_button_h
    local external_button = self:getChild("externalButton")
    external_button.x = external_slider.x
    external_button.y = external_slider.y
  end
  if deviceModel == "windows" or deviceModel == "osx" then
    local exit_button = self:getChild("exit_button")
    exit_button.x = button_w * 0.55 + g_layoutMargin.x
    exit_button.y = screenHeight - button_h * 0.55 - g_layoutMargin.y
  end
  if g_updateCheckEnabled then
    local update_button = self:getChild("update_button")
    update_button.x = button_w * 1.65 - g_layoutMargin.x
    update_button.y = screenHeight - button_h * 0.55 - g_layoutMargin.y
  end
  local x_spacing = screenWidth * 0.01
  local x_first = screenWidth * 0.5 - (#self.mid_buttons - 1) * x_spacing * 0.5
  for i, button_name in _G.ipairs(self.mid_buttons) do
    local button = self:getChild(button_name)
    local sw, _ = _G.res.getSpriteBounds(button.image)
    x_first = x_first - sw * 0.5
  end
  local x_pos = x_first
  for i, button_name in _G.ipairs(self.mid_buttons) do
    local button = self:getChild(button_name)
    local sw, _ = _G.res.getSpriteBounds(button.image)
    local px, _ = _G.res.getSpritePivot(button.image)
    button.x = x_pos + px
    button.y = screenHeight - button_h * 0.55 - g_layoutMargin.y
    x_pos = x_pos + x_spacing + sw
  end
  if not releaseBuild and showEditor then
    local editor_button = self:getChild("editorButton")
    editor_button.x = screenWidth * 0.75
    editor_button.y = screenHeight * 0.7
  end
  if ABIDEnabled then
    local ABID_button = self:getChild("ABID_button")
    ABID_button.x = options_slider.x + options_slider.width * 2
    ABID_button.y = options_slider.y
    local ABID_text = self:getChild("ABID_text")
    ABID_text:clip()
    ABID_text.x = 0
    ABID_text.y = 0
  end
  if g_rovio_account_enabled and g_rovio_account_available then
    local rovio_login_button = self:getChild("rovio_login_button")
    if RovioAccount.profile.id then
      rovio_login_button:setState("LOGGED")
    elseif settingsWrapper:hasPlayerRegistered() then
      rovio_login_button:setState("NOT_LOGGED")
    else
      rovio_login_button:setState("NOT_REGISTERED")
    end
  end
end
function MainMenu:update(dt, time)
  MainMenuRoot.update(self, dt, time)
  if gameCenterSupported or not releaseBuild and iOS then
    self:updateGameCenter(dt, time)
  end
  if mainMenuAdReadyToBeShown and not self.disableAdSplash then
    mainMenuAdReadyToBeShown = false
    self:showAdPopup()
    settingsWrapper:setMainMenuAdTimeStamp(mainMenuAdTimeStamp)
  end
  if cheatsEnabled then
    if keyPressed.F1 then
      print("unlocking levels\n")
      for i = 1, #g_episodeIds do
        local id = g_episodeIds[i]
        local ep = g_episodes[g_episodeIds[i]]
        if not ep.no_level_progression then
          settingsWrapper:setLastOpenLevel(id, 200)
        end
      end
    end
    if keyPressed.F2 then
      print("relocking levels\n")
      for i = 1, #g_episodeIds do
        local id = g_episodeIds[i]
        local ep = g_episodes[g_episodeIds[i]]
        if not ep.no_level_progression then
          settingsWrapper:setLastOpenLevel(id, 1)
        end
      end
      checkLastOpenLevels()
    end
  end
  self.quadClickTimer = self.quadClickTimer - dt
end
function MainMenu:showAdPopup()
  local ad = AdSplashPage:new()
  eventManager:notify({
    id = events.EID_PUSH_FRAME,
    target = ad
  })
end
function MainMenu:updatePrompt()
  g_updatePrompted = true
  notificationsFrame:addChild(ui.ConfirmPrompt:new({
    title = [[
New update available!
Download now?]],
    confirmOnLeft = deviceModel == "windows",
    confirm_event = {
      id = events.EID_UPDATE_GAME
    }
  }))
end
function MainMenu:onKeyEvent(eventType, key)
  local result, meta, item = MainMenuRoot.onKeyEvent(self, eventType, key)
  if not result and eventType == "RELEASE" and (key == "BACK" or key == "ESCAPE") and deviceModel ~= "roku" and deviceModel ~= "freebox" then
    eventManager:notify({
      id = events.EID_EXIT_GAME
    })
  end
  return result, meta, item
end
function MainMenu:onPointerEvent(eventType, x, y)
  local result, meta, item = MainMenuRoot.onPointerEvent(self, eventType, x, y)
  if releaseBuild ~= true and x > screenWidth - 50 and y < 50 then
    settingsWrapper:setMightyEagleEnabled()
  end
  if x > screenWidth * 0.92 and y < screenHeight * 0.08 and cheatsEnabled and eventType == "LRELEASE" then
    if self.quadClickTimer > 0 or self.quadClickCount == 0 then
      self.quadClickCount = self.quadClickCount + 1
      if self.quadClickCount == 4 then
        self.quadClickCount = 0
        for k, v in _G.pairs(g_achievements) do
          achievementProcessor:addToAchievementUnlockQueue(k, true)
        end
      end
    else
      self.quadClickCount = 1
    end
    self.quadClickTimer = 0.5
  end
  if result == "PLAY" then
    eventManager:notify(self.playEvent)
  elseif result == "GOTO_CREDITS" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "CREDITS",
      from = "MAIN_MENU"
    })
  elseif result == "GOTO_EAGLE_PAGE" then
    eventManager:notify({
      id = events.EID_MIGHTY_EAGLE_BUTTON_CLICKED,
      from = "MAIN_MENU"
    })
  elseif result == "GOTO_MAGIC_MAP" then
    eventManager:notify({
      id = events.EID_MAGIC_PLACES_CLICKED,
      from = "MAIN_MENU"
    })
  elseif result == "GOTO_EDITOR" then
    menuManager:changeRoot(EditorPage:new())
  elseif result == "CLOUD_SYNC" then
    notifyEventManager(events.EID_START_CLOUD_SYNC)
  elseif result == "GOTO_ACHIEVEMENTS" then
    self:gotoAchievements()
  elseif result == "GOTO_LEADERBOARDS" then
    self:gotoLeaderboards()
  elseif result == "TOGGLE_OPTIONS" then
    self:getChild("optionsSlider"):toggle()
    self:getChild("optionsButton"):getChild("optionsImage"):toggle()
  elseif result == "TOGGLE_EXTERNAL" then
    self:getChild("externalSlider"):toggle()
    self:getChild("externalButton"):getChild("externalImage"):toggle()
  elseif result == "TOGGLE_SOUND" then
    changeAudio()
  elseif result == "TOGGLE_CHILDLOCK" then
    if not settingsWrapper:isChildlockOn() then
      local image_scaling = 1
      if deviceModel == "iphone4" or deviceModel == "ipad3" then
        image_scaling = 0.5
      end
      powerupChildLockPrompt({
        content = "TEXT_POWERUP_PARENTAL",
        image_scale = image_scaling
      })
    end
    settingsWrapper:toggleChildlock()
    eventManager:notify({
      id = events.EID_PARENTAL_LOCK_TOGGLED,
      toggled_on = _G.tostring(settingsWrapper:isChildlockOn())
    })
  elseif result == "ROVIO_LOGIN" then
    self.disableAdSplash = true
    if not RovioAccount.profile.id then
      if not settingsWrapper:hasPlayerRegistered() then
        notificationsFrame:addChild(RovioAccount.SyncIntroductionFrame:new())
      else
        RovioAccount.showLoadScreen("sign_in")
      end
    else
      RovioAccount.showLoadScreen("profile")
    end
  elseif result == "TOGGLE_QUALITY" then
    changeGFXQuality()
  elseif result == "TOGGLE_FULLSCREEN" then
    eventManager:notify({
      id = events.EID_TOGGLE_FULLSCREEN
    })
  elseif result == "IAP_RESTORE_CLICKED" then
    if settingsWrapper:isMightyEagleEnabled() then
      notificationsFrame:addChild(ui.MessageBox:new({
        content = "TEXT_MIGHTY_EAGLE_RESTORE_UNNECESSARY"
      }))
    else
      local restore_func = function()
        iapRestoreItems("iosEagleRestoreCallback")
      end
      notificationsFrame:addChild(ui.ConfirmPrompt:new({
        title = "TEXT_MIGHTY_EAGLE_RESTORE_QUERY",
        confirmOnLeft = deviceModel ~= "osx",
        confirm_call = restore_func
      }))
    end
  elseif result == "GOTO_TRAILER" then
    gotoAngryBirdsTrailer()
  elseif result == "GOTO_EAGLE_TRAILER" then
    gotoMightyEagleTrailer()
  elseif result == "GOTO_FACEBOOK" then
    gotoFacebook()
  elseif result == "GOTO_TWITTER" then
    gotoTwitter()
  elseif result == "GOTO_SINA_WEIBO" then
    gotoSinaWeibo()
  elseif result == "GOTO_TENCENT_WEIBO" then
    gotoTencentWeibo()
  elseif result == "GOTO_QZONE" then
    gotoQzone()
  elseif result == "GOTO_RENREN" then
    gotoRenren()
  elseif result == "ABID_CLICKED" then
    eventManager:notify({
      id = events.EID_ABID_CLICKED
    })
  elseif result == "EXIT" then
    eventManager:notify({
      id = events.EID_EXIT_GAME
    })
  elseif result == "OPEN_REGISTER_WINDOW" then
    eventManager:notify({
      id = events.EID_SHOW_REGISTRATION_DIALOG,
      from = "MAIN_MENU",
      success_call = function()
        self:refreshMiddleButtons()
      end
    })
  elseif result == "UPDATE_GAME" then
    self:updatePrompt()
  elseif result == "OPEN_AD_SPLASH_LINK" then
    eventManager:notify({
      id = events.EID_POP_FRAME
    })
    if _G.magicplaces and _G.string.find(mainMenuAdUrl, "magicplaces") ~= nil then
      eventManager:notify({
        id = events.EID_MAGIC_PLACES_CLICKED,
        from = "MAIN_MENU"
      })
    else
      openURL(generateRedirectURL(g_variant, mainMenuAdUrl))
    end
  elseif result == "CLOSE_AD_SPLASH" then
    eventManager:notify({
      id = events.EID_POP_FRAME
    })
  elseif result == "OPEN_SHOP" then
    do
      local goto_shop = {
        id = events.EID_CHANGE_SCENE,
        target = ProductPage:new({
          from = "MAIN_MENU",
          product = g_shop_products[1]
        })
      }
      local profileName = selectFontProfile()
      eventManager:notify({
        id = events.EID_DO_LOADING,
        items = {
          function()
            releaseImages({
              "LEVELSELECTION",
              "TUTORIALS"
            })
            _G.res.createBitmapFont(fontPath .. "/" .. profileName .. "/FONT_SHOP_AMOUNT.dat")
            loadAssets({"SHOP"})
          end
        },
        completion_event = goto_shop
      })
    end
  elseif result == "OPEN_SHOP_DISABLED" then
    local image_scaling = 1
    if deviceModel == "iphone4" or deviceModel == "ipad3" then
      image_scaling = 0.5
    end
    powerupChildLockPrompt({image_scale = image_scaling})
  elseif eventType ~= "HOVER" then
    for i = 1, #g_bird_animations do
      if g_bird_animations[i].layer == 5 then
        g_bird_animations[i].renderState = true
        if self:checkBirdBounds(g_bird_animations[i], cursor.x, cursor.y) and g_bird_animations[i].yelling ~= true and _G.string.sub(g_bird_animations[i].sprite, 1, 4) == "BIRD" then
          local bird_sprite_sound_mapping = {
            BIRD_RED = "bird_01_flying",
            BIRD_BLUE = "bird_02_flying",
            BIRD_YELLOW = "bird_03_flying",
            BIRD_GREY = "bird_04_flying",
            BIRD_GREEN = "bird_05_flying",
            BIRD_BIG_BROTHER = "big_brother_flying",
            BIRD_BOOMERANG = "bird_06_flying",
            BIRD_PUFFER_1 = "Globe_Bird_Launch_3",
            BIRD_PINK = "pink_activate_01"
          }
          g_bird_animations[i].yelling = true
          _G.res.playAudio(bird_sprite_sound_mapping[g_bird_animations[i].sprite], 1, false, 0)
          g_bird_animations[i].sprite = g_bird_animations[i].yell_sprite
        end
      end
    end
  else
    return result, meta, item
  end
  return nil, nil, nil
end
function MainMenu:eventTriggered(event)
  if event.id == events.EID_UPDATE_AVAILABLE then
    self:getChild("update_button"):setVisible(true)
    self:updatePrompt()
  elseif event.id == events.EID_AUDIO_STATE_CHANGED then
    if event.from == "KEYBOARD_COMMAND" then
      local audio_button = self:getChild("optionsSlider"):getChild("soundButton")
      if settingsWrapper:isAudioEnabled() then
        audio_button:setState(2)
      else
        audio_button:setState(1)
      end
    end
  elseif event.id == events.EID_IAP_ITEMS_RESTORED then
    self:refreshMiddleButtons()
  elseif event.id == events.EID_SERVICE_AVAILABILITY_CHANGED then
    if (event.serviceName == "magicplaces" or event.serviceName == "identityLevel2") and event.available == true then
      self:refreshMiddleButtons()
    end
  elseif event.id == events.EID_ROVIO_ID_LOGIN_SUCCESS then
    local rovio_login_button = self:getChild("rovio_login_button")
    rovio_login_button:setState("LOGGED")
  elseif event.id == events.EID_ROVIO_ID_LOGOUT then
    self:getChild("rovio_login_button"):setState("NOT_LOGGED")
  end
end
function MainMenuRoot:checkBirdBounds(bird, x, y)
  local width, height = _G.res.getSpriteBounds(bird.sprite)
  local pivotX, pivotY = _G.res.getSpritePivot(bird.sprite)
  local scaleCorrectionX, scaleCorrectionY = 0, 0
  local xs, ys = bird.ys or bird.xs or 1, 1
  if bird.scale ~= nil then
    xs, ys = bird.scale, bird.scale
  end
  if xs ~= 1 then
    scaleCorrectionX = (width * xs - width) / 2
  end
  if ys ~= 1 then
    scaleCorrectionY = (height * ys - height) / 2
  end
  return y >= bird.y - pivotY - scaleCorrectionY and y <= bird.y - pivotY + height + scaleCorrectionY and x >= bird.x - pivotX - scaleCorrectionX and x <= bird.x - pivotX + width + scaleCorrectionX
end
MainMenuEaglePage = MainMenuRoot:inherit()
function MainMenuEaglePage:prepareForDynamicAssets()
  dynamic.setRequirements(self, {
    "mightyEagleDemoPage",
    settingsWrapper:getCurrentMainMenuTheme()
  })
end
function MainMenuEaglePage:init()
  local eagle_frame = MEPage:new()
  self:addChild(eagle_frame)
end
function MainMenuEaglePage:onEntry()
  MainMenuRoot.onEntry(self)
end
function MainMenuEaglePage:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "MAIN_MENU"
    })
  elseif result == "EAGLE_PURCHASE_CLICKED" then
    goToMightyEaglePaymentPage(false)
  end
  return result, meta, item
end
function MainMenuEaglePage:onKeyEvent(eventType, key)
  if eventType == "RELEASE" and key == "BACK" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "MAIN_MENU"
    })
  end
end
MainMenuEaglePurchasePage = MainMenuRoot:inherit()
function MainMenuEaglePurchasePage:init()
  local purchase_frame = EaglePurchasePage:new()
  self:addChild(purchase_frame)
end
function MainMenuEaglePurchasePage:prepareForDynamicAssets()
  dynamic.setRequirements(self, {
    "mightyEagleDemoPage",
    settingsWrapper:getCurrentMainMenuTheme()
  })
end
filename = "main_menu.lua"
