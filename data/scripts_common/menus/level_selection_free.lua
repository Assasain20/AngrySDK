LevelSelectionFree = ui.Frame:inherit()
function LevelSelectionFree:init()
  ui.Frame.init(self)
  self.backgroundColour = {
    r = 255,
    g = 255,
    b = 255,
    a = 255
  }
  local scroll = ui.ScrollFrame:new()
  scroll.name = "level_buttons"
  self:addChild(scroll)
  LevelSelection.createDecorationSprites(self)
  local back_button = ui.ImageButton:new()
  back_button.name = "back_button"
  back_button:setImage("ARROW_LEFT")
  back_button.returnValue = "GOTO_MAIN_MENU"
  back_button.attach = "fixed"
  back_button.activateOnRelease = true
  back_button.clickSound = "menu_back"
  self:addChild(back_button)
  self:createEpisodes(scroll)
end
function LevelSelectionFree:createEpisodes(scroll)
  for k, v in _G.ipairs(g_episodes[1].pages) do
    local box = ui.Image:new()
    box.name = "ep" .. k .. "box"
    box:setImage("BLOCK_LIGHT_4X4_4")
    scroll:addChild(box)
  end
  for k, v in _G.ipairs(g_episodes[1].pages) do
    local number = ui.Image:new()
    number.name = "ep" .. k .. "number"
    number:setImage("REWARD_" .. k)
    scroll:addChild(number)
  end
  for k, v in _G.ipairs(g_episodes[1].pages) do
    for k2, v2 in _G.ipairs(v.levels) do
      local level = ui.ImageButton:new()
      level.name = "level" .. k .. "-" .. k2
      level:setImage(v.level_button, "LS_LEVEL_BG_NORMAL_CLOSED")
      level.returnValue = "GOTO_LEVEL"
      level.activateOnRelease = true
      scroll:addChild(level)
      level.meta = {
        episode = 1,
        page = k,
        level = k2,
        levelName = v2.name,
        intro_cutscene = v2.intro_cutscene,
        flurryId = v2.flurryId
      }
    end
  end
  for k, v in _G.ipairs(g_episodes[1].pages) do
    for k2, v2 in _G.ipairs(v.levels) do
      local number = ui.Text:new()
      number.name = "level" .. k .. "-" .. k2 .. "number"
      number.font = fontBasic
      number.text = _G.tostring(k2)
      scroll:addChild(number)
    end
  end
end
function LevelSelectionFree:onPointerEvent(type, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, type, x, y)
  if result == "GOTO_MAIN_MENU" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "MAIN_MENU"
    })
  elseif result == "GOTO_LEVEL" then
    eventManager:notify({
      id = events.EID_CHANGE_LEVEL,
      data = meta,
      from = "levelselection menu"
    })
  end
  return result, meta, item
end
function LevelSelectionFree:update(dt, time)
  if _G.res.isAudioPlaying(currentMainMenuSong) == false and currentMainMenuSong ~= nil then
    _G.res.playAudio(currentMainMenuSong, 0.8, true, 7)
  end
  ui.Frame.update(self, dt, time)
end
function LevelSelectionFree:draw(x, y)
  drawLevelSelectionBackground()
  ui.Frame.draw(self, x, y)
end
function LevelSelectionFree:layout()
  ui.Frame.layout(self)
  do
    local left = self:getChild("left")
    left.y = screenHeight
    local right = self:getChild("right")
    right.x = screenWidth
    right.y = screenHeight
  end
  do
    local back_button = self:getChild("back_button")
    local sw, sh = _G.res.getSpriteBounds(back_button.image)
    back_button.x = sw * 0.5
    back_button.y = screenHeight - sh * 0.5
  end
  local x_padding = 0.25
  local y_padding = 0.35
  local cols = 2
  local rows = 2
  local scroll = self:getChild("level_buttons")
  local page = 1
  local row = 1
  local col = 1
  for k, v in _G.ipairs(g_episodes[1].pages) do
    local box = scroll:getChild("ep" .. k .. "box")
    box.x = (page - 1 + x_padding + (1 - 2 * x_padding) / (cols - 1) * (col - 1)) * screenWidth
    box.y = (y_padding + (1 - 2 * y_padding) / (rows - 1) * (row - 1)) * screenHeight
    local ls_sprite = v.level_button
    local lsw, _ = _G.res.getSpriteBounds(ls_sprite)
    local number = scroll:getChild("ep" .. k .. "number")
    number.x = box.x - lsw * 2.25
    number.y = box.y
    for k2, v2 in _G.ipairs(v.levels) do
      local button = scroll:getChild("level" .. k .. "-" .. k2)
      button.x = box.x - lsw * 1.1 * ((#v.levels - 1) * 0.5) + lsw * (k2 - 1)
      button.y = box.y
      local number = scroll:getChild("level" .. k .. "-" .. k2 .. "number")
      number.x = button.x
      number.y = button.y
    end
    col = col + 1
    if cols < col then
      col = 1
      row = row + 1
      if rows < row then
        row = 1
        page = page + 1
      end
    end
    box.scaleX = 5
    box.scaleY = 2
  end
end
filename = "level_selection_free.lua"
