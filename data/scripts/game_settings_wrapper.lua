local latestTheme = "theme31"
local localDevivePrefix = "device_"
local localDevice = localDevivePrefix .. uniqueDeviceId
function settingsWrapper:getCurrentMainMenuTheme()
  return localSettings.currentMainMenuTheme or latestTheme
end
function settingsWrapper:getCurrentEpisode()
  return localSettings.currentEpisode or #g_episodes
end
function settingsWrapper:setCurrentEpisode(episode)
  localSettings.currentEpisode = episode
end
function settingsWrapper:canSkipCutscene(cutscene)
  return true
end
function settingsWrapper:isGoldenEggUnlocked(level)
  return getLevelById(level) and getLevelById(level).always_open or settingsWrapper:getGoldenEgg(level).unlocked
end
blocksDestroyedSettings = {
  pumpkin = "pumpkinsDestroyed",
  presents = "presentsDestroyed",
  chocolate = "chocolateBoxesDestroyed",
  clouds = "cloudsDestroyed",
  money = "moneyDestroyed",
  easteregg = "easterEggDestroyed",
  bunny = "bunniesDestroyed",
  summerFlower = "summerFlowerDestroyed",
  summerPicnic = "summerPicnicDestroyed",
  chineseLantern = "mooncakeLanternsDestroyed",
  bunnyStatue = "mooncakeBunniesDestroyed",
  goldpot = "goldpotsDestroyed",
  skeleton = "bonesDestroyed",
  cookie = "cookiesDestroyed",
  halloweenTNT = "blackPumpkinsDestroyed",
  snowStaticFragile = "snowBlocksDestroyed",
  snow = "snowBlocksDestroyed"
}
function settingsWrapper:getBlocksDestroyed(material)
  return settings[blocksDestroyedSettings[material]] or 0
end
function settingsWrapper:incrementBlocksDestroyed(material)
  if blocksDestroyedSettings[material] ~= nil then
    if settings[blocksDestroyedSettings[material]] == nil then
      settings[blocksDestroyedSettings[material]] = 0
    end
    settings[blocksDestroyedSettings[material]] = settings[blocksDestroyedSettings[material]] + 1
  end
end
function settingsWrapper:setMooncakeSliceAttained(slice)
  if not settings.moonCakeSlices then
    settings.moonCakeSlices = {}
  end
  if not settings.moonCakeSlices[slice] then
    settings.moonCakeSlices[slice] = 1
  end
end
function settingsWrapper:hasMooncakeSlice(slice)
  if not settings.moonCakeSlices then
    settings.moonCakeSlices = {}
  end
  return settings.moonCakeSlices[slice] == 1
end
function settingsWrapper:getMooncakeSliceAmount()
  local slices = 0
  if settings.moonCakeSlices then
    for k, v in _G.pairs(settings.moonCakeSlices) do
      slices = slices + 1
    end
  end
  return slices
end
function settingsWrapper:getNewSeasonVisited()
  return settings.newSeasonVisited
end
function settingsWrapper:setNewSeasonVisited()
  settings.newSeasonVisited = true
end
function settingsWrapper:convertSettings()
  if settingsWrapper:getSettingsVersion().id == 0 then
    if settings.openGoldenEggLevels ~= nil then
      local oldGoldenEggs = settings.openGoldenEggLevels
      settings.openGoldenEggLevels = {}
      local goldenEggLevelMapping = {
        Level16 = "LevelX_GE",
        Level17 = "LevelX_3star",
        Level18 = "LevelGE_12",
        Level19 = "LevelGE_13",
        Level20 = "LevelV_GE",
        Level21 = "LevelV_3star",
        Level22 = "LevelST_GE",
        Level23 = "LevelST_3star",
        Level24 = "LevelE_3star",
        Level25 = "LevelE_GE_1",
        Level26 = "LevelE_GE_2",
        Level27 = "LevelE_GE_3",
        Level28 = "LevelE_GE_4",
        Level29 = "LevelE_GE_5",
        Level30 = "LevelE_GE_6",
        Level31 = "LevelE_GE_7",
        Level32 = "LevelE_GE_8",
        Level33 = "LevelE_GE_9",
        Level34 = "LevelE_GE_10",
        Level35 = "LevelS_3star",
        Level36 = "LevelS_GE",
        Level37 = "LevelS_GE_2",
        Level38 = "LevelMC_GE",
        Level39 = "LevelMC_BONUS",
        Level40 = "LevelH2_GE",
        Level41 = "LevelH2_3star",
        Level42 = "LevelX11_GE",
        Level43 = "LevelX11_3star",
        Level44 = "LevelX11_NewYear",
        Level45 = "LevelYOTD_GE",
        Level46 = "LevelYOTD_3star",
        Level47 = "LevelCH_GE",
        Level48 = "LevelCH_3star",
        Level49 = "LevelPL_GE",
        Level50 = "LevelPL_3star"
      }
      for k, v in _G.pairs(oldGoldenEggs) do
        if _G.type(v) == "number" then
          for i = 16, 50 do
            if k == "Level" .. i then
              local levelName = goldenEggLevelMapping[k]
              local level_entry
              if v == 0 then
                level_entry = {unlocked = true, opened = false}
              elseif v == 1 or v == 2 then
                level_entry = {unlocked = true, opened = true}
              end
              settings.openGoldenEggLevels[levelName] = level_entry
            end
          end
        else
          settings.openGoldenEggLevels[k] = v
        end
      end
      for k, v in _G.pairs(goldenEggLevelMapping) do
        if not settings.openGoldenEggLevels[v] then
          settings.openGoldenEggLevels[v] = {unlocked = false, opened = false}
        end
      end
    end
    local openLevelCheckInfo = {
      {
        pack = "lastOpenLevelLPH",
        episodeId = 1
      },
      {
        pack = "lastOpenLevelLPV",
        episodeId = 3
      },
      {
        pack = "lastOpenLevelLPSP",
        episodeId = 4
      },
      {
        pack = "lastOpenLevelLPEaster",
        episodeId = 5
      },
      {
        pack = "lastOpenLevelLPMooncake",
        episodeId = 7
      },
      {
        pack = "lastOpenLevelLPH2",
        episodeId = 8
      },
      {
        pack = "lastOpenLevelLPYD",
        episodeId = 10
      },
      {
        pack = "lastOpenLevelLPCF",
        episodeId = 11
      },
      {
        pack = "lastOpenLevelLPMOV",
        episodeId = 12
      }
    }
    for k, v in _G.pairs(openLevelCheckInfo) do
      if settings[v.pack] then
        settingsWrapper:setLastOpenLevel(v.episodeId, settings[v.pack])
        settings[v.pack] = nil
      end
    end
    if settings.lastOpenLevel then
      settingsWrapper:setLastOpenLevel(2, settings.lastOpenLevel)
      settings.lastOpenLevel = nil
    end
    if settings.lastOpenLevelLPSummer then
      settingsWrapper:setLastOpenLevel(6, settings.lastOpenLevelLPSummer)
      settings.lastOpenLevelLPSummer = nil
    end
    if settings.lastOpenLevelLPX2 then
      settingsWrapper:setLastOpenLevel(9, settings.lastOpenLevelLPX2)
      settings.lastOpenLevelLPX2 = nil
    end
    settings.eaglesUsedIn = nil
    settings.eagleUsedTime = nil
    local tutorials = {
      {
        name = "BIRD_RED",
        tutorial = "TUTORIAL_1",
        showHelp = false
      },
      {
        name = "BIRD_BLUE",
        tutorial = "TUTORIAL_2",
        showHelp = true
      },
      {
        name = "BIRD_YELLOW",
        tutorial = "TUTORIAL_3",
        showHelp = true
      },
      {
        name = "BIRD_GREY",
        tutorial = "TUTORIAL_4",
        showHelp = true
      },
      {
        name = "BIRD_GREEN",
        tutorial = "TUTORIAL_5",
        showHelp = true
      },
      {
        name = "BIRD_BOOMERANG",
        tutorial = "TUTORIAL_6",
        showHelp = true
      },
      {
        name = "BIRD_BIG_BROTHER",
        tutorial = "TUTORIAL_7",
        showHelp = false
      },
      {
        name = "BAIT_SARDINE",
        tutorial = "TUTORIAL_8",
        showHelp = false
      },
      {
        name = "BIRD_PUFFER_1",
        tutorial = "TUTORIAL_9",
        showHelp = true
      },
      {
        name = "BIRD_PINK",
        tutorial = "TUTORIAL_10",
        showHelp = false
      },
      {
        name = "DRAGON_FISH",
        tutorial = "TUTORIAL_11",
        showHelp = false
      }
    }
    if settings.tutorials then
      for k, v in _G.pairs(tutorials) do
        if settings.tutorials[v.name] then
          settings.tutorials[v.name].sprite = v.tutorial
          if v.showHelp then
            settings.tutorials[v.name].showHelp = v.showHelp
          end
        end
      end
    end
    local completions = {
      {
        old = "theme12Completed",
        new = "theme1Completed"
      },
      {
        old = "theme13Completed",
        new = "theme2Completed"
      },
      {
        old = "theme14Completed",
        new = "theme3Completed"
      },
      {
        old = "gameCompleted",
        new = "theme4Completed"
      },
      {
        old = "valentineCompleted",
        new = "theme5Completed"
      },
      {
        old = "stPatrickCompleted",
        new = "theme6Completed"
      },
      {
        old = "easterCompleted",
        new = "theme7Completed"
      },
      {
        old = "summerCompleted",
        new = "theme8Completed"
      },
      {
        old = "theme6Completed",
        new = "theme9Completed"
      },
      {
        old = "mooncakeCompleted",
        new = "theme10Completed"
      },
      {
        old = "theme8Completed",
        new = "theme11Completed"
      },
      {
        old = "halloween2011Completed",
        new = "theme12Completed"
      },
      {
        old = "xmas2011Completed",
        new = "theme13Completed"
      },
      {
        old = "dragonCompleted",
        new = "theme14Completed"
      },
      {
        old = "cherryCompleted",
        new = "theme15Completed"
      },
      {
        old = "movieCompleted",
        new = "theme17Completed"
      },
      {
        old = "threeStarsLPH",
        new = "threeStarsLP1"
      },
      {
        old = "threeStarsLPX",
        new = "threeStarsLP2"
      },
      {
        old = "threeStarsLPV",
        new = "threeStarsLP3"
      },
      {
        old = "threeStarsLPSP",
        new = "threeStarsLP4"
      },
      {
        old = "threeStarsLPEaster",
        new = "threeStarsLP5"
      },
      {
        old = "threeStarsLPSummer",
        new = "threeStarsLP6"
      },
      {
        old = "threeStarsLPMooncake",
        new = "threeStarsLP7"
      },
      {
        old = "threeStarsLPH2",
        new = "threeStarsLP8"
      },
      {
        old = "threeStarsLPX2",
        new = "threeStarsLP9"
      },
      {
        old = "threeStarsLPYD",
        new = "threeStarsLP10"
      },
      {
        old = "threeStarsLPCF",
        new = "threeStarsLP11"
      },
      {
        old = "threeStarsLPMOV",
        new = "threeStarsLP12"
      }
    }
    for k, v in _G.pairs(completions) do
      if settings[v.old] == true then
        settings[v.new] = true
        settings[v.old] = nil
      end
    end
    settings.currentMainMenuTheme = latestTheme
    settings.currentEpisode = #g_episodes
    settings.selectedEpisode = 1
    local dragonLevels = {
      "LevelD_1",
      "LevelD_2",
      "LevelD_3",
      "LevelD_4",
      "LevelD_5",
      "LevelD_6",
      "LevelD_7",
      "LevelD_8",
      "LevelD_9",
      "LevelD_10",
      "LevelD_11",
      "LevelD_12",
      "LevelD_13",
      "LevelD_14",
      "LevelD_15"
    }
    for k, v in _G.pairs(dragonLevels) do
      if highscores[v] and highscores[v].eagleScore then
        highscores[v].freeEagleUsed = true
      end
    end
    local newInventory = {}
    newInventory[localDevice] = {}
    for k, v in _G.pairs(settingsWrapper:getInventory()) do
      newInventory[localDevice][k] = {totalCount = v, usedCount = 0}
    end
    settings.inventory = newInventory
    addDeviceId()
    settings.settingsVersion = {id = 4, version = "3.1"}
    settings.gameCompletionUpsellShown = false
    if ABIDEnabled then
      ABIDUtils.convertSettings()
    end
  elseif settingsWrapper:getSettingsVersion().id < 4 then
    local dragonLevels = {
      "LevelD_1",
      "LevelD_2",
      "LevelD_3",
      "LevelD_4",
      "LevelD_5",
      "LevelD_6",
      "LevelD_7",
      "LevelD_8",
      "LevelD_9",
      "LevelD_10",
      "LevelD_11",
      "LevelD_12",
      "LevelD_13",
      "LevelD_14",
      "LevelD_15"
    }
    for k, v in _G.pairs(dragonLevels) do
      if highscores[v] and highscores[v].eagleScore then
        highscores[v].freeEagleUsed = true
      end
    end
    local newInventory = {}
    newInventory[localDevice] = {}
    for k, v in _G.pairs(settingsWrapper:getInventory()) do
      newInventory[localDevice][k] = {totalCount = v, usedCount = 0}
    end
    settings.inventory = newInventory
    addDeviceId()
    settings.currentMainMenuTheme = latestTheme
    settings.currentEpisode = #g_episodes
    settings.selectedEpisode = 1
    settings.settingsVersion = {id = 4, version = "3.1"}
    settings.gameCompletionUpsellShown = false
  end
end
function addDeviceId()
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
    local shouldConvert = true
    if _G.type(settings[v]) == "table" then
      for k, _ in _G.pairs(settings[v]) do
        if StringStartsWith(k, localDevivePrefix) then
          shouldConvert = false
        end
      end
    end
    if shouldConvert then
      local newValue = {}
      newValue[localDevice] = deepCopy(settings[v])
      settings[v] = newValue
    end
  end
end
filename = "game_settings_wrapper.lua"
