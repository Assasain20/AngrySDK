SeasonsLevelSelection = LevelSelection:inherit()
function SeasonsLevelSelection:init()
  LevelSelection.init(self)
  self.name = "levelSelection" .. _G.tostring(g_episodes[self.episode].name)
end
function SeasonsLevelSelection:draw(x, y)
  self:drawBackground()
  ui.Frame.draw(self, x, y)
end
function SeasonsLevelSelection:prepareForDynamicAssets()
  dynamic.setRequirements(self, g_episodes[self.episode].dynamic_load_group)
end
function SeasonsLevelSelection:drawBackground()
  if g_episodes[self.episode].background_image then
    local w, h = _G.res.getSpriteBounds(g_episodes[self.episode].background_image)
    local scale = _G.math.max(screenWidth / w, screenHeight / h)
    setRenderState(0, 0, scale, scale, 0, 0, 0)
    _G.res.drawSprite(g_episodes[self.episode].background_image, screenWidth / 2 / scale, screenHeight / scale, "HCENTER", "BOTTOM")
    setRenderState(0, 0, 1, 1, 0, 0, 0)
  end
end
function SeasonsLevelSelection:onPointerEvent(eventType, x, y)
  if self.discardEvents then
    return
  end
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "EPISODE_SELECTION" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = self.exit_link,
      from = "LEVEL_SELECTION"
    })
  elseif result == "GOTO_INTEL_SELECTION" then
    _G.res.playAudio("menu_confirm", 1, false)
    eventManager:queueEvent({
      id = events.EID_CHANGE_SCENE,
      target = "LEVEL_SELECTION_" .. meta,
      from = "LEVEL_SELECTION"
    })
    settingsWrapper:setGoldenEggPlayed("Level_Intel")
  elseif result == "CHECK_LEVEL_AVAILABLE" then
    if not self.levelCheckSystem then
      local calendar_meta = {
        level = meta.level,
        episode = meta.episode,
        year = g_episodes[meta.episode].pages[meta.page].calendar.year,
        month = g_episodes[meta.episode].pages[meta.page].calendar.month
      }
      self.levelCheckSystem = subsystems.CalendarSubsystem:new({
        data = calendar_meta,
        success_event = {
          id = events.EID_ANIMATE_LEVEL_BUTTON,
          data = meta,
          from = "LEVEL_SELECTION"
        }
      })
    end
  elseif result == "ANIMATE_LEVEL_BUTTON" then
    local level_event
    if not meta.intro_cutscene then
      level_event = {
        id = events.EID_CHANGE_LEVEL,
        data = meta,
        from = "LEVEL_SELECTION"
      }
    else
      level_event = {
        id = events.EID_LOAD_INTRO_CUTSCENE,
        cutscene = meta.intro_cutscene,
        data = meta
      }
    end
    if allowedToPlay(meta) then
      settingsWrapper:setCurrentEpisode(meta.episode)
      eventManager:notify({
        id = events.EID_ANIMATE_LEVEL_BUTTON,
        data = meta,
        from = "LEVEL_SELECTION"
      })
    else
      eventManager:notify({
        id = events.EID_SHOW_REGISTRATION_DIALOG,
        from = "LEVEL_SELECTION",
        success_event = level_event
      })
    end
  elseif result == "GOTO_LEVEL" then
    local level_event
    if not meta.intro_cutscene then
      level_event = {
        id = events.EID_CHANGE_LEVEL,
        data = meta,
        from = "LEVEL_SELECTION"
      }
    else
      level_event = {
        id = events.EID_LOAD_INTRO_CUTSCENE,
        cutscene = meta.intro_cutscene,
        data = meta
      }
    end
    if allowedToPlay(meta) then
      settingsWrapper:setCurrentEpisode(meta.episode)
      eventManager:notify(level_event)
    else
      eventManager:notify({
        id = events.EID_SHOW_REGISTRATION_DIALOG,
        from = "LEVEL_SELECTION",
        success_event = level_event
      })
    end
  elseif result == "DISABLED_LEVEL" then
    if g_episodes[meta.episode].pages[meta.page].levels[meta.level].hint then
      eventManager:notify({
        id = events.EID_PUSH_FRAME,
        target = GoldenEggHintPopup:new(g_episodes[meta.episode].pages[meta.page].levels[meta.level].hint)
      })
    end
  elseif result == "GOTO_FACEBOOK_CONNECT" then
    eventManager:notify({
      id = events.EID_GOTO_FACEBOOK_CONNECT
    })
  elseif result == "GOTO_SOCIAL" then
    eventManager:notify({
      id = events[meta.event]
    })
  elseif result == "EXIT" then
    eventManager:notify({
      id = events.EID_EXIT_GAME
    })
  elseif result == "SHOW_FACEBOOK_PROMPT" then
    eventManager:notify({
      id = events.EID_PUSH_FRAME,
      target = ui.Prompt:new({
        title = "TEXT_FB_LEVELS_HINT_TITLE",
        content = "TEXT_FB_LEVELS_HINT"
      })
    })
  elseif result == "SHOW_TWITTER_PROMPT" then
    eventManager:notify({
      id = events.EID_PUSH_FRAME,
      target = ui.Prompt:new({
        title = "TEXT_FB_LEVELS_HINT_TITLE",
        content = "TEXT_TWITTER_LEVELS_HINT"
      })
    })
  elseif result == "SHOW_QZONE_PROMPT" then
    eventManager:notify({
      id = events.EID_PUSH_FRAME,
      target = ui.Prompt:new({
        title = "TEXT_FB_LEVELS_HINT_TITLE",
        content = "TEXT_QZONE_LEVELS_HINT"
      })
    })
  elseif result == "GOTO_VIDEO_LINK" then
    eventManager:notify({
      id = events.EID_VIDEO_LINK_CLICKED,
      link = meta.link
    })
  elseif result == "SCROLL_LEFT" then
    self:getChild("levelButtons"):previous()
  elseif result == "SCROLL_RIGHT" then
    self:getChild("levelButtons"):next()
  end
  return result, meta, item
end
function SeasonsLevelSelection:onKeyEvent(eventType, key)
  if self.discardEvents then
    return
  end
  LevelSelection.onKeyEvent(self, eventType, key)
end
function SeasonsLevelSelection:update(dt, time)
  LevelSelection.update(self, dt, time)
  if self.levelCheckSystem and self.levelCheckSystem:update() then
    self.levelCheckSystem = nil
  end
end
function allowedToPlay(meta)
  if g_is_free_version or g_registrationEnabled and not g_isRegistered then
    return g_episodes[meta.episode].pages[meta.page].levels[meta.level].free_to_play
  end
  return true
end
function LevelScrollFrame:init()
  self.visible_children = {}
  self.visible_images = {}
  self.visible_text = {}
  self.eventTimer = subsystems.Timer.new(g_time or 0)
  local pages = g_episodes[self.episode].pages
  for i = 1, #g_episodes[self.episode].pages do
    local page = pages[i]
    g_ls_layout_mapping[page.layout].createPage(self, page)
    for _, v in _G.ipairs(page.levels) do
      self:addChild(g_ls_layout_mapping[page.layout].createLevelButton(v))
    end
    if g_ls_layout_mapping[page.layout].onPageCreated then
      g_ls_layout_mapping[page.layout].onPageCreated(self, page)
    end
    if page.locked then
      local coming_soon = ui.Image:new()
      coming_soon.name = "coming_soon" .. i
      coming_soon:setImage("LS_COMING_SOON")
      self:addChild(coming_soon)
    end
  end
  ui.ScrollFrame.init(self)
end
filename = "seasons_level_selection.lua"
