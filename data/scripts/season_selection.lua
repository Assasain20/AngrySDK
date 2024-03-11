SeasonSelection = MainMenuRoot:inherit()
function SeasonSelection:init()
  if not settingsWrapper:getNewSeasonVisited() then
    self.new_season = self.seasons[#self.seasons]
    local halo = ui.Image:new()
    halo:setImage("GOLDEN_EGG_STAR_EFFECT")
    halo.name = "halo"
    halo.angle = 0
    halo.scaleX = 1.5
    halo.scaleY = 1.5
    self:addChild(halo)
  end
  for _, y in _G.ipairs(self.seasons) do
    local season_button = ui.ImageButton:new()
    season_button:setImage("SEASONS_" .. y .. "_CHOISE_BUTTON")
    season_button.returnValue = "SEASON_" .. y
    season_button.activateOnRelease = true
    season_button.name = "season_button_" .. y
    self:addChild(season_button)
  end
  local backButton = ui.ImageButton:new()
  backButton.name = "backButton"
  backButton:setImage("ARROW_LEFT")
  backButton.returnValue = "MAIN_MENU"
  backButton.attach = "fixed"
  backButton.activateOnRelease = true
  backButton.clickSound = "menu_back"
  self:addChild(backButton)
  self.name = "seasonSelection"
  self.drawParticlesBeforeForeground = false
end
function SeasonSelection:prepareForDynamicAssets()
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  if blockTable.themes[theme].menuTheme then
    theme = blockTable.themes[theme].menuTheme
  end
  dynamic.setRequirements(self, {
    "seasonSelection",
    theme
  })
end
function SeasonSelection:onEntry()
  MainMenuRoot.onEntry(self)
  local halo = self:getChild("halo")
  if halo and settingsWrapper:getNewSeasonVisited() then
    halo:setVisible(false)
  end
end
function SeasonSelection:draw(x, y, scaleX, scaleY, angle)
  self:drawSelf()
  if not self.drawParticlesBeforeForeground then
    drawMenuParticlesInAdvance()
  end
  ui.Frame.draw(self, x, y, scaleX, scaleY, angle)
end
function SeasonSelection:onPointerEvent(eventType, x, y)
  local result, meta, item = MainMenuRoot.onPointerEvent(self, eventType, x, y)
  if eventType == "LRELEASE" and result then
    local clearParticles = false
    if result ~= "MAIN_MENU" then
      mainMenuParticleSystem:setFirstFrame()
      clearParticles = true
      _G.res.playAudio("menu_confirm", 1, false)
    end
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = result,
      from = "PLAY",
      dontClearParticles = not clearParticles
    })
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
  end
  if not settingsWrapper:getNewSeasonVisited() and result == "SEASON_" .. self.new_season then
    settingsWrapper:setNewSeasonVisited()
  end
  return result, meta, item
end
function SeasonSelection:onKeyEvent(eventType, key)
  local result, meta, item = MainMenuRoot.onKeyEvent(self, eventType, key)
  if not result and eventType == "RELEASE" and (key == "BACK" or key == "ESCAPE") then
    local clearParticles = false
    if result ~= "MAIN_MENU" then
      clearParticles = true
    end
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "MAIN_MENU",
      from = "YEAR",
      dontClearParticles = not clearParticles
    })
  end
  return result, meta, item
end
function SeasonSelection:drawSelf()
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
function SeasonSelection:layout()
  for i, y in _G.ipairs(self.seasons) do
    local b = self:getChild("season_button_" .. y)
    b.x = (1 + #self.seasons - i) * screenWidth / (#self.seasons + 1)
    b.y = screenHeight * 0.5
    if not settingsWrapper:getNewSeasonVisited() and y == self.new_season then
      local halo = self:getChild("halo")
      halo.x = b.x
      halo.y = b.y
    end
  end
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  if blockTable.themes[theme].menuTheme then
    theme = blockTable.themes[theme].menuTheme
    setTheme(theme)
    settingsWrapper:setCurrentMainMenuTheme(theme)
  end
  local back_button = self:getChild("backButton")
  back_button:refresh()
  back_button.x = back_button.w * 0.5 + g_layoutMargin.x
  back_button.y = screenHeight - back_button.h * 0.5 - g_layoutMargin.y
  if deviceModel == "roku" then
    back_button.y = back_button.h * 0.5 + g_layoutMargin.y
  end
  MainMenuRoot.layout(self)
  if blockTable.themes[theme].particles and blockTable.themes[theme].particles.drawBeforeForeground then
    self.drawParticlesBeforeForeground = true
  else
    self.drawParticlesBeforeForeground = false
  end
  mainMenuParticleSystem:layout()
end
function SeasonSelection:update(dt, time)
  MainMenuRoot.update(self, dt, time)
  mainMenuParticleSystem:update(dt, time)
  if not settingsWrapper:getNewSeasonVisited() then
    local halo = self:getChild("halo")
    halo.angle = halo.angle + dt * 0.6
  end
end
function SeasonSelection:drawPlayButtonBackground(background)
  local moonScale = screenHeight / 320 * 0.8 * (background.scale or 1)
  local x = screenWidth * background.x
  local y = screenHeight * background.y
  setRenderState(0, 0, moonScale, moonScale, 0)
  _G.res.drawSprite(background.image, x / moonScale, y / moonScale, "HCENTER", "VCENTER")
  setRenderState(0, 0, 1, 1, 0)
end
filename = "season_selection.lua"
