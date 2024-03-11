StaticButton = ScallableButton:inherit()
function StaticButton:init()
  ImageButton.init(self)
end
function StaticButton:onPointerEvent(eventType, x, y)
  if eventType == "LPRESS" or eventType == "LRELEASE" or eventType == "LHOLD" and self.enabled ~= false then
    local w, h = _G.res.getSpriteBounds(self.image)
    local px, py = _G.res.getSpritePivot(self.image)
    worldScale = 1
    local scaleX = self.scaleX or 1
    local scaleY = self.scaleY or 1
    if self:checkCollision(x, y) then
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
  end
  return Frame.onPointerEvent(self, eventType, x, y)
end
filename = "StaticButton.lua"
