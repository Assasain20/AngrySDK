function createMenuLinks()
  local main_menu = SeasonsMainMenu:new({forcePlayButtonImage = true})
  mainMenuParticleSystem = MainMenuParticleSystem:new()
  local seasons = {}
  for _, v1 in _G.pairs(g_episodeIds) do
    if not contains(seasons, g_episodes[v1].season) and g_episodes[v1].season ~= nil then
      seasons[#seasons + 1] = g_episodes[v1].season
      local episodes = {}
      for _, v2 in _G.pairs(g_episodeIds) do
        if g_episodes[v2].season == g_episodes[v1].season then
          episodes[#episodes + 1] = v2
        end
      end
      local episode_selection = SeasonsEpisodeSelection:new({
        season = #seasons,
        seasonName = g_episodes[v1].season,
        episodes = episodes
      })
      menuManager:addLink("SEASON_" .. g_episodes[v1].season, episode_selection)
    end
  end
  local season_selection = SeasonSelection:new({seasons = seasons})
  menuManager:addLink("MAIN_MENU", main_menu)
  menuManager:addLink("PLAY", season_selection)
  menuManager:addLink("EXIT_EPISODE_SELECTION", season_selection)
  menuManager:addLink("CREDITS", Credits:new())
  for _, v in _G.pairs(g_episodeIds) do
    local ls
    if g_episodes[v].level_selection_subclass then
      local _ENV = _G.getfenv(1)
      ls = _ENV[g_episodes[v].level_selection_subclass]:new({
        episode = v,
        exit_link = "SEASON_" .. g_episodes[v].season
      })
    else
      ls = SeasonsLevelSelection:new({
        episode = v,
        exit_link = g_episodes[v].exit_link_override or "SEASON_" .. g_episodes[v].season
      })
    end
    menuManager:addLink("LEVEL_SELECTION_" .. v, ls)
  end
end
function startMenuFlow()
  eventManager:notify({
    id = events.EID_CHANGE_SCENE,
    target = "MAIN_MENU",
    from = "BOOT"
  })
end
filename = "menu_flow.lua"
