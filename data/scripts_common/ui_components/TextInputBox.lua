local runningIndex = 0
textInputFields = {}
function openTextField(title, startValue, closeFunc, patternOverride, closeFuncParam, name)
  notificationsFrame:addChild(TextInputBox:new({
    title = title,
    name = name or "textField" .. runningIndex,
    valueType = _G.type(startValue),
    startValue = _G.tostring(startValue),
    closeFunc = closeFunc,
    patternOverride = patternOverride,
    closeFuncParam = closeFuncParam
  }))
end
TextInputBox = ui.Frame:inherit()
function TextInputBox:init()
  ui.Frame.init(self)
  createTextInputField(self.name)
  runningIndex = runningIndex + 1
  self.startValue = self.startValue
  self.title = self.title
  self.valueType = self.valueType
  self.closeFunc = self.closeFunc
  self.patternOverride = self.patternOverride
  self.closeFuncParam = self.closeFuncParam
  self.inputText = self.startValue or ""
  self.width = screenWidth * 0.7
  self.height = screenHeight * 0.1
  self.initialHeight = self.height
  self.inputActive = false
  local darkening = ui.Rect:new()
  darkening.name = "darkening"
  darkening.a = 0.7
  darkening.width = screenWidth
  darkening.height = screenHeight
  self:addChild(darkening)
  local backgroundEdges = ui.Rect:new()
  backgroundEdges.name = "backgroundEdges"
  backgroundEdges.r = 1
  backgroundEdges.g = 1
  backgroundEdges.b = 1
  backgroundEdges.centered = true
  self:addChild(backgroundEdges)
  local background = ui.Rect:new()
  background.name = "background"
  background.a = 0.95
  background.centered = true
  self:addChild(background)
  local fontSize = self.fontSize or 25
  loadSystemFont("textInput" .. fontSize, {"Verdana", "Arial"}, fontSize)
  local font = "textInput" .. fontSize
  local input = ui.Text:new({
    name = "input",
    text = self.startValue .. "|"
  })
  input:setFont(font)
  input.hanchor = "LEFT"
  input.vanchor = "VCENTER"
  input.textBoxSize = screenWidth * 0.7
  background:addChild(input)
  local title = ui.Text:new({
    name = "title",
    text = self.title
  })
  title:setFont(font)
  title.vanchor = "BOTTOM"
  background:addChild(title)
  local okButton = ui.ImageButton:new()
  okButton.name = "okButton"
  okButton:setImage("MENU_YES")
  okButton.returnValue = "OK"
  okButton.activateOnRelease = true
  okButton.clickSound = "menu_confirm"
  self:addChild(okButton)
  local closeButton = ui.ImageButton:new()
  closeButton.name = "closeButton"
  closeButton:setImage("MENU_NO")
  closeButton.returnValue = "CLOSE"
  closeButton.activateOnRelease = true
  closeButton.clickSound = "menu_confirm"
  self:addChild(closeButton)
  g_disableHotkeys = true
  activateTextInputField(self.name, self.startValue)
end
function TextInputBox:onExit()
  g_disableHotkeys = false
  removeTextInputField(self.name)
  textInputFields[self.name] = nil
end
function TextInputBox:layout()
  ui.Frame.layout(self)
  local background = self:getChild("background")
  background.width = self.width
  background.height = self.height
  background.x = screenWidth * 0.5
  background.y = screenHeight * 0.5
  local backgroundEdges = self:getChild("backgroundEdges")
  backgroundEdges.width = background.width + 4
  backgroundEdges.height = background.height + 4
  backgroundEdges.x = background.x
  backgroundEdges.y = background.y
  local input = background:getChild("input")
  input.y = 0
  input.x = -self.width * 0.49
  input:clip()
  local okButton = self:getChild("okButton")
  okButton.x = screenWidth * 0.5 - okButton.w
  okButton.y = screenHeight * 0.9
  local closeButton = self:getChild("closeButton")
  closeButton.x = screenWidth * 0.5 + closeButton.w
  closeButton.y = okButton.y
  local title = background:getChild("title")
  title.x = 0
  title.y = -title:getHeight()
end
function TextInputBox:update(dt, time)
  ui.Frame.update(self, dt, time)
  local background = self:getChild("background")
  local input = background:getChild("input")
  local inputText = textInputFields[self.name]
  local changed = inputText and inputText ~= self.inputText
  if changed then
    self.inputText = inputText
  end
  if keyReleased.LEFT then
    local length = _G.string.len(self.inputText)
    if 0 < length then
      local beginning = _G.string.sub(self.inputText, 1, length - 1)
      local ending = _G.string.sub(self.inputText, length)
      if not self.extra then
        self.extra = ""
      end
      self.extra = ending .. self.extra
      self.inputText = beginning
      input.text = beginning .. "|" .. self.extra
      input:clip()
      activateTextInputField(self.name, self.inputText)
      textInputFields[self.name] = self.inputText
    end
  elseif keyReleased.RIGHT then
    if self.extra then
      local length = _G.string.len(self.extra)
      if 0 < length then
        if length == 1 then
          self.inputText = self.inputText .. self.extra
          input.text = self.inputText .. "|"
          input:clip()
          self.extra = nil
        else
          self.inputText = self.inputText .. _G.string.sub(self.extra, 1, 1)
          self.extra = _G.string.sub(self.extra, 2)
          input.text = self.inputText .. "|" .. self.extra
          input:clip()
        end
      end
      activateTextInputField(self.name, self.inputText)
      textInputFields[self.name] = self.inputText
    end
  elseif changed then
    input.text = self.inputText .. (self.extra and "|" .. self.extra or "|")
    input:clip()
    activateTextInputField(self.name, self.inputText)
  end
end
function TextInputBox:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "OK" then
    self:closeInput(true)
  elseif result == "CLOSE" then
    self:closeInput(false)
  end
  return "BLOCK", nil, nil
end
function TextInputBox:onKeyEvent(eventType, key)
  local result, meta, item = ui.Frame.onKeyEvent(self, eventType, key)
  if eventType == "RELEASE" then
    if key == "ESCAPE" then
      self:closeInput(false)
    elseif key == "RETURN" then
      self:closeInput(true)
    end
  end
  return "BLOCK", nil, self
end
function TextInputBox:closeInput(saveChanges)
  if saveChanges then
    local pattern = self.patternOverride or "[^%w_]"
    self.inputText = self.inputText .. (self.extra or "")
    if _G.string.match(self.inputText, pattern) then
      self.extra = nil
      textInputFields[self.name] = self.inputText
      notificationsFrame:addChild(ui.MessageBox:new({
        content = "Unallowed characters detected :("
      }))
      activateTextInputField(self.name, textInputFields[self.name] or "")
    else
      notificationsFrame:removeChild(self)
      self.closeFunc(self:getReturnValue(self.inputText), self.closeFuncParam)
    end
  else
    notificationsFrame:removeChild(self)
  end
end
function TextInputBox:getReturnValue(input)
  if self.valueType == "number" then
    return _G.tonumber(input)
  end
  return input
end
