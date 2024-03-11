Page = {}
function Page:new(o)
  o = o or {}
  o.items = {}
  o.order = {}
  _G.setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end
function Page:init()
end
function Page:insertItem(key, item, pushback)
  self:setItemDefaults(item)
  if not pushback then
    _G.table.insert(self.order, key)
    self.items[key] = item
  else
    local index = self:getIndexOfItem(pushback)
    if index then
      _G.table.insert(self.order, index, key)
      self.items[key] = item
    end
  end
end
function Page:removeItem(key)
  local index = self:getIndexOfItem(key)
  if index then
    _G.table.remove(self.order, index)
    for i, v in _G.ipairs(self.items) do
      if v == self.items.key then
        _G.table.remove(self.items, i)
        return
      end
    end
  end
end
function Page:setItemDefaults(item)
  item.x, item.y = item.x or 0, item.y or 0
  if item.sprite then
    item.sheet = item.sheet or self.sheet
  elseif item.text then
    item.font = item.font or self.font or defaultMenuFont
  end
  if item.renderState then
    item.xs = item.xs or 1
    item.ys = item.ys or 1
    item.angle = item.angle or 0
    if item.useSpritePivot and item.sprite then
      item.pivotX, item.pivotY = _G.res.getSpritePivot(item.sheet, item.sprite)
    else
      item.pivotX, item.pivotY = item.pivotX or 0, item.pivotY or 0
    end
  end
end
function Page:getIndexOfItem(name)
  for i = 1, #self.order do
    if self.order[i] == name then
      return i
    end
  end
  return false
end
function Page:getActivatedItems()
  local activatedItems = {}
  local activatedItemsTouchData = {}
  for k, v in _G.pairs(touches) do
    for key, value in _G.pairs(self.items) do
      if value.visible ~= false and value.selectable ~= false and value:checkBounds(v.x, v.y) and (#activatedItems == 0 or 1 <= #activatedItems and activatedItems[1] ~= key) then
        _G.table.insert(activatedItems, key)
        activatedItemsTouchData[key] = k
      end
    end
  end
  if 1 <= #activatedItems then
    return activatedItems, activatedItemsTouchData
  else
    return false
  end
end
function Page:getHoveredItems()
  local hoveredItems = {}
  for key, value in _G.pairs(self.items) do
    if value.visible ~= false and value.selectable ~= false and value:checkBounds(cursor.x, cursor.y) and (#hoveredItems == 0 or 1 <= #hoveredItems and hoveredItems[1] ~= key) then
      _G.table.insert(hoveredItems, key)
    end
  end
  if 1 <= #hoveredItems then
    return hoveredItems
  else
    return false
  end
end
function Page:checkClicks()
  for k, v in _G.pairs(self.items) do
    if v.visible ~= false and v.selectable ~= false and (v.activateOnRelease ~= true and keyPressed.LBUTTON or v.activateOnRelease and keyReleased.LBUTTON) and v:checkBounds(cursor.x, cursor.y) then
      if v.action then
        for key, value in _G.pairs(v.action) do
          key(value)
        end
      end
      return v
    end
  end
  return false
end
function Page:getClickedItem()
  for k, v in _G.pairs(self.items) do
    if v.visible ~= false and v.selectable ~= false and (v.activateOnRelease ~= true and keyPressed.LBUTTON or v.activateOnRelease and keyReleased.LBUTTON) and v:checkBounds(cursor.x, cursor.y) then
      return v
    end
  end
  return false
end
function Page:draw()
  for i = 1, #self.order do
    local item = self.items[self.order[i]]
    if item.visible ~= false then
      item:draw()
    end
  end
end
