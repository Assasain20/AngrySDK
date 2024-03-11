TiledImage = Frame:inherit()
function TiledImage:init()
  self.visible = true
  self.x_repeat = 1
  self.y_repeat = 1
  self.image = nil
  self.w = 0
  self.h = 0
end
function TiledImage:setVisible(visible)
  self.visible = visible
end
function TiledImage:setXRepeat(n)
  self.x_repeat = n
end
function TiledImage:setYRepeat(n)
  self.y_repeat = n
end
function TiledImage:setImage(i)
  self.image = i
  self.w, self.h = _G.res.getSpriteBounds(i)
end
function TiledImage:layout()
  Frame.layout(self)
  self.w, self.h = _G.res.getSpriteBounds(self.image)
end
function TiledImage:draw(x, y, scale_x, scale_y, angle, hover_scale)
  local w = self.w
  local h = self.h
  local fx = self.x + x
  local fy = self.y + y
  gamelua.setRenderState(0, 0, 1, 1)
  for i = 1, self.y_repeat do
    for j = 1, self.x_repeat do
      _G.res.drawSprite(self.image, fx + (j - 1) * w, fy + (i - 1) * h, "HPIVOT", "VPIVOT")
    end
  end
  Frame.draw(self, x, y, scale_x, scale_y, angle, hover_scale)
end
filename = "TiledImage.lua"
