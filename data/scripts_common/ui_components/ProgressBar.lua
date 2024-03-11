ProgressBar = Frame:inherit()
function ProgressBar:init()
  self.max = 1
  self.value = 0
end
function ProgressBar:setMax(max)
  self.max = max
end
function ProgressBar:setValue(value)
  self.value = value
end
function ProgressBar:getValue()
  return self.value
end
function ProgressBar:setHighlightThreshold(value)
  self.highlightThreshold = value
end
function ProgressBar:getHighlightThreshold()
  return self.highlightThreshold
end
function ProgressBar:setImages(backgroundImage, barImage, highlightImage)
  self.backgroundImage = backgroundImage
  self.barImage = barImage
  self.highlightImage = highlightImage
end
function ProgressBar:draw(x, y, scaleX, scaleY, angle)
  x = x or 0
  y = y or 0
  scaleX = scaleX or 1
  scaleY = scaleY or 1
  if self.backgroundImage ~= nil and self.barImage ~= nil and self.visible ~= false then
    local px, py = _G.res.getSpritePivot(self.backgroundImage)
    local sw, sh = _G.res.getSpriteBounds(self.backgroundImage)
    local bar_left = self.x + x - px * self.scaleX * scaleX
    local bar_top = self.y + y - py * self.scaleY * scaleY
    local bar_width = self.value / self.max * sw * self.scaleX * scaleX
    local bar_height = sh * self.scaleY * scaleY
    gamelua.setRenderState(_G.math.floor((self.x + x) / (self.scaleX * scaleX)), _G.math.floor((self.y + y) / (self.scaleY * scaleY)), self.scaleX * scaleX, self.scaleY * scaleY, 0, px, py)
    _G.res.drawSprite(self.backgroundImage, 0, 0)
    local highlight_x
    if self.highlightThreshold ~= nil then
      highlight_x = self.highlightThreshold / self.max * sw * self.scaleX * scaleX
    end
    if self.highlightThreshold == nil or self.highlightImage == nil or self.highlightThreshold >= self.value then
      if self.value < self.max then
        _G.res.setClipRect(bar_left, bar_top, bar_width, bar_height)
      end
      _G.res.drawSprite(self.barImage, 0, 0)
      if self.highlightThreshold ~= nil and self.highlightImage ~= nil and self.highlightThreshold ~= self.value then
        _G.res.setClipRect(bar_left + bar_width, bar_top, highlight_x, bar_height)
        _G.res.drawSprite(self.highlightImage, 0, 0)
      end
    else
      if self.value < self.max then
        _G.res.setClipRect(bar_left + highlight_x, bar_top, bar_width - highlight_x, bar_height)
      end
      _G.res.drawSprite(self.highlightImage, 0, 0)
      _G.res.setClipRect(bar_left, bar_top, highlight_x, bar_height)
      _G.res.drawSprite(self.barImage, 0, 0)
    end
    _G.res.setClipRect(0, 0, gamelua.screenWidth, gamelua.screenHeight)
  end
  gamelua.setRenderState(0, 0, 1, 1, 0, 0, 0)
  Frame.draw(self, x, y, scaleX, scaleY, angle)
end
filename = "ProgressBar.lua"
