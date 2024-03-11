ui = gamelua.ui
print = gamelua.print
ScrollFrame = ui.Frame:inherit()
function ScrollFrame:init()
  ui.Frame.init(self)
  self.anchors = {
    {x = 0, y = 0}
  }
  self.scroll_axis = "x"
  self.aabb = {
    x1 = 0,
    y1 = 0,
    x2 = 0,
    y2 = 0
  }
  self.clip = nil
  self:resetState()
end
function ScrollFrame:resetState()
  self.scroll = {x = 0, y = 0}
  self.dragging = false
  self.current_anchor = 1
  self.target_anchor = 1
  self.drag_start = {x = 0, y = 0}
  self.drag_last = {x = 0, y = 0}
  self.drag_last_update = {x = 0, y = 0}
  self.drag_speed_x = {
    0,
    0,
    0,
    0,
    0
  }
  self.drag_speed_y = {
    0,
    0,
    0,
    0,
    0
  }
  self.drag_index = 1
  self.drag_timer = 0
  self.velocity = 8
end
function ScrollFrame:onEntry()
  ui.Frame.onEntry(self)
  gamelua.eventManager:addEventListener(gamelua.events.EID_GAME_PAUSED, self)
  self:resetState()
end
function ScrollFrame:onExit()
  ui.Frame.onExit(self)
  gamelua.eventManager:removeEventListener(gamelua.events.EID_GAME_PAUSED, self)
end
function ScrollFrame:setAnchors(anchors)
  self.anchors = gamelua.deepCopy(anchors)
  local aabb = self.aabb
  aabb.x1 = self.anchors[1].x
  aabb.y1 = self.anchors[1].y
  aabb.x2 = self.anchors[1].x
  aabb.y2 = self.anchors[1].y
  for _, v in _G.ipairs(self.anchors) do
    if v.x < aabb.x1 then
      aabb.x1 = v.x
    end
    if v.y < aabb.y1 then
      aabb.y1 = v.y
    end
    if v.x > aabb.x2 then
      aabb.x2 = v.x
    end
    if v.y > aabb.y2 then
      aabb.y2 = v.y
    end
  end
end
function ScrollFrame:setCurrentAnchor(index)
  self.current_anchor = index
  self.target_anchor = index
  self.scroll.x = self.anchors[index].x
  self.scroll.y = self.anchors[index].y
end
function ScrollFrame:setTargetAnchor(anchor)
  self.target_anchor = anchor
end
function ScrollFrame:getCurrentAnchor()
  return self.current_anchor
end
function ScrollFrame:getCurrentX()
  return self.scroll.x
end
function ScrollFrame:getCurrentY()
  return self.scroll.y
end
function ScrollFrame:next()
  self.target_anchor = _G.math.min(self.current_anchor + 1, #self.anchors)
  self.velocity = 8
end
function ScrollFrame:previous()
  self.target_anchor = _G.math.max(self.current_anchor - 1, 1)
  self.velocity = 8
end
function ScrollFrame:draw(x, y)
  local clip = self.clip
  if clip ~= nil then
    _G.res.setClipRect(clip.x, clip.y, clip.w, clip.h)
  end
  Frame.draw(self, _G.math.floor(x - self.scroll.x), _G.math.floor(y - self.scroll.y))
  if clip then
    _G.res.setClipRect(0, 0, gamelua.screenWidth, gamelua.screenHeight)
  end
end
function ScrollFrame:update(dt, time)
  ui.Frame.update(self, dt, time)
  self:updateSelf(dt, time)
end
function ScrollFrame:updateSelf(dt, time)
  local target = self.anchors[self.target_anchor]
  local current = self.anchors[self.current_anchor]
  local scroll = self.scroll
  if not self.dragging and (scroll.x ~= target.x or scroll.y ~= target.y) then
    local dx = target.x - scroll.x
    local dy = target.y - scroll.y
    local vx = dx * dt * self.velocity
    local vy = dy * dt * self.velocity
    if dx > 0 then
      vx = _G.math.min(dx, vx)
    else
      vx = _G.math.max(dx, vx)
    end
    if dy > 0 then
      vy = _G.math.min(dy, vy)
    else
      vy = _G.math.max(dy, vy)
    end
    scroll.x = scroll.x + vx
    scroll.y = scroll.y + vy
  end
  if not self.dragging and self.target_anchor ~= self.current_anchor then
    local d1 = gamelua.distance(target.x, target.y, scroll.x, scroll.y)
    local d2 = gamelua.distance(current.x, current.y, scroll.x, scroll.y)
    if d1 < d2 then
      self.current_anchor = self.target_anchor
    end
  end
end
function ScrollFrame:onPointerEvent(type, x, y)
  local inside_clip = true
  if self.clip and (x < self.clip.x or y < self.clip.y or x >= self.clip.x + self.clip.w or y >= self.clip.y + self.clip.h) then
    inside_clip = false
  end
  local result, meta, item
  local tap_radius = gamelua.screenWidth * 0.03125
  local is_tap = true
  if self.dragging and tap_radius < gamelua.distance(x, y, self.drag_start.x, self.drag_start.y) then
    is_tap = false
  end
  if inside_clip and is_tap then
    result, meta, item = ui.Frame.onPointerEvent(self, type, x + self.scroll.x, y + self.scroll.y)
  end
  if type == "LPRESS" and not self.dragging and inside_clip then
    self:beginDrag(x, y)
  elseif type == "LHOLD" and self.dragging then
    self:updateDrag(x, y)
  elseif type == "LRELEASE" and self.dragging then
    self:release(x, y)
  elseif type == "WHEEL" then
    if gamelua.cursor.wheel < 0 then
      self:next()
    elseif gamelua.cursor.wheel > 0 then
      self:previous()
    end
  end
  return result, meta, item
end
function ScrollFrame:eventTriggered(event)
  if event.id == events.EID_GAME_PAUSED and self.dragging then
    self:release(self.drag_start.x, self.drag_start.y)
  end
end
function ScrollFrame:beginDrag(x, y)
  self.drag_start.x = x
  self.drag_start.y = y
  self.drag_last.x = x
  self.drag_last.y = y
  self.drag_last_update.x = x
  self.drag_last_update.y = y
  for i = 1, 5 do
    self.drag_speed_x[i] = 0
    self.drag_speed_y[i] = 0
  end
  self.dragging = true
end
function ScrollFrame:updateDrag(x, y)
  self.drag_timer = self.drag_timer + gamelua.g_dt
  if self.drag_timer >= 0.016666668 then
    local dx = self.drag_last.x - x
    local dy = self.drag_last.y - y
    self.drag_index = self.drag_index + 1
    if self.drag_index > 5 then
      self.drag_index = 1
    end
    self.drag_speed_x[self.drag_index] = dx / self.drag_timer
    self.drag_speed_y[self.drag_index] = dy / self.drag_timer
    self.drag_timer = 0
    self.drag_last.x = x
    self.drag_last.y = y
  end
  local dx = self.drag_last_update.x - x
  local dy = self.drag_last_update.y - y
  local slowdown_x = 1
  local slowdown_y = 1
  if self.scroll.x + dx < self.aabb.x1 then
    slowdown_x = 1 + _G.math.abs(self.aabb.x1 - (self.scroll.x + dx)) / (gamelua.screenWidth * 0.2)
  end
  if self.scroll.x + dx > self.aabb.x2 then
    slowdown_x = 1 + _G.math.abs(self.aabb.x2 - (self.scroll.x + dx)) / (gamelua.screenWidth * 0.2)
  end
  if self.scroll.y + dy < self.aabb.y1 then
    slowdown_y = 1 + _G.math.abs(self.aabb.y1 - (self.scroll.y + dy)) / (gamelua.screenHeight * 0.2)
  end
  if self.scroll.y + dy > self.aabb.y2 then
    slowdown_y = 1 + _G.math.abs(self.aabb.y2 - (self.scroll.y + dy)) / (gamelua.screenHeight * 0.2)
  end
  if self.scroll_axis == "x" then
    self.scroll.x = self.scroll.x + dx / slowdown_x
  end
  if self.scroll_axis == "y" then
    self.scroll.y = self.scroll.y + dy / slowdown_y
  end
  self.drag_last_update.x = x
  self.drag_last_update.y = y
end
function ScrollFrame:release(x, y)
  self.dragging = false
  local velocity_treshold = 200
  local x_velocity = gamelua.accumulate(self.drag_speed_x) * 0.2
  local y_velocity = gamelua.accumulate(self.drag_speed_y) * 0.2
  if self.scroll_axis == "x" then
    if velocity_treshold > _G.math.abs(x_velocity) then
      self:setTargetToNearestAnchor()
    else
      self:findFlickTargetX(x_velocity)
    end
  elseif self.scroll_axis == "y" then
    if velocity_treshold > _G.math.abs(y_velocity) then
      self:setTargetToNearestAnchor()
    else
      self:findFlickTargetY(y_velocity)
    end
  elseif self.scroll_axis == "xy" then
  end
end
function ScrollFrame:setTargetToNearestAnchor()
  local min_dist = _G.math.huge
  local min_index = 1
  for k, v in _G.ipairs(self.anchors) do
    local distance = gamelua.distance(self.scroll.x, self.scroll.y, v.x, v.y)
    if min_dist > distance then
      min_dist = distance
      min_index = k
    end
  end
  self.target_anchor = min_index
  self.velocity = 8
end
function ScrollFrame:findFlickTargetX(velocity)
  if velocity < 0 and self.scroll.x < self.aabb.x1 then
    self:setTargetToNearestAnchor()
    return
  end
  if velocity > 0 and self.scroll.x > self.aabb.x2 then
    self:setTargetToNearestAnchor()
    return
  end
  local min_dist = _G.math.huge
  local min_index = 1
  for k, v in _G.ipairs(self.anchors) do
    local distance = v.x - self.scroll.x
    if min_dist > _G.math.abs(distance) and (velocity > 0 and distance > 0 or velocity < 0 and distance < 0) then
      min_dist = _G.math.abs(distance)
      min_index = k
    end
  end
  self.target_anchor = min_index
  self.velocity = _G.math.max(_G.math.abs(velocity) * 0.2 * 0.0167, 8)
end
function ScrollFrame:findFlickTargetY(velocity)
  if velocity < 0 and self.scroll.y < self.aabb.y1 then
    self:setTargetToNearestAnchor()
    return
  end
  if velocity > 0 and self.scroll.y > self.aabb.y2 then
    self:setTargetToNearestAnchor()
    return
  end
  local min_dist = _G.math.huge
  local min_index = 1
  for k, v in _G.ipairs(self.anchors) do
    local distance = v.y - self.scroll.y
    if min_dist > _G.math.abs(distance) and (velocity > 0 and distance > 0 or velocity < 0 and distance < 0) then
      min_dist = _G.math.abs(distance)
      min_index = k
    end
  end
  self.target_anchor = min_index
  self.velocity = _G.math.max(_G.math.abs(velocity) * 0.2 * 0.0167, 8)
end
function ScrollFrame:setVelocity(v)
  self.velocity = v
end
function ScrollFrame:setClip(clip)
  self.clip = gamelua.deepCopy(clip)
end
filename = "ScrollFrame2.lua"
