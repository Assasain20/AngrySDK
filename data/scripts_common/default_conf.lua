iapInitTimeOut = 20
adRemovalItemId = "com.rovio.angrybirds.removeads"
mightyEagleItemId = "com.clickgamer.angrybirds.mightyeagle2"
if deviceModel == "ipad" then
  mightyEagleItemId = "com.chillingo.angrybirdsipad.mightyeagle"
end
g_isAccelerometerControl = deviceModel == "freebox"
g_restDistance = 2
if deviceModel == "freebox" then
  g_restDistance = 2
end
g_disableDragPanning = g_isAccelerometerControl
g_deltaBasedSlingshot = g_isAccelerometerControl
g_slingshotSensitivity = 0.1
g_enableHoverScaling = deviceModel == "windows" or deviceModel == "osx" or deviceModel == "freebox"
g_skipToAngryBirdsSplash = deviceModel == "bada" or deviceModel == "blackberry"
g_layoutMargin = {x = 0, y = 0}
if deviceModel == "freebox" then
  g_rokuCursorVisible = true
end
tapRadius = 15 * screenWidth / 480
g_cutsceneFilm = false
if deviceModel == "windows" or deviceModel == "osx" or deviceModel == "freebox" then
  g_cutsceneFilm = true
end
g_cutsceneDimensions = {width = 1024, height = 657}
g_cutscene_asset_scale = 1
g_hud_class_name = {"ui", "GameHud"}
g_level_complete_class_name = {
  "LevelComplete"
}
eagleLockedTime = 3600
if cheatsEnabled then
  eagleLockedTime = 60
end
waterMaxBuoyancyDepth = 5
bubbleFrequency = {4, 7}
pigDefenceBoost = 50
bubbleAntiGravity = 1.8
bubbleAntiGravityTime = 2
bubbleAntiGravityFloat = {-3, 3}
antiGravityMaxVelocity = 10
g_streamSounds = false
g_disableAnimatedTutorials = false
g_powerups_enabled = deviceModel == "iphone" or deviceModel == "ipad" or deviceModel == "android"
g_rovio_account_enabled = false
g_allowLowQualityGraphics = deviceModel == "android" and not isHDVersion
g_extra_subsystems = {}
g_splashes = {
  "RovioSplash",
  "AngryBirdsSplash"
}
hideHud = false
showCameraDebugData = false
function eagleScoreElementsEnabled()
  return true
end
function eagleUIElementsEnabled()
  return true
end
filename = "default_conf.lua"
