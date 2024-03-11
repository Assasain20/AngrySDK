AchievementPopup = ui.BGBox:inherit()
function AchievementPopup:new(achievement_id, o)
  local o = o or {}
  o.achievement_id = achievement_id
  return ui.BGBox.new(self, o)
end
function AchievementPopup:init()
  ui.BGBox.init(self)
  self.components = {
    left = "ACHIEVEMENT_BG_LEFT",
    center = "ACHIEVEMENT_BG_MIDDLE",
    right = "ACHIEVEMENT_BG_RIGHT"
  }
  self.hanchor = "RIGHT"
  self.vanchor = "TOP"
  local icon = ui.Image:new()
  icon.name = "icon"
  self:addChild(icon)
  local title = ui.Text:new()
  title.name = "title"
  title.text = ""
  title.font = "FONT_GAMECENTER_BASIC"
  title.hanchor = "HCENTER"
  title.vanchor = "TOP"
  title.group = ""
  self:addChild(title)
  local description = ui.Text:new()
  description.name = "description"
  description.text = ""
  description.font = "FONT_GAMECENTER_BASIC"
  description.hanchor = "LEFT"
  description.vanchor = "BOTTOM"
  description.group = ""
  self:addChild(description)
end
function AchievementPopup:onEntry()
  ui.BGBox.onEntry(self)
  self.timer = 2.7
end
function AchievementPopup:layout()
  local sx = 1
  local sy = 1
  local tsx = 1
  local tsy = 1
  if isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
    tsx = 2
    tsy = 2
    self.components = {
      left = "ACHIEVEMENT_BG_LEFT_RETINA",
      center = "ACHIEVEMENT_BG_MIDDLE_RETINA",
      right = "ACHIEVEMENT_BG_RIGHT_RETINA"
    }
  else
    self.components = {
      left = "ACHIEVEMENT_BG_LEFT",
      center = "ACHIEVEMENT_BG_MIDDLE",
      right = "ACHIEVEMENT_BG_RIGHT"
    }
  end
  ui.BGBox.layout(self)
  local achievement
  if gameCenter ~= nil then
    achievement = gameCenter.achievements[self.achievement_id]
  end
  local title = self:getChild("title")
  local description = self:getChild("description")
  local icon = self:getChild("icon")
  title.text = "Achievement Title"
  if achievement ~= nil then
    title.text = achievement.title or "Achievement Title"
  end
  description.text = "Earned an achievement."
  if achievement ~= nil then
    description.text = achievement.achievedText or "Earned an achievement."
  end
  if achievement ~= nil then
    icon:setImage(achievement.icon)
  else
    icon:setImage("ACHIEVEMENT_GET_XXX_POINTS")
  end
  setFont(title.font)
  local title_h = _G.res.getFontHeight() * tsy
  local title_w = _G.res.getStringWidth(title.text) * tsx
  setFont(description.font)
  local desc_h = _G.res.getFontHeight() * tsy
  local desc_w = _G.res.getStringWidth(description.text) * tsx
  local bg_w, bg_h = _G.res.getSpriteBounds(self.components.right)
  local icon_w, icon_h = _G.res.getSpriteBounds(icon.image)
  icon_w = icon_w * sx
  icon_h = icon_h * sy
  self.width = _G.math.max(title_w, desc_w + icon_w) * 1.2
  self.height = bg_h
  self.x = screenWidth - bg_w
  title.x = self.width * -0.5
  title.y = self.height * 0.1
  title.scaleX = tsx
  title.scaleY = tsy
  icon.x = self.width * -0.9
  icon.y = self.height * 0.65
  icon.scaleX = sx
  icon.scaleY = sy
  description.x = icon.x + icon_w
  description.y = self.height * 0.75
  description.scaleX = tsx
  description.scaleY = tsy
end
function AchievementPopup:update(dt, time)
  ui.BGBox.update(self, dt, time)
  local _, box_h = _G.res.getSpriteBounds(self.components.right)
  self.timer = self.timer - dt
  if self.timer > 2.4 then
    self.y = screenHeight - box_h * ((2.7 - self.timer) / 0.3)
  elseif self.timer > 0.4 then
    self.y = screenHeight - box_h
  elseif self.timer > 0 then
    self.y = screenHeight - box_h + box_h * ((0.4 - self.timer) / 0.3)
  else
    notificationsFrame:removeChild(self)
  end
end
filename = "achievements.lua"
