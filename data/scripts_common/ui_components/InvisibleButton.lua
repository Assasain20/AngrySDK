InvisibleButton = Frame:inherit()
function InvisibleButton:init()
  self.width = 0
  self.height = 0
  self.x = 0
  self.y = 0
  self.scaleX = 1
  self.scaleY = 1
end
function InvisibleButton:onPointerEvent(eventType, x, y)
  if (eventType == "LPRESS" or eventType == "LRELEASE" or eventType == "LHOLD" and self.enabled ~= false) and self:checkCollision(x, y) then
    if not self.activateOnRelease and eventType == "LPRESS" or self.activateOnRelease and eventType == "LRELEASE" then
      if self.sound ~= nil then
        _G.res.playAudio(self.sound, 1, false)
      elseif self.soundTable ~= nil then
        _G.res.playAudio(self.soundTable[_G.math.random(1, #self.soundTable)])
      end
      return self.returnValue, self.meta, self
    else
      return -1
    end
  end
  return Frame.onPointerEvent(self, eventType, x, y)
end
function InvisibleButton:checkCollision(x, y)
  local px, py = self.width * 0.5, self.height * 0.5
  local scaleX = self.scaleX or 1
  local scaleY = self.scaleY or 1
  return x >= self.x - px * scaleX and x <= self.x + (self.width - px) * scaleX and y >= self.y - py * scaleY and y <= self.y + (self.height - py) * scaleY
end
function InvisibleButton:update(dt, time)
  Frame.update(self, dt, time)
end
function InvisibleButton:draw(x, y, scaleX, scaleY, angle)
  local debug = false
  if debug then
    gamelua.drawRect(1, 0, 0, 0.5, self.x - self.width * 0.5, self.y - self.height * 0.5, self.x + self.width * 0.5, self.y + self.height * 0.5, false)
  end
  return
end
filename = "InvisibleButton.lua"
