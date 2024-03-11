GoldenEggHintPopup = ui.Frame:inherit()
function GoldenEggHintPopup:new(hint_sprite, o)
  o = o or {}
  o.hint_sprite = hint_sprite
  return ui.Frame.new(self, o)
end
function GoldenEggHintPopup:init()
  self.shade = 0
  self.state = "FADEIN"
  local bubble1 = ui.Image:new()
  bubble1.name = "bubble1"
  bubble1:setImage("EGG_THOUGHT_BUBBLE_1")
  self:addChild(bubble1)
  local bubble2 = ui.Image:new()
  bubble2.name = "bubble2"
  bubble2:setImage("EGG_THOUGHT_BUBBLE_2")
  self:addChild(bubble2)
  local bubble3 = ui.Image:new()
  bubble3.name = "bubble3"
  bubble3:setImage("EGG_THOUGHT_BUBBLE_3")
  self:addChild(bubble3)
  local hint = ui.Image:new()
  hint:setImage(self.hint_sprite)
  bubble3:addChild(hint)
end
function GoldenEggHintPopup:layout()
  local bubble1 = self:getChild("bubble1")
  local bubble2 = self:getChild("bubble2")
  local bubble3 = self:getChild("bubble3")
  bubble3.x = screenWidth * 0.5
  bubble3.y = screenHeight * 0.5
  bubble2.x = screenWidth * 0.75
  bubble2.y = screenHeight * 0.75
  bubble1.x = screenWidth * 0.85
  bubble1.y = screenHeight * 0.85
end
function GoldenEggHintPopup:update(dt, time)
  if self.state == "FADEIN" then
    self.shade = _G.math.min(self.shade + dt * 4, 0.65)
    if self.shade == 0.65 then
      self.state = "NORMAL"
    end
  elseif self.state == "FADEOUT" then
    self.shade = _G.math.max(self.shade - dt * 4, 0)
    if self.shade == 0 then
      eventManager:notify({
        id = events.EID_POP_FRAME
      })
    end
  end
end
function GoldenEggHintPopup:draw(x, y)
  drawRect(0, 0, 0, self.shade, 0, 0, screenWidth, screenHeight, false)
  ui.Frame.draw(self, x, y)
end
function GoldenEggHintPopup:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if eventType == "LRELEASE" then
    self.state = "FADEOUT"
    return "CLOSE_HINT", nil, self
  else
    return "BLOCK_EVENT", nil, self
  end
  return result, meta, item
end
filename = "egg_hint.lua"
