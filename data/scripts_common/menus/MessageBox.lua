MessageBox = gamelua.ui.Frame:inherit()
function MessageBox:init()
  local bg = gamelua.ui.BGBox:new()
  bg.name = "bg"
  bg.hanchor = "LEFT"
  bg.vanchor = "TOP"
  self:addChild(bg)
  local sx = 1
  local sy = 1
  if gamelua.isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
  end
  self.image_scale = self.image_scale or 1
  local title = gamelua.ui.Text:new({
    name = "title",
    text = self.title
  })
  title.vanchor = "TOP"
  title.hanchor = "HCENTER"
  title.scaleX = sx
  title.scaleY = sy
  title:setFont(gamelua.getFontBasic)
  bg:addChild(title)
  local content = gamelua.ui.Text:new({
    name = "content",
    text = self.content
  })
  content.vanchor = "VCENTER"
  content.hanchor = "HCENTER"
  content.scaleX = sx
  content.scaleY = sy
  content:setFont(gamelua.getFontBasic)
  bg:addChild(content)
  local close = gamelua.ui.ImageButton:new({name = "close", activateOnRelease = true})
  close:setImage("MENU_YES")
  close.returnValue = "CLOSE"
  close.scaleX = sx
  close.scaleY = sy
  bg:addChild(close)
  self.close_button = close
  self.tallest_image = 0
  if self.images then
    self.image_spacing = gamelua.screenWidth * 0.02
    self.total_image_width = 0
    for i = 1, #self.images do
      local image = gamelua.ui.Image:new()
      image.name = "image" .. i
      image:setImage(self.images[i])
      image.scaleX = self.image_scale
      image.scaleY = self.image_scale
      bg:addChild(image)
      local image_w, image_h = _G.res.getSpriteBounds(image.image)
      image_w = image_w * self.image_scale
      image_h = image_h * self.image_scale
      self.total_image_width = self.total_image_width + image_w + self.image_spacing
      if image_h > self.tallest_image then
        self.tallest_image = image_h
      end
    end
  end
end
function MessageBox:onEntry()
  self.appearCounter = 0
  gamelua.ui.Frame.onEntry(self)
end
function MessageBox:layout()
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
  local image_sx = 1
  if (gamelua.deviceModel == "iphone4" or gamelua.deviceModel == "ipad3") and not gamelua.isRetinaGraphicsEnabled() then
    image_sx = 0.5
  end
  if self.images then
    local current_x = width / 2 - self.total_image_width / 2
    for i = 1, #self.images do
      local image = bg:getChild("image" .. i)
      image.x = current_x + image.w * self.image_scale / 2
      image.y = self.tallest_image / 2
      current_x = current_x + image.w * self.image_scale + self.image_spacing
    end
  end
  local max_height
  if gamelua.screenWidth < 480 then
    max_height = gamelua.screenHeight * 0.65
  else
    max_height = gamelua.screenHeight * 0.8
  end
  bg:setSize(width, _G.math.min(max_height, _G.math.max(gamelua.screenHeight * 0.1, content:getHeight() + title:getHeight() * 2 + close.h * 0.5 + self.tallest_image * 1.1)))
  bg.x = (gamelua.screenWidth - bg.width) * 0.5
  bg.y = (gamelua.screenHeight - bg.height) * 0.5
  close.y = _G.math.min(bg.height + bg:getBottomBlockH() * 0.5, -bg.y + gamelua.screenHeight - close.h / 2)
  close.x = bg.width - close.w
  title.y = self.tallest_image * 1.1
  title.x = bg.width * 0.5
  content.x = title.x
  content.y = title.y + title:getHeight() * 1.5 + content:getHeight() * 0.5
end
function MessageBox:onPointerEvent(eventType, x, y)
  local result, meta, item = gamelua.ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE" then
    self:close()
  end
  if eventType == "HOVER" and item == self.close_button then
    return result, meta, item
  end
  return "BLOCK", nil, self
end
function MessageBox:close()
  gamelua.notificationsFrame:removeChild(self)
  if self.close_event then
    gamelua.eventManager:notify(self.close_event)
  end
  if self.close_call then
    self.close_call()
  end
end
function MessageBox:update(dt, time)
  Frame.update(self, dt, time)
  self.appearCounter = _G.math.min(self.appearCounter + dt * 2, 0.7)
end
function MessageBox:draw(x, y)
  gamelua.drawRect(0, 0, 0, self.appearCounter, 0, 0, gamelua.screenWidth, gamelua.screenHeight, false)
  gamelua.ui.Frame.draw(self, x, y)
end
function MessageBox:onKeyEvent(eventType, key)
  return "BLOCK", nil, self
end
filename = "MessageBox.lua"
