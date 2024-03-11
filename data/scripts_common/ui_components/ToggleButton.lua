ToggleButton = ImageButton:inherit()
function ToggleButton:init()
  ImageButton.init(self)
  self.state = 1
  self.toggle_images = {}
end
function ToggleButton:onPointerEvent(eventType, x, y)
  local result, meta, item = ImageButton.onPointerEvent(self, eventType, x, y)
  if result == self.returnValue and item == self then
    self.state = self.state + 1
    if self.state > #self.states then
      self.state = 1
    end
    ImageButton.setImage(self, self.states[self.state], self.disabled_image)
  end
  return result, meta, item
end
function ToggleButton:setImage(state_images, disabled_image)
  self.states = state_images
  ImageButton.setImage(self, state_images[self.state], disabled_image)
end
function ToggleButton:getStateImage(state)
  if _G.tonumber(state) and state <= #self.states then
    return self.states[state]
  end
  return nil
end
function ToggleButton:setStateImage(state, image)
  if _G.tonumber(state) and state <= #self.states then
    self.states[state] = image
    if self.state == state then
      ImageButton.setImage(self, image, self.disabled_image)
    end
  end
end
function ToggleButton:setState(state)
  self.state = state
  ImageButton.setImage(self, self.states[self.state], disabled_image)
end
function ToggleButton:getState(state)
  return self.state
end
filename = "ToggleButton.lua"
