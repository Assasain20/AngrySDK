local g_saved_log = ""
local g_closing = false
local ui = gamelua.ui
local screenWidth = gamelua.screenWidth
local screenHeight = gamelua.screenHeight
DebugConsole = ui.Frame:new()
function DebugConsole:init()
  self.name = "DebugConsole"
  self.fromIngame = false
  g_closing = false
  gamelua.activateDebugConsole("")
  local bg = ui.Rect:new()
  bg.name = "bg"
  bg.a = 0.8
  bg.width = screenWidth
  bg.height = screenHeight * 0.1
  self:addChild(bg)
  local input = ui.Text:new({name = "input", text = ""})
  input:setFont(gamelua.getFontBasic)
  input.hanchor = "LEFT"
  input.vanchor = "BOTTOM"
  bg:addChild(input)
  local blinker = ui.Text:new({name = "blinker", text = "_"})
  blinker:setFont(gamelua.getFontBasic)
  blinker.hanchor = "LEFT"
  blinker.vanchor = "BOTTOM"
  bg:addChild(blinker)
  local run_button = ui.ImageButton:new()
  run_button.name = "run_button"
  run_button:setImage("MENU_YES")
  run_button.scaleX = 0.5
  run_button.scaleY = 0.5
  run_button.returnValue = "RUN_CODE"
  run_button.activateOnRelease = true
  run_button.clickSound = "menu_confirm"
  self:addChild(run_button)
  local exit_button = ui.ImageButton:new()
  exit_button.name = "exit_button"
  exit_button:setImage("MENU_NO")
  exit_button.scaleX = 0.5
  exit_button.scaleY = 0.5
  exit_button.returnValue = "EXIT_DEBUGCONSOLE"
  exit_button.activateOnRelease = true
  exit_button.clickSound = "menu_confirm"
  self:addChild(exit_button)
  local log_bg = ui.Rect:new()
  log_bg.name = "log_bg"
  log_bg.a = 0.6
  log_bg.width = screenWidth
  log_bg.height = screenHeight * 0.9
  self:addChild(log_bg)
  local log_scroll = ui.ScrollFrame:new()
  log_scroll.name = "log_scroll"
  log_scroll.scroll_axis = "y"
  self:addChild(log_scroll)
  local log_text = ui.Text:new({name = "log_text", text = ""})
  log_text:setFont(gamelua.getFontBasic)
  log_text.hanchor = "LEFT"
  log_text.vanchor = "TOP"
  log_text:clip()
  log_scroll:addChild(log_text)
  gamelua.eventManager:addEventListener(gamelua.events.EID_GAME_RESUMED, self)
end
function DebugConsole:onEntry()
  ui.Frame.onEntry(self)
  if gamelua.isPhysicsEnabled() then
    gamelua.setPhysicsEnabled(false)
    function gamelua.currentGameMode()
    end
    self.fromIngame = true
  end
  if g_saved_log ~= "" then
    self:addToLog(g_saved_log)
  end
end
function DebugConsole:layout()
  ui.Frame.layout(self)
  local exit_button = self:getChild("exit_button")
  exit_button.x = screenWidth - exit_button.w * exit_button.scaleX * 0.6
  exit_button.y = exit_button.h * exit_button.scaleY * 0.6
  local run_button = self:getChild("run_button")
  run_button.x = run_button.w * run_button.scaleX * 0.6
  run_button.y = run_button.h * run_button.scaleY * 0.6
  local bg = self:getChild("bg")
  bg.x = 0
  bg.y = 0
  local input = bg:getChild("input")
  input.x = screenWidth * 0.01 + run_button.x + run_button.w * run_button.scaleX * 0.6
  input.y = bg.height - screenHeight * 0.01
  input.textBoxSize = screenWidth - input.x - (screenWidth - exit_button.x) - exit_button.w / 2
  local log_bg = self:getChild("log_bg")
  log_bg.x = 0
  log_bg.y = bg.height
  local log_scroll = self:getChild("log_scroll")
  local log_text = log_scroll:getChild("log_text")
  log_text.x = screenWidth * 0.01
  log_text.y = screenHeight * 0.01
  log_scroll.x = 0
  log_scroll.y = bg.height
  log_scroll.clip = {
    x = 0,
    y = bg.height,
    w = screenWidth,
    h = screenHeight - bg.height
  }
end
function DebugConsole:update(dt, time)
  ui.Frame.update(self, dt, time)
  local bg = self:getChild("bg")
  local input = bg:getChild("input")
  local blinker = bg:getChild("blinker")
  if g_debugconsole_text then
    input.text = g_debugconsole_text
    input:clip()
    g_debugconsole_text = nil
    blinker.y = input.y
    if #input.lines > 0 then
      blinker.x = input.x + _G.res.getStringWidth(input.lines[#input.lines].text)
    else
      blinker.x = input.x
    end
  end
  if _G.math.floor(time * 2) % 2 == 0 then
    blinker:setVisible(false)
  else
    blinker:setVisible(true)
  end
  if self.log_changed then
    local log_scroll = self:getChild("log_scroll")
    local log_text = log_scroll:getChild("log_text")
    log_text:clip()
    local anchors = {}
    for i = 1, #log_text.lines do
      _G.table.insert(anchors, i, {
        x = 0,
        y = (i - 1) * log_text:getFontLeading()
      })
    end
    log_scroll:setAnchors(anchors)
    log_scroll:setCurrentAnchor(1)
    self.log_changed = false
  end
  for k, v in _G.pairs(gamelua.keyPressed) do
    if k ~= "LBUTTON" then
      gamelua.keyPressed[k] = false
    end
  end
  for k, v in _G.pairs(gamelua.keyHold) do
    if k ~= "LBUTTON" then
      gamelua.keyHold[k] = false
    end
  end
end
function DebugConsole:addToLog(text)
  local log_scroll = self:getChild("log_scroll")
  local log_text = log_scroll:getChild("log_text")
  if _G.string.len(log_text.text) > 15000 then
    log_text.text = _G.string.sub(log_text.text, 1, 15000)
  end
  log_text.text = text .. [[


]] .. log_text.text
  g_saved_log = log_text.text
  self.log_changed = true
end
function DebugConsole:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "EXIT_DEBUGCONSOLE" then
    self:close()
  elseif result == "RUN_CODE" then
    self:runInput()
  elseif y < self:getChild("bg").height then
    local input = self:getChild("bg"):getChild("input")
    gamelua.activateDebugConsole(input.text)
  end
  return "BLOCK", nil, self
end
function DebugConsole:onKeyEvent(eventType, key)
  if eventType == "RELEASE" and key == "RETURN" then
    self:runInput()
  end
  return "BLOCK", nil, self
end
function DebugConsole:runInput()
  local input = self:getChild("bg"):getChild("input")
  self:evaluateString(input.text)
  input.text = ""
  if not g_closing then
    gamelua.activateDebugConsole("")
  end
end
function DebugConsole:eventTriggered(event)
  if event.id == gamelua.events.EID_GAME_RESUMED then
    self:close()
  end
end
function DebugConsole:evaluateString(command)
  if command == nil or command == "" then
    return
  end
  readyCommand = processMacros(command)
  local printable = true
  local value_func = _G.loadstring("return " .. readyCommand)
  local errorMessage = ""
  if value_func == nil then
    value_func, errorMessage = _G.loadstring(readyCommand)
    printable = false
  end
  if value_func ~= nil then
    _G.setfenv(value_func, gamelua)
    self:printValues(command, printable, _G.pcall(value_func))
  else
    self:addToLog(errorMessage)
  end
end
function DebugConsole:printValues(command, printable, ...)
  local new_log = ""
  if _G.type(arg[2]) == "table" and #arg == 2 then
    new_log = "Table contents: " .. command
    for k, v in _G.pairs(arg[2]) do
      new_log = new_log .. "\n" .. k .. ": " .. _G.tostring(v)
    end
  else
    local value
    for i = 2, #arg do
      if value ~= nil and value ~= "" then
        value = value .. ", "
      end
      value = (value or "") .. _G.tostring(arg[i])
    end
    new_log = command
    if printable then
      new_log = new_log .. ": " .. _G.tostring(value)
    end
  end
  self:addToLog(new_log)
end
function DebugConsole:close()
  if self.fromIngame then
    gamelua.setPhysicsEnabled(true)
    gamelua.currentGameMode = gamelua.updateGame
  end
  gamelua.deactivateDebugConsole()
  gamelua.eventManager:removeEventListener(gamelua.events.EID_GAME_RESUMED, self)
  gamelua.notificationsFrame:removeChild(self)
end
function DebugConsole:clear()
  local log_text = self:getChild("log_scroll"):getChild("log_text")
  log_text.text = ""
  g_saved_log = ""
  log_text:clip()
end
function isDebugConsoleOpen()
  return gamelua.notificationsFrame:getChild("DebugConsole") ~= nil
end
function gestureActivation()
  if g_last_touch_count == gamelua.touchcount then
    return false
  end
  local touchCap = 4
  if touchState == nil or touchState == touchCap * 2 then
    touchState = 0
  end
  if touchCap > touchState and gamelua.touchcount == touchState + 1 or touchCap <= touchState and touchCap - 1 - gamelua.touchcount == touchState - touchCap then
    touchState = touchState + 1
  else
    touchState = 0
  end
  g_last_touch_count = gamelua.touchcount
  return touchState == touchCap * 2
end
function addDebugVariable(var_name)
  local variable_frame = gamelua.notificationsFrame:getChild("WatcherFrame")
  if variable_frame == nil then
    variable_frame = WatcherFrame:new()
    gamelua.notificationsFrame:addChild(variable_frame)
  end
  variable_frame:addVariable(var_name)
end
function clearWatcherFrame()
  local variable_frame = gamelua.notificationsFrame:getChild("WatcherFrame")
  if variable_frame ~= nil then
    variable_frame:clear()
  end
end
function processMacros(command)
  local macros = {
    mm = "menuManager",
    em = "eventManager",
    en = "eventManager:notify",
    cr = "menuManager:changeRoot",
    hs = "highscores",
    rk = "notifyEventManager(\"EID_MATTEL_TOY_ACTIVATED\")",
    rr = "notifyEventManager( events.EID_MATTEL_RANDOM_MODE, { popup = true } )",
    rt = "menuManager:getRoot()",
    sw = "settingsWrapper",
    cl = "notificationsFrame:getChild(\"DebugConsole\"):clear()",
    xx = "notificationsFrame:getChild(\"DebugConsole\"):close()",
    pl = "previousLevel()",
    nl = "nextLevel()",
    lc = "initLevelComplete()",
    lf = "initLevelFailed(1000)",
    dr = "settingsWrapper:setLastRewardDate({year = 0, month = 0, day = 0, hour = 0, minutes = 0, seconds = 0})",
    ga = "for _, page in _G.ipairs( g_episodes.G.pages ) do for _, level in _G.ipairs( page.levels ) do settingsWrapper:unlockGoldenEgg(level.name) end end",
    pu = "bundleReward(100)",
    ts = "for _, v in _G.ipairs(g_episodeIds) do local episode = g_episodes[v] for _, page in _G.ipairs(episode.pages) do for _, level in _G.ipairs(page.levels) do if starTable[level.name] then if not highscores[level.name] then highscores[level.name] = {} end highscores[level.name].score = 1000000 highscores[level.name].completed = true end end end end",
    sync = "notifyEventManager(events.EID_START_CLOUD_SYNC)",
    aw = "DebugConsole.addDebugVariable",
    cw = "DebugConsole.clearWatcherFrame()",
    pr = "local prnt = function(...) notificationsFrame:getChild(\"DebugConsole\"):printValues(\"print\", true, true, _G.unpack(arg)) end prnt",
    ge = "local ge = function(level) goldenEggAchieved(g_episodes.G.level_list[level]) end ge",
    fal = "for k,v in allLevels() do "
  }
  if _G.string.find(command, "@") then
    command = _G.string.gsub(command, "@", "")
    command = "$xx " .. command
    g_closing = true
  end
  for macro, value in _G.pairs(macros) do
    command = _G.string.gsub(command, "$" .. macro, value)
  end
  return command
end
WatcherFrame = ui.Frame:new()
function WatcherFrame:init()
  self.name = "WatcherFrame"
  self.variable_amount = 0
  self.updateTimer = 0
end
function WatcherFrame:layout()
  ui.Frame.layout(self)
  for i = 1, self.variable_amount do
    local var_text = self:getChild("variable_" .. i)
    var_text.x = 0.01 * screenWidth
    var_text.y = screenHeight * 0.99 - i * var_text:getFontLeading()
  end
end
function WatcherFrame:update(dt, time)
  ui.Frame.update(self, dt, time)
  self.updateTimer = self.updateTimer + dt
  if self.updateTimer > 0.5 then
    for i = 1, self.variable_amount do
      local var_text = self:getChild("variable_" .. i)
      local command = processMacros(var_text.command)
      local value_func, errorMessage = _G.loadstring("return " .. command)
      if value_func == nil then
        value_func, errorMessage = _G.loadstring(command)
      end
      local value = {}
      if value_func ~= nil then
        _G.setfenv(value_func, gamelua)
        value = {
          _G.pcall(value_func)
        }
      end
      if value[1] == true then
        var_text.text = command .. ": " .. _G.tostring(value[2])
        for i2 = 3, #value do
          var_text.text = var_text.text .. ", " .. _G.tostring(value[i2])
        end
      else
        var_text.text = "ERROR"
      end
      var_text:clip()
    end
    self.updateTimer = 0
  end
end
function WatcherFrame:addVariable(command)
  self.variable_amount = self.variable_amount + 1
  local new_var = ui.Text:new()
  new_var.name = "variable_" .. self.variable_amount
  new_var.command = command or ""
  new_var.text = ""
  new_var:setFont(gamelua.getFontBasic)
  new_var.hanchor = "LEFT"
  new_var.vanchor = "BOTTOM"
  self:addChild(new_var)
  self:layout()
end
function WatcherFrame:clear()
  for i = 1, self.variable_amount do
    local var_text = self:getChild("variable_" .. i)
    var_text.text = ""
    var_text:clip()
    var_text = nil
  end
  self.variable_amount = 0
end
filename = "DebugConsole.lua"
