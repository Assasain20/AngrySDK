LSGoldenEggsWithVideoLayout = {}
LSGoldenEggsWithVideoLayout.listen_events = {}
function LSGoldenEggsWithVideoLayout.createPage(frame, page)
  LSGoldenEggsLayout.createPage(frame, page)
  if page.video_link then
    local link_button = ui.ImageButton:new()
    link_button.name = "linkButton"
    link_button:setImage(page.video_link.sprite or "LS_BUTTON_SEASON_VIDEO")
    link_button.returnValue = "GOTO_VIDEO_LINK"
    link_button.meta = {
      link = page.video_link.link
    }
    link_button.activateOnRelease = true
    frame:addChild(link_button)
  end
end
function LSGoldenEggsWithVideoLayout.createLevelButton(level)
  local button = LSGoldenEggsLayout.createLevelButton(level)
  if level.return_value_override then
    button.returnValue = level.return_value_override
    button.meta = level.meta_override
  end
  return button
end
function LSGoldenEggsWithVideoLayout.isLevelOpen(level)
  return LSGoldenEggsLayout.isLevelOpen(level)
end
function LSGoldenEggsWithVideoLayout.onOpenLevelEntry(frame, level_button, level)
  LSGoldenEggsLayout.onOpenLevelEntry(frame, level_button, level)
end
function LSGoldenEggsWithVideoLayout.onClosedLevelEntry(frame, level_button, level)
  LSGoldenEggsLayout.onClosedLevelEntry(frame, level_button, level)
end
function LSGoldenEggsWithVideoLayout.layout(frame, page)
  LSGoldenEggsLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  if page.video_link then
    local link_button = frame:getChild("linkButton")
    link_button.x = (page.index - 1) * screenWidth + 0.22 * width + left
    link_button.y = 0.83 * screenHeight
  end
end
function LSGoldenEggsWithVideoLayout.update(frame, page, dt, time)
  for j = 1, #page.levels do
    local star_effect = frame:getChild("starEffect" .. page.index .. "-" .. j)
    star_effect.angle = star_effect.angle + dt * 0.6
  end
end
function LSGoldenEggsWithVideoLayout.eventTriggered(frame, page, event)
end
LSMooncakeLayout = {}
LSMooncakeLayout.listen_events = {}
function LSMooncakeLayout.createPage(frame, page)
  LSGoldenEggsLayout.createPage(frame, page)
end
function LSMooncakeLayout.createLevelButton(level)
  return LSGoldenEggsLayout.createLevelButton(level)
end
function LSMooncakeLayout.isLevelOpen(level)
  return settingsWrapper:isGoldenEggUnlocked(level.name)
end
function LSMooncakeLayout.onOpenLevelEntry(frame, level_button, level)
  LSGoldenEggsLayout.onOpenLevelEntry(frame, level_button, level)
  if level.made_of_pieces then
    level_button:setImage("GOLD_MOONCAKE_FULL", "GOLD_MOONCAKE_FULL")
  end
end
function LSMooncakeLayout.onClosedLevelEntry(frame, level_button, level)
  LSGoldenEggsLayout.onClosedLevelEntry(frame, level_button, level)
  if level.made_of_pieces then
    local slices = settingsWrapper:getMooncakeSliceAmount()
    if slices == 8 then
      level_button:setImage("GOLD_MOONCAKE_FULL", "GOLD_MOONCAKE_FULL")
    elseif slices > 0 then
      local image = "GOLDEN_MOONCAKE_PIECE_" .. slices
      level_button:setImage(image, image)
    end
  end
end
function LSMooncakeLayout.layout(frame, page)
  LSGoldenEggsLayout.layout(frame, page)
end
function LSMooncakeLayout.update(frame, page, dt, time)
  LSGoldenEggsLayout.update(frame, page, dt, time)
end
function LSMooncakeLayout.eventTriggered(frame, page, event)
end
LSXmasLayout = {}
LSXmasLayout.listen_events = {
  events.EID_MIGHTY_EAGLE_AVAILABLE,
  events.EID_ANIMATE_LEVEL_BUTTON
}
function LSXmasLayout.createPage(frame, page)
end
function LSXmasLayout.onPageCreated(frame, page)
  local hatch = ui.Image:new()
  hatch.name = "hatch"
  hatch:setVisible(false)
  hatch:setImage(page.animated_button_override or "LEVEL_BOX_XMAS_OPEN")
  frame:addChild(hatch)
end
function LSXmasLayout.createLevelButton(level)
  local button = createLevelButton(level)
  createBasicLevelButton(button, level)
  button.returnValue = "ANIMATE_LEVEL_BUTTON"
  button.animationDuration = level.animation_duration or 2
  button.animationParticles = level.animation_particles or nil
  button.disabledReturnValue = "CHECK_LEVEL_AVAILABLE"
  if level.extra_sprite then
    local extra = ui.Image:new()
    extra.name = "extra"
    extra:setVisible(true)
    extra:setImage(level.extra_sprite)
    button:addChild(extra)
  end
  return button
end
function LSXmasLayout.isLevelOpen(level)
  return settingsWrapper:getLastOpenLevel(level.episode) >= level.index_in_episode
end
function LSXmasLayout.onOpenLevelEntry(frame, level_button, level)
  openBasicLevel(level_button, level)
end
function LSXmasLayout.onClosedLevelEntry(frame, level_button, level)
  closeBasicLevel(level_button, level)
  level_button:getChild("number").visible = true
end
function LSXmasLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  local rows = 3
  local cols = 8
  local y_begin = -0.08 * screenHeight
  local y_line_gap_multiplier = 1.3
  local content_width = 0.87
  local levels_per_page = cols * rows
  local x_begin = (page.index - 1) * screenWidth + 0.5 * width * (1 - content_width) + left
  local x_gap = content_width * width / (cols - 1)
  for j = 1, rows do
    local row_y = screenHeight * (j / (rows + 3) * y_line_gap_multiplier)
    for k = 1, cols do
      local level_button = frame:getChild("level" .. page.index .. "-" .. (j - 1) * cols + k)
      level_button.x = x_begin + x_gap * (k - 1)
      level_button.y = y_begin + row_y
    end
  end
  local level_button = frame:getChild("level" .. page.index .. "-" .. 25)
  level_button.x = x_begin + content_width * width / 2
  level_button.y = y_begin + screenHeight * ((rows + 1) / (rows + 3) * y_line_gap_multiplier)
  frame:getChild("hatch").visible = false
end
function LSXmasLayout.update(frame, page, dt, time)
  for j = 1, #page.levels do
    local level = page.levels[j]
    local lvl = frame:getChild("level" .. page.index .. "-" .. level.index)
    if lvl.animationTimer then
      lvl.animationTimer = lvl.animationTimer - dt
      if lvl.animationTimer <= 0 then
        lvl:setEnabled(true)
        lvl.animationTimer = nil
        SeasonsLevelSelection.discardEvents = false
        local level_event = {
          id = events.EID_CHANGE_LEVEL,
          data = lvl.meta,
          from = "levelselection menu"
        }
        eventManager:notify(level_event)
      end
    end
  end
end
function LSXmasLayout.eventTriggered(frame, page, event)
  if event.id == events.EID_MIGHTY_EAGLE_AVAILABLE then
    for j = 1, #page.levels do
      local button = frame:getChild("level" .. page.index .. "-" .. j)
      local eagle = button:getChild("eagle")
      if eagle.visible then
        eagle.visible = false
        button:getChild("number").visible = true
      end
    end
    frame:getChild("levelButtons"):refreshVisibleChildren()
  elseif event.id == events.EID_ANIMATE_LEVEL_BUTTON then
    for j = 1, #page.levels do
      local level = page.levels[j]
      if event.data.episode == level.episode and event.data.level == level.index then
        local button = frame:getChild("level" .. page.index .. "-" .. level.index)
        local hatch = frame:getChild("hatch")
        hatch.visible = true
        hatch.x = button.x
        hatch.y = button.y
        if deviceModel == "android" and level.name == "LevelX3_5" and not settingsWrapper:isGoldenEggUnlocked("Level_Intel") then
          settingsWrapper:unlockGoldenEgg("Level_Intel")
          showRewardPopup("GENERIC_REWARD", {
            sprite = "GOLDEN_EGG_INTEL",
            sound = "goldenegg"
          })
        end
        button:getChild("number").visible = false
        button:getChild("eagle").visible = false
        button:getChild("feather").visible = false
        _G.res.playAudio("star_collect", 1, false)
        button.animationTimer = button.animationDuration
        if button.animationParticles then
          loadParticleFile()
          g_menu_particle_scale = 1
          if button.animationParticles[1] then
            for i = 1, #button.animationParticles do
              local parts = button.animationParticles[i]
              _G.particles.addParticles(parts[1] or parts, parts.amount or 30, button.x, button.y, 40, 30, 0, true, true)
            end
          else
            _G.particles.addParticles(button.animationParticles, 30, button.x, button.y, 40, 30, 0, true, true)
          end
        end
        frame:getChild("levelButtons"):refreshVisibleChildren()
        SeasonsLevelSelection.discardEvents = true
        return
      end
    end
  end
end
LSCalendarLayout = {}
LSCalendarLayout.listen_events = LSXmasLayout.listen_events
function LSCalendarLayout.createPage(frame, page)
end
function LSCalendarLayout.onPageCreated(frame, page)
  local hatch = ui.Image:new()
  hatch.name = "hatch"
  hatch:setVisible(false)
  hatch:setImage(page.animated_button_override or "LEVEL_BOX_XMAS_OPEN")
  frame:addChild(hatch)
end
function LSCalendarLayout.createLevelButton(level)
  local button = createLevelButton(level)
  createBasicLevelButton(button, level)
  button.returnValue = "ANIMATE_LEVEL_BUTTON"
  button.animationDuration = level.animation_duration or 2
  button.animationParticles = level.animation_particles or nil
  return button
end
function LSCalendarLayout.isLevelOpen(level)
  return settingsWrapper:getLastOpenLevel(level.episode) >= level.index_in_episode
end
function LSCalendarLayout.onOpenLevelEntry(frame, level_button, level)
  LSXmasLayout.onOpenLevelEntry(frame, level_button, level)
end
function LSCalendarLayout.onClosedLevelEntry(frame, level_button, level)
  LSXmasLayout.onClosedLevelEntry(frame, level_button, level)
end
function LSCalendarLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  local y_begin = -0.12 * screenHeight
  local y_line_gap_multiplier = 1.45
  local content_width = 0.83
  local levels_per_page = page.layout_params.cols * page.layout_params.rows
  local x_begin = (page.index - 1) * screenWidth + 0.5 * width * (1 - content_width) + left
  local x_gap = content_width * width / (page.layout_params.cols - 1)
  for j = 1, page.layout_params.rows do
    local row_y = screenHeight * (j / (page.layout_params.rows + 2) * y_line_gap_multiplier)
    if page.layout_params.amount < j * page.layout_params.cols then
      x_begin = x_begin + x_gap * (j * page.layout_params.cols - page.layout_params.amount) / 2
    end
    for k = 1, page.layout_params.cols do
      if (j - 1) * page.layout_params.cols + k <= page.layout_params.amount then
        local level_button = frame:getChild("level" .. page.index .. "-" .. (j - 1) * page.layout_params.cols + k)
        level_button.x = x_begin + x_gap * (k - 1)
        level_button.y = y_begin + row_y
      end
    end
  end
  frame:getChild("hatch").visible = false
end
function LSCalendarLayout.update(frame, page, dt, time)
  LSXmasLayout.update(frame, page, dt, time)
end
function LSCalendarLayout.eventTriggered(frame, page, event)
  LSXmasLayout.eventTriggered(frame, page, event)
end
LSTwitterLayout = {}
LSTwitterLayout.listen_events = {
  events.EID_MIGHTY_EAGLE_AVAILABLE,
  events.EID_TWITTER_OPENED
}
function LSTwitterLayout.createPage(frame, page)
  local fb_button = ui.ImageButton:new()
  fb_button.name = "fbButton" .. page.index
  fb_button:setImage("TW_BUTTON")
  fb_button.returnValue = "GOTO_SOCIAL"
  fb_button.meta = {
    event = "EID_TWITTER_OPENED"
  }
  fb_button.activateOnRelease = true
  frame:addChild(fb_button)
end
function LSTwitterLayout.createLevelButton(level)
  return LSFacebookLayout.createLevelButton(level)
end
function LSTwitterLayout.isLevelOpen(level)
  return settingsWrapper:isTwitterFollowed()
end
function LSTwitterLayout.onOpenLevelEntry(frame, level_button, level)
  LSFacebookLayout.onOpenLevelEntry(frame, level_button, level)
end
function LSTwitterLayout.onClosedLevelEntry(frame, level_button, level)
  level_button:getChild("number").visible = false
  level_button:getChild("stars").visible = false
  level_button:getChild("eagle").visible = false
  level_button:getChild("feather").visible = false
  level_button:setEnabled(true)
  level_button.returnValue = "SHOW_TWITTER_PROMPT"
  level_button:setImage("LS_LEVEL_BG_NORMAL_CLOSED", "LS_LEVEL_BG_NORMAL_CLOSED")
end
function LSTwitterLayout.layout(frame, page)
  LSFacebookLayout.layout(frame, page)
end
function LSTwitterLayout.update(frame, page, dt, time)
  LSFacebookLayout.update(frame, page, dt, time)
end
function LSTwitterLayout.eventTriggered(frame, page, event)
  if event.id == events.EID_MIGHTY_EAGLE_AVAILABLE then
    for i = 1, #page.levels do
      local button = frame:getChild("level" .. page.index .. "-" .. i)
      local eagle = button:getChild("eagle")
      if eagle.visible then
        eagle.visible = false
        button:getChild("number").visible = true
      end
    end
    frame:getChild("levelButtons"):refreshVisibleChildren()
  elseif event.id == events.EID_TWITTER_OPENED then
    for i = 1, #page.levels do
      local button = frame:getChild("level" .. page.index .. "-" .. i)
      button:setImage(page.level_button, page.level_button)
      button.returnValue = "GOTO_LEVEL"
      button:getChild("number").visible = true
      button:setEnabled(true)
    end
    frame:getChild("levelButtons"):refreshVisibleChildren()
  end
end
LSQZoneLayout = {}
LSQZoneLayout.listen_events = {
  events.EID_MIGHTY_EAGLE_AVAILABLE,
  events.EID_FACEBOOK_LIKE_CLICKED,
  events.EID_QZONE_OPENED
}
function LSQZoneLayout.createPage(frame, page)
  if not applyChinaRestictions then
    local fb_button = ui.ImageButton:new()
    fb_button.name = "fbButton" .. page.index
    fb_button:setImage("FB_LIKE_BUTTON")
    fb_button.returnValue = "GOTO_SOCIAL"
    fb_button.meta = {
      event = "EID_GOTO_FACEBOOK_CONNECT"
    }
    fb_button.activateOnRelease = true
    frame:addChild(fb_button)
  end
  local qz_button = ui.ImageButton:new()
  qz_button.name = "qzButton" .. page.index
  qz_button:setImage("QZONE_LIKE_BUTTON")
  qz_button.returnValue = "GOTO_SOCIAL"
  qz_button.meta = {
    event = "EID_QZONE_OPENED"
  }
  qz_button.activateOnRelease = true
  frame:addChild(qz_button)
end
function LSQZoneLayout.createLevelButton(level)
  return LSFacebookLayout.createLevelButton(level)
end
function LSQZoneLayout.isLevelOpen(level)
  return settingsWrapper:isFbPageLiked()
end
function LSQZoneLayout.onOpenLevelEntry(frame, level_button, level)
  LSFacebookLayout.onOpenLevelEntry(frame, level_button, level)
end
function LSQZoneLayout.onClosedLevelEntry(frame, level_button, level)
  level_button:getChild("number").visible = false
  level_button:getChild("stars").visible = false
  level_button:getChild("eagle").visible = false
  level_button:getChild("feather").visible = false
  level_button:setEnabled(true)
  level_button.returnValue = "SHOW_QZONE_PROMPT"
  level_button:setImage("LS_LEVEL_BG_NORMAL_CLOSED", "LS_LEVEL_BG_NORMAL_CLOSED")
end
function LSQZoneLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  local fb_button, fbw, fbh
  if not applyChinaRestictions then
    fb_button = frame:getChild("fbButton" .. page.index)
    fbw, fbh = _G.res.getSpriteBounds(fb_button.image)
    local page_x = (page.index - 1) * screenWidth + 0.5 * screenWidth
    fb_button.x = page_x - fbw / 2
    fb_button.y = screenHeight / 2.75
  end
  local qz_button = frame:getChild("qzButton" .. page.index)
  local qzw, qzh = _G.res.getSpriteBounds(qz_button.image)
  local page_x = (page.index - 1) * screenWidth + 0.5 * screenWidth
  if not applyChinaRestictions then
    qz_button.x = page_x + qzw / 2
    qz_button.y = screenHeight / 2.75
  else
    qz_button.x = page_x
    qz_button.y = screenHeight / 2.75
  end
  local lbw, lbh = _G.res.getSpriteBounds(page.level_button)
  for j = 1, page.layout_params.levels do
    local level_button = frame:getChild("level" .. page.index .. "-" .. j)
    level_button.x = page_x - (page.layout_params.levels - 1) * 0.5 * 1.5 * lbw + (j - 1) * 1.5 * lbw
    if not applyChinaRestictions then
      level_button.y = fb_button.y + fbh / 2.28 + lbh * 0.5
    else
      level_button.y = qz_button.y + qzh / 2.28 + lbh * 0.5
    end
  end
end
function LSQZoneLayout.update(frame, page, dt, time)
  LSFacebookLayout.update(frame, page, dt, time)
end
function LSQZoneLayout.eventTriggered(frame, page, event)
  if event.id == events.EID_MIGHTY_EAGLE_AVAILABLE then
    for i = 1, #page.levels do
      local button = frame:getChild("level" .. page.index .. "-" .. i)
      local eagle = button:getChild("eagle")
      if eagle.visible then
        eagle.visible = false
        button:getChild("number").visible = true
      end
    end
    frame:getChild("levelButtons"):refreshVisibleChildren()
  elseif event.id == events.EID_QZONE_OPENED or event.id == events.EID_FACEBOOK_LIKE_CLICKED then
    for i = 1, #page.levels do
      local button = frame:getChild("level" .. page.index .. "-" .. i)
      button:setImage(page.level_button, page.level_button)
      button.returnValue = "GOTO_LEVEL"
      button:getChild("number").visible = true
      button:setEnabled(true)
    end
    frame:getChild("levelButtons"):refreshVisibleChildren()
  end
end
LSIntelLayout = {}
LSIntelLayout.listen_events = {
  events.EID_MIGHTY_EAGLE_AVAILABLE
}
function LSIntelLayout.createPage(frame, page)
  local title = ui.Image:new()
  title.name = "title" .. page.index
  title:setImage("MENU_LOGO_INTEL")
  frame:addChild(title)
end
function LSIntelLayout.createLevelButton(level)
  local button = createLevelButton(level)
  createBasicLevelButton(button, level)
  return button
end
function LSIntelLayout.isLevelOpen(level)
  return settingsWrapper:getLastOpenLevel(level.episode) >= level.index_in_episode
end
function LSIntelLayout.onOpenLevelEntry(frame, level_button, level)
  openBasicLevel(level_button, level)
end
function LSIntelLayout.onClosedLevelEntry(frame, level_button, level)
  closeBasicLevel(level_button, level)
end
function LSIntelLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  local title = frame:getChild("title" .. page.index)
  local titlew, titleh = _G.res.getSpriteBounds(title.image)
  local page_x = (page.index - 1) * screenWidth + 0.5 * screenWidth
  title.x = page_x
  title.y = 0
  local y_begin = 0.1 * screenHeight
  local y_line_gap_multiplier = 1.2
  local content_width = 0.63
  local levels_per_page = page.layout_params.cols * page.layout_params.rows
  local x_begin = (page.index - 1) * screenWidth + 0.5 * width * (1 - content_width) + left
  local x_gap = content_width * width / (page.layout_params.cols - 1)
  for j = 1, page.layout_params.rows do
    local row_y = screenHeight * (j / (page.layout_params.rows + 2) * y_line_gap_multiplier)
    for k = 1, page.layout_params.cols do
      local level_button = frame:getChild("level" .. page.index .. "-" .. (j - 1) * page.layout_params.cols + k)
      level_button.x = x_begin + x_gap * (k - 1)
      level_button.y = y_begin + row_y
    end
  end
end
function LSIntelLayout.update(frame, page, dt, time)
end
function LSIntelLayout.eventTriggered(frame, page, event)
  if event.id == events.EID_MIGHTY_EAGLE_AVAILABLE then
    for j = 1, #page.levels do
      local button = frame:getChild("level" .. page.index .. "-" .. j)
      local eagle = button:getChild("eagle")
      if eagle.visible then
        eagle.visible = false
        button:getChild("number").visible = true
      end
    end
    frame:getChild("levelButtons"):refreshVisibleChildren()
  end
end
g_ls_layout_mapping.goldeneggswithvideo = LSGoldenEggsWithVideoLayout
g_ls_layout_mapping.mooncake = LSMooncakeLayout
g_ls_layout_mapping.xmas = LSXmasLayout
g_ls_layout_mapping.calendar = LSCalendarLayout
g_ls_layout_mapping.twitter = LSTwitterLayout
g_ls_layout_mapping.qzone = LSQZoneLayout
g_ls_layout_mapping.intel = LSIntelLayout
filename = "seasons_layouts.lua"
