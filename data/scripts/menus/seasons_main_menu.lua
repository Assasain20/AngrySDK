SeasonsMainMenu = MainMenu:inherit()
function SeasonsMainMenu:init()
  MainMenu.init(self)
  self.name = "mainMenu"
  g_menu_particle_scale = 1
  self.drawParticlesBeforeForeground = false
  self.playEvent = {
    id = events.EID_CHANGE_SCENE,
    target = "PLAY",
    from = "MAIN_MENU",
    dontClearParticles = true
  }
  if g_updateCheckEnabled then
    self:getChild("update_button"):setImage("BUTTON_SEASONS_ONLINE")
  end
end
function SeasonsMainMenu:prepareForDynamicAssets()
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  if blockTable.themes[theme].menuTheme then
    theme = blockTable.themes[theme].menuTheme
  end
  dynamic.setRequirements(self, {
    "mainMenu",
    theme,
    theme .. "_menu"
  })
end
function SeasonsMainMenu:onEntry()
  MainMenu.onEntry(self)
  if notificationsFrame then
    notificationsFrame:layout()
  end
  if not self.isNewYearLevelChecked and not settingsWrapper:isGoldenEggUnlocked("LevelX3_NewYear") then
    self.isNewYearLevelChecked = true
    if not g_levelCheckSystem then
      g_newYearCheckTimer = 0
      _G.table.insert(g_updatableFunctions, updateNewYearCheck)
    end
  end
end
function SeasonsMainMenu:draw(x, y, scaleX, scaleY, angle)
  self:drawSelf()
  if not self.drawParticlesBeforeForeground then
    drawMenuParticlesInAdvance()
  end
  ui.Frame.draw(self, x, y, scaleX, scaleY, angle)
end
function SeasonsMainMenu:drawSelf()
  if not settingsWrapper:isGfxLowQuality() then
    drawBackgroundNative()
  end
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  if blockTable.themes[theme].playButtonBackground then
    self:drawPlayButtonBackground(blockTable.themes[theme].playButtonBackground)
  end
  self:drawBirds()
  if self.drawParticlesBeforeForeground then
    drawMenuParticlesInAdvance()
  end
  drawForegroundNative()
end
function SeasonsMainMenu:drawPlayButtonBackground(background)
  local moonScale = screenHeight / 320 * 0.8 * (background.scale or 1)
  local x = screenWidth * background.x
  local y = screenHeight * background.y
  setRenderState(0, 0, moonScale, moonScale, 0)
  _G.res.drawSprite(background.image, x / moonScale, y / moonScale, "HCENTER", "VCENTER")
  setRenderState(0, 0, 1, 1, 0)
end
function SeasonsMainMenu:layout()
  MainMenu.layout(self)
  self.theme = settingsWrapper:getCurrentMainMenuTheme()
  local theme = self.theme
  if blockTable.themes[theme].menuTheme then
    theme = blockTable.themes[theme].menuTheme
    setTheme(theme)
    settingsWrapper:setCurrentMainMenuTheme(theme)
  end
  local game_logo = self:getChild("gameLogo")
  game_logo:setImage(blockTable.themes[theme].logoImage or "MENU_LOGO")
  if blockTable.themes[theme].particles and blockTable.themes[theme].particles.drawBeforeForeground then
    self.drawParticlesBeforeForeground = true
  else
    self.drawParticlesBeforeForeground = false
  end
  mainMenuParticleSystem:layout()
end
function SeasonsMainMenu:update(dt, time)
  MainMenu.update(self, dt, time)
  if gameCompletionUpsellReadyToBeShown then
    gameCompletionUpsellReadyToBeShown = false
    self:showGameCompletionUpsellPopup()
    settingsWrapper:setGameCompletionUpsellShown(true)
  end
  if self.levelCheckSystem and self.levelCheckSystem:update() then
    self.levelCheckSystem = nil
  end
  mainMenuParticleSystem:update(dt, time)
end
function SeasonsMainMenu:showGameCompletionUpsellPopup()
  local ad = GameCompletionUpsellSplashPage:new()
  eventManager:notify({
    id = events.EID_PUSH_FRAME,
    target = ad
  })
end
function SeasonsMainMenu:onPointerEvent(eventType, x, y)
  local result, meta, item = MainMenu.onPointerEvent(self, eventType, x, y)
  if result == "OPEN_GAME_COMPLETION_UPSELL_SPLASH_LINK" then
    openURL(generateRedirectURL(g_variant, gameCompletionUpsellUrl))
  elseif result == "CLOSE_GAME_COMPLETION_UPSELL_SPLASH" then
    eventManager:notify({
      id = events.EID_POP_FRAME
    })
  else
    return result, meta, item
  end
  return nil, nil, nil
end
function MainMenuRoot:buildBirdList()
  g_bird_sprites = {}
  local tutorials = settingsWrapper:getTutorials()
  for k, v in _G.pairs(tutorials) do
    if k == "BAIT_SARDINE" or k == "DRAGON_FISH" then
      _G.table.insert(g_bird_sprites, {sprite = k, reward = 1})
    else
      _G.table.insert(g_bird_sprites, {sprite = k, reward = 0})
    end
  end
  if #g_bird_sprites == 0 then
    _G.table.insert(g_bird_sprites, {sprite = "BIRD_RED", reward = 0})
  end
  for _, k in _G.ipairs(g_episodeIds) do
    local v = g_episodes[k]
    local types = {projectile = 1, balloon = 2}
    if settingsWrapper:isEpisodeThreeStarred(k) and v.reward_three_stars then
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_three_stars.sprite,
        reward = types[v.reward_three_stars.type]
      })
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_three_stars.sprite,
        reward = types[v.reward_three_stars.type]
      })
    elseif isEpisodeComplete(k) and v.reward_completion then
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_completion.sprite,
        reward = types[v.reward_completion.type]
      })
      _G.table.insert(g_bird_sprites, {
        sprite = v.reward_completion.sprite,
        reward = types[v.reward_completion.type]
      })
    end
  end
  local feathers, max_feathers = calculateAllFeathers()
  if feathers >= 200 then
    _G.table.insert(g_bird_sprites, {
      sprite = "REWARD_EAGLE",
      reward = 1
    })
    _G.table.insert(g_bird_sprites, {
      sprite = "REWARD_EAGLE",
      reward = 1
    })
  end
end
GameCompletionUpsellSplashPage = AdSplashPage:inherit()
function GameCompletionUpsellSplashPage:init()
  ui.Image.init(self)
  self:setImage("GAME_COMPLETION_UPSELL_IMAGE")
  local ok_button = ui.ImageButton:new()
  ok_button.name = "ok_button"
  ok_button:setImage("MENU_YES")
  ok_button.returnValue = "OPEN_GAME_COMPLETION_UPSELL_SPLASH_LINK"
  ok_button.activateOnRelease = true
  self:addChild(ok_button)
  local cancel_button = ui.ImageButton:new()
  cancel_button.name = "cancel_button"
  cancel_button:setImage("MENU_NO")
  cancel_button.returnValue = "CLOSE_GAME_COMPLETION_UPSELL_SPLASH"
  cancel_button.activateOnRelease = true
  self:addChild(cancel_button)
end
function updateNewYearCheck(dt, time)
  if g_levelCheckSystem then
    if g_levelCheckSystem:update(dt, time) then
      g_levelCheckSystem = nil
    end
  elseif g_newYearCheckTimer then
    g_newYearCheckTimer = g_newYearCheckTimer - dt
    if g_newYearCheckTimer <= 0 then
      g_levelCheckSystem = subsystems.CalendarSubsystem:new({
        data = {
          level = 31,
          episode = 15,
          no_popup = true,
          year = 2012,
          month = 12
        },
        success_event = {
          id = events.EID_GOLDEN_EGG_FROM_MENU,
          levelName = "LevelX3_NewYear"
        }
      })
      g_newYearCheckTimer = 3600
    end
  end
end
filename = "seasons_main_menu.lua"
