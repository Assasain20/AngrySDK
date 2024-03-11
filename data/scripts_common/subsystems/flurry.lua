Flurry = gamelua.subsystems.SubSystem:new()
function Flurry:eventTriggered(event)
  local events = gamelua.events
  local loginfo = gamelua.loginfo
  if event.id == events.EID_GOTO_FACEBOOK_CONNECT then
    self:logEvent("ABFBConnect link clicked")
  end
  if event.id == events.EID_TWITTER_OPENED then
    self:logEvent("ABTwitter link clicked")
  end
  if event.id == events.EID_QZONE_OPENED then
    self:logEvent("ABQZone link clicked")
  end
  if event.id == events.EID_VIDEO_LINK_CLICKED then
    self:logEvent("Video link clicked", {
      Link = event.link
    })
  end
  if event.id == events.EID_GE_LEVEL_RESTARTED then
    self:logEvent("Golden egg level restarted", {
      Level = event.levelName
    })
  end
  if event.id == events.EID_CHANGE_SCENE then
    if event.target == nil or event.target ~= nil and _G.type(event.target) == "table" and event.target.name == nil then
      logwarning("Flurry:eventTriggered, no target for event EID_CHANGE_SCENE")
      return
    end
    local targetName = event.target
    if _G.type(event.target) == "table" then
      targetName = event.target.name
    end
    loginfo("Flurry:eventTriggered, event = EID_CHANGE_SCENE, target = " .. _G.tostring(targetName))
    local episodes = gamelua.subsystemsapi:getTotalEpisodes()
    for i = 1, episodes do
      if targetName == "LEVEL_SELECTION_" .. i then
        self:logEvent("goto episode " .. i)
      end
    end
    if targetName == "LEVEL_SELECTION_G" then
      self:logEvent("goto episode GE")
    end
    if targetName == "EPISODE_SELECTION" then
      self:logEvent("Episode selection entered")
    end
  end
  if event.id == events.EID_LEVEL_PLAYED_WITH_EAGLE then
    local _, episode, page, index = gamelua.getLevelById(event.level)
    local world_number = gamelua.g_episodes[episode].pages[page].world_number or -1
    self:logEvent("ME: Level played", {
      Level = Flurry:getLevelText(event.level)
    })
    if event.skipped then
      self:logEvent("ME: Level skipped", {
        Level = Flurry:getLevelText(event.level)
      })
    end
  end
  if event.id == events.EID_ABOUT_MENU_OPENED then
    self:logEvent("About menu viewed")
  end
  if event.id == events.EID_CHANGE_LEVEL and event.data ~= nil and event.data.flurryId ~= nil then
    self:logEvent("Facebook level clicked " .. event.data.flurryId)
  end
  if event.id == events.EID_EAGLE_FEATHER_GAINED then
    local _, episode, page, index = gamelua.getLevelById(event.level)
    local world_number = gamelua.g_episodes[episode].pages[page].world_number or -1
    self:logEvent("ME: got feather", {
      Level = Flurry:getLevelText(event.level)
    })
  end
  if event.id == events.EID_MIGHTYEAGLE_PURCHASED then
    if event.from ~= "MAIN_MENU" then
      params = {}
      params.From = event.from or ""
      local levelSkip = "no"
      if event.usedAsLevelSkip then
        levelSkip = "yes"
      end
      params.levelSkip = levelSkip
      if event.status ~= 4 and gamelua.subsystemsapi:isAndroid() then
        self:logEvent("ANDROID: ME purchase", {Result = "success"})
      end
      loginfo("Flurry: mighty eagle purchased at " .. gamelua.getWorldLevelNumberCombination() .. ", level skip = " .. levelSkip .. "\n")
      self:logEvent("ME: purchased", params)
    else
      params = {}
      params.From = "MainMenu"
      params.levelSkip = "no"
      if event.status ~= 4 and gamelua.subsystemsapi:isAndroid() then
        self:logEvent("ANDROID: ME purchase", {Result = "success"})
      end
      gamelua.loginfo("Flurry: mighty eagle purchased at MainMenu, level skip = no \n")
      self:logEvent("ME: purchased", params)
    end
  end
  if event.id == events.EID_MIGHTYEAGLE_RESTORED then
    loginfo("Flurry: Mighty eagle restored")
    self:logEvent("Mighty eagle restored")
  end
  if event.id == events.EID_IAP_FAILED_OTHER and event.product == gamelua.mightyEagleItemId then
    if gamelua.subsystemsapi.isAndroid() then
      self:logEvent("ANDROID: ME purchase", {Result = "fail"})
    end
    self:logEvent("Mighty eagle purchase failed")
  end
  if event.id == events.EID_IAP_CANCELLED_BY_USER and event.product == gamelua.mightyEagleItemId then
    loginfo("Flurry: Mighty eagle purchase cancelled by user")
    if gamelua.subsystemsapi.isAndroid() then
      self:logEvent("ANDROID: ME purchase", {
        Result = "user cancelled"
      })
    end
    self:logEvent("Mighty eagle purchase canceled")
  end
  if event.id == events.EID_NEW_HIGHSCORE then
    local _, episode, page, index = gamelua.getLevelById(event.level)
    local world_number = gamelua.g_episodes[episode].pages[page].world_number or -1
    if event.oldHighscore < gamelua.starTable[event.level].silverScore and event.newHighscore >= gamelua.starTable[event.level].silverScore then
      self:logEvent("Level complete first time 2 stars", {
        Level = Flurry:getLevelText(event.level)
      })
    end
    if event.oldHighscore < gamelua.starTable[event.level].goldScore and event.newHighscore >= gamelua.starTable[event.level].goldScore then
      self:logEvent("Level complete first time 3 stars", {
        Level = Flurry:getLevelText(event.level)
      })
    end
  end
  if event.id == events.EID_FACEBOOK_LIKE_CLICKED then
  end
  if event.id == events.EID_LEVEL_COMPLETE_FIRST_TIME then
    local _, episode, page, index = gamelua.getLevelById(event.level)
    local world_number = gamelua.g_episodes[episode].pages[page].world_number or -1
    self:logEvent("Level complete first time", {
      Level = Flurry:getLevelText(event.level)
    })
  end
  if event.id == events.EID_GOLDEN_EGG_COMPLETED then
    self:logEvent("Golden egg level completed", {
      Level = event.level
    })
  end
  if event.id == events.EID_ALEX_CLICKED then
    self:logEvent("Amazing Alex link clicked")
  end
  if event.id == events.EID_PIGGIES_CLICKED then
    self:logEvent("Bad Piggies link clicked")
  end
  if event.id == events.EID_SW_CLICKED then
    self:logEvent("Angry Birds Star Wars link clicked")
  end
  if event.id == events.EID_ABSHOP_LINK_CLICKED then
    self:logEvent("ABshop link clicked")
  end
  if event.id == events.EID_GIFT_PURCHASE_CLICKED then
    self:logEvent("Apple gift purchase link clicked")
  end
  if event.id == events.EID_FACEBOOK_LINK_CLICKED then
    self:logEvent("Facebook link clicked")
  end
  if event.id == events.EID_TWITTER_LINK_CLICKED then
    self:logEvent("Twitter link clicked")
  end
  if event.id == events.EID_SINA_WEIBO_LINK_CLICKED then
    self:logEvent("Sina Weibo link clicked")
  end
  if event.id == events.EID_TENCENT_WEIBO_LINK_CLICKED then
    self:logEvent("Tencent Weibo link clicked")
  end
  if event.id == events.EID_QZONE_LINK_CLICKED then
    self:logEvent("Qzone link clicked")
  end
  if event.id == events.EID_RENREN_LINK_CLICKED then
    self:logEvent("Renren link clicked")
  end
  if event.id == events.EID_CINEMATIC_TRAILER_CLICKED then
    self:logEvent("Trailer link clicked")
  end
  if event.id == events.EID_MIGHTY_EAGLE_BUTTON_CLICKED then
    local event_from = "unknown"
    if event.from == "INGAME" then
      event_from = "ingame"
    elseif event.from == "LEVEL_FAILED" then
      event_from = "level failed"
    elseif event.from == "MAIN_MENU" then
      event_from = "main menu"
    end
    self:logEvent("ME: popup opened", {From = event_from})
  end
  if event.id == events.EID_GOLDEN_EGG_FAILED then
    self:logEvent("Golden egg level failed", {
      Level = event.level
    })
  end
  if event.id == events.EID_MAIN_MENU_ENTERED then
    self:logEvent("Main menu entered")
  end
  if event.id == events.EID_LEVEL_COMPLETED then
    local _, episode, page, index = gamelua.getLevelById(event.levelName)
    local world_number = gamelua.g_episodes[episode].pages[page].world_number or -1
    self:logEvent("Level complete", {
      ["Level"] = Flurry:getLevelText(event.levelName),
      ["Stars"] = "" .. event.gainedStars,
      ["Attempts"] = "" .. gamelua.numberOfAttemptsInLevel,
      ["Birds used"] = "" .. gamelua.birdsShot,
      ["Birds available"] = "" .. gamelua.birdsCounter
    })
  end
  if event.id == events.EID_LEVEL_FAILED then
    local _, episode, page, index = gamelua.getLevelById(event.level)
    local world_number = gamelua.g_episodes[episode].pages[page].world_number or -1
    self:logEvent("Level failed", {
      ["Level"] = Flurry:getLevelText(event.level),
      ["Attempts"] = "" .. gamelua.numberOfAttemptsInLevel,
      ["Birds used"] = "" .. gamelua.birdsShot,
      ["Birds available"] = "" .. gamelua.birdsCounter
    })
  end
  if event.id == events.EID_CHALLENGE_STARTED then
    self:logEvent("Challenge started first time", {
      Challenge = event.challenge.id
    })
  end
  if event.id == events.EID_CHALLENGE_STARTED_FIRSTTIME then
    self:logEvent("Challenge started first time", {
      Challenge = event.challenge.id
    })
  end
  if event.id == events.EID_CHALLENGE_RESTARTED then
    self:logEvent("Challenge restarted", {
      Challenge = event.challenge.id
    })
  end
  if event.id == events.EID_CHALLENGE_FAILED then
    self:logEvent("Challenge failed", {
      Challenge = event.challenge.id
    })
  end
  if event.id == events.EID_CHALLENGE_COMPLETE then
    self:logEvent("Challenge complete", {
      Challenge = event.challenge.id
    })
  end
  if event.id == events.EID_CHALLENGE_COMPLETE_FIRST_TIME then
    self:logEvent("Challenge complete first time", {
      Challenge = event.challenge.id
    })
  end
  if event.id == events.EID_CHALLENGE_UNLOCKED then
    self:logEvent("Challenge unlocked", {
      Challenge = event.challenge.id
    })
  end
  if event.id == events.EID_CHALLENGE_MENU_ENTERED then
    self:logEvent("Challenge menu entered", {})
  end
  if event.id == events.EID_MIGHTY_EAGLE_TRAILER_CLICKED then
    self:logEvent("ME: trailer viewed")
  end
  if event.id == events.EID_SEASONS_LINK_CLICKED then
    self:logEvent("Halloween link clicked")
  end
  if event.id == events.EID_NEWSLETTER_CLICKED then
    self:logEvent("Newsletter link clicked")
  end
  if event.id == events.EID_ROVIO_NEWS_SHOWN then
    self:logEvent("Rovio news shown")
  end
  if event.id == events.EID_TUTORIAL_VIEWED then
    self:logEvent("Tutorials viewed")
  end
  if event.id == events.EID_FLURRY_EVENT_STARTED_BEFORE_COMPLETION then
    self:logEvent("Level started before completion", {
      Level = Flurry:getLevelText(event.level)
    })
  end
  if event.id == events.EID_GOLDEN_EGG_STAR_GAINED then
  end
  if event.id == events.EID_GE_LEVEL_STARTED then
    self:logEvent("Golden egg level started", {
      Level = _G.tostring(event.levelName)
    })
  end
  if event.id == events.EID_LEVEL_STARTED then
    levelRestartedFlurryParams = {}
    self:logEvent("Level started", {
      Level = Flurry:getLevelText(event.levelName),
      From = event.from,
      Customer_ID = gamelua.customerString
    })
  end
  if event.id == events.EID_LEVEL_RESTARTED then
    levelRestartedFlurryParams = {}
    if event.currentWorldNumber ~= nil and event.currentLevelNumberInTheme ~= nil then
      levelRestartedFlurryParams.Level = Flurry:getLevelText(event.levelName)
    else
      levelRestartedFlurryParams.Level = "undefined"
    end
    if event.numberOfAttemptsInLevel ~= nil then
      levelRestartedFlurryParams.Attempts = "" .. event.numberOfAttemptsInLevel
    else
      levelRestartedFlurryParams.Attempts = "undefined"
    end
    if event.birdsShot ~= nil then
      levelRestartedFlurryParams["Birds used"] = "" .. event.birdsShot
    else
      levelRestartedFlurryParams["Birds used"] = "undefined"
    end
    if event.birdsCounter ~= nil then
      levelRestartedFlurryParams["Birds available"] = "" .. event.birdsCounter
    else
      levelRestartedFlurryParams["Birds available"] = "undefined"
    end
    if event.levelRestartedFrom ~= nil then
      levelRestartedFlurryParams.From = "" .. event.levelRestartedFrom
    else
      levelRestartedFlurryParams.From = "undefined"
    end
    levelRestartedFlurryParams.Customer_ID = gamelua.customerString
    self:logEvent("Level restarted", levelRestartedFlurryParams)
  end
  if event.id == events.EID_NOOK_STORE_ENTERED_FIRST_TIME then
    self:logEvent("Nook Store Network Connected")
  end
  if event.id == events.EID_NOOK_STORE_EXITED then
    local secs = event.duration.days * 86400 + event.duration.hours * 3600 + event.duration.minutes * 60 + event.duration.seconds
    if secs < 10 then
      self:logEvent("NOOK: Session 0s - 10s")
    elseif secs < 30 then
      self:logEvent("NOOK: Session 10 - 30s")
    elseif secs < 60 then
      self:logEvent("NOOK: Session 30s - 60s")
    elseif secs < 180 then
      self:logEvent("NOOK: Session 1min - 3min")
    elseif secs < 600 then
      self:logEvent("NOOK: Session 3min - 10min")
    elseif secs < 1800 then
      self:logEvent("NOOK: Session 10min - 30min")
    else
      self:logEvent("NOOK: Session 30min ->")
    end
  end
  if event.id == events.EID_SHOP_PURCHASE then
    self:logEvent("Powerup: Purchased", {
      item = event.item,
      powerup_type = event.powerup_type,
      amount = event.amount
    })
  end
  if event.id == events.EID_POWERUP_WAS_USED then
    self:logEvent("Powerup: Used", {
      powerup_type = event.type,
      level = Flurry:getLevelText(event.level)
    })
  end
  if event.id == events.EID_DAILYREWARD_RECEIVED then
    self:logEvent("Powerup: Daily reward received", {
      powerup_type = event.powerup_type
    })
  end
  if event.id == events.EID_PARENTAL_LOCK_TOGGLED then
    self:logEvent("Powerup: Parental lock toggled", {
      toggled_on = event.toggled_on
    })
  end
  if event.id == events.EID_LEVEL_COMPLETED_WITH_POWERUPS then
    self:logEvent("Powerup: Level completed with powerups", {
      level = Flurry:getLevelText(event.level)
    })
  end
  if event.id == events.EID_MATTEL_STARTED then
    self:logEvent("Mattel mode started", {
      from = event.from,
      mode = event.mode
    })
  end
  if event.id == events.EID_AD_REQUESTED then
    self:logEvent("Ad requested", {
      Ad_type = event.type,
      Customer_ID = gamelua.customerString
    })
  end
  if event.id == events.EID_AD_SERVED then
    self:logEvent("Ad served", {
      Ad_type = event.type,
      Customer_ID = gamelua.customerString
    })
  end
  if event.id == events.EID_IAP_COMPLETED then
    self:logEvent("IAP: purchase succeeded", {
      item = event.item
    })
  end
  if event.id == events.EID_IAP_FAILED then
    self:logEvent("IAP: purchase failed", {
      item = event.item,
      reason = event.reason
    })
  end
  if event.id == events.EID_GAME_INITIALIZED or event.id == events.EID_GAME_RESUMED then
    if gamelua.bi_data and gamelua.bi_data.saved_once then
      if gamelua.bi_data.last_launch_date ~= nil then
        local currentTime = gamelua.getCurrentTime()
        local difference = gamelua.getTimeDifference(gamelua.bi_data.last_launch_date, currentTime)
        if 1 <= difference.days or currentTime.day ~= gamelua.bi_data.last_launch_date.day then
          self:logEvent("Daily Active", {
            Customer_ID = gamelua.customerString
          })
        end
      end
    else
      self:logEvent("New User", {
        Customer_ID = gamelua.customerString
      })
      self:logEvent("Daily Active", {
        Customer_ID = gamelua.customerString
      })
    end
    gamelua.bi_data = {}
    gamelua.bi_data.saved_once = true
    gamelua.bi_data.last_launch_date = gamelua.getCurrentTime()
    gamelua.saveLuaFileWrapper("bi_data.lua", "bi_data", true)
  end
  if event.id == events.EID_POWERUPS_DUPLICATED then
    self:logEvent("Sync: powerups duplicated", {
      item = event.product,
      amount = event.amount
    })
  end
end
function Flurry:getLevelText(level_name)
  local _, episode, page, index = gamelua.getLevelById(level_name)
  local world_number = gamelua.g_episodes[episode].pages[page].world_number or -1
  local level_text = ""
  if world_number ~= -1 then
    level_text = world_number
  else
    level_text = gamelua.g_episodes[episode].pages[page].flurry_tag
  end
  if gamelua.g_episodes[episode].per_page_level_numbering then
    level_text = level_text .. "-" .. index
  else
    level_text = level_text .. "-" .. gamelua.getLevelIndexInEpisode(level_name)
  end
  return level_text
end
function Flurry:logEvent(event, params)
  local params_str = ""
  if params ~= nil then
    for k, v in _G.pairs(params) do
      if params_str ~= "" then
        params_str = params_str .. "; "
      end
      params_str = params_str .. _G.tostring(k) .. " -> " .. _G.tostring(v)
    end
  end
  gamelua.print("<Flurry> logging flurry event [" .. _G.tostring(event) .. "] with params [" .. params_str .. "]\n")
  local paramsCount = 0
  if params ~= nil then
    for k, v in _G.pairs(params) do
      paramsCount = paramsCount + 1
    end
  end
  gamelua.flurryParams = params
  if _G.Flurry then
    if params == nil or params ~= nil and paramsCount == 0 then
      gamelua.loginfo("<Flurry> logging event without params ")
      _G.Flurry.logEvent(event)
    elseif params ~= nil and paramsCount == 1 then
      for k, v in _G.pairs(params) do
        gamelua.loginfo("<Flurry> logging event with 1 param ")
        _G.Flurry.logEvent(event, "" .. k, "" .. v)
      end
    elseif params ~= nil and paramsCount > 1 then
      gamelua.loginfo("<Flurry> logging event with >1 params ")
      _G.Flurry.logEvent(event, params)
    end
    if do_unitTest == true then
      if #params_str > 0 then
        _G.table.insert(unitTestResults, event .. "," .. params_str)
      else
        _G.table.insert(unitTestResults, event)
      end
    end
  end
end
function unitTest(flurryInstance, event, expected)
  unitTestResults = {}
  local testFailed = false
  gamelua.loginfo("<Flurry unit test for event : " .. event.id)
  f:eventTriggered(event)
  local fails = 0
  for i, v in _G.ipairs(expected) do
    if expected[i] ~= unitTestResults[i] then
      gamelua.logwarning("      Flurry unit test FAIL, event = " .. _G.tostring(event.id) .. " result = <" .. _G.tostring(unitTestResults[i]) .. ">, expected = <" .. _G.tostring(expected[i]) .. ">")
      fails = fails + 1
    else
      gamelua.loginfo("      Flurry unit test PASS, event = " .. _G.tostring(event.id) .. " result = <" .. _G.tostring(unitTestResults[i]) .. ">, expected = <" .. _G.tostring(expected[i]) .. ">")
    end
  end
  if fails > 0 then
    gamelua.logwarning("<Flurry: " .. event.id .. " failed " .. fails .. " times")
  end
end
function unitTestFlurry()
  do_unitTest = true
  local events = gamelua.events
  f = Flurry:new()
  unitTest(f, {
    id = events.EID_CHALLENGE_MENU_ENTERED
  }, {
    "Challenge menu entered"
  })
  unitTest(f, {
    id = events.EID_LEVEL_PLAYED_WITH_EAGLE,
    level = "Level30"
  }, {
    "ME: Level played,Level -> 3-12"
  })
  unitTest(f, {
    id = events.EID_LEVEL_PLAYED_WITH_EAGLE,
    level = "Level1",
    skipped = true
  }, {
    "ME: Level played,Level -> 1-1",
    "ME: Level skipped,Level -> 1-1"
  })
  unitTest(f, {
    id = events.EID_EAGLE_FEATHER_GAINED,
    level = "Level1"
  }, {
    "ME: got feather,Level -> 1-1"
  })
  unitTest(f, {
    id = events.EID_ME_PURCHASE_CANCELLED_BY_USER
  }, {
    "Mighty eagle purchase canceled"
  })
  unitTest(f, {
    id = events.EID_MIGHTYEAGLE_RESTORED
  }, {
    "Mighty eagle restored"
  })
  unitTest(f, {
    id = events.EID_ME_PURCHASE_FAILED_OTHER
  }, {
    "Mighty eagle purchase failed"
  })
  unitTest(f, {
    id = events.EID_MIGHTYEAGLE_PURCHASED,
    status = 1,
    errorCode = 0,
    from = "3-1",
    usedAsLevelSkip = true
  }, {
    "ME: purchased,levelSkip -> yes; From -> 3-1"
  })
  unitTest(f, {
    id = events.EID_MIGHTYEAGLE_PURCHASED,
    status = 1,
    errorCode = 0,
    from = "5-1",
    usedAsLevelSkip = false
  }, {
    "ME: purchased,levelSkip -> no; From -> 5-1"
  })
  unitTest(f, {
    id = events.EID_MIGHTYEAGLE_PURCHASED,
    status = 1,
    errorCode = 0,
    from = "MAIN_MENU",
    usedAsLevelSkip = "false"
  }, {
    "ME: purchased,levelSkip -> no; From -> MainMenu"
  })
  local temp = gamelua.deviceModel
  gamelua.deviceModel = "android"
  unitTest(f, {
    id = events.EID_MIGHTYEAGLE_PURCHASED,
    status = 1,
    errorCode = 0,
    from = "MAIN_MENU",
    usedAsLevelSkip = "false"
  }, {
    "ANDROID: ME purchase,Result -> success",
    "ME: purchased,levelSkip -> no; From -> MainMenu"
  })
  gamelua.deviceModel = temp
  do_unitTest = false
end
filename = "flurry.lua"
