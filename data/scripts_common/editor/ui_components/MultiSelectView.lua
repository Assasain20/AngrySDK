MultiSelectView = ui.Frame:inherit()
function MultiSelectView:new(o)
  o.items = o.items or {}
  return ui.Frame.new(self, o)
end
function MultiSelectView:init()
  local gridFrame = ui.Frame:new({name = "gridFrame"})
  self:addChild(gridFrame)
  self.scrollY = 0
  self.widestItem = 0
  self.highestItem = 0
  for i, v in _G.ipairs(self.items) do
    local selectButton = ui.ImageButton:new({
      name = "button_" .. i
    })
    selectButton:setImage(v.image)
    if selectButton.w > self.widestItem then
      self.widestItem = selectButton.w
    end
    if selectButton.h > self.highestItem then
      self.highestItem = selectButton.h
    end
    selectButton.returnValue = "TOGGLE_SELECTION"
    selectButton.meta = i
    gridFrame:addChild(selectButton)
    local selectButtonText = ui.Text:new({
      name = "button_text"
    })
    selectButtonText.text = v.key
    selectButtonText.scaleX = 0.5
    selectButtonText.scaleY = selectButtonText.scaleX
    selectButton:addChild(selectButtonText)
    local checkMark = ui.Image:new({
      name = "button_check"
    })
    checkMark:setImage("SHOP_BOUGHT")
    checkMark.scaleX = 0.4
    checkMark.scaleY = checkMark.scaleX
    checkMark.visible = v.value
    selectButton:addChild(checkMark)
  end
end
function MultiSelectView:draw(x, y, scaleX, scaleY, angle, hoverScale)
  drawFullscreenRect(0, 0, 0, 0.85)
  ui.Frame.draw(self, x, y, scaleX, scaleY, angle, hoverScale)
end
function MultiSelectView:update(dt, time)
  if cursor.wheelTriggered then
    self.scrollY = self.scrollY + 50 * cursor.wheel
    self:layout()
    cursor.wheelTriggered = false
  end
  if keyPressed.UP then
    self.scrollY = self.scrollY + 10
    self:layout()
  elseif keyPressed.DOWN then
    self.scrollY = self.scrollY - 10
    self:layout()
  elseif keyHold.UP then
    self.scrollY = self.scrollY + 10
    self:layout()
  elseif keyHold.DOWN then
    self.scrollY = self.scrollY - 10
    self:layout()
  end
end
function MultiSelectView:layout()
  local gridFrame = self:getChild("gridFrame")
  if self.scrollY > 0 then
    self.scrollY = 0
  end
  local widest = self.widestItem
  local highest = self.highestItem
  local columns = _G.math.floor(screenWidth / widest)
  local xOffset = 0
  local yOffset = 0
  local rowIndex = 1
  for i, v in _G.ipairs(self.items) do
    local selectButton = gridFrame:getChild("button_" .. i)
    selectButton.x = xOffset + widest * 0.9
    selectButton.y = yOffset + 0.9 * highest
    xOffset = xOffset + widest
    rowIndex = rowIndex + 1
    if columns < rowIndex then
      yOffset = yOffset + highest
      xOffset = 0
      rowIndex = 1
    end
    local text = selectButton:getChild("button_text")
    text.textBoxSize = widest * 0.75
    text:clip()
    local check = selectButton:getChild("button_check")
    check.x = widest * 0.25
    check.y = highest * 0.25
    check.visible = v.value
  end
  if self.scrollY < -yOffset then
    self.scrollY = -yOffset
  end
  gridFrame.y = self.scrollY
end
function MultiSelectView:onKeyEvent(type, key)
  local result, meta, item = ui.Frame.onKeyEvent(self, type, key)
  if type == "RELEASE" then
    if key == "BACK" or key == "ESCAPE" then
      notificationsFrame:removeChild(self)
    elseif key == "RETURN" and self.callback then
      self.callback(self.callbackOwner, self.items)
      notificationsFrame:removeChild(self)
    end
  end
  return "BLOCK", nil, self
end
function MultiSelectView:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "TOGGLE_SELECTION" then
    self.items[meta].value = not self.items[meta].value
    self:layout()
  end
  return "BLOCK", nil, self
end
