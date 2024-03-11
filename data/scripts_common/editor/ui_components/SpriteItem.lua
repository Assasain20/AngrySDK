SpriteItem = Item:new()
function SpriteItem:checkBounds(xCoord, yCoord)
  if self.clickArea ~= nil then
    return xCoord >= self.clickArea.xLeft and xCoord <= self.clickArea.xRight and yCoord >= self.clickArea.yTop and yCoord <= self.clickArea.yBot
  end
  self.sheet = self.sheet or ""
  local width, height = _G.res.getSpriteBounds(self.sheet, self.sprite)
  local pivotX, pivotY = _G.res.getSpritePivot(self.sheet, self.sprite)
  if self.renderState then
    local scaleCorrectionX, scaleCorrectionY = 0, 0
    local xs, ys = self.xs or 1, self.ys or 1
    if self.scale ~= nil then
      xs, ys = self.scale, self.scale
    end
    if xs ~= 1 then
      scaleCorrectionX = (width * xs - width) / 2
    end
    if ys ~= 1 then
      scaleCorrectionY = (height * ys - height) / 2
    end
    return yCoord >= self.y - pivotY - scaleCorrectionY and yCoord <= self.y - pivotY + height + scaleCorrectionY and xCoord >= self.x - pivotX - scaleCorrectionX and xCoord <= self.x - pivotX + width + scaleCorrectionX
  elseif self.inWorld then
    local scaleCorrectionX, scaleCorrectionY = 0, 0
    local xs, ys = self.xs or 1, self.ys or 1
    if self.scale ~= nil then
      xs, ys = self.scale, self.scale
    end
    scaleCorrectionX = (width * xs * worldScale - width) / 2
    scaleCorrectionY = (height * ys * worldScale - height) / 2
    local tmpx, tmpy = physicsToScreenTransform(self.x, self.y)
    return yCoord >= tmpy - pivotY - scaleCorrectionY and yCoord <= tmpy - pivotY + height + scaleCorrectionY and xCoord >= tmpx - pivotX - scaleCorrectionX and xCoord <= tmpx - pivotX + width + scaleCorrectionX
  end
  return yCoord >= self.y - pivotY and yCoord <= self.y - pivotY + height and xCoord >= self.x - pivotX and xCoord <= self.x - pivotX + width
end
function SpriteItem:draw()
  if self.renderState then
    local xCoord, yCoord = self.x, self.y
    local xs, ys = self.xs or 1, self.ys or 1
    local angle = self.angle or 0
    local px, py = self.pivotX or 0, self.pivotY or 0
    if xs ~= 1 then
      xCoord = xCoord / xs
    end
    if ys ~= 1 then
      yCoord = yCoord / ys
    end
    setRenderState(0, 0, xs, ys, angle, px, py)
    if self.drawToScreenSize then
      local sw, sh = _G.res.getSpriteBounds(self.sheet, self.sprite)
      local aspect = sw / sh
      local width = screenHeight * aspect
      local px, py = _G.res.getSpritePivot(self.sheet, self.sprite)
      _G.res.drawSprite(self.sheet, self.sprite, 0, 0, "LEFT", "TOP", screenWidth, screenHeight)
    else
      _G.res.drawSprite(self.sheet, self.sprite, _G.math.floor(xCoord), _G.math.floor(yCoord))
    end
    setRenderState(0, 0, 1, 1, 0, 0, 0)
  else
    _G.res.drawSprite(self.sheet, self.sprite, self.x, self.y)
  end
end
