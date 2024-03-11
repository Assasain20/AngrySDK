function isEpisodeCompleted(episode)
  for i = 1, #episode.pages do
    for j = 1, #episode.pages[i].levels do
      if episode.pages[i].levels[j].episode_end == true then
        return isLevelCompleted(episode.pages[i].levels[j].name)
      end
    end
  end
  return false
end
function isLevelCompleted(levelName)
  return highscores ~= nil and highscores[levelName] ~= nil and highscores[levelName].completed
end
filename = "level_utils.lua"
