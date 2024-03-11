SubSystem = {}
function SubSystem:new(o)
  o = o or {}
  o.children = {}
  o.x = o.x or 0
  o.y = o.y or 0
  o.name = o.name or "UNDEFINED"
  _G.setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end
function SubSystem:setup_metatable(o)
  local o = o or {}
  _G.setmetatable(o, self)
  self.__index = self
  return o
end
function SubSystem:inherit()
  return self:setup_metatable()
end
function SubSystem:update(dt)
end
function SubSystem:init()
end
LinkListener = SubSystem:new()
function LinkListener:eventTriggered(event)
  local events = gamelua.events
  if event.id == events.EID_GIFT_PURCHASE_CLICKED then
    gamelua.openURL(gamelua.APPLE_GIFT_PURCHASE_URL)
  end
  if event.id == events.EID_LENOVO_ADFREE_CLICKED then
    gamelua.openURL(gamelua.LENOVO_NO_ADS_URL)
  end
  if event.id == events.EID_AB_SHOP_CLICKED then
    gamelua.openURL(gamelua.ABSHOP_URL)
  end
  if event.id == events.EID_ALEX_CLICKED then
    gamelua.openURL(gamelua.ALEX_URL)
  end
  if event.id == events.EID_PIGGIES_CLICKED then
    gamelua.openURL(gamelua.BAD_PIGGIES_URL)
  end
  if event.id == events.EID_SW_CLICKED then
    gamelua.openURL(gamelua.AB_STAR_WARS_URL)
  end
  if event.id == events.EID_MIGHTY_EAGLE_TRAILER_CLICKED then
    gamelua.openURL(gamelua.MIGHTY_EAGLE_TRAILER)
    if gamelua.cheatsEnabled then
      gamelua.enableMightyEagle()
    end
  end
  if event.id == events.EID_NEWSLETTER_CLICKED then
    gamelua.openURL(gamelua.NEWSLETTER_URL)
  end
  if event.id == events.EID_SEASONS_CLICKED then
    gamelua.openURL(gamelua.APP_STORE_HALLOWEEN_URL)
  end
  if event.id == events.EID_CLASSIC_CLICKED then
    gamelua.openURL(gamelua.APP_STORE_FULL_VERSION_URL)
  end
  if event.id == events.EID_VIDEO_LINK_CLICKED then
    print("Link: " .. event.link)
    gamelua.openURL(gamelua[event.link])
  end
end
filename = "subsystems.lua"
