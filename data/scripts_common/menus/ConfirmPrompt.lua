ConfirmPrompt = gamelua.ui.Frame:inherit()
function ConfirmPrompt:init()
  local bg = gamelua.ui.BGBox:new()
  self.name = self.name or "ConfirmPrompt"
  bg.name = "bg"
  bg.hanchor = "LEFT"
  bg.vanchor = "TOP"
  self:addChild(bg)
  self.confirmOnLeft = self.confirmOnLeft or false
  local title = gamelua.ui.Text:new({
    name = "title",
    text = self.title,
    font = gamelua.getFontBasic
  })
  title.vanchor = "TOP"
  title.hanchor = "HCENTER"
  bg:addChild(title)
  if self.content ~= nil then
    local content = gamelua.ui.Text:new({
      name = "content",
      text = self.content,
      font = gamelua.getFontBasic
    })
    content.vanchor = "VCENTER"
    content.hanchor = "HCENTER"
    bg:addChild(content)
  end
  local close = gamelua.ui.ImageButton:new({name = "close", activateOnRelease = true})
  close:setImage("MENU_NO")
  close.returnValue = "CLOSE"
  close.activateOnRelease = true
  bg:addChild(close)
  local confirm = gamelua.ui.ImageButton:new({name = "confirm", activateOnRelease = true})
  confirm:setImage("MENU_YES")
  confirm.returnValue = "CONFIRM"
  confirm.activateOnRelease = true
  bg:addChild(confirm)
end
function ConfirmPrompt:onEntry()
  self.appearCounter = 0
end
function ConfirmPrompt:layout()
  gamelua.ui.Frame.layout(self)
  local title = self:getChild("title")
  title.textBoxSize = gamelua.screenWidth * 0.7
  title:clip()
  local close = self:getChild("close")
  local confirm = self:getChild("confirm")
  local content = self:getChild("content")
  local box_width = 0
  local box_height = 0
  if content ~= nil then
    box_width = gamelua.screenWidth * 0.7
    box_height = _G.math.min(gamelua.screenHeight * 0.8, _G.math.max(gamelua.screenHeight * 0.1, content:getHeight() * 3 + title:getHeight() + close.h))
  else
    box_width = _G.math.min(gamelua.screenWidth * 0.7, _G.math.max(gamelua.screenWidth * 0.5, title:getWidth() * 1.1))
    box_height = _G.math.min(gamelua.screenHeight * 0.8, title:getHeight() + close.h * 0.5)
  end
  local bg = self:getChild("bg")
  bg:setSize(box_width, box_height)
  bg.x = (gamelua.screenWidth - bg.width) * 0.5
  bg.y = (gamelua.screenHeight - bg.height) * 0.5
  if content ~= nil then
    content.textBoxSize = bg.width * 0.7
    content:clip()
  end
  local minimumGap = close.w / 4 + confirm.w / 4
  close.y = bg.height + bg:getBottomBlockH() * 0.5
  close.x = close.w * 0.5
  title.y = 0
  title.x = bg.width * 0.5
  if content ~= nil then
    content.x = title.x
    content.y = bg.height * 0.5
  end
  confirm.y = bg.height + bg:getBottomBlockH() * 0.5
  confirm.x = bg.width - close.w * 0.5
  if self.confirmOnLeft == true then
    close.x, confirm.x = confirm.x, close.x
  end
end
function ConfirmPrompt:onPointerEvent(eventType, x, y)
  local result, meta, item = gamelua.ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE" then
    gamelua.notificationsFrame:removeChild(self)
  elseif result == "CONFIRM" then
    gamelua.notificationsFrame:removeChild(self)
    if self.confirm_event then
      gamelua.eventManager:notify(self.confirm_event)
    end
    if self.confirm_call then
      self.confirm_call()
    end
  end
  if eventType == "HOVER" then
    for _, v in _G.ipairs(self:getChild("bg").children) do
      if v == item then
        return result, meta, item
      end
    end
  end
  return "BLOCK", nil, self
end
function ConfirmPrompt:onKeyEvent(eventType, key)
  local result, meta, item = Frame.onKeyEvent(self, eventType, key)
  if not result and eventType == "RELEASE" then
    if key == "ESCAPE" or key == "BACK" and not self.reverse_back_key then
      gamelua.notificationsFrame:removeChild(self)
    elseif key == "RETURN" or key == "BACK" and self.reverse_back_key then
      gamelua.notificationsFrame:removeChild(self)
      if self.confirm_event then
        gamelua.eventManager:notify(self.confirm_event)
      end
      if self.confirm_call then
        self.confirm_call()
      end
    else
    end
  elseif key == "BACK" and result then
    return result, meta, item
  end
  return "BLOCK", nil, self
end
function ConfirmPrompt:update(dt, time)
  self.appearCounter = _G.math.min(self.appearCounter + dt * 2, 0.7)
  Frame.update(self, dt, time)
end
function ConfirmPrompt:draw(x, y)
  gamelua.drawRect(0, 0, 0, self.appearCounter, 0, 0, gamelua.screenWidth, gamelua.screenHeight, false)
  gamelua.ui.Frame.draw(self, x, y)
end
filename = "ConfirmPrompt.lua"
