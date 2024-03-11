EditorPage = ui.Frame:new()
local episodeSeparators = {}
function EditorPage:init()
  ui.Frame.init(self)
  self.backgroundColour = {
    r = 0,
    g = 0,
    b = 0,
    a = 1
  }
  local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
  self.scrollOffset = 15
  self.scrollableFrame = ui.Frame:new({
    name = "scrollableFrame"
  })
  self.scrollableFrame.y = self.scrollOffset
  self:addChild(self.scrollableFrame)
  local epsCaption = ui.Text:new()
  epsCaption.name = "epsCaption"
  epsCaption.font = fontBasic
  epsCaption.text = "Worlds"
  epsCaption.x = bw * 0.3
  epsCaption.y = bh * 0.3
  epsCaption.hanchor = "LEFT"
  self.scrollableFrame:addChild(epsCaption)
end
function EditorPage:offsetToCoordinates(offs, bw, bh)
  local col = (offs - 1) % 20
  local row = (offs - 1 - col) / 20
  local x = bw * (col + 1) * 0.4
  local y = bh * (0.2 + (row + 1) * 0.4)
  return x, y + self.scrollOffset
end
function EditorPage:prepareForDynamicAssets()
  local allAssets = {}
  for k, v in _G.pairs(blockTable.themes) do
    allAssets[#allAssets + 1] = k
  end
  allAssets[#allAssets + 1] = "mainMenuRoot"
  allAssets[#allAssets + 1] = "ingame"
  allAssets[#allAssets + 1] = "LevelSelectionRoot"
  allAssets[#allAssets + 1] = "ingameMasks"
  dynamic.setRequirements(self, allAssets)
end
function EditorPage:layout()
  ui.Frame.layout(self)
  local offs = 0
  local bw, bh = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
  local allEpisodeIds = deepCopy(g_episodeIds)
  if g_additionalFeatherEpisodes then
    for _, episodeName in _G.ipairs(g_additionalFeatherEpisodes) do
      _G.table.insert(allEpisodeIds, episodeName)
    end
  end
  for i = 1, #allEpisodeIds do
    for j = 1, #g_episodes[allEpisodeIds[i]].pages do
      offs = offs + 1
      local ep = self.scrollableFrame:getChild("ep" .. i .. "_" .. j)
      if not ep then
        ep = ui.ImageButton:new()
        ep.name = "ep" .. i .. "_" .. j
        ep.scaleX = 0.35
        ep.scaleY = 0.35
        ep.x, ep.y = self:offsetToCoordinates(offs, bw, bh)
        ep:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
        ep.returnValue = "EDITOR_MENU_WORLD"
        ep.meta = {
          ep = allEpisodeIds[i],
          page = j
        }
        local epNumber = ui.Text:new()
        epNumber.name = "epNumber" .. i .. "_" .. j
        epNumber.font = "FONT_MENU"
        epNumber.text = "" .. g_episodes[allEpisodeIds[i]].pages[j].display_number
        ep:addChild(epNumber)
        self.scrollableFrame:addChild(ep)
      end
    end
    local x, y1 = self:offsetToCoordinates(offs, bw, bh)
    local px, py = _G.res.getSpritePivot("LS_LEVEL_BG_NORMAL_OPEN_1")
    x = x + (-px + bw) * 0.35 + 4
    y1 = y1 - py * 0.35
    local y2 = y1 + 35
    _G.table.insert(episodeSeparators, {
      x1 = x,
      y1 = y1,
      x2 = x,
      y2 = y2
    })
  end
  _G.table.remove(episodeSeparators)
  local offsY = 0.5 + _G.math.floor(offs / 20)
  local foldersCaption = self.scrollableFrame:getChild("foldersCaption")
  if not foldersCaption then
    foldersCaption = ui.Text:new()
    foldersCaption.name = "foldersCaption"
    foldersCaption.font = fontBasic
    foldersCaption.text = "Folders"
    foldersCaption.x = bw * 0.3
    foldersCaption.y = bh * offsY + self.scrollOffset
    foldersCaption.hanchor = "LEFT"
    self.scrollableFrame:addChild(foldersCaption)
  end
  local lastElementY = foldersCaption.y
  local packRows = 0
  for i = 1, g_editLevelPacks do
    local col = (i - 1) % 20
    local row = (i - 1 - col) / 20
    packRows = _G.math.max(packRows, row)
    local folder = self.scrollableFrame:getChild("folder_" .. i)
    if not folder then
      folder = ui.ImageButton:new()
      folder.scaleX = 0.35
      folder.scaleY = 0.35
      folder.x = bw * (col + 1) * 0.4
      folder.y = bh * (offsY + (row + 1) * 0.4) + self.scrollOffset
      lastElementY = folder.y
      folder:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
      folder.returnValue = "EDITOR_MENU_FOLDER"
      folder.meta = i
      folder.name = "folder_" .. i
      local epNumber = ui.Text:new()
      epNumber.font = "FONT_MENU"
      epNumber.text = "" .. i
      epNumber.name = "epNumber_" .. i
      folder:addChild(epNumber)
      self.scrollableFrame:addChild(folder)
    end
  end
  local levelButtonWidth, levelButtonHeight = _G.res.getSpriteBounds("LS_LEVEL_BG_NORMAL_OPEN_1")
  levelButtonWidth = levelButtonWidth * 0.35
  levelButtonHeight = levelButtonHeight * 0.35
  if g_show_vehicles_in_editor then
    local vehicleCaption = self.scrollableFrame:getChild("vehicleCaption")
    if not vehicleCaption then
      vehicleCaption = ui.Text:new({font = getFontBasic})
      vehicleCaption.name = "vehicleCaption"
      vehicleCaption.text = "Vehicles/work"
      vehicleCaption.x = foldersCaption.x
      vehicleCaption.y = foldersCaption.y + bw * 0.9 + (packRows + 1) * levelButtonHeight + self.scrollOffset
      vehicleCaption.hanchor = "LEFT"
      vehicleCaption.vanchor = "VCENTER"
      self.scrollableFrame:addChild(vehicleCaption)
    end
    for i = 1, 20 do
      local vehicleButton = self.scrollableFrame:getChild("vehicleButton_" .. i)
      if not vehicleButton then
        vehicleButton = ui.ImageButton:new()
        vehicleButton.name = "vehicleButton_" .. i
        vehicleButton:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
        vehicleButton.scaleX = 0.35
        vehicleButton.scaleY = 0.35
        vehicleButton.x = bw * 0.4 + (i - 1) * bw * 0.4
        vehicleButton.meta = {index = i, level_name = "work"}
        vehicleButton.y = vehicleCaption.y + vehicleButton.h * 0.35 + self.scrollOffset
        lastElementY = vehicleButton.y
        vehicleButton.returnValue = "EDITOR_MENU_VEHICLES"
        self.scrollableFrame:addChild(vehicleButton)
        local vehicleButtonText = ui.Text:new({font = getFontBasic})
        vehicleButtonText.name = "vehicleButtonText_" .. i
        vehicleButtonText.text = "V" .. i
        vehicleButton:addChild(vehicleButtonText)
      end
    end
    local vehicleCommonCaption = self.scrollableFrame:getChild("vehicleCommonCaption")
    if not vehicleCommonCaption then
      vehicleCommonCaption = ui.Text:new({font = getFontBasic})
      vehicleCommonCaption.name = "vehicleCommonCaption"
      vehicleCommonCaption.text = "Vehicles/common"
      vehicleCommonCaption.x = foldersCaption.x
      vehicleCommonCaption.y = vehicleCaption.y + levelButtonHeight * 2 + self.scrollOffset
      vehicleCommonCaption.hanchor = "LEFT"
      vehicleCommonCaption.vanchor = "VCENTER"
      self.scrollableFrame:addChild(vehicleCommonCaption)
    end
    for i = 1, 1 do
      local vehicleButton = self.scrollableFrame:getChild("vehicleButtonB_" .. i)
      if not vehicleButton then
        vehicleButton = ui.ImageButton:new()
        vehicleButton.name = "vehicleButtonB_" .. i
        vehicleButton:setImage("LS_LEVEL_BG_NORMAL_OPEN_1")
        vehicleButton.scaleX = 0.35
        vehicleButton.scaleY = 0.35
        vehicleButton.x = bw * 0.4 + (i - 1) * bw * 0.4
        vehicleButton.meta = {index = i, level_name = "common"}
        vehicleButton.y = vehicleCommonCaption.y + vehicleButton.h * 0.35 + self.scrollOffset
        lastElementY = vehicleButton.y
        vehicleButton.returnValue = "EDITOR_MENU_VEHICLES"
        self.scrollableFrame:addChild(vehicleButton)
        local vehicleButtonText = ui.Text:new({font = getFontBasic})
        vehicleButtonText.name = "vehicleButtonTextB_" .. i
        vehicleButtonText.text = "V" .. i
        vehicleButton:addChild(vehicleButtonText)
      end
    end
  end
  local exitButton = self:getChild("EditorexitButton")
  if not exitButton then
    exitButton = ui.ImageButton:new()
    exitButton:setImage("ARROW_LEFT")
    exitButton.x = exitButton.w * 0.5
    exitButton.y = screenHeight - exitButton.h * 0.5
    exitButton.returnValue = "EDITOR_EXIT"
    exitButton.name = "EditorexitButton"
    self:addChild(exitButton)
  end
  local nextPage = self:getChild("EditorNextPage")
  if not nextPage then
    nextPage = ui.ImageButton:new()
    nextPage:setImage("ARROW_LEFT")
    nextPage.scaleX = -1
    nextPage.x = screenWidth - nextPage.w * 0.5
    nextPage.y = screenHeight - nextPage.h * 0.5
    nextPage.returnValue = "EDITOR_MENU_WORLD"
    nextPage.meta = {
      ep = g_episodeIds[1],
      page = 1
    }
    nextPage.name = "EditorNextPage"
    self:addChild(nextPage)
  end
  local friendsLevels = self:getChild("friendsLevels")
  if not friendsLevels then
    friendsLevels = ui.ImageButton:new()
    friendsLevels.scaleX = -1
    friendsLevels.x = screenWidth - friendsLevels.w * 0.5
    friendsLevels.y = friendsLevels.h
    friendsLevels.returnValue = "EDITOR_MENU_FOLDER"
    friendsLevels.meta = "ABFriendsLevels"
    friendsLevels.name = "friendsLevels"
    self:addChild(friendsLevels)
  end
end
function EditorPage:drawEpisodeSeparators()
  setRenderState(0, 0, 1, 1, 0)
  for _, s in _G.ipairs(episodeSeparators) do
    drawLine2D(s.x1, s.y1 + self.scrollOffset, s.x2, s.y2 + self.scrollOffset, 3, 255, 255, 0, 255)
  end
end
function EditorPage:update(dt, time)
  ui.Frame.update(self, dt, time)
  if keyPressed.DOWN or keyHold.DOWN then
    self.scrollOffset = _G.math.max(-screenHeight, self.scrollOffset - 15)
    self.scrollableFrame.y = self.scrollOffset
  end
  if keyPressed.UP or keyHold.UP then
    self.scrollOffset = _G.math.min(15, self.scrollOffset + 15)
    self.scrollableFrame.y = self.scrollOffset
  end
  if keyReleased.PAGEUP then
    self.scrollOffset = 15
    self.scrollableFrame.y = self.scrollOffset
  end
  if keyReleased.PAGEDOWN then
    self.scrollOffset = -screenHeight
    self.scrollableFrame.y = self.scrollOffset
  end
end
function EditorPage:draw()
  ui.Frame.draw(self)
  self:drawEpisodeSeparators()
end
