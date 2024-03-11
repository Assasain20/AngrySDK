g_cutsceneFilm = false
g_episodesBackwards = true
g_white_bird_tutorial_ge_disabled = true
g_powerups_enabled = false
mightyEagleItemId = "com.rovio.angrybirdsseasons.mightyeagle2"
if deviceModel == "ipad" then
  mightyEagleItemId = "com.rovio.angrybirdsseasonshd.mightyeagle2"
end
g_allowLowQualityGraphics = false
g_ABsync_enabled = false
g_allowGameCompletionUpsellPopup = deviceModel == "iphone" or deviceModel == "ipad"
function eagleScoreElementsEnabled()
  return deviceModel == "iphone" or deviceModel == "ipad" or deviceModel == "android" and g_episodes[currentEpisode].mightyPower and g_episodes[currentEpisode].mightyPower.availableOnAndroid
end
function eagleUIElementsEnabled()
  return eagleScoreElementsEnabled()
end
function getPlayButtonSprite()
  local play_sprite = blockTable.themes[settingsWrapper:getCurrentMainMenuTheme()].playButtonSprite
  if _G.type(play_sprite) == "table" then
    play_sprite = _G.res.getString(play_sprite.group, play_sprite.id)
  end
  return play_sprite
end
filename = "game_conf.lua"
