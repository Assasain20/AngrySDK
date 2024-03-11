AdsSubSystem = subsystems.SubSystem:inherit()
local BANNER_FREQUENCY = 15
local EXPANDABLE_FREQUENCY = 60
local INTERSTITIAL_FREQUENCY = 120
local BANNER_DOWNTIME = 10
local AD_DOWNTIME = 2
local BANNER_DURATION = 20
local BANNER_FADE = 0.7
if releaseBuild ~= true and cheatsEnabled == true then
  EXPANDABLE_FREQUENCY = 30
  INTERSTITIAL_FREQUENCY = 60
end
function AdsSubSystem:init()
  self.bannerCheckTimer = BANNER_FREQUENCY
  self.expandableCheckTimer = EXPANDABLE_FREQUENCY
  self.interstitialCheckTimer = INTERSTITIAL_FREQUENCY
  self.adDowntime = 0
end
function AdsSubSystem:eventTriggered(event)
  if settingsWrapper:isPremium() then
    return
  end
  if event.id == events.EID_LEVEL_LOADING_DONE then
  end
  if event.id == events.EID_LEVEL_LOADING_DONE and not g_episodes[currentThemeNumber].no_ads and not g_episodes[currentThemeNumber].pages[currentPageNumber].no_ads then
    if interstitialAdReady then
      self:showInterstitial()
      adShown = true
    elseif expandableAdReady then
      self:showExpandable()
      adShown = true
    end
  end
  if event.id == events.EID_MENUMANAGER_ROOT_CHANGED and event.root ~= nil then
    if _G.string.find(event.root.name, "^LevelSelection") then
      self:hideBanner()
      self:hideExpandable()
    end
    if event.root.name == "LevelEndRoot" or event.root.name == "MEPage" then
      self:hideBanner()
      self:hideExpandable()
    end
    if event.root.name == "AdsOffPage" then
      self:hideBanner()
      self:hideExpandable()
    end
  end
  if event.id == events.EID_ROVIO_NEWS_SHOWN then
    self:hideBanner()
    self:hideExpandable()
  end
  if event.id == events.EID_GAME_INITIALIZED then
    self.bannerWidth = 320 * (event.screenWidth / 320)
    self.bannerHeight = 48 * (event.screenHeight / 320)
    adShown = false
    local isAndroid, isHD = subsystemsapi:isAndroid()
    if isAndroid and isHD then
      self.bannerHeight = 48
    end
    if interstitialAdReady then
      self:showInterstitial()
      adShown = true
    end
    self:requestBanner()
    self:requestExpandable()
  end
end
function AdsSubSystem:update(dt, time)
  if settingsWrapper:isPremium() then
    return
  end
  self:updateScoreOffset(dt, time)
  if shouldShowAd() then
    self.adDowntime = self.adDowntime - dt
    self.bannerCheckTimer = self.bannerCheckTimer - dt
    self.expandableCheckTimer = self.expandableCheckTimer - dt
    self.interstitialCheckTimer = self.interstitialCheckTimer - dt
    if not bannerAdReady and not bannerAdRequested and self.bannerCheckTimer <= 0 then
      self:requestBanner()
    end
    if not expandableAdReady and not expandableAdRequested and self.expandableCheckTimer <= 0 then
      self:requestExpandable()
    end
    if not interstitialAdReady and not interstitialAdRequested and self.interstitialCheckTimer <= 0 then
      self:requestInterstitial()
    end
    if not adShown and self.adDowntime <= 0 and not g_episodes[currentThemeNumber].no_ads and not g_episodes[currentThemeNumber].pages[currentPageNumber].no_ads and bannerAdReady then
      self:showBanner()
      adShown = true
    end
  end
end
function AdsSubSystem:updateScoreOffset(dt, time)
  if self.bannerFadeTimer then
    self.bannerFadeTimer = self.bannerFadeTimer - dt
    if self.bannerFadeTimer <= 0 then
      if self.bannerShowing then
        self.bannerShowing = false
        self.bannerFadeTimer = BANNER_DURATION
        self.bannerShown = true
      elseif self.bannerShown then
        self:hideBanner()
      elseif self.bannerHiding then
        self.bannerHiding = false
        self.bannerFadeTimer = nil
      end
    end
  end
  if self.bannerHiding and self.bannerFadeTimer ~= nil then
    self.scoreAdOffsetY = self.bannerHeight * self.bannerFadeTimer
  elseif self.bannerShowing == true and self.bannerFadeTimer ~= nil then
    self.scoreAdOffsetY = self.bannerHeight - self.bannerFadeTimer / BANNER_FADE * self.bannerHeight
  elseif self.bannerShown then
    if self.scoreAdOffsetY ~= self.bannerHeight then
      self.scoreAdOffsetY = self.bannerHeight
    end
  elseif self.scoreAdOffsetY ~= 0 then
    self.scoreAdOffsetY = 0
  end
end
function AdsSubSystem:requestBanner()
  print("AdsSubSystem:requestBanner()")
  native_requestBannerAd()
  bannerAdRequested = true
  self.bannerCheckTimer = BANNER_FREQUENCY
  notifyEventManager(events.EID_AD_REQUESTED, {type = "banner"})
end
function AdsSubSystem:requestExpandable()
  print("AdsSubSystem:requestExpandable()")
  native_requestExpandableAd()
  expandableAdRequested = true
  self.expandableCheckTimer = EXPANDABLE_FREQUENCY
  notifyEventManager(events.EID_AD_REQUESTED, {type = "expandable"})
end
function AdsSubSystem:requestInterstitial()
  print("AdsSubSystem:requestInterstitial()")
  native_requestInterstitialAd()
  interstitialAdRequested = true
  self.interstitialCheckTimer = INTERSTITIAL_FREQUENCY
  notifyEventManager(events.EID_AD_REQUESTED, {
    type = "interstitial"
  })
end
function AdsSubSystem:showBanner()
  print("AdsSubSystem:showBanner()")
  bannerAdReady = false
  native_showBannerAd()
  self.bannerShowing = true
  self.bannerFadeTimer = BANNER_FADE
  notifyEventManager(events.EID_AD_SERVED, {type = "banner"})
end
function AdsSubSystem:hideBanner()
  if self.bannerShown then
    print("AdsSubSystem:hideBanner()")
    native_hideBannerAd()
    self.adDowntime = BANNER_DOWNTIME
    adShown = false
    self.bannerShown = false
    self.bannerFadeTimer = BANNER_FADE
    self.bannerHiding = true
  end
end
function AdsSubSystem:showExpandable()
  print("AdsSubSystem:showExpandable()")
  expandableAdReady = false
  self.expandableShown = true
  native_showExpandableAd()
  notifyEventManager(events.EID_AD_SERVED, {type = "expandable"})
end
function AdsSubSystem:hideExpandable()
  if self.expandableShown then
    print("AdsSubSystem:hideExpandable()")
    native_hideExpandableAd()
    self.adDowntime = AD_DOWNTIME
    adShown = false
    self.expandableShown = false
  end
end
function AdsSubSystem:showInterstitialAd()
  print("AdsSubSystem:showInterstitialAd()")
  interstitialAdReady = false
  interstitialAdRequested = false
  self.interstitialShown = true
  native_showInterstitialAd()
  notifyEventManager(events.EID_AD_SERVED, {
    type = "interstitial"
  })
end
function onBannerAdReady()
  print("onBannerAdReady()")
  bannerAdReady = true
  bannerAdRequested = false
end
function onBannerAdRequestFailed()
  print("onBannerAdRequestFailed()")
  bannerAdRequested = false
  adSystem.bannerCheckTimer = BANNER_FREQUENCY
end
function onExpandableAdReady()
  print("onExpandableAdReady()")
  expandableAdReady = true
  expandableAdRequested = false
end
function onExpandableAdRequestFailed()
  print("onExpandableAdRequestFailed()")
  expandableAdRequested = false
  adSystem.expandableCheckTimer = EXPANDABLE_FREQUENCY
end
function onExpandableAdHidden()
  print("onExpandableAdWasHidden()")
  adShown = false
  adSystem.adDowntime = AD_DOWNTIME
  adSystem.expandableTimer = EXPANDABLE_FREQUENCY
  eventManager:notify({
    id = events.EID_FULLSCREEN_AD_DISMISSED
  })
end
function onInterstitialAdHidden()
  print("onInterstitialAdHidden()")
  adShown = false
  adSystem.interstitialShown = false
  adSystem.adDowntime = AD_DOWNTIME
  eventManager:notify({
    id = events.EID_FULLSCREEN_AD_DISMISSED
  })
  if currentGameMode == updateGame and _G.res.isAudioPlaying(currentMainMenuSong) == true then
    _G.res.stopAudio(currentMainMenuSong)
  end
end
function shouldShowAd()
  if menuManager ~= nil and menuManager:getRoot() ~= nil then
    local rootName = menuManager:getRoot().name
    if rootName == "MEPage" or rootName == "AdsOffPage" or rootName == "LevelEndRoot" or subsystemsapi:isPauseMenuVisible() then
      return false
    end
  end
  return (isLiteVersion == true and (deviceModel == "iphone" or deviceModel == "iphone4" or deviceModel == "ipad" or deviceModel == "ipad3") or deviceModel == "android") and not settingsWrapper:isPremium() and menuManager:getRoot() and menuManager:getRoot().name == "gameHud"
end
filename = "adsSubsystem.lua"
