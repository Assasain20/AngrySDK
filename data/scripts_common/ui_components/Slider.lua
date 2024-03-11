ui = gamelua.ui
print = gamelua.print
Slider = ui.BackgroundBox:inherit()
function Slider:init()
  ui.BackgroundBox.init(self)
  self.slider_children = {}
  self.components = {}
  self.direction = {x = 0, y = -1}
  self.padding_x = 0
  self.padding_y = 0
  self.gap = 0
  self.child_size = 0
  self.indicator_style = "ROTATE_FULL"
  self.state = "CLOSED"
  self.enabled = enabled or true
  self.extend_state = 0
  self.extend_adjusted = 1
  self.disappear_scale = 1
  self.open_function = gamelua.tweenLinear
  self.close_function = gamelua.tweenLinear
  local toggle_button = ui.ImageButton:new()
  toggle_button.activateOnRelease = true
  self:addChildInternal(toggle_button)
  self.toggle_button = toggle_button
  local indicator = ui.Image:new()
  self:addChildInternal(indicator)
  self.indicator = indicator
end
function Slider:setButtonImage(open_image, closed_image)
  self.closed_image = closed_image
  self.open_image = open_image
  self:refreshImages()
end
function Slider:setIndicatorImage(open_indicator, closed_indicator)
  self.open_indicator = open_indicator
  self.closed_indicator = closed_indicator
  self:refreshImages()
end
function Slider:refreshImages()
  local button_image, indicator_image
  if self.state == "CLOSED" then
    button_image = self.closed_image
    indicator_image = self.closed_indicator
  else
    button_image = self.open_image
    indicator_image = self.open_indicator
  end
  self.toggle_button:setImage(button_image)
  self.indicator:setImage(indicator_image)
end
function Slider:setEnabled(enabled)
  self.enabled = enabled
  if self.state ~= "CLOSED" then
    self.state = "CLOSING"
  end
  self.toggle_button:setEnabled(enabled)
end
function Slider:setComponents(components)
  self.components = {}
  for k, v in _G.pairs(components) do
    self.components[k] = v
  end
end
function Slider:setDirection(dir)
  if dir == "UP" then
    self.direction = {x = 0, y = -1}
    self.hanchor = "HCENTER"
    self.vanchor = "RIGHT"
  elseif dir == "DOWN" then
    self.direction = {x = 0, y = 1}
    self.hanchor = "HCENTER"
    self.vanchor = "LEFT"
  elseif dir == "LEFT" then
    self.direction = {x = -1, y = 0}
    self.hanchor = "BOTTOM"
    self.vanchor = "VCENTER"
  elseif dir == "RIGHT" then
    self.direction = {x = 1, y = 0}
    self.hanchor = "TOP"
    self.vanchor = "VCENTER"
  end
end
function Slider:setPadding(x, y)
  if y == nil then
    self.padding_x = x
    self.padding_y = x
  else
    self.padding_x = x
    self.padding_y = y
  end
end
function Slider:setGap(gap)
  self.gap = gap
end
function Slider:setChildSize(size)
  self.child_size = size
end
function Slider:addChildInternal(child)
  return ui.BackgroundBox.addChild(self, child)
end
function Slider:addChild(child)
  ui.BackgroundBox.addChild(self, child, #self.slider_children + 1)
  _G.table.insert(self.slider_children, child)
end
function Slider:disappear()
  self.state = "DISAPPEAR"
end
function Slider:removeChild(child)
  local removed = ui.BackgroundBox.removeChild(child)
  if removed then
    local index
    for k, v in _G.pairs(self.slider_children) do
      if removed == v then
        index = k
      end
    end
    if index then
      _G.table.remove(self.slider_children, index)
    end
  end
  return removed
end
function Slider:update(dt, time)
  local total_size = _G.math.ceil(#self.slider_children * self.child_size + self.gap + (#self.slider_children - 1) * self.gap + self.padding_x * _G.math.abs(self.direction.x) + self.padding_y * _G.math.abs(self.direction.y))
  if self.state == "OPENING" then
    self.extend_state = self.extend_state + dt * gamelua.screenHeight * 0.8
    if total_size <= self.extend_state then
      self.extend_state = total_size
      self.state = "OPEN"
      self:refreshImages()
    end
    self.extend_adjusted = self.open_function(self.extend_state, 0, total_size, total_size)
  elseif self.state == "CLOSING" or self.state == "DISAPPEAR" and self.extend_state > 0 then
    self.extend_state = self.extend_state - dt * gamelua.screenHeight * 0.8
    if self.extend_state < 0 then
      self.extend_state = 0
      if self.state == "CLOSING" then
        self.state = "CLOSED"
        self:refreshImages()
      end
    end
    self.extend_adjusted = self.open_function(self.extend_state, 0, total_size, total_size)
  end
  if self.state == "DISAPPEAR" and self.extend_state == 0 then
    self.disappear_scale = self.disappear_scale - dt * 3
    if 0 >= self.disappear_scale then
      self.disappear_scale = 0
      self.state = "DISAPPEARED"
    end
    local final_scale = self.disappear_scale
    self.toggle_button.scaleX = final_scale
    self.toggle_button.scaleY = final_scale
    self.indicator.scaleX = final_scale
    self.indicator.scaleY = final_scale
  end
  if self.indicator_style == "ROTATE_FULL" then
    self.indicator.angle = self.open_function(self.extend_state, 0, _G.math.pi * 2, total_size)
  end
  for k, v in _G.ipairs(self.slider_children) do
    local x, y
    x = self.direction.x * (k * (self.child_size + self.gap))
    y = self.direction.y * (k * (self.child_size + self.gap))
    v.x = (x + self.extend_adjusted - total_size) * self.direction.x * self.scaleX
    v.y = (y + self.extend_adjusted - total_size) * self.direction.y * self.scaleY
    if self.direction.x < 0 then
      v:setVisible(v.x < 0)
    elseif self.direction.x > 0 then
      v:setVisible(v.x > 0)
    elseif self.direction.y < 0 then
      v:setVisible(v.y < 0)
    elseif self.direction.y > 0 then
      v:setVisible(v.y > 0)
    end
  end
  if self.direction.x ~= 0 then
    self.width = self.extend_adjusted
    self.height = self.padding_y * 2 + self.child_size
  elseif self.direction.y ~= 0 then
    self.width = self.padding_x * 2 + self.child_size
    self.height = self.extend_adjusted
  end
  BackgroundBox.update(self, dt, time)
end
function Slider:draw(x, y, scaleX, scaleY)
  local clip = false
  if self.state == "OPENING" or self.state == "CLOSING" or self.state == "DISAPPEAR" then
    clip = true
    if self.direction.x ~= 0 then
      local cx = x + self.x
      _G.res.setClipRect(cx, 0, gamelua.screenWidth - cx, gamelua.screenHeight)
    elseif self.direction.y ~= 0 then
    end
  end
  if 0 < self.extend_state then
    self:drawSelf(x, y, scaleX, scaleY)
  end
  self:drawChildren(x, y, scaleX, scaleY)
  if clip then
    _G.res.setClipRect(0, 0, gamelua.screenWidth, gamelua.screenHeight)
  end
  self.toggle_button:draw(x + self.x, y + self.y, scaleX * self.scaleX, scaleY * self.scaleY)
  self.indicator:draw(x + self.x, y + self.y, scaleX * self.scaleX, scaleY * self.scaleY)
end
function Slider:drawChildren(x, y, scaleX, scaleY, angle, hoverScale)
  x = x or 0
  y = y or 0
  scaleX = scaleX or 1
  scaleY = scaleY or 1
  angle = angle or 0
  hoverScale = hoverScale or 1
  for i, v in _G.ipairs(self.children) do
    if v.visible == true and v ~= self.toggle_button and v ~= self.indicator then
      v:draw(x + self.x, y + self.y, scaleX * self.scaleX, scaleY * self.scaleY, angle + self.angle, hoverScale)
    end
  end
end
function Slider:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.BackgroundBox.onPointerEvent(self, eventType, x, y)
  if item == self.toggle_button and self.enabled then
    self:toggle()
  end
  return result, meta, item
end
function Slider:setToggleResult(result, disabled, meta)
  self.toggle_button.returnValue = result
  self.toggle_button.disabledReturnValue = disabled
  self.toggle_button.meta = meta
end
function Slider:toggle()
  if self.state == "OPEN" or self.state == "OPENING" then
    self.state = "CLOSING"
  elseif self.state == "CLOSED" or self.state == "CLOSING" then
    self.state = "OPENING"
  end
  self:refreshImages()
end
function Slider:open()
  if self.state == "CLOSING" or self.state == "CLOSED" then
    self.state = "OPENING"
  end
  self:refreshImages()
end
function Slider:setOpenFunction(anim)
  local tween_funcs = {
    ["linear"] = gamelua.tweenLinear,
    ["cubic-out"] = gamelua.tweenEaseCubicOut,
    ["cubic-in"] = gamelua.tweenEaseCubicIn,
    ["cubic-inout"] = gamelua.tweenEaseCubicInOut
  }
  self.open_function = tween_funcs[anim]
end
function Slider:getContentDimensions()
  return self.width, self.height
end
function Slider:getButtonBounds()
  local tb = self.toggle_button
  return self.x - tb.px, self.y - tb.py, self.x - tb.px + tb.w, self.y - tb.py + tb.h
end
filename = "Slider.lua"
