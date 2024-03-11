EditorWorldPage = ui.Frame:new()
function EditorWorldPage:new(e, p)
  local o = {}
  o.ep = e
  o.page = p
  return ui.Frame.new(self, o)
end
function EditorWorldPage:init()
  ui.Frame.init(self)
  self.ep = self.ep
  self.page = self.page
  self.backgroundColour = {
    r = 0,
    g = 0,
    b = 0,
    a = 1
  }
  local world = -1
  local world_index = 1
  for i = 1, #g_episodeIds do
    for j = 1, #g_episodes[g_episodeIds[i]].pages do
      if i == self.ep and j == self.page then
        world = world_index
      end
      world_index = world_index + 1
    end
  end
  local exitButton = ui.ImageButton:new()
  exitButton.name = "exitButton"
  exitButton:setImage("ARROW_LEFT")
  exitButton.x = exitButton.w * 0.5
  exitButton.y = screenHeight - exitButton.h * 0.5
  exitButton.returnValue = "EDITOR_MENU"
  self:addChild(exitButton)
  if p then
    local nextPage = ui.ImageButton:new()
    nextPage.name = "nextPage"
    nextPage:setImage("ARROW_LEFT")
    nextPage.scaleX = -1
    nextPage.x = screenWidth - nextPage.w * 0.5
    nextPage.y = screenHeight - nextPage.h * 0.5
  end
  local e = self.ep
  local p = self.page
  if not p then
    p = 0
    page = 0
  else
    p = p + 1
  end
  if p > #g_episodes[e].pages then
    p = 1
    for i = 1, #g_episodeIds do
      if e == g_episodeIds[i] then
        if i < #g_episodeIds then
          e = g_episodeIds[i + 1]
          break
        else
          e = nil
        end
      end
    end
  end
  if nextPage then
    if e ~= nil then
      nextPage.returnValue = "EDITOR_MENU_WORLD"
      nextPage.meta = {ep = e, page = p}
    else
      nextPage.returnValue = "EDITOR_MENU_FOLDER"
      nextPage.meta = 1
    end
    self:addChild(nextPage)
  end
  local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
  local epsCaption = ui.Text:new()
  epsCaption.font = fontBasic
  epsCaption.text = "World"
  epsCaption.x = bw * 0.3
  epsCaption.y = bh * 0.3
  epsCaption.hanchor = "LEFT"
  epsCaption.name = "epsCaption"
  self:addChild(epsCaption)
  if 0 < p then
    local epsCaption2 = ui.Text:new()
    epsCaption2.font = getFontMenu()
    epsCaption2.text = "" .. g_episodes[self.ep].pages[self.page].display_number or "0"
    epsCaption2.x = screenWidth * 0.11
    epsCaption2.y = bh * 0.3
    epsCaption2.hanchor = "LEFT"
    epsCaption2.name = "epsCaption2"
    self:addChild(epsCaption2)
  end
  local ln = 1
  if 0 < p then
    local pg = g_episodes[self.ep].pages[self.page]
    local folder = pg.folder_name
    if pg.layout == "goldeneggs" or pg.goldenEggPage == true then
      for k, v in _G.ipairs(pg.levels) do
        local lvl = ui.ImageButton:new()
        lvl.scaleX = 1
        lvl.scaleY = 1
        lvl.x = bw + v.x * bw * 1.1 * 7
        lvl.y = bh + v.y * bh * 1.1 * 3
        lvl:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
        local epNumber = ui.Text:new()
        epNumber.name = "epNumber_" .. k
        epNumber.font = "FONT_BIG_NUMBERS"
        local level_index = getLevelIndexInEpisode(v.name)
        if g_episodes[self.ep].per_page_level_numbering then
          epNumber.text = "" .. ln
        else
          epNumber.text = "" .. level_index
        end
        lvl.returnValue = "EDITOR_GOTO_LEVEL"
        lvl.meta = {
          index = k,
          index_in_theme = level_index,
          theme = self.ep,
          world = world,
          page = self.page,
          level_name = v.name,
          level_folder = folder .. "/",
          editor_page = "pack"
        }
        lvl.name = "lvl_" .. k
        lvl:addChild(epNumber)
        self:addChild(lvl)
        ln = ln + 1
      end
    else
      local rows, cols
      if pg.layout == "facebook" or pg.socialPage == true then
        cols = 3
        rows = 1
      else
        cols = pg.layout_params.cols
        rows = pg.layout_params.rows
      end
      local idx = 1
      for i = 1, rows do
        for j = 1, cols do
          if (i - 1) * cols + j > #pg.levels then
            return
          end
          local lvl = ui.ImageButton:new()
          lvl.scaleX = 1
          lvl.scaleY = 1
          lvl.x = bw * j * 1.1
          lvl.y = bh * i * 1.4
          lvl:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
          local epNumber = ui.Text:new()
          epNumber.name = "epNumber_" .. i .. "_" .. j
          epNumber.font = "FONT_BIG_NUMBERS"
          local level_index = getLevelIndexInEpisode(pg.levels[ln].name)
          if g_episodes[self.ep].per_page_level_numbering then
            epNumber.text = "" .. ln
          else
            epNumber.text = "" .. level_index
          end
          lvl.returnValue = "EDITOR_GOTO_LEVEL"
          lvl.meta = {
            index = ln,
            index_in_theme = level_index,
            theme = self.ep,
            world = world,
            page = self.page,
            level_name = pg.levels[ln].name,
            level_folder = folder .. "/",
            editor_page = "pack"
          }
          lvl.name = "lvl_" .. i .. "_" .. j
          lvl:addChild(epNumber)
          self:addChild(lvl)
          if g_show_vehicles_in_editor and self.ep == 9 then
            local vehicleButton = ui.ImageButton:new()
            vehicleButton:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
            vehicleButton.meta = {
              index = level_index,
              level_name = pg.levels[ln].name,
              level_folder = folder .. "/",
              episode = self.ep,
              episode_page = self.page
            }
            vehicleButton.returnValue = "EDITOR_MENU_EGGDEFENDER_LEVELSCRIPT"
            local vehicleText = ui.Text:new()
            vehicleText.font = fontBasic
            vehicleText.text = "Script"
            vehicleText.name = "vehicleText" .. i .. "_" .. j
            vehicleButton:addChild(vehicleText)
            vehicleButton.x = lvl.x
            vehicleButton.y = lvl.y + lvl.h * 0.7
            vehicleButton.scaleX = 0.5
            vehicleButton.scaleY = 0.5
            vehicleButton.name = "vehicleButton_" .. i .. "_" .. j
            self:addChild(vehicleButton)
          end
          ln = ln + 1
        end
      end
    end
  else
    local rows, cols
    cols = 4
    rows = 1
    local idx = 1
    for i = 1, rows do
      for j = 1, cols do
        if (i - 1) * cols + j > #g_episodes[self.ep].bonus_levels then
          return
        end
        local lvl = ui.ImageButton:new()
        lvl.name = "lvl_bonus_" .. i .. "_" .. j
        lvl.scaleX = 1
        lvl.scaleY = 1
        lvl.x = bw * j * 1.1
        lvl.y = bh * i * 1.1
        lvl:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
        local epNumber = ui.Text:new()
        epNumber.name = "epNumber_bonus_" .. i .. "_" .. j
        epNumber.font = "FONT_BIG_NUMBERS"
        local level_index = j
        if g_episodes[self.ep].per_page_level_numbering then
          epNumber.text = "" .. ln
        else
          epNumber.text = "" .. level_index
        end
        lvl.returnValue = "EDITOR_GOTO_LEVEL"
        lvl.meta = {
          index = ln,
          index_in_theme = level_index,
          theme = self.ep,
          world = world,
          level_name = g_episodes[self.ep].bonus_levels[j].name,
          level_folder = g_episodes[self.ep].bonus_levels.folder_name .. "/",
          editor_page = "pack"
        }
        lvl:addChild(epNumber)
        self:addChild(lvl)
        ln = ln + 1
      end
    end
  end
end
