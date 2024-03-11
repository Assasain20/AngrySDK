local pc_profile = deviceModel == "windows" or deviceModel == "osx" or deviceModel == "roku" or deviceModel == "freebox"
episodeNumberOffset = -1
SeasonsEpisodeSelection = EpisodeSelection:inherit()
function SeasonsEpisodeSelection:init()
  EpisodeSelection.init(self)
  extraButtons = 0
  for k, v in _G.pairs(g_extra_pages) do
    for j = 1, #v do
      if not v[j].noNewPage then
        extraButtons = extraButtons + 1
      end
    end
  end
  self.episodeAmount = 0
  for k, v in _G.pairs(g_episodes) do
    if v.season == self.seasonName then
      self.episodeAmount = self.episodeAmount + 1
    end
  end
  if not pc_profile then
    for i = 1, self.episodeAmount + extraButtons do
      local dot = ui.Image:new()
      dot.name = "dot" .. i
      dot:setImage("LS_DOT_BLACK")
      dot.attach = "fixed"
      self:addChild(dot)
      local pageNumber = ui.Text:new()
      pageNumber.name = "pageNumber" .. i
      pageNumber.text = "" .. i
      pageNumber.font = "FONT_LS_SMALL"
      pageNumber.visible = false
      pageNumber.attach = "fixed"
      self:addChild(pageNumber)
    end
  end
  self.name = "episodeSelection" .. self.season
end
function SeasonsEpisodeSelection:prepareForDynamicAssets()
  local ep = settingsWrapper:getCurrentEpisode()
  print("Current ep: " .. ep)
  dynamic.setRequirements(self, {
    "episodeSelection" .. self.season,
    settingsWrapper:getCurrentMainMenuTheme() .. "_menu_bg",
    settingsWrapper:getCurrentMainMenuTheme() .. "_ls",
    g_episodes[ep].dynamic_load_group
  })
end
function SeasonsEpisodeSelection:draw(x, y)
  self:drawBackground()
  ui.Frame.draw(self, x, y)
end
function SeasonsEpisodeSelection:drawBackground()
  if g_episodes[self.currentEpisode].background_image then
    local w, h = _G.res.getSpriteBounds(g_episodes[self.currentEpisode].background_image)
    local scale = _G.math.max(screenWidth / w, screenHeight / h)
    setRenderState(0, 0, scale, scale, 0, 0, 0)
    _G.res.drawSprite(g_episodes[self.currentEpisode].background_image, screenWidth / 2 / scale, screenHeight / scale, "HCENTER", "BOTTOM")
    setRenderState(0, 0, 1, 1, 0, 0, 0)
  end
  if g_episodes[self.currentEpisode].decor_left then
    _G.res.drawSprite(g_episodes[self.currentEpisode].decor_left, 0, screenHeight)
  end
  if g_episodes[self.currentEpisode].decor_right then
    _G.res.drawSprite(g_episodes[self.currentEpisode].decor_right, screenWidth, screenHeight)
  end
end
function SeasonsEpisodeSelection:layout()
  self.currentEpisode = settingsWrapper:getCurrentEpisode()
  if not pc_profile then
    local pages = self.episodeAmount + extraButtons
    local dot_y = 10
    local dot_spacing = 15
    local first_dot_x = screenWidth * 0.5 - (pages - 1) * 0.5 * dot_spacing
    local text_y = 0.03 * screenHeight + 12
    for i = 1, pages do
      local dot = self:getChild("dot" .. i)
      dot.x = first_dot_x + dot_spacing * (i - 1)
      dot.y = screenHeight - dot_y - g_layoutMargin.y
      local pageNumber = self:getChild("pageNumber" .. i)
      pageNumber.x = dot.x
      pageNumber.y = screenHeight - text_y - g_layoutMargin.y
    end
    if g_use_scroll_buttons then
      local left_button = self:getChild("left_button")
      local right_button = self:getChild("right_button")
      local sw, sh = _G.res.getSpriteBounds(left_button.image)
      left_button.x = sw * 0.5 + g_layoutMargin.x
      left_button.y = screenHeight * 0.5
      right_button.x = screenWidth - sw * 0.5 - g_layoutMargin.x
      right_button.y = screenHeight * 0.5
    end
  end
  EpisodeSelection.layout(self)
end
function SeasonsEpisodeSelection:onPointerEvent(eventType, x, y)
  local result, meta, item = LevelSelectionRoot.onPointerEvent(self, eventType, x, y)
  if result == "GOTO_MAIN_MENU" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "EXIT_EPISODE_SELECTION",
      from = "EPISODE_SELECTION"
    })
  elseif result == "GOTO_LEVEL_SELECTION" or result == "LOCKED_LEVEL_SELECTION" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:queueEvent({
      id = events.EID_CHANGE_SCENE,
      target = "LEVEL_SELECTION_" .. meta,
      from = "EPISODE_SELECTION"
    })
  elseif result == "SCROLL" then
    if cursor.x > screenWidth / 2 then
      self:getChild("episodeButtons"):next()
    else
      self:getChild("episodeButtons"):previous()
    end
  elseif result == "GOTO_GIFT_PURCHASE" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_GIFT_PURCHASE_CLICKED
    })
  elseif result == "GOTO_LENOVO_ADFREE" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_LENOVO_ADFREE_CLICKED
    })
  elseif result == "GOTO_NEWSLETTER" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_NEWSLETTER_CLICKED
    })
  elseif result == "GOTO_CLASSIC" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_CLASSIC_CLICKED
    })
  elseif result == "GOTO_AB_SHOP" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_AB_SHOP_CLICKED
    })
  elseif result == "GOTO_CHALLENGE" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "CHALLENGE_PAGE",
      from = "EPISODE_SELECTION"
    })
  elseif result == "GOTO_SW_LINK" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_SW_CLICKED
    })
  elseif result == "SCROLL_LEFT" then
    self:getChild("episodeButtons"):previous()
  elseif result == "SCROLL_RIGHT" then
    self:getChild("episodeButtons"):next()
  end
  return result, meta, item
end
if not pc_profile then
  function SeasonsEpisodeSelection:updateSelection(initial_selection)
    local new_index = self.currentSelection
    if not initial_selection then
      new_index = self:getChild("episodeButtons"):getCurrentAnchor()
    end
    if self.currentSelection ~= new_index or initial_selection then
      settingsWrapper:setSelectedEpisode(new_index + episodeNumberOffset)
      local slots = self:getChild("episodeButtons").slots
      for k, v in _G.pairs(slots[self.currentSelection]) do
        self:getChild("episodeButtons"):getChild(v):setEnabled(false)
      end
      for k, v in _G.pairs(slots[new_index]) do
        self:getChild("episodeButtons"):getChild(v):setEnabled(true)
      end
      local new_dot = self:getChild("dot" .. new_index)
      if new_dot ~= nil then
        self:getChild("dot" .. self.currentSelection):setImage("LS_DOT_BLACK")
        self:getChild("pageNumber" .. self.currentSelection).visible = false
        new_dot:setImage("LS_DOT_WHITE")
        self:getChild("pageNumber" .. new_index).visible = true
      end
      self.currentSelection = new_index
      self:getChild("episodeButtons").currentSelection = new_index
      self:getChild("left_button"):setVisible(new_index > 1)
      visibleSlots = self:getChild("episodeButtons"):numVisibleSlots()
      self:getChild("right_button"):setVisible(new_index <= #self.episodes + extraButtons - visibleSlots and visibleSlots < #self.episodes + extraButtons)
    end
  end
  function EpisodeScrollFrame:createEpisodeButton(id, episode)
    local button
    if id == "G" then
      button = GoldenEggButton:new()
    else
      button = SeasonsEpisodeButton:new()
    end
    button.name = "episode" .. id
    button:setEpisode(id, episode)
    button.returnValue = "GOTO_LEVEL_SELECTION"
    button.disabledReturnValue = "LOCKED_LEVEL_SELECTION"
    if id == 1 then
      self.reference_button = button
    end
    return button
  end
  function EpisodeScrollFrame:layout()
    local border = 0
    if g_use_scroll_buttons then
      border, _ = _G.res.getSpriteBounds("BUTTON_ARROW_LEFT") + g_layoutMargin.x, nil
    end
    local slots = self:numVisibleSlots()
    local slot_width = screenWidth / 2
    local anchors = {}
    for i = 1, #self.episodes + extraButtons do
      _G.table.insert(anchors, i, {
        x = (i - 1) * slot_width,
        y = 0
      })
    end
    self:setAnchors(anchors)
    self:setCurrentAnchor(_G.math.min(self.currentSelection, #self.anchors))
    ui.ScrollFrame.layout(self)
    local buttonIndex = 1
    if g_hasWebBrowser then
      local _ENV = _G.getfenv(1)
      local pages = g_extra_pages.pre
      for i = 1, #pages do
        if pages[i].condition and _ENV[pages[i].condition] or not pages[i].condition then
          local button = self:getChild(pages[i].name)
          button.x = pages[i].x and pages[i].x * screenWidth or _G.math.floor(buttonIndex * slot_width + border)
          button.y = pages[i].y and pages[i].y * screenHeight or screenHeight * 0.5
          if buttonIndex == self.currentSelection then
            button:setEnabled(true)
          else
            button:setEnabled(false)
          end
          button.disabledReturnValue = "SCROLL"
          if not pages[i].noNewPage then
            buttonIndex = buttonIndex + 1
          end
        end
      end
    end
    local epBegin, epEnd, epStep = 1, #self.episodes, 1
    if g_episodesBackwards then
      epBegin, epEnd, epStep = #self.episodes, 1, -1
    end
    for i = epBegin, epEnd, epStep do
      local episodeBox = self:getChild("episode" .. self.episodes[i])
      episodeBox.x = _G.math.floor(buttonIndex * slot_width + border)
      episodeBox.y = screenHeight * 0.5
      if buttonIndex == self.currentSelection then
        episodeBox:setEnabled(true)
      else
        episodeBox:setEnabled(false)
      end
      episodeBox.disabledReturnValue = "SCROLL"
      buttonIndex = buttonIndex + 1
    end
    if g_hasWebBrowser then
      local _ENV = _G.getfenv(1)
      local pages = g_extra_pages.post
      for i = 1, #pages do
        if pages[i].condition and _ENV[pages[i].condition] or not pages[i].condition then
          local button = self:getChild(pages[i].name)
          button.x = pages[i].x and pages[i].x * screenWidth or _G.math.floor(buttonIndex * slot_width + border)
          button.y = pages[i].y and pages[i].y * screenHeight or screenHeight * 0.5
          if buttonIndex == self.currentSelection then
            button:setEnabled(true)
          else
            button:setEnabled(false)
          end
          button.disabledReturnValue = "SCROLL"
          if not pages[i].noNewPage then
            buttonIndex = buttonIndex + 1
          end
        end
      end
    end
    self:refreshVisibleChildren()
  end
  SeasonsEpisodeButton = EpisodeButton:inherit()
  function SeasonsEpisodeButton:init()
    EpisodeButton.init(self)
    if gameCenterSupported or not releaseBuild then
      local leaderboard_meter = ui.Image:new()
      leaderboard_meter.name = "leaderboard_meter"
      leaderboard_meter:setImage("GLOBAL_METER_BG")
      self:addChild(leaderboard_meter)
      local leaderboard_meter_indicator = ui.Image:new()
      leaderboard_meter_indicator.name = "leaderboard_meter_indicator"
      leaderboard_meter_indicator:setImage("GLOBAL_METER_INDICATOR")
      self:addChild(leaderboard_meter_indicator)
    end
  end
  function SeasonsEpisodeButton:layout()
    EpisodeButtonBase.layout(self)
    local positions = {y = 0.315, x = 0.2}
    local score_box = self:getChild("score_box")
    local star_box = self:getChild("star_box")
    local score = self:getChild("score")
    local stars = self:getChild("stars")
    local bg_w, bg_h = _G.res.getSpriteBounds(self.reference_button and self.reference_button.image or self.image)
    local box_w, star_box_h = _G.res.getSpriteBounds(star_box.image)
    local _, score_box_h = _G.res.getSpriteBounds(score_box.image)
    setFont(score.font)
    local font_adjust, font_adjust2
    local fh = _G.res.getFontLeading()
    local font_profile = selectFontProfile()
    font_adjust = star_box_h * 0.25
    font_adjust2 = 0
    if deviceModel == "android" and screenHeight < 320 then
      font_adjust = star_box_h * 0.15
      font_adjust2 = font_adjust * -0.1
    end
    local featherBoxOffset = 20
    local starTextPosOffset = 0
    local featherScoreTextPosOffset = 14
    local featherSpriteOffset = 0
    local scoreTextOffsetY = 0
    local boxOffsetY = 0
    if screenHeight == 240 then
      featherBoxOffset = 7
      starTextPosOffset = 3
    elseif screenHeight == 320 then
      featherBoxOffset = 10
    elseif screenHeight == 1536 or screenHeight == 1062 then
      featherScoreTextPosOffset = 22
      featherSpriteOffset = 10
      scoreTextOffsetY = 10
      starTextPosOffset = 10
    end
    star_box.y = bg_h * positions.y + scoreTextOffsetY
    star_box.x = bg_w * positions.x + starTextPosOffset
    score_box.y = star_box.y
    score_box.x = -star_box.x + starTextPosOffset
    stars.y = star_box.y + font_adjust + scoreTextOffsetY
    stars.x = star_box.x
    score.y = score_box.y + font_adjust + scoreTextOffsetY
    score.x = score_box.x
    if self:showEagleScoreElements() then
      do
        local feather_box = self:getChild("feather_box")
        local feather_score = self:getChild("feather_score")
        local feather_box_h = 1
        feather_box.x = box_w
        feather_box.y = bg_h * 0.5 - featherBoxOffset
        feather_box.w = _G.math.floor(bg_w * 0.25)
        feather_box.h = _G.math.floor(bg_h / 20)
        feather_score.x = feather_box.w * 0.3
        feather_score.y = feather_box.y + font_adjust2 + featherScoreTextPosOffset
        local feather_sprite = g_episodes[self.meta].mightyPower and g_episodes[self.meta].mightyPower.episodeSelectionFeather or "EPISODE_SELECTION_FEATHER"
        local borderSprites = {}
        borderSprites.left = "EPISODE" .. g_episodes[self.meta].featherBoxIdentifier .. "_LEFT"
        borderSprites.right = "EPISODE" .. g_episodes[self.meta].featherBoxIdentifier .. "_RIGHT"
        borderSprites.center = "EPISODE" .. g_episodes[self.meta].featherBoxIdentifier .. "_CENTER"
        borderSprites.bottomRight = "EPISODE" .. g_episodes[self.meta].featherBoxIdentifier .. "_BOTTOM_RIGHT"
        borderSprites.bottomMiddle = "EPISODE" .. g_episodes[self.meta].featherBoxIdentifier .. "_BOTTOM_MIDDLE"
        borderSprites.bottomLeft = "EPISODE" .. g_episodes[self.meta].featherBoxIdentifier .. "_BOTTOM_LEFT"
        function feather_box.draw(parent, parent_x, parent_y, xScale, yScale, angle, hs)
          drawBox(borderSprites, "SHEET_1", parent_x + feather_box.x, parent_y + feather_box.y, feather_box.w, feather_box.h, "HCENTER", "TOP", nil)
          _G.res.drawSprite(feather_sprite, (parent_x + feather_box.x - feather_box.w * 0.3) / xScale, (parent_y + featherSpriteOffset + feather_box.y - feather_box.h * 0.25) / yScale)
        end
      end
    end
    if gameCenterSupported or not releaseBuild then
      local meter = self:getChild("leaderboard_meter")
      local meter_w, meter_h = _G.res.getSpriteBounds(meter.image)
      local meter_px, meter_py = _G.res.getSpritePivot(meter.image)
      local indicator = self:getChild("leaderboard_meter_indicator")
      meter.x = -bg_w / 2
      meter.y = meter_py - meter_h / 2
      indicator.x = meter.x
      indicator.y = meter.y
      if self.leaderboard_position then
        indicator.y = indicator.y - self.leaderboard_position * meter_h * 0.65
      end
    end
  end
  function SeasonsEpisodeButton:onEntry()
    EpisodeButtonBase.onEntry(self)
    local stars, total_stars = calculateEpisodeStars(self.episode)
    local star_counter = self:getChild("stars")
    star_counter.text = stars .. "/" .. total_stars
    local total_score = calculateEpisodeScore(self.episode)
    local score = self:getChild("score")
    score.text = _G.string.format("%d", total_score)
    self:getChild("feather_box"):setVisible(self:showEagleScoreElements())
    self:getChild("feather_score"):setVisible(self:showEagleScoreElements())
    if self:showEagleScoreElements() then
      local feathers, total_feathers = calculateFeatherScore(self.episode)
      local feather_score = self:getChild("feather_score")
      feather_score.text = feathers .. "/" .. total_feathers
    end
    if gameCenterSupported or not releaseBuild then
      self:getChild("leaderboard_meter"):setVisible(true)
      if gameCenterEnabled and leaderboards then
        local lboardId = leaderboards[getLeaderboardNameForEpisode(self.episode)]
        local lboard = gameCenter.leaderboards[lboardId]
        self.leaderboard_position = 0
        if lboard ~= nil and lboard.range ~= nil and lboard.range > 1 and lboard.localRank ~= nil and 0 < lboard.localRank then
          local range, rank = lboard.range - 1, lboard.localRank - 1
          self.leaderboard_position = (range - rank) / range
        end
        self:getChild("leaderboard_meter_indicator"):setVisible(true)
      else
        self:getChild("leaderboard_meter_indicator"):setVisible(false)
      end
    end
    if pc_profile then
      self:getChild("feather_box"):setVisible(false)
      self:getChild("feather_score"):setVisible(false)
    end
  end
  function SeasonsEpisodeButton:showEagleScoreElements()
    return true
  end
end
filename = "seasons_episode_selection.lua"
