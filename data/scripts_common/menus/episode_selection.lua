EpisodeSelection = LevelSelectionRoot:inherit()
local pc_profile = deviceModel == "windows" or deviceModel == "osx" or deviceModel == "roku" or deviceModel == "freebox"
local g_use_scroll_buttons = true
local g_use_new_layout = true
extraButtons = 0
function calculateExtraButtonAmount()
  local buttons = 0
  local _ENV = _G.getfenv(1)
  for _, v in _G.pairs(g_extra_pages) do
    for j = 1, #v do
      if (v[j].condition and _ENV[v[j].condition] or not v[j].condition) and not v[j].noNewPage then
        buttons = buttons + 1
      end
    end
  end
  extraButtons = buttons
end
if g_hasWebBrowser then
  calculateExtraButtonAmount()
end
episodeNumberOffset = 0
function EpisodeSelection:init()
  local episodeButtons = EpisodeScrollFrame:new({
    episodes = self.episodes
  })
  episodeButtons.name = "episodeButtons"
  self:addChild(episodeButtons)
  if deviceModel == "android" and isHDVersion and not isPremium then
    local giftButton = ui.ImageButton:new()
    giftButton.name = "giftButton"
    if iOS then
      giftButton:setImage("BUTTON_GIFT_APP")
      giftButton.returnValue = "GOTO_GIFT_PURCHASE"
    end
    if deviceModel == "android" and isHDVersion and not isPremium then
      giftButton:setImage("BTN_ADFREE")
      giftButton.returnValue = "GOTO_LENOVO_ADFREE"
    end
    giftButton.attach = "fixed"
    self:addChild(giftButton)
  end
  self:createDecorationSprites()
  local backButton = ui.ImageButton:new()
  backButton.name = "backButton"
  backButton:setImage("ARROW_LEFT")
  backButton.returnValue = "GOTO_MAIN_MENU"
  backButton.attach = "fixed"
  backButton.activateOnRelease = true
  backButton.clickSound = "menu_back"
  self:addChild(backButton)
  self.currentSelection = settingsWrapper:getSelectedEpisode() - episodeNumberOffset
  if self.currentSelection < 1 then
    self.currentSelection = 1
    settingsWrapper:setSelectedEpisode(self.currentSelection + episodeNumberOffset)
  elseif self.currentSelection > #self.episodes + extraButtons then
    self.currentSelection = #self.episodes + extraButtons
    settingsWrapper:setSelectedEpisode(self.currentSelection + episodeNumberOffset)
  end
  episodeButtons.currentSelection = self.currentSelection
  self.backgroundColour = {
    r = 11,
    g = 101,
    b = 76,
    a = 255
  }
  LevelSelectionRoot.init(self)
  self.name = "episodeSelectionRoot"
  if g_use_scroll_buttons then
    local left_button = ui.ImageButton:new()
    left_button.name = "left_button"
    left_button:setImage("BUTTON_ARROW_LEFT")
    left_button.returnValue = "SCROLL_LEFT"
    self:addChild(left_button)
    episodeButtons.left_button = left_button
    local right_button = ui.ImageButton:new()
    right_button.name = "right_button"
    right_button:setImage("BUTTON_ARROW_RIGHT")
    right_button.returnValue = "SCROLL_RIGHT"
    self:addChild(right_button)
    episodeButtons.right_button = right_button
  end
  if eventManager then
    eventManager:addEventListener(events.EID_SCROLL_TO_EPISODE, self)
  end
end
function EpisodeSelection:onKeyEvent(eventType, key)
  local result, meta, item = ui.Frame.onKeyEvent(self, eventType, key)
  if not result and eventType == "RELEASE" and (key == "BACK" or key == "ESCAPE") then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "EXIT_EPISODE_SELECTION",
      from = "EPISODE_SELECTION"
    })
  end
  return result, meta, item
end
function EpisodeSelection:onPointerEvent(eventType, x, y)
  local result, meta, item = LevelSelectionRoot.onPointerEvent(self, eventType, x, y)
  if result == "GOTO_MAIN_MENU" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = "EXIT_EPISODE_SELECTION",
      from = "EPISODE_SELECTION"
    })
  elseif result == "GOTO_LEVEL_SELECTION" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:queueEvent({
      id = events.EID_CHANGE_SCENE,
      target = "LEVEL_SELECTION_" .. meta,
      from = "EPISODE_SELECTION"
    })
  elseif result == "LOCKED_LEVEL_SELECTION" then
    _G.res.playAudio("menu_confirm", 1, false)
    local level_event = {
      id = events.EID_CHANGE_SCENE,
      target = "LEVEL_SELECTION_" .. meta,
      from = "EPISODE_SELECTION"
    }
    eventManager:notify({
      id = events.EID_SHOW_REGISTRATION_DIALOG,
      from = "LEVEL_SELECTION",
      success_event = level_event
    })
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
  elseif result == "GOTO_SEASONS" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_SEASONS_CLICKED
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
  elseif result == "GOTO_ALEX_LINK" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_ALEX_CLICKED
    })
  elseif result == "GOTO_PIGGIES_LINK" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_PIGGIES_CLICKED
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
  elseif result == "GOTO_MAGIC_MAP" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:notify({
      id = events.EID_MAGIC_PLACES_CLICKED,
      from = "episode selection"
    })
  end
  return result, meta, item
end
function EpisodeSelection:eventTriggered(event)
  if event.id == events.EID_SCROLL_TO_EPISODE then
    local scroll = self:getChild("episodeButtons")
    scroll.autoscroll_on_entry = true
    scroll.scroll_to_episode = event.targetEpisode
  end
end
function EpisodeSelection:createDecorationSprites()
  local left = ui.Image:new()
  left.name = "left"
  left:setImage("LS_MAIN_LEFT")
  left.attach = "fixed"
  self:addChild(left)
  local right = ui.Image:new()
  right.name = "right"
  right:setImage("LS_MAIN_RIGHT")
  right.attach = "fixed"
  self:addChild(right)
end
function EpisodeSelection:update(dt, time)
  LevelSelectionRoot.update(self, dt, time)
  if g_challengesEnabled then
    local unviewedChallengesCount = getUnviewedChallengesCount()
    local challengeButton = self:getChild("challengeButton")
    challengeButton:setUnviewedChallengesCount(unviewedChallengesCount)
    challengeButton.timer = challengeButton.timer + dt * 3
    local newChallengesText = self:getChild("newChallengesText")
    local challengeImage = self:getChild("challengeImage")
    newChallengesText.scaleY = 0.7 + _G.math.sin(challengeButton.timer) * 0.15
    newChallengesText.scaleX = 0.7 + _G.math.sin(challengeButton.timer) * 0.15
    challengeImage.scaleX = 1 + _G.math.sin(challengeButton.timer) * 0.15
    challengeImage.scaleY = 1 + _G.math.sin(challengeButton.timer) * 0.15
  end
  self:updateSelection()
end
function EpisodeSelection:updateSelection(initial_selection)
  local new_index = self.currentSelection
  if not initial_selection then
    new_index = self:getChild("episodeButtons"):getCurrentAnchor()
  end
  if self.currentSelection ~= new_index or initial_selection then
    settingsWrapper:setSelectedEpisode(new_index + episodeNumberOffset)
    self.currentSelection = new_index
    self:getChild("episodeButtons").currentSelection = new_index
    self:getChild("left_button"):setVisible(new_index > 1)
    visibleSlots = self:getChild("episodeButtons"):numVisibleSlots()
    self:getChild("right_button"):setVisible(new_index <= #self.episodes + extraButtons - visibleSlots and visibleSlots < #self.episodes + extraButtons)
  end
end
function EpisodeSelection:onEntry()
  self:updateSelection(true)
  LevelSelectionRoot.onEntry(self)
end
function EpisodeSelection:draw(x, y)
  drawLevelSelectionBackground()
  ui.Frame.draw(self, x, y)
end
function EpisodeSelection:layout()
  setFont(fontBasic)
  local left = self:getChild("left")
  left.x = 0
  left.y = screenHeight
  local right = self:getChild("right")
  right.x = screenWidth
  right.y = screenHeight
  local back_button = self:getChild("backButton")
  back_button:refresh()
  back_button.x = back_button.w * 0.5 + g_layoutMargin.x
  back_button.y = screenHeight - back_button.h * 0.5 - g_layoutMargin.y
  if deviceModel == "roku" then
    back_button.y = back_button.h * 0.5 + g_layoutMargin.y
  end
  local giftButton = self:getChild("giftButton")
  if giftButton ~= nil then
    local giftButtonWidth, giftButtonHeight = _G.res.getSpriteBounds(giftButton.image)
    giftButton.x = _G.math.floor(screenWidth - giftButtonWidth * 0.5 - g_layoutMargin.x)
    giftButton.y = _G.math.floor(giftButtonHeight * 0.5 + g_layoutMargin.y)
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
  self:updateSelection(self.currentSelection)
  LevelSelectionRoot.layout(self)
end
EpisodeScrollFrame = ui.ScrollFrame:inherit()
function EpisodeScrollFrame:init()
  self:createButtons()
  if eventManager then
    eventManager:addEventListener(events.EID_EPISODE_EXTRAS_CHANGED, self)
  end
  ui.ScrollFrame.init(self)
end
function EpisodeScrollFrame:eventTriggered(event)
  if event.id == events.EID_EPISODE_EXTRAS_CHANGED then
    calculateExtraButtonAmount()
    self:removeAllChildren()
    self:createButtons()
    for _, v in _G.pairs(self.episodes) do
      self:getChild("episode" .. v):setOpen(isEpisodeOpen(v))
    end
  end
end
function EpisodeScrollFrame:createButtons()
  local episodeButtons = {}
  self.slots = {}
  self.visible_children = {}
  local slotIndex = 1
  self.eventTimer = subsystems.Timer.new(g_time or 0)
  if g_hasWebBrowser then
    local _ENV = _G.getfenv(1)
    local pages = g_extra_pages.pre
    for i = 1, #pages do
      if pages[i].condition and _ENV[pages[i].condition] or not pages[i].condition then
        local button = ui.ImageButton:new()
        button.name = pages[i].name
        button:setImage(pages[i].image)
        button.returnValue = pages[i].returnValue
        button.activateOnRelease = true
        self:addChild(button)
        if not self.slots[slotIndex] then
          self.slots[slotIndex] = {
            pages[i].name
          }
        else
          self.slots[slotIndex][#self.slots[slotIndex] + 1] = pages[i].name
        end
        if not pages[i].noNewPage then
          slotIndex = slotIndex + 1
        end
      end
    end
  end
  local epBegin, epEnd, epStep = 1, #self.episodes, 1
  if g_episodesBackwards then
    epBegin, epEnd, epStep = #self.episodes, 1, -1
  end
  for i = epBegin, epEnd, epStep do
    self.slots[slotIndex] = {
      "episode" .. self.episodes[i]
    }
    slotIndex = slotIndex + 1
  end
  for _, v in _G.pairs(self.episodes) do
    episodeButtons[v] = self:createEpisodeButton(v, g_episodes[v])
  end
  if g_hasWebBrowser then
    local _ENV = _G.getfenv(1)
    local pages = g_extra_pages.post
    for i = 1, #pages do
      if pages[i].condition and _ENV[pages[i].condition] or not pages[i].condition then
        local button = ui.ImageButton:new()
        button.name = pages[i].name
        button:setImage(pages[i].image)
        button.returnValue = pages[i].returnValue
        button.activateOnRelease = true
        self:addChild(button)
        if not self.slots[slotIndex] then
          self.slots[slotIndex] = {
            pages[i].name
          }
        else
          self.slots[slotIndex][#self.slots[slotIndex] + 1] = pages[i].name
        end
        if not pages[i].noNewPage then
          slotIndex = slotIndex + 1
        end
      end
    end
  end
  local w, h = self:getEpisodeButtonDimensions()
  for _, v in _G.pairs(episodeButtons) do
    v.width = w
    v.height = h
    v.reference_button = self.reference_button
    self:addChild(v)
  end
end
function EpisodeScrollFrame:createEpisodeButton(id, episode)
  local button
  if id == "G" then
    button = GoldenEggButton:new()
  else
    button = EpisodeButton:new()
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
if g_isAccelerometerControl then
  function EpisodeScrollFrame:wheel(direction)
    if direction > 0 then
      self.left_button:onMouseEnter()
      self.eventTimer:once(nil, function()
        self.left_button:onMouseLeave()
      end, 0.15)
    elseif direction < 0 then
      self.right_button:onMouseEnter()
      self.eventTimer:once(nil, function()
        self.right_button:onMouseLeave()
      end, 0.15)
    end
    return ui.ScrollFrame.wheel(self, direction)
  end
end
function EpisodeScrollFrame:getEpisodeButtonDimensions()
  local biggestEpisodeImageW = 0
  local biggestEpisodeImageH = 0
  local biggestTextW = 0
  setFont(fontBasic)
  for _, v in _G.pairs(g_episodes) do
    local w, h = _G.res.getSpriteBounds(v.icon)
    if biggestEpisodeImageW < w then
      biggestEpisodeImageW = w
    end
    if biggestEpisodeImageH < h then
      biggestEpisodeImageH = h
    end
    w = _G.res.getStringWidth(v.name)
    if biggestTextW < w then
      biggestTextW = w
    end
  end
  return _G.math.max(biggestTextW * 0.8, biggestEpisodeImageW * 0.95), biggestEpisodeImageH * 1.7
end
function EpisodeScrollFrame:setEnabledSlot(index)
  self.enabled_slot = index
end
function EpisodeScrollFrame:onEntry()
  local loadedExtraButtonAmount = extraButtons
  calculateExtraButtonAmount()
  if loadedExtraButtonAmount ~= extraButtons then
    self:removeAllChildren()
    self:createButtons()
  end
  for _, v in _G.pairs(self.episodes) do
    self:getChild("episode" .. v):setOpen(isEpisodeOpen(v))
  end
  ui.ScrollFrame.onEntry(self)
  self:refreshVisibleChildren()
end
function EpisodeScrollFrame:layout()
  local border = 0
  if g_use_scroll_buttons then
    border, _ = _G.res.getSpriteBounds("BUTTON_ARROW_LEFT") + g_layoutMargin.x, nil
  end
  local slots = self:numVisibleSlots()
  local slot_width = (screenWidth - border * 2) / slots
  self.clip = {
    x = border,
    y = 0,
    w = screenWidth - border * 2,
    h = screenHeight
  }
  local anchors = {}
  for i = 1, #self.episodes + extraButtons - slots + 1 do
    _G.table.insert(anchors, i, {
      x = (i - 1) * slot_width,
      y = 0
    })
  end
  self:setAnchors(anchors)
  self:setCurrentAnchor(_G.math.min(self.currentSelection, #self.anchors))
  ui.ScrollFrame.layout(self)
  local buttonIndex = 0.5
  if g_hasWebBrowser then
    local _ENV = _G.getfenv(1)
    local pages = g_extra_pages.pre
    for i = 1, #pages do
      if pages[i].condition and _ENV[pages[i].condition] or not pages[i].condition then
        local button = self:getChild(pages[i].name)
        button.x = pages[i].x and pages[i].x * screenWidth or _G.math.floor(buttonIndex * slot_width + border)
        button.y = pages[i].y and pages[i].y * screenHeight or screenHeight * 0.5
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
        if not pages[i].noNewPage then
          buttonIndex = buttonIndex + 1
        end
      end
    end
  end
  self:refreshVisibleChildren()
end
function EpisodeScrollFrame:numVisibleSlots()
  local border = 0
  if g_use_scroll_buttons then
    border = _G.res.getSpriteBounds("BUTTON_ARROW_LEFT")
  end
  local bw, _ = _G.res.getSpriteBounds(g_episodes[1].button)
  if screenWidth > 480 and deviceModel ~= "iphone" then
    bw = bw * 1.1666666
  end
  local slots = _G.math.max(1, _G.math.floor((screenWidth - border * 2) / bw))
  slots = _G.math.min(#self.episodes + extraButtons, slots)
  return slots
end
function EpisodeScrollFrame:refreshVisibleChildren()
  local i = 1
  local Image_draw = ui.Image.draw
  local ImageButton_draw = ui.ImageButton.draw
  local Text_draw = ui.Text.draw
  local EpButton_draw = EpisodeButtonBase.draw
  local x = self:getCurrentX()
  local y = self:getCurrentY()
  for k, v in _G.ipairs(self.children) do
    if v.visible == true and v.x + x >= -screenWidth * 0.5 and v.x + x <= screenWidth * 1.5 then
      if v.draw == Image_draw or v.draw == ImageButton_draw or g_use_new_layout and v.draw == EpButton_draw then
        local vc = self.visible_children[i] or {}
        vc.x, vc.y, vc.item, vc.parent = x, y, v, nil
        self.visible_children[i] = vc
        i = i + 1
      end
      for k2, v2 in _G.ipairs(v.children) do
        if v2.visible then
          if v2.draw == Image_draw or v2.draw == ImageButton_draw then
            local vc = self.visible_children[i] or {}
            vc.x, vc.y, vc.item, vc.parent = v.x + x, v.y + y, v2, v
            self.visible_children[i] = vc
            i = i + 1
          end
          for k3, v3 in _G.ipairs(v2.children) do
            if v3.visible and (v3.draw == Image_draw or v3.draw == ImageButton_draw) then
              local vc = self.visible_children[i] or {}
              vc.x, vc.y, vc.item, vc.parent = v.x + v2.x + x, v.y + v2.y + y, v3, v2
              self.visible_children[i] = vc
              i = i + 1
            end
          end
        end
      end
    end
  end
  for k, v in _G.ipairs(self.children) do
    if v.visible == true and v.x + x >= -screenWidth * 0.5 and v.x + x <= screenWidth * 1.5 then
      for k2, v2 in _G.ipairs(v.children) do
        if v2.visible then
          if v2.draw == Text_draw then
            local vc = self.visible_children[i] or {}
            vc.x, vc.y, vc.item, vc.parent = v.x + x, v.y + y, v2, v
            self.visible_children[i] = vc
            i = i + 1
          end
          for k3, v3 in _G.ipairs(v2.children) do
            if v3.visible and v3.draw == Text_draw then
              local vc = self.visible_children[i] or {}
              vc.x, vc.y, vc.item, vc.parent = v.x + v2.x + x, v.y + v2.y + y, v3, v2
              self.visible_children[i] = vc
              i = i + 1
            end
          end
        end
      end
    end
  end
  self.visible_children[i] = nil
end
function EpisodeScrollFrame:update(dt, time)
  self.eventTimer:update(dt, time)
  local sx = self.scrollX
  ui.ScrollFrame.update(self, dt, time)
  if sx ~= self.scrollX then
    self:refreshVisibleChildren()
  end
  if self.autoscroll_on_entry then
    if self.scroll_to_episode == nil then
      self:next()
    else
      self:setTargetAnchor(self.scroll_to_episode)
      self.scroll_to_episode = nil
    end
    self.autoscroll_on_entry = nil
  end
end
local drawVisibleChild
if g_enableHoverScaling then
  function drawVisibleChild(item, x, y, parent)
    if parent == nil then
      item:drawSelf(x, y)
    else
      item:draw(x, y, 1, 1, 0, parent:hoverScale())
    end
  end
else
  function drawVisibleChild(item, x, y)
    if item.drawFast ~= nil then
      item:drawFast(x, y)
    elseif item.drawSelf ~= nil then
      item:drawSelf(x, y, 1, 1, 0)
    else
      item:draw(x, y, 1, 1, 0)
    end
  end
end
if deviceModel == "roku" then
  function EpisodeScrollFrame:draw(x, y, scaleX, scaleY, angle)
    x = x or 0
    y = y or 0
    x = x + self.scrollX
    y = y + self.scrollY
    scaleX = scaleX or 1
    scaleY = scaleY or 1
    angle = angle or 0
    x = _G.math.floor(x)
    y = _G.math.floor(y)
    if self.clip then
      _G.res.setClipRect(self.clip.x, self.clip.y, self.clip.w, self.clip.h)
    end
    for k, v in _G.ipairs(self.visible_children) do
      drawVisibleChild(v.item, v.x, v.y, v.parent)
    end
    if self.clip then
      _G.res.setClipRect(0, 0, screenWidth, screenHeight)
    end
  end
end
EpisodeButtonBase = ui.ImageButton:inherit()
function EpisodeButtonBase:init()
  ui.ImageButton.init(self)
  self.activateOnRelease = true
  local lock = ui.Image:new()
  lock.name = "lock"
  lock:setImage("LS_LEVEL_PACK_LOCK")
  lock:setVisible(false)
  self:addChild(lock)
end
function EpisodeButtonBase:setEpisode(id, episode)
  self.episode = id
  self.meta = id
end
function EpisodeButtonBase:setOpen(open)
  self.locked = not open
  self:setEnabled(open)
end
function EpisodeButtonBase:layout()
  ui.ImageButton.layout(self)
  local lock = self:getChild("lock")
  lock:setVisible(self.locked)
end
EpisodeButton = EpisodeButtonBase:inherit()
function EpisodeButton:init()
  local score_box = ui.Image:new()
  score_box.name = "score_box"
  score_box:setImage("EP_BTN_SCOREBOX")
  self:addChild(score_box)
  local score = ui.Text:new()
  score.name = "score"
  score.text = "0"
  score.font = "FONT_LS_SMALL"
  self:addChild(score)
  local star_box = ui.Image:new()
  star_box.name = "star_box"
  star_box:setImage("EP_BTN_STARBOX")
  self:addChild(star_box)
  local stars = ui.Text:new()
  stars.name = "stars"
  stars.text = ""
  stars.font = "FONT_LS_SMALL"
  self:addChild(stars)
  local feather_box = ui.Image:new()
  feather_box.name = "feather_box"
  feather_box:setImage("EP_BTN_EAGLEBOX")
  self:addChild(feather_box)
  local feather_score = ui.Text:new()
  feather_score.name = "feather_score"
  feather_score.text = "0"
  feather_score.font = "FONT_LS_SMALL"
  self:addChild(feather_score)
  if pc_profile then
    self:getChild("feather_box"):setVisible(false)
    self:getChild("feather_score"):setVisible(false)
  end
  EpisodeButtonBase.init(self)
end
function EpisodeButton:layout()
  EpisodeButtonBase.layout(self)
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
  if not showEagleScoreElements() then
    star_box.y = bg_h * 0.5 - star_box_h * 0.5 - (bg_w - box_w) * 0.5
    score_box.y = star_box.y - star_box_h * 0.5 - (bg_w - box_w) * 0.25 - score_box_h * 0.5
    stars.y = star_box.y + font_adjust
    score.y = score_box.y + font_adjust
  else
    local feather_box = self:getChild("feather_box")
    local feather_score = self:getChild("feather_score")
    local _, feather_box_h = _G.res.getSpriteBounds(feather_box.image)
    feather_box.y = bg_h * 0.5 - feather_box_h * 0.5 - (bg_w - box_w) * 0.5
    star_box.y = feather_box.y - feather_box_h * 0.5 - (bg_w - box_w) * 0.25 - star_box_h * 0.5
    score_box.y = star_box.y - star_box_h * 0.5 - (bg_w - box_w) * 0.25 - score_box_h * 0.5
    feather_score.x = box_w * 0.2
    feather_score.y = feather_box.y + font_adjust2
    stars.y = star_box.y + font_adjust
    score.y = score_box.y + font_adjust
  end
end
function EpisodeButton:onEntry()
  EpisodeButtonBase.onEntry(self)
  local stars, total_stars = calculateEpisodeStars(self.episode)
  local star_counter = self:getChild("stars")
  star_counter.text = stars .. "/" .. total_stars
  local total_score = calculateEpisodeScore(self.episode)
  local score = self:getChild("score")
  score.text = _G.string.format("%d", total_score)
  self:getChild("feather_box"):setVisible(showEagleScoreElements())
  self:getChild("feather_score"):setVisible(showEagleScoreElements())
  if showEagleScoreElements() then
    local feathers, total_feathers = calculateFeatherScore(self.episode)
    local feather_score = self:getChild("feather_score")
    feather_score.text = feathers .. "/" .. total_feathers
  end
  if pc_profile then
    self:getChild("feather_box"):setVisible(false)
    self:getChild("feather_score"):setVisible(false)
  end
end
function EpisodeButton:setEpisode(id, episode)
  EpisodeButtonBase.setEpisode(self, id, episode)
  self:setImage(g_episodes[id].button)
end
GoldenEggButton = EpisodeButtonBase:inherit()
function GoldenEggButton:init()
  local star_box = ui.Image:new()
  star_box.name = "star_box"
  star_box:setImage("EP_BTN_STARBOX")
  self:addChild(star_box)
  local stars = ui.Text:new()
  stars.name = "stars"
  stars.text = ""
  stars.font = "FONT_LS_SMALL"
  self:addChild(stars)
  EpisodeButtonBase.init(self)
end
function GoldenEggButton:layout()
  EpisodeButtonBase.layout(self)
  local star_box = self:getChild("star_box")
  local stars = self:getChild("stars")
  local bg_w, bg_h = _G.res.getSpriteBounds(self.image)
  local box_w, star_box_h = _G.res.getSpriteBounds(star_box.image)
  star_box.y = bg_h * 0.5 - star_box_h * 0.5 - (bg_w - box_w) * 0.5
  stars.y = star_box.y + star_box_h * 0.25
end
function GoldenEggButton:onEntry()
  EpisodeButtonBase.onEntry(self)
  local star_counter = self:getChild("stars")
  star_counter.text = "" .. calculateStarsFromGoldenEggLevels()
end
function GoldenEggButton:setEpisode(id, episode)
  EpisodeButtonBase.setEpisode(self, id, episode)
  self:setImage("BTN_GOLDENEGGS")
end
filename = "episode_selection.lua"
