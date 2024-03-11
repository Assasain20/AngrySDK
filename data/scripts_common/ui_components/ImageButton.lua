ImageButton = Image:inherit()
function ImageButton:init()
  self.enabled = true
  self.hover_enabled = true
  self.hover_scale = 0
  self.hover_state = "NONE"
  self.hover_count = 0
end
function ImageButton:onEntry()
  self.clickStarted = false
  self.hover_scale = 0
  self.hover_state = "NONE"
  Image.onEntry(self)
end
function ImageButton:setEnabled(enabled)
  self.enabled = enabled
  if enabled then
    Image.setImage(self, self.enabledImage)
  elseif not enabled and self.disabledImage then
    Image.setImage(self, self.disabledImage)
  end
end
function ImageButton:setImage(enabledImage, disabledImage)
  Image.setImage(self, enabledImage)
  self.enabledImage = enabledImage
  self.disabledImage = disabledImage
  self:setEnabled(self.enabled)
end
function ImageButton:hitTest(x, y)
  local self_x = self.x
  local self_y = self.y
  local self_h = self.h
  local self_w = self.w
  local self_px = self.px
  local self_py = self.py
  local self_sx = self.scaleX
  local xcond = false
  if self.scaleX >= 0 then
    xcond = x >= self_x - self_px * self_sx and x <= self_x + (self_w - self_px) * self_sx
  else
    xcond = x >= self_x - (self_w - self_px) * -self_sx and x <= self_x + self_px * -self_sx
  end
  if xcond and y >= self_y - self_py * self.scaleY and y <= self_y + (self_h - self_py) * self.scaleY then
    return true
  end
  return false
end
function ImageButton:handlePointerEvent(eventType, x, y)
  if eventType == "HOVER" and self.visible and self.image and self:hitTest(x, y) then
    return "HOVER", nil, self
  end
  if self.activateOnRelease and eventType == "LPRESS" and self.visible and self.image and self:hitTest(x, y) then
    self.clickStarted = true
  end
  if (not self.activateOnRelease and eventType == "LPRESS" or self.activateOnRelease and eventType == "LRELEASE") and (self.enabled ~= false or self.disabledReturnValue ~= nil) and self.image then
    if self:hitTest(x, y) and (self.clickStarted or not self.activateOnRelease) then
      if self.clickSound then
        _G.res.playAudio(self.clickSound, 1, false)
      end
      if self.enabled then
        return self.returnValue, self.meta, self
      else
        return self.disabledReturnValue, self.meta, self
      end
    else
      self.clickStarted = false
    end
  end
  return nil, nil, nil
end
function ImageButton:onPointerEvent(eventType, x, y)
  local retval, meta, element = self:handlePointerEvent(eventType, x, y)
  if retval ~= nil then
    return retval, meta, element
  end
  return Frame.onPointerEvent(self, eventType, x, y)
end
function ImageButton:onMouseEnter()
  self.hover_count = self.hover_count + 1
  if self.hover_enabled and self.hover_count == 1 then
    self.hover_state = "ENTER"
  end
end
function ImageButton:onMouseLeave()
  self.hover_count = self.hover_count - 1
  if self.hover_enabled and self.hover_count == 0 then
    self.hover_state = "LEAVE"
  end
end
function ImageButton:update(dt, time)
  Image.update(self, dt, time)
  if self.hover_state == "ENTER" then
    self.hover_scale = self.hover_scale + dt * 6.66
    if self.hover_scale >= 1 then
      self.hover_scale = 1
      self.hover_state = "HOVER"
    end
  elseif self.hover_state == "LEAVE" then
    self.hover_scale = self.hover_scale - dt * 6.66
    if self.hover_scale <= 0 then
      self.hover_scale = 0
      self.hover_state = "NONE"
    end
  end
end
function ImageButton:hoverScale()
  return gamelua.tweenLinear(self.hover_scale, 1, 0.1, 1)
end
if gamelua.g_enableHoverScaling then
  function ImageButton:drawSelf(x, y, scaleX, scaleY, angle)
    scaleX = scaleX or 1
    scaleY = scaleY or 1
    local scale = self:hoverScale()
    Image.drawSelf(self, x, y, scaleX * scale, scaleY * scale, angle, 1)
  end
  function ImageButton:draw(x, y, scaleX, scaleY, angle)
    ImageButton.drawSelf(self, x, y, scaleX, scaleY, angle)
    Frame.draw(self, x, y, scaleX, scaleY, angle, self:hoverScale())
  end
end
filename = "ImageButton.lua"
