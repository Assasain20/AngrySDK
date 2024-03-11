if showEditor then
  print("Level editor is not supported with dynamic assets, disabling dynamic asset loading\n")
  useDynamicAssets = false
  return
end
createDynamicHandler("dynamic")
function loadImages()
end
function loadCompoSprites()
end
function releaseImages()
end
function releaseCompoSprites()
end
function loadThemeGraphics()
end
function loadAllThemeGraphics()
end
loadLuaFile(scriptPath .. "/dynamic/default.lua", "")
local reqKey = "_dynreq"
function dynamic.setRequirements(menu, requirements)
  _G.assert(_G.type(menu) == "table", "Invalid argument")
  menu[reqKey] = requirements
end
function dynamic.getRequirements(menu)
  if menu[reqKey] ~= nil then
    return menu[reqKey]
  else
    _G.assert(_G.type(menu.name) == "string", "invalid name value")
    return menu.name
  end
end
function dynamic.enterIngame(oldTheme, theme)
  local currentRoot = menuManager:getRoot()
  if currentRoot and currentRoot.name ~= "gameHud" then
    _G.assert(_G.type(currentRoot.name) == "string", "invalid name value")
    dynamic.delayrelease(currentRoot.name)
  end
  if oldTheme ~= theme then
    dynamic.delayrelease(oldTheme)
  end
  dynamic.load({"ingame", theme})
end
function dynamic.eventTriggered(o, event)
  if event.id == events.EID_LEAVE_GAME then
    dynamic.delayrelease({"ingame"})
  end
end
filename = "dynamicassets.lua"
