Item = {}
function Item:new(o)
  o = o or {}
  o.x, o.y = o.x or 0, o.y or 0
  _G.setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end
function Item:init()
end
function Item:checkBounds(xCoord, yCoord)
  if self.h == nil or self.w == nil then
    return false
  else
    return yCoord >= self.y and yCoord <= self.y + self.h and xCoord >= self.x and xCoord <= self.x + self.w
  end
end
