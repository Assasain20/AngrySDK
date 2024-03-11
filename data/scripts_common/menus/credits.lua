Credits = MainMenuRoot:inherit()
function Credits:init()
  MainMenuRoot.init(self)
  local back_button = ui.ImageButton:new()
  back_button.name = "backButton"
  back_button:setImage("ARROW_LEFT")
  back_button.returnValue = "RETURN_TO_MAIN_MENU"
  back_button.activateOnRelease = true
  back_button.clickSound = "menu_back"
  self:addChild(back_button)
  local credits_frame = ui.Frame:new()
  credits_frame.name = "creditsFrame"
  self:addChild(credits_frame)
  self.items = {}
  for k, v in _G.pairs(g_credits) do
    if v.condition == nil or v.condition then
      local item
      if v.type == "button" then
        item = ui.ImageButton:new()
        item:setImage(v.image)
        item.returnValue = v.returnValue
        item.activateOnRelease = true
      elseif v.type == "image" then
        item = ui.Image:new()
        item:setImage(v.image)
      elseif v.type == "text" then
        item = ui.Text:new({font = getFontBasic})
        item.hanchor = "HCENTER"
        item.vanchor = "VCENTER"
        item.text = v.text
      end
      item.name = v.name
      credits_frame:addChild(item)
      _G.table.insert(self.items, item.name)
    end
  end
end
function Credits:prepareForDynamicAssets()
  dynamic.setRequirements(self, {
    "credits",
    settingsWrapper:getCurrentMainMenuTheme()
  })
end
function Credits:setupAboutText()
  local text_about
  text_about = "TEXT_ABOUT"
  if deviceModel == "s60" then
    text_about = "TEXT_ABOUT_S60"
  end
  if deviceModel == "palm" then
    text_about = "TEXT_ABOUT_PALM"
  end
  if deviceModel == "android" then
    if isHDVersion then
      text_about = "TEXT_ABOUT_ANDROID_HD"
    else
      text_about = "TEXT_ABOUT_ANDROID"
    end
  end
  if deviceModel == "blackberry" then
    text_about = "TEXT_ABOUT_ANDROID_HD"
  end
  text_about = _G.res.getString("TEXTS_BASIC", text_about)
  local version_string = gameVersionNumber
  if not releaseBuild then
    version_string = version_string .. " (" .. svnRevisionNumber .. ") - " .. customerString
  end
  text_about = _G.string.gsub(text_about, "(%$GAME_VERSION)", version_string)
  return text_about
end
function Credits:onEntry()
  MainMenuRoot.onEntry(self)
  self.state = "RELEASED"
  self.scroll = 0
  self.extra_velocity = 0
  local text_credits = self:getChild("textCredits")
  text_credits:clip()
  local version_string = gameVersionNumber
  if not releaseBuild then
    version_string = version_string .. " (" .. svnRevisionNumber .. ") - " .. customerString
  end
end
function Credits:layout()
  MainMenuRoot.layout(self)
  self:setupAboutText()
  self.total_height = 0
  local y_separator = screenHeight * 0.05
  local credits_frame = self:getChild("creditsFrame")
  for k, v in _G.ipairs(self.items) do
    local item = self:getChild(v)
    if k > 1 then
      self.total_height = self.total_height + y_separator
    end
    item.x = screenWidth * 0.5
    item.y = self.total_height
    if item.text then
      if deviceModel == "freebox" then
        item.scaleX = 1.5
        item.scaleY = 1.5
      end
      setFont(item.font)
      local font_height = _G.res.getFontLeading()
      if deviceModel == "freebox" then
        font_height = font_height * 1.5
      end
      item.textBoxSize = _G.math.min(screenWidth * 0.77, font_height * 20)
      item:clip()
      item.y = item.y + font_height * #item.lines * 0.5
      self.total_height = self.total_height + font_height * #item.lines
    elseif item.image then
      local _, sh = _G.res.getSpriteBounds(item.image)
      item.y = item.y + sh * 0.5
      self.total_height = self.total_height + sh
    end
  end
  local back_button = self:getChild("backButton")
  back_button:refresh()
  back_button.x = back_button.w * 0.5 + g_layoutMargin.x
  back_button.y = screenHeight - back_button.h * 0.5 - g_layoutMargin.y
  if deviceModel == "roku" then
    back_button.y = back_button.h * 0.5 + g_layoutMargin.y
  end
end
function Credits:update(dt, time)
  MainMenuRoot.update(self, dt, time)
  if self.state == "RELEASED" then
    self.scroll = self.scroll + dt * screenHeight * 0.125 + self.extra_velocity * dt
    if _G.math.abs(self.extra_velocity) > 0 then
      if self.extra_velocity < 0 then
        self.extra_velocity = self.extra_velocity + screenHeight * dt * 4
        if self.extra_velocity >= 0 then
          self.extra_velocity = 0
        end
      else
        self.extra_velocity = self.extra_velocity - screenHeight * dt * 4
        if self.extra_velocity <= 0 then
          self.extra_velocity = 0
        end
      end
    end
  else
    local last_y = self.last_y or self.drag_start
    self.scroll = self.scroll + last_y - cursor.y
    self.last_y = cursor.y
  end
  if self.scroll >= self.total_height + screenHeight then
    self.scroll = self.scroll - self.total_height - screenHeight
  elseif self.scroll < 0 then
    self.scroll = self.scroll + self.total_height + screenHeight
  end
  self:getChild("creditsFrame").y = screenHeight - self.scroll
  self.state = "RELEASED"
end
function Credits:onKeyEvent(eventType, key)
  if eventType == "RELEASE" and (key == "BACK" or key == "KEY_MENU" or key == "ESCAPE") then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "MAIN_MENU",
      from = "CREDITS"
    })
  end
  if eventType == "HOLD" and (key == "DOWN" or key == "UP") then
    local direction = key == "UP" and -1 or 1
    if _G.math.abs(self.extra_velocity) < screenHeight then
      self.extra_velocity = self.extra_velocity + g_dt * direction * screenHeight * 16
    end
  end
end
function Credits:onPointerEvent(eventType, x, y)
  local result, meta, item = MainMenuRoot.onPointerEvent(self, eventType, x, y)
  if result == nil then
    if eventType == "LPRESS" and self.state == "RELEASED" then
      self.state = "DRAGGING"
      self.drag_start = cursor.y
      self.drag_start_time = g_time
      self.last_y = cursor.y
    elseif eventType == "LHOLD" and self.drag_start and self.drag_start_time and self.last_y then
      self.state = "DRAGGING"
    end
  elseif result == "RETURN_TO_MAIN_MENU" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "MAIN_MENU",
      from = "CREDITS"
    })
  elseif result == "GOTO_PRIVACY_POLICY" then
    gotoPrivacyPolicy()
  elseif result == "GOTO_EULA" then
    gotoEula()
  end
  if eventType == "LRELEASE" and self.state == "DRAGGING" then
    self.state = "RELEASED"
    local diff = g_time - self.drag_start_time
    if diff ~= 0 then
      self.extra_velocity = (self.drag_start - cursor.y) / (g_time - self.drag_start_time)
    else
      self.extra_velocity = 0
    end
  elseif eventType == "WHEEL" and self.state == "RELEASED" and _G.math.abs(self.extra_velocity) < screenHeight * 8 then
    self.extra_velocity = self.extra_velocity + g_dt * -cursor.wheel * screenHeight * 16
  end
  return result, meta, item
end
filename = "credits.lua"
