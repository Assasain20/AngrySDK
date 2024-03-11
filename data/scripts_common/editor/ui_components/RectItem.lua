RectItem = Item:new()
function RectItem:init()
  self.red = self.red or 0
  self.green = self.green or 0
  self.blue = self.blue or 0
  self.alpha = self.alpha or 0
  self.x1 = self.x1 or 0
  self.x2 = self.x2 or screenWidth
  self.y1 = self.y1 or 0
  self.y2 = self.y2 or screenHeight
  self.inWorld = self.inWorld or false
end
function RectItem:draw()
  if self.renderState then
    setRenderState(-screen.left, -screen.top, worldScale, worldScale, 0, 0, 0)
  end
  drawRect(self.red, self.green, self.blue, self.alpha, self.x1, self.y1, self.x2, self.y2, self.inWorld)
  setRenderState(0, 0, 1, 1, 0, 0, 0)
end
