Prompt = gamelua.ui.Frame:inherit()
function Prompt:init()
  local bg = gamelua.ui.BGBox:new()
  bg.name = "bg"
  bg.hanchor = "LEFT"
  bg.vanchor = "TOP"
  self:addChild(bg)
  local title = gamelua.ui.Text:new({
    name = "title",
    text = self.title
  })
  title.vanchor = "TOP"
  title.hanchor = "HCENTER"
  title:setFont(gamelua.getFontBasic)
  bg:addChild(title)
  local content = gamelua.ui.Text:new({
    name = "content",
    text = self.content
  })
  content.vanchor = "VCENTER"
  content.hanchor = "HCENTER"
  content:setFont(gamelua.getFontBasic)
  bg:addChild(content)
  local close = gamelua.ui.ImageButton:new({name = "close", activateOnRelease = true})
  close:setImage("MENU_YES")
  close.returnValue = "CLOSE"
  bg:addChild(close)
  self.close_button = close
end
function Prompt:onEntry()
  self.appearCounter = 0
  gamelua.ui.Frame.onEntry(self)
end
function Prompt:layout()
  gamelua.ui.Frame.layout(self)
  local width = (self.box_width or 0.8) * gamelua.screenWidth
  local title = self:getChild("title")
  title.textBoxSize = width
  title:clip()
  local close = self:getChild("close")
  local content = self:getChild("content")
  content.textBoxSize = width * 0.95
  content:clip()
  local bg = self:getChild("bg")
  bg:setSize(width, _G.math.min(gamelua.screenHeight * 0.8, _G.math.max(gamelua.screenHeight * 0.1, content:getHeight() + title:getHeight() * 2 + close.h * 0.4)))
  bg.x = (gamelua.screenWidth - bg.width) * 0.5
  bg.y = (gamelua.screenHeight - bg.height) * 0.5
  close.y = bg.height
  close.x = bg.width - close.w
  title.y = 0
  title.x = bg.width * 0.5
  content.x = title.x
  content.y = title.y + title:getHeight() * 1.5 + content:getHeight() * 0.5
end
function Prompt:onPointerEvent(eventType, x, y)
  local result, meta, item = gamelua.ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE" then
    gamelua.eventManager:notify({
      id = gamelua.events.EID_POP_FRAME
    })
    if self.close_event then
      gamelua.eventManager:notify(self.close_event)
    end
    if self.close_call then
      self.close_call()
    end
  end
  if eventType == "HOVER" and item == self.close_button then
    return result, meta, item
  end
  return "BLOCK", nil, self
end
function Prompt:update(dt, time)
  Frame.update(self, dt, time)
  self.appearCounter = _G.math.min(self.appearCounter + dt * 2, 0.7)
end
function Prompt:draw(x, y)
  gamelua.drawRect(0, 0, 0, self.appearCounter, 0, 0, gamelua.screenWidth, gamelua.screenHeight, false)
  gamelua.ui.Frame.draw(self, x, y)
end
function Prompt:onKeyEvent(eventType, key)
  return "BLOCK", nil, self
end
filename = "Prompt.lua"
