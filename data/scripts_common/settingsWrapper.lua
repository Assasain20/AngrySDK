settingsWrapper = {}
local localDevice = "device_" .. uniqueDeviceId
if ABIDEnabled ~= true then
  localSettings = settings
  purchases = settings
else
  localSettings = localSettings or {}
  purchases = purchases or {}
end
function settingsWrapper:setPremium(premium)
  purchases.isPremium = premium
end
function settingsWrapper:isPremium()
  return purchases.isPremium
end
function settingsWrapper:isBoomerangBirdAchieved()
  return settings.boomerangBirdAchieved
end
function settingsWrapper:setBoomerangBirdAchieved()
  settings.boomerangBirdAchieved = true
end
function settingsWrapper:isBoomerangBird2Achieved()
  return settings.boomerangBirdAchieved2
end
function settingsWrapper:setBoomerangBird2Achieved()
  settings.boomerangBirdAchieved2 = true
end
function settingsWrapper:getEagleUsedTime()
  return localSettings.eagleUsedTime
end
function settingsWrapper:setEagleUsedTime(t)
  loginfo(" Eagle used time set to " .. _G.tostring(t))
  localSettings.eagleUsedTime = t
end
function settingsWrapper:getEagleUsedIn()
  if localSettings.eaglesUsedIn == nil then
    localSettings.eaglesUsedIn = {}
  end
  return localSettings.eaglesUsedIn
end
function settingsWrapper:resetEaglesUsedIn()
  localSettings.eaglesUsedIn = {}
end
function settingsWrapper:removeEagleUsedInLevel(levelName)
  local index
  if levelName == nil then
    return
  end
  for i, v in _G.ipairs(localSettings.eaglesUsedIn) do
    if v.level == levelName then
      index = i
    end
  end
  if index ~= nil then
    _G.table.remove(localSettings.eaglesUsedIn, i)
    return true
  end
  return false
end
function settingsWrapper:setEagleUsedInLevel(levelName)
  if localSettings.eaglesUsedIn == nil then
    localSettings.eaglesUsedIn = {}
  end
  if levelName ~= nil then
    _G.table.insert(localSettings.eaglesUsedIn, {level = levelName})
  end
end
function settingsWrapper:isIAPRestoreChecked()
  return settings.iap_restore_checked or false
end
function settingsWrapper:setIAPRestoreChecked()
  settings.iap_restore_checked = true
end
function settingsWrapper:getCumulativeStars()
  return settings.cumulativeStars
end
function settingsWrapper:setCumulativeStars(stars)
  settings.cumulativeStars = stars
end
function settingsWrapper:getSettingsVersion()
  return settings.settingsVersion or {id = 0, version = "pre-2.0"}
end
function settingsWrapper:convertSettings()
  if settingsWrapper:getSettingsVersion().id == 0 then
    if settings.openGoldenEggLevels ~= nil then
      local oldGoldenEggs = settings.openGoldenEggLevels
      settings.openGoldenEggLevels = {}
      for k, v in _G.pairs(oldGoldenEggs) do
        if _G.type(v) == "number" then
          for i = 1, 26 do
            if k == "Level" .. i then
              local page, level_number
              if i <= 15 then
                page = 1
                level_number = i
              else
                page = 2
                level_number = i - 15
              end
              local level = g_episodes.G.pages[page].levels[level_number]
              local level_entry
              if v == 0 then
                level_entry = {unlocked = true, opened = false}
              elseif v == 1 or v == 2 then
                level_entry = {unlocked = true, opened = true}
              end
              settings.openGoldenEggLevels[level.name] = level_entry
            end
          end
        else
          settings.openGoldenEggLevels[k] = v
        end
      end
      for i = 1, #g_episodes.G.pages do
        for j = 1, #g_episodes.G.pages[i].levels do
          local level = g_episodes.G.pages[i].levels[j]
          if not settings.openGoldenEggLevels[level.name] then
            settings.openGoldenEggLevels[level.name] = {unlocked = false, opened = false}
          end
        end
      end
    end
    if settings.gameCompleted then
      settings.theme3Completed = true
    end
    if settings.lastOpenLevel then
      settings.lastOpenLevelLP1 = settings.lastOpenLevel
    end
    settings.eaglesUsedIn = nil
    settings.eagleUsedTime = nil
    if settings.gameStarted then
      settingsWrapper:setCutsceneWatched("pack1_intro")
    end
    for i = 2, 6 do
      if settings["lp" .. i .. "Started"] then
        settingsWrapper:setCutsceneWatched("pack" .. i .. "_intro")
      end
    end
    settings.settingsVersion = {id = 1, version = "2.0"}
  end
  if settingsWrapper:getSettingsVersion().id == 1 then
    local newInventory = {}
    newInventory[localDevice] = {}
    for k, v in _G.pairs(settingsWrapper:getInventory()) do
      newInventory[localDevice][k] = {totalCount = v, usedCount = 0}
    end
    settings.inventory = newInventory
    local valueNames = {
      "playtime",
      "gameStarts",
      "gameRestarted",
      "backwardsBirdCount",
      "birdsShooted",
      "pigsDestroyed",
      "woodBlocksDestroyed",
      "rockBlocksDestroyed",
      "iceBlocksDestroyed"
    }
    for i, v in _G.ipairs(valueNames) do
      local newValue = {}
      newValue[localDevice] = deepCopy(settings[v])
      settings[v] = newValue
    end
    settings.settingsVersion = {id = 2, version = "2.3"}
  end
end
function settingsWrapper:getLocalAmount(valueName)
  if settings[valueName] == nil then
    return 0
  end
  return settings[valueName][localDevice] or 0
end
function settingsWrapper:setLocalAmount(valueName, amount)
  if settings[valueName] == nil then
    settings[valueName] = {}
  end
  settings[valueName][localDevice] = amount
end
function settingsWrapper:getDeviceSum(valueName)
  local sum = 0
  if settings[valueName] then
    for _, v in _G.pairs(settings[valueName]) do
      sum = sum + v
    end
  end
  return sum
end
function settingsWrapper:getWoodBlocksDestroyed()
  return settingsWrapper:getDeviceSum("woodBlocksDestroyed")
end
function settingsWrapper:increaseWoodBlocksDestroyed()
  settingsWrapper:setLocalAmount("woodBlocksDestroyed", settingsWrapper:getLocalAmount("woodBlocksDestroyed") + 1)
end
function settingsWrapper:getRockBlocksDestroyed()
  return settingsWrapper:getDeviceSum("rockBlocksDestroyed")
end
function settingsWrapper:increaseRockBlocksDestroyed()
  settingsWrapper:setLocalAmount("rockBlocksDestroyed", settingsWrapper:getLocalAmount("rockBlocksDestroyed") + 1)
end
function settingsWrapper:getIceBlocksDestroyed()
  return settingsWrapper:getDeviceSum("iceBlocksDestroyed")
end
function settingsWrapper:increaseIceBlocksDestroyed()
  settingsWrapper:setLocalAmount("iceBlocksDestroyed", settingsWrapper:getLocalAmount("iceBlocksDestroyed") + 1)
end
function settingsWrapper:getPigsDestroyed()
  return settingsWrapper:getDeviceSum("pigsDestroyed")
end
function settingsWrapper:incrementPigsDestroyed()
  settingsWrapper:setLocalAmount("pigsDestroyed", settingsWrapper:getLocalAmount("pigsDestroyed") + 1)
end
function settingsWrapper:getTutorials()
  if settings.tutorials == nil then
    settings.tutorials = {}
  end
  return settings.tutorials
end
function settingsWrapper:getTutorialsForItem(tutorial_item)
  return settingsWrapper:getTutorials()[tutorial_item]
end
function settingsWrapper:createTutorialForItem(tutorial_item, sprite, extra_tutorial)
  local tutorials = settingsWrapper:getTutorials()
  tutorials[tutorial_item] = {sprite = sprite}
  if extra_tutorial then
    tutorials[tutorial_item].showHelp = true
  end
end
function settingsWrapper:setExtraTutorialShown(tutorial_item)
  local tutorial = settingsWrapper:getTutorialsForItem(tutorial_item)
  if tutorial and tutorial.showHelp then
    tutorial.showHelp = false
  end
end
function settingsWrapper:resetMightyEagle()
  local tutorials = settingsWrapper:getTutorials()
  tutorials.BAIT_SARDINE = nil
  purchases.mightyEagleEnabled = nil
end
function settingsWrapper:isEpisodeThreeStarred(episode)
  return settings["threeStarsLP" .. episode] or false
end
function settingsWrapper:setEpisodeThreeStarred(episode)
  settings["threeStarsLP" .. episode] = true
end
function settingsWrapper:isThemeCompleted(theme)
  return settings["theme" .. theme .. "Completed"] or false
end
function settingsWrapper:setThemeCompleted(theme)
  if _G.tonumber(theme) and _G.math.floor(_G.tonumber(theme)) > 0 then
    settings["theme" .. _G.math.floor(_G.tonumber(theme)) .. "Completed"] = true
  end
end
function settingsWrapper:getGoldenEgg(level)
  if settings.openGoldenEggLevels == nil then
    settings.openGoldenEggLevels = {}
  end
  if settings.openGoldenEggLevels[level] == nil then
    settings.openGoldenEggLevels[level] = {unlocked = false, opened = false}
  end
  return settings.openGoldenEggLevels[level]
end
function settingsWrapper:setGoldenEggPlayed(level)
  settingsWrapper:getGoldenEgg(level).opened = true
end
function settingsWrapper:isGoldenEggPlayed(level)
  return settingsWrapper:getGoldenEgg(level).opened
end
function settingsWrapper:isGoldenEggUnlocked(level)
  return settingsWrapper:getGoldenEgg(level).unlocked
end
function settingsWrapper:unlockGoldenEgg(level)
  settingsWrapper:getGoldenEgg(level).unlocked = true
end
function settingsWrapper:restoreGoldenEggsFromHighscores()
  for i = 1, #g_episodes do
    for j = 1, #g_episodes[i].pages do
      if g_episodes[i].pages[j].calculate_as_golden_egg_levels then
        for k = 1, #g_episodes[i].pages[j].levels do
          local level = g_episodes[i].pages[j].levels[k]
          if highscores[level.name] then
            settingsWrapper:unlockGoldenEgg(level.name)
            if highscores[level.name].completed then
              settingsWrapper:setGoldenEggPlayed(level.name)
            end
          end
        end
      end
    end
  end
end
function settingsWrapper:getLastRewardDate()
  return settings.lastDailyRewardTime or {
    year = 0,
    month = 0,
    day = 0,
    hour = 0,
    minutes = 0,
    seconds = 0
  }
end
function settingsWrapper:setLastRewardDate(time)
  local reward_date = time
  reward_date.hour = 0
  reward_date.minutes = 0
  reward_date.seconds = 0
  settings.lastDailyRewardTime = time
end
function settingsWrapper:getDailyRewardStreak()
  return settings.dailyRewardStreak or 0
end
function settingsWrapper:setDailyRewardStreak(streak)
  settings.dailyRewardStreak = streak
end
function settingsWrapper:toggleChildlock()
  if settings.shopChildlockOn then
    settings.shopChildlockOn = not settings.shopChildlockOn
  else
    settings.shopChildlockOn = true
  end
end
function settingsWrapper:isChildlockOn()
  return settings.shopChildlockOn or false
end
function settingsWrapper:setMightyEagleUpsellPageViewed()
  settings.mightyEagleUpsellPageViewed = true
end
function settingsWrapper:isMightyEagleUpsellPageViewed()
  return settings.mightyEagleUpsellPageViewed or false
end
function settingsWrapper:setMightyEagleEnabled()
  purchases.mightyEagleEnabled = true
end
function settingsWrapper:isMightyEagleEnabled()
  return purchases.mightyEagleEnabled or false
end
function settingsWrapper:isGfxLowQuality()
  return localSettings.gfxLowQuality or false
end
function settingsWrapper:toggleGfxLowQuality()
  if localSettings.gfxLowQuality == nil then
    localSettings.gfxLowQuality = true
  else
    localSettings.gfxLowQuality = not localSettings.gfxLowQuality
  end
end
function settingsWrapper:isFlurryFirstTimeLevelCollected()
  return settings.flurryFirstTimeLevelCollected or false
end
function settingsWrapper:setFlurryFirstTimeLevelCollected()
  settings.flurryFirstTimeLevelCollected = true
end
function settingsWrapper:isFbPageLiked()
  return settings.fbPageLiked or false
end
function settingsWrapper:setFbPageLiked()
  settings.fbPageLiked = true
end
function settingsWrapper:isTwitterFollowed()
  return settings.twitterFollowed or false
end
function settingsWrapper:setTwitterFollowed()
  settings.twitterFollowed = true
end
function settingsWrapper:getBirdsShot()
  return settingsWrapper:getDeviceSum("birdsShooted")
end
function settingsWrapper:incrementBirdsShot()
  settingsWrapper:setLocalAmount("birdsShooted", settingsWrapper:getLocalAmount("birdsShooted") + 1)
end
function settingsWrapper:getBackwardsBirdCount()
  return settingsWrapper:getDeviceSum("backwardsBirdCount")
end
function settingsWrapper:incrementBackwardsBirdCount()
  settingsWrapper:setLocalAmount("backwardsBirdCount", settingsWrapper:getLocalAmount("backwardsBirdCount") + 1)
end
function settingsWrapper:getSelectedEpisode()
  return localSettings.selectedEpisode or 1
end
function settingsWrapper:setSelectedEpisode(episode)
  localSettings.selectedEpisode = episode
end
function settingsWrapper:getLastOpenLevel(episode)
  local last = settings["lastOpenLevelLP" .. episode] or calculateLastOpenLevel(episode)
  if not settings["lastOpenLevelLP" .. episode] then
    settings["lastOpenLevelLP" .. episode] = last
  end
  return last
end
function settingsWrapper:setLastOpenLevel(episode, level)
  settings["lastOpenLevelLP" .. episode] = level
end
function settingsWrapper:incrementLastOpenLevel(episode)
  settings["lastOpenLevelLP" .. episode] = settingsWrapper:getLastOpenLevel(episode) + 1
end
function settingsWrapper:getCurrentZoomLevelMainMenu()
  return localSettings.currentZoomLevelMainMenu or 1.83
end
function settingsWrapper:setCurrentZoomLevelMainMenu(zoom)
  localSettings.currentZoomLevelMainMenu = zoom
end
function settingsWrapper:getCurrentMainMenuTheme()
  return localSettings.currentMainMenuTheme or "theme1"
end
function settingsWrapper:setCurrentMainMenuTheme(theme)
  localSettings.currentMainMenuTheme = theme
end
function settingsWrapper:getCurrentLevelSelectionPages()
  if localSettings.currentLevelSelectionPages == nil then
    localSettings.currentLevelSelectionPages = {}
  end
  return localSettings.currentLevelSelectionPages
end
function settingsWrapper:getCurrentLevelSelectionPage(episode)
  return settingsWrapper:getCurrentLevelSelectionPages()["pack" .. episode] or 1
end
function settingsWrapper:setCurrentLevelSelectionPage(episode, page)
  settingsWrapper:getCurrentLevelSelectionPages()["pack" .. episode] = page
end
function settingsWrapper:isAudioEnabled()
  if localSettings.audioEnabled == nil then
    localSettings.audioEnabled = true
  end
  return localSettings.audioEnabled
end
function settingsWrapper:toggleAudioEnabled()
  localSettings.audioEnabled = not settingsWrapper:isAudioEnabled()
end
function settingsWrapper:getPlaytime()
  return settingsWrapper:getDeviceSum("playtime")
end
function settingsWrapper:addPlaytime(time)
  settingsWrapper:setLocalAmount("playtime", _G.math.floor(settingsWrapper:getLocalAmount("playtime") + time))
end
function settingsWrapper:getGameStarts()
  return settingsWrapper:getDeviceSum("gameStarts")
end
function settingsWrapper:incrementGameStarts()
  settingsWrapper:setLocalAmount("gameStarts", settingsWrapper:getLocalAmount("gameStarts") + 1)
end
function settingsWrapper:getGameRestarted()
  return settingsWrapper:getDeviceSum("gameRestarted")
end
function settingsWrapper:incrementGameRestarted()
  settingsWrapper:setLocalAmount("gameRestarted", settingsWrapper:getLocalAmount("gameRestarted") + 1)
end
function settingsWrapper:getCutscenes()
  if settings.cutscenesWatched == nil then
    settings.cutscenesWatched = {}
  end
  return settings.cutscenesWatched
end
function settingsWrapper:canSkipCutscene(cutscene)
  return settingsWrapper:getCutscenes()[cutscene] == true
end
function settingsWrapper:setCutsceneWatched(cutscene)
  settingsWrapper:getCutscenes()[cutscene] = true
end
function settingsWrapper:isFirstTimeUseLocation()
  if settings.firstTimeUseLocation == nil then
    return true
  else
    return settings.firstTimeUseLocation
  end
end
function settingsWrapper:setLocationUsed()
  settings.firstTimeUseLocation = false
end
function settingsWrapper:getNFCMeUnlocked()
  return localSettings.NFCMeUnlock or false
end
function settingsWrapper:setNFCMeUnlocked(value)
  localSettings.NFCMeUnlock = value
end
function settingsWrapper:getNFCUnlockTimer()
  return localSettings.NFCUnlockTimer or false
end
function settingsWrapper:setNFCUnlockTimer(time)
  localSettings.NFCUnlockTimer = time
end
function settingsWrapper:getAchievementStatusList()
  if settings.achievementStatus == nil then
    settings.achievementStatus = {}
  end
  return settings.achievementStatus
end
function settingsWrapper:getAchievementStatus(achievement)
  local status = settingsWrapper:getAchievementStatusList()
  local valid_achievement = false
  for k, v in _G.pairs(g_achievements) do
    if k == achievement then
      valid_achievement = true
      break
    end
  end
  if not valid_achievement then
    print("invalid achievement id " .. _G.tostring(achievement) .. "\n")
    return false
  end
  if not status[achievement] then
    status[achievement] = {unlocked = false}
  end
  return status[achievement]
end
function settingsWrapper:isAchievementAlreadyUnlocked(achievement)
  local status = settingsWrapper:getAchievementStatus(achievement)
  if not status then
    return false
  end
  return status.unlocked
end
function settingsWrapper:markAchievementUnlocked(achievement)
  local status = settingsWrapper:getAchievementStatus(achievement)
  if not status then
    return
  end
  status.unlocked = true
end
function settingsWrapper:isNookUserAlreadyConnected()
  return localSettings.nookUserAlreadyConnected or false
end
function settingsWrapper:setNookUserAlreadyConnected()
  localSettings.nookUserAlreadyConnected = true
end
function settingsWrapper:getLicense()
  if settings.license == nil then
    settings.license = {}
  end
  return settings.license
end
function settingsWrapper:getKeyTypes()
  local license = settingsWrapper:getLicense()
  if license.registeredKeyTypes == nil then
    license.registeredKeyTypes = {}
  end
  return license.registeredKeyTypes
end
function settingsWrapper:getHardwareID()
  return settingsWrapper:getLicense().hardwareID or ""
end
function settingsWrapper:setHardwareID(id)
  settingsWrapper:getLicense().hardwareID = id
end
function settingsWrapper:isKeyRegistered(key_type)
  for _, v in _G.ipairs(settingsWrapper:getKeyTypes()) do
    if v == key_type then
      return true
    end
  end
  return false
end
function settingsWrapper:addRegisteredKey(key_type)
  _G.table.insert(settingsWrapper:getKeyTypes(), key_type)
end
function settingsWrapper:getFullscreen()
  if settings.fullscreen == nil then
    settings.fullscreen = true
  end
  return settings.fullscreen
end
function settingsWrapper:setFullscreen(fs)
  settings.fullscreen = fs
end
function settingsWrapper:getResolution()
  return settings.screenWidth or 1024, settings.screenHeight or 600
end
function settingsWrapper:setResolution(width, height)
  settings.screenWidth = width
  settings.screenHeight = height
end
function settingsWrapper:getInventory()
  if settings.inventory == nil then
    settings.inventory = {}
  end
  return settings.inventory
end
function settingsWrapper:getLocalInventory()
  if settingsWrapper:getInventory()[localDevice] == nil then
    settingsWrapper:getInventory()[localDevice] = {}
  end
  return settingsWrapper:getInventory()[localDevice]
end
function settingsWrapper:getItem(item)
  if settingsWrapper:getLocalInventory()[item] == nil then
    settingsWrapper:getLocalInventory()[item] = {totalCount = 0, usedCount = 0}
  end
  return settingsWrapper:getLocalInventory()[item]
end
function settingsWrapper:getItemAmount(item)
  return settingsWrapper:getCloudPowerupAmount(item) + settingsWrapper:getItem(item).totalCount - settingsWrapper:getItem(item).usedCount
end
function settingsWrapper:getCloudPowerupAmount(item)
  local totalAmount = 0
  for device_id, powerups in _G.pairs(settingsWrapper:getInventory()) do
    if device_id ~= localDevice and powerups[item] then
      totalAmount = totalAmount + powerups[item].totalCount - powerups[item].usedCount
    end
  end
  return totalAmount
end
function settingsWrapper:setItemAmount(item, total, used)
  settingsWrapper:getItem(item).totalCount = total
  settingsWrapper:getItem(item).usedCount = used
end
function settingsWrapper:consumeItem(item)
  settingsWrapper:getItem(item).usedCount = settingsWrapper:getItem(item).usedCount + 1
end
function settingsWrapper:addItems(item, amount)
  settingsWrapper:getItem(item).totalCount = settingsWrapper:getItem(item).totalCount + amount
end
function settingsWrapper:getOneTimeRewards()
  if settings.oneTimeRewards == nil then
    settings.oneTimeRewards = {}
  end
  return settings.oneTimeRewards
end
function settingsWrapper:isRewardCollected(id)
  if settingsWrapper:getOneTimeRewards()[id] == true then
    return true
  end
  return false
end
function settingsWrapper:setRewardCollected(id)
  settingsWrapper:getOneTimeRewards()[id] = true
end
function settingsWrapper:getMainMenuAdLastCheckedTime()
  if settings.mainMenuAdLastChecked == nil then
    settings.mainMenuAdLastChecked = {
      year = 2000,
      month = 1,
      day = 1,
      hour = 0,
      minutes = 0,
      seconds = 0
    }
  end
  return settings.mainMenuAdLastChecked
end
function settingsWrapper:setMainMenuAdLastCheckedTime(t)
  settings.mainMenuAdLastChecked = t
end
function settingsWrapper:getMainMenuAdTimeStamp()
  if settings.mainMenuAdTimeStamp == nil then
    settings.mainMenuAdTimeStamp = ""
  end
  return settings.mainMenuAdTimeStamp
end
function settingsWrapper:setMainMenuAdTimeStamp(s)
  settings.mainMenuAdTimeStamp = _G.tostring(s)
end
function settingsWrapper:updateSyncInfoCount()
  settings.syncInfoShown = (settings.syncInfoShown or 0) + 1
end
function settingsWrapper:getSyncInfoCount()
  return settings.syncInfoShown
end
function settingsWrapper:setPlayerRegistered()
  settings.playerRegistered = true
end
function settingsWrapper:hasPlayerRegistered()
  return settings.playerRegistered or false
end
function settingsWrapper:setInstalledApps(apps, ttl, checkTime, possibleAppsList)
  settings.installedApps = apps
  if ttl then
    settings.installedAppsTTL = ttl
  end
  if checkTime then
    settings.installedAppsLastCheck = checkTime
  end
  if possibleAppsList then
    settings.possibleAppsList = possibleAppsList
  end
end
function settingsWrapper:getInstalledAppsTTL()
  return settings.installedAppsTTL or 0
end
function settingsWrapper:getInstalledApps()
  return settings.installedApps or ""
end
function settingsWrapper:getPossibleAppsList()
  return settings.possibleAppsList
end
function settingsWrapper:getInstalledAppsLastCheck()
  if settings.installedAppsLastCheck == nil then
    settings.installedAppsLastCheck = {
      year = 2000,
      month = 1,
      day = 1,
      hour = 0,
      minutes = 0,
      seconds = 0
    }
  end
  return settings.installedAppsLastCheck
end
function settingsWrapper:PRIVATEgetLevelKeys()
  if settings.levelKeys == nil then
    settings.levelKeys = {}
  end
  return settings.levelKeys
end
function settingsWrapper:getLevelKey(level)
  return settingsWrapper:PRIVATEgetLevelKeys()[level] or ""
end
function settingsWrapper:setLevelKey(level, key)
  settingsWrapper:PRIVATEgetLevelKeys()[level] = key
end
function settingsWrapper:setGameCompletedUpsellShown(value)
  settings.gameCompletionUpsellShown = value
end
function settingsWrapper:areAllThemesCompleted()
  for v, k in _G.pairs(g_episodes) do
    for w, j in _G.pairs(k.pages) do
      if j.world_number > 0 and not self:isThemeCompleted(j.world_number) then
        return false
      end
    end
  end
  return true
end
function settingsWrapper:isMagicToSAccepted()
  return localSettings.isMagicToSAccepted or false
end
function settingsWrapper:setMagicToSAccepted()
  localSettings.isMagicToSAccepted = true
end
function settingsWrapper:isMagicPlacesStartedBefore()
  return localSettings.isMagicPlacesStartedBefore or false
end
function settingsWrapper:setMagicPlacesStartedBefore()
  localSettings.isMagicPlacesStartedBefore = true
end
function settingsWrapper:increaseIapPurchaseAmountForDay(day, amount)
  local dailyPurchases = localSettings.iapDailyPurchases or {}
  local dateString = serializeDate(day)
  dailyPurchases[dateString] = (dailyPurchases[dateString] or 0) + amount
  localSettings.iapDailyPurchases = dailyPurchases
end
function settingsWrapper:getIapDailyPurchases()
  local retVal = {}
  local currentDate = getCurrentTime()
  currentDate.minutes = 0
  currentDate.seconds = 0
  currentDate.hour = 0
  if localSettings.iapDailyPurchases then
    for k, v in _G.pairs(localSettings.iapDailyPurchases) do
      local purchaseDate = deserializeDate(k)
      local difference = getTimeDifference(purchaseDate, currentDate)
      if difference.days > g_iap_history_keep_days then
        localSettings.iapDailyPurchases[k] = nil
      else
        retVal[purchaseDate] = v
      end
    end
  end
  return retVal
end
filename = "settingsWrapper.lua"
