GridFrame = gamelua.ui.Frame:inherit()
function GridFrame:init()
  self.grid = {}
  gamelua.ui.Frame.init(self)
  self.children = nil
end
function GridFrame:onEntry()
  for k, v in _G.ipairs(self:getChildren()) do
    v:onEntry()
  end
end
function GridFrame:layout()
  local y = 0
  for i, row in _G.ipairs(self.grid) do
    local x = 0
    if i > 1 then
      y = y + self:getMaxH(i - 1)
    end
    for col = 1, #row do
      local cell = self.grid[i][col]
      cell.x = x
      cell.y = y
      x = x + cell.w
    end
  end
  for k, v in _G.ipairs(self:getChildren()) do
    v:layout()
  end
end
function GridFrame:onPointerEvent(eventType, x, y)
  for k, v in _G.ipairs(self:getChildren()) do
    local result, meta = v:onPointerEvent(eventType, x - self.x, y - self.y)
    if result ~= nil then
      return result, meta
    end
  end
end
function GridFrame:onExit()
  for k, v in _G.ipairs(self:getChildren()) do
    v:onExit()
  end
end
function GridFrame:update(dt, time)
  for k, v in _G.ipairs(self:getChildren()) do
    v:update(dt, time)
  end
end
function GridFrame:draw(x, y, scaleX, scaleY, angle)
  for k, v in _G.ipairs(self:getChildren()) do
    v:draw(x + self.x, y + self.y, scaleX, scaleY, angle)
  end
  self.px = self.px or 0
  self.py = self.py or 0
end
function GridFrame:getGridHeight()
  local h = 0
  for i, v in _G.ipairs(self.grid) do
    h = h + self:getMaxH(i)
  end
  return h
end
function GridFrame:getGridWidth()
  local w = 0
  for i, v in _G.ipairs(self.grid) do
    w = w + self:getMaxW(i)
  end
  return w
end
function GridFrame:getChild(name)
  local children = self:getChildren()
  for k, v in _G.ipairs(children) do
    if v.name ~= nil and k == name then
      return v
    end
  end
  for k, v in _G.ipairs(children) do
    result = v:getChild(name)
    if result ~= nil and result.name == name then
      return result
    end
  end
  return nil
end
function GridFrame:insert(x, y, frame)
  self:initializeInsert(x, y)
  self.grid[y][x].w = frame.w or 0
  self.grid[y][x].h = frame.h or 0
  self.grid[y][x]:addChild(frame)
end
function GridFrame:getChildren()
  ret = {}
  for i, v in _G.ipairs(self.grid) do
    for o, b in _G.ipairs(v) do
      _G.table.insert(ret, b)
    end
  end
  return ret
end
function GridFrame:getCell(x, y)
  return self.grid[y][x]
end
function GridFrame:reset()
  self.grid = {}
end
function GridFrame:getMaxH(rowNumber)
  local maxH = 0
  for col = 1, #self.grid[rowNumber] do
    local cell = self.grid[rowNumber][col]
    maxH = _G.math.max(maxH, cell.h)
    if cell ~= nil then
      local child = cell.children[1]
      maxH = _G.math.max(maxH, child.h)
    end
  end
  return maxH
end
function GridFrame:getMaxW(rowNumber)
  local maxW = 0
  for col = 1, #self.grid[rowNumber] do
    local cell = self.grid[rowNumber][col]
    maxW = _G.math.max(maxW, cell.w)
    if cell ~= nil then
      local child = cell.children[1]
      maxW = _G.math.max(maxW, child.w)
    end
  end
  return maxW
end
function GridFrame:initializeInsert(x, y)
  if y > #self.grid then
    for i = 1, y do
      if self.grid[i] == nil then
        self.grid[i] = {}
      end
    end
  end
  local row = self.grid[y]
  if x > #row then
    for i = 1, x do
      if row[i] == nil then
        local cell = gamelua.ui.Frame:new()
        cell.w = 0
        cell.y = 0
        row[i] = cell
      end
    end
  end
end
filename = "GridFrame.lua"
