g_level_scripts = {}
local removeObjectAndJoints = function(item)
  loadedObjects.world[item] = nil
  for k, v in _G.pairs(loadedObjects.joints) do
    if v.end1 == item or v.end2 == item then
      loadedObjects.joints[k] = nil
    end
  end
end
function goldenMooncakeAchieved(slice)
  if not settingsWrapper:hasMooncakeSlice(slice) then
    settingsWrapper:setMooncakeSliceAttained(slice)
    if settingsWrapper:getMooncakeSliceAmount() >= 8 then
      settingsWrapper:unlockGoldenEgg("LevelMC_GE")
      highscores.LevelMC_GE = {
        completed = false,
        birds = 0,
        score = 0,
        lowScore = 0
      }
    end
    saveLuaFileWrapper("highscores.lua", "highscores", true)
    saveLuaFileWrapper("settings.lua", "settings", true)
    if useDynamicAssets then
      dynamic.load({
        "mooncakePopup"
      })
    end
    showRewardPopup("GENERIC_REWARD", {
      sprite = "GOLD_MOONCAKE_PIECE_8",
      sound = "goldenegg"
    })
    eventManager:notify({
      id = events.EID_GOLDEN_EGG_GAINED,
      data = {
        openedLevelsAmount = calculateOpenGoldenEggLevels()
      }
    })
  end
end
g_level_scripts.LevelP1_634 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelX_GE") then
      removeObjectAndJoints("ExtraXmasBall02_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraXmasBall02_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelX_GE")
    end
  end
}
g_level_scripts.LevelP5_380 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelGE_13") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelGE_13")
    end
  end
}
g_level_scripts.LevelV_2 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelV_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelV_GE")
    end
  end
}
g_level_scripts.LevelSt_10 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelST_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_3")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_3" and not eagleBaitLaunched then
      goldenEggAchieved("LevelST_GE")
    end
  end
}
g_level_scripts.LevelE_7 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_1") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_1")
    end
  end
}
g_level_scripts.LevelE_3 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_2") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_2")
    end
  end
}
g_level_scripts.LevelE_4 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_3") then
      removeObjectAndJoints("ExtraGoldenEgg_2")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_2" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_3")
    end
  end
}
g_level_scripts.LevelE_6 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_4") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_4")
    end
  end
}
g_level_scripts.LevelE_12 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_5") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_5")
    end
  end
}
g_level_scripts.LevelE_1 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_6") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_6")
    end
  end
}
g_level_scripts.LevelE_9 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_7") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_7")
    end
  end
}
g_level_scripts.LevelE_16 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_8") then
      removeObjectAndJoints("ExtraGoldenEgg_2")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_2" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_8")
    end
  end
}
g_level_scripts.LevelE_15 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_9") then
      removeObjectAndJoints("ExtraGoldenEgg_4")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_4" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_9")
    end
  end
}
g_level_scripts.LevelE_17 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelE_GE_10") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelE_GE_10")
    end
  end
}
g_level_scripts.Level445 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelS_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelS_GE")
    end
  end
}
g_level_scripts.Level449 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelS_GE_2") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelS_GE_2")
    end
  end
}
g_level_scripts.LevelMC_462 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice1") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice1")
    end
  end
}
g_level_scripts.LevelMC_537 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice2") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice2")
    end
  end
}
g_level_scripts.LevelMC_541 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice3") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice3")
    end
  end
}
g_level_scripts.LevelMC_450 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice4") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice4")
    end
  end
}
g_level_scripts.LevelMC_453 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice5") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice5")
    end
  end
}
g_level_scripts.LevelMC_534 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice6") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice6")
    end
  end
}
g_level_scripts.LevelMC_531 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice7") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice7")
    end
  end
}
g_level_scripts.LevelMC_456 = {
  onLoadLevel = function()
    if settingsWrapper:hasMooncakeSlice("Slice8") then
      removeObjectAndJoints("GoldenMoonCake_1_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "GoldenMoonCake_1_1" and not eagleBaitLaunched then
      goldenMooncakeAchieved("Slice8")
    end
  end
}
g_level_scripts.LevelH558 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelH2_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelH2_GE")
    end
  end
}
g_level_scripts.LevelX11_647 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelX11_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelX11_GE")
    end
  end
}
g_level_scripts.LevelD_15 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelYOTD_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_3")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_3" and not eagleBaitLaunched then
      goldenEggAchieved("LevelYOTD_GE")
    end
  end,
  onUpdate = function(dt, time)
    if not g_nextDragonLevelFireworksBoom or time >= g_nextDragonLevelFireworksBoom then
      local weatherX = -1000
      local weatherY = -2000
      local weatherW = 3039.53
      local weatherH = 150
      local burstAmount = 400
      local posX = _G.math.floor(weatherX + _G.math.random(weatherW))
      local posY = _G.math.floor(weatherY + _G.math.random(weatherH))
      _G.particles.addLevelParticles("fireworksWeather", burstAmount, posX, posY, 0, 0, 0, false)
      playAudio(getAudioName("fireworks"), 1, false)
      if _G.math.random(10) < 5 then
        g_nextDragonLevelFireworksBoom = time + 3 - _G.math.random(4, 7) * 0.1
      else
        g_nextDragonLevelFireworksBoom = time + _G.math.random() * 0.25 * 3
      end
    end
  end
}
g_level_scripts.LevelD_1 = {
  onUpdate = function(dt, time)
    if not g_nextDragonLevelFireworksBoom or time >= g_nextDragonLevelFireworksBoom then
      local weatherX = -1000
      local weatherY = -1700
      local weatherW = 3039.53
      local weatherH = 150
      local burstAmount = 400
      local posX = _G.math.floor(weatherX + _G.math.random(weatherW))
      local posY = _G.math.floor(weatherY + _G.math.random(weatherH))
      _G.particles.addLevelParticles("fireworksWeather", burstAmount, posX, posY, 0, 0, 0, false)
      playAudio(getAudioName("fireworks"), 1, false)
      if _G.math.random(10) < 5 then
        g_nextDragonLevelFireworksBoom = time + 3 - _G.math.random(4, 7) * 0.1
      else
        g_nextDragonLevelFireworksBoom = time + _G.math.random() * 0.25 * 3
      end
    end
  end
}
g_level_scripts.LevelCH_3 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelCH_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_2")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_2" and not eagleBaitLaunched then
      goldenEggAchieved("LevelCH_GE")
    end
  end
}
g_level_scripts.LevelPL_15 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelPL_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelPL_GE")
    end
  end
}
g_level_scripts.LevelBtS_13 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelBtS_GE2") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelBtS_GE2")
    end
  end
}
g_level_scripts.LevelHH_1013 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelHH_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelHH_GE")
    end
  end
}
g_level_scripts.LevelX3_11 = {
  onLoadLevel = function()
    if settingsWrapper:isGoldenEggUnlocked("LevelX3_GE") then
      removeObjectAndJoints("ExtraGoldenEgg_1")
    end
  end,
  onRemoveBlock = function(block)
    if block.name == "ExtraGoldenEgg_1" and not eagleBaitLaunched then
      goldenEggAchieved("LevelX3_GE")
    end
  end
}
filename = "level_scripts.lua"
