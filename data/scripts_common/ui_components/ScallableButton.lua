ScallableButton = Image:inherit()
ScallableButton.TWEEN_TYPE = {
  LINEAR = "LINEAR",
  EASE_CUBIC_IN = "EASE_CUBIC_IN",
  EASE_CUBIC_OUT = "EASE_CUBIC_OUT",
  EASE_CUBIC_IN_OUT = "EASE_CUBIC_IN_OUT"
}
ScallableButton.STATE = {
  IDLE = "IDLE",
  SCALING_IN = "SCALING_IN",
  FULLY_SCALED = "FULLY_SCALED",
  SCALING_OUT = "SCALING_OUT"
}
function ScallableButton:init()
  self.enabled = true
  self.meta = self
  self.startScale = 1
  self.endScale = 1
  self.animationTotalTime = 0
  self.animationCurrentTime = 0
  self.animationType = ScallableButton.TWEEN_TYPE.LINEAR
  self.state = ScallableButton.STATE.IDLE
end
function ScallableButton:setup(startScale, endScale, animationTime, animationType)
  self.startScale = startScale
  self.endScale = endScale
  if animationTime ~= nil then
    self.animationTotalTime = animationTime
  end
  if animationType ~= nil then
    self.animationType = animationType
  end
end
function ScallableButton:setupDefaultAnimationValues()
  self.startScale = 1
  self.endScale = 1.1
  self.animationTotalTime = 0.1
  self.animationType = ScallableButton.TWEEN_TYPE.LINEAR
end
function ScallableButton:setEnabled(enabled)
  self.enabled = enabled
  if enabled then
    self.image = self.enabledImage
  else
    self.image = self.disabledImage
  end
end
function ScallableButton:setImage(enabledImage, disabledImage)
  Image.setImage(self, enabledImage)
  self.enabledImage = enabledImage
  self.disabledImage = disabledImage
  self:setEnabled(self.enabled)
end
function ScallableButton:onPointerEvent(eventType, x, y)
  if (not self.activateOnRelease and eventType == "LPRESS" or self.activateOnRelease and eventType == "LRELEASE") and self.enabled ~= false then
    local w, h = _G.res.getSpriteBounds(self.image)
    local px, py = _G.res.getSpritePivot(self.image)
    worldScale = 1
    local scaleX = self.scaleX or 1
    local scaleY = self.scaleY or 1
    if self:checkCollision(x, y) then
      if self.sound ~= nil then
        _G.res.playAudio(self.sound, 1, false)
      elseif self.soundTable ~= nil then
        _G.res.playAudio(self.soundTable[_G.math.random(1, #self.soundTable)])
      end
      return self.returnValue, self.meta, self
    end
  end
  return Frame.onPointerEvent(self, eventType, x, y)
end
function ScallableButton:checkCollision(x, y)
  local w, h = _G.res.getSpriteBounds(self.image)
  local px, py = _G.res.getSpritePivot(self.image)
  local scaleX = self.scaleX or 1
  local scaleY = self.scaleY or 1
  return x >= self.x - px * scaleX and x <= self.x + (w - px) * scaleX and y >= self.y - py * scaleY and y <= self.y + (h - py) * scaleY
end
function ScallableButton:update(dt, time)
  Image.update(self, dt, time)
  if self.startScale ~= self.endScale then
    if self.state == ScallableButton.STATE.IDLE then
      self.scaleX = self.startScale
      self.scaleY = self.startScale
      if self:checkCollision(gamelua.cursor.x, gamelua.cursor.y) then
        self.state = ScallableButton.STATE.SCALING_IN
        self.animationCurrentTime = 0
      end
    elseif self.state == ScallableButton.STATE.SCALING_IN then
      self.animationCurrentTime = self.animationCurrentTime + dt
      self.animationCurrentTime = _G.math.min(self.animationCurrentTime, self.animationTotalTime)
      self:setScaleFromTweening(self.animationCurrentTime, self.startScale, self.endScale, self.animationTotalTime)
      if self.animationCurrentTime == self.animationTotalTime then
        self.state = ScallableButton.STATE.FULLY_SCALED
      end
      if self:checkCollision(gamelua.cursor.x, gamelua.cursor.y) == false then
        self.state = ScallableButton.STATE.SCALING_OUT
      end
    elseif self.state == ScallableButton.STATE.FULLY_SCALED then
      self.scaleX = self.endScale
      self.scaleY = self.endScale
      if self:checkCollision(gamelua.cursor.x, gamelua.cursor.y) == false then
        self.state = ScallableButton.STATE.SCALING_OUT
        self.animationCurrentTime = self.animationTotalTime
      end
    elseif self.state == ScallableButton.STATE.SCALING_OUT then
      self.animationCurrentTime = self.animationCurrentTime - dt
      self.animationCurrentTime = _G.math.max(self.animationCurrentTime, 0)
      self:setScaleFromTweening(self.animationCurrentTime, self.startScale, self.endScale, self.animationTotalTime)
      if self.animationCurrentTime == 0 then
        self.state = ScallableButton.STATE.IDLE
      end
      if self:checkCollision(gamelua.cursor.x, gamelua.cursor.y) then
        self.state = ScallableButton.STATE.SCALING_IN
      end
    end
  end
end
function ScallableButton:setScaleFromTweening(currentTime, startScale, endScale, duration)
  if self.animationType == ScallableButton.TWEEN_TYPE.LINEAR then
    self.scaleX = self:tweenLinear(currentTime, startScale, endScale - startScale, duration)
  elseif self.animationType == ScallableButton.TWEEN_TYPE.EASE_CUBIC_IN then
    self.scaleX = self:tweenEaseCubicIn(currentTime, startScale, endScale - startScale, duration)
  elseif self.animationType == ScallableButton.TWEEN_TYPE.EASE_CUBIC_OUT then
    self.scaleX = self:tweenEaseCubicOut(currentTime, startScale, endScale - startScale, duration)
  elseif self.animationType == ScallableButton.TWEEN_TYPE.EASE_CUBIC_IN_OUT then
    self.scaleX = self:tweenEaseCubicInOut(currentTime, startScale, endScale - startScale, duration)
  end
  self.scaleY = self.scaleX
end
function ScallableButton:tweenLinear(currentTime, startValue, changeOfValue, duration)
  local c = changeOfValue
  local t = currentTime
  local d = duration
  local b = startValue
  return c * t / d + b
end
function ScallableButton:tweenEaseCubicIn(currentTime, startValue, changeOfValue, duration)
  local c = changeOfValue
  local t = currentTime
  local d = duration
  local b = startValue
  t = t / d
  return c * t * t * t + b
end
function ScallableButton:tweenEaseCubicOut(currentTime, startValue, changeOfValue, duration)
  local c = changeOfValue
  local t = currentTime
  local d = duration
  local b = startValue
  t = t / d - 1
  return c * (t * t * t + 1) + b
end
function ScallableButton:tweenEaseCubicInOut(currentTime, startValue, changeOfValue, duration)
  local c = changeOfValue
  local t = currentTime
  local d = duration
  local b = startValue
  t = t / (d / 2)
  if t < 1 then
    return c / 2 * (t * t * t) + b
  end
  t = t - 2
  return c / 2 * (t * t * t + 2) + b
end
filename = "ScallableButton.lua"
