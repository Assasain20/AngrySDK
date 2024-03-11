ui = gamelua.ui
BackgroundBox = ui.Frame:inherit()
function BackgroundBox:init()
  self.x = 0
  self.y = 0
  self.visible = true
  self.locked = false
  self.hanchor = "HCENTER"
  self.vanchor = "VCENTER"
  self.width = 0
  self.height = 0
  ui.Frame.init(self)
end
function BackgroundBox:drawSelf(x, y, scaleX, scaleY)
  if self.visible == false then
    return
  end
  scaleX = (scaleX or 1) * self.scaleX
  scaleY = (scaleY or 1) * self.scaleY
  gamelua.setRenderState(0, 0, scaleX, scaleY)
  gamelua.drawBoxNative(self.components, _G.math.floor((self.x + x) / scaleX), _G.math.floor((self.y + y) / scaleY), _G.math.floor(self.width), _G.math.floor(self.height), self.hanchor, self.vanchor, nil)
end
function BackgroundBox:draw(x, y, scaleX, scaleY)
  self:drawSelf(x, y, scaleX, scaleY)
  ui.Frame.draw(self, x, y, scaleX, scaleY)
end
filename = "BackgroundBox.lua"
