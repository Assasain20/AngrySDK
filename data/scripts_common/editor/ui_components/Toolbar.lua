Toolbar = {}
function Toolbar:new(o)
  o = o or {}
  o.x, o.y = o.x or 0, o.y or 0
  _G.setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end
function Toolbar:init()
  self.buttons = {}
  self.buttons_per_row = _G.math.floor(self.max_width / self.button_width)
  self.current_button_index = 1
end
function Toolbar:addButton(options)
  self.buttons[self.current_button_index] = options
  self.current_button_index = self.current_button_index + 1
end
function Toolbar:draw()
  for i, button in _G.ipairs(self.buttons) do
    local x = self.x + (i - 1) % self.buttons_per_row * self.button_width
    local width, height
    local originalWidth, originalHeight = _G.res.getSpriteBounds(button.sprite)
    local aspectRatio = originalWidth / originalHeight
    if 1 <= aspectRatio then
      width = self.button_width
      height = self.button_height / aspectRatio
    else
      height = self.button_height
      width = self.button_width * aspectRatio
    end
    local y = self.y + (_G.math.ceil(i / self.buttons_per_row) - 1) * self.button_height - height
    _G.res.drawSprite(button.sprite, x, y, "LEFT", "TOP", width, height)
  end
  if self.groupName then
    _G.res.drawString("TEXTS_BASIC", self.groupName, screenWidth, screenHeight, "BOTTOM", "RIGHT")
  end
end
function Toolbar:getBounds()
  local width = _G.math.min(#self.buttons, self.buttons_per_row) * self.button_width
  local height = _G.math.ceil(#self.buttons / self.buttons_per_row) * self.button_height
  return width, height
end
function Toolbar:findButton(x, y)
  local buttonIndex = _G.math.floor(y / self.button_height) * self.buttons_per_row + _G.math.ceil(x / self.button_width)
  return self.buttons[buttonIndex]
end
function Toolbar:onPointerEvent(eventType, x, y)
  if eventType == "LPRESS" then
    local button = self:findButton(x, y)
    if button ~= nil then
      button.callback(button.callback_parameter)
    end
  elseif eventType == "HOVER" then
    local button = self:findButton(x, y)
    if button ~= nil and button.on_hover_callback ~= nil then
      button.on_hover_callback(button.callback_parameter)
    end
  end
end
