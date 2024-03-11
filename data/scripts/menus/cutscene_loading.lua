function releaseCutScenes()
  if useDynamicAssets then
    dynamic.delayrelease({
      "ingame",
      settingsWrapper:getCurrentMainMenuTheme(),
      settingsWrapper:getCurrentMainMenuTheme() .. "_menu"
    })
  else
    releaseImages({"CUTSCENES"})
    releaseCompoSprites({
      "CUTSCENES_COMPOSPRITES"
    })
  end
end
function loadCutScenes()
  if useDynamicAssets then
    dynamic.load({
      "ingame",
      settingsWrapper:getCurrentMainMenuTheme(),
      settingsWrapper:getCurrentMainMenuTheme() .. "_menu"
    })
  else
    loadImages({"CUTSCENES"})
    loadCompoSprites({
      "CUTSCENES_COMPOSPRITES"
    })
  end
end
filename = "cutscene_loading.lua"
