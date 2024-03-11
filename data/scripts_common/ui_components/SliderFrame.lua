SliderFrame = Frame:inherit()
function SliderFrame:init()
  self.scrollX = 0
  self.scrollY = 0
  self.scrollDirection = "y"
  self.state = "RELEASED"
  self.clip = nil
  self.w = 300
  self.h = 300
  self.px = 0
  self.py = 0
  self.maxScrollY = self.h
  self.clip = {
    x1 = -self.px + self.x,
    y1 = -self.py + self.y,
    clipW = self.w,
    clipH = self.h
  }
  local bgImage = Image:new()
  bgImage.name = "bgImage"
  self:addChild(bgImage)
  local content = Frame:new()
  content.name = "content"
  content.x = 0
  content.y = 0
  self:addChild(content)
  Frame.init(self)
end
function SliderFrame:onEntry()
  self.dragStartX = nil
  self.dragStartY = nil
  self.dragDtY = 0
  self.dragDtX = 0
  self.scrollY = 0
  self.scrollX = 0
  local content = self:getChild("content")
  content.x = 0
  content.y = 0
  Frame.onEntry(self)
end
function SliderFrame:layout()
  Frame.layout(self)
end
function SliderFrame:onPointerEvent(eventType, x, y)
  local result, meta = Frame.onPointerEvent(self, eventType, x, y)
  worldScale = 1
  self.dragDtY = 0
  self.dragDtX = 0
  if not (x >= self.x - self.px) or not (x <= self.x + (self.w - self.px)) or not (y >= self.y - self.py) or not (y <= self.y + (self.h - self.py)) then
    self.state = "FREE"
    self.velocityY = 0
    self.dragStartX = nil
    self.dragStartY = nil
    self.dragLastX = nil
    self.dragLastY = nil
    return result, meta
  end
  if eventType == "LPRESS" then
    self.state = "DRAGGING"
    self.dragStartX = gamelua.cursor.x
    self.dragStartY = gamelua.cursor.y
    self.dragLastX = gamelua.cursor.x
    self.dragLastY = gamelua.cursor.y
  elseif eventType == "LHOLD" then
    self.state = "DRAGGING"
    if self.dragStartX == nil or self.dragStartY == nil then
      self.dragStartX = gamelua.cursor.x
      self.dragStartY = gamelua.cursor.y
    end
    self.dragLastX = self.dragLastX or gamelua.cursor.x
    self.dragLastY = self.dragLastY or gamelua.cursor.y
    self.dragDtX = gamelua.cursor.x - self.dragLastX
    self.dragDtY = gamelua.cursor.y - self.dragLastY
    self.dragLastX = gamelua.cursor.x
    self.dragLastY = gamelua.cursor.y
  elseif eventType == "LRELEASE" then
    self.state = "RELEASED"
    if self.scrollDirection == "x" and self.dragStartX ~= nil then
    elseif self.scrollDirection == "y" and self.dragStartY ~= nil and self.dragLastY ~= nil then
      local dragDist = _G.math.abs(self.dragStartY - self.dragLastY)
      if dragDist > 3 then
        return -1
      end
    end
  end
  return result, meta
end
function SliderFrame:update(dt, time)
  local relativeScroll = -self.scrollY / self.maxScrollY
  self.dragDtX = self.dragDtX or 0
  self.dragDtY = self.dragDtY or 0
  if relativeScroll < 0 then
    self.dragDtY = self.dragDtY / ((1 + _G.math.abs(relativeScroll)) * 5)
  elseif relativeScroll > 1 then
    self.dragDtY = self.dragDtY / (relativeScroll * 5)
  end
  local content = self:getChild("content")
  content.x = self.scrollX
  content.y = self.scrollY
  if self.state == "DRAGGING" then
    self.dragDuration = self.dragDuration + dt
  end
  if self.state == "RELEASED" then
    if self.dragStartY ~= nil and self.dragLastY ~= nil and relativeScroll >= 0 and relativeScroll <= 1 then
      self.velocityY = (self.dragLastY - self.dragStartY) * dt * 5 / _G.math.max(self.dragDuration, 1)
    end
    self.dragStartX = nil
    self.dragStartY = nil
    self.dragDuration = 0
    self.state = "FREE"
  end
  if self.velocityY ~= nil then
    if relativeScroll < 0 or relativeScroll > 1 then
      self.velocityY = 0
    end
    self.scrollY = self.scrollY + self.velocityY
    self.velocityY = self.velocityY * 0.8
    if _G.math.abs(self.velocityY) < 0.001 then
      self.velocityY = nil
    end
  end
  if self.scrollDirection == "x" then
    self.scrollX = self.scrollX + self.dragDtX
  elseif self.scrollDirection == "y" then
    self.scrollY = self.scrollY + self.dragDtY
  end
  if self.state == "FREE" then
    if relativeScroll > 1 then
      self.scrollY = self.scrollY + 100 * dt * _G.math.max(1, relativeScroll * 3)
    elseif relativeScroll < 0 then
      self.scrollY = self.scrollY - 100 * dt * _G.math.max(1, _G.math.abs((relativeScroll - 1) * 3))
    end
  end
  Frame.update(self, dt, time)
end
function SliderFrame:draw(x, y)
  if self.clip ~= nil then
    _G.res.setClipRect(x + self.clip.x1, y + self.clip.y1, self.clip.clipW, self.clip.clipH)
  end
  Frame.draw(self, _G.math.floor(x), _G.math.floor(y))
  _G.res.setClipRect(0, 0, gamelua.screenWidth, gamelua.screenHeight)
  gamelua.setRenderState(0, 0, 1, 1, 0, 0)
end
function SliderFrame:getCurrentX()
  return self.scrollX
end
function SliderFrame:getCurrentY()
  return self.scrollY
end
function SliderFrame:addChild(child)
  self:getChild("content"):addChild(child)
end
function SliderFrame:getRelativeScrollY()
  return -self.scrollY / self.maxScrollY
end
function SliderFrame:wasDragged()
  if self.dragStartY ~= nil and self.dragLastY ~= nil and self.state == "DRAGGING" then
    return self.dragStartY ~= self.dragLastY
  end
  return false
end
function SliderFrame:getBGImage()
  return self:getChild("bgImage")
end
filename = "SliderFrame.lua"
