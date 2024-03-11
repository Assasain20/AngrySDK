print = gamelua.print
ui = gamelua.ui
Rect = ui.Frame:inherit()
function Rect:init()
  ui.Frame.init(self)
  self.width = self.width or 1
  self.height = self.height or 1
  self.centered = self.centered or false
  self.r = 0
  self.g = 0
  self.b = 0
  self.a = 1
end
function Rect:draw(x, y)
  gamelua.setRenderState(0, 0, 1, 1)
  local targetX = x + self.x
  local targetY = y + self.y
  if self.centered then
    targetX = targetX - self.width / 2
    targetY = targetY - self.height / 2
  end
  gamelua.drawRect(self.r, self.g, self.b, self.a, targetX, targetY, targetX + self.width, targetY + self.height, false)
  ui.Frame.draw(self, x, y)
end
filename = "Rect.lua"
