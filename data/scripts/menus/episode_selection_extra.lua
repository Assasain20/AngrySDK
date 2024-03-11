gamelua.g_extra_pages = {
  pre = {
    {
      name = "promoButton",
      image = "BTN_BLACK",
      returnValue = "GOTO_SW_LINK"
    }
  },
  post = {
    {
      name = "upsellButton",
      image = "BTN_MERCHANDISE",
      returnValue = "GOTO_AB_SHOP"
    },
    {
      name = "classicButton",
      image = "BTN_GET_ABC",
      returnValue = "GOTO_CLASSIC",
      y = 0.35,
      noNewPage = true
    },
    {
      name = "newsletterButton",
      image = "BTN_NEWSLETTER",
      returnValue = "GOTO_NEWSLETTER",
      y = 0.65
    }
  }
}
if gamelua.deviceModel == "windows" or gamelua.deviceModel == "osx" then
  gamelua.g_extra_pages.post[2].y = nil
  gamelua.g_extra_pages.post[2].noNewPage = nil
  gamelua.g_extra_pages.post[3].y = nil
elseif gamelua.deviceModel == "iphone" or gamelua.deviceModel == "ipad" then
  gamelua.g_extra_pages.post[#gamelua.g_extra_pages.post + 1] = {
    name = "giftButton",
    image = "GIFT_THIS_APP",
    returnValue = "GOTO_GIFT_PURCHASE"
  }
end
filename = "episode_selection_extra.lua"
