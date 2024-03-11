g_tutorialSprites = {
  TUTORIAL_1 = "TUTORIAL_RED",
  TUTORIAL_2 = "TUTORIAL_BLUE",
  TUTORIAL_3 = "TUTORIAL_YELLOW",
  TUTORIAL_4 = "TUTORIAL_BLACK",
  TUTORIAL_5 = "TUTORIAL_WHITE",
  TUTORIAL_6 = "TUTORIAL_BOOMERANG",
  TUTORIAL_7 = "TUTORIAL_BIG_BROTHER",
  TUTORIAL_8 = "TUTORIAL_MIGHTYEAGLE",
  TUTORIAL_9 = "TUTORIAL_PUFFER"
}
function showTrackpadTutorials()
  return not g_usingGestureControls and g_usedGestureControls and isInFullScreenMode()
end
g_platformTutorials = {
  osx = {
    {
      id = "TUTORIAL_OSX_1",
      sprite = "TUTORIAL_TRACKPAD_1",
      ignore_size = true,
      condition = showTrackpadTutorials
    },
    {
      id = "TUTORIAL_OSX_2",
      sprite = "TUTORIAL_TRACKPAD_2",
      ignore_size = true,
      condition = showTrackpadTutorials
    },
    {
      id = "TUTORIAL_OSX_3",
      sprite = "TUTORIAL_TRACKPAD_3",
      ignore_size = true,
      condition = showTrackpadTutorials
    },
    {
      id = "TUTORIAL_OSX_4",
      sprite = "TUTORIAL_TRACKPAD_4",
      ignore_size = true,
      condition = showTrackpadTutorials
    }
  },
  roku = {
    {
      id = "TUTORIAL_ROKU_1",
      sprite = "TUTORIAL_CAMERA",
      ignore_size = true
    },
    {
      id = "TUTORIAL_ROKU_2",
      sprite = "TUTORIAL_ZOOMING",
      ignore_size = true
    }
  }
}
function addTutorial(list, tutorial)
  if _G.type(tutorial) == "string" then
    _G.table.insert(list, {sprite = tutorial})
    return true
  elseif _G.type(tutorial) == "table" and (not tutorial.condition or tutorial.condition and tutorial.condition()) then
    _G.table.insert(list, tutorial)
    return true
  end
  return false
end
function getTutorialSprite(tutorial)
  if _G.type(tutorial) == "string" then
    return tutorial
  elseif _G.type(tutorial) == "table" then
    return tutorial.sprite
  end
  return nil
end
Tutorial = ui.BackgroundBox:inherit()
function Tutorial:new(tutorial, o)
  local o = o or {}
  o.tutorial = tutorial
  return ui.BackgroundBox.new(self, o)
end
function Tutorial:init()
  ui.BackgroundBox.init(self)
  self.hanchor = "HCENTER"
  self.vanchor = "VCENTER"
  self.components = {
    left = "TUTORIAL_LEFT",
    bottomLeft = "TUTORIAL_BOTTOM_LEFT",
    bottomMiddle = "TUTORIAL_BOTTOM_MIDDLE",
    bottomRight = "TUTORIAL_BOTTOM_RIGHT",
    right = "TUTORIAL_RIGHT",
    topRight = "TUTORIAL_TOP_RIGHT",
    topMiddle = "TUTORIAL_TOP_MIDDLE",
    topLeft = "TUTORIAL_TOP_LEFT",
    center = "TUTORIAL_CENTER"
  }
  local tutorial = ui.Image:new()
  tutorial.name = "tutorial"
  if _G.type(self.tutorial) == "table" then
    tutorial:setImage(self.tutorial.sprite)
    self.tutorial_sprite = self.tutorial.sprite
  elseif _G.type(self.tutorial) == "string" then
    tutorial:setImage(g_tutorialSprites[self.tutorial])
    self.tutorial_sprite = g_tutorialSprites[self.tutorial]
  end
  self:addChild(tutorial)
  if self.tutorial == "TUTORIAL_5" and not settingsWrapper:isGoldenEggUnlocked("LevelGE_4") and g_tutorialActive and g_tutorialActive.from == "PAUSE_PAGE" and not g_white_bird_tutorial_ge_disabled then
    local golden_egg = ui.ImageButton:new()
    golden_egg.name = "goldenEgg"
    golden_egg:setImage("GOLDEN_EGG_1")
    golden_egg.scaleX = 0.4
    golden_egg.scaleY = 0.4
    golden_egg.returnValue = "COLLECT_GOLDEN_EGG"
    self:addChild(golden_egg)
  end
  local close = ui.ImageButton:new()
  close.name = "close"
  close:setImage("TUTORIAL_OK")
  close.returnValue = "CLOSE_TUTORIAL"
  self:addChild(close)
end
function Tutorial:onEntry()
  ui.BackgroundBox.onEntry(self)
  if g_isAccelerometerControl then
    g_rokuCursorVisible = false
  end
end
function Tutorial:onExit()
  ui.BackgroundBox.onExit(self)
  if g_isAccelerometerControl then
    g_rokuCursorVisible = true
  end
end
function Tutorial:layout()
  ui.BackgroundBox.layout(self)
  local sx = 1
  local sy = 1
  if isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
  end
  self.x = screenWidth * 0.5
  self.y = screenHeight * 0.5
  local max_w = 0
  local max_h = 0
  for _, v in _G.pairs(g_tutorialSprites) do
    local x1, y1, x2, y2 = _G.res.getCompoSpriteBounds(v)
    local w = x2 - x1
    local h = y2 - y1
    if max_w < w then
      max_w = w
    end
    if max_h < h then
      max_h = h
    end
  end
  if g_platformTutorials and g_platformTutorials[deviceModel] then
    for _, v in _G.pairs(g_platformTutorials[deviceModel]) do
      if not v.ignore_size then
        local x1, y1, x2, y2 = _G.res.getCompoSpriteBounds(v.sprite)
        local w = x2 - x1
        local h = y2 - y1
        if max_w < w then
          max_w = w
        end
        if max_h < h then
          max_h = h
        end
      end
    end
  end
  local x1, y1, x2, y2 = _G.res.getCompoSpriteBounds(self.tutorial_sprite)
  local w = x2 - x1
  local h = y2 - y1
  if max_w < w then
    max_w = w
  end
  if max_h < h then
    max_h = h
  end
  self.width = max_w * sx
  self.height = max_h * sy
  local x1, y1, x2, y2 = _G.res.getCompoSpriteBounds(self:getChild("tutorial").image)
  local sw = x2 - x1
  local sh = y2 - y1
  local golden_egg = self:getChild("goldenEgg")
  if golden_egg then
    golden_egg.x = sw * 0.18 * sx
    golden_egg.y = sh * -0.1 * sy
  end
  local close = self:getChild("close")
  close.x = max_w * 0.35 * sx
  close.y = max_h * 0.6 * sy
  for _, v in _G.ipairs(self.children) do
    v.scaleX = sx
    v.scaleY = sy
  end
end
function Tutorial:collectGoldenEgg()
  local golden_egg = self:getChild("goldenEgg")
  if golden_egg then
    golden_egg.visible = false
    eventManager:notify({
      id = events.EID_GOLDEN_EGG_FROM_MENU,
      levelName = "LevelGE_4"
    })
  end
end
if not g_isAccelerometerControl then
  function Tutorial:onPointerEvent(eventType, x, y)
    local result, meta, item = ui.BackgroundBox.onPointerEvent(self, eventType, x, y)
    if result == "COLLECT_GOLDEN_EGG" then
      self:collectGoldenEgg()
    elseif result == "CLOSE_TUTORIAL" then
      eventManager:notify({
        id = events.EID_CLOSE_TUTORIAL
      })
      skipInput = true
    end
    return result, meta, item
  end
else
  function Tutorial:onPointerEvent(eventType, x, y)
    if eventType == "LRELEASE" then
      eventManager:notify({
        id = events.EID_CLOSE_TUTORIAL
      })
      skipInput = true
    end
  end
  function Tutorial:onKeyEvent(eventType, key)
    if eventType == "RELEASE" and key == "BUTTON_A" then
      self:collectGoldenEgg()
    end
  end
end
function Tutorial:draw(x, y)
  drawRect(0, 0, 0, 0.65, 0, 0, screenWidth, screenHeight, false)
  ui.BackgroundBox.draw(self, x, y)
end
filename = "tutorials.lua"
