function isInPlayMode()
  return gamelua.isPhysicsEnabled() and gamelua.currentGameMode == gamelua.updateGame
end
function isRovioNewsShowAllowed()
  return isPauseMenuVisible() and not gamelua.g_tutorialActive and gamelua.showingExpandableAd ~= true
end
function isPauseMenuVisible()
  if gamelua.menuManager ~= nil then
    local scene = gamelua.menuManager:getRoot()
    if scene ~= nil then
      local pausePage = scene:getChild("pausePage")
      if pausePage ~= nil then
        return pausePage.show == true
      end
    end
  end
  return false
end
function isEagleBaitLaunched()
  return gamelua.eagleBaitLaunched
end
function isEagleEnabled()
  return gamelua.isEagleEnabled()
end
function isAndroid()
  return gamelua.deviceModel == "android", gamelua.isHDVersion
end
function isiPad()
  return gamelua.deviceModel == "ipad"
end
function isiOS()
  return gamelua.iOS
end
function isiPhone()
  return gamelua.deviceModel == "iphone"
end
function isiPhone4()
  return gamelua.deviceModel == "iphone4"
end
function isS60()
  return gamelua.deviceModel == "s60"
end
function isLiteVersion()
  return false
end
function getHighscoreAtlevel(levelName)
  return gamelua.highscores[levelName].score
end
function getCurrentLevelNumber()
  _G.assert(not gamelua:isChallengeMode(), "game is in challenge mode")
  local level, episode, world, number = gamelua.getLevelById(gamelua.currentLevel)
  return number
end
function getCurrentWorldNumber()
  _G.assert(not gamelua:isChallengeMode(), "game is in challenge mode")
  local level, episode, world, number = gamelua.getLevelById(gamelua.currentLevel)
  return world
end
function getCurrentEpisodeNumber()
  _G.assert(not gamelua:isChallengeMode(), "game is in challenge mode")
  local level, episode, world, number = gamelua.getLevelById(gamelua.currentLevel)
  return episode
end
function getTotalEpisodes()
  return #gamelua.g_episodes
end
function getTotalWorlds(episode)
  return #gamelua.g_episodes[episode].pages
end
function getTotalLevels(episode, page)
  return #gamelua.g_episodes[episode].pages[page].levels
end
function getLevelData(episode, world, levelNumber)
  local levelName
  if gamelua.g_episodes[episode] ~= nil and gamelua.g_episodes[episode].pages[world] ~= nil and gamelua.g_episodes[episode].pages[world].levels[levelNumber] ~= nil then
    levelName = gamelua.g_episodes[episode].pages[world].levels[levelNumber].name
    if gamelua.highscores[levelName] ~= nil then
      local score = gamelua.highscores[levelName].score or 0
      local stars = 0
      if score >= gamelua.starTable[levelName].goldScore then
        stars = 3
      elseif score >= starTable[levelName].silverScore then
        stars = 2
      else
        stars = 1
      end
      return {
        completed = gamelua.highscores[levelName].completed,
        stars = stars
      }
    end
  end
  return {completed = false, stars = 0}
end
function getAchievements()
  local achievements = {}
  for k, v in _G.pairs(gamelua.g_achievements) do
    local achi = {}
    achi.name = k
    achi.secret = v.secret or false
    achi.unlocked = gamelua.settingsWrapper:isAchievementAlreadyUnlocked(k)
    achi.icon = v.icon
    _G.table.insert(achievements, achi)
  end
  return achievements
end
function getUnlockedAchievements()
  local achievements = {}
  for k, v in _G.pairs(gamelua.g_achievements) do
    if gamelua.settingsWrapper:isAchievementAlreadyUnlocked(k) then
      local achi = {}
      achi.name = k
      achi.icon = v.icon
      _G.table.insert(achievements, achi)
    end
  end
  return achievements
end
function getAchievementIconByName(name)
  local achievement = gamelua.g_achievements[name]
  if achievement ~= nil then
    return achievement.icon or ""
  else
    return ""
  end
end
filename = "subsystemsapi.lua"
