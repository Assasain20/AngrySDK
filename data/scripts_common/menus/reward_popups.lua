GoldenEgg = ui.Image:inherit()
function GoldenEgg:init()
  ui.Image:init()
  self:setImage("GOLDEN_EGG_STAR_EFFECT")
  egg = ui.Image:new()
  egg.name = "egg"
  egg:setImage("GOLDEN_EGG_5")
  self:addChild(egg)
  egg.x = 0
  egg.y = 0
  self.clicks = 0
  self.visible = false
  self:getChild("egg").visible = false
  self.found = false
  self.rate = 0
  self.GEClicks = 0
end
function GoldenEgg:checkClick(event, x, y)
  local egg = self:getChild("egg")
  if event == "LPRESS" and self.enabled ~= false then
    local w, h = _G.res.getSpriteBounds(egg.image)
    local scale = 0.5
    w = w * scale
    h = h * scale
    local px, py = _G.res.getSpritePivot(egg.image)
    px = px * scale
    py = py * scale
    worldScale = 1
    if x >= self.x - px and x <= self.x + (w - px) and y >= self.y - py and y <= self.y + (h - py) then
      return self.returnValue, self.meta
    end
  end
end
function GoldenEgg:layout()
  ui.Image.layout(self)
  local scale = 1
  if isRetinaGraphicsEnabled() then
    scale = 2
  end
  self.scaleX = scale
  self.scaleY = scale
end
function GoldenEgg:draw()
  setRenderState(0, 0, 1, 1, 0, 0)
  drawRect(0, 0, 0, self.rate * 0.5, 0, 0, screenWidth, screenHeight, false)
  ui.Image.draw(self)
  setRenderState(0, 0, 1, 1, 0, 0)
end
BoomerangBirdPopup = ui.Image:inherit()
function BoomerangBirdPopup:init()
  ui.Image:init()
  self:setImage("GOLDEN_EGG_STAR_EFFECT")
  egg = ui.Image:new()
  egg.name = "egg"
  egg:setImage("BIRD_BOOMERANG")
  self:addChild(egg)
  egg.x = 0
  egg.y = 0
  self.clicks = 0
  self.visible = false
  self:getChild("egg").visible = false
  self.found = false
  self.rate = 0
  self.GEClicks = 0
end
function BoomerangBirdPopup:checkClick(event, x, y)
  local egg = self:getChild("egg")
  if event == "LPRESS" and self.enabled ~= false then
    local w, h = _G.res.getSpriteBounds(egg.image)
    local scale = 0.5
    w = w * scale
    h = h * scale
    local px, py = _G.res.getSpritePivot(egg.image)
    px = px * scale
    py = py * scale
    worldScale = 1
    if x >= self.x - px and x <= self.x + (w - px) and y >= self.y - py and y <= self.y + (h - py) then
      return self.returnValue, self.meta
    end
  end
end
function BoomerangBirdPopup:layout()
  ui.Image.layout(self)
  local scale = 1
  if isRetinaGraphicsEnabled() then
    scale = 2
  end
  self.scaleX = scale
  self.scaleY = scale
end
function BoomerangBirdPopup:draw()
  setRenderState(0, 0, 1, 1, 0, 0)
  drawRect(0, 0, 0, self.rate * 0.5, 0, 0, screenWidth, screenHeight, false)
  ui.Image.draw(self)
  setRenderState(0, 0, 1, 1, 0, 0)
end
StarPopup = ui.Image:inherit()
function StarPopup:new(first_time, o)
  local o = o or {}
  o.first_time = first_time
  return ui.Image.new(self, o)
end
function StarPopup:init()
  ui.Image:init()
  if self.first_time then
    self:setImage("GOLDEN_EGG_STAR_EFFECT")
  end
  egg = ui.Image:new()
  egg.name = "egg"
  egg:setImage("BIG_STAR_2")
  self:addChild(egg)
  egg.x = 0
  egg.y = 0
  if not self.first_time then
    egg.alpha = 0.5
  end
  self.clicks = 0
  self.visible = false
  self:getChild("egg").visible = false
  self.found = false
  self.rate = 0
  self.GEClicks = 0
end
function StarPopup:checkClick(event, x, y)
  local egg = self:getChild("egg")
  if event == "LPRESS" and self.enabled ~= false then
    local w, h = _G.res.getSpriteBounds(egg.image)
    local scale = 0.5
    w = w * scale
    h = h * scale
    local px, py = _G.res.getSpritePivot(egg.image)
    px = px * scale
    py = py * scale
    worldScale = 1
    if x >= self.x - px and x <= self.x + (w - px) and y >= self.y - py and y <= self.y + (h - py) then
      return self.returnValue, self.meta
    end
  end
end
function StarPopup:draw()
  setRenderState(0, 0, 1, 1, 0, 0)
  drawRect(0, 0, 0, self.rate * 0.5, 0, 0, screenWidth, screenHeight, false)
  ui.Image.draw(self)
  setRenderState(0, 0, 1, 1, 0, 0)
end
RewardPopup = ui.Image:inherit()
function RewardPopup:new(sprite, o)
  local o = o or {}
  o.sprite = sprite
  return ui.Image.new(self, o)
end
function RewardPopup:init()
  ui.Image:init()
  self:setImage("GOLDEN_EGG_STAR_EFFECT")
  egg = ui.Image:new()
  egg.name = "egg"
  egg:setImage(self.sprite)
  self:addChild(egg)
  egg.x = 0
  egg.y = 0
  self.clicks = 0
  self.visible = false
  self:getChild("egg").visible = false
  self.found = false
  self.rate = 0
  self.GEClicks = 0
end
function RewardPopup:layout()
  ui.Image.layout(self)
  local scale = 1
  if isRetinaGraphicsEnabled() then
    scale = 2
  end
  self.scaleX = scale
  self.scaleY = scale
end
function RewardPopup:draw()
  setRenderState(0, 0, 1, 1, 0, 0)
  drawRect(0, 0, 0, self.rate * 0.5, 0, 0, screenWidth, screenHeight, false)
  ui.Image.draw(self)
  setRenderState(0, 0, 1, 1, 0, 0)
end
PowerupReward = ui.Frame:inherit()
function PowerupReward:init()
  ui.Frame.init(self)
  self.components = {
    topLeft = "POPUP_BLACK_TOP_LEFTx",
    topMiddle = "POPUP_BLACK_TOP_MIDDLEx",
    topRight = "POPUP_BLACK_TOP_RIGHTx",
    left = "POPUP_BLACK_LEFTx",
    center = "POPUP_BLACK_CENTERx",
    right = "POPUP_BLACK_RIGHTx",
    bottomLeft = "POPUP_BLACK_BOTTOM_LEFTx",
    bottomMiddle = "POPUP_BLACK_BOTTOM_MIDDLEx",
    bottomRight = "POPUP_BLACK_BOTTOM_RIGHTx"
  }
  local shine = ui.Image:new()
  shine.name = "shine"
  shine:setImage("GOLDEN_EGG_STAR_EFFECT")
  self:addChild(shine)
  self.shine = shine
  local image = ui.Image:new()
  image.name = "image"
  image:setImage(self.image)
  self:addChild(image)
  local count = ui.Text:new()
  count.name = "count"
  count.text = "x" .. self.amount
  count.font = getFontBasic
  count.hanchor = "LEFT"
  self:addChild(count)
  local text = ui.Text:new()
  text.name = "text"
  text.text = self.message
  text:setFont(getFontBasic)
  self:addChild(text)
end
function PowerupReward:onEntry()
  ui.Frame.onEntry(self)
  self.animation = 0
  self.animation_duration = 2.5
  self.entry_duration = 0.5
  self.exit_duration = 0.5
  if not self.initial_shade then
    self.initial_shade = 0
  end
  self.shade = self.initial_shade
  self.finished = false
  self.angle = 0
end
function PowerupReward:layout()
  ui.Frame.layout(self)
  local image = self:getChild("image")
  local sw, sh = _G.res.getSpriteBounds(image.image)
  local text = self:getChild("text")
  setFont(text.font)
  local fh = _G.res.getFontLeading()
  local tw = _G.res.getStringWidth(_G.res.getString(text.group, text.text))
  self.x = screenWidth * 0.5
  self.y = screenHeight * 0.5
  self.width = tw * 1.2
  self.height = sh + fh * 2.4
  image.y = -self.height * 0.5 + sh * 0.5
  text.y = self.height * 0.5 - fh * 1.2
  local count = self:getChild("count")
  count.x = image.x + 0.6 * sw
  count.y = image.y
  local shine = self:getChild("shine")
  shine.x = image.x
  shine.y = image.y
  image.scaleX = self.image_scale or 1
  image.scaleY = self.image_scale or 1
  self:updatePosition()
end
function PowerupReward:updatePosition()
  if self.animation < self.entry_duration then
    self.x = tweenEaseCubicOut(self.animation, screenWidth + self.width * 1.5, screenWidth * -0.5 - self.width * 1.5, self.entry_duration)
    self.shade = tweenEaseCubicOut(self.animation, self.initial_shade, 0.75 - self.initial_shade, self.entry_duration)
  elseif self.animation < self.animation_duration - self.exit_duration then
    self.x = screenWidth * 0.5
    self.shade = 0.75
  elseif self.animation <= self.animation_duration then
    local exit_time = self.animation - (self.animation_duration - self.exit_duration)
    self.x = tweenEaseCubicIn(exit_time, screenWidth * 0.5, screenWidth * -0.5 - self.width * 1.5, self.exit_duration)
    self.shade = tweenEaseCubicIn(exit_time, 0.75, -0.75, self.exit_duration)
  end
end
function PowerupReward:update(dt, time)
  ui.Frame.update(self, dt, time)
  self.animation = self.animation + dt
  self:updatePosition()
  if self.animation > self.animation_duration then
    notificationsFrame:removeChild(self)
    self.finished = true
    if self.completion_call then
      self.completion_call()
    end
  end
  self.shine.angle = self.shine.angle + dt * 2
end
function PowerupReward:draw(x, y)
  drawRect(0, 0, 0, self.shade, 0, 0, screenWidth, screenHeight, false)
  ui.Frame.draw(self, x, y)
end
function PowerupReward:onKeyEvent(type, key)
  return "BLOCK", nil, self
end
filename = "reward_popups.lua"
