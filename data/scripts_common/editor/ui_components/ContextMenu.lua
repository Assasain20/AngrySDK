ContextMenu = ui.Frame:inherit()
function ContextMenu:new(o)
  o.items = o.items or {}
  o.originals = o.originals or nil
  return ui.Frame.new(self, o)
end
function ContextMenu:init()
  ui.Frame.init(self)
  self.items = self.items
  self.type = self.type
  self.x = self.x or 0
  self.y = self.y or 0
  self.preview = self.preview
  self.fullScreen = self.fullScreen
  self.callback = self.callback
  self.callback_parameter = self.callback_parameter
  self.originals = self.originals
  if not self.name or self.name == "UNDEFINED" then
    self.name = "contextMenu"
  end
  if self.type == "selection" then
    self.scrollY = 0
    self.maxScrollY = 0
  else
    self.scrollY = nil
  end
  if self.x and self.y then
    print("x, y: " .. self.x .. ", " .. self.y)
  end
  for k, v in _G.pairs(self.items) do
    local key, value
    if self.type == "selection" then
      key = v
    elseif self.type == "parameters" then
      key = k
      value = v
    elseif self.type == "checkBox" then
      key = v.key
      value = v.value
      print("adding checkBox: " .. _G.tostring(key) .. ", " .. _G.tostring(value))
    end
    local changed = false
    if self.originals then
      print("has originals: " .. _G.tostring(self.originals[key]) .. ", " .. key)
      if self.originals[key] then
        print("item changed. original: " .. _G.tostring(self.originals[key]) .. ", value: " .. _G.tostring(value))
        changed = true
      end
    end
    local item = ContextItem:new({
      key = key,
      value = value,
      type = self.type,
      changed = changed
    })
    item.name = "item_" .. k
    item.editable = self.type ~= "selection"
    if self.maxScrollY then
      self.maxScrollY = self.maxScrollY - item:getHeight() * 1.1
    end
    self:addChild(item)
  end
  if self.maxScrollY then
    self.maxScrollY = self.maxScrollY + screenHeight * 0.9
    if 0 < self.maxScrollY then
      self.maxScrollY = 0
    end
  end
  print("ContextMenu: self.type: " .. _G.tostring(self.type))
  if self.type == "parameters" then
    local confirm = ContextItem:new({key = "CONFIRM"})
    confirm.name = "item_CONFIRM"
    confirm.text = "CONFIRM"
    confirm.hanchor = "HCENTER"
    confirm.vanchor = "BOTTOM"
    confirm.editable = false
    self:addChild(confirm)
    local cancel = ContextItem:new({key = "CANCEL"})
    cancel.name = "item_CANCEL"
    cancel.text = "CANCEL"
    cancel.hanchor = "HCENTER"
    cancel.vanchor = "BOTTOM"
    cancel.editable = false
    self:addChild(cancel)
  end
end
function ContextMenu:getMaximumSize()
  local width, height = 0, 0
  local childHeight
  self.maxScrollY = 0
  for k, v in _G.ipairs(self.children) do
    local child = self:getChild(v.name)
    if child and child.visible then
      local w = child:getWidth()
      if width < w then
        width = w
      end
      height = height + child:getHeight() * 1.5
      if self.maxScrollY then
        self.maxScrollY = self.maxScrollY - child:getHeight() * 1.5
      end
      childHeight = childHeight or child:getHeight() * 1.5
    end
  end
  if self.maxScrollY then
    self.maxScrollY = self.maxScrollY + screenHeight * 0.9
    if 0 < self.maxScrollY then
      self.maxScrollY = 0
    end
  end
  return width, height, childHeight
end
function ContextMenu:layout()
  local w, h, cH = self:getMaximumSize()
  self.w, self.h = w, h
  self.w = self.w * 1.1
  self.h = self.h * 1.1
  if self.type == "selection" and self.fullScreen then
    self.w, self.h = screenWidth, screenHeight
  end
  if self.x + self.w > screenWidth then
    self.x = self.x - self.w
  end
  if self.y + self.h > screenHeight then
    self.y = screenHeight - self.h * 1.1
  end
  local index = 0
  for k, v in _G.pairs(self.items) do
    local child = self:getChild("item_" .. k)
    if child then
      child:layout()
      if child:hasValueItem() then
        if self.type == "checkBox" then
          child.x = self.w - (child:getWidth() - child:getKeyWidth()) - self.w * 0.1
        else
          child.x = (self.w - child:getWidth()) / 2 + child:getKeyWidth()
        end
      elseif self.preview and self.fullScreen then
        child:changeAnchor("LEFT")
        child.x = 0.1 * screenWidth
      else
        child.x = self.w / 2
      end
      if self.scrollY then
        child.y = child:getHeight() * 0.29 + (index + 1) * child:getHeight() * 1.5 + self.scrollY
      else
        child.y = child:getHeight() * 0.29 + (index + 1) * child:getHeight() * 1.5
      end
      index = index + 1
    end
  end
  local confirm = self:getChild("item_CONFIRM")
  local cancel = self:getChild("item_CANCEL")
  if confirm then
    confirm.x = self.w / 2
    confirm.y = confirm:getHeight() * 0.29 + (index + 1) * confirm:getHeight() * 1.5
    confirm:layout()
    index = index + 1
  end
  if cancel then
    cancel.x = self.w / 2
    cancel.y = cancel:getHeight() * 0.29 + (index + 1) * cancel:getHeight() * 1.5
    cancel:layout()
    index = index + 1
  end
end
function ContextMenu:draw(x, y, scaleX, scaleY, angle, hoverScale, drawFunctionName)
  if self.type == "selection" then
    drawRect(0, 1, 0, 0.2, self.x, self.y, self.x + self.w, self.y + self.h, false)
  else
    drawRect(0.5, 0.5, 0.5, 1, self.x, self.y, self.x + self.w, self.y + self.h, false)
  end
  ui.Frame.draw(self, x, y, scaleX, scaleY, angle, hoverScale, drawFunctionName)
  if self.hoveredItem and self.preview then
    print("hoveredItem: " .. _G.tostring(self.hoveredItem:getKey()))
    local key = self.hoveredItem:getKey()
    drawRect(0.5, 0.5, 0.5, 0.8, screenWidth * 0.5, 0, screenWidth, screenHeight, false)
    _G.res.drawString("", _G.tostring(key), screenWidth, 0, "RIGHT", "TOP")
    local index = 0
    local spritesPerRow = _G.math.floor(screenWidth * 0.5 / 50)
    for k, v in _G.pairs(blockTable.blocks) do
      print("v.group: " .. _G.tostring(v.group) .. ", key: " .. key)
      if v.group == key then
        if v.idleAnimation and not v.sprite then
          local spr = getFirstImageId(v.idleAnimation)
          v.sprite = spr
        end
        local originalWidth, originalHeight = _G.res.getSpriteBounds(v.sprite)
        local aspectRatio = originalWidth / originalHeight
        local width, height
        if 1 <= aspectRatio then
          width = 50
          height = 50 / aspectRatio
        else
          height = 50
          width = 50 * aspectRatio
        end
        local y = (_G.math.ceil((index + 1) / spritesPerRow) - 1) * 50
        local scaleX = width / originalWidth
        local scaleY = height / originalHeight
        local x = screenWidth * 0.5 + index % spritesPerRow * 50
        setRenderState(0, 0, scaleX, scaleY)
        _G.res.drawSprite(v.sprite, x / scaleX, y / scaleY, "LEFT", "TOP")
        index = index + 1
      end
    end
  end
end
function ContextMenu:update(dt, time)
  if self.scrollY then
    if keyPressed.DOWN or keyHold.DOWN then
      self.scrollY = self.scrollY - 50
      if self.scrollY < self.maxScrollY then
        self.scrollY = self.maxScrollY
      end
      self:layout()
      skipInput = true
    elseif keyPressed.UP or keyHold.UP then
      self.scrollY = self.scrollY + 50
      if self.scrollY > 0 then
        self.scrollY = 0
      end
      self:layout()
      skipInput = true
    end
  end
  local editing = false
  for k, v in _G.pairs(self.items) do
    local child = self:getChild("item_" .. k)
    if child then
      local isEditing = child:update(dt, editing)
      if not editing and isEditing then
        editing = true
        skipInput = true
      end
    end
  end
  if not editing then
    if keyPressed.RETURN then
      self.callback(self.callback_parameter, self:getValues())
      self:onExit()
    elseif keyReleased.SPACE or keyReleased.ESCAPE or keyPressed.BACK then
      self:onExit()
    end
  elseif keyPressed.RETURN and self.updateCallback then
    self.updateCallback(self.callback_parameter, self:getValues())
  end
end
function ContextMenu:getValues()
  local returnParameters = {}
  for k, v in _G.pairs(self.items) do
    local child = self:getChild("item_" .. k)
    local valueNumber = child:getValue()
    if valueNumber ~= nil then
      if _G.type(v) == "table" and v.key then
        print("returnParameters[" .. v.key .. "] = " .. _G.tostring(valueNumber))
        returnParameters[_G.tostring(v.key)] = valueNumber
      else
        print("returnParameters[" .. k .. "] = " .. _G.tostring(valueNumber))
        returnParameters[k] = valueNumber
      end
    end
  end
  return returnParameters
end
function ContextMenu:onExit()
  skipInput = true
  selectionRectActive = false
  notificationsFrame:removeChild(self)
  ui.Frame.onExit(self)
end
function ContextMenu:onPointerEvent(eventType, x, y)
  self.hoveredItem = nil
  if eventType == "HOVER" and self.preview then
    for k, v in _G.ipairs(self.children) do
      local result, returnValue = v:handlePointerEvent(x - self.x, y - self.y)
      if returnValue then
        self.hoveredItem = v
        break
      end
    end
  end
  if self.fullScreen and x < self.x + 0.5 * self.w and cursor.wheelTriggered then
    if self.scrollY then
      if keyPressed.DOWN or keyHold.DOWN or cursor.wheelTriggered and cursor.wheel and cursor.wheel < 0 then
        self.scrollY = self.scrollY - 50
        if self.scrollY < self.maxScrollY then
          self.scrollY = self.maxScrollY
        end
        self:layout()
      elseif keyPressed.UP or keyHold.UP or cursor.wheelTriggered and cursor.wheel and cursor.wheel > 0 then
        self.scrollY = self.scrollY + 50
        if self.scrollY > 0 then
          self.scrollY = 0
        end
        self:layout()
      end
    end
    skipInput = true
  end
  if eventType == "LPRESS" then
    print("pointer: " .. x .. ", " .. y)
    if x > self.x + self.w or x < self.x or y > self.y + self.h or y < self.y then
      self:onExit()
    else
      for k, v in _G.ipairs(self.children) do
        local child = v
        if child then
          local ycoord = y - self.y
          local result, returnValue = child:handlePointerEvent(x - self.x, ycoord)
          if result then
            print("result: " .. _G.tostring(result) .. ", " .. _G.tostring(returnValue))
          end
          if result == "SELECT" then
            if self.type == "selection" then
              if self.callback and returnValue then
                self.callback(returnValue, self.callback_parameter)
              end
              self:onExit()
            elseif returnValue == "CONFIRM" then
              self.callback(self.callback_parameter, self:getValues())
              self:onExit()
            elseif returnValue == "CANCEL" then
              self:onExit()
            end
          elseif result == "START_EDITING" then
            print("start editing")
          elseif result == "CHECKBOX_TOGGLE" then
            self.callback(self.callback_parameter, self:getValues())
          end
        end
      end
    end
  end
  return "BLOCK", nil, nil
end
