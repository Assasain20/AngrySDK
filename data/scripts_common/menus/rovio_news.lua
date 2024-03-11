print = gamelua.print
ui = gamelua.ui
local g_rovio_news
g_rovio_news_loaded = false
local g_rovio_news_frame
local test_rovio_news = false
RovioNewsTest = ui.Frame:inherit()
function RovioNewsTest:init()
  self.x = 0
  self.y = 0
  self.width = 0
  self.height = 0
end
function RovioNewsTest:draw(x, y)
  gamelua.setRenderState(0, 0, 1, 1)
  gamelua.drawRect(1, 0, 0, 0.5, self.x + x, self.y + y, self.x + x + self.width, self.y + y + self.height, false)
end
function RovioNewsTest:show()
  self.visible = true
end
function RovioNewsTest:hide()
  self.visible = false
end
RovioNews = ui.Frame:inherit()
function RovioNews:new()
  if g_rovio_news_frame == nil then
    g_rovio_news_frame = ui.Frame.new(self)
  end
  return g_rovio_news_frame
end
function RovioNews:init()
  ui.Frame.init(self)
  self.visible = false
  local multiplier = 1
  if gamelua.deviceModel == "iphone" and gamelua.screenWidth >= 960 or gamelua.deviceModel == "ipad" and gamelua.screenWidth == 2048 then
    multiplier = 0.5
  end
  local x1, x2 = gamelua.ui.PausePage.getTotalW()
  local x = x1 + x2
  local y = 0
  local width = gamelua.screenWidth - x
  local height = gamelua.screenHeight
  print("<rovio news> webview x=" .. x .. " y=" .. y .. " w=" .. width .. " h=" .. height .. "\n")
  if g_rovio_news == nil and _G.WebView then
    local full_news_url = gamelua.ROVIO_NEWS_URL .. "&inst=" .. gamelua.settingsWrapper:getInstalledApps()
    print("<rovio news> begin loading, url=" .. _G.tostring(full_news_url) .. "\n")
    g_rovio_news = _G.WebView.new(x, y, width, height)
    g_rovio_news:setOnLinkClickedCallback(function(view, url)
      return self:onLinkClicked(url)
    end)
    g_rovio_news:setOnPageLoadedCallback(function(view, success, title)
      self:onLoaded(success, title)
    end)
    g_rovio_news:loadPage(full_news_url)
  else
    print("<rovio news> not supported\n")
    if test_rovio_news then
      g_rovio_news = RovioNewsTest:new()
      g_rovio_news.x = x
      g_rovio_news.y = y
      g_rovio_news.width = width
      g_rovio_news.height = height
      g_rovio_news.visible = false
      gamelua.notificationsFrame:addChild(g_rovio_news)
      g_rovio_news_loaded = true
    end
  end
end
function RovioNews:onEntry()
  if self.visible and g_rovio_news_loaded then
    g_rovio_news:show()
    print("<rovio news> showing\n")
  end
  self.visible = false
end
function RovioNews:onExit()
  if g_rovio_news_loaded then
    g_rovio_news:hide()
    print("<rovio news> hiding\n")
  end
  self.visible = false
end
function RovioNews:setVisible(visible)
  ui.Frame.setVisible(self, visible)
  if not visible and g_rovio_news_loaded then
    print("<rovio news> hiding\n")
    g_rovio_news:hide()
  elseif visible and g_rovio_news_loaded then
    print("<rovio news> showing\n")
    g_rovio_news:show()
  end
end
function RovioNews:onLoaded(success, title)
  print("<rovio news> load callback, success=" .. _G.tostring(success) .. " title=" .. _G.tostring(title) .. "\n")
  if success and title == "Rovio News [hjsdu]" then
    g_rovio_news_loaded = true
    if self.visible then
      print("<rovio news> loaded, showing\n")
      g_rovio_news:show()
    else
      print("<rovio news> loaded\n")
    end
  end
end
function RovioNews:onLinkClicked(url)
  print("<rovio news> link clicked; url=" .. _G.tostring(url) .. "\n")
  return _G.WebView.LOAD_PAGE_INTO_EXTERNAL_BROWSER
end
filename = "rovio_news.lua"
