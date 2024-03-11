ContextItem = ui.Frame:inherit()
local validInputKeys = {
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "DASH",
  "SPACE",
  "BACKSPACE",
  "RETURN"
}
function ContextItem:init()
  ui.Frame.init(self)
  self.editing = false
  self.key = self.key
  self.value = self.value
  self.type = self.type
  self.changed = self.changed
  print("k,v: " .. _G.tostring(self.key) .. ", " .. _G.tostring(self.value))
  self:createValueItem()
  self:createKeyItem()
end
function ContextItem:createValueItem()
  if self.value ~= nil then
    if self.type == "checkBox" then
      local valueItem = ui.Frame:new()
      valueItem.value = self.value
      valueItem.name = "value"
      print("value in checkBox: " .. _G.tostring(self.value))
      self:addChild(valueItem)
    else
      local valueItem = ui.Text:new()
      valueItem.text = _G.tostring(self.value)
      valueItem.name = "value"
      self:addChild(valueItem)
    end
  end
end
function ContextItem:createKeyItem()
  if self.key then
    local keyItem = ui.Text:new()
    keyItem.text = _G.tostring(self.key)
    keyItem.name = "key"
    if self.changed then
      print("context item value has been changed")
      keyItem.color = {
        255,
        0,
        0,
        255
      }
      keyItem.colorMode = "fill"
    end
    self:addChild(keyItem)
  end
end
function ContextItem:layout()
  local keyItem = self:getChild("key")
  local valueItem = self:getChild("value")
  if keyItem then
    keyItem.x = 0
    keyItem.y = 0
    keyItem.hanchor = "HCENTER"
    keyItem.vanchor = "BOTTOM"
  end
  if valueItem then
    valueItem.x = 0
    valueItem.y = 0
    valueItem.hanchor = "HCENTER"
    valueItem.vanchor = "BOTTOM"
  end
  if valueItem and keyItem then
    keyItem.hanchor = "RIGHT"
    valueItem.hanchor = "LEFT"
  end
end
function ContextItem:changeAnchor(hanchor, vanchor)
  local keyItem = self:getChild("key")
  if keyItem then
    if hanchor then
      keyItem.hanchor = hanchor
    end
    if vanchor then
      keyItem.vanchor = vanchor
    end
  end
end
function ContextItem:update(dt, editing)
  local valueItem = self:getChild("value")
  if valueItem and valueItem.text then
    local index = _G.string.find(valueItem.text, "_", 1)
    if index then
      if self.editing == false then
        valueItem.text = 1 < _G.string.len(valueItem.text) and _G.string.sub(valueItem.text, 1, _G.string.len(valueItem.text) - 1) or "0"
        print("value text when not editing: " .. valueItem.text)
      end
    elseif self.editing then
      valueItem.text = valueItem.text .. "_"
    end
    if self.editing and not editing then
      for i, key in _G.ipairs(validInputKeys) do
        if keyPressed[key] then
          local text = _G.string.sub(valueItem.text, 1, _G.string.len(valueItem.text) - 1)
          if key == "DASH" then
            if _G.string.len(text) == 0 then
              valueItem.text = "-_"
            end
          elseif key == "BACKSPACE" then
            if _G.string.len(text) > 0 then
              valueItem.text = _G.string.sub(text, 1, _G.string.len(text) - 1) .. "_"
            end
          elseif key == "SPACE" then
            if _G.string.len(valueItem.text) > 2 or 1 < _G.string.len(valueItem.text) and not _G.string.find(text, "-", 1) then
              valueItem.text = text .. "._"
            end
          elseif key == "RETURN" then
            valueItem.text = text
            self.editing = false
          else
            valueItem.text = text .. key
          end
          print("key pressed: " .. _G.tostring(key))
          break
        end
      end
      return true
    end
  end
  return false
end
function ContextItem:getValue()
  local valueItem = self:getChild("value")
  if valueItem then
    if valueItem.text then
      local index = _G.string.find(valueItem.text, "_", 1)
      if index then
        valueItem.text = 1 < _G.string.len(valueItem.text) and _G.string.sub(valueItem.text, 1, _G.string.len(valueItem.text) - 1) or "0"
      end
      local number = _G.tonumber(valueItem.text)
      if not number then
        valueItem.text = "0"
        number = 0
      end
      return number
    else
      return valueItem.value
    end
  end
  return nil
end
function ContextItem:getKey()
  return self.key
end
function ContextItem:hasValueItem()
  local valueItem = self:getChild("value")
  if valueItem then
    return true
  end
  return false
end
function ContextItem:getKeyWidth()
  local keyItem = self:getChild("key")
  if keyItem then
    return keyItem:getWidth() * self.scaleX
  end
  return 0
end
function ContextItem:getWidth()
  local keyItem = self:getChild("key")
  local valueItem = self:getChild("value")
  local width = 0
  if keyItem then
    width = keyItem:getWidth()
  end
  if valueItem then
    local w = 0
    if self.type == "checkBox" then
      w = self:getHeight()
    else
      w = valueItem:getWidth()
    end
    width = width + w
  end
  return width * self.scaleX
end
function ContextItem:getHeight()
  local keyItem = self:getChild("key")
  local valueItem = self:getChild("value")
  local height
  if keyItem then
    height = keyItem:getHeight()
  end
  if valueItem and self.type ~= "checkBox" then
    if not height then
      height = valueItem:getHeight()
    else
      height = _G.math.max(height, valueItem:getHeight())
    end
  end
  return height * self.scaleY
end
function ContextItem:setEditing(edit)
  self.editing = edit
end
function ContextItem:handlePointerEvent(x, y)
  local keyItem = self:getChild("key")
  local valueItem = self:getChild("value")
  if keyItem and keyItem:checkBounds(x - self.x, y - self.y) then
    return "SELECT", self.key
  elseif valueItem then
    if self.type ~= "checkBox" then
      if valueItem:checkBounds(x - self.x, y - self.y) then
        self.editing = true
        return "START_EDIT"
      elseif self.editing then
        self.editing = false
        return "STOP_EDIT"
      else
        self.editing = false
      end
    else
      local checkBoxWidth = self:getHeight()
      if x > self.x + checkBoxWidth * 0.1 and x < self.x + checkBoxWidth * 0.9 and y < self.y - checkBoxWidth * 0.1 and y > self.y - checkBoxWidth * 0.9 then
        valueItem.value = not valueItem.value
        return "CHECKBOX_TOGGLE", self
      end
    end
  end
  return nil, nil
end
function ContextItem:draw(x, y, scale_x, scale_y, angle, hover_scale)
  local valueItem = self:getChild("value")
  local keyItem = self:getChild("key")
  if valueItem and self.type == "checkBox" then
    local checkBoxWidth = self:getHeight()
    local color = {
      r = 1,
      g = 0,
      b = 0
    }
    if valueItem.value then
      color = {
        r = 0,
        g = 1,
        b = 0
      }
    end
    drawRect(color.r, color.g, color.b, 1, self.x + checkBoxWidth * 0.1, self.y - checkBoxWidth * 0.9, self.x + checkBoxWidth * 0.9, self.y - checkBoxWidth * 0.1, false)
  end
  ui.Frame.draw(self, x, y, scale_x, scale_y, angle, hover_scale)
end
