EditorFolderPage = ui.Frame:new()
function EditorFolderPage:new(folder)
  local o = {}
  o.folder = folder
  return ui.Frame.new(self, o)
end
function EditorFolderPage:init()
  self.folder = self.folder
  ui.Frame.init(self)
  self.backgroundColour = {
    r = 0,
    g = 0,
    b = 0,
    a = 1
  }
  self.scrollOffset = g_scrollOffset or 15
  g_scrollOffset = self.scrollOffset
  local exitButton = ui.ImageButton:new()
  exitButton.name = "exitButton"
  exitButton:setImage("ARROW_LEFT")
  exitButton.x = exitButton.w * 0.5
  exitButton.y = screenHeight - exitButton.h * 0.5
  exitButton.returnValue = "EDITOR_MENU"
  self:addChild(exitButton)
  if _G.type(self.folder) ~= "string" then
    local nextPage = ui.ImageButton:new()
    nextPage.name = "nextPage"
    nextPage:setImage("ARROW_LEFT")
    nextPage.name = "nextPage"
    nextPage.scaleX = -1
    nextPage.x = screenWidth - nextPage.w * 0.5
    nextPage.y = screenHeight - nextPage.h * 0.5
    if self.folder < g_editLevelPacks then
      nextPage.returnValue = "EDITOR_MENU_FOLDER"
      nextPage.meta = self.folder + 1
    else
      nextPage.visible = false
    end
    self:addChild(nextPage)
    local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
    local epsCaption = ui.Text:new()
    epsCaption.name = "epsCaption"
    epsCaption.font = fontBasic
    epsCaption.text = "folder \"pack" .. self.folder .. "\""
    epsCaption.x = bw * 0.3
    epsCaption.y = bh * 0.3
    epsCaption.hanchor = "LEFT"
    self:addChild(epsCaption)
    local ln = (self.folder - 1) * g_levelsPerFolder + 1
    local idx = 1
    local rows = g_levelsPerFolder / g_levelsPerFolderRow
    local cols = g_levelsPerFolderRow
    for i = 1, rows do
      for j = 1, cols do
        local lvl = ui.ImageButton:new()
        lvl.scaleX = 1
        lvl.scaleY = 1
        lvl.x = bw * j * 1.1
        lvl.y = bh * i * 1.1
        lvl:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
        local epNumber = ui.Text:new()
        epNumber.name = "epNumber_" .. i .. "_" .. j
        epNumber.font = "FONT_BIG_NUMBERS"
        epNumber.text = "" .. ln
        lvl:addChild(epNumber)
        lvl.name = "lvl_" .. i .. "_" .. j
        self:addChild(lvl)
        if 1000 <= ln then
          epNumber.scaleX = 0.5
          epNumber.scaleY = 0.5
        elseif 100 <= ln then
          epNumber.scaleX = 0.67
          epNumber.scaleY = 0.67
        end
        if checkForLuaFile(levelPath .. "/pack" .. self.folder .. "/Level" .. ln .. ".lua") then
        else
          lvl.alpha = 0.3
        end
        lvl.returnValue = "EDITOR_GOTO_LEVEL"
        lvl.meta = {
          index = idx,
          index_in_theme = idx,
          theme = 1,
          world = -1,
          page = self.folder,
          level_name = "Level" .. ln,
          level_folder = levelPath .. "/pack" .. self.folder .. "/",
          editor_page = "folder"
        }
        ln = ln + 1
        idx = idx + 1
      end
    end
  else
    local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
    self.folderFrame = ui.Frame:new({
      name = "folderFrame"
    })
    self:addChild(self.folderFrame)
    local epsCaption = ui.Text:new()
    epsCaption.name = "epsCaption"
    epsCaption.font = fontBasic
    epsCaption.text = "folder " .. self.folder
    epsCaption.x = bw * 0.3
    epsCaption.y = bh * 0.3
    epsCaption.hanchor = "LEFT"
    self.folderFrame:addChild(epsCaption)
    self.folderFrame.y = self.scrollOffset
    local line = 1
    local idx = 0
    local rows = g_levelsPerFolder / g_levelsPerFolderRow
    local cols = g_levelsPerFolderRow
    local levelsFound = true
    local j = 1
    local files = _G.native.FileSystem.enumerate(levelPath .. "/" .. self.folder .. "/", "", 1, false)
    local sortedFiles = {}
    for n in _G.pairs(files) do
      _G.table.insert(sortedFiles, n)
    end
    _G.table.sort(sortedFiles, function(a, b)
      local aLen, bLen = _G.string.len(a), _G.string.len(b)
      return aLen < bLen and true or aLen == bLen and a < b or false
    end)
    flaggedLevels = {}
    friendsUsedLevels = {
      pages = {}
    }
    local pageIndex = 1
    loadLuaFileToObject(scriptPath .. "/editor/flaggedLevels.lua", flaggedLevels, "")
    for _, level in _G.ipairs(sortedFiles) do
      if idx == 0 then
        idx = 1
      elseif idx % cols == 1 then
        line = line + 1
        j = 1
      end
      local lvl = ui.ImageButton:new()
      lvl.scaleX = 1
      lvl.scaleY = 1
      lvl.x = bw * j * 1.1
      lvl.y = bh * line * 1.1
      lvl:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
      local epNumber = ui.Text:new()
      epNumber.name = "epNumber_" .. idx .. "_" .. j
      epNumber.font = "FONT_BIG_NUMBERS"
      epNumber.text = "" .. _G.string.gsub(level, ".lua", "")
      lvl:addChild(epNumber)
      lvl.name = "lvl_" .. idx .. "_" .. j
      self.folderFrame:addChild(lvl)
      epNumber.scaleX = 0.4
      epNumber.scaleY = 0.4
      lvl.returnValue = "EDITOR_GOTO_LEVEL"
      lvl.meta = {
        index = idx,
        index_in_theme = idx,
        theme = 1,
        world = -1,
        page = self.folder,
        level_name = _G.string.gsub(level, ".lua", ""),
        level_folder = levelPath .. "/" .. self.folder .. "/",
        editor_page = "folder",
        flaggedButtonName = lvl.name
      }
      local flagImage = ui.Image:new({name = "flag"})
      flagImage:setImage("BUTTON_LQ_X_NON")
      flagImage.visible = flaggedLevels.levels[lvl.meta.level_name] ~= nil
      lvl:addChild(flagImage)
      idx = idx + 1
      j = j + 1
    end
    self.totalNumberOfLines = line
  end
end
function EditorFolderPage:update(dt, time)
  ui.Frame.update(self, dt, time)
  if keyPressed.DOWN or keyHold.DOWN then
    self.scrollOffset = self.scrollOffset - 15
    self.folderFrame.y = self.scrollOffset
    g_scrollOffset = self.scrollOffset
  elseif keyPressed.UP or keyHold.UP then
    self.scrollOffset = _G.math.min(15, self.scrollOffset + 15)
    self.folderFrame.y = self.scrollOffset
    g_scrollOffset = self.scrollOffset
  elseif keyReleased.E then
    local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
    self.scrollOffset = -(self.totalNumberOfLines + 2) * bh
    self.folderFrame.y = self.scrollOffset
    g_scrollOffset = self.scrollOffset
  elseif keyReleased.B then
    self.scrollOffset = 15
    self.folderFrame.y = self.scrollOffset
  elseif keyReleased.LEFT then
    local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
    self.scrollOffset = _G.math.min(15, self.scrollOffset + bh * (100 / g_levelsPerFolderRow))
    self.folderFrame.y = self.scrollOffset
    g_scrollOffset = self.scrollOffset
  elseif keyReleased.RIGHT then
    local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
    self.scrollOffset = _G.math.min(15, self.scrollOffset - bh * (100 / g_levelsPerFolderRow))
    self.folderFrame.y = self.scrollOffset
    g_scrollOffset = self.scrollOffset
  elseif keyReleased.PAGEUP then
    self.scrollOffset = _G.math.min(15, keyHold.CONTROL and self.scrollOffset + 2 * screenHeight or self.scrollOffset + screenHeight)
    self.folderFrame.y = self.scrollOffset
    g_scrollOffset = self.scrollOffset
  elseif keyReleased.PAGEDOWN then
    self.scrollOffset = keyHold.CONTROL and self.scrollOffset - 2 * screenHeight or self.scrollOffset - screenHeight
    self.folderFrame.y = self.scrollOffset
    g_scrollOffset = self.scrollOffset
  end
end
