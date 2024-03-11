loadLuaFile(commonScriptPath .. "/editor/menus/Page.lua", "")
loadLuaFile(commonScriptPath .. "/editor/menus/OverlayPage.lua", "")
loadLuaFile(commonScriptPath .. "/editor/menus/EditorJointPage.lua", "")
loadLuaFile(commonScriptPath .. "/editor/menus/EditorPage.lua", "")
loadLuaFile(commonScriptPath .. "/editor/menus/EditorWorldPage.lua", "")
loadLuaFile(commonScriptPath .. "/editor/menus/EditorFolderPage.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/Toolbar.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/Item.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/RectItem.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/SpriteItem.lua", "")
loadLuaFile(commonScriptPath .. "/ui_components/TextInputBox.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/TextItem.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/ContextMenu.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/ContextItem.lua", "")
loadLuaFile(commonScriptPath .. "/editor/ui_components/MultiSelectView.lua", "")
g_editLevelPacks = 100
g_levelsPerFolder = 21
g_levelsPerFolderRow = 7
local spawnboxSpecificationMode = false
local doFailureFlash, doFailureText
local doFailureFlashTime = 200
local wantedParameters = {
  "z_order",
  "scaleX",
  "scaleY",
  "destroyedScoreInc",
  "strength",
  "defence",
  "density",
  "filterGroup"
}
local exitEditor = function()
  g_in_editor = false
  startedFromEditor = false
  blockAudioChange = false
  eventManager:notify({
    id = events.EID_CHANGE_SCENE,
    target = "MAIN_MENU",
    from = "EPISODE_SELECTION"
  })
  g_enableExtraMouseButtonEvents = nil
end
local groupBrowser = {
  keyGroupUp = "S",
  keyGroupDown = "A",
  keyBlockUp = "X",
  keyBlockDown = "Z"
}
function editor_pointer_event(o, eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(o, eventType, x, y)
  if eventType == "HOVER" and meta then
    setRenderState(0, 0, 1, 1, 0)
    setFont(fontBasic)
    if _G.type(meta) == "table" and meta.ep then
      _G.res.drawString("TEXTS_BASIC", "" .. (g_episodes[meta.ep].name or meta.ep), screenWidth, 0, "TOP", "RIGHT")
    elseif _G.type(meta) == "table" and meta.level_name then
      _G.res.drawString("", "" .. meta.level_name, screenWidth, 0, "TOP", "RIGHT")
    end
  end
  if result == "EDITOR_MENU_WORLD" then
    menuManager:changeRoot(EditorWorldPage:new(meta.ep, meta.page))
  elseif result == "EDITOR_EXIT" then
    exitEditor()
  elseif result == "EDITOR_MENU" then
    menuManager:changeRoot(EditorPage:new())
  elseif result == "EDITOR_MENU_FOLDER" then
    menuManager:changeRoot(EditorFolderPage:new(meta))
  elseif result == "EDITOR_GOTO_LEVEL" then
    editLevel(meta.level_folder, meta.level_name, meta.index, meta.index_in_theme, meta.theme, meta.world, meta.page, meta.editor_page)
  elseif result == "EDITOR_CHANGE_MODE" then
    item:getChild("changeModeText"):updateText()
    loadAllThemeGraphics()
  end
  if eventType == "BACK" then
    if o.init == EditorPage.init then
      exitEditor()
    else
      menuManager:changeRoot(EditorPage:new())
    end
  end
end
EditorPage.onPointerEvent = editor_pointer_event
EditorWorldPage.onPointerEvent = editor_pointer_event
EditorFolderPage.onPointerEvent = editor_pointer_event
Editor = {}
function Editor:new(o)
  local o = o or {}
  self.__index = self
  _G.setmetatable(o, self)
  return o
end
function Editor:eventTriggered(event)
  if event.id == events.EID_LEVEL_ENDED and startedFromEditor then
    returnToEditor()
  end
end
function editLevel(folder, level, index, index_in_theme, theme, world, page, editor_page)
  g_in_editor = true
  startedFromEditor = true
  blockAudioChange = true
  _G.res.stopAudio(currentMainMenuSong)
  levelName = level
  levelFolder = folder
  setEditing(true)
  setPhysicsEnabled(physicsEnabled)
  currentLevelNumberInTheme = index
  currentLevelNumber = index_in_theme
  currentThemeNumber = theme
  currentWorldNumber = world
  currentPageNumber = page
  loadLevelInternal(folder .. level)
  currentGameMode = updateEditor
  menuManager:changeRoot(nil)
  g_editorPage = editor_page
  --setBlockGroupIndices()
  g_enableExtraMouseButtonEvents = true
end
function setBlockGroupIndices()
  groupCount = 0
  for _, group in _G.pairs(blockTable.groups) do
    group.lastIndex = nil
    group.themeTable = {}
    if group.index then
      groupCount = groupCount + 1
    end
  end
  for blockName, block in _G.pairs(blockTable.blocks) do
    if block.group == nil then
      logwarning("Block " .. blockName .. " doesn't belong to any group")
    else
      local index
      if blockTable.groups[block.group] == nil then
        _G.error("Block \"" .. blockName .. "\" is in a nonexistent group \"" .. block.group .. "\"")
      end
      if blockTable.groups[block.group].lastIndex ~= nil then
        index = blockTable.groups[block.group].lastIndex + 1
      else
        index = 1
        blockTable.groups[block.group].firstIndex = 1
      end
      block.groupIndex = index
      blockTable.groups[block.group].lastIndex = index
    end
  end
end
local groupIndexToName = function(index)
  for k, v in _G.pairs(blockTable.groups) do
    if v.index == index then
      return k
    end
  end
  _G.error("Index not defined in groups: " .. _G.tostring(index))
end
local getNextGroupIndex = function(index)
  if not currentGroup then
    return currentGroupIndex
  end
end
local getPreviousGroupIndex = function(index)
  if not currentGroup then
    return currentGroupIndex
  end
end
local function updateSpawnboxSpecification(cursorX, cursorY)
  if spawnboxSpecificationMode then
    if objects.BoomBoxSpawnRect == nil then
      objects.BoomBoxSpawnRect = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
    end
    if keyPressed.LBUTTON then
      objects.BoomBoxSpawnRect.left = cursorX
      objects.BoomBoxSpawnRect.right = cursorX
      objects.BoomBoxSpawnRect.top = cursorY
      objects.BoomBoxSpawnRect.bottom = cursorY
    elseif keyHold.LBUTTON then
      objects.BoomBoxSpawnRect.right = cursorX
      objects.BoomBoxSpawnRect.bottom = cursorY
    end
  end
end
local checkObjectBounds = function(x, y, width, height, angle, cursorX, cursorY)
  local cx = cursorX - x
  local cy = cursorY - y
  local tcx = cx * _G.math.cos(angle) + cy * _G.math.sin(angle)
  local tcy = -cx * _G.math.sin(angle) + cy * _G.math.cos(angle)
  local halfWidth = width * 0.5
  local halfHeight = height * 0.5
  local left = -halfWidth
  local top = -halfHeight
  local right = halfWidth
  local bottom = halfHeight
  if tcx >= left and tcx < right and tcy >= top and tcy < bottom then
    return true
  end
  return false
end
local testPointInPolygon = function(x, y, vertices)
  local s = #vertices
  local e = 1
  local counter = 0
  while e <= #vertices do
    if y > _G.math.min(vertices[s].y, vertices[e].y) and y <= _G.math.max(vertices[s].y, vertices[e].y) and x <= _G.math.max(vertices[s].x, vertices[e].x) and vertices[s].y ~= vertices[e].y then
      local crossPointX = (y - vertices[s].y) * (vertices[e].x - vertices[s].x) / (vertices[e].y - vertices[s].y) + vertices[s].x
      if vertices[s].x == vertices[e].x or x < crossPointX then
        counter = counter + 1
      end
    end
    s = e
    e = e + 1
  end
  if counter % 2 == 0 then
    return false
  end
  return true
end
local function checkPolygonObjectBounds(x, y, width, height, angle, vertices, cursorX, cursorY)
  local cx = cursorX - x
  local cy = cursorY - y
  local tcx = cx * _G.math.cos(angle) + cy * _G.math.sin(angle)
  local tcy = -cx * _G.math.sin(angle) + cy * _G.math.cos(angle)
  local tVerts = {}
  for i = 1, #vertices do
    tVerts[i] = {}
    tVerts[i].x = vertices[i].x * width - 0.5 * width
    tVerts[i].y = vertices[i].y * height - 0.5 * height
  end
  return testPointInPolygon(tcx, tcy, tVerts)
end
local checkBounds = function(left, top, w, h, cursorX, cursorY, angle, hanchor, vanchor)
  if hanchor and vanchor then
    if hanchor == "HCENTER" then
      left = left - w * 0.5
    elseif hanchor == "LEFT" then
      left = left + w
    elseif hanchor == "RIGHT" then
      left = left - w
    end
    if vanchor == "VCENTER" then
      top = top - h * 0.5
    elseif vanchor == "TOP" then
      top = top + h
    elseif vanchor == "BOTTOM" then
      top = top - h
    end
  end
  if cursorX >= left and cursorX < left + w and cursorY >= top and cursorY < top + h then
    return true
  end
  return false
end
local function checkTextBounds(textGroup, text, hanchor, vanchor, x, y, cursorX, cursorY)
  local w = _G.res.getStringWidth(_G.res.getString(textGroup, text))
  local h = _G.res.getFontLeading()
  if hanchor == nil then
    x = x - w * 0.5
  elseif hanchor == "RIGHT" then
    x = x - w
  elseif hanchor == "HCENTER" then
    x = x - w * 0.5
  end
  if vanchor == nil then
    y = y - h * 0.5
  elseif vanchor == "BOTTOM" then
    y = y - h
  elseif vanchor == "VCENTER" then
    y = y - h * 0.5
  end
  return checkBounds(x, y, w, h, cursorX, cursorY)
end
local function checkSpriteBounds(sheet, sprite, x, y, cursorX, cursorY)
  local w, h = _G.res.getSpriteBounds(sheet, sprite)
  local px, py = _G.res.getSpritePivot(sheet, sprite)
  return checkBounds(x - px, y - py, w, h, cursorX, cursorY)
end
local getObjectsInsideRect = function(x1, y1, x2, y2)
  if x2 < x1 then
    x1, x2 = x2, x1
  end
  if y2 < y1 then
    y1, y2 = y2, y1
  end
  local t = {}
  for k, v in _G.pairs(objects.world) do
    x, y = physicsToWorldTransform(v.x, v.y)
    if x1 < x and x2 >= x and y1 < y and y2 >= y and v.name ~= "ground" then
      _G.table.insert(t, v)
    end
  end
  return t
end
local getThemeObjectsInsideRect = function(x1, y1, x2, y2, layer)
  if x2 < x1 then
    x1, x2 = x2, x1
  end
  if y2 < y1 then
    y1, y2 = y2, y1
  end
  local t = {}
  for k, v in _G.pairs(themeSpriteObjects) do
    x, y = physicsToWorldTransform(v.x, v.y)
    if v.layer == layer and x1 < x and x2 >= x and y1 < y and y2 >= y then
      _G.table.insert(t, v)
    end
  end
  return t
end
local updateCursorObjectAccordingToTheme = function()
  for k, v in _G.pairs(blockTable.blocks) do
    if v.group == currentGroup and v.groupIndex == currentGroupIndex and (v.theme == nil or v.theme == currentTheme) then
      objectToAdd = k
      selectedObjects = {}
    end
  end
end
local getObjectListBounds = function(objects)
  local w, h, px, py
  local minx = 1000000
  local maxx = -1000000
  local miny = 1000000
  local maxy = -1000000
  for k, v in _G.pairs(objects) do
    local width = v.width
    local height = v.height
    if width == nil then
      width = v.radius
      height = v.radius
    else
      width = width * 0.5
      height = height * 0.5
    end
    if minx > v.x - width then
      minx = v.x - width
    end
    if maxx < v.x + width then
      maxx = v.x + width
    end
    if miny > v.y - height then
      miny = v.y - height
    end
    if maxy < v.y + height then
      maxy = v.y + height
    end
  end
  w = maxx - minx
  h = maxy - miny
  px = (maxx + minx) * 0.5
  py = (maxy + miny) * 0.5
  return px, py, w, h
end
function addObjectToSelection(object, removeDuplicate)
  local objectFound = false
  for soi = 1, #selectedObjects do
    if selectedObjects[soi] == object then
      if removeDuplicate then
        _G.table.remove(selectedObjects, soi)
      end
      objectFound = true
      soi = #selectedObjects
    end
  end
  if not objectFound then
    _G.table.insert(selectedObjects, object)
  end
  selectedObjectsAreaCoords = nil
end
local physicsToScreenMultiplier = function()
  return worldScale / physicsScale
end
local setCurrentCameraData = function(targetDataTable)
  targetDataTable.version = "0.02"
  targetDataTable[deviceModel] = {
    px = screen.x,
    py = screen.y,
    sx = worldScale,
    sy = worldScale,
    screenWidth = screenWidth,
    screenHeight = screenHeight
  }
end
function saveLevelLua(level)
  _G.print("saving level!")
  if objects.birdCameraData == nil or objects.castleCameraData == nil then
    doFailure("Trying to save level without bird or castle camera")
    return
  end
  local world = {}
  for k, v in _G.pairs(objects.world) do
    local saveObject = {}
    saveObject.name = v.name
    saveObject.x = v.x
    saveObject.y = v.y
    saveObject.angle = v.angle
    _G.print("object: " .. v.name .. " " .. _G.tostring(v.definition) .. " " .. _G.tostring(v.baseDefinition))
    saveObject.definition = v.definition
    saveObject.baseDefinition = v.baseDefinition
    if v.owner then
      saveObject.owner = v.owner
    end
    if v.startNumber then
      saveObject.startNumber = v.startNumber
    end
    if v.editorConfigurableNames then
      for k2, v2 in _G.pairs(v.editorConfigurableNames) do
        if not saveObject[v2] then
          saveObject[v2] = v[v2]
        end
      end
    end
    world[saveObject.name] = saveObject
  end
  local cleanedChains = {}
  for k, v in _G.pairs(objects.chains) do
    if objects.world[k] then
      cleanedChains[k] = {}
      for _, vertexName in _G.ipairs(v) do
        if objects.world[vertexName] then
          _G.table.insert(cleanedChains[k], vertexName)
        end
      end
    end
  end
  objects.chains = cleanedChains
  saveLevel(level, world)
end
function resizeObject(blockDef, object)
  if blockDef then
    if blockDef.type == "circle" then
      local rad = object.originalWidth * object.scaleX
      if rad then
        resizeCircle(object.name, rad)
      else
        print("Bad values for w and h in Editor resize funtion: rad=" .. _G.tostring(rad))
      end
    elseif blockDef.type == "box" then
      local w, h = object.originalWidth * object.scaleX, object.originalHeight * object.scaleY
      if w and h then
        resizeBox(object.name, w, h)
      else
        print("Bad values for w and h in Editor resize funtion: w=" .. _G.tostring(w) .. ", h=" .. _G.tostring(h))
      end
    elseif blockDef.type == "polygon" and blockDef.vertices ~= nil then
      local verts = {}
      if object.scaleX ~= 0 and object.scaleY ~= 0 then
        if object.scaleX * object.scaleY < 0 then
          for i = #blockDef.vertices, 1, -1 do
            local vert = blockDef.vertices[i]
            local w, h = object.originalWidth * object.scaleX, object.originalHeight * object.scaleY
            _G.table.insert(verts, {
              x = vert.x * w - w * 0.5,
              y = vert.y * h - h * 0.5
            })
          end
        else
          for i = 1, #blockDef.vertices do
            local vert = blockDef.vertices[i]
            local w, h = object.originalWidth * object.scaleX, object.originalHeight * object.scaleY
            _G.table.insert(verts, {
              x = vert.x * w - w * 0.5,
              y = vert.y * h - h * 0.5
            })
          end
        end
        resizePolygon(object.name, verts)
      end
    end
    setScale(object.name, object.scaleX, object.scaleY)
  end
end
function updateEditor(dt, time)
  if not objects.worldGravity then
    objects.worldGravity = 20
  end
  if not editorJointPage then
    editorJointPage = EditorJointPage:new()
    editorJointPage:onEntry()
  end
  if oldZoomLevel ~= zoomLevel then
    worldScale = worldScale + zoomLevel - oldZoomLevel
    setWorldScale(worldScale)
    oldZoomLevel = zoomLevel
  end  
  updateScale()
  cursorPhysics.x, cursorPhysics.y = screenToPhysicsTransform(cursor.x, cursor.y)
  cursorWorld.x, cursorWorld.y = screenToWorldTransform(cursor.x, cursor.y)
  if(keyHold["RBUTTON"]) then
    if editor.m_cursorWorldDownX == nil and editor.m_cursorWorldDownY == nil then
      editor.m_cursorWorldDownX = cursorWorld.x
      editor.m_cursorWorldDownY = cursorWorld.y
    end
  else
    editor.m_cursorWorldDownX = nil
    editor.m_cursorWorldDownY = nil
  end
  if (selectedObjects ~= nil and #selectedObjects == 1) and not editor.drawOneLayer then
    initCollisionDummy(selectedObjects[1])  
  end
  if(keyHold["RETURN"] and keyPressed["DOWN"]) then
    alignObjects("DOWN")
  end
  if(keyHold["RETURN"] and keyPressed["UP"]) then
    alignObjects("UP")
  end
  if(keyHold["RETURN"] and keyPressed["RIGHT"]) then
    alignObjects("RIGHT")
  end
  if(keyHold["RETURN"] and keyPressed["LEFT"]) then
    alignObjects("LEFT")
  end
  if (keyHold["SHIFT"] or keyHold["CONTROL"]) and (keyPressed["W"] or keyPressed["E"]) and showSleepingObjects == true then
    if  #selectedObjects == 1 then
      local name = selectedObjects[1].name
      local selected = objects.world[name]
      local blockDef = blockTable.blocks[selected.definition]
      local dir = 1
      if(keyHold["CONTROL"]) then dir = -1 end
      if(blockDef.radius) then
        adjustedBlockDef.objectNames[name].radius = adjustedBlockDef.objectNames[name].radius + 0.1 * dir
        if(adjustedBlockDef.objectNames[name].radius < 0) then
          adjustedBlockDef.objectNames[name].radius = 0
        end
      elseif(blockDef.width and blockDef.height) then
        if(keyPressed["W"]) then
          adjustedBlockDef.objectNames[name].width = adjustedBlockDef.objectNames[name].width + 0.1 * dir
          if(adjustedBlockDef.objectNames[name].width < 0) then
            adjustedBlockDef.objectNames[name].width = 0
          end      
        else
          adjustedBlockDef.objectNames[name].height = adjustedBlockDef.objectNames[name].height + 0.1 * dir
          if(adjustedBlockDef.objectNames[name].height < 0) then
            adjustedBlockDef.objectNames[name].height = 0
          end      
        end
      elseif(blockDef.vertices ~= nil) then
        for k,v in _G.pairs(blockDef.vertices) do
          local vert = adjustedBlockDef.objectNames[name].vertices[k]
          if(keyPressed["W"]) then
            if(vert.x > 0.5) then
              vert.x = vert.x + 0.05 * dir
            elseif(vert.x < 0.5) then
              vert.x = vert.x - 0.05 * dir
            end
          else
            if(vert.y > 0.5) then
              vert.y = vert.y + 0.05 * dir                    
            elseif(vert.y < 0.5) then
              vert.y = vert.y - 0.05 * dir
            end
          end
        end
      end
    end    
  end
  if keyReleased["ESCAPE"] or touchcount == 3 then
    --setGameMode(updateMenu)
    setPhysicsEnabled(false)
    physicsEnabled = false
    --setActiveMenuPage(levelSelectionEdit[currentThemeNumber])
    currentGameMode = function() end
    if g_editorPage == "folder" then
    	menuManager:changeRoot(EditorFolderPage:new(currentPageNumber))
    elseif g_editorPage == "pack" then
    	menuManager:changeRoot(EditorWorldPage:new(currentThemeNumber, currentPageNumber))
    end
    editorJointPage:onExit()
    editorJointPage = nil
    return
  end
  if keyHold["CONTROL"] and keyPressed["S"] then
    checkDirectories()
    saveLevel(levelFolder .. levelName)
    saveLevel(levelFolder .. "temp/" .. levelName .. ".temp")
    levelSaved = true
  end
  if not keyHold["CONTROL"] and keyHold["SHIFT"] and keyPressed["C"] then
    if objects.castleCameraData == nil then
      objects.castleCameraData = {}
    end
    objects.castleCameraData.version = "0.02"
    objects.castleCameraData[deviceModel] = { px = screen.x,
                          py = screen.y,
                          sx = worldScale,
                          sy = worldScale,
                          screenWidth = screenWidth,
                          screenHeight = screenHeight }
    levelSaved = false
  end
  if not keyHold["CONTROL"] and keyHold["SHIFT"] and keyPressed["B"] then
    if objects.birdCameraData == nil then
      objects.birdCameraData = {}
    end
    objects.birdCameraData.version = "0.02"
    objects.birdCameraData[deviceModel] = { px = screen.x,
                        py = screen.y,
                        sx = worldScale,
                        sy = worldScale,
                        screenWidth = screenWidth,
                        screenHeight = screenHeight }
    levelSaved = false
  end
  if (keyHold["SHIFT"] and keyPressed["P"]) or touchcount == 2 then
    setEditing(false)
    setPhysicsEnabled(false)
    local name = "temp/" .. levelName .. ".temp.playtest"
    if(touchcount == 2) then
  	  name = levelName
    end
    if(touchcount ~= 2) then
      checkDirectories()
      saveLevel(levelFolder .. name)
    end
    loadLevelInternal(levelFolder .. name)		
    setGameMode(updateGame)
    levelSelectionPageNumber = currentThemeNumber
    currentThemeNumber = currentThemeIndex
    menuManager:changeRoot(ui.GameHud:new())
  end
  if keyPressed["TAB"] then
    physicsEnabled = not physicsEnabled
    if physicsEnabled then
      checkDirectories()
      saveLevel(levelFolder .. "temp/" .. levelName .. ".temp")
    else
      loadLevelInternal(levelFolder .. "temp/" .. levelName .. ".temp")
    end
    setPhysicsEnabled(physicsEnabled)
  end
  if keyPressed["MBUTTON"] then
    if keyPressed["SHIFT"] then
      setWorldScale(1)
      worldScale = 1
    else
      setWorldScale(1)
      worldScale = 1
      screen.x = 0
      screen.y = 0
    end
  end
  
  if keyHold["SHIFT"] then
  
	--Go up
	if keyPressed["Y"] then
		currentThemeIndex = currentThemeIndex + 1		
		if currentThemeIndex > blockTable.themes.settings.themeAmount then
			currentThemeIndex = blockTable.themes.settings.firstTheme
		end
	--Go down
	elseif keyPressed["T"] then
		currentThemeIndex = currentThemeIndex - 1		
		if currentThemeIndex < blockTable.themes.settings.firstTheme then
			currentThemeIndex = blockTable.themes.settings.themeAmount
		end
	end
    
    for k0, v0 in _G.pairs(blockTable.themes) do
      if v0.index ~= nil and v0.index == currentThemeIndex then
        currentTheme = k0
        setTheme(currentTheme)
        for k1, v1 in _G.pairs(objects.world) do
          v1def = blockTable.blocks[v1.definition]
          if v1def.theme ~= nil and v1def.theme ~= currentTheme then
            for k2, v2 in _G.pairs(blockTable.blocks) do
              if v2.group == v1def.group and v2.groupIndex == v1def.groupIndex then
                if v2.theme == nil or v2.theme == currentTheme then
                  v1.definition = k2
                  v1.sprite = v2.sprite
                  v1.damageSprite = v1.sprite
                  setSprite(k1, v1.sprite)
                  levelSaved = false
                end
              end
            end
          end
        end
        if objectToAdd ~= nil then
          updateCursorObjectAccordingToTheme()
        end
        objects.theme = currentTheme
      end
    end
  end
  birdSelected = false
  if selectedObjects[1] ~= nil then
    if selectedObjects[1].controllable then
      birdSelected = true
	  
      --[[for i = 1, #numberKeys do
	  
        if keyPressed[numberKeys[i] ] then
			selectedObjects[1].startNumber = i
        end
		
		if keyHold["SHIFT"] and keyPressed["U"] then
			if not selectedObjects[1].startNumber then
				selectedObjects[1].startNumber = 1
			elseif selectedObjects[1].startNumber then
				selectedObjects[1].startNumber = selectedObjects[1].startNumber+1
			end
		elseif keyHold["SHIFT"] and keyPressed["I"] then
			if selectedObjects[1].startNumber and selectedObjects[1].startNumber>1 then
				selectedObjects[1].startNumber = selectedObjects[1].startNumber-1
			end
		end
		setRenderState(0, 0, 1, 1, 0)
		_G.res.drawString("TEXTS_BASIC", "Press Shift U to increase bird order, Shift I to decrease", 0, 140, "TOP", "LEFT")
		
      end]]
    end
  end
  if keyHold["CONTROL"] == false and keyHold["SHIFT"] == false and birdSelected == false then
    for k, v in _G.pairs(blockTable.groups) do
      local groupDataUpdate = false
      if keyPressed[v.keyUp] then
        if currentGroup == k then
          currentGroupIndex = currentGroupIndex + 1
        else
          currentGroup = k
        end
        groupDataUpdate = true
      end
      if keyPressed[v.keyDown] then
        if currentGroup == k then
          currentGroupIndex = currentGroupIndex - 1
        else
          currentGroup = k
        end
        groupDataUpdate = true
      end
      if groupDataUpdate then
        if currentGroupIndex > blockTable.groups[currentGroup].lastIndex then
          currentGroupIndex = blockTable.groups[currentGroup].firstIndex
        end
        if currentGroupIndex < blockTable.groups[currentGroup].firstIndex then
          currentGroupIndex = blockTable.groups[currentGroup].lastIndex
        end
        updateCursorObjectAccordingToTheme()
      end
    end
  end
  if keyPressed["RBUTTON"] then
    if copiedObjects ~= nil then
      copiedObjects = nil
    end
    if objectToAdd ~= nil then
      objectToAdd = nil
    else
      if not keyHold["SHIFT"] and not keyHold["ALT"] then
        selectedObjects = { }
      end
      selectedObjectPos.x = 0
      selectedObjectPos.y = 0
      draggingStartPosWorld.x = cursorWorld.x
      draggingStartPosWorld.y = cursorWorld.y
      if editor.drawOneLayer then
        isThemeSpriteSelected = true
        for k, v in _G.pairs(themeSpriteObjects) do
          object = v
          if object.type == "polygon" then            
            if checkPolygonObjectBounds(object.x, object.y, object.width * object.scale.x, object.height * object.scale.y, object.angle, object.vertices, cursorPhysics.x, cursorPhysics.y) then
              addObjectToSelection(object, true)
            end
          end
          if object.type == "box" then
            if checkObjectBounds( object.x, object.y, object.width * object.scale.x, object.height * object.scale.y, object.angle, cursorPhysics.x, cursorPhysics.y) then
              addObjectToSelection(object, true)
            end
          end
          if object.type == "circle" then
            local t_scale = _G.math.max(object.scale.x, object.scale.y)
            if distance(object.x, object.y, cursorPhysics.x, cursorPhysics.y) < (object.radius * t_scale) then
              addObjectToSelection(object, true)
            end
          end
        end
      else
        isThemeSpriteSelected = nil
        for k, v in _G.pairs(objects.world) do
          object = v
          if object.type == "polygon" then
            x = object.x
            y = object.y
            if checkPolygonObjectBounds(x, y, object.width, object.height, object.angle, getObjectDefinition(k).vertices, cursorPhysics.x, cursorPhysics.y) then
              addObjectToSelection(object, true)
            end
          end
          if object.type == "box" then
            x = object.x
            y = object.y
            if checkObjectBounds(x, y, object.width, object.height, object.angle, cursorPhysics.x, cursorPhysics.y) then
              addObjectToSelection(object, true)
            end
          end
          if object.type == "circle" then
            if distance(object.x, object.y, cursorPhysics.x, cursorPhysics.y) < object.radius then
              addObjectToSelection(object, true)
            end
          end
        end
      end
    end
  end
  if keyPressed["K"] and #selectedObjects > 0 and keyHold["SHIFT"] and editor.drawOneLayer then
    for k, v in _G.pairs(selectedObjects) do
      for k1, v1 in _G.pairs(objects.themeSprites) do
        if v.name == k1 then
          if not v.speedX then
            v.speedX = 0
          end
          v.speedX = v.speedX + 1
          v1.speedX = v.speedX
        end
      end
    end
  end
  if keyPressed["K"] and #selectedObjects > 0 and keyHold["CONTROL"] and editor.drawOneLayer then
    for k, v in _G.pairs(selectedObjects) do
      for k1, v1 in _G.pairs(objects.themeSprites) do
        if v.name == k1 then
          if not v.speedX then
            v.speedX = 0
          end
          v.speedX = v.speedX - 1
          v1.speedX = v.speedX
        end
      end
    end
  end
  
  if     keyPressed["F"] and keyHold["SHIFT"] then
  objects.worldGravity = objects.worldGravity - 1
  setWorldGravity(0, objects.worldGravity)
  elseif keyPressed["G"] and keyHold["SHIFT"] then 
  objects.worldGravity = objects.worldGravity + 1
  setWorldGravity(0, objects.worldGravity)  
  end
  
  --[[if keyPressed["G"] and keyHold["CONTROL"] then
    objects.worldGravity = objects.worldGravity - 1
    setWorldGravity(0, objects.worldGravity)
  end
  if keyPressed["G"] and keyHold["SHIFT"] then
    objects.worldGravity = objects.worldGravity + 1
    setWorldGravity(0, objects.worldGravity)
  end]]
  if keyHold["RBUTTON"] and (not keyHold["CONTROL"]) then
    selectionRectActive = true
  end
  if keyHold["RBUTTON"] and keyHold["CONTROL"] and editor.drawOneLayer and (#selectedObjects > 0) then
    for k, v in _G.pairs(selectedObjects) do
      object = v
      local t_scaleX = 1
      local t_scaleY = 1
      if(keyHold["SHIFT"]) then
        local t_oldCursorPhysicsX, t_oldCursorPhysicsY = worldToPhysicsTransform(editor.m_cursorWorldDownX, editor.m_cursorWorldDownY)
        local t_originalDistance = distance(v.x, v.y, t_oldCursorPhysicsX, t_oldCursorPhysicsY)
        local t_newDistance = distance(v.x, v.y, cursorPhysics.x, cursorPhysics.y)
        local t_scale = t_newDistance / t_originalDistance
        t_scaleX = t_scale
        t_scaleY = t_scale
      else
        local t_oldCursorPhysicsX, t_oldCursorPhysicsY = worldToPhysicsTransform(editor.m_cursorWorldDownX, editor.m_cursorWorldDownY)
        local t_oldDistanceX = t_oldCursorPhysicsX - v.x
        local t_oldDistanceY = t_oldCursorPhysicsY - v.y
        local t_newDistanceX = cursorPhysics.x - v.x
        local t_newDistanceY = cursorPhysics.y - v.y
        t_scaleX = t_newDistanceX / t_oldDistanceX
        t_scaleY = t_newDistanceY / t_oldDistanceY
      end
      modifyThemeSprite(object.name, object.x, object.y, t_scaleX, t_scaleY, object.angle, object.layer)
      object.scale = {x = t_scaleX, y = t_scaleY}      
      objects.themeSprites[object.name].scale = { x =  t_scaleX, y = t_scaleY}      
    end
  end
  if keyReleased["RBUTTON"] then
    if objectToAdd ~= nil and selectedObjects == nil or #selectedObjects < 1 then
      if editor.drawOneLayer then
        selectedObjects = getThemeObjectsInsideRect(draggingStartPosWorld.x, draggingStartPosWorld.y, cursorWorld.x, cursorWorld.y, editor.currentLayer)
      else 
        selectedObjects = getObjectsInsideRect(draggingStartPosWorld.x, draggingStartPosWorld.y, cursorWorld.x, cursorWorld.y)
      end
    else
      if keyHold["SHIFT"] then
        local tempObjects = getObjectsInsideRect(draggingStartPosWorld.x, draggingStartPosWorld.y, cursorWorld.x, cursorWorld.y)
        for k, v in _G.pairs(tempObjects) do
          addObjectToSelection(object, false)
        end
      end
      if keyHold["ALT"] then
        local tempObjects = getObjectsInsideRect(draggingStartPosWorld.x, draggingStartPosWorld.y, cursorWorld.x, cursorWorld.y)
        for k, v in _G.pairs(tempObjects) do
          for soi = 1, #selectedObjects do
            if selectedObjects[soi] == v then
              _G.table.remove(selectedObjects, soi)
              soi = #selectedObjects
            end
          end
        end        
      end
    end
    selectionRectActive = false
  end
  if keyPressed["LBUTTON"] then
    oldCursor.x = cursor.x
    oldCursor.y = cursor.y
    if not keyHold["SPACE"] then
	
		local fixedXPosition = cursorPhysics.x - (cursorPhysics.x % 0.5)
		local fixedYPosition = cursorPhysics.y - (cursorPhysics.y % 0.5)
			
      if objectToAdd ~= nil then
        if not editor.drawOneLayer then
          local name = createObject(blockTable, objectToAdd, nil, fixedXPosition, fixedYPosition)
          setRotation(name, objectToAddAngle)
          selectedObjects = {}
          birdSelected = false
          _G.table.insert(selectedObjects, objects.world[name])
        else
          local spr = blockTable.blocks[objectToAdd].sprite
          if not spr and blockTable.blocks[objectToAdd].damageSprites then
            spr = blockTable.blocks[objectToAdd].damageSprites.damage1
          end
          if spr then
            if objects.counts[objectToAdd] == nil then
              objects.counts[objectToAdd] = 0
            end
            objects.counts[objectToAdd] = objects.counts[objectToAdd] + 1
            local name = objectToAdd .. "_" .. objects.counts[objectToAdd]
            selectedObjects = {}
            addThemeSprite(name, {definition=objectToAdd, name=name, x = cursorPhysics.x, y = cursorPhysics.y, angle = 0, scale = {x=1,y=1}, speedX = 0, layer = editor.currentLayer })
            if not objects.themeSprites then
              objects.themeSprites = {}
            end
            objects.themeSprites[name] = { definition = objectToAdd, 
                             name = name, x = cursorPhysics.x, 
                             y = cursorPhysics.y, layer = editor.currentLayer, 
                             angle = objectToAddAngle, scale = {x=1,y=1} }                             
          end
        end  
        levelSaved = false
      end
      if copiedObjects ~= nil then
        local t_nameRelationTable = {}
        for k, v in _G.pairs(copiedObjects) do
          if editor.drawOneLayer then
            if objects.counts[v.definition] then
              objects.counts[v.definition] = objects.counts[v.definition] + 1            
            else
              objects.counts[v.definition] = 1      
            end
            local name = v.definition .. "_" .. objects.counts[v.definition]
            addThemeSprite(name, {definition=v.definition, name=name, x = cursorPhysics.x + v.x, y = cursorPhysics.y + v.y, angle = v.angle, scale = v.scale, speedX = v.speedX or 0, layer = editor.currentLayer })
            if not objects.themeSprites then
              objects.themeSprites = {}
            end
            objects.themeSprites[name] = {   definition = v.definition, 
                            name = name, x = cursorPhysics.x + v.x, 
                            y = cursorPhysics.y + v.y, 
                            layer = editor.currentLayer, 
                            angle = v.angle,
                            scale = v.scale}
          else
			local name = createObject(blockTable, v.definition, nil, 
					(fixedXPosition + v.x) - ((fixedXPosition + v.x)%0.5), 
					(fixedYPosition + v.y) - ((fixedYPosition + v.y)%0.5))
            --local name = createObject(blockTable, v.definition, nil, cursorPhysics.x + v.x, cursorPhysics.y + v.y)
            t_nameRelationTable[v.name] = name
            setRotation(name, v.angle)
            objects.world[name].strength = v.strength
          end
        end            
        if copiedJoints ~= nil then
          for k, v in _G.pairs(copiedJoints) do
            local t_newJointName = t_nameRelationTable[v.end1] .. t_nameRelationTable[v.end2]
            t_newJoint = {}
            if v.type == 1 then
              t_newJoint = { name = t_newJointName, type =  v.type, end1 = t_nameRelationTable[v.end1], end2= t_nameRelationTable[v.end2], x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, dampingRatio=v.dampingRatio, frequency=v.frequency }
            elseif v.type == 2 then
              t_newJoint = { name = t_newJointName, type =  v.type, end1 = t_nameRelationTable[v.end1], end2= t_nameRelationTable[v.end2], x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected }
            elseif v.type == 3 then
              t_newJoint = { name = t_newJointName, type =  v.type, end1 = t_nameRelationTable[v.end1], end2= t_nameRelationTable[v.end2], x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, maxTorque=v.maxTorque,limit=v.limit,backAndForth=v.backAndForth,motorSpeed=v.motorSpeed,motor=v.motor,lowerLimit=v.lowerLimit,upperLimit=v.upperLimit }
            elseif v.type == 4 then
              t_newJoint = { name = t_newJointName, type =  v.type, end1 = t_nameRelationTable[v.end1], end2= t_nameRelationTable[v.end2], x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, maxTorque=v.maxTorque, limit=v.limit, backAndForth=v.backAndForth,motorSpeed=v.motorSpeed,worldAxisY=v.worldAxisY, motor=v.motor, lowerLimit=v.lowerLimit, upperLimit=v.upperLimit, worldAxisX = v.worldAxisX}
            elseif v.type == 5 then
              t_newJoint = { name = t_newJointName, type =  v.type, end1 = t_nameRelationTable[v.end1], end2= t_nameRelationTable[v.end2], x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, destroyTimer = v.destroyTimer}
            end          
            createJoint(t_newJoint)
            editorJointPage.addJoint(editorJointPage, t_newJointName)
          end
        end
      end
    end
  end
  if keyHold["LBUTTON"] then
    if keyHold["SPACE"] then
      screen.x = screen.x - (cursorWorld.x - draggingStartPosWorld.x) * 0.5
      screen.y = screen.y - (cursorWorld.y - draggingStartPosWorld.y) * 0.5
    else
      if objectToAdd ~= nil then
        selectedObjects = {}
      elseif selectedObjects ~= nil and #selectedObjects > 0 and (not editor.drawOneLayer)then
        for k, v in _G.pairs(selectedObjects) do
          object = v
          x, y = worldToPhysicsTransform(cursor.x - oldCursor.x, cursor.y - oldCursor.y)
          x = x / worldScale
          y = y / worldScale
          setSleeping(object.name, false)
          if keyHold["CONTROL"] then
            setRotation(object.name, object.angle + (cursor.x - oldCursor.x)/180 * _G.math.pi )
          else
            setPosition(object.name, x + object.x, y + object.y)
          end
        end
        levelSaved = false
      elseif selectedObjects ~= nil and #selectedObjects > 0 then
        for k, v in _G.pairs(selectedObjects) do
          object = v
          x, y = worldToPhysicsTransform(cursor.x - oldCursor.x, cursor.y - oldCursor.y)
          x = x / worldScale
          y = y / worldScale
          if keyHold["CONTROL"] then
            modifyThemeSprite(object.name, object.x, object.y, object.scale.x, object.scale.y, object.angle + (cursor.x - oldCursor.x)/180 * _G.math.pi , object.layer)
            object.angle = object.angle + (cursor.x - oldCursor.x)/180 * _G.math.pi 
            objects.themeSprites[object.name].angle = object.angle
          else
            modifyThemeSprite(object.name,  x + object.x, y + object.y, object.scale.x, object.scale.y, object.angle, object.layer)
            object.x = x + object.x
            object.y = y + object.y
            objects.themeSprites[object.name].x = object.x
            objects.themeSprites[object.name].y = object.y
          end
        end
        levelSaved = false
      elseif settingWaterLevel ~= nil then
        x, y = worldToPhysicsTransform(cursorWorld.x, cursorWorld.y)
        objects.waterLevel = -y
        settingWaterLevel = nil
      end
    end
  end
  if not keyHold["LBUTTON"] and not keyHold["RBUTTON"] then
    draggingStartPosWorld.x = cursorWorld.x
    draggingStartPosWorld.y = cursorWorld.y
  end
  if selectedObjects ~= nil and #selectedObjects > 0 then
    local moveAmount = 1
    if keyHold["SHIFT"] then
      moveAmount = 10
    end  
    if keyHold["SHIFT"] and keyHold["CONTROL"] then
      moveAmount = 100
    end
    if not keyHold["SHIFT"] and keyHold["CONTROL"] then
      moveAmount = 0
    end
    if keyReleased["DELETE"] then
      if editor.drawOneLayer then
        for k, v in _G.pairs(selectedObjects) do          
          local name = v.name
          objects.themeSprites[v.name] = nil
          themeSpriteObjects[v.name] = nil
          removeThemeSprite(name, editor.currentLayer)
        end
      else
        for k, v in _G.pairs(selectedObjects) do
          for key, value in _G.pairs(objects.joints) do
            if value.end1 == v.name or value.end2 == v.name then
              editorJointPage:removeItem(value.name)
              editorJointPage:removeItem(value.name .. "_ANCHOR_1")
              editorJointPage:removeItem(value.name .. "_ANCHOR_2")
            end
          end
          local name = v.name
          objects.world[name] = nil
          removeObject(name)
        end  
      end
      selectedObjects = {}
      levelSaved = false
    end
    local moveKeyDown = false
    if keyHold["LEFT"] or keyHold["RIGHT"] or keyHold["UP"] or keyHold["DOWN"] then
      moveKeyDown = true
    end
    if blockMoveTimer == 0 or blockMoveTimer > 0.3 then
      if keyHold["LEFT"] then
        setPositions(-moveAmount, 0)
      end
      if keyHold["RIGHT"] then
        setPositions(moveAmount, 0)
      end
      if keyHold["UP"] then
        setPositions(0, -moveAmount)
      end
      if keyHold["DOWN"] then
        setPositions(0, moveAmount)
      end
    end
    if moveKeyDown then
      blockMoveTimer = blockMoveTimer + dt
    else
      blockMoveTimer = 0
    end
  end
  if keyHold["SHIFT"] then
    if keyPressed["R"] then
      local angle = _G.math.pi / 8
      if keyHold["CONTROL"] then
        angle = -angle
      end
      if copiedObjects ~= nil then
        local px, py, w, h = getObjectListBounds(copiedObjects)
        for k, v in _G.pairs(copiedObjects) do
          v.angle = v.angle + angle
          local cx = v.x - px
          local cy = v.y - py
          local tcx = cx * _G.math.cos(angle) - cy * _G.math.sin(angle)
          local tcy = cx * _G.math.sin(angle) + cy * _G.math.cos(angle)
          v.x = tcx + px
          v.y = tcy + py
        end
      else
        if objectToAdd ~= nil then
          objectToAddAngle = objectToAddAngle + angle
        else
          if selectedObjects ~= nil and #selectedObjects > 0 then
            for k, v in _G.pairs(selectedObjects) do
              setRotation(v.name, v.angle + angle)
            end
            levelSaved = false
          end
        end
      end
    end
    if keyPressed["J"] then
      if #selectedObjects == 2 then
        editor.newJoint = { name = selectedObjects[1].name .. selectedObjects[2].name, 
                end1 = selectedObjects[1].name, end2 = selectedObjects[2].name, type = 1,
                coordType = 2, x1 = 0, y1 = 0, x2 = 0, y2 = 0, collideConnected = false }
        editorJointPage.newJoint = true  
        levelSaved = false
	  end
    end
    if keyPressed["W"] then
      if objects.waterLevel ~= nil then
        oldWaterLevel = objects.waterLevel
        objects.waterLevel = nil
      else
        objects.waterLevel = oldWaterLevel ~= nil and oldWaterLevel or 20
        settingWaterLevel = true
      end
    end
  end
  if #selectedObjects == 2 then
    if keyPressed["F1"] then 
      editor.newJoint = { name = selectedObjects[1].name .. selectedObjects[2].name, 
                end1 = selectedObjects[1].name, end2 = selectedObjects[2].name, type = 1,
                coordType = 2, x1 = 0, y1 = 0, x2 = 0, y2 = 0 }
      editorJointPage.newJoint = true    
    elseif keyPressed["F2"] then 
      editor.newJoint = { name = selectedObjects[1].name .. selectedObjects[2].name, 
                end1 = selectedObjects[1].name, end2 = selectedObjects[2].name, type = 2,
                coordType = 2, x1 = 0, y1 = 0, x2 = 0, y2 = 0 }
      editorJointPage.newJoint = true  
    elseif keyPressed["F3"] then 
      editor.newJoint = { name = selectedObjects[1].name .. selectedObjects[2].name, 
                end1 = selectedObjects[1].name, end2 = selectedObjects[2].name, type = 3,
                coordType = 2, x1 = 0, y1 = 0, x2 = 0, y2 = 0 }
      editorJointPage.newJoint = true    
    elseif keyPressed["F4"] then 
      editor.newJoint = { name = selectedObjects[1].name .. selectedObjects[2].name, 
                end1 = selectedObjects[1].name, end2 = selectedObjects[2].name, type = 4,
                coordType = 2, x1 = 0, y1 = 0, x2 = 0, y2 = 0}
      editorJointPage.items.x.visible = true
      editorJointPage.items.y.visible = true
      editorJointPage.items.x.text = editorJointPage.xTexts[1]
      editorJointPage.items.y.text = editorJointPage.yTexts[1]
      editorJointPage.newJoint = true  
    elseif keyPressed["F5"] and objects.world[selectedObjects[1].name].material ~= "immovable"
        and objects.world[selectedObjects[2].name].material ~= "immovable" then 
      editor.newJoint = { name = selectedObjects[1].name .. selectedObjects[2].name,
                end1 = selectedObjects[1].name, end2 = selectedObjects[2].name, type = 5,
                coordType = 2, x1 = 0, y1 = 0, x2 = 0, y2 = 0                }
      editorJointPage.newJoint = true  
    end
  end
  if not keyHold["SHIFT"] and keyHold["CONTROL"] then    
    if keyPressed["LEFT"] or keyPressed["RIGHT"] then
      if selectedObjects ~= nil and #selectedObjects > 0 then
        local px, py, w, h = getObjectListBounds(selectedObjects)
        for k, v in _G.pairs(selectedObjects) do
          setPosition(v.name, px + (px - v.x), v.y)
        end
        levelSaved = false
      end      
    end
    if keyPressed["UP"] or keyPressed["DOWN"] then
      if selectedObjects ~= nil and #selectedObjects > 0 then
        local px, py, w, h = getObjectListBounds(selectedObjects)
        for k, v in _G.pairs(selectedObjects) do
          setPosition(v.name, v.x, py + (py - v.y))
        end
        levelSaved = false
      end
    end
  end
  if keyHold["SHIFT"] and keyHold["CONTROL"] and (keyPressed["B"] or keyPressed["HOME"]) then
    if objects.birdCameraData and objects.birdCameraData[deviceModel] ~= nil then
      screen.x = objects.birdCameraData[deviceModel].px
      screen.y = objects.birdCameraData[deviceModel].py
      worldScale = objects.birdCameraData[deviceModel].sx
      setWorldScale(worldScale)
      oldScale = worldScale
    end
  end
  if keyHold["SHIFT"] and keyHold["CONTROL"] and (keyPressed["C"] or keyPressed["END"]) then
    if objects.castleCameraData ~= nil and objects.castleCameraData[deviceModel]then
      screen.x = objects.castleCameraData[deviceModel].px
      screen.y = objects.castleCameraData[deviceModel].py
      worldScale = objects.castleCameraData[deviceModel].sx
      setWorldScale(worldScale)
      oldScale = worldScale
    end
  end
  if not keyHold["SHIFT"] and not keyHold["CONTROL"] and keyPressed["END"] then
    if objects.doNotWaitForMovingObjects ~= nil then
      objects.doNotWaitForMovingObjects = nil
    else
      objects.doNotWaitForMovingObjects = true
    end
  end
  if not keyHold["SHIFT"] and keyHold["CONTROL"] and keyPressed["C"] then
    copiedObjects = {}
    copiedJoints = {}
    local x, y, w, h = getObjectListBounds(selectedObjects)
    for k, v in _G.pairs(selectedObjects) do
      copiedObjects[v.name] = { name = v.name, definition = v.definition, x = v.x - x, y = v.y - y, angle = v.angle }
      if v.width == nil then
        copiedObjects[v.name].width = v.radius
        copiedObjects[v.name].height = v.radius
      else
        copiedObjects[v.name].width = v.width
        copiedObjects[v.name].height = v.height
      end
      if editor.drawOneLayer then
        copiedObjects[v.name].scale = v.scale
      end  
    end
    for k, v in _G.pairs(objects.joints) do
      if copiedObjects[v.end1] ~= nil and copiedObjects[v.end2] ~= nil then
        if v.type == 1 then
          copiedJoints[v.name] = { type =  v.type, end1 = v.end1, end2= v.end2, x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, dampingRatio=v.dampingRatio, frequency=v.frequency }
        elseif v.type == 2 then
          copiedJoints[v.name] = { type =  v.type, end1 = v.end1, end2= v.end2, x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected }
        elseif v.type == 3 then
          copiedJoints[v.name] = { type =  v.type, end1 = v.end1, end2= v.end2, x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, maxTorque=v.maxTorque,limit=v.limit,backAndForth=v.backAndForth,motorSpeed=v.motorSpeed,motor=v.motor,lowerLimit=v.lowerLimit,upperLimit=v.upperLimit }
        elseif v.type == 4 then
          copiedJoints[v.name] = { type =  v.type, end1 = v.end1, end2= v.end2, x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, maxTorque=v.maxTorque, limit=v.limit, backAndForth=v.backAndForth,motorSpeed=v.motorSpeed,worldAxisY=v.worldAxisY, motor=v.motor, lowerLimit=v.lowerLimit, upperLimit=v.upperLimit, worldAxisX = v.worldAxisX}
        elseif v.type == 5 then
          copiedJoints[v.name] = { type =  v.type, end1 = v.end1, end2= v.end2, x1=v.x1, y1=v.y1, x2=v.x2, y2=v.y2, coordType=v.coordType,collideConnected=v.collideConnected, destroyTimer = v.destroyTimer}
        end
      end
    end
    selectedObjects = {}
  end
  if keyPressed["0"] then
    editor.drawOneLayer = not editor.drawOneLayer
    selectedObjects = {}
    copiedObjects = {}
    copiedJoints = {}
    objectToAdd = nil
  end
  defaultCamera(dt)
  oldCursor.x = cursor.x
  oldCursor.y = cursor.y  
  for k, v in _G.pairs(objects.joints) do
    if v.backAndForth then
      checkJointLimits(v.name)
    end
  end
  if editor.drawOneLayer and keyHold["CONTROL"] and cursor.wheelTriggered then
    editor.currentLayer = editor.currentLayer - cursor.wheel
    local maxLayer = #blockTable.themes[objects.theme].bgLayers + #blockTable.themes[objects.theme].fgLayers 
    if editor.currentLayer >= maxLayer then
      editor.currentLayer = 0
    elseif editor.currentLayer < 0 then
      editor.currentLayer = maxLayer - 1
    end
  end
  editorJointPage:update(dt)
  drawEditor()
  editorJointPage:draw()
  if cursor.wheelTriggered then
    cursor.wheelTriggered = false
  end
end
function openBlockSelectionWindow()
  if editor.spriteBar ~= nil then
    local spriteBarWidth, spriteBarHeight = editor.spriteBar:getBounds()
    local x = cursor.x - editor.spriteBar.x
    local y = cursor.y - editor.spriteBar.y + editor.spriteBar.button_height
    if 0 < x and spriteBarWidth > x and 0 < y and spriteBarHeight > y then
      editor.spriteBar:onPointerEvent("LPRESS", x, y)
    end
    editor.spriteBar = nil
    editor.previewSprite = nil
  end
  local parameters = {}
  for k, v in _G.pairs(blockTable.groups) do
    parameters[#parameters + 1] = k
  end
  notificationsFrame:addChild(ContextMenu:new({
    name = "contextMenu",
    type = "selection",
    items = parameters,
    callback = createSpriteBar,
    fullScreen = true,
    preview = true
  }))
end
function openParameterWindow(object)
  print("open parameters: " .. object.name)
  local parameters = {}
  local blockDef = blockTable.blocks[object.definition]
  local score = blockDef and blockDef.destroyedScoreInc or blockDestroyedScoreIncrement
  local wantedParams = wantedParameters
  if object.forceField then
    wantedParams = forceFieldParameters
  elseif object.forcePoint then
    wantedParams = forcePointParameters
  end
  if objects.world[object.name] then
    for i, param in _G.ipairs(wantedParams) do
      for k, v in _G.pairs(object) do
        if param == k then
          print("  " .. k .. ": " .. _G.tostring(v))
          parameters[k] = v
          break
        end
      end
    end
    if not object.forceField then
      if parameters.destroyedScoreInc == nil then
        parameters.destroyedScoreInc = score
      end
      if object.levelGoal then
        parameters.destroyedScoreInc = nil
      end
    end
    if parameters.filterGroup == nil then
      parameters.filterGroup = 0
    end
  elseif objects.themeSprites[object.name] then
    local themeSpriteParams = {"scaleX", "scaleY"}
    for i, param in _G.ipairs(themeSpriteParams) do
      if param == "scaleX" or param == "scaleY" then
        if param == "scaleX" then
          if object.scale.x then
            parameters[param] = object.scale.x
          end
        elseif object.scale.y then
          parameters[param] = object.scale.y
        end
      elseif object[param] ~= nil then
        print("  " .. param .. ": " .. _G.tostring(v))
        parameters[param] = object[param] == true and 1 or 0
      else
        parameters[param] = 0
      end
    end
  end
  notificationsFrame:addChild(ContextMenu:new({
    name = "contextMenu",
    type = "parameters",
    x = cursor.x,
    y = cursor.y,
    items = parameters,
    callback = changeItemParameters,
    callback_parameter = object,
    originals = object.overrides
  }))
end
function changeItemParameters(object, parameters)
  print("changeItemParameters: " .. _G.tostring(object) .. ", " .. _G.tostring(parameters))
  if object and parameters then
    local changed = false
    local blockDef = blockTable.blocks[object.definition]
    local score = blockDef and blockDef.destroyedScoreInc or blockDestroyedScoreIncrement
    local wantedParams = wantedParameters
    if object.forceField then
      wantedParams = forceFieldParameters
    elseif object.forcePoint then
      wantedParams = forcePointParameters
    end
    if objects.world[object.name] then
      for i, param in _G.ipairs(wantedParams) do
        if parameters[param] and object[param] ~= parameters[param] then
          changed = true
          print("changed value: " .. param .. ": " .. _G.tostring(object[param]) .. " -> " .. _G.tostring(parameters[param]) .. " for object: " .. object.name)
          if not object.overrides then
            object.overrides = {}
          end
          if not object.overrides[param] then
            if param == "destroyedScoreInc" and not object[param] then
              object[param] = score
            end
            object.overrides[param] = object[param]
          elseif object.overrides[param] == parameters[param] then
            object.overrides[param] = nil
          end
          object[param] = parameters[param]
        end
      end
      if changed then
        selectedObjects = {}
        duplicateObject(object)
      end
    elseif objects.themeSprites[object.name] then
      local themeSpriteParams = {"scaleX", "scaleY"}
      for i, param in _G.ipairs(themeSpriteParams) do
        if param == "scaleX" or param == "scaleY" then
          if param == "scaleX" then
            changed = true
            object.scale.x = parameters[param]
          else
            changed = true
            object.scale.y = parameters[param]
          end
        elseif parameters[param] ~= nil then
          changed = true
          object[param] = parameters[param] == 1
          objects.themeSprites[object.name][param] = object[param]
          themeSpriteObjects[object.name][param] = object[param]
        end
      end
      if changed then
        modifyThemeSprite(object.name, object.x, object.y, object.scale.x, object.scale.y, object.angle, object.layer)
      end
    end
  end
end
function cursorInside(coords)
  return cursorPhysics.x > coords.x1 and cursorPhysics.x < coords.x2 and cursorPhysics.y > coords.y1 and cursorPhysics.y < coords.y2
end
function spriteChosen(sprite)
  currentGroupIndex = sprite.groupIndex
  updateCursorObjectAccordingToTheme()
end
function spriteHovered(sprite)
  editor.previewSprite = sprite
end
function createSpriteBar(groupToOpen)
  if groupToOpen then
    currentGroup = groupToOpen
  end
  editor.spriteBar = Toolbar:new({
    button_width = 40,
    button_height = 40,
    max_width = screenWidth,
    groupName = currentGroup
  })
  for k, v in _G.pairs(blockTable.blocks) do
    if v.group == currentGroup and (v.theme == nil or v.theme == currentTheme) then
      v.definitionName = k
      editor.spriteBar:addButton({
        sprite = v.sprite,
        callback = spriteChosen,
        callback_parameter = v,
        on_hover_callback = spriteHovered
      })
    end
  end
  local width, height = editor.spriteBar:getBounds()
  editor.spriteBar.y = screenHeight - height - 10
end
function renameObject(newName, oldName)
  if newName ~= oldName then
    object = objects.world[oldName]
    objects.world[oldName] = nil
    removeObject(oldName)
    createObject(blockTable, object.definition, newName, object.x, object.y, {
      density = object.density,
      z_order = object.z_order,
      angle = object.angle
    })
    selectedObjects = {
      objects.world[newName]
    }
  end
end
function drawEditor()  
  local wScale = worldScale
  setRenderState(0, 0, 1, 1, 0)
  if editor.drawOneLayer then
    drawLayer(editor.currentLayer)
    if editor.currentLayer == #blockTable.themes[objects.theme].bgLayers then
      drawGame()
    end
    for k, v in _G.pairs(selectedObjects) do
      if v.definition ~= nil and v.definition ~= "" then
        local w, h = _G.res.getSpriteBounds("", blockTable.blocks[v.definition].sprite)
        w, h = w * v.scale.x, h * v.scale.y
        w, h = w * 0.5, h * 0.5
        local x, y = physicsToWorldTransform(v.x, v.y)
        local x1, y1 = x - w, y - h
        local x2, y2 = x + w, y + h
        local t_pivotX, t_pivotY = _G.res.getSpritePivot("", blockTable.blocks[v.definition].sprite)
        t_pivotX, t_pivotY = t_pivotX * v.scale.x, t_pivotY * v.scale.y
        setRenderState(-screen.left, -screen.top, worldScale, worldScale, v.angle, t_pivotX, t_pivotY)
        drawRect(1, 0, 0, 0.5, x1, y1, x2, y2, true)
      end
    end
    if copiedObjects ~= nil then
      for k, v in _G.pairs(copiedObjects) do
        local sprite = blockTable.blocks[v.definition].sprite
        local blockDefScale = blockTable.blocks[v.definition].scale or 1
        local pivotX, pivotY = 0, 0
        local flip = 1
        if blockTable.blocks[v.definition].horFlip then
          flip = -flip
        end
        pivotX, pivotY = _G.res.getSpritePivot(sprite)
        setRenderState(flip * -screen.left / (v.scale.x * blockDefScale), -screen.top / (v.scale.y * blockDefScale), flip * worldScale * v.scale.x, worldScale * v.scale.y, flip * v.angle, pivotX, pivotY)
        local x, y = physicsToWorldTransform(v.x + cursorPhysics.x, v.y + cursorPhysics.y)
        x, y = flip * x / v.scale.x, y / v.scale.y
        _G.res.drawSprite(sprite, _G.math.floor(x), _G.math.floor(y))
      end
      setRenderState(0, 0, 1, 1, 0)
    end
    setRenderState(0, 0, 1, 1, 0)
  else
    drawGame()
    if keyHold.L then
      for k, v in _G.pairs(objects.world) do
        if v.startNumber then
          local sprite = blockTable.blocks[v.definition].sprite
          local blockDefScale = blockTable.blocks[v.definition].scale or 1
          local pivotX, pivotY = _G.res.getSpritePivot(sprite)          
          local x, y = physicsToWorldTransform(v.x, (v.y+v.radius)-5.5)
		  setRenderState(-screen.left / blockDefScale, -screen.top / blockDefScale, worldScale, worldScale, v.angle, pivotX, pivotY)
          _G.res.drawString("TEXTS_BASIC", "" .. v.startNumber, x, y, "HCENTER", "VCENTER")		  
		  --BUTTON_SLIDER
        end
      end
      setRenderState(0, 0, 1, 1, 0)
    end
  end
  setRenderState(0, 0, 1, 1, 0)
  _G.res.drawString("TEXTS_BASIC", levelName, 0, 0, "TOP", "LEFT")
  if selectionRectActive then
    local x1, y1 = draggingStartPosWorld.x, draggingStartPosWorld.y
    local x2, y2 = cursorWorld.x, cursorWorld.y
    if x1 > x2 then
      x1, x2 = x2, x1
    end
    if y1 > y2 then
      y1, y2 = y2, y1
    end
    setRenderState(-screen.left, -screen.top, wScale, wScale, 0)
    drawRect(1, 0, 0, 0.5, x1, y1, x2, y2, true)
  end
  setRenderState(0, 0, 1, 1, 0)
  if not editor.drawOneLayer then
    for k, v in _G.pairs(objects.joints) do
      drawJoint(v, "EDITOR_JOINT")
    end
  end
  if selectedObjects[1] ~= nil then
    _G.res.drawString("TEXTS_BASIC", selectedObjects[1].name, 0, 105, "TOP", "LEFT")
    if selectedObjects[1].controllable then
		if selectedObjects[1].startNumber ~= nil then
			_G.res.drawString("TEXTS_BASIC", "Start: " .. selectedObjects[1].startNumber, 0, 35, "TOP", "LEFT")
		end
		if keyHold["SHIFT"] and keyPressed["U"] then
			if not selectedObjects[1].startNumber then
				selectedObjects[1].startNumber = 1
			elseif selectedObjects[1].startNumber then
				selectedObjects[1].startNumber = selectedObjects[1].startNumber+1
			end
		elseif keyHold["SHIFT"] and keyPressed["I"] then
			if selectedObjects[1].startNumber and selectedObjects[1].startNumber>1 then
				selectedObjects[1].startNumber = selectedObjects[1].startNumber-1
			end
		end
		_G.res.drawString("TEXTS_BASIC", "Press Shift U to increase bird order, Shift I to decrease", 0, 140, "TOP", "LEFT")
	end
  end
  if selectedObjects[1] ~= nil then
    if isThemeSpriteSelected and selectedObjects[1].speedX then
      _G.res.drawString("", "SpeedX: " .. selectedObjects[1].speedX, 0, 35, "TOP", "LEFT")
    end
    if selectedObjects[1].controllable and selectedObjects[1].startNumber ~= nil then
      _G.res.drawString("TEXTS_BASIC", "Start: " .. selectedObjects[1].startNumber, 0, 35, "TOP", "LEFT")
    end
  end
  if objects.worldGravity then
    _G.res.drawString("", "Gravity: " .. objects.worldGravity, 0, 70, "TOP", "LEFT")
  end  
		local frictionArray = blockTable.themes.themeSpecialFriction
		if #frictionArray >= 1 then		
			for i = 1, #frictionArray, 1 do
				if frictionArray[i][1] == currentThemeIndex then
					_G.res.drawString("", "Static block friction: " .. (frictionArray[i][2] or "error??"), 0, screenHeight-35, "TOP", "LEFT")
				end   
			end
		end
  _G.res.drawString("", "Current theme: " .. (currentThemeIndex or "error??"), 0, screenHeight-70, "TOP", "LEFT")
  setRenderState(0, 0, 1, 1, 0)
  if not disableSelectionBox then
    for k, v in _G.pairs(selectedObjects) do
      local w, h = 2000, 10
      local pivotX, pivotY = 1000, 5
      if v.sprite ~= nil and v.sprite ~= "" then
        w, h = _G.res.getSpriteBounds("", v.sprite)
        pivotX, pivotY = v.spritePivotX, v.spritePivotY
        local sx, sy = v.scale and v.scale.x or v.scaleX or 1, v.scale and v.scale.y or v.scaleY or 1
        w, h = w * sx, h * sy
        pivotX, pivotY = sx * v.spritePivotX, sy * v.spritePivotY
        w, h = w * 0.5, h * 0.5
        local x, y = physicsToWorldTransform(v.x, v.y)
        local x1, y1 = x - w, y - h
        local x2, y2 = x + w, y + h
        setRenderState(-screen.left, -screen.top, wScale, wScale, v.angle, pivotX, pivotY)
        drawRect(1, 0, 0, 0.5, x1, y1, x2, y2, true)
      elseif v.name == "ground" then
        local x, y = physicsToWorldTransform(v.x, v.y)
        local x1, y1 = x - w, y - 100
        local x2, y2 = x + w, y + h - 100
        setRenderState(-screen.left, -screen.top, wScale, wScale, 0, 0, 0)
        drawRect(1, 0, 0, 0.5, x1, y1, x2, y2, true)
      end
    end
  end
  setRenderState(0, 0, 1, 1, 0)
  if physicsEnabled then
    for k, v in _G.pairs(objects.world) do
      if v.sleeping == true and v.sprite ~= "" then
        local w, h = _G.res.getSpriteBounds("", v.sprite)
        w, h = w * 0.5, h * 0.5
        local x, y = physicsToWorldTransform(v.x, v.y)
        local x1, y1 = x - w, y - h
        local x2, y2 = x + w, y + h
        setRenderState(-screen.left, -screen.top, wScale, wScale, v.angle, v.spritePivotX, v.spritePivotY)
        drawRect(1, 0, 0, 0.5, x1, y1, x2, y2, true)
      end
    end
  end
  if keyHold.O then
    setRenderState(-screen.left * wScale, -screen.top * wScale, 1, 1, 0, 0, 0)
  else
    setRenderState(-screen.left, -screen.top, wScale, wScale, 0, 0, 0)
  end
  _G.res.drawSprite("", "ORIGO", 0, 0)
  if objects.birdZeroPosX and objects.birdZeroPosY and keyHold.CONTROL and keyHold.D then
    drawRect(1, 0, 1, 1, objects.birdZeroPosX - 5, objects.birdZeroPosY - 20, objects.birdZeroPosX + 5, objects.birdZeroPosY, true)
  end
  setRenderState(0, 0, 1, 1, 0)
  if objects.dynamicBirdSpawnPositions ~= nil then
    for k, v in _G.ipairs(objects.dynamicBirdSpawnPositions) do
      local x, y = physicsToScreenTransform(v.x, v.y)
      setRenderState(x / wScale, y / wScale, wScale, wScale, 0, 0, 0)
      _G.res.drawSprite("", "PARTICLE_SLINGDOT", 0, 0)
    end
    setRenderState(0, 0, 1, 1, 0)
  end
  if spawnboxSpecificationMode and objects.BoomBoxSpawnRect ~= nil then
    local spawnbox = objects.BoomBoxSpawnRect
    local width, height = _G.math.abs(spawnbox.left - spawnbox.right) * physicsToScreenMultiplier(), _G.math.abs(spawnbox.top - spawnbox.bottom) * physicsToScreenMultiplier()
    local r, g, b, a = 0.8, 0.8, 0.8, 0.2
    local x, y = physicsToScreenTransform((spawnbox.left + spawnbox.right) / 2, (spawnbox.top + spawnbox.bottom) / 2)
    drawRect(r, g, b, a, x - width / 2, y - height / 2, x + width / 2, y + height / 2, true)
  end
  if objectToAdd ~= nil then
    local sprite = blockTable.blocks[objectToAdd].sprite
    setRenderState(-screen.left, -screen.top, wScale, wScale, objectToAddAngle, _G.res.getSpritePivot("", sprite))
    _G.res.drawSprite("", sprite, _G.math.floor(cursorWorld.x), _G.math.floor(cursorWorld.y))
    setRenderState(0, 0, 1, 1, 0)
  end
  if not editor.drawOneLayer then
    if copiedObjects ~= nil then
      for k, v in _G.pairs(copiedObjects) do
        local sprite = blockTable.blocks[v.definition].sprite
        local blockDefScale = blockTable.blocks[v.definition].scale or 1
        local scaleX, scaleY = v.scaleX or blockDefScale, v.scaleY or blockDefScale
        local pivotX, pivotY = 0, 0
        local flip = 1
        if blockTable.blocks[v.definition].horFlip then
          flip = -flip
        end
        pivotX, pivotY = _G.res.getSpritePivot(sprite)
        setRenderState(flip * -screen.left / scaleX, -screen.top / scaleY, flip * worldScale * scaleX, worldScale * scaleY, flip * v.angle, pivotX, pivotY)
        local x, y = physicsToWorldTransform(v.x + cursorPhysics.x, v.y + cursorPhysics.y)
        x, y = flip * x / scaleX, y / scaleY
        _G.res.drawSprite(sprite, _G.math.floor(x), _G.math.floor(y))
      end
      setRenderState(0, 0, 1, 1, 0)
    end
    if levelSaved then
      _G.res.drawSprite("", "EDITOR_SAVED", screenWidth, 0)
    else
      _G.res.drawSprite("", "EDITOR_NOT_SAVED", screenWidth, 0)
    end
    if physicsEnabled then
      _G.res.drawSprite("", "EDITOR_PHYSICS_ON", screenWidth, 0)
    else
      _G.res.drawSprite("", "EDITOR_PHYSICS_OFF", screenWidth, 0)
    end
    if objects.castleCameraData and objects.castleCameraData[deviceModel] then
      _G.res.drawSprite("", "EDITOR_C_CAMERA_ON", screenWidth, 0)
    else
      _G.res.drawSprite("", "EDITOR_C_CAMERA_OFF", screenWidth, 0)
    end
    if objects.birdCameraData and objects.birdCameraData[deviceModel] then
      _G.res.drawSprite("", "EDITOR_B_CAMERA_ON", screenWidth, 0)
    else
      _G.res.drawSprite("", "EDITOR_B_CAMERA_OFF", screenWidth, 0)
    end
    if objects.doNotWaitForMovingObjects ~= nil then
      _G.res.drawString("", "QUICK END", screenWidth, screenHeight, "BOTTOM", "RIGHT")
    end	
  end
  if editor.previewSprite ~= nil then
    _G.res.drawString("", editor.previewSprite.definitionName, 0, screenHeight, "BOTTOM", "LEFT")
    setRenderState(0, 0, wScale, wScale, 0)
    _G.res.drawSprite(editor.previewSprite.sprite, screenWidth / wScale, 0, "RIGHT", "TOP")
    setRenderState(0, 0, 1, 1, 0)
  end
  if doFailureFlash then
    local alpha = doFailureFlash / doFailureFlashTime
    doFailureFlash = doFailureFlash - doFailureFlash / 4
    drawFullscreenRect(1, 0, 0, alpha)
    _G.res.drawString("", doFailureText, screenWidth * 0.5, 0.5 * screenHeight, "HCENTER", "VCENTER")
    if doFailureFlash < 0.001 then
      doFailureFlash = nil
    end
  end
  setRenderState(0, 0, 1, 1, 0)
  if editorJointPage and editorJointPage.usingTemplates ~= nil and editorJointPage.usingTemplates == true then
    _G.res.drawString("TEXTS_BASIC", "Using Templates: " .. _G.tostring(editorJointPage.usingTemplates), screenWidth, screenHeight * 0.5, "TOP", "RIGHT")
  end
  refreshGroundTextures()
end
function doFailure(text)
  doFailureFlash = 200
  doFailureText = text
end
function drawJoint(joint, sprite)
  if joint.x1 == nil then
    return
  end
  local jointWorldX1 = joint.x1 or 0
  local jointWorldY1 = joint.y1 or 0
  local jointWorldX2 = joint.x2 or 0
  local jointWorldY2 = joint.y2 or 0
  if joint.coordType == 2 then
    jointWorldX1, jointWorldY1 = getWorldPoint(joint.end1, jointWorldX1, jointWorldY1)
    jointWorldX2, jointWorldY2 = getWorldPoint(joint.end2, jointWorldX2, jointWorldY2)
  end
  local xdif = jointWorldX2 - jointWorldX1
  local ydif = jointWorldY2 - jointWorldY1
  local x = 0
  local y = 0
  local sprite = "TRAIL_FLOWER_1"
  if joint.type == 3 then
    sprite = "TRAIL_FLOWER_2"
  end
  local sx, sy = physicsToWorldTransform(jointWorldX1 + xdif * 0.5, jointWorldY1 + ydif * 0.5)
  local worldScale = worldScale or 1
  setRenderState(-screen.left, -screen.top, worldScale, worldScale, 0, _G.res.getSpritePivot("", "TRAIL_WHITE_1"))
  _G.res.drawSprite("", "TRAIL_WHITE_1", sx, sy)
  local obj1 = objects.world[joint.end1]
  local obj2 = objects.world[joint.end2]
  local xCoord, yCoord = physicsToWorldTransform(jointWorldX1, jointWorldY1)
  setRenderState(-screen.left, -screen.top, worldScale, worldScale, obj1.angle, _G.res.getSpritePivot("", sprite))
  _G.res.drawSprite("", sprite, xCoord, yCoord)
  setRenderState(-screen.left, -screen.top, worldScale, worldScale, obj2.angle, _G.res.getSpritePivot("", sprite))
  xCoord, yCoord = physicsToWorldTransform(jointWorldX2, jointWorldY2)
  _G.res.drawSprite("", sprite, xCoord, yCoord)
  setRenderState(0, 0, 1, 1, 0, 0, 0)
end
function initCollisionDummy(selectedObject)
  local name = selectedObject.name
  local selected = objects.world[name]
  local blockDef = blockTable.blocks[selected.definition]
  local dir = 1
  adjustedBlockDef = adjustedBlockDef or {}
  adjustedBlockDef.objectNames = adjustedBlockDef.objectNames or {}
  adjustedBlockDef.objectNames[name] = adjustedBlockDef.objectNames[name] or {}
  if adjustedBlockDef.objectNames[name].radius == nil and blockDef.radius then
    adjustedBlockDef.objectNames[name].radius = blockDef.radius
  end
  if adjustedBlockDef.objectNames[name].spritePivotX == nil and blockDef.spritePivotX then
    adjustedBlockDef.objectNames[name].spritePivotX = blockDef.spritePivotX
  end
  if adjustedBlockDef.objectNames[name].spritePivotY == nil and blockDef.spritePivotY then
    adjustedBlockDef.objectNames[name].spritePivotY = blockDef.spritePivotY
  end
  if adjustedBlockDef.objectNames[name].width == nil and blockDef.width then
    adjustedBlockDef.objectNames[name].width = blockDef.width
  end
  if adjustedBlockDef.objectNames[name].height == nil and blockDef.height then
    adjustedBlockDef.objectNames[name].height = blockDef.height
  end
  if adjustedBlockDef.objectNames[name].vertices == nil and blockDef.vertices ~= nil then
    adjustedBlockDef.objectNames[name].vertices = {}
    for k, v in _G.pairs(blockDef.vertices) do
      _G.table.insert(adjustedBlockDef.objectNames[name].vertices, {
        x = v.x,
        y = v.y
      })
    end
  end
end
function drawCircle(x, y, radius, angle, r, g, b, a, w)
  local points = {}
  radius = _G.math.abs(radius)
  for i = 0, _G.math.pi * 2, 0.5 do
    local px = _G.math.cos(i) * physicsToWorldTransform(radius, 0)
    local py = _G.math.sin(i) * physicsToWorldTransform(radius, 0)
    local point = {
      x + px,
      y + py
    }
    _G.table.insert(points, point)
  end
  drawPolygon(points, w, true, r, g, b, a, angle, x, y)
end
function drawPolygon(points, lineW, inWorld, r, g, b, a, angle, pivotX, pivotY)
  local wScale = worldScale or 1
  _G.table.insert(points, points[1])
  pivotX = pivotX or 0.5
  pivotY = pivotY or 0.5
  local temp = 100000000
  local w = 0
  local h = 0
  local minX = temp
  local maxX = -temp
  local minY = temp
  local maxY = -temp
  for k, v in _G.pairs(points) do
    minX = _G.math.min(minX, points[k][1])
    minY = _G.math.min(minY, points[k][2])
    maxX = _G.math.max(maxX, points[k][1])
    maxY = _G.math.max(maxY, points[k][2])
  end
  local w = maxX - minX
  local h = maxY - minY
  pivotX = pivotX or minX + w * 0.5
  pivotY = pivotY or minY + h * 0.5
  for k, v in _G.pairs(points) do
    if 1 < k then
      local x1 = points[k - 1][1]
      local y1 = points[k - 1][2]
      local x2 = points[k][1]
      local y2 = points[k][2]
      local rotatePivotX = pivotX - x1
      local rotatePivotY = pivotY - y1
      setRenderState(-screen.left, -screen.top, wScale, wScale, angle, rotatePivotX, rotatePivotY)
      drawLine(r, g, b, a, x1, y1, x2, y2, inWorld, lineW)
    end
  end
end
function drawChain(x, y, angle, verticesOrNames, lineWidth, lineColor)
  if verticesOrNames[1].x and verticesOrNames[1].y then
    drawChainFromVertices(x, y, angle, verticesOrNames, lineWidth, lineColor)
  else
    drawChainFromNames(x, y, angle, verticesOrNames, lineWidth, lineColor)
  end
end
function drawChainFromVertices(x, y, angle, vertices, lineWidth, lineColor)
  local points = {}
  for _, vert in _G.pairs(vertices) do
    local px = vert.x * physicsToWorld
    local py = vert.y * physicsToWorld
    local rotatedPx = _G.math.cos(angle) * px - _G.math.sin(angle) * py
    local rotatedPy = _G.math.sin(angle) * px + _G.math.cos(angle) * py
    local point = {
      x + rotatedPx,
      y + rotatedPy
    }
    _G.table.insert(points, point)
  end
  drawPolygon(points, lineWidth, true, lineColor.r, lineColor.g, lineColor.b, lineColor.a, 0, 0, 0)
end
function drawChainFromNames(x, y, angle, vertexNames, lineWidth, lineColor)
  vertices = {}
  local px, py = worldToPhysicsTransform(x, y)
  for _, vertName in _G.ipairs(vertexNames) do
    if objects.world[vertName] then
      local vx, vy = objects.world[vertName].x, objects.world[vertName].y
      _G.table.insert(vertices, {
        x = vx - px,
        y = vy - py
      })
    end
  end
  drawChainFromVertices(x, y, 0, vertices, lineWidth, lineColor)
end
function drawWireFrameRect(x1, y1, x2, y2, lineW, inWorld, r, g, b, a, angle, pivotX, pivotY)
  local points = {
    {x1, y1},
    {x2, y1},
    {x2, y2},
    {x1, y2}
  }
  drawPolygon(points, lineW, inWorld, r, g, b, a, angle, pivotX, pivotY)
end
function drawDummyCollisionBox(object)
  if showSleepingObjects == true then
    local objectName = object.name
    if objectName ~= nil and adjustedBlockDef ~= nil and adjustedBlockDef.objectNames[objectName] ~= nil then
      local selected = objects.world[objectName]
      local blockDef = adjustedBlockDef.objectNames[objectName]
      local x, y = physicsToWorldTransform(selected.x, selected.y)
      local w, h = _G.res.getSpriteBounds("", selected.sprite)
      local px, py = x, y
      local radius = adjustedBlockDef.objectNames[objectName].radius
      local width = adjustedBlockDef.objectNames[objectName].width
      local height = adjustedBlockDef.objectNames[objectName].height
      local vertices = adjustedBlockDef.objectNames[objectName].vertices
      if object.scaleX and object.scaleY then
        w, h = w * object.scaleX, h * object.scaleY
        radius = radius and _G.math.abs(radius * object.scaleX)
        width = width and _G.math.abs(width * object.scaleX)
        height = height and _G.math.abs(height * object.scaleY)
      end
      if radius ~= nil then
        drawCircle(x, y, radius, selected.angle, 255, 0, 255, 255, 2)
      elseif width ~= nil and height ~= nil then
        local ww, hh = physicsToWorldTransform(width, height)
        local x1, y1 = x - ww / 2, y - hh / 2
        local x2, y2 = x + ww / 2, y + hh / 2
        drawWireFrameRect(x1, y1, x2, y2, 1, true, 255, 0, 255, 255, selected.angle, px, py)
      elseif vertices ~= nil then
        local points = {}
        for kk, vv in _G.pairs(blockDef.vertices) do
          local wx, wy = w * vv.x, h * vv.y
          local point = {
            x + wx - w / 2,
            y + wy - h / 2
          }
          _G.table.insert(points, point)
        end
        drawPolygon(points, 2, true, 255, 0, 255, 255, object.angle, px, py)
      end
    end
  end
end
function checkCollide(object1, object2, dir)
  local left1 = object1.x1
  local left2 = object2.x1
  local right1 = object1.x2
  local right2 = object2.x2
  local top1 = object1.y1
  local top2 = object2.y1
  local bottom1 = object1.y2
  local bottom2 = object2.y2
  if dir == 1 then
    if top2 > bottom1 then
      return nil
    end
    if top1 > bottom2 then
      return nil
    end
  end
  if dir == 0 then
    if left2 > right1 then
      return nil
    end
    if left1 > right2 then
      return nil
    end
  end
  return true
end
function getBoundingBox(object)
  local w, h = _G.res.getSpriteBounds(object.sprite)
  local sx, sy = object.scale and object.scale.x or object.scaleX or 1, object.scale and object.scale.y or object.scaleY or 1
  local x, y = object.x, object.y
  if editor.drawOneLayer then
    local drawCoords = getThemeSpriteDrawCoords(object.name, editor.currentLayer)
    local physicsDrawX, physicsDrawY = worldToPhysicsTransform(drawCoords.x - screen.left, drawCoords.y - screen.top)
    x, y = x - physicsDrawX, y - physicsDrawY
  end
  w, h = worldToPhysicsTransform(_G.math.abs(w * sx), _G.math.abs(h * sy))
  local x1 = x - w / 2
  local y1 = y - h / 2
  local x2 = x + w / 2
  local y2 = y - h / 2
  local x3 = x + w / 2
  local y3 = y + h / 2
  local x4 = x - w / 2
  local y4 = y + h / 2
  local _x1 = x - x1
  local _y1 = y - y1
  local _x2 = x - x2
  local _y2 = y - y2
  local _x3 = x - x3
  local _y3 = y - y3
  local _x4 = x - x4
  local _y4 = y - y4
  local an = object.angle
  local cosinus = _G.math.cos(an)
  local sinus = _G.math.sin(an)
  local __x1 = _x1 * cosinus - _y1 * sinus + x
  local __y1 = _x1 * sinus + _y1 * cosinus + y
  local __x2 = _x2 * cosinus - _y2 * sinus + x
  local __y2 = _x2 * sinus + _y2 * cosinus + y
  local __x3 = _x3 * cosinus - _y3 * sinus + x
  local __y3 = _x3 * sinus + _y3 * cosinus + y
  local __x4 = _x4 * cosinus - _y4 * sinus + x
  local __y4 = _x4 * sinus + _y4 * cosinus + y
  local minx = _G.math.min(_G.math.min(__x1, __x2), _G.math.min(__x3, __x4))
  local maxx = _G.math.max(_G.math.max(__x1, __x2), _G.math.max(__x3, __x4))
  local miny = _G.math.min(_G.math.min(__y1, __y2), _G.math.min(__y3, __y4))
  local maxy = _G.math.max(_G.math.max(__y1, __y2), _G.math.max(__y3, __y4))
  return {
    x1 = minx,
    y1 = miny,
    x2 = maxx,
    y2 = maxy
  }
end
function alignObjects(dir)
  local xDir = 0
  local yDir = 0
  if dir == "DOWN" then
    yDir = -1
  elseif dir == "UP" then
    yDir = 1
  elseif dir == "LEFT" then
    xDir = -1
  elseif dir == "RIGHT" then
    xDir = 1
  end
  if selectedObjects ~= nil and 1 < #selectedObjects then
    if dir == "DOWN" then
      _G.table.sort(selectedObjects, function(a, b)
        return a.y > b.y
      end)
    end
    if dir == "UP" then
      _G.table.sort(selectedObjects, function(a, b)
        return a.y < b.y
      end)
    end
    if dir == "LEFT" then
      _G.table.sort(selectedObjects, function(a, b)
        return a.x < b.x
      end)
    end
    if dir == "RIGHT" then
      _G.table.sort(selectedObjects, function(a, b)
        return a.x > b.x
      end)
    end
    for i = 1, #selectedObjects do
      local sel = selectedObjects[i]
      cBox1 = getBoundingBox(sel)
      local w = cBox1.x2 - cBox1.x1
      local h = cBox1.y2 - cBox1.y1
      if yDir == 1 then
        setPosition(sel.name, sel.x, selectedObjectsAreaCoords.y1 + h / 2)
      elseif yDir == -1 then
        setPosition(sel.name, sel.x, selectedObjectsAreaCoords.y2 - h / 2)
      elseif xDir == 1 then
        setPosition(sel.name, selectedObjectsAreaCoords.x2 - w / 2, sel.y)
      elseif xDir == -1 then
        setPosition(sel.name, selectedObjectsAreaCoords.x1 + w / 2, sel.y)
      end
      local val = 1.0E14
      local mincX = val
      local maxcX = -val
      local mincY = val
      local maxcY = -val
      local collided = false
      for j = 1, i do
        local sel2 = selectedObjects[j]
        cBox2 = getBoundingBox(sel2)
        if sel2 ~= sel then
          local collideArea
          if xDir ~= 0 then
            collideArea = checkCollide(cBox1, cBox2, 1)
          else
            collideArea = checkCollide(cBox1, cBox2, 0)
          end
          if collideArea ~= nil then
            mincX = _G.math.min(cBox2.x1, mincX)
            maxcX = _G.math.max(cBox2.x2, maxcX)
            mincY = _G.math.min(cBox2.y1, mincY)
            maxcY = _G.math.max(cBox2.y2, maxcY)
            collided = true
          end
        end
      end
      if collided == true then
        local ww, hh = worldToPhysicsTransform(1, 1)
        if xDir ~= 0 then
          local w = cBox1.x2 - cBox1.x1
          local xp = 0
          if xDir == -1 then
            xp = maxcX
          else
            xp = mincX
          end
          setPosition(sel.name, xp + (ww + w / 2) * -xDir, sel.y)
        else
          local h = cBox1.y2 - cBox1.y1
          local yp = 0
          if yDir == 1 then
            yp = maxcY
          else
            yp = mincY
          end
          setPosition(sel.name, sel.x, yp + (hh + h / 2) * yDir)
        end
      end
    end
  end
end
function refreshGroundTextures()
  --local themeTexture = blockTable.themes[currentTheme].texture
  --local themeBgTexture = blockTable.themes[currentTheme].bgTexture
  for k, v in _G.pairs(objects.world) do
    local bDef = blockTable.blocks[v.definition]
    if bDef.group == "staticBlocks" then
		setTexture(v.name, blockTable.themes.textureArray[currentThemeIndex-15])
		
		local frictionArray = blockTable.themes.themeSpecialFriction
		if #frictionArray >= 1 then		
			for i = 1, #frictionArray, 1 do
				if frictionArray[i][1] == currentThemeIndex then
					bDef.friction = _G.tonumber(frictionArray[i][2])
				end   
			end
		end
			
	end	
  end
end

selectedObjectsAreaCoords = nil
function drawSelectedObjectsArea()
  if selectedObjects ~= nil and #selectedObjects > 0 then
    local val = 1.0E10
    local minX = val
    local minY = val
    local maxX = -val
    local maxY = -val
    for k, v in _G.ipairs(selectedObjects) do
      local points = getBoundingBox(v)
      local w = points.x2 - points.x1
      local h = points.y2 - points.y1
      minX = _G.math.min(minX, v.x - w / 2)
      minY = _G.math.min(minY, v.y - h / 2)
      maxX = _G.math.max(maxX, v.x + w / 2)
      maxY = _G.math.max(maxY, v.y + h / 2)
    end
    if selectedObjectsAreaCoords == nil or keyHold.LBUTTON then
      selectedObjectsAreaCoords = {}
      selectedObjectsAreaCoords.x1 = minX
      selectedObjectsAreaCoords.y1 = minY
      selectedObjectsAreaCoords.x2 = maxX
      selectedObjectsAreaCoords.y2 = maxY
    end
    local worldMinX, worldMinY = physicsToWorldTransform(selectedObjectsAreaCoords.x1, selectedObjectsAreaCoords.y1)
    local worldMaxX, worldMaxY = physicsToWorldTransform(selectedObjectsAreaCoords.x2, selectedObjectsAreaCoords.y2)
    drawWireFrameRect(worldMinX, worldMinY, worldMaxX, worldMaxY, 3, true, 255, 0, 255, 255, 0, 0.5, 0.5)
  else
    selectedObjectsAreaCoords = nil
  end
end
function drawLine(r, g, b, a, x1, y1, x2, y2, inWorld, lineSize)
  local lz = lineSize or 1
  if inWorld == false then
    setRenderState(0, 0, 1, 1)
  end
  drawLine2D(x1, y1, x2, y2, lz, r, g, b, a)
end
function drawString(text, scale, x, y, anchorX, anchorY, inWorld)
  local ax = anchorX or "HCENTER"
  local ay = anchorY or "VCENTER"
  setFont(fontBasic)
  if inWorld ~= true then
    setRenderState(0, 0, scale, scale)
    _G.res.drawString("", text, x * (screenWidth / scale / screenWidth), y * (screenHeight / scale / screenHeight), ay, ax)
  else
    local xp, yp = worldToScreenTransform(x, y)
    scale = scale * worldScale
    setRenderState(0, 0, scale, scale, 0, 0)
    _G.res.drawString("", text, xp * (screenWidth / scale / screenWidth), yp * (screenHeight / scale / screenHeight), ay, ax)
  end
  setRenderState(0, 0, 1, 1)
end
