local g_nextLevelButton = "BUTTON_NEXTLEVEL"
if deviceModel == "freebox" then
  g_nextLevelButton = "GESTURE_PLAY"
end
LevelEndRoot = ui.Frame:inherit()
function LevelEndRoot:init()
  self.name = "LevelEndRoot"
end
function LevelEndRoot:prepareForDynamicAssets()
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  dynamic.setRequirements(self, {
    "levelComplete",
    theme,
    theme .. "_menu"
  })
end
function LevelEndRoot:onEntry()
  ui.Frame.onEntry(self)
  g_menu_particle_scale = 1
end
function LevelEndRoot:update(dt, time)
  ui.Frame.update(self, dt, time)
end
function LevelEndRoot:draw(x, y, scaleX, scaleY)
  drawGame()
  ui.Frame.draw(self, self.x + x, self.y + y, scaleX, scaleY)
end
function LevelEndRoot:onExit()
  _G.res.stopAllAudio()
  ui.Frame.onExit(self)
end
function LevelEndRoot:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE" then
    eventManager:queueEvent({
      id = events.EID_MIGHTY_EAGLE_PURCHASE_CLOSE_CLICKED,
      from = "LEVEL_FAILED"
    })
  elseif result == "EAGLE_PURCHASE_CLICKED" then
    goToMightyEaglePaymentPage()
  end
  return result, meta, item
end
LevelEnd = ui.Frame:inherit()
function LevelEnd:init()
  local page_title = ui.Text:new()
  page_title.name = "pageTitle"
  page_title.hanchor = "HCENTER"
  page_title.vanchor = "VCENTER"
  page_title.text = ""
  page_title:setFont(getFontBasic)
  self:addChild(page_title)
  self.shade = 0
  self.name = self.name or "LevelEnd"
  for i = 1, 3 do
    local button = ui.ImageButton:new()
    button.name = "button" .. i
    button:setVisible(false)
    button.activateOnRelease = true
    self:addChild(button)
  end
  self.shake_offset_x = 0
  self.shake_offset_y = 0
  ui.Frame.init(self)
end
function LevelEnd:drawBackground()
  setRenderState(0, 0, 1, 1, 0, 0, 0)
  drawRect(0, 0, 0, self.shade, 0, 0, screenWidth, screenHeight, true)
  drawRect(0, 0, 0, self.shade / 0.5, screenWidth * 0.5 + self.shake_offset_x - self.center_width * 0.5, 0, screenWidth * 0.5 + self.shake_offset_x + self.center_width * 0.5, screenHeight, true)
end
function LevelEnd:onEntry()
  ui.Frame.onEntry(self)
end
function LevelEnd:layout()
  ui.Frame.layout(self)
  local star_w, _ = _G.res.getSpriteBounds("BIG_STAR_2")
  self.center_width = _G.math.max(_G.math.min(409.6, screenWidth * 0.4), 1.78 * star_w)
  self.ref_width = _G.math.max(_G.math.min(1024, screenWidth), 4.45 * star_w)
  local page_title = self:getChild("pageTitle")
  page_title.x = screenWidth * 0.5
  page_title.y = screenHeight * (self.title_y or 0.125)
  page_title.textBoxSize = self.center_width
  page_title:clip()
  if self.buttons == 1 or self.buttons == 3 then
    for i = 1, 3 do
      local button = self:getChild("button" .. i)
      button.x = screenWidth * 0.5 + (i - 2) * self.ref_width * 0.125
      button.y = screenHeight * (self.button_y or 0.85)
    end
  elseif self.buttons == 2 then
    for i = 1, 2 do
      local button = self:getChild("button" .. i)
      button.x = screenWidth * 0.5 + (i - 1.5) * self.ref_width * 0.125
      button.y = screenHeight * (self.button_y or 0.85)
    end
  end
end
local returnToLevelSelection = function()
  if _G.res.isAudioPlaying("score_count") then
    _G.res.stopAudio("score_count")
  end
  eventManager:notify({
    id = events.EID_LEAVE_GAME,
    reason = "LEVELEND_MENU_BUTTON"
  })
  if g_level_started_from_mattel_ge then
    Mattel.g_mattel_return_function()
    g_level_started_from_mattel_ge = false
  else
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "LEVEL_SELECTION_" .. currentThemeNumber
    })
  end
end
local restartLevel = function(current_level, from)
  if _G.res.isAudioPlaying("score_count") then
    _G.res.stopAudio("score_count")
  end
  local _, episode, page, level = getLevelById(current_level)
  levelRestartedFrom = from
  if episode ~= "G" then
    eventManager:notify({
      id = events.EID_LEVEL_RESTARTED,
      currentWorldNumber = currentWorldNumber,
      currentLevelNumberInTheme = currentLevelNumberInTheme,
      levelName = current_level,
      numberOfAttemptsInLevel = numberOfAttemptsInLevel,
      birdsShot = birdsShot,
      birdsCounter = birdsCounter,
      levelRestartedFrom = from
    })
  elseif episode == "G" then
    eventManager:notify({
      id = events.EID_GE_LEVEL_RESTARTED,
      levelName = current_level
    })
  end
  local event_data = {
    episode = episode,
    page = page,
    level = level,
    levelName = current_level
  }
  eventManager:notify({
    id = events.EID_CHANGE_LEVEL,
    data = event_data,
    from = from
  })
end
local nextLevel = function(current_level, from)
  if _G.res.isAudioPlaying("score_count") then
    _G.res.stopAudio("score_count")
  end
  local level, episode, page, index = getLevelById(current_level)
  if index == #g_episodes[episode].pages[page].levels then
    eventManager:notify({
      id = events.EID_SCROLL_TO_NEXT_WORLD,
      episode = episode
    })
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "LEVEL_SELECTION_" .. episode
    })
  else
    local next_level = getNextLevel(current_level)
    local data, episode, page, level = getLevelById(next_level)
    levelRestartedFrom = nil
    local event_meta = {
      episode = episode,
      page = page,
      level = level,
      levelName = next_level
    }
    eventManager:notify({
      id = events.EID_CHANGE_LEVEL,
      data = event_meta,
      from = from
    })
    notifyEventManager(events.EID_NEXT_LEVEL)
  end
end
local playCutscene = function(cutscene, episode, page, level)
  if _G.res.isAudioPlaying("score_count") then
    _G.res.stopAudio("score_count")
  end
  eventManager:notify({
    id = events.EID_LEAVE_GAME,
    reason = "LEVELEND_CUTSCENE_BUTTON"
  })
  eventManager:notify({
    id = events.EID_LOAD_END_CUTSCENE,
    cutscene = cutscene,
    episode = episode,
    page = page,
    level_index = level
  })
end
function LevelEnd:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "RETURN_TO_LEVEL_SELECTION" then
    returnToLevelSelection()
  elseif result == "RESTART_LEVEL" then
    restartLevel(self.level, meta and meta.menu or levelRestartedFrom)
  elseif result == "NEXT_LEVEL" then
    local next_level = getNextLevel(self.level)
    local n_level, n_episode, n_page, n_index = getLevelById(next_level)
    local allowed = true
    if (g_registrationEnabled and not g_isRegistered or g_is_free_version) and not n_level.free_to_play and not g_episodes[n_episode].pages[n_page].free_to_play then
      allowed = false
    end
    if allowed then
      if g_episodes[n_episode].pages[n_page].calendar and n_index > settingsWrapper:getLastOpenLevel(n_episode) then
        if not self.levelCheckSystem then
          local event_meta = {
            episode = n_episode,
            page = n_page,
            level = n_index,
            levelName = next_level
          }
          local calendar_meta = {
            level = n_index,
            episode = n_episode,
            year = g_episodes[n_episode].pages[n_page].calendar.year,
            month = g_episodes[n_episode].pages[n_page].calendar.month
          }
          self.levelCheckSystem = subsystems.CalendarSubsystem:new({
            data = calendar_meta,
            success_event = {
              id = events.EID_CHANGE_LEVEL,
              data = event_meta,
              from = meta and meta.menu or ""
            }
          })
        end
      else
        nextLevel(self.level, meta and meta.menu or "")
      end
    else
      local level, episode, page, index = getLevelById(self.level)
      local event_meta = {
        episode = episode,
        page = page,
        level = index,
        levelName = next_level
      }
      eventManager:notify({
        id = events.EID_SHOW_REGISTRATION_DIALOG,
        from = "LEVEL_END",
        success_event = {
          id = events.EID_CHANGE_LEVEL,
          data = event_meta,
          from = meta and meta.menu or ""
        }
      })
    end
  elseif result == "PLAY_CUTSCENE" then
    playCutscene(meta.cutscene, meta.episode, meta.page, meta.level)
  elseif result == "MIGHTY_EAGLE" then
    eventManager:notify({
      id = events.EID_MIGHTY_EAGLE_BUTTON_CLICKED,
      from = "LEVEL_FAILED"
    })
  elseif result == "NEXT_SCREEN" then
    eventManager:notify({
      id = events.EID_POP_FRAME
    })
    eventManager:notify({
      id = events.EID_PUSH_FRAME,
      target = meta.next_screen
    })
  elseif result == "NEXT_CHALLENGE_LEVEL" then
    eventManager:notify({
      id = events.EID_START_NEXT_CHALLENGE_LEVEL,
      challenge = self.challenge,
      progress = self.challenge_progress
    })
  elseif result == "RETURN_TO_CHALLENGE_SELECTION" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "CHALLENGE_PAGE",
      from = "CHALLENGE_COMPLETE"
    })
  elseif result == "RESTART_CHALLENGE" then
    eventManager:notify({
      id = events.EID_CHALLENGE_STARTED,
      challenge = self.challenge
    })
  elseif result == "MIGHTY_EAGLE_DISABLED" then
    self:showEagleDisabledTimer()
  elseif result == "GOTO_GIFT_PURCHASE" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_GIFT_PURCHASE_CLICKED
    })
  elseif result == "GOTO_EXTERNAL_LINK" then
    openURL(meta)
  end
  return result, meta, item
end
if not g_isAccelerometerControl then
  function LevelEnd:onKeyEvent(event, key)
    if event == "RELEASE" and key == "BACK" and not self.no_back_key then
      returnToLevelSelection()
    end
  end
else
  function LevelEnd:onKeyEvent(eventType, key)
    if eventType ~= "RELEASE" then
      return
    end
    if key == "BACK" and not self.no_back_key then
      returnToLevelSelection()
    elseif key == "RESTART" and self:getChild("button2").visible then
      restartLevel(self.level, self.menutype or levelRestartedFrom)
    elseif key == "FORWARD" and self:getChild("button3").visible then
      if self:getChild("button3").returnValue == "PLAY_CUTSCENE" then
        local level, episode, page, index = getLevelById(self.level)
        playCutscene(level.clear_cutscene, episode, page, index)
      elseif self:getChild("button3").returnValue == "NEXT_LEVEL" then
        nextLevel(self.level, self.menutype or "")
      end
    end
  end
end
function LevelEnd:update(dt, time)
  self.shade = _G.math.min(self.shade + dt, 0.5)
  ui.Frame.update(self, dt, time)
  if self.levelCheckSystem and self.levelCheckSystem:update() then
    self.levelCheckSystem = nil
  end
end
function LevelEnd:draw(x, y, scaleX, scaleY)
  if self.visible then
    self:drawBackground()
    ui.Frame.draw(self, x + self.shake_offset_x, y + self.shake_offset_y, scaleX, scaleY)
  end
end
LevelComplete = LevelEnd:inherit()
function LevelComplete:new(o, level, first_clear, stars, score, old_score, _1, _2, old_level_stars, eagleAvailable)
  local o = o or {}
  o.level = level
  o.first_clear = first_clear
  o.stars = stars
  o.score = score
  o.old_score = old_score
  o.old_level_stars = old_level_stars
  o.eagleAvailable = eagleAvailable or false
  o.name = "LevelComplete"
  o.menutype = "complete menu"
  return LevelEnd.new(self, o)
end
function LevelComplete:init()
  LevelEnd.init(self)
  local level, episode, page, index = getLevelById(self.level)
  local page_title = self:getChild("pageTitle")
  page_title.text = "MT_LEVEL_COMPLETE"
  for i = 1, 3 do
    local star = ui.Image:new()
    star.name = "star" .. i
    star:setImage("BIG_STAR_EMPTY_" .. i)
    self:addChild(star)
  end
  local score_counter = ui.Text:new()
  score_counter.name = "scoreCounter"
  score_counter.font = "FONT_CHALLENGE_SCORE"
  score_counter.text = "0"
  score_counter.hanchor = "HCENTER"
  score_counter.vanchor = "VCENTER"
  self:addChild(score_counter)
  local powerup_indicator = ui.Image:new()
  powerup_indicator.name = "powerup_indicator"
  powerup_indicator:setImage("POWERUP_LEVELCOMPLETED")
  powerup_indicator:setVisible(false)
  self:addChild(powerup_indicator)
  local new_highscore = ui.Image:new()
  new_highscore.name = "newHighscore"
  new_highscore:setImage("NEW_HIGHSCORE_BADGE")
  new_highscore:setVisible(false)
  new_highscore.scaleX = 7
  new_highscore.scaleY = 7
  self:addChild(new_highscore)
  local best_score = ui.Text:new({font = getFontScore})
  best_score.name = "bestScore"
  best_score.hanchor = "HCENTER"
  best_score.vanchor = "TOP"
  best_score.visible = false
  self:addChild(best_score)
  local star_limits = {
    0,
    starTable[self.level].silverScore,
    starTable[self.level].goldScore
  }
  for i = 1, 3 do
    local best_star = ui.Image:new()
    best_star.name = "bestStar" .. i
    local image = "BEST_STAR_GREY"
    if self.old_score >= star_limits[i] then
      image = "BEST_STAR_YELLOW"
    end
    best_star:setImage(image)
    best_star:setVisible(false)
    self:addChild(best_star)
  end
  if showEagleScoreElements() then
    local eagle_feather = ui.Image:new()
    eagle_feather.name = "eagleFeather"
    local feather_sprite = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndSpriteOff or "RESULT_ME_FEATHER_OFF"
    if highscores[self.level].eagleScore and highscores[self.level].eagleScore >= 100 then
      feather_sprite = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndSpriteOn or "RESULT_ME_FEATHER_ON"
    end
    eagle_feather:setImage(feather_sprite)
    self:addChild(eagle_feather)
  end
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  local buttonRight = self:getChild("button3")
  local disable_next_button = isNextLevelButtonDisabled(self.level)
  if level.clear_cutscene and self.first_clear then
    buttonRight:setVisible(true)
    self.buttons = 1
    self.no_back_key = true
  elseif disable_next_button then
    buttonLeft:setVisible(true)
    buttonMiddle:setVisible(true)
    self.buttons = 2
  else
    buttonLeft:setVisible(true)
    buttonMiddle:setVisible(true)
    buttonRight:setVisible(true)
    self.buttons = 3
  end
  buttonLeft:setImage("BUTTON_MENU")
  buttonLeft.returnValue = "RETURN_TO_LEVEL_SELECTION"
  buttonMiddle:setImage("BUTTON_RESTART")
  buttonMiddle.returnValue = "RESTART_LEVEL"
  buttonMiddle.meta = {
    menu = self.menutype
  }
  if not level.clear_cutscene then
    buttonRight:setImage(g_nextLevelButton)
    buttonRight.returnValue = "NEXT_LEVEL"
    buttonRight.meta = {
      menu = self.menutype
    }
  else
    buttonRight:setImage("MENU_CUTSCENE")
    buttonRight.returnValue = "PLAY_CUTSCENE"
    buttonRight.meta = {
      cutscene = level.clear_cutscene,
      episode = episode,
      page = page,
      level = index
    }
  end
  if iOS then
    local giftButton = ui.ImageButton:new()
    giftButton.name = "giftButton"
    giftButton:setImage("BUTTON_GIFT_APP")
    giftButton.returnValue = "GOTO_GIFT_PURCHASE"
    self:addChild(giftButton)
  end
end
function LevelComplete:onEntry()
  LevelEnd.onEntry(self)
  self.timer = 0
  _G.res.playAudio("score_count", 0.7, true, 7)
  self.flying_stars = {}
  if self.powerups_used then
    eventManager:notify({
      id = events.EID_LEVEL_COMPLETED_WITH_POWERUPS,
      level = self.level
    })
  end
end
function LevelComplete:layout()
  self.title_y = 0.18
  self.button_y = 0.8
  LevelEnd.layout(self)
  for i = 1, 3 do
    local star = self:getChild("star" .. i)
    star.x = screenWidth * 0.5 + (i - 2) * self.ref_width * 0.125
    star.y = screenHeight * 0.4
  end
  local score_counter = self:getChild("scoreCounter")
  score_counter.x = screenWidth * 0.5
  score_counter.y = screenHeight * 0.58
  local new_highscore = self:getChild("newHighscore")
  new_highscore.x = 0.5 * screenWidth + 0.2 * self.ref_width
  new_highscore.y = 0.625 * screenHeight
  new_highscore.start_x = 1 * screenWidth
  new_highscore.start_y = 0.3 * screenHeight
  new_highscore.end_x = new_highscore.x
  new_highscore.end_y = new_highscore.y
  setFont(score_counter.font)
  local score_width = _G.res.getStringWidth(self.score .. "")
  if showEagleScoreElements() then
    local eagle_feather = self:getChild("eagleFeather")
    local feather_w, _ = _G.res.getSpriteBounds(eagle_feather.image)
    eagle_feather.x = screenWidth * 0.5 + score_width * score_counter.scaleX * 0.5 + feather_w
    eagle_feather.y = score_counter.y
  end
  local powerup_indicator = self:getChild("powerup_indicator")
  local sw, _ = _G.res.getSpriteBounds(powerup_indicator.image)
  powerup_indicator.x = score_counter.x - score_width * score_counter.scaleX * 0.5 - sw * 0.5
  powerup_indicator.y = score_counter.y
  if self.score <= self.old_score then
    local best_star_w, _ = _G.res.getSpriteBounds("BEST_STAR_GREY") * 1.1, nil
    local best_score = self:getChild("bestScore")
    setFont(best_score.font)
    best_score.text = _G.res.getString("TEXTS_BASIC", "TEXT_BEST_SCORE") .. " " .. self.old_score
    local best_score_w = _G.res.getStringWidth(best_score.text)
    local best_score_left = screenWidth * 0.5 - 0.5 * (best_score_w + 3.25 * best_star_w)
    best_score.x = best_score_left + best_score_w * 0.5
    best_score.y = screenHeight * 0.64
    best_score:clip()
    for i = 1, 3 do
      local best_star = self:getChild("bestStar" .. i)
      best_star.x = best_score_left + best_score_w + (i - 0.25) * best_star_w
      best_star.y = screenHeight * 0.64 + self:getChild("bestScore"):getFontLeading() * 0.3
    end
  else
    local best_score = self:getChild("bestScore")
    best_score.x = screenWidth * 0.5
    best_score.y = screenHeight * 0.64
    best_score.text = "MI_NEW_HIGHSCORE"
    best_score:clip()
  end
  local box_w, box_h = _G.res.getSpriteBounds("BG_STAR_COUNTER")
  local giftButton = self:getChild("giftButton")
  if giftButton ~= nil then
    local giftButtonWidth, giftButtonHeight = _G.res.getSpriteBounds(giftButton.image)
    giftButton.x = _G.math.floor(screenWidth - giftButtonWidth * 0.5)
    giftButton.y = _G.math.floor(giftButtonHeight * 0.5)
  end
end
function LevelComplete:update(dt, time)
  self.timer = self.timer + dt
  self.shade = _G.math.min(self.shade + dt, 0.65)
  local score_count_time = _G.math.min(self.score / starTable[self.level].silverScore * 2 - 0.5, 2.7)
  local treasure_chest = self:getChild("treasureChest")
  local piggy_bank = self:getChild("boxRight")
  for i = 0, _G.math.min(self.timer * 1.25 + 0.5, 3) do
    for j = 1, _G.math.min(self.stars, i) do
      local star = self:getChild("star" .. j)
      if star.image == "BIG_STAR_EMPTY_" .. j then
        local sw, sh = _G.res.getSpriteBounds(star.image)
        _G.particles.addParticles("levelCompleteStars" .. j, 40, star.x, star.y, sw / 3, sh / 3, 0, true, true)
        _G.res.playAudio("star_" .. j, 0.7, false)
      end
      star:setImage("BIG_STAR_" .. j)
    end
  end
  local best_score = self:getChild("bestScore")
  local score_counter = self:getChild("scoreCounter")
  if score_count_time > self.timer then
    score_counter.text = "" .. _G.math.floor(self.score * _G.math.min(self.timer, score_count_time) / score_count_time)
  else
    score_counter.text = "" .. self.score
  end
  if score_count_time <= self.timer and _G.res.isAudioPlaying("score_count") then
    _G.res.stopAudio("score_count")
  end
  if self.timer >= score_count_time + 1 then
    local new_highscore = self:getChild("newHighscore")
    if not new_highscore.visible and self.score > self.old_score then
      new_highscore:setVisible(true)
      local sw, sh = _G.res.getSpriteBounds(new_highscore.image)
      _G.res.playAudio("new_highscore", 1, false)
      _G.particles.addParticles("newHighScoreStars", 20, new_highscore.x, new_highscore.y, sw, sh, 0, true, true)
    elseif self.score <= self.old_score then
      for i = 1, 3 do
        self:getChild("bestStar" .. i):setVisible(true)
      end
    end
    if self.powerups_used then
      local powerup_indicator = self:getChild("powerup_indicator")
      if not powerup_indicator.visible then
        self:getChild("powerup_indicator"):setVisible(true)
        local x, y = powerup_indicator.x, powerup_indicator.y
        _G.particles.addParticles("cheaterStamp", 1, x, y, 0, 0, 0, true, true)
        _G.particles.addParticles("superSeedActivationBurst", 10, x, y, 0, 0, 0, true, true)
      end
    end
    if self.score > self.old_score then
      local stamp_animation_time = 0.2
      local shake_time = 0.2
      if self.timer < score_count_time + 1 + stamp_animation_time then
        local scale_tween = tweenLinear(self.timer - score_count_time - 1, 7, -6, stamp_animation_time)
        new_highscore.scaleX = scale_tween
        new_highscore.scaleY = scale_tween
        local pos_tween_x = tweenLinear(self.timer - score_count_time - 1, new_highscore.start_x, new_highscore.end_x - new_highscore.start_x, stamp_animation_time)
        local pos_tween_y = tweenLinear(self.timer - score_count_time - 1, new_highscore.start_y, new_highscore.end_y - new_highscore.start_y, stamp_animation_time)
        new_highscore.x = pos_tween_x
        new_highscore.y = pos_tween_y
      else
        new_highscore.scaleX = 1
        new_highscore.scaleY = 1
        new_highscore.x = new_highscore.end_x
        new_highscore.y = new_highscore.end_y
      end
      if self.timer > score_count_time + 1 + stamp_animation_time and self.timer < score_count_time + 1 + stamp_animation_time + shake_time then
        self.shake_offset_x = (_G.math.random(0, 100) - 50) * (score_count_time + 1 + stamp_animation_time + shake_time - self.timer) * screenHeight / 768
        self.shake_offset_y = (_G.math.random(0, 100) - 50) * (score_count_time + 1 + stamp_animation_time + shake_time - self.timer) * screenHeight / 768
      elseif self.timer > score_count_time + 1 + stamp_animation_time + shake_time then
        self.shake_offset_x = 0
        self.shake_offset_y = 0
      end
    end
    best_score.visible = true
  end
  LevelEnd.update(self, dt, time)
end
function LevelComplete:draw(x, y, scaleX, scaleY)
  if self.visible then
    self:drawBackground()
    LevelEnd.draw(self, x, y, scaleX, scaleY)
  end
end
function LevelComplete:onExit()
  LevelEnd.onExit(self)
  clearParticles()
end
GoldenEggComplete = LevelEnd:inherit()
function GoldenEggComplete:new(level, score, old_score, o)
  local o = o or {}
  o.level = level
  o.score = score
  o.old_score = old_score
  return LevelEnd.new(self, o)
end
function GoldenEggComplete:init()
  LevelEnd.init(self)
  local level, episode, page, index = getLevelById(self.level)
  local page_title = self:getChild("pageTitle")
  page_title.text = "MT_LEVEL_COMPLETE"
  local star = ui.Image:new()
  star.name = "star"
  star:setImage("BIG_STAR_EMPTY_2")
  self:addChild(star)
  local score_counter = ui.Text:new()
  score_counter.name = "scoreCounter"
  score_counter.font = "FONT_CHALLENGE_SCORE"
  score_counter.text = "0"
  score_counter.hanchor = "HCENTER"
  score_counter.vanchor = "VCENTER"
  self:addChild(score_counter)
  local best_score = ui.Text:new()
  best_score.name = "bestScore"
  best_score:setFont(getFontScore)
  best_score.text = "Best " .. self.old_score
  best_score.hanchor = "HCENTER"
  best_score.vanchor = "TOP"
  best_score.visible = false
  self:addChild(best_score)
  if self.old_score > 0 and self.score <= self.old_score then
    best_score.text = _G.res.getString("TEXTS_BASIC", "TEXT_BEST_SCORE") .. " " .. self.old_score
  elseif self.score > self.old_score then
    best_score.text = "MI_NEW_HIGHSCORE"
  end
  local new_highscore = ui.Image:new()
  new_highscore.name = "newHighscore"
  new_highscore:setImage("NEW_HIGHSCORE_BADGE")
  new_highscore:setVisible(false)
  new_highscore.scaleX = 7
  new_highscore.scaleY = 7
  self:addChild(new_highscore)
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  local buttonRight = self:getChild("button3")
  buttonLeft:setVisible(true)
  buttonMiddle:setVisible(true)
  self.buttons = 2
  if level.external_link then
    buttonRight:setVisible(true)
    self.buttons = 3
    buttonRight:setImage("BUTTON_EXTERNAL_LINK")
    buttonRight.returnValue = "GOTO_EXTERNAL_LINK"
    local _ENV = _G.getfenv(1)
    buttonRight.meta = _ENV[level.external_link]
  end
  buttonLeft:setImage("BUTTON_MENU")
  buttonLeft.returnValue = "RETURN_TO_LEVEL_SELECTION"
  buttonMiddle:setImage("BUTTON_RESTART")
  buttonMiddle.returnValue = "RESTART_LEVEL"
end
function GoldenEggComplete:onEntry()
  LevelEnd.onEntry(self)
  self.timer = 0
  _G.res.playAudio("score_count", 0.7, true, 7)
  if self.powerups_used then
    eventManager:notify({
      id = events.EID_LEVEL_COMPLETED_WITH_POWERUPS,
      level = self.level
    })
  end
end
function GoldenEggComplete:layout()
  self.title_y = 0.18
  self.button_y = 0.8
  LevelEnd.layout(self)
  local star = self:getChild("star")
  star.x = screenWidth * 0.5
  star.y = screenHeight * 0.4
  local score_counter = self:getChild("scoreCounter")
  score_counter.x = screenWidth * 0.5
  score_counter.y = screenHeight * 0.58
  local new_highscore = self:getChild("newHighscore")
  new_highscore.x = 0.5 * screenWidth + self.ref_width * 0.2
  new_highscore.y = 0.625 * screenHeight
  new_highscore.start_x = 1 * screenWidth
  new_highscore.start_y = 0.3 * screenHeight
  new_highscore.end_x = new_highscore.x
  new_highscore.end_y = new_highscore.y
  local best_score = self:getChild("bestScore")
  best_score.x = screenWidth * 0.5
  best_score.y = screenHeight * 0.64
end
function GoldenEggComplete:update(dt, time)
  self.timer = self.timer + dt
  if self.timer >= 3 then
    local star = self:getChild("star")
    if star.image == "BIG_STAR_EMPTY_2" then
      local sw, sh = _G.res.getSpriteBounds(star.image)
      _G.particles.addParticles("levelCompleteStars2", 40, star.x, star.y, sw / 3, sh / 3, 0, true, true)
      _G.res.playAudio("star_3", 0.7, false)
    end
    star:setImage("BIG_STAR_2")
  end
  local score_count_time = 4
  local best_score = self:getChild("bestScore")
  local score_counter = self:getChild("scoreCounter")
  score_counter.text = "" .. _G.math.floor(self.score * _G.math.min(self.timer, score_count_time) / score_count_time)
  if score_count_time <= self.timer and _G.res.isAudioPlaying("score_count") then
    _G.res.stopAudio("score_count")
  end
  if self.timer >= score_count_time + 1 then
    local new_highscore = self:getChild("newHighscore")
    if not new_highscore.visible and self.score > self.old_score then
      new_highscore:setVisible(true)
      local sw, sh = _G.res.getSpriteBounds(new_highscore.image)
      _G.res.playAudio("new_highscore", 1, false)
      _G.particles.addParticles("newHighScoreStars", 20, new_highscore.x, new_highscore.y, sw, sh, 0, true, true)
    end
    if self.score > self.old_score then
      local stamp_animation_time = 0.2
      local shake_time = 0.2
      if self.timer < score_count_time + 1 + stamp_animation_time then
        local scale_tween = tweenLinear(self.timer - score_count_time - 1, 7, -6, stamp_animation_time)
        new_highscore.scaleX = scale_tween
        new_highscore.scaleY = scale_tween
        local pos_tween_x = tweenLinear(self.timer - score_count_time - 1, new_highscore.start_x, new_highscore.end_x - new_highscore.start_x, stamp_animation_time)
        local pos_tween_y = tweenLinear(self.timer - score_count_time - 1, new_highscore.start_y, new_highscore.end_y - new_highscore.start_y, stamp_animation_time)
        new_highscore.x = pos_tween_x
        new_highscore.y = pos_tween_y
      else
        new_highscore.scaleX = 1
        new_highscore.scaleY = 1
        new_highscore.x = new_highscore.end_x
        new_highscore.y = new_highscore.end_y
      end
      if self.timer > score_count_time + 1 + stamp_animation_time and self.timer < score_count_time + 1 + stamp_animation_time + shake_time then
        self.shake_offset_x = (_G.math.random(0, 100) - 50) * (score_count_time + 1 + stamp_animation_time + shake_time - self.timer) * screenHeight / 768
        self.shake_offset_y = (_G.math.random(0, 100) - 50) * (score_count_time + 1 + stamp_animation_time + shake_time - self.timer) * screenHeight / 768
      elseif self.timer > score_count_time + 1 + stamp_animation_time + shake_time then
        self.shake_offset_x = 0
        self.shake_offset_y = 0
      end
    end
    best_score.visible = true
  end
  LevelEnd.update(self, dt, time)
end
LevelFailed = LevelEnd:inherit()
function LevelFailed:new(level, eagleAvailable, previously_cleared, score, o)
  local o = o or {}
  o.level = level
  o.previously_cleared = previously_cleared
  o.eagleAvailable = eagleAvailable
  o.name = "LevelFailed"
  o.menutype = "failed menu"
  return LevelEnd.new(self, o)
end
function LevelFailed:init()
  LevelEnd.init(self)
  local page_title = self:getChild("pageTitle")
  page_title.text = "MT_LEVEL_FAILED"
  local pig = ui.Image:new()
  pig.name = "pig"
  local fail_pig_image = "LEVEL_FAILED_PIG"
  local theme = settingsWrapper:getCurrentMainMenuTheme()
  if theme and blockTable.themes[theme] and blockTable.themes[theme].level_failed_pig_override then
    fail_pig_image = blockTable.themes[theme].level_failed_pig_override
  end
  pig:setImage(fail_pig_image)
  self:addChild(pig)
  self:refreshButtons()
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  local buttonRight = self:getChild("button3")
  local level, episode, page, index = getLevelById(self.level)
  if not level.clear_cutscene and self.previously_cleared then
    buttonRight:setImage(g_nextLevelButton)
    buttonRight.meta = {
      menu = self.menutype
    }
    buttonRight.returnValue = "NEXT_LEVEL"
  elseif level.clear_cutscene and self.previously_cleared then
    buttonRight:setImage("MENU_CUTSCENE")
    buttonRight.returnValue = "PLAY_CUTSCENE"
    buttonRight.meta = {
      cutscene = level.clear_cutscene,
      episode = episode,
      page = page,
      level = index
    }
  elseif showEagleUIElements() and not self.previously_cleared and g_episodes[episode].mighty_eagle_disabled ~= true then
    self:initEagleButton()
  end
  buttonLeft:setImage("BUTTON_MENU")
  buttonLeft.returnValue = "RETURN_TO_LEVEL_SELECTION"
  buttonMiddle:setImage("BUTTON_RESTART")
  buttonMiddle.returnValue = "RESTART_LEVEL"
  buttonMiddle.meta = {
    menu = self.menutype
  }
end
function LevelFailed:initEagleButton()
  if self.eagleAvailable then
    self:setEaglebuttonAvailable()
  else
    local timerText = ui.Text:new({
      text = "",
      name = "timerText",
      font = getFontBasic
    })
    local _, episode, _, _ = getLevelById(self.level)
    local buttonLost = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.buttonLostLevelFailed or "BUTTON_EAGLE_LOST"
    local buttonRight = self:getChild("button3")
    buttonRight:setImage(buttonLost, buttonLost)
    buttonRight:addChild(timerText)
    buttonRight.returnValue = "MIGHTY_EAGLE_DISABLED"
  end
end
function LevelFailed:refreshButtons()
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  local buttonRight = self:getChild("button3")
  local disable_next_button = isNextLevelButtonDisabled(self.level)
  local disable_eagle = isEagleDisabled(self.level)
  local level, episode, page, index = getLevelById(self.level)
  if self.previously_cleared and not disable_next_button or showEagleUIElements() and not disable_eagle and not self.previously_cleared or level.clear_cutscene and self.previously_cleared then
    buttonLeft:setVisible(true)
    buttonMiddle:setVisible(true)
    buttonRight:setVisible(true)
    self.buttons = 3
  else
    buttonLeft:setVisible(true)
    buttonMiddle:setVisible(true)
    buttonRight:setVisible(false)
    self.buttons = 2
  end
end
function LevelFailed:setEaglebuttonAvailable()
  local _, episode, _, _ = getLevelById(self.level)
  local button = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.buttonLevelFailed or "BUTTON_EAGLE"
  local buttonLost = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.buttonLostLevelFailed or "BUTTON_EAGLE_LOST"
  local buttonRight = self:getChild("button3")
  buttonRight:setImage(button, buttonLost)
  buttonRight.returnValue = "MIGHTY_EAGLE"
end
function LevelFailed:onEntry()
  loginfo("LevelFailed:onEntry()")
  eventManager:addEventListener(events.EID_MIGHTY_EAGLE_AVAILABLE, self)
  eventManager:addEventListener(events.EID_FREE_EAGLE_ENABLED, self)
  eventManager:addEventListener(events.EID_FREE_EAGLE_DISABLED, self)
  ui.Frame.onEntry(self)
end
function LevelFailed:layout()
  self.title_y = 0.25
  local pig = self:getChild("pig")
  pig.x = screenWidth * 0.5
  pig.y = screenHeight * 0.5
  self.button_y = 0.8
  local buttonRight = self:getChild("button3")
  local timerText = self:getChild("timerText")
  if timerText ~= nil then
    timerText.x = 0
    timerText.y = buttonRight.h * 0.6
  end
  LevelEnd.layout(self)
end
function LevelFailed:update(dt, time)
  local timerText = self:getChild("timerText")
  if timerText ~= nil then
    timerText.visible = false
    if self.eagleInfoTimer ~= nil and self.timerVisibleTime ~= nil and settingsWrapper:getEagleUsedTime() ~= nil then
      self.timerVisibleTime = self.timerVisibleTime - dt
      timerText.visible = true
      local timeLeft = eagleLockedTime - timeDiff(currentTime(), settingsWrapper:getEagleUsedTime())
      timeLeft = formatTime(timeLeft)
      local text = timerText.text
      if timeLeft ~= text then
        timerText.text = timeLeft
        timerText:clip()
      end
      if self.timerVisibleTime < 0 then
        self.timerVisibleTime = nil
      end
    end
  end
  LevelEnd.update(self, dt, time)
end
function LevelFailed:onExit()
  eventManager:removeEventListener(events.EID_MIGHTY_EAGLE_AVAILABLE, self)
  eventManager:removeEventListener(events.EID_FREE_EAGLE_ENABLED, self)
  eventManager:removeEventListener(events.EID_FREE_EAGLE_DISABLED, self)
  ui.Frame.onExit(self)
end
function LevelFailed:eventTriggered(event)
  if event.id == events.EID_MIGHTY_EAGLE_AVAILABLE then
    local _, episode, page, level = getLevelById(self.level)
    if not isEagleDisabled(self.level) then
      loginfo("levelFailed:eventTriggered(EID_MIGHTY_EAGLE_AVAILABLE)")
      if isEagleEnabled() then
        _G.res.playAudio("goldenegg", 1, false)
      end
      local buttonRight = self:getChild("buttonRight")
      self:setEaglebuttonAvailable()
      self.eagleInfoTimer = nil
      local timerText = self:getChild("timerText")
      if timerText ~= nil then
        timerText.visible = false
        self.timerVisibleTime = nil
      end
    end
  end
  if event.id == events.EID_FREE_EAGLE_ENABLED or event.id == events.EID_FREE_EAGLE_DISABLED then
    self:refreshButtons()
    self:initEagleButton()
    if not isEagleUnavailableForShot() then
      self:setEaglebuttonAvailable()
    end
    self:layout()
  end
end
function LevelFailed:showEagleDisabledTimer()
  self.eagleInfoTimer = eagleLockedTime
  self.timerVisibleTime = 3
end
EagleScore = LevelEnd:inherit()
function EagleScore:new(o, level, first_clear, score, old_score)
  local o = o or {}
  o.level = level
  o.first_clear = first_clear
  o.score = score
  o.old_score = old_score
  return LevelEnd.new(self, o)
end
function EagleScore:init()
  LevelEnd.init(self)
  local _, episode, page, index = getLevelById(self.level)
  local page_title = self:getChild("pageTitle")
  page_title.text = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndTextItem or "TEXT_EAGLE_HIGHSCORE"
  local meter_effect = ui.Image:new()
  meter_effect.name = "meterEffect"
  meter_effect:setImage("EAGLE_METER_EFFECT")
  meter_effect:setVisible(false)
  meter_effect.rotatePivotX, meter_effect.rotatePivotY = _G.res.getSpritePivot("EAGLE_METER_EFFECT")
  self:addChild(meter_effect)
  local feather = ui.ProgressBar:new()
  feather.name = "feather"
  feather:setImages("EAGLE_METER_EMPTY", "EAGLE_METER_FILL")
  feather:setMax(100)
  feather:setValue(self.score)
  self:addChild(feather)
  local score_counter = ui.Text:new()
  score_counter.name = "scoreCounter"
  score_counter.font = "FONT_CHALLENGE_SCORE"
  score_counter.text = _G.math.floor(self.old_score) .. "%"
  score_counter.hanchor = "HCENTER"
  score_counter.vanchor = "VCENTER"
  self:addChild(score_counter)
  local best_score = ui.Text:new({font = getFontScore})
  best_score.name = "bestScore"
  best_score.hanchor = "HCENTER"
  best_score.vanchor = "VCENTER"
  best_score.visible = false
  self:addChild(best_score)
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  local buttonRight = self:getChild("button3")
  local disable_next_button = isNextLevelButtonDisabled(self.level)
  local level = getLevelById(self.level)
  if level.clear_cutscene and self.first_clear then
    buttonRight:setVisible(true)
    self.buttons = 1
  elseif disable_next_button then
    buttonLeft:setVisible(true)
    buttonMiddle:setVisible(true)
    self.buttons = 2
  else
    buttonLeft:setVisible(true)
    buttonMiddle:setVisible(true)
    buttonRight:setVisible(true)
    self.buttons = 3
  end
  buttonLeft:setImage("BUTTON_MENU")
  buttonLeft.returnValue = "RETURN_TO_LEVEL_SELECTION"
  buttonMiddle:setImage("BUTTON_RESTART")
  buttonMiddle.returnValue = "RESTART_LEVEL"
  if not level.clear_cutscene then
    buttonRight:setImage(g_nextLevelButton)
    buttonRight.returnValue = "NEXT_LEVEL"
  else
    buttonRight:setImage("MENU_CUTSCENE")
    buttonRight.returnValue = "PLAY_CUTSCENE"
    buttonRight.meta = {
      cutscene = level.clear_cutscene,
      episode = episode,
      page = page,
      level = index
    }
  end
end
function EagleScore:onEntry()
  LevelEnd.onEntry(self)
  _G.res.playAudio("score_count", 0.7, true, 7)
  self.timer = 0
end
function EagleScore:layout()
  self.title_y = 0.185
  self.button_y = 0.75
  LevelEnd.layout(self)
  if showEagleScoreElements() then
    local feather = self:getChild("feather")
    local _, episode, _, _ = getLevelById(self.level)
    local meterEmpty = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndMeterEmpty or "EAGLE_METER_EMPTY"
    local meterFill = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndMeterFill or "EAGLE_METER_FILL"
    feather:setImages(meterEmpty, meterFill)
    self:getChild("pageTitle").text = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndTextItem or "TEXT_EAGLE_HIGHSCORE"
  end
  local meter_effect = self:getChild("meterEffect")
  meter_effect.x = screenWidth * 0.5
  meter_effect.y = screenHeight * 0.41
  local feather = self:getChild("feather")
  feather.x = screenWidth * 0.5
  feather.y = screenHeight * 0.41
  local score_counter = self:getChild("scoreCounter")
  score_counter.x = screenWidth * 0.5
  score_counter.y = screenHeight * 0.555
  if self.score <= self.old_score then
    local best_score = self:getChild("bestScore")
    setFont(best_score.font)
    best_score.text = _G.res.getString("TEXTS_BASIC", "TEXT_BEST_SCORE") .. " " .. self.old_score .. "%"
    best_score.x = screenWidth * 0.5
    best_score.y = screenHeight * 0.63
    best_score.visible = true
  else
    local best_score = self:getChild("bestScore")
    best_score.visible = false
  end
end
function EagleScore:update(dt, time)
  self.timer = self.timer + dt
  local animation_len = self.score * 0.03
  local meter_effect = self:getChild("meterEffect")
  meter_effect.angle = self.timer
  local fill = _G.math.floor(self.score * _G.math.min(self.timer, animation_len) / _G.math.max(animation_len, 1))
  local feather = self:getChild("feather")
  feather:setValue(fill)
  if fill >= 100 then
    local _, episode, _, _ = getLevelById(self.level)
    local meterEmpty = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndMeterEmpty or "EAGLE_METER_EMPTY"
    local meterFull = g_episodes[episode].mightyPower and g_episodes[episode].mightyPower.levelEndMeterFull or "EAGLE_METER_FULL"
    feather:setImages(meterEmpty, meterFull)
    meter_effect:setVisible(true)
    if not self.highscore_sound_played then
      _G.res.playAudio("new_highscore", 1, false)
      self.highscore_sound_played = true
    end
  end
  local score_counter = self:getChild("scoreCounter")
  local score = _G.math.floor(self.score * _G.math.min(self.timer, animation_len) / _G.math.max(animation_len, 1))
  score_counter.text = score .. "%"
  if animation_len <= self.timer and _G.res.isAudioPlaying("score_count") then
    _G.res.stopAudio("score_count")
  end
  LevelEnd.update(self, dt, time)
end
EpisodeComplete = LevelEnd:inherit()
function EpisodeComplete:new(o, next_screen, episode)
  local o = o or {}
  o.episode = episode
  o.next_screen = next_screen
  o.name = "EpisodeComplete"
  return LevelEnd.new(self, o)
end
function EpisodeComplete:init()
  local reward_effect = ui.Image:new()
  reward_effect.name = "rewardEffect"
  reward_effect:setImage("GOLDEN_EGG_STAR_EFFECT")
  reward_effect.rotatePivotX, reward_effect.rotatePivotY = _G.res.getSpritePivot("GOLDEN_EGG_STAR_EFFECT")
  self:addChild(reward_effect)
  local reward_sprite = ui.Image:new()
  reward_sprite.name = "rewardSprite"
  reward_sprite:setImage(g_episodes[self.episode].reward_completion and g_episodes[self.episode].reward_completion.sprite)
  self:addChild(reward_sprite)
  LevelEnd.init(self)
  local page_title = self:getChild("pageTitle")
  page_title.text = g_episodes[self.episode].name
  local text = ui.Text:new({font = getFontBasic})
  text.name = "text"
  text.text = "TEXT_COMPLETE"
  text.hanchor = "HCENTER"
  text.vanchor = "VCENTER"
  self:addChild(text)
  local buttonRight = self:getChild("button3")
  buttonRight:setImage("TUTORIAL_OK")
  buttonRight.returnValue = "NEXT_SCREEN"
  buttonRight.meta = {
    next_screen = self.next_screen
  }
  buttonRight:setVisible(true)
  self.buttons = 1
  self.no_back_key = true
end
function EpisodeComplete:onEntry()
  LevelEnd.onEntry(self)
  self.timer = 0
  if g_isAccelerometerControl then
    g_rokuCursorVisible = false
  end
  _G.res.playAudio("level_complete", 1, false, 7)
end
function EpisodeComplete:onExit()
  LevelEnd.onExit(self)
  if g_isAccelerometerControl then
    g_rokuCursorVisible = true
  end
end
function EpisodeComplete:layout()
  LevelEnd.layout(self)
  local reward_effect = self:getChild("rewardEffect")
  reward_effect.x = screenWidth * 0.5
  reward_effect.y = screenHeight * 0.3
  local reward_sprite = self:getChild("rewardSprite")
  reward_sprite.x = screenWidth * 0.5
  reward_sprite.y = screenHeight * 0.3
  local text = self:getChild("text")
  text.x = screenWidth * 0.5
  text.y = screenHeight * 0.6
  text.text = "TEXT_COMPLETE"
  text.textBoxSize = self.center_width
  local scale = 0
  if deviceModel == "android" then
    scale = 2
  end
  repeat
    text.scaleX = 5 / (5 + scale)
    text.scaleY = 5 / (5 + scale)
    text:clip()
    scale = scale + 1
  until 5 >= #text.lines
end
function EpisodeComplete:update(dt, time)
  self.timer = self.timer + dt
  local reward_effect = self:getChild("rewardEffect")
  reward_effect.angle = self.timer
  LevelEnd.update(self, dt, time)
end
if g_isAccelerometerControl then
  function EpisodeComplete:onPointerEvent(eventType, x, y)
    if eventType == "LRELEASE" then
      eventManager:notify({
        id = events.EID_POP_FRAME
      })
      eventManager:notify({
        id = events.EID_PUSH_FRAME,
        target = self.next_screen
      })
    end
  end
end
EpisodeThreeStars = LevelEnd:inherit()
function EpisodeThreeStars:new(o, next_screen, episode)
  local o = o or {}
  o.episode = episode
  o.next_screen = next_screen
  o.name = "EpisodeThreeStars"
  return LevelEnd.new(self, o)
end
function EpisodeThreeStars:init()
  local reward_effect = ui.Image:new()
  reward_effect.name = "rewardEffect"
  reward_effect:setImage("GOLDEN_EGG_STAR_EFFECT")
  reward_effect.rotatePivotX, reward_effect.rotatePivotY = _G.res.getSpritePivot("GOLDEN_EGG_STAR_EFFECT")
  self:addChild(reward_effect)
  local reward_sprite = ui.Image:new()
  reward_sprite.name = "rewardSprite"
  reward_sprite:setImage(g_episodes[self.episode].reward_three_stars and g_episodes[self.episode].reward_three_stars.sprite)
  self:addChild(reward_sprite)
  LevelEnd.init(self)
  local page_title = self:getChild("pageTitle")
  page_title.text = g_episodes[self.episode].name
  local text = ui.Text:new({font = getFontBasic})
  text.name = "text"
  text.text = "TEXT_PERFECT"
  text.hanchor = "HCENTER"
  text.vanchor = "VCENTER"
  self:addChild(text)
  local buttonRight = self:getChild("button3")
  buttonRight:setImage("TUTORIAL_OK")
  buttonRight.returnValue = "NEXT_SCREEN"
  buttonRight.meta = {
    next_screen = self.next_screen
  }
  buttonRight:setVisible(true)
  self.buttons = 1
  self.no_back_key = true
end
function EpisodeThreeStars:onEntry()
  LevelEnd.onEntry(self)
  self.timer = 0
  if g_isAccelerometerControl then
    g_rokuCursorVisible = false
  end
  _G.res.playAudio("level_complete", 1, false, 7)
end
function EpisodeThreeStars:onExit()
  LevelEnd.onExit(self)
  if g_isAccelerometerControl then
    g_rokuCursorVisible = true
  end
end
function EpisodeThreeStars:layout()
  LevelEnd.layout(self)
  local reward_effect = self:getChild("rewardEffect")
  reward_effect.x = screenWidth * 0.5
  reward_effect.y = screenHeight * 0.3
  local reward_sprite = self:getChild("rewardSprite")
  reward_sprite.x = screenWidth * 0.5
  reward_sprite.y = screenHeight * 0.3
  local text = self:getChild("text")
  text.x = screenWidth * 0.5
  text.y = screenHeight * 0.6
  text.text = "TEXT_PERFECT"
  text.textBoxSize = self.center_width
  local scale = 0
  repeat
    text.scaleX = 5 / (5 + scale)
    text.scaleY = 5 / (5 + scale)
    text:clip()
    scale = scale + 1
  until 5 >= #text.lines
end
function EpisodeThreeStars:update(dt, time)
  self.timer = self.timer + dt
  local reward_effect = self:getChild("rewardEffect")
  reward_effect.angle = self.timer
  LevelEnd.update(self, dt, time)
end
if g_isAccelerometerControl then
  function EpisodeThreeStars:onPointerEvent(eventType, x, y)
    if eventType == "LRELEASE" then
      eventManager:notify({
        id = events.EID_POP_FRAME
      })
      eventManager:notify({
        id = events.EID_PUSH_FRAME,
        target = self.next_screen
      })
    end
  end
end
BirdFlockProgress = ui.Frame:inherit()
function BirdFlockProgress:new(challenge, challenge_progress, o)
  local o = o or {}
  o.challenge = challenge
  o.challenge_progress = challenge_progress
  o.name = "BirdFlockProgress"
  return ui.Frame.new(self, o)
end
function BirdFlockProgress:init()
  ui.Frame.init(self)
  local bird_silhouette = ui.Image:new()
  bird_silhouette.name = "birdSilhouette"
  bird_silhouette:setImage("BIRDS_LEFT_SILHOUETTE")
  self:addChild(bird_silhouette)
  local bird_count = ui.Text:new()
  bird_count.name = "birdCount"
  bird_count.font = "FONT_BIRDS_LEFT"
  bird_count.text = "" .. #self.challenge_progress.shotsQueue
  bird_count.hanchor = "RIGHT"
  bird_count.vanchor = "VCENTER"
  self:addChild(bird_count)
  local birds_left = ui.Text:new({font = getFontBasic})
  birds_left.name = "birdsLeft"
  birds_left.text = "birds left localiseme"
  birds_left.hanchor = "HCENTER"
  birds_left.vanchor = "VCENTER"
  self:addChild(birds_left)
end
function BirdFlockProgress:layout()
  ui.Frame.layout(self)
  local bird_silhouette = self:getChild("birdSilhouette")
  bird_silhouette.x = screenWidth * -0.05
  bird_silhouette.y = screenHeight * -0.05
  local bird_count = self:getChild("birdCount")
  bird_count.x = screenWidth * 0.05
  bird_count.y = screenHeight * -0.05
  local birds_left = self:getChild("birdsLeft")
  birds_left.y = screenHeight * 0.05
end
g_challengeProgressBoxes = {BIRD_FLOCK = BirdFlockProgress}
ChallengeLevelComplete = LevelEnd:inherit()
function ChallengeLevelComplete:new(challenge, challenge_progress, o)
  local o = o or {}
  print(_G.tostring(challenge) .. "\n")
  print(_G.tostring(challenge_progress) .. "\n")
  o.challenge = challenge
  o.challenge_progress = challenge_progress
  return LevelEnd.new(self, o)
end
function ChallengeLevelComplete:init()
  LevelEnd.init(self)
  local page_title = self:getChild("pageTitle")
  page_title.text = "CHALLENGE LEVEL COMPLETED! localiseme"
  local progress = ui.Text:new({font = getFontBasic})
  progress.name = "progress"
  progress.text = "Level " .. self.challenge_progress.levelIndex .. " / " .. #self.challenge.levels .. "localiseme"
  progress.hanchor = "HCENTER"
  progress.vanchor = "VCENTER"
  self:addChild(progress)
  local challenge_box = g_challengeProgressBoxes[self.challenge.type]:new(self.challenge, self.challenge_progress)
  challenge_box.name = "challengeBox"
  self:addChild(challenge_box)
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  local buttonRight = self:getChild("button3")
  buttonLeft:setVisible(true)
  buttonMiddle:setVisible(true)
  buttonRight:setVisible(true)
  buttonLeft:setImage("BUTTON_MENU")
  buttonLeft.returnValue = "RETURN_TO_CHALLENGE_SELECTION"
  buttonMiddle:setImage("BUTTON_RESTART")
  buttonMiddle.returnValue = "RESTART_CHALLENGE"
  buttonRight:setImage(g_nextLevelButton)
  buttonRight.returnValue = "NEXT_CHALLENGE_LEVEL"
  self.buttons = 3
end
function ChallengeLevelComplete:layout()
  LevelEnd.layout(self)
  local progress = self:getChild("progress")
  progress.x = screenWidth * 0.5
  progress.y = screenHeight * 0.2
  local challenge_box = self:getChild("challengeBox")
  challenge_box.x = screenWidth * 0.5
  challenge_box.y = screenHeight * 0.4
end
ChallengeComplete = LevelEnd:inherit()
function ChallengeComplete:new(challenge, challenge_progress, old_star_amount, reward, o)
  local o = o or {}
  o.challenge = challenge
  o.challenge_progress = challenge_progress
  o.old_star_amount = old_star_amount
  o.reward = reward
  return LevelEnd.new(self, o)
end
function ChallengeComplete:init()
  LevelEnd.init(self)
  local page_title = self:getChild("pageTitle")
  page_title.text = "CHALLENGE COMPLETED! localiseme"
  local star = ui.Image:new()
  star.name = "star"
  star:setImage("BIG_STAR_EMPTY_2")
  self:addChild(star)
  local reward = ui.Text:new({font = getFontBasic})
  reward.name = "reward"
  reward.text = "" .. self.challenge.reward
  reward.hanchor = "HCENTER"
  reward.vanchor = "VCENTER"
  reward.visible = false
  self:addChild(reward)
  local piggy_bank = PiggyBank:new(self.old_star_amount)
  piggy_bank.name = "piggyBank"
  self:addChild(piggy_bank)
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  buttonLeft:setVisible(true)
  buttonMiddle:setVisible(true)
  buttonLeft:setImage("BUTTON_MENU")
  buttonLeft.returnValue = "RETURN_TO_CHALLENGE_SELECTION"
  buttonMiddle:setImage("BUTTON_RESTART")
  buttonMiddle.returnValue = "RESTART_CHALLENGE"
  self.buttons = 2
end
function ChallengeComplete:onEntry()
  LevelEnd.onEntry(self)
  self.timer = 0
end
function ChallengeComplete:layout()
  LevelEnd.layout(self)
  local star = self:getChild("star")
  star.x = screenWidth * 0.5
  star.y = screenHeight * 0.35
  local reward = self:getChild("reward")
  reward.x = screenWidth * 0.5
  reward.y = screenHeight * 0.5
  local piggy_bank = self:getChild("piggyBank")
  piggy_bank.x = screenWidth * 0.5
  piggy_bank.y = screenHeight * 0.65
end
function ChallengeComplete:update(dt, time)
  self.timer = self.timer + dt
  local reward = self:getChild("reward")
  if self.timer >= 1 then
    local star = self:getChild("star")
    if star.image == "BIG_STAR_EMPTY_2" then
      local sw, sh = _G.res.getSpriteBounds(star.image)
      _G.particles.addParticles("levelCompleteStars2", 40, star.x, star.y, sw / 3, sh / 3, 0, true, true)
      _G.res.playAudio("star_2", 0.7, false)
    end
    star:setImage("BIG_STAR_2")
    if self.reward > 0 then
      reward.visible = true
    end
  end
  if self.reward > 0 and self.timer > 2 then
    local reward_counter = _G.math.floor(self.reward * _G.math.min(self.timer - 2, 2) / 2)
    reward.text = "" .. self.reward - reward_counter
    local piggyBank = self:getChild("piggyBank")
    piggyBank:setStars(self.old_star_amount + reward_counter)
  end
  LevelEnd.update(self, dt, time)
end
ChallengeFailed = LevelEnd:inherit()
function ChallengeFailed:new(challenge, challenge_progress, o)
  local o = o or {}
  o.challenge = challenge
  o.challenge_progress = self.challenge_progress
  o.menutype = "failed menu"
  return LevelEnd.new(self, o)
end
function ChallengeFailed:init()
  LevelEnd.init(self)
  local page_title = self:getChild("pageTitle")
  page_title.text = "CHALLENGE FAILED! localiseme"
  local pig = ui.Image:new()
  pig.name = "pig"
  pig:setImage("LEVEL_FAILED_PIG")
  self:addChild(pig)
  local buttonLeft = self:getChild("button1")
  local buttonMiddle = self:getChild("button2")
  local buttonRight = self:getChild("button3")
  buttonLeft:setVisible(true)
  buttonMiddle:setVisible(true)
  self.buttons = 2
  buttonLeft:setImage("BUTTON_MENU")
  buttonLeft.returnValue = "RETURN_TO_CHALLENGE_SELECTION"
  buttonMiddle:setImage("BUTTON_RESTART")
  buttonMiddle.returnValue = "RESTART_CHALLENGE"
  buttonMiddle.meta = {
    menu = self.menutype
  }
end
function ChallengeFailed:layout()
  self.title_y = 0.25
  local pig = self:getChild("pig")
  pig.x = screenWidth * 0.5
  pig.y = screenHeight * 0.5
  self.button_y = 0.75
  LevelEnd.layout(self)
end
filename = "level_end.lua"
