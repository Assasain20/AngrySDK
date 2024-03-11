ResolutionWarning = ui.BackgroundBox:inherit()
function ResolutionWarning:new(w, h, o)
  o = o or {}
  o.min_w = w
  o.min_h = h
  return ui.BackgroundBox.new(self, o)
end
function ResolutionWarning:init()
  ui.BackgroundBox.init(self)
  self.width = 575
  self.height = 225
  self.hanchor = "HCENTER"
  self.vanchor = "VCENTER"
  self.components = {
    topLeft = "POPUP_TOP_LEFT",
    topMiddle = "POPUP_TOP_MIDDLE",
    topRight = "POPUP_TOP_RIGHT",
    left = "POPUP_LEFT",
    center = "POPUP_CENTER",
    right = "POPUP_RIGHT",
    bottomLeft = "POPUP_BOTTOM_LEFT",
    bottomMiddle = "POPUP_BOTTOM_MIDDLE",
    bottomRight = "POPUP_BOTTOM_RIGHT"
  }
  local text = ui.Text:new()
  text.text = "Minimum 1024x600 resolution is needed for optimal gameplay experience."
  text.textBoxSize = 500
  text:clip()
  self:addChild(text)
  local close = ui.ImageButton:new()
  close.name = "close"
  close:setImage("MENU_YES")
  close.returnValue = "CLOSE"
  close.activateOnRelease = true
  self:addChild(close)
end
function ResolutionWarning:onEntry()
  eventManager:addEventListener(events.EID_CHANGE_SCENE, self)
  self.timer = 0
end
function ResolutionWarning:onExit()
  eventManager:removeEventListener(events.EID_CHANGE_SCENE)
  local root = notificationsFrame
  if root then
    root:removeChild(self)
  end
end
function ResolutionWarning:layout()
  ui.BackgroundBox.layout(self)
  self.x = screenWidth * 0.5
  self.y = screenHeight * 0.5
  local close = self:getChild("close")
  close.x = 125
  close.y = 125
end
function ResolutionWarning:update(dt, time)
  skipInput = true
  self.timer = self.timer + dt
  ui.BackgroundBox.update(self, dt, time)
  if screenWidth >= self.min_w and screenHeight >= self.min_h then
    local root = notificationsFrame
    if root then
      root:removeChild(self)
    end
    g_resolutionWarningShown = nil
  end
end
function ResolutionWarning:draw(x, y)
  setRenderState(0, 0, 1, 1)
  drawRect(0, 0, 0, _G.math.min(self.timer, 0.65), 0, 0, screenWidth, screenHeight, false)
  ui.BackgroundBox.draw(self, x, y)
end
function ResolutionWarning:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.BackgroundBox.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE" then
    local root = notificationsFrame
    if root then
      root:removeChild(self)
    end
    g_resolutionWarningShown = nil
  end
  if eventType == "HOVER" and item == self:getChild("close") then
    return result, meta, item
  end
  return "BLOCK", nil, self
end
function ResolutionWarning:eventTriggered(event)
  if event.id == events.EID_CHANGE_SCENE then
    self:layout()
  end
end
filename = "resolution.lua"
