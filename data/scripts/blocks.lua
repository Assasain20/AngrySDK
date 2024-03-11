collider_types = {
  basic = 0,
  eagle = 1,
  static = 2,
  bird = 3,
  pig = 4,
  ghost = 5,
  egg = 6,
  invisible = 7,
  portal = 8,
  staticNoCollision = 9
}
materials = {
  wood = {
    strength = 60,
    defence = 2.5,
    friction = 4,
    restitution = 0.2,
    density = 1.5,
    controllable = false,
    particles = "woodenBuff",
    collisionSound = "wood_collision",
    damageSound = "wood_damage",
    destroyedSound = "wood_destroyed",
    rollingSound = "wood_rolling"
  },
  cardboard = {
    strength = 15,
    defence = 0,
    friction = 5,
    restitution = 0.1,
    density = 0.5,
    controllable = false,
    particles = "woodenBuff",
    collisionSound = "wood_collision",
    damageSound = "wood_damage",
    destroyedSound = "wood_destroyed",
    rollingSound = "wood_rolling"
  },
  rock = {
    strength = 120,
    defence = 15,
    friction = 4,
    restitution = 0.1,
    density = 4,
    controllable = false,
    particles = "rockBuff",
    collisionSound = "rock_collision",
    damageSound = "rock_damage",
    destroyedSound = "rock_destroyed",
    rollingSound = "rock_rolling",
    underwaterCollisionSound = "underwater_collision_stone",
    underwaterDamageSound = "underwater_damage_stone",
    underwaterDestroyedSound = "underwater_break_stone",
    floatability = 0.1
  },
  light = {
    strength = 40,
    defence = 2,
    friction = 0.7,
    restitution = 0.2,
    density = 0.75,
    controllable = false,
    particles = "lightBuff",
    collisionSound = "light_collision",
    damageSound = "light_damage",
    destroyedSound = "light_destroyed",
    rollingSound = "light_rolling",
    underwaterCollisionSound = "underwater_collision_glass",
    underwaterDamageSound = "underwater_damage_glass",
    underwaterDestroyedSound = "underwater_break_glass",
    floatability = 0.2
  },
  piglette = {
    strength = 10,
    defence = 1,
    friction = 0.7,
    restitution = 0.05,
    density = 2,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "piglette_collision",
    damageSound = "piglette_damage",
    destroyedSound = "piglette_destroyed",
    floatability = 0.2,
    collider = collider_types.pig
  },
  staticGround = {
    strength = 30,
    defence = 100000,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    collider = collider_types.static
  },
  immovable = {
    strength = 30,
    defence = 100000,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    collider = collider_types.static
  },
  noCollision = {
    strength = 30,
    defence = 100000,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    collider = collider_types.staticNoCollision
  },
  portal = {
    strength = 120,
    defence = 100000,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    collider = collider_types.portal,
    portalDelay = 0.2,
    portalMinSpeedOut = 5,
    z_order = 1
  },
  staticInvisible = {
    strength = 30,
    defence = 100000,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    collider = collider_types.invisible
  },
  snowStaticFragile = {
    strength = 10,
    defence = 6,
    friction = 1,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "snowBuff",
    collisionSound = "snowball_roll",
    damageSound = "snowball_damaged",
    destroyedSound = "snowball_breaks"
  },
  pinkStaticFragile = {
    strength = 10,
    defence = 6,
    friction = 1,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "snowBuff",
    collisionSound = "snowball_roll",
    damageSound = "snowball_damaged",
    destroyedSound = "snowball_breaks"
  },
  snow = {
    strength = 10,
    defence = 5,
    friction = 1,
    restitution = 0,
    density = 2,
    controllable = false,
    particles = "snowBuff",
    collisionSound = "ground_collision",
    damageSound = "snowball_damaged",
    destroyedSound = "snowball_breaks",
    rollingSound = "snowball_rolling"
  },
  sandStaticFragile = {
    strength = 10,
    defence = 6,
    friction = 1,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "sandBuff",
    collisionSound = "snowball_roll",
    damageSound = "snowball_damaged",
    destroyedSound = "sand_break"
  },
  immovableFragile = {
    strength = 2,
    defence = 1,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "",
    collisionSound = "ground_collision"
  },
  balloon = {
    strength = 0.1,
    defence = 1,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "balloon_pop"
  },
  clouds = {
    strength = 20,
    defence = 7,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "cloud-evaporation"
  },
  immovableRubber = {
    strength = 30,
    defence = 100000,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "trampoline"
  },
  extras = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    floatability = 0.3,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "wood damage a1"
  },
  presents = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "gift_smash",
    forcePlaying = true
  },
  halloween = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 1,
    5,
    controllable = false,
    particles = "pumpkinBuff",
    collisionSound = "ground_collision",
    destroyedSound = "halloween_destroyed",
    forcePlaying = true
  },
  pumpkin = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 1,
    controllable = false,
    particles = "pumpkinBuff",
    collisionSound = "ground_collision",
    destroyedSound = "pumpkin_destroyed"
  },
  lantern = {
    strength = 20,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "flameBuff",
    collisionSound = "light_collision",
    destroyedSound = "lantern_break_a1"
  },
  rubber = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ball_bounce"
  },
  decoration = {
    strength = 30,
    defence = 100000,
    friction = 0.8,
    restitution = 0,
    density = 0,
    controllable = false,
    floatability = 0.5
  },
  common = {
    strength = 1,
    defence = 1,
    friction = 0.7,
    restitution = 0.2,
    density = 0.75,
    particles = "lightBuff",
    collisionSound = "",
    damageSound = "",
    destroyedSound = ""
  },
  bell = {
    strength = 40,
    defence = 30,
    friction = 0.7,
    restitution = 0,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "christmas_bell_large",
    destroyedSound = "christmas_bell_break",
    rollingSound = "christmas_bell_large",
    damageSound = "christmas_bell_large"
  },
  valentine = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "heartBuff",
    collisionSound = "ground_collision",
    destroyedSound = "gift_smash"
  },
  valentineStatic = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0,
    controllable = false,
    particles = "heartBuff",
    collisionSound = "ground_collision",
    destroyedSound = "gift_smash"
  },
  chocolate = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "heartBuff",
    collisionSound = "ground_collision",
    destroyedSound = "chocolate_box_break",
    forcePlaying = true
  },
  goldpot = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "moneyBuff",
    collisionSound = "ground_collision",
    destroyedSound = "goldpot_break",
    forcePlaying = true
  },
  money = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "moneyBuff",
    collisionSound = "ground_collision",
    destroyedSound = "moneypile_break",
    forcePlaying = true
  },
  clover = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "cloverBuff",
    collisionSound = "ground_collision",
    destroyedSound = "clover_break",
    forcePlaying = true
  },
  fourLeavedClover = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "luckyCloverBuff",
    collisionSound = "ground_collision",
    destroyedSound = "four_leaved_clover",
    forcePlaying = true
  },
  easteregg = {
    strength = 10,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "easterEggPuff",
    collisionSound = "ground_collision",
    destroyedSound = "easter_egg_break",
    forcePlaying = true
  },
  grass = {
    strength = 30,
    defence = 1,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "easterGrass",
    collisionSound = "ground_collision",
    destroyedSound = "clover_break"
  },
  bunny = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = ""
  },
  summerFlower = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "flower_break"
  },
  summerPicnic = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "light_damage"
  },
  summerGrass = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "varsiBuff",
    collisionSound = "ground_collision",
    destroyedSound = "clover_break"
  },
  chineseGrass = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "chineseGrass",
    collisionSound = "ground_collision",
    destroyedSound = "clover_break"
  },
  bunnyStatue = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    collisionSound = "ground_collision",
    destroyedSound = "chinese_lantern"
  },
  chineseLantern = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    collisionSound = "ground_collision",
    destroyedSound = "chinese_lantern"
  },
  skeleton = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    collisionSound = "skeleton_bone_collision",
    destroyedSound = "skeleton_bone_break"
  },
  halloweenTNT = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "black_pumkin"
  },
  halloweenGrass = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "halloweenGrassBuff",
    collisionSound = "ground_collision",
    destroyedSound = "clover_break"
  },
  cookie = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.15,
    controllable = false,
    particles = "cookieBuff",
    collisionSound = "ground_collision",
    destroyedSound = "cookie_break"
  },
  goldfish = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "smokeBuff",
    collisionSound = "ground_collision",
    destroyedSound = "Golden_Fish"
  },
  rocket = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    collisionSound = "ground_collision",
    destroyedSound = "rocket_explode"
  },
  flowerPetal = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "flowerPetalBuff",
    collisionSound = "ground_collision",
    destroyedSound = "clover_break"
  },
  cherryPetal = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "flowerPetalBuff",
    collisionSound = "ground_collision",
    destroyedSound = "cherry_leaf_break"
  },
  cherryCenter = {
    strength = 40,
    defence = 5,
    friction = 0.7,
    restitution = 0.4,
    density = 0.75,
    controllable = false,
    particles = "flowerPetalBuff",
    collisionSound = "ground_collision",
    destroyedSound = "cherry_center_break"
  },
  ghostBlock = {
    strength = 10000,
    defence = 10000,
    friction = 1,
    restitution = 0,
    density = 0,
    controllable = false,
    ghost = true,
    collider = collider_types.ghost,
    particles = "ghostBlockBreaking",
    passThroughParticles = "ghostBlockBreaking",
    collisionSound = "ghost_block_collision",
    damageSound = "snowball_damaged",
    destroyedSound = "ghost_block_break",
    passThroughSound = "ghost_block_passthru_var1"
  }
}


themes = {
  themeSpecialFriction = {{19, "0"}, {31, "0"}},
  settings = {
    themeAmount = 33,
    firstTheme = 16	
  },
  theme1 = {
    index = 1,
    music = "atmosphere_halloween",
    menuMusic = "title_theme_halloween",
    graphicSetName = {
      "THEME_HALLOWEEN"
    },
    texture = "THEME_HALLOWEEN_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_H",
    bgLayers = {
      {
        "",
        "BACKGROUND_9_LAYER_1",
        0.2,
        2.7
      },
      {
        "",
        "PARALLAX_MOON_1",
        0.2,
        2.25,
        false,
        832
      },
      {
        "",
        "THEME_9_BG_LAYER_2",
        0.6,
        2
      }
    },
    fgLayers = {
      {
        "INGAME_PARALLAX_9",
        "FOREGROUND_9_LAYER_1"
      }
    },
    color = {
      r = 0,
      g = 0,
      b = 0
    },
    groundColor = {
      r = 17,
      g = 17,
      b = 19
    },
    staticColor = {
      r = 59,
      g = 59,
      b = 64
    }
  },
  theme16 = {
    index = 16,
    music = "atmosphere_halloween",
    menuMusic = "title_theme_halloween",
    graphicSetName = {
      "THEME_HALLOWEEN"
    },
    texture = "THEME_HALLOWEEN_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_H",
    menuTheme = "theme16menu",
    bgLayers = {
      {
        "",
        "BACKGROUND_9_LAYER_1",
        0.2,
        1.7
      },
      {
        "",
        "PARALLAX_MOON_1",
        0.2,
        1.8,
        false,
        832
      },
      {
        "",
        "THEME_9_BG_LAYER_2",
        0.6,
        1.5
      }
    },
    fgLayers = {
      {
        "INGAME_PARALLAX_9",
        "FOREGROUND_9_LAYER_1"
      }
    },
    color = {
      r = 0,
      g = 0,
      b = 0
    },
    groundColor = {
      r = 17,
      g = 17,
      b = 19
    },
    staticColor = {
      r = 59,
      g = 59,
      b = 64
    }
  },
  theme16menu = {
    index = 98,
    music = "atmosphere_halloween",
    menuMusic = "title_theme_halloween",
    graphicSetName = {
      "THEME_HALLOWEEN",
      "LS_HALLOWEEN"
    },
    texture = "THEME_HALLOWEEN_THEME_GROUND_1",
    logoImage = "MENU_LOGO_H",
    playButtonSprite = "MENU_PLAY_H",
    playButtonBackground = {
      image = "PARALLAX_MOON_1",
      x = 0.5,
      y = 0.555,
      scale = 0.5
    },
    particles = {
      callFunction = "drawHalloweenBats",
      initFunction = "initHalloweenBats",
      drawBeforeForeground = true
    },
    bgLayers = {
      {
        "",
        "BACKGROUND_9_LAYER_1",
        0.2,
        1.25
      }
    },
    fgLayers = {
      {
        "",
        "THEME_9_BG_LAYER_2",
        0.6,
        1
      },
      {
        "INGAME_PARALLAX_9",
        "FOREGROUND_9_LAYER_1"
      }
    },
    color = {
      r = 0,
      g = 0,
      b = 0
    },
    groundColor = {
      r = 17,
      g = 17,
      b = 19
    },
    staticColor = {
      r = 59,
      g = 59,
      b = 64
    }
  },
  theme17 = {
    index = 17,
    music = "atmosphere_xmas",
    menuMusic = "title_theme_xmas",
    graphicSetName = {"THEME_XMAS", "LS_XMAS"},
    texture = "THEME_XMAS_THEME_GROUND_1",
    logoImage = "MENU_LOGO_X",
    playButtonSprite = "MENU_PLAY_X",
    particles = {
      name = "snowMainMenu"
    },
    bgLayers = {
      {
        "",
        "BACKGROUND_10_LAYER_1",
        0.2,
        1.55
      },
      {
        "",
        "THEME_10_BG_LAYER_3",
        0.45,
        0.55
      },
      {
        "",
        "THEME_10_BG_LAYER_2",
        0.75,
        1.55
      }
    },
    fgLayers = {
      {
        "",
        "FOREGROUND_10_LAYER_1",
        1,
        0.5
      }
    },
    color = {
      r = 49,
      g = 107,
      b = 140
    },
    groundColor = {
      r = 255,
      g = 255,
      b = 255
    },
    staticColor = {
      r = 73,
      g = 59,
      b = 48
    }
  },
  theme18 = {
    index = 18,
    music = "valentine_ambient",
    menuMusic = "valentine_theme",
    playButtonSprite = "MENU_PLAY_V",
    logoImage = "MENU_LOGO_V",
    texture = "THEME_VALENTINE_THEME_GROUND_1",
    graphicSetName = {
      "THEME_VALENTINE",
      "LS_VALENTINE"
    },
    particles = {
      name = "rosesFallMainMenu"
    },
    bgLayers = {
      {
        "",
        "THEME_V_BG_1",
        0.1,
        1.5
      },
      {
        "",
        "THEME_18_BG_LAYER_2",
        0.3,
        1.5
      },
      {
        "",
        "THEME_18_BG_LAYER_3",
        0.6,
        1.5
      }
    },
    fgLayers = {
      {
        "",
        "THEME_V_FG_1",
        1,
        1.25
      }
    },
    color = {
      r = 207,
      g = 219,
      b = 255
    },
    groundColor = {
      r = 69,
      g = 81,
      b = 104
    },
    staticColor = {
      r = 60,
      g = 61,
      b = 72
    }
  },
  theme19 = {
    index = 19,
    music = "st_patrick_ambient",
    menuMusic = "st_patrick_theme",
    graphicSetName = {
      "THEME_STPATRICK",
      "LS_STPATRICK"
    },
    texture = "THEME_STPATRICK_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_P",
    logoImage = "MENU_LOGO_P",
    particles = {
      name = "cloversFallMainMenu"
    },
    bgLayers = {
      {
        "",
        "THEME_PATRICK_BG_1",
        0.1,
        4
      },
      {
        "",
        "THEME_19_BG_LAYER_2",
        0.4,
        2
      }
    },
    fgLayers = {
      {
        "",
        "THEME_PATRICK_FG_1",
        1,
        2
      }
    },
	--[[slingshot = {		
	  back = "SLING_SHOT_GOLDEN_BACK",
	  front = "SLING_SHOT_GOLDEN_FRONT"
	},]]
    color = {
      r = 254,
      g = 171,
      b = 39	  
    },
	filter = {
	  red = 25,
	  green = 17,
	  blue = 3,
	  opacity = 0.5
	  -- Hi guys i am on my laptop
	},
    groundColor = {
      r = 102,
      g = 68,
      b = 51
    },
    staticColor = {
      r = 71,
      g = 60,
      b = 51
    }
  },
  theme20 = {
    index = 20,
    music = "easter_ambient",
    menuMusic = "easter_theme",
    graphicSetName = {
      "THEME_EASTER",
      "LS_EASTER"
    },
    texture = "THEME_EASTER_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_E",
    logoImage = "MENU_LOGO_E",
    particles = {
      name = "cherryFlowerFall",
      firstAmount = 50,
      amount = 2
    },
    bgLayers = {
      {
        "",
        "THEME_E_BG_1",
        0.1,
        1
      },
      {
        "",
        "THEME_20_BG_LAYER_2",
        0.4,
        1
      }
    },
    fgLayers = {
      {
        "",
        "THEME_E_FG_1",
        1,
        1
      }
    },
    color = {
      r = 88,
      g = 183,
      b = 255
    },
    groundColor = {
      r = 31,
      g = 19,
      b = 14
    },
    staticColor = {
      r = 62,
      g = 42,
      b = 0
    }
  },
  theme21 = {
    index = 21,
    music = "summer_ambient",
    menuMusic = "summer_theme",
    graphicSetName = {
      "THEME_SUMMER",
      "LS_SUMMER"
    },
    texture = "THEME_SUMMER_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_S",
    logoImage = "MENU_LOGO_S",
    particles = {
      callFunction = "spawnSummerButterflies",
      initFunction = "firstSummerButterflies"
    },
    bgLayers = {
      {
        "",
        "SUMMER_SKY",
        0.1,
        0.85
      },
      {
        "",
        "THEME_21_LAYER_1",
        0.4,
        0.75
      }
    },
    fgLayers = {
      {
        "",
        "SUMMER_GRASS",
        1,
        0.9
      }
    },
    color = {
      r = 53,
      g = 150,
      b = 233,
	  filterRed = 2,
	  filterBlue = 2,
	  filterGreen = 0,
	  filterIntensity = 0.1,
    },
	--[[filter = {
	  red = 1000,
	  green = 0,
	  blue = 550,
	  opacity = 0.1
	},
	slingshot = {		
	  back = "SLING_SHOT_WOOD_BACK",
	  front = "SLING_SHOT_WOOD_FRONT",
	  holder = "SLING_HOLDER_WOOD",
	  rubberRed = 44,
	  rubberGreen = 84,
	  rubberBlue = 34,
	  wood = 900,
	  light = 900
	},]]
    groundColor = {
      r = 102,
      g = 136,
      b = 0
    },
    staticColor = {
      r = 57,
      g = 40,
      b = 10
    }
  },
  theme22 = {
    index = 22,
    music = "",
    menuMusic = "summer_theme",
    graphicSetName = {
      "THEME_SPACE",
      "LS_SUMMER"
    },
    texture = "THEME_SPACE_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_S",
    logoImage = "MENU_LOGO_S",
    bgLayers = {
      {
        "",
        "SPACE_SKY",
        0.1,
        2
      },
      {
        "",
        "SPACE_FOREGROUND_1",
        0.4,
        2
      }
    },
    fgLayers = {
      {
        "",
        "SPACE_GROUND",
        1,
        1.5
      }
    },
    color = {
      r = 20,
      g = 22,
      b = 27
    },
    groundColor = {
      r = 20,
      g = 26,
      b = 40
    },
    staticColor = {
      r = 1,
      g = 111,
      b = 134
    }
  },
  theme23 = {
    index = 23,
    music = "mooncake_ambient",
    menuMusic = "mooncake_theme",
    graphicSetName = {
      "THEME_MOONCAKE",
      "LS_MOONCAKE"
    },
    texture = "THEME_MOONCAKE_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_M",
    logoImage = "MENU_LOGO_M",
    particles = {
      name = "teapotSparkleFall",
      firstAmount = 50,
      amount = 2
    },
    bgLayers = {
      {
        "",
        "MOONCAKE_SKY",
        0.1,
        1.3
      },
      {
        "",
        "MOONCAKE_MIDGROUND",
        0.4,
        1.2
      }
    },
    fgLayers = {
      {
        "",
        "MOONCAKE_GROUND",
        1,
        1
      }
    },
    color = {
      r = 96,
      g = 27,
      b = 112
    },
    groundColor = {
      r = 102,
      g = 0,
      b = 0
    },
    staticColor = {
      r = 81,
      g = 23,
      b = 4
    }
  },
  theme24 = {
    index = 24,
    music = "atmosphere_halloween2011",
    menuMusic = "title_theme_halloween2011",
    graphicSetName = {
      "THEME_HALLOWEEN2011"
    },
    texture = "THEME_HALLOWEEN2011_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_H2",
    menuTheme = "theme24menu",
    bgLayers = {
      {
        "",
        "HALLOWEEN2011_SKY",
        0.05,
        1.8
      },
      {
        "",
        "H2_MOON",
        0.05,
        1.3,
        false,
        600
      },
      {
        "",
        "THEME_H2_BG_TREES",
        0.25,
        1.3
      },
      {
        "",
        "THEME_H2_BG_PUMPKINS",
        0.5,
        1.5
      }
    },
    fgLayers = {
      {
        "",
        "HALLOWEEN2011_GROUND",
        1,
        0.7
      }
    },
	slingshot = {		
	  back = "SLING_SHOT_BONE_BACK",
	  front = "SLING_SHOT_BONE_FRONT"
	},
    color = {
      r = 10,
      g = 36,
      b = 26,	  
	  filterRed = 0.2,
	  filterBlue = 0.5,
	  filterGreen = 1,
	  filterIntensity = 0.07
    },
    groundColor = {
      r = 5,
      g = 5,
      b = 5
    },
    staticColor = {
      r = 9,
      g = 10,
      b = 10
    }
  },
  theme24menu = {
    index = 99,
    music = "atmosphere_halloween2011",
    menuMusic = "title_theme_halloween2011",
    graphicSetName = {
      "THEME_HALLOWEEN2011",
      "LS_HALLOWEEN2011"
    },
    texture = "THEME_HALLOWEEN2011_THEME_GROUND_1",
    logoImage = "MENU_LOGO_H2",
    playButtonSprite = "MENU_PLAY_H2",
    playButtonBackground = {
      image = "H2_MOON",
      x = 0.5,
      y = 0.555,
      scale = 0.5
    },
    particles = {
      name = "leavesFallMainMenu",
      firstAmount = 25,
      amount = 2
    },
    bgLayers = {
      {
        "",
        "HALLOWEEN2011_SKY",
        0.05,
        0.9
      }
    },
    fgLayers = {
      {
        "",
        "THEME_H2_BG_TREES",
        0.25,
        0.65
      },
      {
        "",
        "THEME_H2_BG_PUMPKINS",
        0.5,
        0.75
      },
      {
        "",
        "HALLOWEEN2011_GROUND",
        1,
        0.35
      }
    },
    color = {
      r = 10,
      g = 36,
      b = 26
    },
    groundColor = {
      r = 5,
      g = 5,
      b = 5
    },
    staticColor = {
      r = 9,
      g = 10,
      b = 10
    }
  },
  theme25 = {
    index = 25,
    music = "atmosphere_xmas2011",
    menuMusic = "title_theme_xmas2011",
    graphicSetName = {
      "THEME_XMAS",
      "THEME_XMAS2012",
      "LS_XMAS"
    },
    texture = "THEME_XMAS2012_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_X2",
    logoImage = "MENU_LOGO_X2",
    particles = {
      name = "snowMainMenu"
    },
    bgLayers = {
      {
        "",
        "XMAS_2012_SKY",
        0.1,
        1.4
      },
      {
        "",
        "XMAS2012_MIDGROUND",
        0.4,
        1.3
      }
    },
    fgLayers = {
      {
        "",
        "XMAS_2012_GROUND",
        1,
        0.6
      }
    },
    color = {
      r = 57,
      g = 74,
      b = 156
    },
    groundColor = {
      r = 255,
      g = 255,
      b = 255
    },
    staticColor = {
      r = 47,
      g = 61,
      b = 71
    }
  },
  theme26 = {
    index = 26,
    music = "atmosphere_dragon",
    menuMusic = "title_dragon",
    graphicSetName = {
      "THEME_DRAGON",
      "LS_DRAGON"
    },
    texture = "THEME_DRAGON_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_YD",
    logoImage = "MENU_LOGO_YD",
    particles = {
      callFunction = "spawnDragonFireworks"
    },
    bgLayers = {
      {
        "",
        "DRAGON_SKY",
        0.02,
        2.4
      },
      {
        "",
        "DRAGON_MIST_1",
        0.1,
        1.3,
        v = 120
      },
      {
        "",
        "DRAGON_MOUNTAINS",
        0.2,
        1.8
      },
      {
        "",
        "DRAGON_MIST_2",
        0.35,
        1.5,
        v = 100
      },
      {
        "",
        "DRAGON_BAMBOOS",
        0.5,
        1.9
      },
      {
        "",
        "DRAGON_WALL",
        0.7,
        1.1
      }
    },
    fgLayers = {
      {
        "",
        "DRAGON_GROUND",
        1,
        0.9
      }
    },
    color = {
      r = 139,
      g = 32,
      b = 34,	  
	  filterRed = 1,
	  filterBlue = 0.1,
	  filterGreen = 0.1,
	  filterIntensity = 0.12
    },
    groundColor = {
      r = 28,
      g = 7,
      b = 7
    },
    staticColor = {
      r = 35,
      g = 14,
      b = 10
    }
  },
  theme27 = {
    index = 27,
    music = "atmosphere_cherry",
    menuMusic = "title_cherry",
    graphicSetName = {
      "THEME_CHERRY",
      "LS_CHERRY"
    },
    texture = "THEME_CHERRY_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_CF",
    logoImage = "MENU_LOGO_CF",
    particles = {
      name = "cherryFlowerFall",
      firstAmount = 50,
      amount = 2
    },
    bgLayers = {
      {
        "",
        "CHERRY_SKY",
        0.02,
        2.2
      },
      {
        "",
        "CHERRY_FUJI",
        0.02,
        1.6
      },
      {
        "",
        "CHERRY_BACK",
        0.2,
        1.3
      },
      {
        "",
        "CHERRY_MID",
        0.3,
        1.5
      },
      {
        "",
        "CHERRY_FRONT",
        0.7,
        1.6
      }
    },
    fgLayers = {
      {
        "",
        "CHERRY_GROUND",
        1,
        1.5
      }
    },
    color = {
      r = 189,
      g = 224,
      b = 255
    },
    groundColor = {
      r = 89,
      g = 86,
      b = 77
    },
    staticColor = {
      r = 35,
      g = 14,
      b = 10
    }
  },
  theme28 = {
    index = 28,
    music = "atmosphere_piglantis",
    menuMusic = "title_piglantis",
    graphicSetName = {
      "THEME_MOVIE",
      "LS_MOVIE"
    },
    texture = "THEME_MOVIE_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_MOV",
    logoImage = "MENU_LOGO_MOV",
    particles = {
      name = "fishiesMainMenu",
      firstAmount = 10,
      amount = 1
    },
    menuWater = true,
    bgLayers = {
      {
        "",
        "PIGLANTIS_SKY",
        0,
        2
      },
      {
        "",
        "PIGLANTIS_PARALLAX",
        0.2,
        1.2,
        false
      }
    },
    fgLayers = {
      {
        "",
        "PIGLANTIS_GROUND",
        1,
        1.5
      },
      {
        "",
        "PIGLANTIS_WATER_1",
        1.1,
        1.2,
        v = 40,
        water = true,
        scaleWobbleX = 0,
        scaleWobbleY = 0.02
      },
      {
        "",
        "PIGLANTIS_WATER_2",
        1.35,
        2.2,
        v = -25,
        water = true,
        scaleWobbleX = 0,
        scaleWobbleY = -0.03
      }
    },
    color = {
      r = 110,
      g = 225,
      b = 252
    },
    groundColor = {
      r = 187,
      g = 204,
      b = 170
    },
    staticColor = {
      r = 35,
      g = 14,
      b = 10
    }
  },
  theme29 = {
    index = 29,
    music = "atmosphere_school",
    menuMusic = "title_school",
    graphicSetName = {
      "THEME_SCHOOL",
      "LS_SCHOOL"
    },
    texture = "THEME_SCHOOL_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_SCH",
    logoImage = "MENU_LOGO_SCH",
    particles = {
      name = "rain",
      firstAmount = 15,
      amount = 2,
      delay = 0.1,
      widthMultiplier = 1.5
    },
    bgLayers = {
      {
        "",
        "SCHOOL_SKY",
        0,
        1.5
      },
      {
        "",
        "SCHOOL_SKY_LIGHT",
        0,
        1,
        false
      },
      {
        "",
        "SCHOOL_BACK",
        0.2,
        1.5
      },
      {
        "",
        "SCHOOL_MID_1",
        0.4,
        1.5
      },
      {
        "",
        "SCHOOL_FENCE",
        0.7,
        2
      }
    },
    fgLayers = {
      {
        "",
        "SCHOOL_FRONT",
        1,
        2
      }
    },
    color = {
      r = 109,
      g = 152,
      b = 228
    },
	filter = {
	  red = 0,
	  green = 0,
	  blue = 20,
	  opacity = 0.08
	},
    groundColor = {
      r = 47,
      g = 73,
      b = 104
    },
    staticColor = {
      r = 35,
      g = 14,
      b = 10
    }
  },
  theme30 = {
    index = 30,
    music = "atmosphere_halloween2012",
    menuMusic = "title_halloween2012",
    graphicSetName = {
      "THEME_HALLOWEEN2012",
      "LS_HALLOWEEN2012"
    },
    texture = "THEME_HALLOWEEN2012_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_H3",
    logoImage = "MENU_LOGO_H3",
    no_birds_in_main_menu = true,
    level_failed_pig_override = "LEVEL_FAILED_H3",
    bgLayers = {
      {
        "",
        "H3_SKY",
        0.2,
        2.5
      },
      {
        "",
        "H3_SKY_MOON",
        0.2,
        2.5,
        false
      },
      {
        "",
        "H3_HOUSE_1",
        0.5,
        2.4
      },
      {
        "",
        "H3_PAINTINGS",
        0.5,
        2.4,
        false
      },
      {
        "",
        "H3_EYES_1",
        0.5,
        2.4,
        false
      },
      {
        "",
        "H3_EYES_2",
        0.5,
        2.4,
        false
      },
      {
        "",
        "H3_EYES_3",
        0.5,
        2.4,
        false
      }
    },
    fgLayers = {
      {
        "",
        "H3_HOUSE_GROUND",
        1,
        2
      },
      {
        "",
        "H3_FOG_1",
        1,
        2.2,
        v = 50
      },
      {
        "",
        "H3_HOUSE_FOREGROUND",
        1.5,
        2
      },
      {
        "",
        "H3_FOG_2",
        1,
        2.1,
        v = 30
      }
    },
    effects = {
      {
        type = "Blink",
        params = {layer = 5}
      },
      {
        type = "Blink",
        params = {layer = 6}
      },
      {
        type = "Blink",
        params = {layer = 7}
      }
    },
    color = {
      r = 0,
      g = 0,
      b = 0
    },
    groundColor = {
      r = 12,
      g = 0,
      b = 0
    },
    staticColor = {
      r = 35,
      g = 14,
      b = 10
    }
  },
  theme31 = {
    index = 31,
	friction = 0,
    music = "atmosphere_xmas2012",
    menuMusic = "title_xmas2012",
    graphicSetName = {
      "THEME_XMAS2013",
      "LS_XMAS"
    },
    texture = "THEME_XMAS2013_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_X3",
    logoImage = "MENU_LOGO_X3",
    particles = {
      name = "snowMainMenu"
    },
    level_failed_pig_override = "LEVEL_FAILED_X3",
    bgLayers = {
      {
        "",
        "X3_SKY",
        0.1,
        1.4
      },
      {
        "",
        "AURORA_1",
        0.2,
        1.4,
        scaleWobbleY = 0.03
      },
      {
        "",
        "AURORA_2",
        0.2,
        1.4,
        true,
        30,
        scaleWobbleY = 0.03
      },
      {
        "",
        "AURORA_3",
        0.2,
        1.4,
        scaleWobbleY = 0.025
      },
      {
        "",
        "AURORA_4",
        0.2,
        1.4,
        scaleWobbleY = 0.03
      },
      {
        "",
        "X3_BACKGROUND",
        0.3,
        1.3
      },
      {
        "",
        "X3_ICE_CASTLE",
        0.4,
        2.3,
        false
      },
      {
        "",
        "X3_MIDGROUND",
        0.4,
        1.3
      },
      {
        "",
        "X3_MIDGROUND_CANDY",
        0.4,
        1.3
      }
    },
    fgLayers = {
      {
        "",
        "X3_GROUND",
        1,
        1.6
      }
    },
    effects = {
      {
        type = "Fade",
        params = {layer = 2, duration = 3}
      },
      {
        type = "Fade",
        params = {
          layer = 3,
          phase = 3,
          duration = 3
        }
      },
      {
        type = "Fade",
        params = {
          layer = 4,
          phase = 2,
          duration = 3
        }
      },
      {
        type = "Fade",
        params = {
          layer = 5,
          phase = 4,
          duration = 3
        }
      }
    },
    color = {
      r = 25,
      g = 4,
      b = 33
    },
    groundColor = {
      r = 187,
      g = 170,
      b = 204
    },
    staticColor = {
      r = 47,
      g = 61,
      b = 71
    }
  },
  theme32 = {
    index = 32,
    music = "",
    menuMusic = "title_xmas2012",
    graphicSetName = {
      "THEME_INTEL",
      "LS_XMAS"
    },
    texture = "THEME_INTEL_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_X2",
    logoImage = "MENU_LOGO_X2",
    menuTheme = "theme31",
    bgLayers = {
      {
        "",
        "INTEL_SKY",
        0.1,
        1.4
      },
      {
        "",
        "INTEL_PARALLAX_WAVE_1",
        0.4,
        1.3
      },
      {
        "",
        "INTEL_PARALLAX_WAVE_2",
        0.4,
        1.3
      },
      {
        "",
        "INTEL_PARALLAX_WAVE_3",
        0.4,
        1.3
      }
    },
    fgLayers = {
      {
        "",
        "INTEL_FOREGROUND",
        1,
        0.6
      }
    },
    color = {
      r = 0,
      g = 38,
      b = 70
    },
    groundColor = {
      r = 0,
      g = 68,
      b = 119
    },
    staticColor = {
      r = 0,
      g = 39,
      b = 72
    }
  },
    theme33 = {
    index = 33,
    music = "",
    menuMusic = "title_classic",
    graphicSetName = {
      "THEME_INTEL",
      "LS_XMAS"
    },
    texture = "INGAME_THEME_GROUND_1",
    playButtonSprite = "MENU_PLAY_H",
    logoImage = "MENU_LOGO",
    menuTheme = "theme33",
    bgLayers = {
      {
        "INGAME_SKIES_1",
        "BACKGROUND_1_LAYER_1",
        0.125,
        2
      },
      {
        "",
        "BACKGROUND_1_LAYER_2",
        0.5,
        2
      },
      {
        "",
        "BACKGROUND_1_LAYER_3",
        1,
        1.5
      }
    },
    fgLayers = {
      {
        "INGAME_GROUNDS_1",
        "FOREGROUND_1_LAYER_1"
      },
      {
        "",
        "FOREGROUND_1_LAYER_2"
      }
    },
    color = {
      r = 148,
      g = 206,
      b = 222
    },
    groundColor = {
      r = 10,
      g = 19,
      b = 57
    },
    staticColor = {
      r = 0,
      g = 39,
      b = 72
    }
  }
}
groups = {
  staticBlocks = {
    keyUp = "X",
    keyDown = "Z",
    firstIndex = 1,
    lastIndex = 18
  },
  rockBlocks = {
    keyUp = "2",
    keyDown = "1",
    firstIndex = 1,
    lastIndex = 14
  },
  woodBlocks = {
    keyUp = "W",
    keyDown = "Q",
    firstIndex = 1,
    lastIndex = 14
  },
  lightBlocks = {
    keyUp = "S",
    keyDown = "A",
    firstIndex = 1,
    lastIndex = 14
  },
  birds = {
    keyUp = "4",
    keyDown = "3",
    firstIndex = 1,
    lastIndex = 9
  },
  levelGoals = {
    keyUp = "R",
    keyDown = "E",
    firstIndex = 1,
    lastIndex = 23
  },
  extras = {
    keyUp = "6",
    keyDown = "5",
    firstIndex = 1,
    lastIndex = 205
  },
  platforms = {
    keyUp = "Y",
    keyDown = "T",
    firstIndex = 1,
    lastIndex = 5
  },
  staticFragile = {
    keyUp = "N",
    keyDown = "M",
    firstIndex = 1,
    lastIndex = 24
  },
  clouds = {
    keyUp = "H",
    keyDown = "J",
    firstIndex = 1,
    lastIndex = 33
  },
  halloweenitems = {
    keyUp = "U",
    keyDown = "I",
    firstIndex = 1,
    lastIndex = 55
  },
  testBlocks = {
	keyUp = "K",
	keyDown = "L",
	firstIndex = 1,
	lastIndex = 3
  }
}
damageFactors = {
  DefaultDamageFactors = {
    damageMultiplier = {
      wood = 1,
      rock = 1,
      light = 1,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 1
    },
    velocityMultiplier = {
      wood = 1,
      rock = 1,
      light = 1,
      immovable = 1
    }
  },
  BlueBirdDamageFactors = {
    damageMultiplier = {
      wood = 1,
      rock = 1,
      light = 2.9,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 1.1
    },
    velocityMultiplier = {
      wood = 1,
      rock = 1,
      light = 1.9,
      immovable = 1,
      snowStaticFragile = 1.1
    }
  },
  YellowBirdDamageFactors = {
    damageMultiplier = {
      wood = 2.4,
      rock = 1,
      light = 1,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 0.75
    },
    velocityMultiplier = {
      wood = 1,
      rock = 1,
      light = 1,
      immovable = 1,
      snowStaticFragile = 1
    }
  },
  BlackBirdDamageFactors = {
    damageMultiplier = {
      wood = 1,
      rock = 4,
      light = 1,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 3
    },
    velocityMultiplier = {
      wood = 1,
      rock = 1,
      light = 1,
      immovable = 1
    }
  },
  WhiteBirdDamageFactors = {
    damageMultiplier = {
      wood = 1,
      rock = 1,
      light = 1,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 3
    },
    velocityMultiplier = {
      wood = 1,
      rock = 1,
      light = 1,
      immovable = 1
    }
  },
  RedBigBirdDamageFactors = {
    damageMultiplier = {
      wood = 0.3,
      rock = 0.3,
      light = 0.3,
      immovable = 0,
      staticGround = 0
    },
    velocityMultiplier = {
      wood = 1.8,
      rock = 1.8,
      light = 1.8,
      immovable = 1
    }
  },
  BoomerangBirdDamageFactors = {
    damageMultiplier = {
      wood = 1.6,
      rock = 0.8,
      light = 1.4,
      immovable = 0,
      staticGround = 0
    },
    velocityMultiplier = {
      wood = 1.3,
      rock = 1,
      light = 1.3,
      immovable = 1
    }
  },
  GlobeBirdDamageFactors = {
    damageMultiplier = {
      wood = 3,
      rock = 1.5,
      light = 3,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 5
    },
    velocityMultiplier = {
      wood = 4,
      rock = 4,
      light = 4,
      immovable = 1
    }
  },
  GlobeBirdBigDamageFactors = {
    damageMultiplier = {
      wood = 0,
      rock = 0,
      light = 0,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 0
    },
    velocityMultiplier = {
      wood = 2,
      rock = 2,
      light = 2,
      immovable = 1
    }
  },
  PinkBirdDamageFactors = {
    damageMultiplier = {
      wood = 0.5,
      rock = 0.5,
      light = 0.5,
      immovable = 0,
      staticGround = 0,
      snowStaticFragile = 1
    },
    velocityMultiplier = {
      wood = 1,
      rock = 1,
      light = 1,
      immovable = 1
    }
  },
  MightyEagleBirdDamageFactors = {
    damageMultiplier = {
      wood = 1000000,
      rock = 1000000,
      light = 1000000,
      immovable = 1000000,
      staticGround = 0
    },
    velocityMultiplier = {
      wood = 555,
      rock = 555,
      light = 555,
      immovable = 555
    }
  },
  MightyDragonDamageFactors = {
    damageMultiplier = {
      wood = 0,
      rock = 0,
      light = 0,
      immovable = 0,
      staticGround = 0
    },
    velocityMultiplier = {
      wood = 555,
      rock = 555,
      light = 555,
      immovable = 0
    }
  }
}
blocks = {
  SmallBlueBird = {
    radius = 0.6,
    friction = 0.3,
    type = "circle",
    restitution = 0.25,
    sprite = "BIRD_BLUE",
    spriteFlying = "BIRD_BLUE",
    spriteCollision = "BIRD_BLUE_COLLISION",
    spriteAction = "HUD_ICON_SPLIT",
    spriteScore = "10K_BLUE",
    spriteYell = "BIRD_BLUE_YELL",
    spriteBlink = "BIRD_BLUE_BLINK",
    allowRoll = true,
    density = 4.5,
    damageFactors = "BlueBirdDamageFactors",
    controllable = true,
    materialName = "light",
    strength = 60,
    group = "birds",
    groupIndex = 2,
    particles = "blueBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "blueBirdTrail",
    collisionSound = "bird_02_collision",
    launchSound = "bird_02_flying",
    specialSound = "special_group",
    selectionSound = "bird_02_select",
    unselectionSound = "bird_02_unselect",
    specialty = "CLUSTER_BOMB",
    tutorialInfo = "TUTORIAL_2",
    useLegacyCollisionPath = true,
    collider = collider_types.bird,
    angularDamping = 2
  },
  RedBird = {
    radius = 0.85,
    friction = 0.3,
    type = "circle",
    restitution = 0.43,
    sprite = "BIRD_RED",
    spriteFlying = "BIRD_RED_FLYING",
    spriteCollision = "BIRD_RED_COLLISION",
    spriteAction = "HUD_ICON_NOTE",
    spriteScore = "10K_RED",
    spriteYell = "BIRD_RED_YELL",
    spriteBlink = "BIRD_RED_BLINK",
    allowRoll = true,
    density = 6,
    damageFactors = "DefaultDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60,
    group = "birds",
    groupIndex = 1,
    particles = "redBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "redBirdTrail",
    collisionSound = "bird_01_collision",
    launchSound = "bird_01_flying",
    specialSound = "red_special",
    selectionSound = "bird_01_select",
    unselectionSound = "bird_01_unselect",
    specialty = "SOUND",
    tutorialInfo = "TUTORIAL_1",
    useLegacyCollisionPath = true,
    floatability = 1,
    collider = collider_types.bird,
    angularDamping = 2
  },
  YellowBird = {
    radius = 0.8,
    friction = 0.3,
    type = "circle",
    restitution = 0.23,
    sprite = "BIRD_YELLOW",
    spriteFlying = "BIRD_YELLOW_FLYING",
    spriteCollision = "BIRD_YELLOW_COLLISION",
    spriteAction = "HUD_ICON_BOOST",
    spriteScore = "10K_YELLOW",
    spriteYell = "BIRD_YELLOW_YELL",
    spriteBlink = "BIRD_YELLOW_BLINK",
    spriteSpecial = "BIRD_YELLOW_SPECIAL",
    allowRoll = true,
    density = 6,
    damageFactors = "YellowBirdDamageFactors",
    controllable = true,
    materialName = "wood",
    strength = 60,
    group = "birds",
    groupIndex = 3,
    particles = "yellowBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "yellowBirdTrail",
    collisionSound = "bird_03_collision",
    launchSound = "bird_03_flying",
    specialSound = "special_boost",
    selectionSound = "bird_03_select",
    unselectionSound = "bird_03_unselect",
    specialty = "BOOST",
    tutorialInfo = "TUTORIAL_3",
    useLegacyCollisionPath = true,
    floatability = 1,
    collider = collider_types.bird,
    angularDamping = 2
  },
  BlackBird = {
    definition = "BlackBird",
    radius = 1,
    friction = 0.3,
    type = "circle",
    restitution = 0.03,
    sprite = "BIRD_GREY",
    spriteFlying = "BIRD_GREY_FLYING",
    spriteCollision = "BIRD_GREY_FLYING",
    spriteAction = "HUD_ICON_EXPLOSION",
    spriteScore = "10K_BLACK",
    spriteYell = "BIRD_GREY_YELL",
    spriteBlink = "BIRD_GREY_BLINK",
    spriteSpecial1 = "BIRD_GREY_1",
    spriteSpecial2 = "BIRD_GREY_2",
    spriteSpecial3 = "BIRD_GREY_3",
    density = 6,
    damageFactors = "BlackBirdDamageFactors",
    controllable = true,
    materialName = "rock",
    strength = 60,
    group = "birds",
    groupIndex = 5,
    particles = "blackBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "bombBirdTrail",
    collisionSound = "bird_04_collision",
    launchSound = "bird_04_flying",
    specialSound = "special_explosion",
    selectionSound = "bird_04_select",
    unselectionSound = "bird_04_unselect",
    specialty = "BOMB",
    explosionRadius = 15,
    explosionForce = 40000,
    explosionDamageRadius = 5,
    explosionDamage = 300,
    tutorialInfo = "TUTORIAL_4",
    useLegacyCollisionPath = true,
    floatability = 1,
    collider = collider_types.bird,
    angularDamping = 2
  },
  BasicBird2 = {
    radius = 1.3,
    friction = 0.3,
    type = "circle",
    restitution = 0.23,
    sprite = "BIRD_GREEN",
    spriteFlying = "BIRD_GREEN_FLYING",
    spriteCollision = "BIRD_GREEN_COLLISION",
    spriteAction = "HUD_ICON_EGG",
    spriteScore = "10K_WHITE",
    spriteYell = "BIRD_GREEN_YELL",
    spriteBlink = "BIRD_GREEN_BLINK",
    spriteSpecial = "BIRD_GREEN_SPECIAL",
    density = 4.5,
    damageFactors = "WhiteBirdDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60,
    group = "birds",
    groupIndex = 4,
    particles = "whiteBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "bomberBirdTrail",
    collisionSound = "bird_05_collision",
    launchSound = "bird_05_flying",
    specialSound = "special_egg",
    selectionSound = "bird_05_select",
    unselectionSound = "bird_05_unselect",
    specialty = "GRENADE",
    projectile = "EggGranade",
    explosionRadius = 10,
    explosionForce = 20000,
    explosionDamageRadius = 5,
    explosionDamage = 200,
    tutorialInfo = "TUTORIAL_5",
    useLegacyCollisionPath = true,
    floatability = 1,
    collider = collider_types.bird,
    angularDamping = 2
  },
  EggGranade = {
    friction = 0.3,
    type = "circle",
    restitution = 0.23,
    sprite = "DROPPABLE_EGG",
    density = 3,
    damageFactors = "DefaultDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60,
    particles = "explosionBuff",
    specialty = "BOMB",
    explosionRadius = 10,
    explosionForce = 10000,
    explosionDamageRadius = 8,
    explosionDamage = 400,
    useLegacyCollisionPath = true,
    particles = "eggShells",
    collider = collider_types.bird,
    angularDamping = 2
  },
  RedBigBird = {
    radius = 1.8,
    friction = 0.3,
    type = "circle",
    restitution = 0.45,
    sprite = "BIRD_BIG_BROTHER",
    spriteFlying = "BIRD_BIG_BROTHER",
    spriteCollision = "BIRD_BIG_BROTHER",
    spriteAction = "HUD_ICON_NOTE",
    spriteScore = "10K_RED",
    spriteYell = "BIRD_BIG_BROTHER_YELL",
    spriteBlink = "BIRD_BIG_BROTHER_BLINK",
    allowRoll = true,
    density = 10,
    damageFactors = "RedBigBirdDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60,
    group = "birds",
    groupIndex = 6,
    particles = "redBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "redBirdTrail",
    collisionSound = "big_brother_collision",
    launchSound = "big_brother_flying",
    specialSound = "big_brother_special",
    selectionSound = "big_brother_select",
    unselectionSound = "bird_01_unselect",
    specialty = "SOUND",
    tutorialInfo = "TUTORIAL_7",
    floatability = 1,
    collider = collider_types.bird,
    angularDamping = 2
  },
  BoomerangBird = {
    radius = 1.5,
    friction = 0.3,
    type = "circle",
    restitution = 0.23,
    sprite = "BIRD_BOOMERANG",
    spriteFlying = "BIRD_BOOMERANG",
    spriteCollision = "BIRD_BOOMERANG_COLLISION",
    spriteYell = "BIRD_BOOMERANG_YELL",
    spriteAction = "HUD_ICON_BOOST",
    spriteScore = "10K_BOOMERANG",
    spriteBlink = "BIRD_BOOMERANG_BLINK",
    spriteSpecial = "BIRD_BOOMERANG_SPECIAL",
    allowRoll = true,
    density = 3,
    damageFactors = "BoomerangBirdDamageFactors",
    controllable = true,
    materialName = "wood",
    strength = 60,
    group = "birds",
    groupIndex = 7,
    particles = "boomerangBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "yellowBirdTrail",
    collisionSound = "bird_03_collision",
    launchSound = "bird_06_flying",
    specialSound = "boomerang_activate",
    selectionSound = "boomerang_select",
    unselectionSound = "bird_03_unselect",
    specialty = "BOOMERANG",
    boomerangHorizontalForce = -50,
    boomerangVerticalForce = -350,
    boomerangMaxHorizontalSpeed = 50,
    flyVerticalForce = -60,
    tutorialInfo = "TUTORIAL_6",
    floatability = 1,
    collider = collider_types.bird,
    angularDamping = 2
  },
  GlobeBird = {
    definition = "PufferBird",
    type = "circle",
    scale = 0.3,
    radius = 0.85,
    friction = 0.3,
    restitution = 0.25,
    density = 5,
    allowRoll = true,
    group = "birds",
    groupIndex = 8,
    damageFactors = "GlobeBirdDamageFactors",
    controllable = true,
    materialName = "rock",
    strength = 60,
    particles = {"orangeBuff", "smokeBuff"},
    particlesTrail = "redBirdTrail",
    tutorialInfo = "TUTORIAL_9",
    hasExtraTutorial = true,
    useLegacyCollisionPath = true,
    rotateWhileFlying = true,
    z_order = 2,
    specialty = "PUFFER",
    specialtyAvailableAfterCollision = true,
    onTriggerSpecialty = "triggerPufferSpecialty",
    onFlyingBirdCollided = "flyingPufferCollided",
    automaticPuffDelay = 1.5,
    directionChangeTime = 0.05,
    directionChangeMagnitude = 50,
    puffTime = 1.5,
    deathTime = 1.5,
    explosionRadius = 8,
    explosionForce = 45000,
    explosionDamageRadius = 5,
    explosionDamage = 0,
    sprite = "BIRD_PUFFER_1",
    spriteFlying = "BIRD_PUFFER_1",
    spriteYell = "BIRD_PUFFER_YELL",
    spriteAction = "BIRD_PUFFER_1",
    spriteScore = "10K_ORANGE",
    spriteBlink = "BIRD_PUFFER_BLINK",
    spriteSpecial = "BIRD_PUFFER_2",
    puffedValues = {
      radius = 7.5,
      friction = 0.5,
      restitution = 0,
      density = 0.1,
      damageFactors = "GlobeBirdBigDamageFactors"
    },
    collisionSound = "globe_hit",
    launchSound = "Globe_Bird_Launch_3",
    specialSound = "globe_special",
    selectionSound = "Globe_Bird_Selection_1",
    unselectionSound = "bird_03_unselect",
    removeSound = "Globe_Bird_Death_remove_1",
    collider = collider_types.bird,
    angularDamping = 2
  },
  PinkBird = {
    radius = 0.85,
    friction = 0.3,
    type = "circle",
    restitution = 0.43,
    groupIndex = 9,
    allowRoll = true,
    density = 6,
    damageFactors = "PinkBirdDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60,
    group = "birds",
    specialty = "BUBBLES",
    tutorialInfo = "TUTORIAL_10",
    floatability = 1,
    specialtyRadius = 7,
    specialtyDuration = 3,
    sprite = "BIRD_PINK",
    spriteFlying = "BIRD_PINK",
    spriteCollision = "BIRD_PINK",
    spriteAction = "HUD_ICON_NOTE",
    spriteScore = "10K_PINK",
    spriteYell = "BIRD_PINK",
    spriteSpecial = "BIRD_PINK_RELEASE",
    spriteBlink = "BIRD_PINK_BLINK",
    particles = "pinkBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "redBirdTrail",
    collisionSound = "pink_bird_collision",
    launchSound = "pink_bird_launch",
    specialSound = "pink_bird_special",
    selectionSound = "pink_bird_activate",
    unselectionSound = "bird_01_unselect",
    collider = collider_types.bird,
    angularDamping = 2
  },
  ClusterBombBird = {
    radius = 1.3,
    friction = 0.3,
    type = "circle",
    restitution = 0.25,
    sprite = "BIRD_BOMBOM_1",
    spriteFlying = "BIRD_BOMBOM_1",
    spriteCollision = "BIRD_BOMBOM_1",
    spriteAction = "HUD_ICON_SPLIT",
    spriteScore = "10K_BLUE",
    spriteYell = "BIRD_BOMBOM_1",
    spriteBlink = "BIRD_BOMBOM_1",
    allowRoll = true,
    density = 4.5,
    damageFactors = "BlackBirdDamageFactors",
    controllable = true,
    materialName = "stone",
    strength = 60,
    group = "birds",
    groupIndex = 15,
    particles = "blackBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "bombBirdTrail",
    collisionSound = "bird_02_collision",
    launchSound = "bird_02_flying",
    specialSound = "special_group",
    selectionSound = "bird_02_select",
    unselectionSound = "bird_02_unselect",
    specialty = "CLUSTER_BOMB_EXPLODE",
    explosionRadius = 15,
    explosionForce = 12000,
    explosionDamageRadius = 5,
    explosionDamage = 100,
    tutorialInfo = "TUTORIAL_2",
    useLegacyCollisionPath = true
  },
  ClusterBombBirdSmall = {
    definition = "ClusterBombBirdSmall",
    radius = 0.6,
    friction = 0.3,
    type = "circle",
    restitution = 0.25,
    sprite = "BIRD_BOMBOM_2",
    spriteFlying = "BIRD_BOMBOM_2",
    spriteCollision = "BIRD_BOMBOM_2",
    spriteAction = "HUD_ICON_SPLIT",
    spriteScore = "10K_BLUE",
    spriteYell = "BIRD_BOMBOM_2",
    spriteBlink = "BIRD_BOMBOM_2",
    allowRoll = true,
    density = 4.5,
    damageFactors = "BlackBirdDamageFactors",
    controllable = true,
    materialName = "stone",
    strength = 60,
    group = "birds",
    groupIndex = 11,
    particles = "blackBuff",
    particlesAmountLimits = {12, 20},
    particlesTrail = "bombBirdTrail",
    collisionSound = "bird_02_collision",
    launchSound = "bird_02_flying",
    specialSound = "special_group",
    selectionSound = "bird_02_select",
    unselectionSound = "bird_02_unselect",
    specialty = "CLUSTER_BOMB_EXPLODE",
    explosionRadius = 7.5,
    explosionForce = 40000,
    explosionDamageRadius = 5,
    explosionDamage = 300,
    tutorialInfo = "TUTORIAL_2",
    useLegacyCollisionPath = true
  },
  MightyEagleBird = {
    radius = 5,
    friction = 0.1,
    type = "circle",
    restitution = 0.05,
    sprite = "BIRD_MIGHTY_EAGLE_MOTION",
    spriteFlying = "BIRD_MIGHTY_EAGLE_MOTION",
    spriteCollision = "BIRD_MIGHTY_EAGLE_MOTION",
    spriteAction = "BIRD_MIGHTY_EAGLE_MOTION",
    spriteScore = "BIRD_MIGHTY_EAGLE_RADIAL",
    spriteYell = "BIRD_MIGHTY_EAGLE_RADIAL",
    spriteBlink = "BIRD_MIGHTY_EAGLE_RADIAL",
    allowRoll = true,
    density = 100,
    damageFactors = "MightyEagleBirdDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60000,
    group = "birds",
    groupIndex = 12,
    particles = "smokeBuff",
    particlesAmountLimits = {1, 1},
    particlesTrail = "redBirdTrail",
    collisionSound = "big_brother_collision",
    launchSound = "",
    specialSound = "",
    selectionSound = "",
    unselectionSound = "",
    specialty = "MIGHTY_EAGLE",
    tutorialInfo = "TUTORIAL_8",
    explosionRadius = 100,
    explosionForce = 20000,
    explosionDamageRadius = 100,
    explosionDamage = 1,
    z_order = 999,
    collisionFunction = "mightyEagleCollision",
    frozenFunction = "mightyEagleFrozen",
    updateFunction = "updateMightyEagle",
    collider = collider_types.eagle
  },
  BaitSardine = {
    friction = 0.25,
    type = "box",
    restitution = 0.05,
    sprite = "BAIT_SARDINE",
    spriteFlying = "BAIT_SARDINE",
    spriteCollision = "BAIT_SARDINE",
    spriteAction = "BAIT_SARDINE",
    spriteScore = "BAIT_SARDINE",
    spriteYell = "BAIT_SARDINE",
    spriteBlink = "BAIT_SARDINE",
    allowRoll = true,
    density = 1,
    damageFactors = "DefaultDamageFactors",
    controllable = true,
    materialName = "common",
    strength = 1,
    group = "birds",
    groupIndex = 13,
    particles = "",
    particlesAmountLimits = {0, 0},
    particlesTrail = "redBirdTrail",
    collisionSound = "sardine_can_physics_a2",
    launchSound = "sardine_can_shot",
    specialSound = "mighty_eagle_yell",
    selectionSound = "",
    destroyedSound = "light_destroyed",
    unselectionSound = "",
    specialty = "SUMMON_MIGHTY_EAGLE",
    tutorialInfo = "TUTORIAL_8",
    collisionFunction = "mightyEagleBaitCollision",
    frozenFunction = "mightyEagleBaitFrozen",
    updateFunction = "updateMightyEagleBait",
    timerFunction = "mightyEagleAndBaitTimerUpdate",
    collider = collider_types.bird,
    angularDamping = 2
  },
  BaitGoldenFish = {
    friction = 0.25,
    type = "box",
    restitution = 0.05,
    width = 4,
    height = 1.5,
    sprite = "DRAGON_FISH",
    spriteFlying = "DRAGON_FISH",
    spriteCollision = "DRAGON_FISH",
    spriteAction = "DRAGON_FISH",
    spriteScore = "DRAGON_FISH",
    spriteYell = "DRAGON_FISH",
    spriteBlink = "DRAGON_FISH",
    allowRoll = true,
    density = 1,
    damageFactors = "DefaultDamageFactors",
    controllable = true,
    materialName = "common",
    strength = 1,
    group = "birds",
    groupIndex = 14,
    particles = "",
    particlesAmountLimits = {0, 0},
    particlesTrail = "redBirdTrail",
    launchSound = "futureEagle_antenna_launch",
    selectionSound = "",
    unselectionSound = "",
    specialty = "SUMMON_FUTURE_EAGLE",
    tutorialInfo = "TUTORIAL_11",
    collisionFunction = "mightyDragonBaitFishCollision",
    frozenFunction = "mightyDragonBaitFishFrozen",
    updateFunction = "updateMightyBaitFish",
    timerFunction = "updateMightyDragonTimer",
    collider = collider_types.bird,
    angularDamping = 2
  },
  MightyDragonCreature = {
    radius = 5,
    friction = 0.1,
    type = "circle",
    restitution = 0.05,
    sprite = "MDRAGON_1",
    spriteFlying = "MDRAGON_1",
    spriteCollision = "MDRAGON_1",
    spriteAction = "MDRAGON_1",
    spriteScore = "MDRAGON_1",
    spriteYell = "MDRAGON_1",
    spriteBlink = "MDRAGON_1",
    allowRoll = true,
    density = 100,
    damageFactors = "MightyDragonDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60000,
    group = "birds",
    groupIndex = 12,
    particles = "",
    particlesAmountLimits = {1, 1},
    particlesTrail = "mightyDragonParticles",
    launchSound = "",
    specialSound = "",
    selectionSound = "",
    unselectionSound = "",
    specialty = "FUTURE_EAGLE",
    tutorialInfo = "TUTORIAL_11",
    explosionRadius = 15,
    explosionForce = 1200,
    explosionDamageRadius = 1,
    explosionDamage = 0,
    z_order = 999,
    collisionFunction = "mightyDragonCollision",
    frozenFunction = "mightyDragonFrozen",
    updateFunction = "animateMightyDragon",
    collider = collider_types.eagle
  },
  MightyDragonTail2 = {
    radius = 2,
    friction = 0.1,
    type = "circle",
    restitution = 0.05,
    sprite = "MDRAGON_2",
    spriteFlying = "MDRAGON_2",
    spriteCollision = "MDRAGON_2",
    spriteAction = "MDRAGON_2",
    spriteScore = "MDRAGON_2",
    spriteYell = "MDRAGON_2",
    spriteBlink = "MDRAGON_2",
    allowRoll = true,
    density = 100,
    damageFactors = "MightyDragonDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60000,
    group = "birds",
    groupIndex = 12,
    particles = "",
    particlesAmountLimits = {1, 1},
    particlesTrail = "mightyDragonParticles",
    launchSound = "",
    specialSound = "",
    selectionSound = "",
    unselectionSound = "",
    specialty = "FUTURE_EAGLE",
    tutorialInfo = "TUTORIAL_11",
    explosionRadius = 100,
    explosionForce = 20000,
    explosionDamageRadius = 100,
    explosionDamage = 1,
    z_order = 999,
    collider = collider_types.eagle
  },
  MightyDragonTail3 = {
    radius = 2,
    friction = 0.1,
    type = "circle",
    restitution = 0.05,
    sprite = "MDRAGON_3",
    spriteFlying = "MDRAGON_3",
    spriteCollision = "MDRAGON_3",
    spriteAction = "MDRAGON_3",
    spriteScore = "MDRAGON_3",
    spriteYell = "MDRAGON_3",
    spriteBlink = "MDRAGON_3",
    allowRoll = true,
    density = 100,
    damageFactors = "MightyDragonDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60000,
    group = "birds",
    groupIndex = 12,
    particles = "",
    particlesAmountLimits = {1, 1},
    particlesTrail = "mightyDragonParticles",
    launchSound = "",
    specialSound = "",
    selectionSound = "",
    unselectionSound = "",
    specialty = "FUTURE_EAGLE",
    tutorialInfo = "TUTORIAL_11",
    explosionRadius = 100,
    explosionForce = 20000,
    explosionDamageRadius = 100,
    explosionDamage = 1,
    z_order = 999,
    collider = collider_types.eagle
  },
  MightyDragonTail4 = {
    radius = 2,
    friction = 0.1,
    type = "circle",
    restitution = 0.05,
    sprite = "MDRAGON_4",
    spriteFlying = "MDRAGON_4",
    spriteCollision = "MDRAGON_4",
    spriteAction = "MDRAGON_4",
    spriteScore = "MDRAGON_4",
    spriteYell = "MDRAGON_4",
    spriteBlink = "MDRAGON_4",
    allowRoll = true,
    density = 100,
    damageFactors = "MightyDragonDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60000,
    group = "birds",
    groupIndex = 12,
    particles = "",
    particlesAmountLimits = {1, 1},
    particlesTrail = "mightyDragonParticles",
    launchSound = "",
    specialSound = "",
    selectionSound = "",
    unselectionSound = "",
    specialty = "FUTURE_EAGLE",
    tutorialInfo = "TUTORIAL_11",
    explosionRadius = 100,
    explosionForce = 20000,
    explosionDamageRadius = 0,
    explosionDamage = 0,
    z_order = 999,
    collider = collider_types.eagle
  },
  MightyDragonTail5 = {
    radius = 2,
    friction = 0.1,
    type = "circle",
    restitution = 0.05,
    sprite = "MDRAGON_5",
    spriteFlying = "MDRAGON_5",
    spriteCollision = "MDRAGON_5",
    spriteAction = "MDRAGON_5",
    spriteScore = "MDRAGON_5",
    spriteYell = "MDRAGON_5",
    spriteBlink = "MDRAGON_5",
    allowRoll = true,
    density = 100,
    damageFactors = "MightyDragonDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60000,
    group = "birds",
    groupIndex = 12,
    particles = "",
    particlesAmountLimits = {1, 1},
    particlesTrail = "mightyDragonParticles",
    launchSound = "",
    specialSound = "",
    selectionSound = "",
    unselectionSound = "",
    specialty = "FUTURE_EAGLE",
    tutorialInfo = "TUTORIAL_11",
    explosionRadius = 100,
    explosionForce = 20000,
    explosionDamageRadius = 100,
    explosionDamage = 1,
    z_order = 999,
    collider = collider_types.eagle
  },
  MightyDragonTail6 = {
    radius = 2,
    friction = 0.1,
    type = "circle",
    restitution = 0.05,
    sprite = "MDRAGON_6",
    spriteFlying = "MDRAGON_6",
    spriteCollision = "MDRAGON_6",
    spriteAction = "MDRAGON_6",
    spriteScore = "MDRAGON_6",
    spriteYell = "MDRAGON_6",
    spriteBlink = "MDRAGON_6",
    allowRoll = true,
    density = 100,
    damageFactors = "MightyDragonDamageFactors",
    controllable = true,
    materialName = "red",
    strength = 60000,
    group = "birds",
    groupIndex = 12,
    particles = "",
    particlesAmountLimits = {1, 1},
    particlesTrail = "mightyDragonParticles",
    launchSound = "",
    specialSound = "",
    selectionSound = "",
    unselectionSound = "",
    specialty = "FUTURE_EAGLE",
    tutorialInfo = "TUTORIAL_11",
    explosionRadius = 100,
    explosionForce = 20000,
    explosionDamageRadius = 100,
    explosionDamage = 1,
    z_order = 999,
    collider = collider_types.eagle
  },
  SmallPiglette = {
    radius = 1.075,
    type = "circle",
    sprite = "PIGLETTE_SMALL_01",
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 4,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 1,
    damageSprites = {
      damage1 = {
        sprite = "PIGLETTE_SMALL_01",
        blinkSprite = "PIGLETTE_SMALL_01_BLINK",
        smileSprite = "PIGLETTE_SMALL_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIGLETTE_SMALL_02",
        blinkSprite = "PIGLETTE_SMALL_02_BLINK",
        smileSprite = "PIGLETTE_SMALL_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIGLETTE_SMALL_03",
        blinkSprite = "PIGLETTE_SMALL_03_BLINK",
        smileSprite = "PIGLETTE_SMALL_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  MediumPiglette = {
    radius = 1.85,
    friction = 0.3,
    type = "circle",
    sprite = "PIGLETTE_MEDIUM_01",
    density = 2,
    controllable = false,
    materialName = "piglette",
    strength = 10,
    defence = 1,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 2,
	levelGoal = true,
    damageSprites = {
      damage1 = {
        sprite = "PIGLETTE_MEDIUM_01",
        blinkSprite = "PIGLETTE_MEDIUM_01_BLINK",
        smileSprite = "PIGLETTE_MEDIUM_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIGLETTE_MEDIUM_02",
        blinkSprite = "PIGLETTE_MEDIUM_02_BLINK",
        smileSprite = "PIGLETTE_MEDIUM_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIGLETTE_MEDIUM_03",
        blinkSprite = "PIGLETTE_MEDIUM_03_BLINK",
        smileSprite = "PIGLETTE_MEDIUM_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  HelmetPiglette = {
    radius = 1.95,
    friction = 0.3,
    type = "circle",
    sprite = "PIGLETTE_HELMET_01",
    density = 2,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 15,
    defence = 8,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 3,
    damageSprites = {
      damage1 = {
        sprite = "PIGLETTE_HELMET_01",
        blinkSprite = "PIGLETTE_HELMET_01_BLINK",
        smileSprite = "PIGLETTE_HELMET_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIGLETTE_HELMET_02",
        blinkSprite = "PIGLETTE_HELMET_02_BLINK",
        smileSprite = "PIGLETTE_HELMET_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIGLETTE_HELMET_03",
        blinkSprite = "PIGLETTE_HELMET_03_BLINK",
        smileSprite = "PIGLETTE_HELMET_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  LargePiglette = {
    radius = 2.325,
    friction = 0.3,
    type = "circle",
    sprite = "PIGLETTE_BIG_01",
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 20,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 4,
    damageSprites = {
      damage1 = {
        sprite = "PIGLETTE_BIG_01",
        blinkSprite = "PIGLETTE_BIG_01_BLINK",
        smileSprite = "PIGLETTE_BIG_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIGLETTE_BIG_02",
        blinkSprite = "PIGLETTE_BIG_02_BLINK",
        smileSprite = "PIGLETTE_BIG_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIGLETTE_BIG_03",
        blinkSprite = "PIGLETTE_BIG_03_BLINK",
        smileSprite = "PIGLETTE_BIG_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  GrandpaPiglette = {
    radius = 2.2,
    friction = 0.3,
    type = "circle",
    sprite = "PIGLETTE_GRANDPA_01",
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 30,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 5,
    damageSprites = {
      damage1 = {
        sprite = "PIGLETTE_GRANDPA_01",
        blinkSprite = "PIGLETTE_GRANDPA_01_BLINK",
        smileSprite = "PIGLETTE_GRANDPA_04_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIGLETTE_GRANDPA_02",
        blinkSprite = "PIGLETTE_GRANDPA_02_BLINK",
        smileSprite = "PIGLETTE_GRANDPA_05_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIGLETTE_GRANDPA_03",
        blinkSprite = "PIGLETTE_GRANDPA_03_BLINK",
        smileSprite = "PIGLETTE_GRANDPA_06_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  KingPiglette = {
    radius = 2.825,
    friction = 0.3,
    type = "circle",
    sprite = "PIGLETTE_KING_01",
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    defence = 0,
    strength = 100,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 6,
    damageSprites = {
      damage1 = {
        sprite = "PIGLETTE_KING_01",
        blinkSprite = "PIGLETTE_KING_01_BLINK",
        smileSprite = "PIGLETTE_KING_07_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIGLETTE_KING_02",
        blinkSprite = "PIGLETTE_KING_02_BLINK",
        smileSprite = "PIGLETTE_KING_08_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIGLETTE_KING_03",
        blinkSprite = "PIGLETTE_KING_03_BLINK",
        smileSprite = "PIGLETTE_KING_09_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  SackSmallPiglette = {
    radius = 1.075,
    type = "circle",
    sprite = "SACK_PIGLETTE_SMALL_1",
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 4,
    particles = {"smokeBuff", "strawBurst"},
    spriteScore = "5K_SACK",
    group = "levelGoals",
    groupIndex = 7,
    damageSprites = {
      damage1 = {
        sprite = "SACK_PIGLETTE_SMALL_1",
        blinkSprite = "SACK_PIGLETTE_SMALL_1",
        smileSprite = "SACK_PIGLETTE_SMALL_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SACK_PIGLETTE_SMALL_2",
        blinkSprite = "SACK_PIGLETTE_SMALL_2",
        smileSprite = "SACK_PIGLETTE_SMALL_2",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "SACK_PIGLETTE_SMALL_3",
        blinkSprite = "SACK_PIGLETTE_SMALL_3",
        smileSprite = "SACK_PIGLETTE_SMALL_3",
        max = 50,
        min = -1000
      }
    }
  },
  SackMediumPiglette = {
    radius = 1.85,
    friction = 0.3,
    type = "circle",
    sprite = "SACK_PIGLETTE_MEDIUM_1",
    density = 2,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 10,
    defence = 1,
    particles = {"smokeBuff", "strawBurst"},
    spriteScore = "5K_SACK",
    group = "levelGoals",
    groupIndex = 8,
    damageSprites = {
      damage1 = {
        sprite = "SACK_PIGLETTE_MEDIUM_1",
        blinkSprite = "SACK_PIGLETTE_MEDIUM_1",
        smileSprite = "SACK_PIGLETTE_MEDIUM_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SACK_PIGLETTE_MEDIUM_2",
        blinkSprite = "SACK_PIGLETTE_MEDIUM_2",
        smileSprite = "SACK_PIGLETTE_MEDIUM_2",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "SACK_PIGLETTE_MEDIUM_3",
        blinkSprite = "SACK_PIGLETTE_MEDIUM_3",
        smileSprite = "SACK_PIGLETTE_MEDIUM_3",
        max = 50,
        min = -1000
      }
    }
  },
  SackHelmetPiglette = {
    radius = 1.95,
    friction = 0.3,
    type = "circle",
    sprite = "SACK_PIGLETTE_HELMET_1",
    density = 2,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 15,
    defence = 8,
    particles = {"smokeBuff", "strawBurst"},
    spriteScore = "5K_SACK",
    group = "levelGoals",
    groupIndex = 9,
    damageSprites = {
      damage1 = {
        sprite = "SACK_PIGLETTE_HELMET_1",
        blinkSprite = "SACK_PIGLETTE_HELMET_1",
        smileSprite = "SACK_PIGLETTE_HELMET_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SACK_PIGLETTE_HELMET_2",
        blinkSprite = "SACK_PIGLETTE_HELMET_2",
        smileSprite = "SACK_PIGLETTE_HELMET_2",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "SACK_PIGLETTE_HELMET_3",
        blinkSprite = "SACK_PIGLETTE_HELMET_3",
        smileSprite = "SACK_PIGLETTE_HELMET_3",
        max = 50,
        min = -1000
      }
    }
  },
  SackLargePiglette = {
    radius = 2.325,
    friction = 0.3,
    type = "circle",
    sprite = "SACK_PIGLETTE_BIG_1",
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 20,
    particles = {"smokeBuff", "strawBurst"},
    spriteScore = "5K_SACK",
    group = "levelGoals",
    groupIndex = 10,
    damageSprites = {
      damage1 = {
        sprite = "SACK_PIGLETTE_BIG_1",
        blinkSprite = "SACK_PIGLETTE_BIG_1",
        smileSprite = "SACK_PIGLETTE_BIG_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SACK_PIGLETTE_BIG_2",
        blinkSprite = "SACK_PIGLETTE_BIG_2",
        smileSprite = "SACK_PIGLETTE_BIG_2",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "SACK_PIGLETTE_BIG_3",
        blinkSprite = "SACK_PIGLETTE_BIG_3",
        smileSprite = "SACK_PIGLETTE_BIG_3",
        max = 50,
        min = -1000
      }
    }
  },
  SackGrandpaPiglette = {
    radius = 2.2,
    friction = 0.3,
    type = "circle",
    sprite = "SACK_PIGLETTE_GRANDPA_1",
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 30,
    particles = {"smokeBuff", "strawBurst"},
    spriteScore = "5K_SACK",
    group = "levelGoals",
    groupIndex = 11,
    damageSprites = {
      damage1 = {
        sprite = "SACK_PIGLETTE_GRANDPA_1",
        blinkSprite = "SACK_PIGLETTE_GRANDPA_1",
        smileSprite = "SACK_PIGLETTE_GRANDPA_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SACK_PIGLETTE_GRANDPA_2",
        blinkSprite = "SACK_PIGLETTE_GRANDPA_2",
        smileSprite = "SACK_PIGLETTE_GRANDPA_2",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "SACK_PIGLETTE_GRANDPA_3",
        blinkSprite = "SACK_PIGLETTE_GRANDPA_3",
        smileSprite = "SACK_PIGLETTE_GRANDPA_3",
        max = 50,
        min = -1000
      }
    }
  },
  ChromeSmallPiglette = {
    radius = 1.075,
    type = "circle",
    sprite = "PIG_BASIC_SMALL_01",
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 4,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 12,
    damageSprites = {
      damage1 = {
        sprite = "PIG_BASIC_SMALL_01",
        blinkSprite = "PIG_BASIC_SMALL_01_BLINK",
        smileSprite = "PIG_BASIC_SMALL_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIG_BASIC_SMALL_02",
        blinkSprite = "PIG_BASIC_SMALL_02_BLINK",
        smileSprite = "PIG_BASIC_SMALL_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIG_BASIC_SMALL_03",
        blinkSprite = "PIG_BASIC_SMALL_03_BLINK",
        smileSprite = "PIG_BASIC_SMALL_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  ChromeMediumPiglette = {
    radius = 1.85,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_BASIC_MEDIUM_01",
    density = 2,
	ninjaPig = true,
	interactWithBirds = true,
	detectRadius = 15,
    controllable = false,
    materialName = "piglette",
    strength = 10,
    defence = 1,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 13,
	levelGoal = true,
    damageSprites = {
      damage1 = {
        sprite = "PIG_BASIC_MEDIUM_01",
        blinkSprite = "PIG_BASIC_MEDIUM_01_BLINK",
        smileSprite = "PIG_BASIC_MEDIUM_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIG_BASIC_MEDIUM_02",
        blinkSprite = "PIG_BASIC_MEDIUM_02_BLINK",
        smileSprite = "PIG_BASIC_MEDIUM_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIG_BASIC_MEDIUM_03",
        blinkSprite = "PIG_BASIC_MEDIUM_03_BLINK",
        smileSprite = "PIG_BASIC_MEDIUM_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  ChromeHelmetPiglette = {
    radius = 1.95,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_HELMET_01",
    density = 2,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 15,
    defence = 8,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 14,
    damageSprites = {
      damage1 = {
        sprite = "PIG_HELMET_01",
        blinkSprite = "PIG_HELMET_01_BLINK",
        smileSprite = "PIG_HELMET_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIG_HELMET_02",
        blinkSprite = "PIG_HELMET_02_BLINK",
        smileSprite = "PIG_HELMET_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIG_HELMET_03",
        blinkSprite = "PIG_HELMET_03_BLINK",
        smileSprite = "PIG_HELMET_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  ChromeLargePiglette = {
    radius = 2.325,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_BASIC_BIG_01",
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 20,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 15,
    damageSprites = {
      damage1 = {
        sprite = "PIG_BASIC_BIG_01",
        blinkSprite = "PIG_BASIC_BIG_01_BLINK",
        smileSprite = "PIG_BASIC_BIG_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIG_BASIC_BIG_02",
        blinkSprite = "PIG_BASIC_BIG_02_BLINK",
        smileSprite = "PIG_BASIC_BIG_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIG_BASIC_BIG_03",
        blinkSprite = "PIG_BASIC_BIG_03_BLINK",
        smileSprite = "PIG_BASIC_BIG_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  ChromeGrandpaPiglette = {
    radius = 2.2,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_MUSTACHE_01",
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    strength = 30,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 16,
    damageSprites = {
      damage1 = {
        sprite = "PIG_MUSTACHE_01",
        blinkSprite = "PIG_MUSTACHE_01_BLINK",
        smileSprite = "PIG_MUSTACHE_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIG_MUSTACHE_02",
        blinkSprite = "PIG_MUSTACHE_02_BLINK",
        smileSprite = "PIG_MUSTACHE_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIG_MUSTACHE_03",
        blinkSprite = "PIG_MUSTACHE_03_BLINK",
        smileSprite = "PIG_MUSTACHE_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  ChromeKingPiglette = {
    radius = 2.825,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_KING_01",	
    density = 1,
    controllable = false,
    levelGoal = true,
    materialName = "piglette",
    defence = 0,
    strength = 100,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 17,
    damageSprites = {
      damage1 = {
        sprite = "PIG_KING_01",
        blinkSprite = "PIG_KING_01_BLINK",
        smileSprite = "PIG_KING_01_SMILE",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "PIG_KING_02",
        blinkSprite = "PIG_KING_02_BLINK",
        smileSprite = "PIG_KING_02_SMILE",
        max = 90,
        min = 50
      },
      damage3 = {
        sprite = "PIG_KING_03",
        blinkSprite = "PIG_KING_03_BLINK",
        smileSprite = "PIG_KING_03_SMILE",
        max = 50,
        min = -1000
      }
    }
  },
  ComplexChromeSmallPiglette = {
    radius = 1.075,
    type = "circle",
    sprite = "PIG_BASIC_SMALL_01",
    controllable = false,
    levelGoal = true,
	entityAnimation = {
		failedAnimation = {
	--[[1]] {
				{"PIG_BASIC_SMALL_01_SMILE_2", 0.6, ""},
				{"PIG_BASIC_SMALL_01_SMILE", 1, ""}
			},
	--[[2]] {
				{"PIG_BASIC_SMALL_02_SMILE", 0.6, ""},
				{"PIG_BASIC_SMALL_02_SMILE_2", 0.6, ""}
			},
	--[[3]] {
				{"PIG_BASIC_SMALL_03_SMILE", 0.6, ""},
				{"PIG_BASIC_SMALL_03_SMILE_2", 0.6, ""}
			}			
		},
		gap = {5, 30}
	},
	damageStateAnimations = {
--[[1]] {
			{
				{"PIG_BASIC_SMALL_SAD_1", 0.1, ""},
				{"PIG_BASIC_SMALL_SAD_2", 0.1, ""},					
				loopAmount = {10,14}					
			},
			{
				{"PIG_BASIC_SMALL_SLEEP_1", 1, "snoring_start"},
				{"PIG_BASIC_SMALL_SLEEP_2", 1, "snoring_finish"},
				loopAmount = {3,3}
			},
			{
				{"PIG_BASIC_SMALL_SNORT", 1, ""},
				loopAmount = {1,1}
			},
			{
				{"PIG_BASIC_SMALL_01_BLINK", 0.4, ""},
				{"PIG_BASIC_SMALL_01", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_SMALL_SCARED_1", 3, ""},
				{"PIG_BASIC_SMALL_SCARED_2", 0.4, ""},
				loopAmount = {2,2}
			},
			{
				{"PIG_BASIC_SMALL_HAPPY_2", 1, ""},
				{"PIG_BASIC_SMALL_SIDESMILE", 0.4, "piglette"},
				loopAmount = {2, 2}
			},				
			{
				{"PIG_BASIC_SMALL_01_SMILE_2", 0.6, ""},
				{"PIG_BASIC_SMALL_01_SMILE", 0.4, "piglette"},
				loopAmount = {2,3}
			},			
		},
--[[2]] {
			{
				{"PIG_BASIC_SMALL_02_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_BASIC_SMALL_02_BLINK", 0.4, ""},
				{"PIG_BASIC_SMALL_02", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_SMALL_02_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
--[[3]] {
			{
				{"PIG_BASIC_SMALL_03_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_BASIC_SMALL_03_BLINK", 0.4, ""},
				{"PIG_BASIC_SMALL_03", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_SMALL_03_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},		
		damageStatelimits = {{100, 90}, {90, 50}, {50, -1000}},
		damageStateSprites = {"PIG_BASIC_SMALL_01", "PIG_BASIC_SMALL_02", "PIG_BASIC_SMALL_03"}
	},
    materialName = "piglette",
    strength = 4,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 18
  },
  ComplexChromeMediumPiglette = {
    radius = 1.85,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_BASIC_MEDIUM_01",
    density = 2,
    controllable = false,
	levelGoal = true,
	entityAnimation = {
		failedAnimation = {
	--[[1]] {
				{"PIG_BASIC_MEDIUM_01_SMILE_2", 0.6, ""},
				{"PIG_BASIC_MEDIUM_01_SMILE", 1, ""}
			},
	--[[2]] {
				{"PIG_BASIC_MEDIUM_02_SMILE", 0.6, ""},
				{"PIG_BASIC_MEDIUM_02_SMILE_2", 1, ""}
			},
	--[[3]] {
				{"PIG_BASIC_MEDIUM_03_SMILE", 0.6, ""},
				{"PIG_BASIC_MEDIUM_03_SMILE_2", 1, ""}
			}			
		},
		gap = {5, 30}		
	},
	damageStateAnimations = {
--[[1]] {
			{
				{"PIG_BASIC_MEDIUM_SAD_1", 0.1, ""},
				{"PIG_BASIC_MEDIUM_SAD_2", 0.1, ""},					
				loopAmount = {10,14}					
			},
			{
				{"PIG_BASIC_MEDIUM_SLEEP_1", 1, "snoring_start"},
				{"PIG_BASIC_MEDIUM_SLEEP_2", 1, "snoring_finish"},
				loopAmount = {3,3}
			},
			{
				{"PIG_BASIC_MEDIUM_SNORT", 1, ""},
				loopAmount = {1,1}
			},
			{
				{"PIG_BASIC_MEDIUM_01_BLINK", 0.4, ""},
				{"PIG_BASIC_MEDIUM_01", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_MEDIUM_SCARED_1", 3, ""},
				{"PIG_BASIC_MEDIUM_SCARED_2", 0.4, ""},
				loopAmount = {2,2}
			},
			{
				{"PIG_BASIC_MEDIUM_HAPPY_2", 1, ""},
				{"PIG_BASIC_MEDIUM_SIDESMILE", 0.4, "piglette"},
				loopAmount = {2, 2}
			},				
			{
				{"PIG_BASIC_MEDIUM_01_SMILE_2", 0.6, "piglette"},
				{"PIG_BASIC_MEDIUM_01_SMILE", 0.4, ""},
				loopAmount = {2,3}
			},			
		},
--[[2]] {
			{
				{"PIG_BASIC_MEDIUM_02_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_BASIC_MEDIUM_02_BLINK", 0.4, ""},
				{"PIG_BASIC_MEDIUM_02", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_MEDIUM_02_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
--[[3]] {
			{
				{"PIG_BASIC_MEDIUM_03_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_BASIC_MEDIUM_03_BLINK", 0.4, ""},
				{"PIG_BASIC_MEDIUM_03", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_MEDIUM_03_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
		damageStatelimits = {{100, 90}, {90, 50}, {50, -1000}},
		damageStateSprites = {"PIG_BASIC_MEDIUM_01", "PIG_BASIC_MEDIUM_02", "PIG_BASIC_MEDIUM_03"}
	},
    materialName = "piglette",
    strength = 10,
    defence = 1,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 19
  },
  ComplexChromeHelmetPiglette = {
    radius = 1.95,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_HELMET_01",
    density = 2,
    controllable = false,
    levelGoal = true,
	entityAnimation = {
		failedAnimation = {
	--[[1]] {
				{"PIG_HELMET_01_SMILE_2", 0.6, ""},
				{"PIG_HELMET_01_SMILE", 1, ""}
			},
	--[[2]] {
				{"PIG_HELMET_02_SMILE", 0.6, ""},
				{"PIG_HELMET_02_SMILE_2", 0.6, ""}
			},
	--[[3]] {
				{"PIG_HELMET_03_SMILE", 0.6, ""},
				{"PIG_HELMET_03_SMILE_2", 0.6, ""}
			}			
		},
		gap = {5, 30}
	},
	damageStateAnimations = {
--[[1]] {
			{
				{"PIG_HELMET_SAD_1", 0.1, ""},
				{"PIG_HELMET_SAD_2", 0.1, ""},					
				loopAmount = {10,14}					
			},
			{
				{"PIG_HELMET_SLEEP_1", 1, "snoring_start"},
				{"PIG_HELMET_SLEEP_2", 1, "snoring_finish"},
				loopAmount = {3,3}
			},
			{
				{"PIG_HELMET_SNORT", 1, ""},
				loopAmount = {1,1}
			},
			{
				{"PIG_HELMET_01_BLINK", 0.4, ""},
				{"PIG_HELMET_01", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_HELMET_SCARED_1", 3, ""},
				{"PIG_HELMET_SCARED_2", 0.4, ""},
				loopAmount = {2,2}
			},
			{
				{"PIG_HELMET_HAPPY_2", 1, ""},
				{"PIG_HELMET_SIDESMILE", 0.4, "piglette"},
				loopAmount = {2, 2}
			},				
			{
				{"PIG_HELMET_01_SMILE_2", 0.6, ""},
				{"PIG_HELMET_01_SMILE", 0.4, "piglette"},
				loopAmount = {2,3}
			},			
		},
--[[2]] {
			{
				{"PIG_HELMET_02_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_HELMET_02_BLINK", 0.4, ""},
				{"PIG_HELMET_02", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_HELMET_02_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
--[[3]] {
			{
				{"PIG_HELMET_03_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_HELMET_03_BLINK", 0.4, ""},
				{"PIG_HELMET_03", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_HELMET_03_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},		
		damageStatelimits = {{100, 90}, {90, 50}, {50, -1000}},
		damageStateSprites = {"PIG_HELMET_01", "PIG_HELMET_02", "PIG_HELMET_03"}
	},
    materialName = "piglette",
    strength = 15,
    defence = 8,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 20
  },
  ComplexChromeLargePiglette = {
    radius = 2.325,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_BASIC_BIG_01",
    density = 1,
    controllable = false,
    levelGoal = true,
	entityAnimation = {
		failedAnimation = {
	--[[1]] {
				{"PIG_BASIC_BIG_01_SMILE_2", 0.6, ""},
				{"PIG_BASIC_BIG_01_SMILE", 1, ""}
			},
	--[[2]] {
				{"PIG_BASIC_BIG_02_SMILE", 0.6, ""},
				{"PIG_BASIC_BIG_02_SMILE_2", 0.6, ""}
			},
	--[[3]] {
				{"PIG_BASIC_BIG_03_SMILE", 0.6, ""},
				{"PIG_BASIC_BIG_03_SMILE_2", 0.6, ""}
			}			
		},
		gap = {5, 30}
	},
	damageStateAnimations = {
--[[1]] {
			{
				{"PIG_BASIC_BIG_SAD_1", 0.1, ""},
				{"PIG_BASIC_BIG_SAD_2", 0.1, ""},					
				loopAmount = {10,14}					
			},
			{
				{"PIG_BASIC_BIG_SLEEP_1", 1, "snoring_start"},
				{"PIG_BASIC_BIG_SLEEP_2", 1, "snoring_finish"},
				loopAmount = {3,3}
			},
			{
				{"PIG_BASIC_BIG_SNORT", 1, ""},
				loopAmount = {1,1}
			},
			{
				{"PIG_BASIC_BIG_01_BLINK", 0.4, ""},
				{"PIG_BASIC_BIG_01", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_BIG_SCARED_1", 3, ""},
				{"PIG_BASIC_BIG_SCARED_2", 0.4, ""},
				loopAmount = {2,2}
			},
			{
				{"PIG_BASIC_BIG_HAPPY_2", 1, ""},
				{"PIG_BASIC_BIG_SIDESMILE", 0.4, "piglette"},
				loopAmount = {2, 2}
			},				
			{
				{"PIG_BASIC_BIG_01_SMILE_2", 0.6, ""},
				{"PIG_BASIC_BIG_01_SMILE", 0.4, "piglette"},
				loopAmount = {2,3}
			},			
		},
--[[2]] {
			{
				{"PIG_BASIC_BIG_02_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_BASIC_BIG_02_BLINK", 0.4, ""},
				{"PIG_BASIC_BIG_02", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_BIG_02_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
--[[3]] {
			{
				{"PIG_BASIC_BIG_03_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_BASIC_BIG_03_BLINK", 0.4, ""},
				{"PIG_BASIC_BIG_03", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_BASIC_BIG_03_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},		
		damageStatelimits = {{100, 90}, {90, 50}, {50, -1000}},
		damageStateSprites = {"PIG_BASIC_BIG_01", "PIG_BASIC_BIG_02", "PIG_BASIC_BIG_03"}
	},
    materialName = "piglette",
    strength = 20,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 21
  },
  ComplexChromeGrandpaPiglette = {
    radius = 2.2,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_MUSTACHE_01",
    density = 1,
    controllable = false,
    levelGoal = true,
	entityAnimation = {
		failedAnimation = {
	--[[1]] {
				{"PIG_MUSTACHE_01_SMILE_2", 0.6, ""},
				{"PIG_MUSTACHE_01_SMILE", 1, ""}
			},
	--[[2]] {
				{"PIG_MUSTACHE_02_SMILE", 0.6, ""},
				{"PIG_MUSTACHE_02_SMILE_2", 0.6, ""}
			},
	--[[3]] {
				{"PIG_MUSTACHE_03_SMILE", 0.6, ""},
				{"PIG_MUSTACHE_03_SMILE_2", 0.6, ""}
			}			
		},
		gap = {5, 30}
	},
    damageStateAnimations = {			
--[[1]] {
			{
				{"PIG_MUSTACHE_SAD_1", 0.1, ""},
				{"PIG_MUSTACHE_SAD_2", 0.1, ""},					
				loopAmount = {10,14}					
			},
			{
				{"PIG_MUSTACHE_SLEEP_1", 1, "snoring_start"},
				{"PIG_MUSTACHE_SLEEP_2", 1, "snoring_finish"},
				loopAmount = {3,3}
			},
			{
				{"PIG_MUSTACHE_SNORT", 1, ""},
				loopAmount = {1,1}
			},
			{
				{"PIG_MUSTACHE_01_BLINK", 0.4, ""},
				{"PIG_MUSTACHE_01", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_MUSTACHE_SCARED_1", 3, ""},
				{"PIG_MUSTACHE_SCARED_2", 0.4, ""},
				loopAmount = {2,2}
			},
			{
				{"PIG_MUSTACHE_HAPPY_2", 1, ""},
				{"PIG_MUSTACHE_SIDESMILE", 0.4, "piglette"},
				loopAmount = {2, 2}
			},				
			{
				{"PIG_MUSTACHE_01_SMILE_2", 0.6, ""},
				{"PIG_MUSTACHE_01_SMILE", 0.4, "piglette"},
				loopAmount = {2,3}
			},			
		},
--[[2]] {
			{
				{"PIG_MUSTACHE_02_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_MUSTACHE_02_BLINK", 0.4, ""},
				{"PIG_MUSTACHE_02", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_MUSTACHE_02_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
--[[3]] {
			{
				{"PIG_MUSTACHE_03_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_MUSTACHE_03_BLINK", 0.4, ""},
				{"PIG_MUSTACHE_03", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_MUSTACHE_03_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},		
		damageStatelimits = {{100, 90}, {90, 50}, {50, -1000}},
		damageStateSprites = {"PIG_MUSTACHE_01", "PIG_MUSTACHE_02", "PIG_MUSTACHE_03"}
	},
	materialName = "piglette",
    strength = 30,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 22
  },
  ComplexChromeKingPig = {
    radius = 2.825,
    friction = 0.3,
    type = "circle",
    sprite = "PIG_KING_01",
    density = 1,
    controllable = false,
    levelGoal = true,
	entityAnimation = {	
		failedAnimation = {
	--[[1]] {
				{"PIG_KING_01_SMILE_2", 0.6, ""},
				{"PIG_KING_01_SMILE", 1, ""}
			},
	--[[2]] {
				{"PIG_KING_02_SMILE", 0.6, ""},
				{"PIG_KING_02_SMILE_2", 0.6, ""}
			},
	--[[3]] {
				{"PIG_KING_03_SMILE", 0.6, ""},
				{"PIG_KING_03_SMILE_2", 0.6, ""}
			}			
		},
		gap = {5, 30}		
	},
	damageStateAnimations = {
--[[1]] {
			{
				{"PIG_KING_SAD_1", 0.1},
				{"PIG_KING_SAD_2", 0.1},					
				loopAmount = {10,14}					
			},
			{
				{"PIG_KING_SLEEP_1", 1, "snoring_start"},
				{"PIG_KING_SLEEP_2", 1, "snoring_finish"},
				loopAmount = {3,3}
			},
			{
				{"PIG_KING_SNORT", 1},
				loopAmount = {1,1}
			},
			{
				{"PIG_KING_01_BLINK", 0.4},
				{"PIG_KING_01", 2},
				loopAmount = {2,3}
			},
			{
				{"PIG_KING_SCARED_1", 3},
				{"PIG_KING_SCARED_2", 0.4},
				loopAmount = {2,2}
			},
			{
				{"PIG_KING_HAPPY_2", 1},
				{"PIG_KING_SIDESMILE", 0.4, "piglette"},
				loopAmount = {2, 2}
			},				
			{
				{"PIG_KING_01_SMILE_2", 0.6},
				{"PIG_KING_01_SMILE", 0.4, "piglette"},
				loopAmount = {2,3}
			},			
		},
--[[2]] {
			{
				{"PIG_KING_02_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_KING_02_BLINK", 0.4, ""},
				{"PIG_KING_02", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_KING_02_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
--[[3]] {
			{
				{"PIG_KING_03_SMILE_2", 1, "piglette"},
				loopAmount = {1,2}
			},
			{
				{"PIG_KING_03_BLINK", 0.4, ""},
				{"PIG_KING_03", 2, ""},
				loopAmount = {2,3}
			},
			{
				{"PIG_KING_03_SMILE", 1, "piglette"},
				loopAmount = {1,2}
			}
		},
		damageStatelimits = {{100, 90}, {90, 50}, {50, -1000}},
		damageStateSprites = {"PIG_KING_01", "PIG_KING_02", "PIG_KING_03"}
	},
    materialName = "piglette",
    defence = 0,
    strength = 100,
    particles = "smokeBuff",
    spriteScore = "5K_GREEN",
    group = "levelGoals",
    groupIndex = 23
  },
  WoodBlock1 = {
    type = "box",
    sprite = "BLOCK_WOOD_1_1",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 1,
    strength = 20,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_1",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_1",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_1",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock2 = {
    type = "box",
    sprite = "BLOCK_WOOD_1_2",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 2,
    strength = 40,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_2",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_2",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_2",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock3 = {
    type = "box",
    sprite = "BLOCK_WOOD_1_3",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 3,
    strength = 60,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_3",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_3",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_3",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock4 = {
    type = "box",
    sprite = "BLOCK_WOOD_1_4",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 4,
    strength = 50,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_4",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_4",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_4",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_4",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock5 = {
    type = "box",
    sprite = "BLOCK_WOOD_1_5",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 5,
    strength = 80,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_5",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_5",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_5",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_5",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock6 = {
    type = "box",
    sprite = "BLOCK_WOOD_1_6",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 6,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_6",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_6",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_6",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_6",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock7 = {
    type = "circle",
    sprite = "BLOCK_WOOD_1_7",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 7,
    strength = 200,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_7",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_7",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_7",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_7",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock8 = {
    type = "circle",
    sprite = "BLOCK_WOOD_1_8",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 8,
    strength = 150,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_1_8",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_2_8",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_3_8",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4_8",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock9 = {
    type = "box",
    sprite = "BLOCK_WOOD_4X4_1",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 9,
    strength = 120,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_4X4_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_4X4_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_4X4_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_4X4_4",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock10 = {
    type = "box",
    sprite = "BLOCK_WOOD_10X1_1",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 10,
    strength = 100,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_10X1_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_10X1_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_10X1_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_10X1_4",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock11 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_WOOD_TRIANGLE_L_1",
    controllable = false,	
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 11,
    strength = 80,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_TRIANGLE_L_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_TRIANGLE_L_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_TRIANGLE_L_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_TRIANGLE_L_4",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock12 = {
    type = "polygon",
    vertices = {
      {x = 0.5, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_WOOD_TRIANGLE_M_1",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 12,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_WOOD_TRIANGLE_M_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_WOOD_TRIANGLE_M_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_WOOD_TRIANGLE_M_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_WOOD_TRIANGLE_M_4",
        max = 25,
        min = -1000
      }
    }
  },
  WoodBlock13 = {
	--[[rectangularGravityField = {
		x = {50, 0},
		y = {25, 25},
		gravity = {20, 0}		
	},]]
	shakeInfo = {
		intensity = 2,
		duration = 1,
		gap = 0,
		waitingTime = 0,
	},
	offCenterParticle = {
		x = 10,
		y = -15,
		w = 0,
		h = 0
	},
	spawnParticles = {
		particle = "smokeBuff",
		amount = 1,
		loopTime = 2,
		waitingTime = 1
	},
	rotation = {
		startASAP = false,
		speed = 0.5,
	},
	--[[interactWithBirds = true,
	detectRadius = 20,
	readyToStart = false,
	
	]]
	specialBlock = true,
	--[[rotation = {
		speed = 1,
		loopRotation = true,
		randomDirection = true,
		randomLoopRadiansLimits = {0.1, 0.4}
	},]]	
	--[[damageStateParticles = {
		{	
			max = 100,
			min = 80
		},
		{	
			particle = "eggShells",
			amount = 1,
			loopTime = 0.05,
			max = 80,
			min = -1000
		}
	},
	waitingDmgStateParticleTime = 2,]]
	--[[animationSprites = {
		{"BLOCK_WOOD_4X4_1", 1},
		{"BLOCK_WOOD_4X4_2", 0.3},
		{"BLOCK_WOOD_4X4_3", 0.5},
		{"BLOCK_WOOD_4X4_4", 2}
	},	
	animationSprites = {
		"BLOCK_WOOD_4X4_1",
		"BLOCK_WOOD_4X4_2",
		"BLOCK_WOOD_4X4_3",
		"BLOCK_WOOD_4X4_4",
		timePerSprite = 1
	},
	
	audioInfo = {
		volume = 1,
		audio = "chandelier_collision_var1",
		loop = true
	},]]
    type = "box",
    sprite = "THEME_1_PLANT_1",
    materialName = "wood",
	strength = 10,
	defence = 10,
	density = 0,
    group = "woodBlocks",
    groupIndex = 13
  },
  WoodBlock14 = {
    specialBlock = true,
	--interactWithBirds = true,
	--detectRadius = 20,
	--readyToStart = false,
	audioInfo = {
		volume = 2,
		audio = "chandelier_collision_var1",
		loopTime = 2,
		alwaysPlay = true
	},
	spawnParticles = {
		particle = "fireworksExplosion2",
		amount = 5,
		loopTime = 3,
		waitingTime = 1	
	},
    type = "box",
	--collision = false,
    sprite = "BLOCK_WOOD_4X4_1",
    controllable = false,
    materialName = "wood",
    group = "woodBlocks",
    groupIndex = 14,
    strength = 120
  },
  StoneBlock1 = {
    type = "box",
    sprite = "BLOCK_ROCK_1_1",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 1,
    strength = 30,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_1",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_1",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_1",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock2 = {
    type = "box",
    sprite = "BLOCK_ROCK_1_2",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 2,
    strength = 60,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_2",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_2",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_2",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock3 = {
    type = "box",
    sprite = "BLOCK_ROCK_1_3",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 3,
    strength = 100,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_3",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_3",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_3",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock4 = {
    type = "box",
    sprite = "BLOCK_ROCK_1_4",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 4,
    strength = 80,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_4",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_4",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_4",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_4",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock5 = {
    type = "box",
    sprite = "BLOCK_ROCK_1_5",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 5,
    strength = 140,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_5",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_5",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_5",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_5",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock6 = {
    type = "box",
    sprite = "BLOCK_ROCK_1_6",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 6,
    strength = 120,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_6",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_6",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_6",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_6",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock7 = {
    type = "circle",
    sprite = "BLOCK_ROCK_1_7",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    strength = 600,
    groupIndex = 7,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_7",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_7",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_7",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_7",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock8 = {
    type = "circle",
    sprite = "BLOCK_ROCK_1_8",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 8,
    strength = 300,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_1_8",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_2_8",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_3_8",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4_8",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock9 = {
    type = "box",
    sprite = "BLOCK_ROCK_4X4_1",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 9,
    strength = 160,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_4X4_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_4X4_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_4X4_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_4X4_4",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock10 = {
    type = "box",
    sprite = "BLOCK_ROCK_10X1_1",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 10,
    strength = 140,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_10X1_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_10X1_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_10X1_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_10X1_4",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock11 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_ROCK_TRIANGLE_L_1",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 11,
    strength = 140,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_TRIANGLE_L_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_TRIANGLE_L_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_TRIANGLE_L_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_TRIANGLE_L_4",
        max = 25,
        min = -1000
      }
    }
  },
  StoneBlock12 = {
    type = "polygon",
    vertices = {
      {x = 0.5, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_ROCK_TRIANGLE_M_1",
    controllable = false,
    materialName = "rock",
    group = "rockBlocks",
    groupIndex = 12,
    strength = 140,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ROCK_TRIANGLE_M_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ROCK_TRIANGLE_M_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ROCK_TRIANGLE_M_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ROCK_TRIANGLE_M_4",
        max = 25,
        min = -1000
      }
    }
  },
  StonePillar = {
    type = "box",
    sprite = "BLOCK_PILLAR",
    controllable = false,
    materialName = "rock",
    group = "extras",
    groupIndex = 186,
    strength = 300,
    width = 2,
    height = 9,
    destroyedSound = "pillar_break",
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_PILLAR",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_PILLAR",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_PILLAR",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_PILLAR",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock1 = {
    type = "box",
    sprite = "BLOCK_LIGHT_1_1",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 1,
    strength = 13,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_1",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_1",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_1",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock2 = {
    type = "box",
    sprite = "BLOCK_LIGHT_1_2",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 2,
    strength = 26,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_2",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_2",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_2",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock3 = {
    type = "box",
    sprite = "BLOCK_LIGHT_1_3",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 3,
    strength = 40,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_3",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_3",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_3",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock4 = {
    type = "box",
    sprite = "BLOCK_LIGHT_1_4",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 4,
    strength = 33,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_4",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_4",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_4",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_4",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock5 = {
    type = "box",
    sprite = "BLOCK_LIGHT_1_5",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 5,
    strength = 53,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_5",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_5",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_5",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_5",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock6 = {
    type = "box",
    sprite = "BLOCK_LIGHT_1_6",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 6,
    strength = 47,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_6",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_6",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_6",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_6",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock7 = {
    type = "circle",
    sprite = "BLOCK_LIGHT_1_7",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 7,
    strength = 125,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_7",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_7",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_7",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_7",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock8 = {
    type = "circle",
    sprite = "BLOCK_LIGHT_1_8",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 8,
    strength = 100,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_1_8",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_2_8",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_3_8",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4_8",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock9 = {
    type = "box",
    sprite = "BLOCK_LIGHT_4X4_1",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 9,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_4X4_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_4X4_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_4X4_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_4X4_4",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock10 = {
    type = "box",
    sprite = "BLOCK_LIGHT_10X1_1",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 10,
    strength = 65,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_10X1_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_10X1_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_10X1_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_10X1_4",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock11 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_LIGHT_TRIANGLE_L_1",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 11,
    strength = 53,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_L_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_L_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_L_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_L_4",
        max = 25,
        min = -1000
      }
    }
  },
  LightBlock12 = {
    type = "polygon",
    vertices = {
      {x = 0.5, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_LIGHT_TRIANGLE_M_1",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 12,
    strength = 48,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_M_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_M_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_M_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_LIGHT_TRIANGLE_M_4",
        max = 25,
        min = -1000
      }
    }
  },
  DecorationSpotsTheme01_01 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME1_01",
    theme = "theme1",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 1
  },
  DecorationSpotsTheme01_02 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME1_02",
    theme = "theme1",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 2
  },
  DecorationSpotsTheme01_03 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME1_03",
    theme = "theme1",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 3
  },
  DecorationSpotsTheme02_01 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME2_01",
    theme = "theme2",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 1
  },
  DecorationSpotsTheme02_02 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME2_02",
    theme = "theme2",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 2
  },
  DecorationSpotsTheme02_03 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME2_03",
    theme = "theme2",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 3
  },
  DecorationSpotsTheme03_01 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME3_01",
    theme = "theme3",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 1
  },
  DecorationSpotsTheme03_02 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME3_02",
    theme = "theme3",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 2
  },
  DecorationSpotsTheme03_03 = {
    type = "box",
    sprite = "DECORATION_SPOTS_THEME3_03",
    theme = "theme3",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 3
  },
  DecorationSkull01 = {
    type = "box",
    sprite = "DECORATION_SKULL01",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 4
  },
  DecorationSkull02 = {
    type = "box",
    sprite = "DECORATION_SKULL02",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 5
  },
  DecorationBone01 = {
    type = "box",
    sprite = "DECORATION_BONE01",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 6
  },
  DecorationBone02 = {
    type = "box",
    sprite = "DECORATION_BONE02",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 7
  },
  DecorationBone03 = {
    type = "box",
    sprite = "DECORATION_BONE03",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 8
  },
  DecorationBone04 = {
    type = "box",
    sprite = "DECORATION_BONE04",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 9
  },
  DecorationBoneSet01 = {
    type = "box",
    sprite = "DECORATION_BONESET01",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 10
  },
  DecorationBoneSet02 = {
    type = "box",
    sprite = "DECORATION_BONESET02",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 11
  },
  DecorationEstrade01 = {
    type = "box",
    sprite = "ESTRADE_FLAG",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 12
  },
  DecorationEstrade02 = {
    type = "box",
    sprite = "ESTRADE_THEATER",
    materialName = "decoration",
    group = "decorations",
    groupIndex = 13
  },
  StaticBlockTheme_01 = {
    sprite = "STATIC_BLOCK_01",
	group = "staticBlocks",
	type = "box",
    materialName = "immovable",
    groupIndex = 1
  },
  StaticBlockTheme_02 = {
    sprite = "STATIC_BLOCK_02",
	type = "box",
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 2
  },
  StaticBlockTheme_03 = {
    sprite = "STATIC_BLOCK_03",
	type = "box",
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 3
  },
  StaticBlockTheme_04 = {
    sprite = "STATIC_BLOCK_04",
	type = "box",
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 4
  },
  StaticBlockTheme_05 = {
    sprite = "STATIC_BLOCK_05",
	type = "box",
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 5
  },
  StaticBlockTheme_06 = {
    sprite = "STATIC_BLOCK_06",
	type = "box",
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 6
  },
  StaticBlockTheme_07 = {
    sprite = "STATIC_BLOCK_07",
	type = "box",
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 7
  },
  StaticBlockTheme_08 = {
    sprite = "STATIC_BLOCK_08",
	type = "box",
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 8
  },
  StaticBlockTheme_09 = {
    sprite = "STATIC_BLOCK_09",
	type = "polygon",
	vertices = {
      {x = 1, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 9
  },
  StaticBlockTheme_10 = {
    sprite = "STATIC_BLOCK_10",
	type = "polygon",
	vertices = {
      {x = 1, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 10
  },
  StaticBlockTheme_11 = {
    sprite = "STATIC_BLOCK_11",
	type = "polygon",
	vertices = {
      {x = 1, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 11
  },
  StaticBlockTheme_12 = {
    sprite = "STATIC_BLOCK_12",
	type = "polygon",
	vertices = {
      {x = 1, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 12
  },
  StaticBlockTheme_13 = {
    sprite = "STATIC_BLOCK_13",
	type = "polygon",
	vertices = {
      {x = 0.5, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 13
  },
  StaticBlockTheme_14 = {
    sprite = "STATIC_BLOCK_14",
	type = "polygon",
	vertices = {
      {x = 0.5, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 14
  },
  StaticBlockTheme_15 = {
    sprite = "STATIC_BLOCK_15",
	type = "circle",
	radius = 1,
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 15
  },
  StaticBlockTheme_16 = {
    sprite = "STATIC_BLOCK_16",
	type = "circle",
	radius = 2,
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 16
  },
  StaticBlockTheme_17 = {
    sprite = "STATIC_BLOCK_17",
	type = "circle",
	radius = 4,
	group = "staticBlocks",
    materialName = "immovable",
    groupIndex = 17
  },
  StaticBlockTheme_18 = {
    sprite = "STATIC_BLOCK_18",
	type = "circle",
	radius = 8,
	group = "staticBlocks",	
    materialName = "immovable",
    groupIndex = 18
  },
  ShootingPlatform01 = {
    type = "box",
    sprite = "SHOOTING_PLATFORM",
    materialName = "immovable",
    group = "platforms",
    groupIndex = 1
  },
  Estrade01 = {
    type = "box",
    sprite = "ESTRADE_01",
    materialName = "immovable",
    group = "platforms",
    groupIndex = 2
  },
  Estrade02 = {
    type = "box",
    sprite = "ESTRADE_02",
    materialName = "immovable",
    group = "platforms",
    groupIndex = 3
  },
  Estrade03 = {
    type = "box",
    sprite = "ESTRADE_03",
    materialName = "immovable",
    group = "platforms",
    groupIndex = 4
  },
  Estrade04 = {
    type = "box",
    sprite = "ESTRADE_04",
    materialName = "immovable",
    group = "platforms",
    groupIndex = 5
  },
  ExtraBlockToilet = {
    type = "box",
    sprite = "BLOCK_EXTRA_TOILET",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 1
  },
  ExtraBlockFlag01 = {
    type = "box",
    sprite = "BLOCK_EXTRA_FLAG_01",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 2
  },
  ExtraBlockFlag02 = {
    type = "box",
    sprite = "BLOCK_EXTRA_FLAG_02",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 3
  },
  ExtraBlockTNT = {
    type = "box",
    sprite = "BLOCK_EXTRA_TNT",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 4,
    strength = 10,
    defence = 1,
    particles = "explosionBuff",
    specialty = "BOMB",
    explosionRadius = 10,
    explosionForce = 30000,
    explosionDamageRadius = 5,
    explosionDamage = 150,
    floatability = 1
  },
  ExtraBlockDice = {
    type = "box",
    sprite = "BLOCK_EXTRA_DICE_6",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 5,
    strength = 30,
    defence = 1,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_EXTRA_DICE_6",
        max = 100,
        min = 84
      },
      damage2 = {
        sprite = "BLOCK_EXTRA_DICE_5",
        max = 84,
        min = 68
      },
      damage3 = {
        sprite = "BLOCK_EXTRA_DICE_4",
        max = 68,
        min = 52
      },
      damage4 = {
        sprite = "BLOCK_EXTRA_DICE_3",
        max = 52,
        min = 36
      },
      damage5 = {
        sprite = "BLOCK_EXTRA_DICE_2",
        max = 36,
        min = 20
      },
      damage6 = {
        sprite = "BLOCK_EXTRA_DICE_1",
        max = 20,
        min = -1000
      }
    }
  },
  ExtraBlockStairs = {
    type = "box",
    sprite = "ESTRADE_STAIRS",
    controllable = false,
    materialName = "wood",
    group = "extras",
    groupIndex = 6
  },
  SpecialBlockSwing = {
    type = "box",
    sprite = "SWING_HOLDER_01",
    controllable = false,
    materialName = "immovable",
    group = "extras",
    groupIndex = 7
  },
  SpecialBlockStart = {
    type = "box",
    sprite = "SWING_BASKET_01",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 8,
    strength = 10,
    defence = 1000000,
    collision = false
  },
  ExtraPoleYellow = {
    type = "box",
    sprite = "POLE_YELLOW",
    controllable = false,
    materialName = "immovable",
    group = "extras",
    groupIndex = 9,
    strength = 10,
    defence = 1000000,
    collision = false
  },
  ExtraPoleRed = {
    type = "box",
    sprite = "POLE_RED",
    controllable = false,
    materialName = "immovable",
    group = "extras",
    groupIndex = 10,
    strength = 10,
    defence = 1000000,
    collision = false
  },
  ExtraTire01 = {
    type = "circle",
    sprite = "BLOCK_TIRE_01",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 11,
    strength = 200
  },
  ExtraTire02 = {
    type = "circle",
    sprite = "BLOCK_TIRE_02",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 12,
    strength = 200
  },
  ExtraTire03 = {
    type = "circle",
    sprite = "BLOCK_TIRE_03",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 13,
    strength = 200
  },
  ExtraDonut01 = {
    type = "circle",
    sprite = "BLOCK_DONUT",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 14,
    strength = 50
  },
  ExtraMelon = {
    type = "circle",
    sprite = "BLOCK_WATERMELON",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 15,
    strength = 40
  },
  ExtraHam = {
    type = "circle",
    sprite = "BLOCK_HAM",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 16,
    strength = 60
  },
  ExtraApple = {
    type = "circle",
    sprite = "BLOCK_APPLE",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 17,
    strength = 30
  },
  ExtraStrawberry = {
    type = "circle",
    sprite = "BLOCK_STRAWBERRY",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 18,
    strength = 30
  },
  ExtraBanana = {
    type = "box",
    sprite = "BLOCK_BANANA",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 19,
    strength = 30
  },
  ExtraTreasureChest = {
    type = "box",
    sprite = "BLOCK_TREASURE_CHEST",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 20,
    strength = 20,
    floatability = 0.3
  },
  ExtraPillar = {
    type = "box",
    sprite = "BLOCK_PILLAR",
    controllable = false,
    density = 10,
    defence = 40,
    materialName = "extras",
    group = "extras",
    groupIndex = 21,
    strength = 120,
    destroyedSound = "pillar_break"
  },
  ExtraBeachBall = {
    type = "circle",
    sprite = "BLOCK_BEACHBALL",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 22,
    strength = 15
  },
  ExtraBlockSmiley = {
    type = "circle",
    sprite = "BLOCK_SMILEY_1",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 23,
    strength = 25,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_SMILEY_1",
        max = 100,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_SMILEY_3",
        max = 50,
        min = -1000
      }
    }
  },
  ExtraHolyGrail = {
    type = "box",
    sprite = "BLOCK_HOLYGRAIL",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 24,
    strength = 25
  },
  ExtraDiamond = {
    type = "circle",
    sprite = "BLOCK_DIAMOND",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 25,
    strength = 25
  },
  ExtraRubberDuck = {
    type = "circle",
    sprite = "BLOCK_RUBBERDUCK",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 26,
    strength = 25
  },
  ExtraStolenEgg = {
    type = "circle",
    sprite = "BLOCK_STOLEN_EGG",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 27,
    strength = 2000,
    defence = 20000
  },
  ExtraStrongBall = {
    type = "circle",
    sprite = "BLOCK_STEEL_BALL",
    controllable = false,
    materialName = "rock",
    group = "extras",
    groupIndex = 28,
    strength = 5000,
    defence = 2000
  },
  ExtraRubberBall = {
    type = "circle",
    sprite = "BLOCK_BEACHBALL",
    controllable = false,
    materialName = "rubber",
    group = "extras",
    groupIndex = 29,
    defence = 50,
    strength = 1000,
    restitution = 1.1
  },
  ExtraTrampoline = {
    type = "circle",
    sprite = "BLOCK_SUPER_BALL",
    materialName = "rubber",
    group = "extras",
    groupIndex = 30,
    defence = 1000,
    strength = 1000,
    restitution = 5.5
  },
  ExtraBlueBird = {
    radius = 0.6,
    friction = 0.3,
    type = "circle",
    restitution = 0.25,
    sprite = "BIRD_BLUE",
    density = 8,
    materialName = "extras",
    group = "extras",
    groupIndex = 31,
    strength = 3000,
    defence = 2000
  },
  ExtraTrampoline2 = {
    type = "box",
    sprite = "BLOCK_TRAMPOLINE_01",
    materialName = "immovableRubber",
    group = "extras",
    groupIndex = 32,
    defence = 1000,
    strength = 1000,
    restitution = 1.1
  },
  ExtraGoldenEgg = {
    type = "circle",
    sprite = "BLOCK_GOLDEN_EGG",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 33,
    strength = 5,
    defence = 1
  },
  ExtraRopeThick01 = {
    type = "box",
    sprite = "BLOCK_ROPE_THICK_1",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 34,
    strength = 5,
    defence = 1,
    destroyedScoreInc = 100
  },
  ExtraRopeThin01 = {
    type = "box",
    sprite = "BLOCK_ROPE_THIN_1",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 35,
    strength = 5,
    defence = 1,
    destroyedScoreInc = 100
  },
  ExtraRopeThin02 = {
    type = "box",
    sprite = "BLOCK_ROPE_THIN_2",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 36,
    strength = 5,
    defence = 1,
    destroyedScoreInc = 100
  },
  ExtraBoomerangBird = {
    radius = 1.1,
    friction = 0.3,
    type = "circle",
    restitution = 0.25,
    sprite = "BIRD_BOOMERANG_STILL",
    density = 8,
    materialName = "extras",
    group = "extras",
    groupIndex = 37,
    strength = 3000,
    defence = 2000
  },
  BlockCarpet = {
    type = "box",
    sprite = "BLOCK_CARPET",
    materialName = "extras",
    group = "extras",
    groupIndex = 38
  },
  ExtraHelmetSmall = {
    type = "polygon",
    vertices = {
      {x = 0.2, y = 0.3},
      {x = 0.4, y = 0.2},
      {x = 0.6, y = 0.2},
      {x = 0.8, y = 0.3},
      {x = 0.8, y = 0.5},
      {x = 0.2, y = 0.5}
    },
    sprite = "HELMET_SMALL",
    materialName = "extras",
    group = "extras",
    density = 0.3,
    friction = 1,
    groupIndex = 39,
    defence = 300,
    strength = 10,
    restitution = 0.1,
    z_order = 5,
    destroyedScoreInc = 50
  },
  ExtraHelmetSmall2 = {
    type = "polygon",
    vertices = {
      {x = 0.2, y = 0.2},
      {x = 0.4, y = 0.1},
      {x = 0.8, y = 0.1},
      {x = 1, y = 0.2},
      {x = 1, y = 0.4},
      {x = 0.2, y = 0.4}
    },
    sprite = "BLOCK_RUBBERDUCK",
    materialName = "extras",
    group = "extras",
    density = 0.5,
    friction = 1,
    groupIndex = 40,
    defence = 300,
    strength = 10,
    restitution = 0,
    z_order = 5,
    destroyedScoreInc = 50
  },
  ExtraHelmetBig = {
    type = "polygon",
    vertices = {
      {x = 0.2, y = 0.3},
      {x = 0.4, y = 0.2},
      {x = 0.6, y = 0.2},
      {x = 0.8, y = 0.3},
      {x = 0.8, y = 0.5},
      {x = 0.2, y = 0.5}
    },
    sprite = "HELMET_BIG",
    materialName = "extras",
    group = "extras",
    density = 0.5,
    friction = 1,
    groupIndex = 41,
    defence = 300,
    strength = 10,
    restitution = 0,
    z_order = 5,
    destroyedScoreInc = 50
  },
  ExtraHelmetBig2 = {
    type = "polygon",
    vertices = {
      {x = 0.2, y = 0.2},
      {x = 0.4, y = 0.1},
      {x = 0.8, y = 0.1},
      {x = 1, y = 0.2},
      {x = 1, y = 0.4},
      {x = 0.2, y = 0.4}
    },
    sprite = "BIRD_BOOMERANG_STILL",
    materialName = "extras",
    group = "extras",
    density = 0.5,
    friction = 1,
    groupIndex = 42,
    defence = 300,
    strength = 10,
    restitution = 0,
    z_order = 5,
    destroyedScoreInc = 50
  },
  ExtraHelmetBoss = {
    type = "polygon",
    vertices = {
      {x = 0.2, y = 0.3},
      {x = 0.4, y = 0.2},
      {x = 0.6, y = 0.2},
      {x = 0.8, y = 0.3},
      {x = 0.8, y = 0.5},
      {x = 0.2, y = 0.5}
    },
    sprite = "HELMET_BOSS",
    materialName = "extras",
    group = "extras",
    density = 0.5,
    friction = 1,
    groupIndex = 43,
    defence = 300,
    strength = 10,
    restitution = 0,
    z_order = 5,
    destroyedScoreInc = 50
  },
  StaticFragileBlock01 = {
    type = "box",
    sprite = "GROUND_BLOCK_01",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 1,
    destroyedScoreInc = 50
  },
  StaticFragileBlock02 = {
    type = "box",
    sprite = "GROUND_BLOCK_02",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 2,
    destroyedScoreInc = 50
  },
  StaticFragileBlock03 = {
    type = "box",
    sprite = "GROUND_BLOCK_03",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 3,
    destroyedScoreInc = 50
  },
  StaticFragileBlock04 = {
    type = "box",
    sprite = "GROUND_BLOCK_04",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 4,
    destroyedScoreInc = 50
  },
  StaticFragileBlock05 = {
    type = "box",
    sprite = "GROUND_BLOCK_05",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 5,
    destroyedScoreInc = 50
  },
  StaticFragileBlock06 = {
    type = "box",
    sprite = "GROUND_BLOCK_06",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 6,
    destroyedScoreInc = 50
  },
  Ground = {
    type = "box",
    sprite = "",
    texture = "",
    theme = "",
    materialName = "staticGround",
    group = "",
    groupIndex = 1
  },
  ExtraGift1 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.4},
      {x = 1, y = 0.4},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_GIFT_1",
    controllable = false,
    materialName = "presents",
    particles = "giftRedBuff",
    defence = 1,
    group = "extras",
    groupIndex = 57,
    strength = 5,
    restitution = 0.1,
    destroyedScoreInc = 3000,
    spriteScore = "GIFT_SCORE_RED"
  },
  ExtraGift2 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.5},
      {x = 1, y = 0.5},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_GIFT_2",
    controllable = false,
    materialName = "presents",
    particles = "giftBlueBuff",
    defence = 1,
    group = "extras",
    groupIndex = 45,
    strength = 5,
    restitution = 0.1,
    destroyedScoreInc = 3000,
    spriteScore = "GIFT_SCORE_BLUE"
  },
  ExtraGift3 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.3},
      {x = 1, y = 0.3},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    sprite = "BLOCK_GIFT_3",
    controllable = false,
    materialName = "presents",
    particles = "giftWhiteBuff",
    defence = 1,
    group = "extras",
    groupIndex = 46,
    strength = 5,
    restitution = 0.1,
    destroyedScoreInc = 3000,
    spriteScore = "GIFT_SCORE_WHITE"
  },
  ExtraJingleBell = {
    type = "box",
    sprite = "BLOCK_JINGLE_BELL_1",
    controllable = false,
    materialName = "bell",
    group = "extras",
    groupIndex = 47,
    restitution = 0.1,
    density = 1,
    z_order = 5
  },
  ExtraJingleBell2 = {
    type = "box",
    sprite = "BLOCK_JINGLE_BELL_2",
    controllable = false,
    materialName = "bell",
    group = "extras",
    groupIndex = 48,
    restitution = 0.1,
    density = 1,
    z_order = 5
  },
  ExtraHatElf1 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.8},
      {x = 0.5, y = 0},
      {x = 0.8, y = 0.8}
    },
    sprite = "HAT_ELF_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 49,
    strength = 5,
    restitution = 0.1,
    density = 0.5,
    z_order = 5
  },
  ExtraHatElf2 = {
    type = "polygon",
    vertices = {
      {x = 0.3, y = 0.8},
      {x = 0.7, y = 0},
      {x = 1, y = 0.8}
    },
    sprite = "HAT_ELF_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 50,
    strength = 5,
    restitution = 0.1,
    density = 0.5,
    z_order = 5
  },
  ExtraHatElf3 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.6},
      {x = 0.3, y = 0},
      {x = 0.7, y = 0.6}
    },
    sprite = "HAT_ELF_3",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 51,
    strength = 5,
    restitution = 0.1,
    density = 0.5,
    z_order = 5
  },
  ExtraHatWinter = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.7},
      {x = 0.5, y = 0.2},
      {x = 1, y = 0.7}
    },
    sprite = "HAT_WINTER_CAP_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 52,
    strength = 5,
    restitution = 0.1,
    density = 0.5,
    z_order = 5
  },
  ExtraPigWeigth = {
    type = "box",
    sprite = "BLOCK_WOOD_4_1",
    controllable = false,
    materialName = "extras",
    defence = 0,
    group = "extras",
    groupIndex = 53,
    density = 8,
    strength = 1,
    restitution = 0.1
  },
  ExtraXmasBall01 = {
    type = "circle",
    sprite = "XMAS_BALL_01",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 54,
    restitution = 0.1,
    density = 1,
    z_order = 5
  },
  ExtraXmasBall02 = {
    type = "circle",
    sprite = "XMAS_WREATH",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 55,
    restitution = 0.1,
    density = 1,
    z_order = 5
  },
  ExtraKingBeard = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.7},
      {x = 0.5, y = 0.2},
      {x = 1, y = 0.7}
    },
    sprite = "KING_BEARD",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 56,
    restitution = 0.1,
    density = 1,
    z_order = 5
  },
  StaticFragileBlock01 = {
    type = "box",
    sprite = "GROUND_BLOCK_01",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 1,
    destroyedScoreInc = 50
  },
  StaticFragileBlock02 = {
    type = "box",
    sprite = "GROUND_BLOCK_02",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 2,
    destroyedScoreInc = 50
  },
  StaticFragileBlock03 = {
    type = "box",
    sprite = "GROUND_BLOCK_03",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 3,
    destroyedScoreInc = 50
  },
  StaticFragileBlock04 = {
    type = "box",
    sprite = "GROUND_BLOCK_04",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 4,
    destroyedScoreInc = 50
  },
  StaticFragileBlock05 = {
    type = "box",
    sprite = "GROUND_BLOCK_05",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 5,
    destroyedScoreInc = 50
  },
  StaticFragileBlock06 = {
    type = "box",
    sprite = "GROUND_BLOCK_06",
    materialName = "immovableFragile",
    group = "staticFragile",
    groupIndex = 6,
    destroyedScoreInc = 50
  },
  StaticBalloon01 = {
    type = "box",
    sprite = "BLOCK_PIG_BALLOON_1",
    materialName = "balloon",
    group = "clouds",
    groupIndex = 1,
    destroyedScoreInc = 100
  },
  StaticBalloon02 = {
    type = "box",
    sprite = "BLOCK_PIG_BALLOON_2",
    materialName = "balloon",
    group = "clouds",
    groupIndex = 2,
    destroyedScoreInc = 100
  },
  StaticBalloon03 = {
    type = "box",
    sprite = "BLOCK_BALLOON_1",
    materialName = "balloon",
    group = "clouds",
    groupIndex = 3,
    destroyedScoreInc = 100
  },
  StaticBalloon04 = {
    type = "box",
    sprite = "BLOCK_BALLOON_2",
    materialName = "balloon",
    group = "clouds",
    groupIndex = 4,
    destroyedScoreInc = 100
  },
  StaticBalloon05 = {
    type = "box",
    sprite = "BLOCK_BALLOON_3",
    materialName = "balloon",
    group = "clouds",
    groupIndex = 5,
    destroyedScoreInc = 100
  },
  StaticCloud01 = {
    type = "box",
    sprite = "BLOCK_STATIC_CLOUD_1",
    materialName = "clouds",
    group = "clouds",
    groupIndex = 6,
    strength = 5,
    destroyedScoreInc = 50
  },
  StaticCloud02 = {
    type = "box",
    sprite = "BLOCK_STATIC_CLOUD_2",
    materialName = "clouds",
    group = "clouds",
    groupIndex = 7,
    strength = 10,
    destroyedScoreInc = 100
  },
  StaticCloud03 = {
    type = "box",
    sprite = "BLOCK_STATIC_CLOUD_3",
    materialName = "clouds",
    group = "clouds",
    groupIndex = 8,
    strength = 20,
    destroyedScoreInc = 200
  },
  StaticCloud04 = {
    type = "box",
    sprite = "BLOCK_STATIC_CLOUD_4",
    materialName = "clouds",
    group = "clouds",
    groupIndex = 9,
    strength = 40,
    destroyedScoreInc = 400
  },
  Ground = {
    type = "box",
    sprite = "",
    texture = "",
    theme = "",
    materialName = "staticGround",
    group = "",
    groupIndex = 1
  },
  BackgroundCloud1 = {
    type = "box",
    sprite = "BACKGROUND_10_CLOUD_1",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 10
  },
  BackgroundCloud2 = {
    type = "box",
    sprite = "BACKGROUND_10_CLOUD_2",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 11
  },
  BackgroundCloud3 = {
    type = "box",
    sprite = "BACKGROUND_10_CLOUD_3",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 12
  },
  BackgroundCloud4 = {
    type = "box",
    sprite = "BACKGROUND_10_CLOUD_4",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 13
  },
  BlockSnow1 = {
    type = "box",
    sprite = "SNOW_2X2_1",
    materialName = "snowStaticFragile",
    group = "staticFragile",
    groupIndex = 7,
    strength = 8,
    damageSprites = {
      damage1 = {
        sprite = "SNOW_2X2_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SNOW_2X2_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SNOW_2X2_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  BlockSnow2 = {
    type = "box",
    sprite = "SNOW_2X4_1",
    materialName = "snowStaticFragile",
    group = "staticFragile",
    groupIndex = 8,
    strength = 10,
    damageSprites = {
      damage1 = {
        sprite = "SNOW_2X4_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SNOW_2X4_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SNOW_2X4_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  BlockSnow3 = {
    type = "box",
    sprite = "SNOW_2X6_1",
    materialName = "snowStaticFragile",
    group = "staticFragile",
    groupIndex = 9,
    strength = 12,
    damageSprites = {
      damage1 = {
        sprite = "SNOW_2X6_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SNOW_2X6_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SNOW_2X6_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  BlockSnow4 = {
    type = "box",
    sprite = "SNOW_4X4_1",
    materialName = "snowStaticFragile",
    group = "staticFragile",
    groupIndex = 10,
    strength = 14,
    damageSprites = {
      damage1 = {
        sprite = "SNOW_4X4_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SNOW_4X4_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SNOW_4X4_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  BlockSnowTriangle1 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 1},
      {x = 1, y = 0},
      {x = 1, y = 1}
    },
    sprite = "SNOW_TRI_4X4_1",
    controllable = false,
    materialName = "snowStaticFragile",
    group = "staticFragile",
    groupIndex = 11,
    strength = 10,
    damageSprites = {
      damage1 = {
        sprite = "SNOW_TRI_4X4_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SNOW_TRI_4X4_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SNOW_TRI_4X4_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  BlockSnowTriangle2 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 1},
      {x = 1, y = 0},
      {x = 1, y = 1}
    },
    sprite = "SNOW_TRI_2X2_1",
    controllable = false,
    materialName = "snowStaticFragile",
    group = "staticFragile",
    groupIndex = 12,
    strength = 8,
    damageSprites = {
      damage1 = {
        sprite = "SNOW_TRI_2X2_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SNOW_TRI_2X2_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SNOW_TRI_2X2_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  BlockSnowBall1 = {
    type = "circle",
    sprite = "SNOW_BALL_4X4_1",
    controllable = false,
    materialName = "snow",
    group = "staticFragile",
    groupIndex = 13,
    defence = 20,
    strength = 50,
    damageSprites = {
      damage1 = {
        sprite = "SNOW_BALL_4X4_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SNOW_BALL_4X4_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SNOW_BALL_4X4_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  SandBlock1 = {
    type = "box",
    sprite = "SAND_4X4_1",
    materialName = "sandStaticFragile",
    group = "staticFragile",
    extendedExplosionDamageRadius = true,
    groupIndex = 14,
    strength = 14,
    damageSprites = {
      damage1 = {
        sprite = "SAND_4X4_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SAND_4X4_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SAND_4X4_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  SandBlock2 = {
    type = "box",
    sprite = "SAND_2X4_1",
    materialName = "sandStaticFragile",
    group = "staticFragile",
    extendedExplosionDamageRadius = true,
    groupIndex = 15,
    strength = 10,
    damageSprites = {
      damage1 = {
        sprite = "SAND_2X4_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "SAND_2X4_2",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "SAND_2X4_3",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
  ExtraHatBowtie1 = {
    type = "box",
    sprite = "B_BOWTIE_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 58,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ExtraHatBowtie2 = {
    type = "box",
    sprite = "B_BOWTIE_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 59,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ExtraValentineGift1 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0.2},
      {x = 1, y = 0.2},
      {x = 0.5, y = 1}
    },
    sprite = "B_V_GIFT_1",
    controllable = false,
    materialName = "chocolate",
    defence = 1,
    group = "extras",
    groupIndex = 60,
    strength = 5,
    restitution = 0.1,
    density = 0.7,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "GIFT_SCORE_CHOCOLATE"
  },
  ExtraValentineWings1 = {
    type = "box",
    sprite = "B_V_WINGS_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 61,
    strength = 5,
    restitution = 0.1,
    density = 0.2,
    z_order = 1,
    destroyedScoreInc = 100
  },
  ExtraValentineBow1 = {
    type = "box",
    sprite = "B_V_BOW_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 62,
    strength = 5,
    restitution = 0.1,
    density = 0.2,
    z_order = 5
  },
  ExtraValentineWing1 = {
    type = "box",
    sprite = "B_V_WING_R_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 63,
    strength = 5,
    restitution = 0.1,
    density = 0.2,
    z_order = 1
  },
  ExtraValentineWing2 = {
    type = "box",
    sprite = "B_V_WING_R_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 64,
    strength = 5,
    restitution = 0.1,
    density = 0.2,
    z_order = 1,
    destroyedScoreInc = 100
  },
  ExtraValentineWing3 = {
    type = "box",
    sprite = "B_V_WING_L_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 65,
    strength = 5,
    restitution = 0.1,
    density = 0.2,
    z_order = 1,
    destroyedScoreInc = 100
  },
  ExtraValentineWing4 = {
    type = "box",
    sprite = "B_V_WING_L_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 66,
    strength = 5,
    restitution = 0.1,
    density = 0.2,
    z_order = 1,
    destroyedScoreInc = 100
  },
  ExtraValentineHeart = {
    type = "circle",
    radius = 0.6,
    sprite = "P_HEART_FADE_1",
    controllable = false,
    materialName = "valentine",
    defence = 1,
    group = "extras",
    groupIndex = 67,
    strength = 1,
    restitution = 0.1,
    density = 0.5,
    z_order = 5,
    destroyedScoreInc = 10
  },
  ExtraBlockCombine = {
    type = "box",
    sprite = "BLOCK_COMBINE",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 68,
    strength = 1,
    restitution = 0.1,
    density = 0.5,
    z_order = 5
  },
  ExtraEggGirl = {
    type = "box",
    sprite = "B_EGG_GIRL",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 69,
    strength = 1000,
    restitution = 0.1,
    density = 0.5,
    z_order = 5
  },
  ExtraValentineHeartStatic = {
    type = "circle",
    radius = 0.6,
    sprite = "P_HEART_FADE_1",
    controllable = false,
    materialName = "valentine",
    defence = 0,
    group = "extras",
    groupIndex = 70,
    density = 0,
    strength = 0.1,
    restitution = 0.1,
    z_order = 5,
    destroyedScoreInc = 10
  },
  ExtraHatClover = {
    type = "box",
    height = 2,
    width = 2,
    sprite = "B_CLOVERHAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 71,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ExtraHatGingerBeard = {
    type = "box",
    height = 1.5,
    width = 5,
    sprite = "B_GINGERBEARD_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 72,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ExtraHatCloverKing = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_KINGHAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 73,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 6,
    destroyedScoreInc = 100
  },
  ExtraHatLepreHat1 = {
    type = "box",
    width = 2.1,
    height = 2.1,
    sprite = "B_LEPREHAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 74,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 6,
    destroyedScoreInc = 100
  },
  ExtraHatLepreHat2 = {
    type = "box",
    width = 1.5,
    height = 1.5,
    sprite = "B_LEPREHAT_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 75,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 6,
    destroyedScoreInc = 100
  },
  ExtraHatLepreHat3 = {
    type = "box",
    width = 1.2,
    height = 1.2,
    sprite = "B_LEPREHAT_3",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 81,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 6,
    destroyedScoreInc = 100
  },
  ExtraMoneyPot = {
    type = "box",
    width = 2,
    height = 3.4,
    sprite = "B_GOLDPOT_1",
    controllable = false,
    materialName = "goldpot",
    defence = 0.4,
    health = 200,
    group = "extras",
    groupIndex = 76,
    strength = 35,
    restitution = 0.1,
    density = 0.7,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "GOLDPOT_SCORE_1",
    particles = "goldPotBuff"
  },
  ExtraMoneyCoins1 = {
    type = "box",
    width = 2.5,
    height = 0.8,
    sprite = "B_COINS_1",
    controllable = false,
    materialName = "money",
    defence = 1,
    group = "extras",
    groupIndex = 77,
    strength = 5,
    restitution = 0.1,
    density = 0.7,
    z_order = 5,
    destroyedScoreInc = 1000,
    spriteScore = "GOLDCOIN_SCORE_1"
  },
  ExtraMoneyCoins2 = {
    type = "box",
    width = 2.5,
    height = 0.8,
    sprite = "B_COINS_2",
    controllable = false,
    materialName = "money",
    defence = 1,
    group = "extras",
    groupIndex = 78,
    strength = 5,
    restitution = 0.1,
    density = 0.7,
    z_order = 5,
    destroyedScoreInc = 1000,
    spriteScore = "GOLDCOIN_SCORE_1"
  },
  ExtraCloverBush = {
    type = "box",
    width = 2.5,
    height = 1.8,
    sprite = "B_CLOVERBUSH_1",
    particles = "cloverBuff",
    controllable = false,
    materialName = "clover",
    defence = 1,
    group = "extras",
    groupIndex = 79,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ExtraClover = {
    type = "box",
    width = 1,
    height = 4,
    sprite = "B_CLOVER_1",
    particles = "cloverBuff",
    controllable = false,
    materialName = "clover",
    defence = 1,
    group = "extras",
    groupIndex = 80,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ExtraFourLeafClover = {
    type = "box",
    width = 1,
    height = 4,
    sprite = "B_FOURLEAF_CLOVER",
    controllable = false,
    materialName = "fourLeavedClover",
    defence = 1,
    group = "extras",
    groupIndex = 82,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500,
    particles = "luckyCloverBuff"
  },
  CloverWoodBlock = {
    type = "box",
    sprite = "B_CLOVERWOOD_1",
    controllable = false,
    materialName = "wood",
    group = "extras",
    groupIndex = 83,
    strength = 80,
    particles = "cloverWoodenBuff",
    damageSprites = {
      damage1 = {
        sprite = "B_CLOVERWOOD_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "B_CLOVERWOOD_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "B_CLOVERWOOD_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "B_CLOVERWOOD_4",
        max = 25,
        min = -1000
      }
    }
  },
  KingBunnyHat1 = {
    type = "box",
    width = 1.2,
    height = 1.2,
    sprite = "B_KING_BUNNY_HAT_1",
    controllable = false,
    materialName = "bunny",
    defence = 1,
    group = "extras",
    groupIndex = 84,
    strength = 5,
    restitution = 0.1,
    density = 0.1,
    z_order = 5
  },
  WhiteBunnyEar1 = {
    type = "box",
    width = 1.2,
    height = 0.5,
    sprite = "B_WHITE_BUNNY_EAR_1",
    controllable = false,
    materialName = "bunny",
    defence = 1,
    group = "extras",
    groupIndex = 85,
    strength = 5,
    restitution = 0.1,
    density = 0.1,
    z_order = 5
  },
  WhiteBunnyEar2 = {
    type = "box",
    width = 1.2,
    height = 0.5,
    sprite = "B_WHITE_BUNNY_EAR_2",
    controllable = false,
    materialName = "bunny",
    defence = 1,
    group = "extras",
    groupIndex = 86,
    strength = 5,
    restitution = 0.1,
    density = 0.1,
    z_order = 5
  },
  WhiteBunnyNose1 = {
    type = "box",
    width = 1.2,
    height = 1.2,
    sprite = "B_WHITE_BUNNY_NOSE_1",
    controllable = false,
    materialName = "bunny",
    defence = 1,
    group = "extras",
    groupIndex = 87,
    strength = 5,
    restitution = 0.1,
    density = 0.1,
    z_order = 5
  },
  PinkBunnyHat1 = {
    type = "box",
    width = 1.2,
    height = 0.4,
    sprite = "B_PINK_BUNNY_HAT_1",
    controllable = false,
    materialName = "bunny",
    defence = 1,
    group = "extras",
    groupIndex = 88,
    strength = 5,
    restitution = 0.1,
    density = 0.1,
    z_order = 5
  },
  EasterEgg1 = {
    type = "circle",
    sprite = "B_EASTEREGG_1",
    controllable = false,
    materialName = "easteregg",
    particles = "easterEggPuff",
    defence = 1,
    group = "extras",
    groupIndex = 89,
    strength = 5,
    restitution = 0.1,
    density = 0.5,
    z_order = 5,
    destroyedScoreInc = 1000,
    spriteScore = "EASTER_EGG_SCORE_1"
  },
  EasterEgg2 = {
    type = "circle",
    sprite = "B_EASTEREGG_2",
    controllable = false,
    materialName = "easteregg",
    particles = "easterEggPuff",
    defence = 1,
    group = "extras",
    groupIndex = 90,
    strength = 5,
    restitution = 0.1,
    density = 0.5,
    z_order = 5,
    destroyedScoreInc = 1000,
    spriteScore = "EASTER_EGG_SCORE_1"
  },
  EasterEgg3 = {
    type = "circle",
    sprite = "B_EASTEREGG_3",
    controllable = false,
    materialName = "easteregg",
    particles = "easterEggPuff",
    defence = 1,
    group = "extras",
    groupIndex = 91,
    strength = 5,
    restitution = 0.1,
    density = 0.5,
    z_order = 5,
    destroyedScoreInc = 1000,
    spriteScore = "EASTER_EGG_SCORE_1"
  },
  PinkBunnyHat2 = {
    width = 1.2,
    height = 0.4,
    type = "box",
    sprite = "B_PINK_BUNNY_HAT_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 92,
    strength = 5,
    restitution = 0.1,
    density = 0.1,
    z_order = 5
  },
  EasterGrass1 = {
    type = "box",
    width = 2.5,
    height = 0.7,
    sprite = "B_EASTER_GRASS_1",
    particles = "easterGrass",
    controllable = false,
    materialName = "grass",
    defence = 1,
    group = "extras",
    groupIndex = 93,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  EasterGrass2 = {
    type = "box",
    width = 2.5,
    height = 0.9,
    sprite = "B_EASTER_GRASS_2",
    particles = "easterGrass",
    controllable = false,
    materialName = "grass",
    defence = 1,
    group = "extras",
    groupIndex = 94,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  LemonSlice1 = {
    type = "polygon",
    vertices = {
      {x = 0.1, y = 0},
      {x = 0.9, y = 1},
      {x = 0.1, y = 1}
    },
    sprite = "B_LEMON_SLICE_1",
    controllable = false,
    materialName = "summerPicnic",
    particles = "lemonBuff",
    defence = 1,
    group = "extras",
    groupIndex = 95,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  LemonadeGlass1 = {
    type = "box",
    width = 2,
    height = 1.4,
    sprite = "B_LEMONADE_GLASS_1",
    controllable = false,
    materialName = "summerPicnic",
    particles = "summerglassBuff",
    defence = 1,
    group = "extras",
    groupIndex = 96,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  FoodBasket1 = {
    type = "box",
    width = 4.4,
    height = 2,
    sprite = "B_FOOD_BASKET_1",
    controllable = false,
    materialName = "summerPicnic",
    defence = 1,
    group = "extras",
    groupIndex = 97,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  Kite1 = {
    type = "box",
    width = 4,
    height = 3.9,
    sprite = "B_KITE_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 98,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  KiteTail1 = {
    type = "box",
    width = 1.4,
    height = 1.5,
    sprite = "B_KITE_TAIL_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 99,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  KiteString1 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_KITE_STRING_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 100,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  StrawHat1 = {
    type = "box",
    width = 1.1,
    height = 0.6,
    sprite = "B_STRAWHAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 101,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  StrawHat2 = {
    type = "box",
    width = 1.6,
    height = 1,
    sprite = "B_STRAWHAT_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 102,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  StrawHat3 = {
    type = "box",
    width = 1.7,
    height = 1.2,
    sprite = "B_STRAWHAT_3",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 103,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  FisherHat1 = {
    type = "box",
    width = 1.9,
    height = 1.2,
    sprite = "B_FISHERHAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 104,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  KingCap1 = {
    type = "box",
    width = 3.9,
    height = 2,
    sprite = "B_KINGCAP_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 105,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  Flower1 = {
    type = "circle",
    radius = 1.3,
    sprite = "B_FLOWER_1",
    controllable = false,
    materialName = "summerFlower",
    particles = "flower1Buff",
    defence = 1,
    group = "extras",
    groupIndex = 106,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_1_SCORE_1"
  },
  Flower2 = {
    type = "circle",
    radius = 1,
    sprite = "B_FLOWER_2",
    controllable = false,
    materialName = "summerFlower",
    particles = "flower2Buff",
    defence = 1,
    group = "extras",
    groupIndex = 107,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_2_SCORE_1"
  },
  Flower3 = {
    type = "circle",
    radius = 1,
    sprite = "B_FLOWER_3",
    controllable = false,
    materialName = "summerFlower",
    particles = "flower3Buff",
    defence = 1,
    group = "extras",
    groupIndex = 108,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_3_SCORE_1"
  },
  Flower4 = {
    type = "circle",
    radius = 1.4,
    sprite = "B_FLOWER_4",
    controllable = false,
    materialName = "summerFlower",
    particles = "flower4Buff",
    defence = 1,
    group = "extras",
    groupIndex = 109,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_4_SCORE_1"
  },
  Flower5 = {
    type = "circle",
    radius = 1.1,
    sprite = "B_FLOWER_5",
    controllable = false,
    materialName = "summerFlower",
    particles = "flower5Buff",
    defence = 1,
    group = "extras",
    groupIndex = 110,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_5_SCORE_1"
  },
  Flower6 = {
    type = "circle",
    radius = 1.3,
    sprite = "B_FLOWER_6",
    controllable = false,
    materialName = "summerFlower",
    particles = "flower6Buff",
    defence = 1,
    group = "extras",
    groupIndex = 111,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_6_SCORE_1"
  },
  Flower7 = {
    type = "circle",
    radius = 1.5,
    sprite = "B_FLOWER_7",
    controllable = false,
    materialName = "summerFlower",
    particles = "flower7Buff",
    defence = 1,
    group = "extras",
    groupIndex = 112,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_7_SCORE_1"
  },
  Kielo1 = {
    type = "box",
    width = 1.4,
    height = 3.5,
    sprite = "B_KIELO_1",
    controllable = false,
    materialName = "summerGrass",
    defence = 1,
    group = "extras",
    groupIndex = 113,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  Varsi1 = {
    type = "box",
    width = 1.5,
    height = 2.3,
    sprite = "B_VARSI_1",
    controllable = false,
    materialName = "summerGrass",
    defence = 1,
    group = "extras",
    groupIndex = 114,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 4,
    destroyedScoreInc = 100
  },
  Varsi2 = {
    type = "box",
	--[[specialBlock = true,
	rotation = {
		speed = 5,
		loopTime = 1
	},]]
    width = 1.7,
    height = 2.8,
    sprite = "B_VARSI_2",
    controllable = false,
    materialName = "summerGrass",
    defence = 1,
    group = "extras",
    groupIndex = 115,
    strength = 1,
    restitution = 0.1,
    density = 0,
    z_order = 4,
    destroyedScoreInc = 100
  },
  Varsi3 = {
    type = "box",
    width = 1,
    height = 2.1,
    sprite = "B_VARSI_3",
    controllable = false,
    materialName = "summerGrass",
    defence = 1,
    group = "extras",
    groupIndex = 116,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 4,
    destroyedScoreInc = 100
  },
  LemonadeCan1 = {
    type = "box",
    width = 3.3,
    height = 3.4,
    sprite = "B_LEMONADE_CAN_1",
    controllable = false,
    materialName = "summerPicnic",
    particles = "summerglassBuff",
    defence = 1,
    group = "extras",
    groupIndex = 117,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  IceCreamBall1 = {
    type = "circle",
    radius = 1.4,
    sprite = "B_ICECREAM_BALL_1",
    controllable = false,
    materialName = "summerPicnic",
    particles = "iceCreamBuff",
	specialBlock = true,
	damageStateParticles = {
        {    
            particle = "iceCreamBuff",
			amount = 1,
			loopTime = 4,
            max = 100,
            min = 80
        },
        {    
            particle = "iceCreamBuff",
            amount = 2,
            loopTime = 3,
            max = 80,
            min = -1000
        }
    },
    waitingDmgStateParticleTime = 1,
    defence = 1,
    group = "extras",
    groupIndex = 118,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  IceCreamCone1 = {
    type = "box",
    width = 2.2,
    height = 3.5,
    sprite = "B_ICECREAM_CONE_1",
    controllable = false,
    materialName = "summerPicnic",
    particles = "iceCreamConeBuff",
    defence = 1,
    group = "extras",
    groupIndex = 119,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  FlowerVine1 = {
    type = "box",
    width = 0.5,
    height = 3.7,
    sprite = "B_FLOWER_VINE_1",
    controllable = false,
    materialName = "summerGrass",
    defence = 1,
    group = "extras",
    groupIndex = 120,
    strength = 20,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  FlowerVine2 = {
    type = "box",
    width = 0.6,
    height = 4.8,
    sprite = "B_FLOWER_VINE_2",
    controllable = false,
    materialName = "summerGrass",
    defence = 1,
    group = "extras",
    groupIndex = 121,
    strength = 20,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  Stick1 = {
    type = "box",
    width = 0.5,
    height = 4.8,
    sprite = "B_STICK_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 122,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  WindThing1 = {
    type = "circle",
    radius = 1.2,
    sprite = "B_WINDTHING_1",
    controllable = false,
    materialName = "extras",
    particles = "windthingBuff",
    defence = 1,
    group = "extras",
    groupIndex = 123,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 1000,
    spriteScore = "WINDTHING_SCORE_1"
  },
  HippieGlasses1 = {
    type = "box",
    width = 2.6,
    height = 1.1,
    sprite = "B_HIPPIE_GLASSES_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 124,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  HippieGlasses2 = {
    type = "box",
    width = 2.6,
    height = 1.1,
    sprite = "B_HIPPIE_GLASSES_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 125,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  HippieGlasses3 = {
    type = "box",
    width = 2.6,
    height = 1.1,
    sprite = "B_HIPPIE_GLASSES_3",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 126,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  HippieGlasses4 = {
    type = "box",
    width = 2.6,
    height = 1.1,
    sprite = "B_HIPPIE_GLASSES_4",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 127,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  SamsungPurple1 = {
    type = "box",
    sprite = "B_SAMSUNG_PURPLE_1",
    controllable = false,
    materialName = "light",
    group = "extras",
    groupIndex = 128,
    strength = 20,
    z_order = 5,
    particles = "samsungBuff"
  },
  SamsungPurple2 = {
    type = "box",
    sprite = "B_SAMSUNG_PURPLE_2",
    controllable = false,
    materialName = "light",
    group = "extras",
    groupIndex = 129,
    strength = 20,
    z_order = 5,
    particles = "samsungBuff"
  },
  SamsungBlue1 = {
    type = "box",
    sprite = "B_SAMSUNG_BLUE_1",
    controllable = false,
    materialName = "light",
    group = "extras",
    groupIndex = 130,
    strength = 20,
    z_order = 5,
    particles = "samsungBuff"
  },
  SamsungBlue2 = {
    type = "box",
    sprite = "B_SAMSUNG_BLUE_2",
    controllable = false,
    materialName = "light",
    group = "extras",
    groupIndex = 131,
    strength = 20,
    z_order = 5,
    particles = "samsungBuff"
  },
  SamsungGreen1 = {
    type = "box",
    sprite = "B_SAMSUNG_GREEN_1",
    controllable = false,
    materialName = "light",
    group = "extras",
    groupIndex = 132,
    strength = 20,
    z_order = 5,
    particles = "samsungBuff"
  },
  SamsungGreen2 = {
    type = "box",
    sprite = "B_SAMSUNG_GREEN_2",
    controllable = false,
    materialName = "light",
    group = "extras",
    groupIndex = 133,
    strength = 20,
    z_order = 5,
    particles = "samsungBuff"
  },
  SummerGrass1 = {
    type = "box",
    width = 3.5,
    height = 0.5,
    sprite = "B_SUMMER_GRASS_1",
    controllable = false,
    materialName = "summerGrass",
    group = "extras",
    groupIndex = 134,
    strength = 3,
    z_order = 5
  },
  SummerGrass2 = {
    type = "box",
    width = 3.5,
    height = 0.5,
    sprite = "B_SUMMER_GRASS_2",
    controllable = false,
    materialName = "summerGrass",
    group = "extras",
    groupIndex = 135,
    strength = 3,
    z_order = 5
  },
  SPACE_GALAXY_1 = {
    type = "box",
    sprite = "SPACE_GALAXY",
    materialName = "immovable",
    group = "extras",
    groupIndex = 136
  },
  SAMSUNG_GALAXY_S_1 = {
    type = "box",
    sprite = "SAMSUNG_GALAXY_S",
    materialName = "light",
    group = "extras",
    defence = 10000,
    groupIndex = 137,
    z_order = 8
  },
  ChineseGrass1 = {
    type = "box",
    width = 3.5,
    height = 0.5,
    sprite = "B_CHINESE_GRASS_1",
    controllable = false,
    materialName = "chineseGrass",
    group = "extras",
    groupIndex = 138,
    strength = 3,
    z_order = 4
  },
  ChineseBunnyStatue_1 = {
    type = "box",
    width = 2,
    height = 3.4,
    sprite = "B_BUNNY_STATUE_1",
    controllable = false,
    materialName = "bunnyStatue",
    particles = {"bunnyBuff", "bunnyBuff2"},
    defence = 1,
    group = "extras",
    groupIndex = 139,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 4,
    destroyedScoreInc = 3000,
    spriteScore = "BUNNY_STATUE_SCORE_1"
  },
  ChineseLantern_1 = {
    type = "box",
    width = 1.5,
    height = 2.5,
    sprite = "B_CHINESE_LANTERN_1",
    controllable = false,
    materialName = "chineseLantern",
    particles = "chineseLanternBuff1",
    defence = 1,
    group = "extras",
    groupIndex = 140,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 4,
    destroyedScoreInc = 3000,
    spriteScore = "LANTERN_SCORE_1"
  },
  ChineseLantern_2 = {
    type = "circle",
    radius = 1.3,
    width = 3.5,
    height = 0.5,
    sprite = "B_CHINESE_LANTERN_2",
    controllable = false,
    materialName = "chineseLantern",
    particles = "chineseLanternBuff2",
    defence = 1,
    group = "extras",
    groupIndex = 141,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 4,
    destroyedScoreInc = 3000,
    spriteScore = "LANTERN_SCORE_1"
  },
  ChineseLantern_3 = {
    type = "circle",
    radius = 1.3,
    sprite = "B_CHINESE_LANTERN_3",
    controllable = false,
    materialName = "chineseLantern",
    particles = "chineseLanternBuff2",
    defence = 1,
    group = "extras",
    groupIndex = 142,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 4,
    destroyedScoreInc = 3000,
    spriteScore = "LANTERN_SCORE_1"
  },
  ChineseFan_1 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_CHINESE_FAN_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 143,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseFan_2 = {
    type = "box",
    width = 1,
    height = 1,
    sprite = "B_CHINESE_FAN_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 144,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseFan_3 = {
    type = "box",
    width = 1,
    height = 1,
    sprite = "B_CHINESE_FAN_3",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 145,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseFan_4 = {
    type = "box",
    width = 1,
    height = 2,
    sprite = "B_CHINESE_FAN_4",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 146,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseBridge = {
    type = "polygon",
    vertices = {
      {x = 0.54, y = 0.23},
      {x = 1, y = 0.66},
      {x = 1, y = 1},
      {x = 0, y = 1},
      {x = 0, y = 0.66}
    },
    sprite = "B_BRIDGE_1",
    materialName = "immovable",
    group = "extras",
    groupIndex = 147,
    defence = 1000,
    strength = 1000,
    z_order = 5
  },
  ChineseTeapot_1 = {
    type = "box",
    width = 1.4,
    height = 1.9,
    sprite = "B_CHINESE_TEAPOT_1",
    controllable = false,
    materialName = "extras",
    particles = {
      "teapotBuff",
      "teapotBuff2"
    },
    defence = 1,
    group = "extras",
    groupIndex = 148,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseTeacup_1 = {
    type = "box",
    width = 0.8,
    height = 0.8,
    sprite = "B_CHINESE_TEACUP_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 149,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseHat_1 = {
    type = "box",
    width = 1,
    height = 1,
    sprite = "B_CHINESE_HAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 150,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseHat_2 = {
    type = "box",
    width = 2,
    height = 1,
    sprite = "B_CHINESE_HAT_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 151,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseHat_3 = {
    type = "box",
    width = 2,
    height = 1,
    sprite = "B_CHINESE_HAT_3",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 152,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  ChineseHat_4 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_CHINESE_HAT_4",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 153,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  GoldenMoonCake_1 = {
    type = "box",
    width = 2.2,
    height = 2.2,
    sprite = "B_MOONCAKE_GOLD",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 154,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 2,
    destroyedScoreInc = 100
  },
  BLOCK_ICE_4X4_1 = {
    type = "box",
    sprite = "BLOCK_ICE_4X4_1",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    specialEffectParticle = "lightBlockSparkle",
    minSpecialEffectAmount = 1,
    maxSpecialEffectAmount = 3,
    minSpecialEffectFrequency = 1,
    maxSpecialEffectFrequency = 10,
    destroyedScoreInc = 500,
    groupIndex = 13,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ICE_4X4_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ICE_4X4_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ICE_4X4_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ICE_4X4_4",
        max = 25,
        min = -1000
      }
    }
  },
  BLOCK_ICE_4x4_1_SPARK = {
    type = "box",
    sprite = "BLOCK_ICE_4X4_1",
    controllable = false,
    materialName = "light",
    group = "lightBlocks",
    groupIndex = 14,
    strength = 70,
    destroyedScoreInc = 500,
    specialEffectParticle = "lightBlockSparkle",
    minSpecialEffectAmount = 1,
    maxSpecialEffectAmount = 3,
    minSpecialEffectFrequency = 1,
    maxSpecialEffectFrequency = 10,
    damageSprites = {
      damage1 = {
        sprite = "BLOCK_ICE_4X4_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "BLOCK_ICE_4X4_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "BLOCK_ICE_4X4_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "BLOCK_ICE_4X4_4",
        max = 25,
        min = -1000
      }
    }
  },
  XMAS_CandyCane_1 = {
    type = "box",
    width = 0.9,
    height = 3,
    sprite = "XMAS_CANDY_CANE",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 155,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  XMAS_ElfHat_1 = {
    type = "box",
    width = 2,
    height = 1,
    sprite = "XMAS_ELF_HAT",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 156,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  XMAS_BallRed_1 = {
    type = "circle",
    radius = 1,
    sprite = "XMAS_BALL_RED",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 157,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  XMAS_BallBlue_1 = {
    type = "circle",
    radius = 1,
    sprite = "XMAS_BALL_BLUE",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 158,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  XMAS_GiftSock_1 = {
    type = "box",
    width = 2,
    height = 3,
    sprite = "XMAS_GIFT_SOCK",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 159,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  XMAS_CookieFlower_1 = {
    type = "circle",
    radius = 1.2,
    sprite = "XMAS_COOKIE_FLOWER",
    controllable = false,
    materialName = "cookie",
    defence = 1,
    group = "extras",
    groupIndex = 160,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  XMAS_CookieHeart_1 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "XMAS_COOKIE_HEART",
    controllable = false,
    materialName = "cookie",
    defence = 1,
    group = "extras",
    groupIndex = 161,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  XMAS_CookieStar_1 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "XMAS_COOKIE_STAR",
    controllable = false,
    materialName = "cookie",
    defence = 1,
    group = "extras",
    groupIndex = 162,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  XMAS_CookieBird_1 = {
    type = "circle",
    radius = 1.3,
    sprite = "XMAS_COOKIE_BIRD",
    controllable = false,
    materialName = "cookie",
    defence = 1,
    group = "extras",
    groupIndex = 163,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  XMAS_CookiePig_1 = {
    type = "circle",
    radius = 1.3,
    sprite = "XMAS_COOKIE_PIG",
    controllable = false,
    materialName = "cookie",
    defence = 1,
    group = "extras",
    groupIndex = 164,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  XMAS_Lights_1 = {
    type = "box",
    width = 8,
    height = 0.3,
    sprite = "XMAS_LIGHTS",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 165,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  GoldBlock_1 = {
    type = "box",
    sprite = "B_GOLD_1",
    controllable = false,
    materialName = "wood",
    group = "extras",
    groupIndex = 166,
    strength = 80,
    particles = "goldBlockBuff",
    damageSprites = {
      damage1 = {
        sprite = "B_GOLD_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "B_GOLD_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "B_GOLD_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "B_GOLD_4",
        max = 25,
        min = -1000
      }
    }
  },
  RedWoodBlock_1 = {
    type = "box",
    sprite = "B_REDWOOD_1",
    controllable = false,
    materialName = "wood",
    group = "extras",
    groupIndex = 167,
    strength = 80,
    particles = "redWoodenBuff",
    damageSprites = {
      damage1 = {
        sprite = "B_REDWOOD_1",
        max = 100,
        min = 75
      },
      damage2 = {
        sprite = "B_REDWOOD_2",
        max = 75,
        min = 50
      },
      damage3 = {
        sprite = "B_REDWOOD_3",
        max = 50,
        min = 25
      },
      damage4 = {
        sprite = "B_REDWOOD_4",
        max = 25,
        min = -1000
      }
    }
  },
  NianCrown_1 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_NIAN_CROWN",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 168,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  BirdBanner_1 = {
    type = "box",
    width = 2.8,
    height = 2.8,
    sprite = "B_BIRD_BANNER_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 169,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  BerryStick_1 = {
    type = "box",
    width = 0.6,
    height = 3,
    sprite = "B_BERRYSTICK_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 170,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  BerryStick_2 = {
    type = "box",
    width = 0.6,
    height = 3,
    sprite = "B_BERRYSTICK_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 171,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  MoneyLetter_1 = {
    type = "box",
    width = 1.6,
    height = 3,
    sprite = "B_MONEYLETTER_1",
    controllable = false,
    materialName = "extras",
    defence = 2,
    group = "extras",
    groupIndex = 172,
    strength = 10,
    restitution = 0.1,
    density = 0.4,
    z_order = 5,
    particles = "moneyBuff",
    destroyedScoreInc = 100
  },
  ChineseLantern_4 = {
    type = "box",
    width = 1.8,
    height = 4,
    sprite = "B_CHINESE_LANTERN_4",
    controllable = false,
    materialName = "extras",
    defence = 2,
    group = "extras",
    groupIndex = 173,
    strength = 10,
    restitution = 0.1,
    density = 0.4,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "LANTERN_SCORE_1"
  },
  GoldFish_1 = {
    type = "box",
    width = 2.5,
    height = 1.4,
    sprite = "B_GOLD_FISH_1",
    controllable = false,
    materialName = "goldfish",
    defence = 2,
    group = "extras",
    groupIndex = 174,
    strength = 10,
    restitution = 0.1,
    density = 0.4,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "GOLDPOT_SCORE_1"
  },
  ChineseRocket = {
    type = "box",
    width = 1,
    height = 3,
    sprite = "B_CHINESE_ROCKET_1",
    controllable = false,
    materialName = "rocket",
    group = "extras",
    groupIndex = 175,
    strength = 20,
    defence = 3,
    density = 1.0E-5,
    rocket = true,
    rocketTrailParticles = "smokeBuff3",
    rocketTrailSpawnDelay = 0.08,
    specialty = "BOMB",
    explosionRadius = 10,
    explosionForce = 1000,
    explosionDamageRadius = 8,
    explosionDamage = 400,
    particles = {
      "smokeBuff2",
      "fireworksExplosion2"
    }
  },
  SakuraFlower_Center = {
    type = "circle",
    radius = 0.7,
    sprite = "B_SAKURAFLOWER_CENTER",
    controllable = false,
    materialName = "cherryCenter",
    defence = 1,
    group = "extras",
    groupIndex = 176,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "FLOWER_1_SCORE_1"
  },
  SakuraFlower_Petal = {
    type = "box",
    width = 1,
    height = 0.8,
    sprite = "B_SAKURAFLOWER_PETAL_1",
    controllable = false,
    materialName = "cherryPetal",
    defence = 1,
    group = "extras",
    groupIndex = 177,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 4,
    destroyedScoreInc = 500
  },
  RiceBall_1 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_RICEBALL_1",
    controllable = false,
    materialName = "extras",
    particles = "riseSeaWeedBuff",
    defence = 1,
    group = "extras",
    groupIndex = 178,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  CandyStick_1 = {
    type = "box",
    width = 0.6,
    height = 3,
    sprite = "B_CANDYSTICK_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    particles = "candyStickBuff",
    groupIndex = 179,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  Miso_1 = {
    type = "box",
    width = 2,
    height = 2.5,
    sprite = "B_MISO_1",
    controllable = false,
    materialName = "extras",
    particles = "misoBuff",
    defence = 1,
    group = "extras",
    groupIndex = 180,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  JapaneseUmbrella_1 = {
    type = "box",
    width = 0.6,
    height = 5,
    sprite = "B_JAPANESE_UMBRELLA_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 181,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  ShogunHelmet_1 = {
    type = "box",
    width = 3,
    height = 3,
    sprite = "B_SHOGUN_HELMET",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 182,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  SushiBandanna_1 = {
    type = "box",
    width = 3,
    height = 1,
    sprite = "B_SUSHICHEF_BANDANNA",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 183,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  Sushi_1 = {
    type = "box",
    width = 2,
    height = 2.4,
    sprite = "B_SUSHI_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    particles = "riseSeaWeedBuff",
    groupIndex = 184,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  GreenTeapot_1 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_GREEN_TEAPOT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 185,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_TEACHER_POINTER_1 = {
    type = "box",
    width = 0.5,
    height = 6,
    sprite = "B_TEACHER_POINTER_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 186,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_PENCIL_1 = {
    type = "box",
    width = 1,
    height = 4,
    sprite = "B_PENCIL_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 187,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_PENCIL_2 = {
    type = "box",
    width = 0.5,
    height = 3.5,
    sprite = "B_PENCIL_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 188,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_PENCIL_3 = {
    type = "box",
    width = 0.5,
    height = 3.5,
    sprite = "B_PENCIL_3",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 189,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_PENCIL_4 = {
    type = "box",
    width = 0.5,
    height = 3.5,
    sprite = "B_PENCIL_4",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 190,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_RAIN_UMBRELLA_1 = {
    type = "box",
    width = 0.5,
    height = 3,
    sprite = "B_RAIN_UMBRELLA_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 191,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_RAIN_UMBRELLA_2 = {
    type = "box",
    width = 0.5,
    height = 2,
    sprite = "B_RAIN_UMBRELLA_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 192,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_APPLE_2 = {
    type = "circle",
    radius = 1,
    sprite = "B_APPLE_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 193,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_SCHOOL_BOOK_1 = {
    type = "box",
    width = 3,
    height = 2.5,
    sprite = "B_SCHOOL_BOOK_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 194,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  P_SCHOOL_PAPER_1 = {
    type = "box",
    width = 1.5,
    height = 1.5,
    sprite = "P_SCHOOL_PAPER_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 195,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  P_SCHOOL_PAPER_2 = {
    type = "box",
    width = 1.5,
    height = 1.5,
    sprite = "P_SCHOOL_PAPER_2",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 196,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_TRIANGLE_RULER_1 = {
    type = "polygon",
    vertices = {
      {x = 0.5, y = 0},
      {x = 1, y = 1},
      {x = 0, y = 1}
    },
    width = 2,
    height = 2,
    sprite = "B_TRIANGLE_RULER_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 197,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_KING_SCHOOL_HAT_1 = {
    type = "box",
    width = 2,
    height = 1,
    sprite = "B_KING_SCHOOL_HAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 198,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_DUNCE_CAP_1 = {
    type = "box",
    width = 1,
    height = 1,
    sprite = "B_DUNCE_CAP_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 199,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  B_RAIN_HAT_1 = {
    type = "box",
    width = 2,
    height = 1,
    sprite = "B_RAIN_HAT_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "extras",
    groupIndex = 200,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 500
  },
  StaticSummerCloud_1 = {
    type = "box",
    sprite = "CLOUD_1",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 14
  },
  StaticSummerCloud_2 = {
    type = "box",
    sprite = "CLOUD_2",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 15
  },
  StaticSummerCloud_3 = {
    type = "box",
    sprite = "CLOUD_3",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 16
  },
  StaticSummerCloud_4 = {
    type = "box",
    sprite = "CLOUD_4",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 17
  },
  StaticSummerCloud_5 = {
    type = "box",
    sprite = "CLOUD_5",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 18
  },
  StaticSummerCloud_6 = {
    type = "box",
    sprite = "CLOUD_6",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 19
  },
  StaticSummerCloud_7 = {
    type = "box",
    sprite = "CLOUD_7",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 20
  },
  StaticChineseMoon_7 = {
    type = "box",
    sprite = "PARALLAX_CHINESE_MOON",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 21
  },
  StaticChineseLotus_1 = {
    type = "box",
    sprite = "PARALLAX_LOTUS_LANTERN_1",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 22
  },
  StaticChineseLotus_2 = {
    type = "box",
    sprite = "PARALLAX_LOTUS_LANTERN_2",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 23
  },
  ChineseCloud_1 = {
    type = "box",
    sprite = "CHINESE_CLOUD_1",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 24
  },
  ChineseCloud_2 = {
    type = "box",
    sprite = "CHINESE_CLOUD_2",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 25
  },
  ChineseCloud_3 = {
    type = "box",
    sprite = "CHINESE_CLOUD_3",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 26
  },
  HalloweenCloud_1 = {
    type = "box",
    sprite = "H2_CLOUD",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 27
  },
  CherryCloud_1 = {
    type = "box",
    sprite = "CHERRY_CLOUD_1",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 28
  },
  CherryCloud_2 = {
    type = "box",
    sprite = "CHERRY_CLOUD_2",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 29
  },
  CherryCloud_3 = {
    type = "box",
    sprite = "CHERRY_CLOUD_3",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 30
  },
  HalloweenTNT = {
    type = "box",
    height = 3.5,
    width = 4,
    sprite = "BLOCK_BLACK_PUMPKIN_1",
    controllable = false,
    materialName = "halloweenTNT",
    group = "halloweenitems",
    groupIndex = 1,
    strength = 10,
    defence = 1,
    particles = {
      "explosionBuff",
      "batBuff",
      "blackPumpkinBuff"
    },
    specialty = "BOMB",
    explosionRadius = 10,
    explosionForce = 30000,
    explosionDamageRadius = 5,
    explosionDamage = 150
  },
  ExtraPumpkin1 = {
    type = "circle",
    sprite = "BLOCK_PUMPKIN_1",
    controllable = false,
	--levelAlly = true,
    materialName = "halloween",
    particles = "batBuff",
    group = "halloweenitems",
    groupIndex = 2,
    strength = 30,
    z_order = 5,
    radius = 2,
    restitution = 0.1,
    destroyedScoreInc = 3000,
    spriteScore = "3K_ORANGE"
  },
  ExtraPumpkin2 = {
    type = "polygon",
    vertices = {
      {x = 0.2, y = 0.5},
      {x = 0.4, y = 0.3},
      {x = 0.6, y = 0.3},
      {x = 0.8, y = 0.5},
      {x = 0.8, y = 0.6},
      {x = 0.2, y = 0.6}
    },
    sprite = "BLOCK_PUMPKIN_2",
    controllable = false,
    materialName = "pumpkin",
    particles = "pumpkinBuff",
    group = "halloweenitems",
    groupIndex = 3,
    strength = 20,
    z_order = 5,
    density = 0.5,
    restitution = 0.1
  },
  ExtraPumpkin3 = {
    type = "circle",
    sprite = "BLOCK_PUMPKIN_3",
    controllable = false,
    materialName = "pumpkin",
    particles = "pumpkinBuff",
    group = "halloweenitems",
    groupIndex = 4,
    strength = 10,
    z_order = 5,
    radius = 1.3,
    restitution = 0.1
  },
  ExtraPumpkin4 = {
    type = "circle",
    sprite = "BLOCK_PUMPKIN_PIG_1",
    controllable = false,
    materialName = "pumpkin",
    particles = "pumpkinBuff",
    group = "halloweenitems",
    groupIndex = 5,
    strength = 30,
    z_order = 5,
    radius = 2.1,
    restitution = 0.1
  },
  ExtraPumpkin5 = {
    type = "circle",
    sprite = "BLOCK_PUMPKIN_PIG_2",
    controllable = false,
    materialName = "pumpkin",
    particles = "pumpkinBuff",
    group = "halloweenitems",
    groupIndex = 6,
    strength = 30,
    z_order = 5,
    radius = 2.8,
    restitution = 0.1
  },
  ExtraLantern1 = {
    type = "polygon",
    vertices = {
      {x = 0.35, y = 0.35},
      {x = 0.65, y = 0.35},
      {x = 0.65, y = 0.7},
      {x = 0.35, y = 0.7}
    },
    sprite = "BLOCK_LANTERN_1",
    controllable = false,
    materialName = "lantern",
    particles = "flameBuff",
    group = "halloweenitems",
    groupIndex = 7,
    strength = 15,
    z_order = 5,
    restitution = 0.1
  },
  ExtraGhostCostume = {
    type = "circle",
    sprite = "BLOCK_GHOST_COSTUME",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 8,
    strength = 5,
    z_order = 5,
    restitution = 0.1,
    radius = 2.1
  },
  SkeletonHead_1 = {
    type = "circle",
    radius = 0.8,
    sprite = "SKELETON_HEAD_1",
    controllable = false,
    materialName = "skeleton",
    defence = 1,
    group = "halloweenitems",
    particles = "skeletonBuff",
    groupIndex = 9,
    strength = 11,
    restitution = 0.1,
    density = 1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  SkeletonHead_2 = {
    type = "circle",
    radius = 0.8,
    sprite = "SKELETON_HEAD_2",
    controllable = false,
    materialName = "skeleton",
    defence = 1,
    group = "halloweenitems",
    particles = "skeletonBuff",
    groupIndex = 10,
    strength = 11,
    restitution = 0.1,
    density = 1,
    z_order = 5,
    destroyedScoreInc = 3000,
    spriteScore = "3K_ORANGE"
  },
  SkeletonBody_1 = {
    type = "box",
    width = 1,
    height = 2,	
	drawSprite = {
		xOffCenter = 0, -- x off center -- related to the x scale
		yOffCenter = 0, -- y off center -- pos goes down -- also related to the x scale
		xScale = 3, -- x scale
		yScale = 3, -- y scale
		--angleDegrees = 0,
		f = 0, -- no idea rn
		g = 0, -- no idea rn
		sprite = "SKELETON_BODY_1"
	},
    sprite = "SKELETON_BODY_1",
    controllable = false,
    materialName = "skeleton",
    particles = "skeletonBuff",
    defence = 1,
    group = "halloweenitems",
    groupIndex = 11,
    strength = 11,
    restitution = 0.1,
    density = 1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  SkeletonLeg_1 = {
    type = "box",
    width = 0.6,
    height = 3,
    sprite = "SKELETON_LEG_1",
    controllable = false,
    materialName = "skeleton",
    particles = "skeletonBuff",
    defence = 1,
    group = "halloweenitems",
    groupIndex = 12,
    strength = 11,
    restitution = 0.1,
    density = 1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  HalloweenGrass1 = {
    type = "box",
    width = 3.5,
    height = 0.5,
    sprite = "B_HALLOWEEN_GRASS_1",
    controllable = false,
    materialName = "halloweenGrass",
    group = "halloweenitems",
    groupIndex = 13,
    strength = 3,
    z_order = 5
  },
  HalloweenGrass2 = {
    type = "box",
    width = 3.5,
    height = 0.5,
    sprite = "B_HALLOWEEN_GRASS_2",
    controllable = false,
    materialName = "halloweenGrass",
    group = "halloweenitems",
    groupIndex = 14,
    strength = 3,
    z_order = 5
  },
  TreasureChest = {
    type = "box",
    width = 5,
    height = 3,
    sprite = "B_TREASURE_1",
    controllable = false,
    materialName = "extras",
    particles = {
      "treasureChest",
      "moneyBuff"
    },
    destroyedScoreInc = 1000,
    spriteScore = "GOLDCOIN_SCORE_1",
    group = "halloweenitems",
    groupIndex = 15,
    strength = 60,
    density = 5,
    z_order = 5,
    destroyedSound = "treasure_break"
  },
  AncientVase = {
    type = "box",
    width = 3,
    height = 4,
    sprite = "B_AMFORA_1",
    controllable = false,
    materialName = "extras",
    particles = {
      "ancientVase"
    },
    destroyedScoreInc = 500,
    group = "halloweenitems",
    groupIndex = 16,
    strength = 10,
    density = 5,
    z_order = 5,
    destroyedSound = "vase_break"
  },
  Coral_1 = {
    type = "box",
    width = 5,
    height = 4,
    sprite = "B_CORAL_1",
    controllable = false,
    materialName = "extras",
    particles = {
      "coralPieces_1"
    },
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 17,
    strength = 1,
    density = 4,
    z_order = 5,
    destroyedSound = "seashell_coral_break"
  },
  Coral_2 = {
    type = "box",
    width = 2.5,
    height = 2.5,
    sprite = "B_CORAL_2",
    controllable = false,
    materialName = "extras",
    particles = {
      "coralPieces_1"
    },
    destroyedScoreInc = 50,
    group = "halloweenitems",
    groupIndex = 18,
    strength = 1,
    density = 4,
    z_order = 5,
    destroyedSound = "seashell_coral_break"
  },
  Coral_3 = {
    type = "box",
    width = 5,
    height = 3,
    sprite = "B_CORAL_3",
    controllable = false,
    materialName = "extras",
    particles = {
      "coralPieces_2"
    },
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 19,
    strength = 1,
    density = 4,
    z_order = 5,
    destroyedSound = "seashell_coral_break"
  },
  SeaShell_1 = {
    type = "polygon",
    vertices = {
      {x = 1, y = 0},
      {x = 0.3, y = 1},
      {x = 0, y = 0.5}
    },
    sprite = "B_SEASHELL_1",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 20,
    strength = 40,
    density = 4,
    z_order = 5,
    destroyedSound = "seashell_coral_break"
  },
  SeaShell_2 = {
    type = "box",
    width = 2,
    height = 2,
    sprite = "B_SEASHELL_2",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 21,
    strength = 40,
    density = 4,
    z_order = 5,
    destroyedSound = "seashell_coral_break"
  },
  SeaShell_3 = {
    type = "box",
    width = 3.5,
    height = 3,
    sprite = "B_SEASHELL_3",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 22,
    strength = 40,
    density = 4,
    z_order = 5,
    destroyedSound = "seashell_coral_break"
  },
  Starfish_1 = {
    type = "circle",
    width = 3,
    height = 3,
    sprite = "B_STARFISH_1",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 23,
    strength = 40,
    density = 4,
    z_order = 5,
    destroyedSound = "seashell_coral_break"
  },
  Pontoon_1 = {
    type = "box",
    width = 6,
    height = 2,
    sprite = "B_PONTOON_1",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 24,
    strength = 20,
    density = 0.5,
    z_order = 5,
    destroyedSound = "pontoon_pop",
    floatability = 1.2
  },
  FishGig = {
    type = "polygon",
    vertices = {
      {x = 1, y = 0},
      {x = 0.5, y = 1},
      {x = 0, y = 0}
    },
    sprite = "B_ATRAIN_1",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 25,
    strength = 5,
    density = 4,
    z_order = 5
  },
  Snorkle_1 = {
    type = "polygon",
    vertices = {
      {x = 1, y = 0},
      {x = 0, y = 1},
      {x = 1, y = 1}
    },
    sprite = "B_SNORKEL_1",
    controllable = false,
    materialName = "extras",
    defence = 1,
    group = "halloweenitems",
    groupIndex = 26,
    strength = 1,
    restitution = 0.1,
    density = 0.1,
    z_order = 5,
    destroyedScoreInc = 100
  },
  FishSuit_1 = {
    type = "box",
    width = 1.8,
    height = 2.3,
    sprite = "B_FISHSUIT_1",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 27,
    strength = 20,
    defence = 100000,
    density = 0.2,
    z_order = 5
  },
  FishSuit_2 = {
    type = "box",
    width = 3,
    height = 4,
    sprite = "B_FISHSUIT_2",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 28,
    strength = 20,
    defence = 100000,
    density = 0.2,
    z_order = 5
  },
  FishSuit_3 = {
    type = "box",
    width = 8,
    height = 3.5,
    sprite = "B_FISHSUIT_3",
    controllable = false,
    materialName = "extras",
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 29,
    strength = 20,
    defence = 100000,
    density = 0.2,
    z_order = 5
  },
  PiglantisWeed = {
    type = "box",
    width = 4.5,
    height = 1.5,
    sprite = "B_PIGLANTIS_WEED",
    controllable = false,
    materialName = "extras",
    particles = {
      "piglantisWeed"
    },
    destroyedScoreInc = 100,
    group = "halloweenitems",
    groupIndex = 30,
    strength = 1,
    z_order = 5
  },
  BubbleEmitter = {
    type = "box",
    width = 1,
    height = 1,
    sprite = "GROUND_BLOCK_01",
    controllable = false,
    materialName = "extras",
    emitter = true,
    emitFrequency = {4, 7},
    emitAmount = 1,
    emitParticles = "bubbles",
    group = "halloweenitems",
    groupIndex = 31,
    strength = 5,
    defence = 9999,
    z_order = 5
  },
  Chandelier_1 = {
    type = "box",
    width = 8,
    height = 2,
    sprite = "B_CHANDELIER_1",
    controllable = false,
    materialName = "rock",
    group = "halloweenitems",
    groupIndex = 32,
    strength = 400,
    defence = 60,
    density = 5,
    z_order = 5,
    collisionSound = "chandelier_collision",
    destroyedSound = "chandelier_break"
  },
  HockeyMask_1 = {
    type = "circle",
    radius = 2.4,
    sprite = "B_KING_HOCKEY_MASK_1",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 33,
    strength = 5,
    density = 1,
    z_order = 5
  },
  FrankHead_1 = {
    type = "box",
    width = 3,
    height = 2,
    sprite = "B_FRANKENSTEIN_HEAD_1",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 34,
    strength = 5,
    density = 1,
    z_order = 5
  },
  CthWing_1 = {
    type = "box",
    width = 1,
    height = 2,
    sprite = "B_CTHULHU_WING_1",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 35,
    strength = 5,
    density = 1,
    z_order = 5
  },
  CthWing_2 = {
    type = "box",
    width = 1,
    height = 2,
    sprite = "B_CTHULHU_WING_2",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 36,
    strength = 5,
    density = 1,
    z_order = 5
  },
  ChainPiece_1 = {
    type = "box",
    width = 1,
    height = 3,
    sprite = "B_CHAIN_PIECE_1",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 37,
    strength = 5,
    z_order = 5,
    destroyedSound = "chain_break"
  },
  KingMask = {
    type = "circle",
    sprite = "B_KING_CALAVERA_MASK_1",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 38,
    strength = 5,
    density = 1,
    z_order = 5,
    restitution = 0.1,
    radius = 2.1
  },
  BackgroundFish1 = {
    type = "box",
    sprite = "P_FISH_1",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 31
  },
  BackgroundFish2 = {
    type = "box",
    sprite = "P_FISH_2",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 32
  },
  BackgroundFish3 = {
    type = "box",
    sprite = "P_FISH_3",
    materialName = "immovable",
    group = "clouds",
    groupIndex = 33
  },
  BlockGhost1 = {
    type = "box",
    sprite = "BLOCK_GHOST_1",
    materialName = "ghostBlock",
    group = "staticFragile",
    groupIndex = 18,
    strength = 35,
    defence = 2.5,
    friction = 4,
    restitution = 0.2,
    density = 1,
    destroyedScoreInc = 100,
    z_order = 5,
    height = 4,
    width = 4,
    spawn = {
      amount = 4,
      definition = "BlockGhostSmall1"
    }
  },
  BlockGhost2 = {
    type = "box",
    sprite = "BLOCK_GHOST_4",
    materialName = "ghostBlock",
    group = "staticFragile",
    groupIndex = 19,
    strength = 35,
    defence = 2.5,
    friction = 4,
    restitution = 0.2,
    density = 1,
    destroyedScoreInc = 100,
    z_order = 5,
    height = 2,
    width = 8,
    spawn = {
      amount = 4,
      definition = "BlockGhostSmall1"
    }
  },
  BlockGhost3 = {
    type = "box",
    sprite = "BLOCK_GHOST_3",
    materialName = "ghostBlock",
    group = "staticFragile",
    groupIndex = 20,
    strength = 35,
    defence = 2.5,
    friction = 4,
    restitution = 0.2,
    density = 1,
    destroyedScoreInc = 100,
    z_order = 5,
    height = 2,
    width = 4,
    spawn = {
      amount = 2,
      definition = "BlockGhostSmall1"
    }
  },
  BlockGhostSmall1 = {
    type = "box",
    sprite = "BLOCK_GHOST_5",
    materialName = "ghostBlock",
    height = 2,
    width = 2,
    group = "staticFragile",
    groupIndex = 21,
    strength = 35,
    density = 0.1,
    defence = 1,
    friction = 4,
    restitution = 0.2,
    destroyedScoreInc = 100,
    z_order = 5
  },
  Intel1 = {
    type = "box",
    sprite = "B_INTEL_1_1",
    controllable = false,
    materialName = "rock",
    group = "halloweenitems",
    groupIndex = 38,
    strength = 120,
    damageSprites = {
      damage1 = {
        sprite = "B_INTEL_1_1",
        max = 100,
        min = 66
      },
      damage2 = {
        sprite = "B_INTEL_1_2",
        max = 66,
        min = 33
      },
      damage3 = {
        sprite = "B_INTEL_1_3",
        max = 33,
        min = -1000
      }
    }
  },
  Intel2 = {
    type = "box",
    sprite = "B_INTEL_2_1",
    controllable = false,
    materialName = "rock",
    group = "halloweenitems",
    groupIndex = 39,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "B_INTEL_2_1",
        max = 100,
        min = 66
      },
      damage2 = {
        sprite = "B_INTEL_2_2",
        max = 66,
        min = 33
      },
      damage3 = {
        sprite = "B_INTEL_2_3",
        max = 33,
        min = -1000
      }
    }
  },
  Intel3 = {
    type = "box",
    sprite = "B_INTEL_3_1",
    controllable = false,
    materialName = "rock",
    group = "halloweenitems",
    groupIndex = 40,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "B_INTEL_3_1",
        max = 100,
        min = 66
      },
      damage2 = {
        sprite = "B_INTEL_3_2",
        max = 66,
        min = 33
      },
      damage3 = {
        sprite = "B_INTEL_3_3",
        max = 33,
        min = -1000
      }
    }
  },
  Intel4 = {
    type = "box",
    sprite = "B_INTEL_4_1",
    controllable = false,
    materialName = "rock",
    group = "halloweenitems",
    groupIndex = 41,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "B_INTEL_4_1",
        max = 100,
        min = 66
      },
      damage2 = {
        sprite = "B_INTEL_4_2",
        max = 66,
        min = 33
      },
      damage3 = {
        sprite = "B_INTEL_4_3",
        max = 33,
        min = -1000
      }
    }
  },
  Intel5 = {
    type = "box",
    sprite = "B_INTEL_5_1",
    controllable = false,
    materialName = "rock",
    group = "halloweenitems",
    groupIndex = 42,
    strength = 70,
    damageSprites = {
      damage1 = {
        sprite = "B_INTEL_5_1",
        max = 100,
        min = 66
      },
      damage2 = {
        sprite = "B_INTEL_5_2",
        max = 66,
        min = 33
      },
      damage3 = {
        sprite = "B_INTEL_5_3",
        max = 33,
        min = -1000
      }
    }
  },
  Intel6 = {
    type = "box",
    sprite = "B_INTEL_6_1",
    controllable = false,
    materialName = "rock",
    group = "halloweenitems",
    groupIndex = 43,
    strength = 120,
    damageSprites = {
      damage1 = {
        sprite = "B_INTEL_6_1",
        max = 100,
        min = 66
      },
      damage2 = {
        sprite = "B_INTEL_6_2",
        max = 66,
        min = 33
      },
      damage3 = {
        sprite = "B_INTEL_6_3",
        max = 33,
        min = -1000
      }
    }
  },
  IntelDeco1 = {
    type = "box",
    sprite = "B_INTEL_DECORATION_1",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 44
  },
  IntelDeco2 = {
    type = "box",
    sprite = "B_INTEL_DECORATION_2",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 45
  },
  IntelDeco3 = {
    type = "box",
    sprite = "B_INTEL_DECORATION_3",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 46
  },
  IntelDeco4 = {
    type = "box",
    sprite = "B_INTEL_DECORATION_4",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 47
  },
  IntelChip = {
    type = "box",
    sprite = "INTEL_CHIP",
    controllable = false,
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 201
  },
  IntelLaptop1 = {
    materialName = "immovable",
    type = "box",
    sprite = "INTEL_LAPTOP_1",
    group = "extras",
    groupIndex = 202,
    controllable = false
  },
  IntelLaptop2 = {
    materialName = "immovable",
    type = "box",
    sprite = "INTEL_LAPTOP_2",
    group = "extras",
    groupIndex = 203,
    controllable = false
  },
  IntelChip2 = {
    type = "box",
    sprite = "INTEL_CHIP_2",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 204
  },
  IntelChip3 = {
    type = "box",
    sprite = "INTEL_LOGO_BLOCK",
    controllable = false,
    materialName = "extras",
    group = "extras",
    groupIndex = 205
  },
  SnowCover = {
    type = "box",
    sprite = "B_SNOW_COVER_1",
    controllable = false,
    materialName = "extras",
    height = 0.35,
    width = 2.5,
    density = 0,
    group = "halloweenitems",
    groupIndex = 48
  },
  Icicle1 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0},
      {x = 1, y = 0},
      {x = 0.5, y = 1}
    },
    sprite = "B_ICICLE_1",
    materialName = "light",
    group = "halloweenitems",
    groupIndex = 49,
    friction = 0.01,
    strength = 100,
    defence = 100,
    restitution = 0.1,
    density = 30
  },
  Icicle1_Weak = {
    type = "polygon",
    vertices = {
      {x = -0.1, y = -0.1},
      {x = 1.1, y = -0.1},
      {x = 0.5, y = 1.1}
    },
    sprite = "B_ICICLE_1",
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 50,
    friction = 0.01,
    strength = 1,
    defence = 0,
    restitution = 0.1,
    density = 0
  },
  Icicle2 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0},
      {x = 1, y = 0},
      {x = 0.5, y = 1}
    },
    sprite = "B_ICICLE_2",
    materialName = "light",
    group = "halloweenitems",
    groupIndex = 51,
    friction = 0.01,
    strength = 100,
    defence = 30,
    restitution = 0.1,
    density = 30
  },
  Icicle2_Weak = {
    type = "polygon",
    vertices = {
      {x = -0.1, y = -0.1},
      {x = 1.1, y = -0.1},
      {x = 0.5, y = 1.1}
    },
    sprite = "B_ICICLE_2",
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 52,
    friction = 0.01,
    strength = 1,
    defence = 0,
    restitution = 0.1,
    density = 0
  },
  Icicle3 = {
    type = "polygon",
    vertices = {
      {x = 0, y = 0},
      {x = 1, y = 0},
      {x = 0.5, y = 1}
    },
    sprite = "B_ICICLE_3",
    materialName = "light",
    group = "halloweenitems",
    groupIndex = 53,
    friction = 0.01,
    strength = 150,
    defence = 150,
    restitution = 0.1,
    density = 18
  },
  Icicle3_Weak = {
    type = "polygon",
    vertices = {
      {x = -0.1, y = -0.1},
      {x = 1.1, y = -0.1},
      {x = 0.5, y = 1.1}
    },
    sprite = "B_ICICLE_3",
    materialName = "extras",
    group = "halloweenitems",
    groupIndex = 54,
    friction = 0.01,
    strength = 10,
    defence = 0,
    restitution = 0.1,
    density = 0
  },
  BlueIce = {
    type = "box",
    sprite = "B_BLUE_ICE_1",
    materialName = "light",
    group = "staticFragile",
    friction = 0.01,
    strength = 100,
    defence = 15,
    restitution = 0.1,
    density = 4,
    groupIndex = 22
  },
  SnowmanHead = {
    type = "circle",
    sprite = "B_SNOWMAN_HEAD_1",
    controllable = false,
    materialName = "snow",
    group = "staticFragile",
    groupIndex = 23,
    defence = 20,
    strength = 50,
    damageSprites = {
      damage1 = {
        sprite = "B_SNOWMAN_HEAD_1",
        max = 100,
        min = 90
      },
      damage2 = {
        sprite = "B_SNOWMAN_HEAD_1",
        max = 90,
        min = 40
      },
      damage3 = {
        sprite = "B_SNOWMAN_HEAD_1",
        max = 40,
        min = -10
      }
    },
    destroyedScoreInc = 100
  },
   PortalRed = {
    type = "box",
    sprite = "ORANGEPORTAL_1",
	specialBlock = true,
    animationSprites = {
      "ORANGEPORTAL_1",
      "ORANGEPORTAL_2",
      "ORANGEPORTAL_3",
      "ORANGEPORTAL_4",
      timePerSprite = 0.1
    },
    materialName = "portal",
    group = "platforms",
    groupIndex = 6,
    effect = {
      {
        type = "particle",
        id = "portalTeleportation",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      } ,
      {
        type = "sound",
        id = {
          "magic_portal_enter_01",
          "magic_portal_enter_02",
          "magic_portal_enter_03"
        },
        direction = "in"
      },
      {
        type = "sound",
        id = {
          "magic_portal_exit_01",
          "magic_portal_exit_02"
        },
        direction = "out"
      }
    },
    sensor = true
  },
  BLUEPORTAL = {
    type = "box",
    sprite = "BLUEPORTAL_1",
	specialBlock = true,
    animationSprites = {
      "BLUEPORTAL_1",
      "BLUEPORTAL_2",
      "BLUEPORTAL_3",
      "BLUEPORTAL_4",
      timePerSprite = 0.1
    },
    materialName = "portal",
    group = "platforms",
    groupIndex = 7,
    tutorialInfo = "TUTORIAL_12",
    effect = {
      {
        type = "particle",
        id = "portalTeleportation",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalTeleportation",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      } ,
      {
        type = "sound",
        id = {
          "magic_portal_enter_01",
          "magic_portal_enter_02",
          "magic_portal_enter_03"
        },
        direction = "in",
        volume = 1
      },
      {
        type = "sound",
        id = {
          "magic_portal_exit_01",
          "magic_portal_exit_02"
        },
        direction = "out",
        volume = 1
      }
    },
    sensor = true
  },
  PortalPurple = {
    type = "box",
    sprite = "BLUEPORTAL_1",
    specialBlock = true,
    animationSprites = {
      "BLUEPORTAL_1",
      "BLUEPORTAL_2",
      "BLUEPORTAL_3",
      "BLUEPORTAL_4",
      timePerSprite = 0.1
    },
    materialName = "portal",
    group = "platforms",
    groupIndex = 11,
    tutorialInfo = "TUTORIAL_12",
    effect = {
      {
        type = "particle",
        id = "portalTeleportation",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalTeleportation",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "sound",
        id = {
          "magic_portal_enter_01",
          "magic_portal_enter_02",
          "magic_portal_enter_03"
        },
        direction = "in",
        volume = 1
      },
      {
        type = "sound",
        id = {
          "magic_portal_exit_01",
          "magic_portal_exit_02"
        },
        direction = "out",
        volume = 1
      }
    },
    sensor = true
  },
  PortalYellow = {
    type = "box",
    sprite = "ORANGEPORTAL_1",
    specialBlock = true,
    animationSprites = {
      "ORANGEPORTAL_1",
      "ORANGEPORTAL_2",
      "ORANGEPORTAL_3",
      "ORANGEPORTAL_4",
      timePerSprite = 0.1
    },
    materialName = "portal",
    group = "platforms",
    groupIndex = 10,
    effect = {
      {
        type = "particle",
        id = "portalTeleportation",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "particle",
        id = "portalEffectBuff",
        rotationFromPortal = true,
        positionFromPortal = false,
        direction = "both"
      },
      {
        type = "sound",
        id = {
          "magic_portal_enter_01",
          "magic_portal_enter_02",
          "magic_portal_enter_03"
        },
        direction = "in"
      },
      {
        type = "sound",
        id = {
          "magic_portal_exit_01",
          "magic_portal_exit_02"
        },
        direction = "out"
      }
    },
    sensor = true
  },
  Snowball = {
    type = "circle",
    sprite = "B_SNOWBALL_1",
    controllable = false,
    materialName = "snow",
    group = "staticFragile",
    groupIndex = 24
  },
  TestPoison = {
    type = "circle",
	radius = 3,
    sprite = "PIGLETTE_BIG_01",
    controllable = false,
	distanceSensor = {
		--[[type = "box",
		rectangularLimits = {
			x = {20, 20},
			y = {20, 20}
		},]]
		destroySpeed = 3,
		radius = {0, 10},
		--gravity = {x = 2, y = 0},
		allow = {
			birds = true,
			levelGoals = true,
			blocks = true
		}
	},
	rotation = {
		startASAP = false,
		speed = 0.5,
	},
	specialBlock = true,
	drawSprite = {
		xOffCenter = 0, -- x off center -- related to the x scale
		yOffCenter = 0, -- y off center -- pos goes down -- also related to the x scale
		xScale = 1, -- x scale
		yScale = 0.5, -- y scale
		f = 999, -- no idea rn -- omfg i hate them
		g = 0, -- no idea rn -- i hate u too
		sprite = "ASTEROID_ROCK_BIG_1",
		z_order = 5,
	},
    materialName = "immovable",
    group = "testBlocks",
	density = 1,
	defence = 2000,
	strength = 100000000,
    groupIndex = 1
  },
  TestRectangularGravityField = {
    type = "box",
    sprite = "BLOCK_WOOD_10X1_1",
    controllable = false,
    materialName = "immovable",
	distanceSensor = {
		rectangularLimits = {
			x = {5, 5},
			y = {22, 0}
		},
		gravity = {x = 0, y = 80},
		allow = {
			birds = true,
			levelGoals = true,
			blocks = true
		}
	},
    group = "testBlocks",
    groupIndex = 2,
    strength = 100
  },
  TestRectangularGravityField2 = {
    type = "box",
    sprite = "BLOCK_WOOD_10X1_1",
    controllable = false,
    materialName = "immovable",
	distanceSensor = {
		rectangularLimits = {
			x = {0, 30},
			y = {10, 10}
		},
		destroySpeed = "err",
		gravity = {x = -20, y = 0},
		allow = {
			birds = true,
			levelGoals = true,
			blocks = true
		}
	},
    group = "testBlocks",
    groupIndex = 3,
    strength = 100
  },
  TestRectangularGravityField3 = {
    type = "box",
    sprite = "BLOCK_WOOD_10X1_1",
    controllable = false,
    materialName = "immovable",
	distanceSensor = {
		rectangularLimits = {
			x = {5, 5},
			y = {0, 100}
		},
		gravity = {x = 0, y = -20},
		allow = {
			birds = true,
			levelGoals = true,
			blocks = true
		}
	},
    group = "testBlocks",
    groupIndex = 4,
    strength = 100
  },
  TestItemCollect = {
    friction = 0.3,
    type = "box",
	collision = false,
	density = 0,
    sprite = "BLOCK_WOOD_10X1_1",
	specialBlock = true,
	offCenterParticle = {
		x = 0,
		y = -1,
		w = 0,
		h = 0
	},
	spawnParticles = {
		particle = "gravityFieldDown",
		amount = 2,
		loopTime = 0.3,
		waitingTime = 1
	},
    controllable = false,
	distanceSensor = {
		rectangularLimits = {
			x = {5, 5},
			y = {18, 0}
		},
		gravity = {x = 0, y = -40},
		--[[radius = {0, 5},
		item = true,
		addBirdRadius = true,]]
		allow = {
			birds = true,
			levelGoals = true,
			blocks = true
		}
	},
    materialName = "extras",
    particles = "smokeBuff",
    group = "testBlocks",
    groupIndex = 5
  },
}
filename = "blocks.lua"
