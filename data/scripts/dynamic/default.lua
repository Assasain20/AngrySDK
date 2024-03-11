local default = {}
default.common = {
  "ACHIEVEMENTS",
  "BUTTONS",
  "GOLDEN_EGGS",
  "POPUPS",
  "CURSORS",
  "REWARDS"
}
default.mooncakePopup = {
  "LS_MOONCAKE"
}
default.splashes = {"SPLASHES"}
default.mainMenu = {
  "MENU",
  "INGAME",
  "MENU_LITE",
  "SPACE_ADS"
}
default.credits = default.mainMenu
default.seasonSelection = {"MENU", "INGAME"}
default.episodeSelection1 = {
  "MENU",
  "LEVELSELECTION"
}
default.episodeSelection2 = default.episodeSelection1
default.episodeSelection3 = default.episodeSelection1
default.liteSelection = {
  "LEVELSELECTION_LITE"
}
default.gameHud = {"BUTTONS", "TUTORIALS"}
default.ingame = {
  "INGAME",
  "INGAME_SCORES",
  "ADS"
}
default.levelComplete = {"MENU", "MENU_LITE"}
default.levelFailed = default.levelComplete
default.tutorials = {"TUTORIALS"}
default.mightyEagleDemoPage = {"MENU", "INGAME"}
default.levelSelectionHalloween = {
  "MENU",
  "LEVELSELECTION",
  "THEME_HALLOWEEN",
  "LS_HALLOWEEN"
}
default.levelSelectionXmas = {
  "MENU",
  "LEVELSELECTION",
  "LS_XMAS",
  "INGAME"
}
default.levelSelectionValentine = {
  "MENU",
  "LEVELSELECTION",
  "THEME_VALENTINE",
  "LS_VALENTINE"
}
default.levelSelectionStPatrick = {
  "MENU",
  "LEVELSELECTION",
  "THEME_STPATRICK",
  "LS_STPATRICK"
}
default.levelSelectionEaster = {
  "MENU",
  "LEVELSELECTION",
  "THEME_EASTER",
  "LS_EASTER"
}
default.levelSelectionSummer = {
  "MENU",
  "LEVELSELECTION",
  "LS_SUMMER"
}
default.levelSelectionMooncake = {
  "MENU",
  "LEVELSELECTION",
  "THEME_MOONCAKE",
  "LS_MOONCAKE"
}
default.levelSelectionHalloween2 = {
  "MENU",
  "LEVELSELECTION",
  "THEME_HALLOWEEN2011",
  "LS_HALLOWEEN2011"
}
default.levelSelectionXmas2 = {
  "MENU",
  "LEVELSELECTION",
  "LS_XMAS",
  "INGAME"
}
default.levelSelectionDragon = {
  "MENU",
  "LEVELSELECTION",
  "THEME_DRAGON",
  "LS_DRAGON"
}
default.levelSelectionCherry = {
  "MENU",
  "LEVELSELECTION",
  "THEME_CHERRY",
  "LS_CHERRY"
}
default.levelSelectionPiglantis = {
  "MENU",
  "LEVELSELECTION",
  "THEME_MOVIE",
  "LS_MOVIE"
}
default.levelSelectionSchool = {
  "MENU",
  "LEVELSELECTION",
  "THEME_SCHOOL",
  "LS_SCHOOL"
}
default.levelSelectionHalloween3 = {
  "MENU",
  "LEVELSELECTION",
  "THEME_HALLOWEEN2012",
  "LS_HALLOWEEN2012"
}
default.levelSelectionXmas3 = {
  "MENU",
  "LEVELSELECTION",
  "LS_XMAS",
  "INGAME"
}
default.levelSelectionIntel = {
  "MENU",
  "LEVELSELECTION",
  "THEME_INTEL",
  "LS_INTEL",
  "MENU_INTEL"
}
default.theme14Complete = {
  "MENU_HALLOWEEN"
}
default.themeValentineComplete = {
  "MENU_VALENTINE"
}
default.themeStPatrickComplete = {
  "MENU_STPATRICK"
}
default.themeEasterComplete = {
  "MENU_EASTER"
}
default.themeSummerComplete = {
  "MENU_SUMMER"
}
default.themeMooncakeComplete = {
  "MENU_MOONCAKE"
}
default.themeH2Complete = {
  "MENU_HALLOWEEN2011"
}
default.themeX2Complete = {
  "MENU_XMAS2012"
}
default.themeYDComplete = {
  "MENU_DRAGON"
}
default.themeCFComplete = {
  "MENU_CHERRY"
}
default.themeMOVComplete = {"MENU_MOVIE"}
default.themeH3Complete = {
  "MENU_HALLOWEEN2012"
}
for theme, id in _G.pairs({
  theme16 = "HALLOWEEN",
  theme17 = "XMAS",
  theme18 = "VALENTINE",
  theme19 = "STPATRICK",
  theme20 = "EASTER",
  theme21 = "SUMMER",
  theme22 = "SPACE",
  theme23 = "MOONCAKE",
  theme24 = "HALLOWEEN2011",
  theme25 = "XMAS2012",
  theme26 = "DRAGON",
  theme27 = "CHERRY",
  theme28 = "MOVIE",
  theme29 = "SCHOOL",
  theme30 = "HALLOWEEN2012",
  theme31 = "XMAS2013",
  theme32 = "INTEL",
  theme1 = "HALLOWEEN",
  theme16menu = "HALLOWEEN",
  theme24menu = "HALLOWEEN2011"
}) do
  default[theme] = {
    "THEME_" .. id
  }
  if id == "SPACE" then
    default[theme .. "_menu"] = {
      "MENU_SUMMER"
    }
  elseif id == "INTEL" then
    default[theme .. "_menu"] = {
      "MENU_XMAS2013"
    }
  else
    default[theme .. "_menu"] = {
      "MENU_" .. id
    }
  end
  if id == "XMAS" or id == "XMAS2012" or id == "XMAS2013" then
    default[theme .. "_menu_bg"] = {"LS_XMAS"}
  elseif id == "SUMMER" or id == "SPACE" then
    default[theme .. "_menu_bg"] = {"LS_SUMMER"}
  else
    default[theme .. "_menu_bg"] = {
      "THEME_" .. id
    }
  end
  if id ~= "XMAS" and id ~= "XMAS2012" and id ~= "SUMMER" then
    default[theme .. "_ls"] = {
      "LS_" .. id
    }
  end
end
local episodeComplete = {"MENU"}
for _, id in _G.ipairs({
  "LPH",
  "",
  "LPV",
  "LPSP",
  "LPEaster",
  "LPSummer",
  "LPMooncake",
  "LPH2",
  "LPX2",
  "LPYD",
  "LPCF",
  "LPMOV",
  "LPH3",
  "LPX3"
}) do
  default["gameFinished" .. id] = episodeComplete
  default["gameFinishedThreeStars" .. id] = episodeComplete
end
default.episodeThreeStarsAchievedPage = {"MENU"}
default.mooncakePieceAchievedPage = {
  "LS_MOONCAKE"
}
if deviceModel == "s60" and applyChinaRestictions then
  _G.table.insert(default.mainMenu, "MISC")
end
dynamic.addreq(default)
filename = "default.lua"
