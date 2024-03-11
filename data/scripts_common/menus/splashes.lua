RovioSplash = ui.Frame:new()
function RovioSplash:init()
  ui.Frame.init(self)
  self.backgroundColour = {
    r = 255,
    g = 255,
    b = 255,
    a = 255
  }
  local rovio_logo = ui.Image:new()
  rovio_logo.name = "rovio_logo"
  rovio_logo:setImage("SPLASH_ROVIO")
  self:addChild(rovio_logo)
  local copyright = ui.Image:new()
  copyright.name = "copyright"
  if deviceModel == "android" and screenWidth < 480 then
    copyright:setImage("COPYRIGHT_TEXT_QVGA")
  else
    copyright:setImage("COPYRIGHT_TEXT")
  end
  self:addChild(copyright)
end
function RovioSplash:layout()
  ui.Frame.layout(self)
  local rovio_logo = self:getChild("rovio_logo")
  rovio_logo.x = screenWidth * 0.5
  rovio_logo.y = screenHeight * 0.5
  local sw, sh = _G.res.getSpriteBounds(rovio_logo.image)
  if sh > 0.7 * screenHeight then
    rovio_logo.scaleX = 0.7 * screenHeight / sh
    rovio_logo.scaleY = 0.7 * screenHeight / sh
  else
    rovio_logo.scaleX = 1
    rovio_logo.scaleY = 1
  end
  local copyright = self:getChild("copyright")
  copyright.x = screenWidth * 0.5
  copyright.y = screenHeight
end
function RovioSplash:onEntry()
  ui.Frame.onEntry(self)
  self.timer = 0
end
function RovioSplash:update(dt, time)
  ui.Frame.update(self, dt, time)
  self.timer = self.timer + dt
  if self.timer >= 3 then
    self:nextSplash()
  end
end
function RovioSplash:onPointerEvent(event, x, y)
  if event == "LPRESS" then
    self:nextSplash()
  end
end
function RovioSplash:nextSplash()
  if not self.closing then
    self.closing = true
    eventManager:notify({
      id = events.EID_CONTINUE_MENU_SEQUENCE
    })
  end
end
AngryBirdsSplash = ui.Frame:new()
function AngryBirdsSplash:init()
  ui.Frame.init(self)
  self.backgroundColour = {
    r = 0,
    g = 0,
    b = 0,
    a = 255
  }
  local bg = ui.Image:new()
  bg.name = "bg"
  bg:setImage("SPLASH_ANGRY_BIRDS")
  self:addChild(bg)
  local loading = ui.Image:new()
  loading.name = "loading"
  self:addChild(loading)
end
function AngryBirdsSplash:layout()
  ui.Frame.layout(self)
  local bg = self:getChild("bg")
  bg.x = screenWidth * 0.5
  bg.y = screenHeight * 0.5
  local sw, sh = _G.res.getSpriteBounds(bg.image)
  local scale = _G.math.min(screenHeight / sh, screenWidth / sw)
  bg.scaleX = scale
  bg.scaleY = scale
  local loading = self:getChild("loading")
  loading:setImage(_G.res.getString("TEXTS_BASIC", "TEXT_SPLASH_LOADING_SPRITE"))
  loading.x = screenWidth
  loading.y = screenHeight
end
function AngryBirdsSplash:onEntry()
  ui.Frame.onEntry(self)
  self.draw_count = 0
end
function AngryBirdsSplash:onExit()
  ui.Frame.onExit(self)
  if useDynamicAssets then
    dynamic.release("splashes")
  else
    releaseImages({"SPLASHES"})
  end
end
function AngryBirdsSplash:update(dt, time)
  ui.Frame.update(self, dt, time)
  if self.draw_count == 3 then
    if shouldShowAd() then
      requestAndShowVideo()
    end
    createAssets()
    initialize()
    setTheme(settingsWrapper:getCurrentMainMenuTheme())
    setGameMode(function()
    end)
  end
  if self.draw_count == 4 then
    startMenuFlow()
  end
end
function AngryBirdsSplash:draw(x, y)
  ui.Frame.draw(self, x, y)
  self.draw_count = self.draw_count + 1
end
filename = "splashes.lua"
