Frame = {}
function Frame:setup_metatable(o)
  local o = o or {}
  _G.setmetatable(o, self)
  self.__index = self
  return o
end
function Frame:inherit()
  return self:setup_metatable()
end
function Frame:new(o)
  o = o or {}
  o.children = {}
  o.lookup = {}
  o.x = o.x or 0
  o.y = o.y or 0
  o.scaleX = o.scaleX or 1
  o.scaleY = o.scaleY or 1
  o.angle = o.angle or 0
  o.name = o.name or "UNDEFINED"
  o.w = o.w or 0
  o.h = o.h or 0
  self.visible = self.visible or true
  self.active = self.active or true
  self.in_init = true
  self:setup_metatable(o)
  o:init()
  self.in_init = false
  return o
end
function Frame:addChild(child, index)
  if index == nil then
    _G.table.insert(self.children, child)
  else
    _G.table.insert(self.children, index, child)
  end
  _G.assert(child.name ~= nil, "Child must have a name to support fast lookup")
  _G.assert(self.lookup[child.name] == nil, "Name already exists in lookup table")
  self.lookup[child.name] = child
  if not self.in_init then
    child:onEntry()
    child:layout()
  end
end
function Frame:removeAllChildren()
  self.children = {}
  self.lookup = {}
end
function Frame:removeChild(child)
  local removeIndex, removedItem
  for i, v in _G.ipairs(self.children) do
    if self.children[i] == child then
      removeIndex = i
    end
  end
  if removeIndex ~= nil then
    removedItem = self.children[removeIndex]
    _G.table.remove(self.children, removeIndex)
    self.lookup[removedItem.name] = nil
  end
  return removedItem
end
function Frame:popChild()
  local removed_item = self.children[#self.children]
  _G.table.remove(self.children, #self.children)
  self.lookup[removed_item.name] = nil
  return removed_item
end
function Frame:init()
end
function Frame:prepareForDynamicAssets()
end
function Frame:onEntry()
  Frame.entryCounts = Frame.entryCounts or 0
  Frame.entryCounts = Frame.entryCounts + 1
  for k, v in _G.ipairs(self.children) do
    v:onEntry()
  end
end
function Frame:layout()
  if not self.children then
    gamelua.print(_G.debug.traceback())
  end
  for k, v in _G.ipairs(self.children) do
    v:layout()
  end
end
function Frame:getChild(name)
  if self.lookup[name] ~= nil then
    return self.lookup[name]
  end
  for _, v in _G.ipairs(self.children) do
    local result = v:getChild(name)
    if result ~= nil then
      return result
    end
  end
end
function Frame:onKeyEvent(eventType, key)
  for i = #self.children, 1, -1 do
    local child = self.children[i]
    if child.visible == true and child.active == true then
      local result, meta, element = child:onKeyEvent(eventType, key)
      if result ~= nil then
        return result, meta, element
      end
    end
  end
end
function Frame:onPointerEvent(eventType, x, y)
  for i = #self.children, 1, -1 do
    local child = self.children[i]
    if child.visible == true and child.active == true then
      local result, meta, element = child:onPointerEvent(eventType, x - self.x, y - self.y)
      if result ~= nil then
        return result, meta, element
      end
    end
  end
  return nil, nil, nil
end
function Frame:onTouchEvent(type, id, x, y)
  for i = #self.children, 1, -1 do
    local child = self.children[i]
    if child.visible == true and child.active == true then
      local result, meta, item = child:onTouchEvent(type, id, x - self.x, y - self.y)
      if result ~= nil then
        return result, meta, item
      end
    end
  end
  return nil, nil, nil
end
function Frame:update(dt, time)
  for i, v in _G.ipairs(self.children) do
    if v.active == true then
      v:update(dt, time)
    end
  end
end
function Frame:draw(x, y, scaleX, scaleY, angle, hoverScale)
  x = x or 0
  y = y or 0
  scaleX = scaleX or 1
  scaleY = scaleY or 1
  angle = angle or 0
  hoverScale = hoverScale or 1
  for i, v in _G.ipairs(self.children) do
    if v.visible == true then
      v:draw(x + self.x, y + self.y, scaleX * self.scaleX, scaleY * self.scaleY, angle + self.angle, hoverScale)
    end
  end
end
function Frame:onExit()
  Frame.entryCounts = Frame.entryCounts or 0
  Frame.entryCounts = Frame.entryCounts - 1
  for i, v in _G.ipairs(self.children) do
    v:onExit()
  end
end
function Frame:setVisible(visible)
  self.visible = visible
end
filename = "Frame.lua"
