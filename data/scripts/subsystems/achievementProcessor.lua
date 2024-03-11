AchievementProcessor = SubSystem:inherit()
function AchievementProcessor:init()
  self.achievementUnlockQueue = {}
  self.achievementRenderQueue = {}
  local isCheatsBuild = gamelua.cheatsEnabled == true and gamelua.releaseBuild == true
  self.featherGathererLimit = 120
  self.featherCollectorLimit = 60
  self.featherPickerLimit = 30
  self.blockSmasherLimit = 10000
  self.smashManiacLimit = 50000
  self.woodPeckerLimit = 1000
  self.icePickerLimit = 1000
  self.stoneCutterLimit = 1000
  self.pigPopperLimit = 300
  self.starCollectorLimit = 750
  self.starGathererLimit = 1500
  self.birdSlingerLimit = 1000
  self.eggCrackerLimit = 10
  self.eggHunterLimit = 10
  self.pumpkinSmasherLimit = 500
  self.unwrapperLimit = 300
  self.grinchLimit = 1000
  self.chocolateLoverLimit = 300
  self.cloudBusterLimit = 1500
  self.pennywiseLimit = 300
  self.eggManLimit = 300
  self.bunnyHunterLimit = 300
  self.oopsADaisyLimit = 300
  self.picnicPooperLimit = 300
  self.shutTheLightsLimit = 300
  self.bunnyHopperLimit = 300
  self.leprechaunsSecretLimit = 300
  self.lovelyBonesLimit = 300
  self.cookieCrumblerLimit = 300
  self.blackIsTheNewBlackLimit = 300
  self.snowPlowerLimit = 1500
  if isCheatsBuild then
    self.featherGathererLimit = 3
    self.featherCollectorLimit = 2
    self.featherPickerLimit = 1
    self.blockSmasherLimit = 5
    self.smashManiacLimit = 5
    self.woodPeckerLimit = 5
    self.icePickerLimit = 5
    self.stoneCutterLimit = 5
    self.pigPopperLimit = 5
    self.starCollectorLimit = 5
    self.starGathererLimit = 10
    self.birdSlingerLimit = 5
    self.eggCrackerLimit = 1
    self.eggHunterLimit = 1
    self.pumpkinSmasherLimit = 5
    self.unwrapperLimit = 5
    self.grinchLimit = 10
    self.chocolateLoverLimit = 5
    self.cloudBusterLimit = 5
    self.pennywiseLimit = 5
    self.eggManLimit = 5
    self.bunnyHunterLimit = 5
    self.oopsADaisyLimit = 5
    self.picnicPooperLimit = 5
    self.shutTheLightsLimit = 5
    self.bunnyHopperLimit = 5
    self.leprechaunsSecretLimit = 5
    self.lovelyBonesLimit = 5
    self.cookieCrumblerLimit = 5
    self.blackIsTheNewBlackLimit = 5
    self.snowPlowerLimit = 10
  end
end
function AchievementProcessor:update(dt)
end
function AchievementProcessor:updateDestroyedBlocksPerProject(v)
  settingsWrapper = gamelua.settingsWrapper
  if not eagleBaitLaunched then
    settingsWrapper:incrementBlocksDestroyed(v.materialName)
  end
  return {
    pumpkinsDestroyed = settingsWrapper:getBlocksDestroyed("pumpkin"),
    presentsDestroyed = settingsWrapper:getBlocksDestroyed("presents"),
    chocolateBoxesDestroyed = settingsWrapper:getBlocksDestroyed("chocolate"),
    cloudsDestroyed = settingsWrapper:getBlocksDestroyed("clouds"),
    moneyPilesDestroyed = settingsWrapper:getBlocksDestroyed("money"),
    easterEggsDestroyed = settingsWrapper:getBlocksDestroyed("easteregg"),
    bunnyEarsDestroyed = settingsWrapper:getBlocksDestroyed("bunny"),
    flowersDestroyed = settingsWrapper:getBlocksDestroyed("summerFlower"),
    picnicItemsDestroyed = settingsWrapper:getBlocksDestroyed("summerPicnic"),
    lanternsDestroyed = settingsWrapper:getBlocksDestroyed("chineseLantern"),
    bunniesDestroyed = settingsWrapper:getBlocksDestroyed("bunnyStatue"),
    goldPotsDestroyed = settingsWrapper:getBlocksDestroyed("goldpot"),
    bonesDestroyed = settingsWrapper:getBlocksDestroyed("skeleton"),
    cookiesDestroyed = settingsWrapper:getBlocksDestroyed("cookie"),
    blackPumpkinsDestroyed = settingsWrapper:getBlocksDestroyed("halloweenTNT"),
    snowBlocksDestroyed = settingsWrapper:getBlocksDestroyed("snow")
  }
end
function AchievementProcessor:eventTriggered(event)
  local settingsWrapper = gamelua.settingsWrapper
  if event.id == gamelua.events.EID_GOLDEN_EGG_GAINED then
    if event.data.openedLevelsAmount == self.eggHunterLimit then
      self:addToAchievementUnlockQueue("Egg Hunter")
    end
  elseif event.id == gamelua.events.EID_GOLDEN_EGG_STAR_GAINED then
    if event.data.starsGained == self.eggCrackerLimit then
      self:addToAchievementUnlockQueue("Egg Cracker")
    end
  elseif event.id == gamelua.events.EID_MIGHTY_EAGLE_PURCHASED then
    self:addToAchievementUnlockQueue("Aquiline Benefactor")
  elseif event.id == gamelua.events.EID_TUTORIAL_WATCHED then
    if settingsWrapper:getTutorialsForItem("BAIT_SARDINE") then
      self:addToAchievementUnlockQueue("Aquiline Benefactor")
    end
    if settingsWrapper:getTutorialsForItem("BIRD_PUFFER_1") then
      self:addToAchievementUnlockQueue("All Around the Globe")
    end
  elseif event.id == gamelua.events.EID_LEVEL_COMPLETED then
    if event.cumulativeStars >= self.starCollectorLimit and event.cumulativeStars < self.starGathererLimit then
      self:addToAchievementUnlockQueue("Star Collector", true)
    end
    if event.cumulativeStars >= self.starGathererLimit then
      self:addToAchievementUnlockQueue("Star Gatherer", true)
    end
    if event.stars >= event.totalStars then
      self:addToAchievementUnlockQueue(gamelua.g_episodes[event.themeNumber].name .. " - Total Destruction")
    end
    if event.scoreAchievementLimit and event.totalScore >= event.scoreAchievementLimit then
      self:addToAchievementUnlockQueue(gamelua.g_episodes[event.themeNumber].name .. " - Score Addict")
    end
    if event.feathers >= self.featherGathererLimit then
      self:addToAchievementUnlockQueue("Feather Gatherer")
    end
    if event.feathers >= self.featherCollectorLimit then
      self:addToAchievementUnlockQueue("Feather Collector")
    end
    if event.feathers >= self.featherPickerLimit then
      self:addToAchievementUnlockQueue("Feather Picker")
    end
  elseif event.id == gamelua.events.EID_WORLD_COMPLETED then
    if event.firstTime == true and event.clearAchievement ~= nil then
      self:addToAchievementUnlockQueue(event.clearAchievement)
    end
  elseif event.id == gamelua.events.EID_BLOCKS_DESTROYED then
    if event.totalBlocks == self.blockSmasherLimit then
      self:addToAchievementUnlockQueue("Block Smasher", true)
    else
    end
    if event.totalBlocks == self.smashManiacLimit then
      self:addToAchievementUnlockQueue("Smash Maniac", true)
    else
    end
    if event.pigsDestroyed == self.pigPopperLimit then
      self:addToAchievementUnlockQueue("Pig Popper", true)
    end
    if event.rockBlocksDestroyed == self.stoneCutterLimit then
      self:addToAchievementUnlockQueue("Stone Cutter", true)
    end
    if event.iceBlocksDestroyed == self.icePickerLimit then
      self:addToAchievementUnlockQueue("Ice Picker", true)
    end
    if event.woodBlocksDestroyed == self.woodPeckerLimit then
      self:addToAchievementUnlockQueue("Woodpecker", true)
    end
    if event.presentsDestroyed == self.unwrapperLimit then
      self:addToAchievementUnlockQueue("Unwrapper", true)
    end
    if event.presentsDestroyed == self.grinchLimit then
      self:addToAchievementUnlockQueue("The Grinch", true)
    end
    if event.lanternsDestroyed == self.shutTheLightsLimit then
      self:addToAchievementUnlockQueue("Shut the Lights!", true)
    end
    if event.chocolateBoxesDestroyed == self.chocolateLoverLimit then
      self:addToAchievementUnlockQueue("Chocolate Lover", true)
    end
    if event.cloudsDestroyed == self.cloudBusterLimit then
      self:addToAchievementUnlockQueue("Cloud Buster", true)
    end
    if event.moneyPilesDestroyed == self.pennywiseLimit then
      self:addToAchievementUnlockQueue("Pennywise", true)
    end
    if event.easterEggsDestroyed == self.eggManLimit then
      self:addToAchievementUnlockQueue("The Egg Man", true)
    end
    if event.bunnyEarsDestroyed == self.bunnyHunterLimit then
      self:addToAchievementUnlockQueue("Bunny Hunter", true)
    end
    if event.flowersDestroyed == self.oopsADaisyLimit then
      self:addToAchievementUnlockQueue("Oops a Daisy", true)
    end
    if event.picnicItemsDestroyed == self.picnicPooperLimit then
      self:addToAchievementUnlockQueue("Picnic Pooper", true)
    end
    if event.lanternsDestroyed == self.shutTheLightsLimit then
      self:addToAchievementUnlockQueue("Shut the Lights!", true)
    end
    if event.bunniesDestroyed == self.bunnyHopperLimit then
      self:addToAchievementUnlockQueue("Bunny Hopper", true)
    end
    if event.goldPotsDestroyed == self.leprechaunsSecretLimit then
      self:addToAchievementUnlockQueue("Leprechaun's Secret", true)
    end
    if event.bonesDestroyed == self.lovelyBonesLimit then
      self:addToAchievementUnlockQueue("Lovely Bones", true)
    end
    if event.cookiesDestroyed == self.cookieCrumblerLimit then
      self:addToAchievementUnlockQueue("Cookie Crumbler", true)
    end
    if event.blackPumpkinsDestroyed == self.blackIsTheNewBlackLimit then
      self:addToAchievementUnlockQueue("Black is the New Black", true)
    end
    if event.snowBlocksDestroyed == self.snowPlowerLimit then
      self:addToAchievementUnlockQueue("Snowplower", true)
    end
  elseif event.id == gamelua.events.EID_BIRD_SHOT then
    if event.birdsShooted == self.birdSlingerLimit then
      self:addToAchievementUnlockQueue("Bird Slinger", true)
    end
    if event.backwardsBirdCount == 10 then
      self:addToAchievementUnlockQueue("Backward Compatibility", true)
    end
  end
end
function AchievementProcessor:unlockNextAchievement()
  gamelua.unlockAchievement(self.achievementUnlockQueue[1].id, self.achievementUnlockQueue[1].desc)
  _G.table.remove(self.achievementUnlockQueue, 1)
end
function AchievementProcessor:addToAchievementUnlockQueue(desc, inFront)
  _G.assert(desc ~= nil)
  local first_time = not gamelua.settingsWrapper:isAchievementAlreadyUnlocked(desc)
  gamelua.eventManager:notify({
    id = gamelua.events.EID_ACHIEVEMENT_UNLOCKED,
    name = desc,
    first_time_unlocked = first_time
  })
  if first_time then
    gamelua.settingsWrapper:markAchievementUnlocked(desc)
    gamelua.saveLuaFileWrapper("settings.lua", "settings", true)
  end
  gamelua.print("<achievement> Added achievement '" .. desc .. "' to unlock queue\n")
  if gamelua.achievements ~= nil and gamelua.achievements[desc] ~= nil then
    local id = gamelua.achievements[desc].id
    for i = 1, #self.achievementUnlockQueue do
      if self.achievementUnlockQueue[i].id == id then
        return
      end
    end
    inFront = inFront or false
    if inFront then
      _G.table.insert(self.achievementUnlockQueue, 1, {id = id, desc = desc})
    else
      _G.table.insert(self.achievementUnlockQueue, {id = id, desc = desc})
    end
  end
end
function AchievementProcessor:checkForAchievements()
  local settings = gamelua.settings
  local settingsWrapper = gamelua.settingsWrapper
  local g_episodes = gamelua.g_episodes
  local totalBlocks = 0
  totalBlocks = totalBlocks + settingsWrapper:getWoodBlocksDestroyed()
  totalBlocks = totalBlocks + settingsWrapper:getIceBlocksDestroyed()
  totalBlocks = totalBlocks + settingsWrapper:getRockBlocksDestroyed()
  for i = 1, #g_episodes do
    for j = 1, #g_episodes[i].pages do
      if g_episodes[i].pages[j].clear_achievement and settingsWrapper:isThemeCompleted(g_episodes[i].pages[j].world_number) and g_episodes[i].pages[j].clear_achievement then
        self:addToAchievementUnlockQueue(g_episodes[i].pages[j].clear_achievement)
      end
    end
    if g_episodes[i].score_achievement_limit then
      local stars, total_stars = gamelua.calculateEpisodeStars(i)
      if total_stars <= stars then
        self:addToAchievementUnlockQueue(g_episodes[i].name .. " - Total Destruction")
      end
      local total_score = gamelua.calculateEpisodeScore(i)
      if g_episodes[i].score_achievement_limit and total_score >= g_episodes[i].score_achievement_limit then
        self:addToAchievementUnlockQueue(g_episodes[i].name .. " - Score Addict")
      end
    end
  end
  local feathers, maxFeathers = gamelua.calculateAllFeathers()
  if feathers >= self.featherGathererLimit then
    self:addToAchievementUnlockQueue("Feather Gatherer")
  end
  if feathers >= self.featherCollectorLimit then
    self:addToAchievementUnlockQueue("Feather Collector")
  end
  if feathers >= self.featherPickerLimit then
    self:addToAchievementUnlockQueue("Feather Picker")
  end
  if settingsWrapper:getTutorialsForItem("BAIT_SARDINE") ~= nil then
    self:addToAchievementUnlockQueue("Aquiline Benefactor")
  end
  if settingsWrapper:getBackwardsBirdCount() >= 10 then
    self:addToAchievementUnlockQueue("Backward Compatibility", true)
  end
  if totalBlocks >= self.blockSmasherLimit then
    self:addToAchievementUnlockQueue("Block Smasher", true)
  end
  if totalBlocks >= self.smashManiacLimit then
    self:addToAchievementUnlockQueue("Smash Maniac", true)
  end
  if settingsWrapper:getWoodBlocksDestroyed() >= self.woodPeckerLimit then
    self:addToAchievementUnlockQueue("Woodpecker", true)
  end
  if settingsWrapper:getIceBlocksDestroyed() >= self.icePickerLimit then
    self:addToAchievementUnlockQueue("Ice Picker", true)
  end
  if settingsWrapper:getRockBlocksDestroyed() >= self.stoneCutterLimit then
    self:addToAchievementUnlockQueue("Stone Cutter", true)
  end
  if settingsWrapper:getPigsDestroyed() >= self.pigPopperLimit then
    self:addToAchievementUnlockQueue("Pig Popper", true)
  end
  if gamelua.calculateOpenGoldenEggLevels() >= self.eggHunterLimit then
    self:addToAchievementUnlockQueue("Egg Hunter")
  end
  if gamelua.calculateStarsFromGoldenEggLevels() >= self.eggCrackerLimit then
    self:addToAchievementUnlockQueue("Egg Cracker")
  end
  if settings.cumulativeStars ~= nil and settings.cumulativeStars >= self.starCollectorLimit then
    self:addToAchievementUnlockQueue("Star Collector", true)
  end
  if settings.cumulativeStars ~= nil and settings.cumulativeStars >= self.starGathererLimit then
    self:addToAchievementUnlockQueue("Star Gatherer", true)
  end
  if settingsWrapper:getBirdsShot() >= self.birdSlingerLimit then
    self:addToAchievementUnlockQueue("Bird Slinger", true)
  end
  if settingsWrapper:getBlocksDestroyed("pumpkin") >= self.pumpkinSmasherLimit then
    self:addToAchievementUnlockQueue("Pumpkin Smasher", true)
  end
  if settingsWrapper:getBlocksDestroyed("presents") >= self.unwrapperLimit then
    self:addToAchievementUnlockQueue("Unwrapper", true)
  end
  if settingsWrapper:getBlocksDestroyed("presents") >= self.grinchLimit then
    self:addToAchievementUnlockQueue("The Grinch", true)
  end
  if settingsWrapper:getBlocksDestroyed("chocolate") >= self.chocolateLoverLimit then
    self:addToAchievementUnlockQueue("Chocolate Lover", true)
  end
  if settingsWrapper:getBlocksDestroyed("clouds") >= self.cloudBusterLimit then
    self:addToAchievementUnlockQueue("Cloud Buster", true)
  end
  if settingsWrapper:getBlocksDestroyed("money") >= self.pennywiseLimit then
    self:addToAchievementUnlockQueue("Pennywise", true)
  end
  if settingsWrapper:getBlocksDestroyed("easteregg") >= self.eggManLimit then
    self:addToAchievementUnlockQueue("The Egg Man", true)
  end
  if settingsWrapper:getBlocksDestroyed("bunny") >= self.bunnyHunterLimit then
    self:addToAchievementUnlockQueue("Bunny Hunter", true)
  end
  if settingsWrapper:getBlocksDestroyed("summerFlower") >= self.oopsADaisyLimit then
    self:addToAchievementUnlockQueue("Oops a Daisy", true)
  end
  if settingsWrapper:getBlocksDestroyed("summerPicnic") >= self.picnicPooperLimit then
    self:addToAchievementUnlockQueue("Picnic Pooper", true)
  end
  if settingsWrapper:getBlocksDestroyed("chineseLantern") >= self.shutTheLightsLimit then
    self:addToAchievementUnlockQueue("Shut the Lights!", true)
  end
  if settingsWrapper:getBlocksDestroyed("bunnyStatue") >= self.bunnyHopperLimit then
    self:addToAchievementUnlockQueue("Bunny Hopper", true)
  end
  if settingsWrapper:getBlocksDestroyed("goldpot") >= self.leprechaunsSecretLimit then
    self:addToAchievementUnlockQueue("Leprechaun's Secret", true)
  end
  if settingsWrapper:getBlocksDestroyed("skeleton") >= self.lovelyBonesLimit then
    self:addToAchievementUnlockQueue("Lovely Bones", true)
  end
  if settingsWrapper:getBlocksDestroyed("cookie") >= self.cookieCrumblerLimit then
    self:addToAchievementUnlockQueue("Cookie Crumbler", true)
  end
  if settingsWrapper:getBlocksDestroyed("halloweenTNT") >= self.blackIsTheNewBlackLimit then
    self:addToAchievementUnlockQueue("Black is the New Black", true)
  end
  if settingsWrapper:getBlocksDestroyed("snow") >= self.snowPlowerLimit then
    self:addToAchievementUnlockQueue("Snowplower", true)
  end
end
function AchievementProcessor:addToAchievementRenderQueue(popupId)
  if gamelua.gameCenter.achievements[popupId] then
    _G.table.insert(self.achievementRenderQueue, popupId)
  end
end
function AchievementProcessor:renderNextAchievementPopup()
  local popup_id = self.achievementRenderQueue[1]
  local achievementBox = gamelua.AchievementPopup:new(popup_id)
  achievementBox.name = "achievement"
  gamelua.notificationsFrame:addChild(achievementBox)
  achievementBox:onEntry()
  achievementBox:layout()
  if gamelua.currentGameMode == gamelua.updateGame then
    gamelua.setPhysicsEnabled(true)
  end
  _G.table.remove(self.achievementRenderQueue, 1)
  if gamelua.achievementPopupDebug and #self.achievementRenderQueue == 0 then
    gamelua.gameCenter = nil
    gamelua.gameCenterEnabled = false
    gamelua.achievementPopupDebug = false
  end
end
filename = "achievementProcessor.lua"
