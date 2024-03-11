LoadingPage = ui.Frame:inherit()
function LoadingPage:draw(x, y)
  drawRect(0, 0, 0, 172, 0, 0, screenWidth, screenHeight, false)
  ui.Frame.draw(self, x, y)
end
LevelLoadingPage = LoadingPage:inherit()
function LevelLoadingPage:init()
  LoadingPage.init(self)
  local loading_text = ui.Text:new({font = getFontBasic})
  loading_text.name = "loadingText"
  loading_text.text = "MI_LOADING"
  loading_text.hanchor = "HCENTER"
  loading_text.vanchor = "VCENTER"
  self:addChild(loading_text)
end
function LevelLoadingPage:update(dt)
  LoadingPage.update(self, dt)
end
function LevelLoadingPage:layout()
  local sx = 1
  local sy = 1
  if isRetinaGraphicsEnabled() then
    sx = 2
    sy = 2
  end
  LoadingPage.layout(self)
  local loading_text = self:getChild("loadingText")
  loading_text.x = screenWidth * 0.5
  loading_text.y = screenHeight * 0.5
  loading_text.scaleX = sx
  loading_text.scaleY = sy
end
filename = "loading.lua"
