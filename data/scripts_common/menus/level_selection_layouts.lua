local g_use_scroll_buttons = deviceModel == "windows" or deviceModel == "osx" or deviceModel == "roku" or deviceModel == "freebox"
function createLevelButton(level)
  local episode = g_episodes[level.episode]
  local page = episode.pages[level.page]
  local enabled_button = level.level_button_override or page.level_button
  local disabled_button = level.disabled_button_override or "LS_LEVEL_BG_NORMAL_CLOSED"
  local level_button = ui.ImageButton:new()
  level_button.name = "level" .. level.page .. "-" .. level.index
  level_button.activateOnRelease = true
  level_button:setImage(enabled_button, disabled_button)
  level_button.returnValue = "GOTO_LEVEL"
  level_button.disabledReturnValue = "DISABLED_LEVEL"
  level_button.meta = {
    episode = level.episode,
    page = level.page,
    level = level.index,
    levelName = level.name,
    intro_cutscene = level.intro_cutscene
  }
  return level_button
end
function createBasicLevelButton(level_button, level)
  local level_number = ui.Text:new()
  level_number.name = "number"
  level_number.font = fontBasic
  level_number.text = _G.tostring(level.display_number)
  level_button:addChild(level_number)
  local eagle = ui.Image:new()
  eagle.name = "eagle"
  eagle:setVisible(false)
  local silhouetteSprite = g_episodes[level.episode].mightyPower and g_episodes[level.episode].mightyPower.levelSelectionSilhouette or "LS_EAGLE_BUTTON"
  eagle:setImage(silhouetteSprite)
  level_button:addChild(eagle)
  local stars = ui.Image:new()
  stars.name = "stars"
  stars:setVisible(false)
  level_button:addChild(stars)
  local feather = ui.Image:new()
  feather.name = "feather"
  feather:setVisible(false)
  local featherSprite = g_episodes[level.episode].mightyPower and g_episodes[level.episode].mightyPower.collectableReward or "LS_EAGLE_FEATHER"
  feather:setImage(featherSprite)
  level_button:addChild(feather)
end
function openBasicLevel(level_button, level)
  level_button:setEnabled(true)
  local score = highscores[level.name]
  local limits = starTable[level.name]
  local number = level_button:getChild("number")
  local stars = level_button:getChild("stars")
  local feather = level_button:getChild("feather")
  local eagle = level_button:getChild("eagle")
  number.visible = true
  eagle.visible = false
  stars.visible = false
  local function get_star_sprite(n)
    local sprite = "LS_STARS_" .. n
    local tables = {
      g_episodes[level.episode].star_sprite_override,
      g_episodes[level.episode].pages[level.page].star_sprite_override,
      level.star_sprite_override
    }
    for i = 1, 3 do
      if tables[i] and tables[i][n] then
        sprite = tables[i][n]
      end
    end
    return sprite
  end
  if score and score.score and score.score > 0 and score.completed then
    stars.visible = true
    if score.score >= limits.goldScore then
      stars:setImage(get_star_sprite(3))
    elseif score.score >= limits.silverScore then
      stars:setImage(get_star_sprite(2))
    else
      stars:setImage(get_star_sprite(1))
    end
  elseif score and (not score.score or score.score and score.score == 0) and score.completed then
    local eagles_used = settingsWrapper:getEagleUsedIn()
    for _, v in _G.ipairs(eagles_used) do
      if v.level == level.name then
        number.visible = false
        stars.visible = false
        eagle.visible = true
      end
    end
  end
  if score and score.eagleScore and score.eagleScore >= 100 then
    feather.visible = true
  end
end
function closeBasicLevel(level_button, level)
  level_button:setEnabled(false)
  level_button:getChild("number").visible = false
  level_button:getChild("stars").visible = false
  level_button:getChild("eagle").visible = false
  level_button:getChild("feather").visible = false
end
function getLevelSelectionLayoutSizes()
  local left, right
  if g_use_scroll_buttons then
    local border = _G.res.getSpriteBounds("BUTTON_ARROW_LEFT") + g_layoutMargin.x
    left = border
    right = screenWidth - border
  else
    left = g_layoutMargin.x
    right = screenWidth - g_layoutMargin.x
  end
  local width = right - left
  return left, right, width
end
LSGridLayout = {}
LSGridLayout.listen_events = {
  events.EID_MIGHTY_EAGLE_AVAILABLE
}
function LSGridLayout.createPage(frame, page)
end
function LSGridLayout.createLevelButton(level)
  local button = createLevelButton(level)
  createBasicLevelButton(button, level)
  return button
end
function LSGridLayout.isLevelOpen(level)
  return settingsWrapper:getLastOpenLevel(level.episode) >= level.index_in_episode
end
function LSGridLayout.onOpenLevelEntry(frame, level_button, level)
  openBasicLevel(level_button, level)
end
function LSGridLayout.onClosedLevelEntry(frame, level_button, level)
  closeBasicLevel(level_button, level)
end
function LSGridLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  local y_begin = -0.1 * screenHeight
  local y_line_gap_multiplier = 1.2
  local content_width = 0.83
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
function LSGridLayout.update(frame, page, dt, time)
end
function LSGridLayout.eventTriggered(frame, page, event)
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
LSFacebookLayout = {}
LSFacebookLayout.listen_events = {
  events.EID_MIGHTY_EAGLE_AVAILABLE,
  events.EID_FACEBOOK_LIKE_CLICKED
}
function LSFacebookLayout.createPage(frame, page)
  local fb_button = ui.ImageButton:new()
  fb_button.name = "fbButton" .. page.index
  fb_button:setImage("FB_LIKE_BUTTON")
  fb_button.returnValue = "GOTO_FACEBOOK_CONNECT"
  fb_button.activateOnRelease = true
  frame:addChild(fb_button)
end
function LSFacebookLayout.createLevelButton(level)
  local button = createLevelButton(level)
  createBasicLevelButton(button, level)
  return button
end
function LSFacebookLayout.isLevelOpen(level)
  return settingsWrapper:isFbPageLiked()
end
function LSFacebookLayout.onOpenLevelEntry(frame, level_button, level)
  openBasicLevel(level_button, level)
  local button_image = g_episodes[level.episode].pages[level.page].level_button
  level_button:setImage(button_image, button_image)
  level_button.returnValue = "GOTO_LEVEL"
end
function LSFacebookLayout.onClosedLevelEntry(frame, level_button, level)
  level_button:getChild("number").visible = false
  level_button:getChild("stars").visible = false
  level_button:getChild("eagle").visible = false
  level_button:getChild("feather").visible = false
  level_button:setEnabled(true)
  level_button.returnValue = "SHOW_FACEBOOK_PROMPT"
  level_button:setImage("LS_LEVEL_BG_NORMAL_CLOSED", "LS_LEVEL_BG_NORMAL_CLOSED")
end
function LSFacebookLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  local fb_button = frame:getChild("fbButton" .. page.index)
  local _, fbh = _G.res.getSpriteBounds(fb_button.image)
  local page_x = (page.index - 1) * screenWidth + 0.5 * screenWidth
  fb_button.x = page_x
  fb_button.y = screenHeight / 2.75
  local lbw, lbh = _G.res.getSpriteBounds(page.level_button)
  for j = 1, page.layout_params.levels do
    local level_button = frame:getChild("level" .. page.index .. "-" .. j)
    level_button.x = page_x - (page.layout_params.levels - 1) * 0.5 * 1.5 * lbw + (j - 1) * 1.5 * lbw
    level_button.y = fb_button.y + fbh / 2.28 + lbh * 0.5
  end
end
function LSFacebookLayout.update(frame, page, dt, time)
end
function LSFacebookLayout.eventTriggered(frame, page, event)
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
  elseif event.id == events.EID_FACEBOOK_LIKE_CLICKED then
    for i = 1, #page.levels do
      local button = frame:getChild("level" .. page.index .. "-" .. i)
      button:setImage(page.level_button, page.level_button)
      button.returnValue = "GOTO_LEVEL"
      button:getChild("number").visible = true
    end
    frame:getChild("levelButtons"):refreshVisibleChildren()
  end
end
LSGoldenEggsLayout = {}
LSGoldenEggsLayout.listen_events = {}
function LSGoldenEggsLayout.createPage(frame, page)
  for i = 1, #page.levels do
    local star_effect = ui.Image:new()
    star_effect.name = "starEffect" .. page.index .. "-" .. i
    star_effect:setImage("GOLDEN_EGG_STAR_EFFECT")
    star_effect.scale = page.levels[i].halo_scale
    frame:addChild(star_effect)
  end
end
function LSGoldenEggsLayout.createLevelButton(level)
  local button = createLevelButton(level)
  local star = ui.Image:new()
  star.name = "star"
  star:setImage(level.completed_sprite_override or g_episodes[level.episode].pages[level.page].layout_params.completed_sprite)
  star:setVisible(false)
  button:addChild(star)
  return button
end
function LSGoldenEggsLayout.isLevelOpen(level)
  return settingsWrapper:isGoldenEggUnlocked(level.name)
end
function LSGoldenEggsLayout.onOpenLevelEntry(frame, level_button, level)
  level_button:setEnabled(true)
  level_button:setVisible(true)
  frame:getChild("starEffect" .. level.page .. "-" .. level.index).visible = not settingsWrapper:isGoldenEggPlayed(level.name)
  level_button:getChild("star"):setVisible(highscores[level.name] and highscores[level.name].completed or false)
end
function LSGoldenEggsLayout.onClosedLevelEntry(frame, level_button, level)
  level_button:setEnabled(false)
  if level.disabled_button_override == nil then
    level_button:setVisible(false)
  else
    level_button:setVisible(true)
  end
  frame:getChild("starEffect" .. level.page .. "-" .. level.index).visible = false
end
function LSGoldenEggsLayout.layout(frame, page)
  local left, right, width = getLevelSelectionLayoutSizes()
  for j = 1, #page.levels do
    local level_button = frame:getChild("level" .. page.index .. "-" .. j)
    level_button.x = (page.index - 1) * screenWidth + (page.levels[j].x or 0.5) * width + left
    level_button.y = (page.levels[j].y or 0.5) * screenHeight
    local star_effect = frame:getChild("starEffect" .. page.index .. "-" .. j)
    star_effect.x = level_button.x
    star_effect.y = level_button.y
  end
end
function LSGoldenEggsLayout.update(frame, page, dt, time)
  for j = 1, #page.levels do
    local star_effect = frame:getChild("starEffect" .. page.index .. "-" .. j)
    star_effect.angle = star_effect.angle + dt * 0.6
  end
end
function LSGoldenEggsLayout.eventTriggered(frame, page, event)
end
g_ls_layout_mapping = {
  grid = LSGridLayout,
  facebook = LSFacebookLayout,
  goldeneggs = LSGoldenEggsLayout
}
filename = "level_selection_layouts.lua"
