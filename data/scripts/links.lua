local variant = "full"
if isLiteVersion then
  variant = "lite"
end
if isHDVersion then
  variant = "HD"
end
if applyChinaRestictions then
  variant = variant .. "_china"
end
DRAGON_VIDEO_URL = generateRedirectURL(variant, "dragonvideo")
XMAS2011_GIFT_URL = generateRedirectURL(variant, "xmas2011gift")
HALLOWEEN_2011_VIDEO_URL = generateRedirectURL(variant, "halloweenvideo")
SUMMER_VIDEO_URL = generateRedirectURL(variant, "summervideo")
XMAS_GIFT_URL = generateRedirectURL(variant, "xmasgift")
PC_SHOP_URL = generateRedirectURL("free", "angrybirdsseasonsfull")
if releaseBuild then
  GAME_COMPLETION_UPSELL_URL = "http://cloud.rovio.com/content/embed/popup/completion/?d=" .. deviceModel .. "&p=abs&a=" .. variant .. "&v=" .. gameVersionNumber .. "&sw=" .. screenWidth .. "&sh=" .. screenHeight .. "&i=" .. uniqueDeviceId .. "&c=" .. customerString
  LEVEL_URL_BASE = "http://cloud.rovio.com/content/feature/time/?device=" .. deviceModel .. "&version=" .. gameVersionNumber .. "&"
else
  GAME_COMPLETION_UPSELL_URL = "http://smoke.rovio.com/content/embed/popup/completion/?d=" .. deviceModel .. "&p=abs&a=" .. variant .. "&v=" .. gameVersionNumber .. "&sw=" .. screenWidth .. "&sh=" .. screenHeight .. "&i=" .. uniqueDeviceId .. "&c=" .. customerString
  LEVEL_URL_BASE = "http://smoke.rovio.com/content/feature/time/?clock=" .. timeMachineServer .. "&dev=true&device=" .. deviceModel .. "&version=" .. gameVersionNumber .. "&"
end
filename = "links.lua"
