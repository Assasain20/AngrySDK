scaleFactor = 2
featherSizeLarge = 1 * scaleFactor
featherSizeMedium = 0.4 * scaleFactor
featherSizeSmall = 0.1 * scaleFactor
lifeTimeRandom = 1
featherSpinSpeed = 5
particles = {
  snowHard = {
    sprites = {
      "FOREGROUND_10_SNOWFLAKE_1"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 300,
      maxVelX = 1000,
      minVelY = 600,
      maxVelY = 800
    },
    minAngleVel = 0,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 2.5,
    minScaleEnd = 1,
    maxScaleEnd = 2.5,
    lifeTime = 12,
    gravityX = 0,
    gravityY = 20
  },
  snowLight = {
    sprites = {
      "FOREGROUND_10_SNOWFLAKE_1"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 50,
      maxVelX = 120,
      minVelY = 60,
      maxVelY = 80
    },
    minAngleVel = 0,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 2.5,
    minScaleEnd = 1,
    maxScaleEnd = 2.5,
    lifeTime = 24,
    gravityX = 0,
    gravityY = 20
  },
  snow = {
    sprites = {
      "FOREGROUND_10_SNOWFLAKE_1"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 100,
      maxVelX = 250,
      minVelY = 100,
      maxVelY = 250
    },
    minAngleVel = 0,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 2.5,
    minScaleEnd = 1,
    maxScaleEnd = 2.5,
    lifeTime = 12,
    gravityX = 0,
    gravityY = 20
  },
  snowStorm = {
    sprites = {
      "FOREGROUND_10_SNOWFLAKE_1"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 400,
      maxVelX = 650,
      minVelY = 100,
      maxVelY = 250
    },
    minAngleVel = 0,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 2.5,
    minScaleEnd = 1,
    maxScaleEnd = 2.5,
    lifeTime = 12,
    gravityX = 0,
    gravityY = 20
  },
  rain = {
    sprites = {"P_WATER_1"},
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 100,
      maxVelX = 150,
      minVelY = 250,
      maxVelY = 350
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.5,
    maxScaleEnd = 0.5,
    lifeTime = 5,
    gravityX = 0,
    gravityY = 0
  },
  shootingstar = {
    sprites = {
      "SHOOTING_STAR"
    },
    sheet = "INGAME_BLOCKS_6",
    emitter_box = {
      minVelX = 170,
      maxVelX = 200,
      minVelY = 140,
      maxVelY = 160
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.5,
    maxScaleEnd = 0.5,
    lifeTime = 5,
    gravityX = 0,
    gravityY = 0
  },
  starExplosion = {
    sprites = {
      "LS_PARTICLE_X_1",
      "LS_PARTICLE_X_2",
      "LS_PARTICLE_X_1",
      "LS_PARTICLE_X_2"
    },
    sheet = "LEVELSELECTION_SHEET_1",
    emitter_box = {
      minVelX = -200,
      maxVelX = 200,
      minVelY = -200,
      maxVelY = 200
    },
    minAngleVel = -17,
    maxAngleVel = 17,
    minScaleBegin = 0.5,
    maxScaleBegin = 1.5,
    minScaleEnd = 0.25,
    maxScaleEnd = 0.25,
    lifeTime = 1.75,
    gravityX = 0,
    gravityY = 200
  },
  fireworksExplosion2 = {
    sprites = {
      "P_FIREWORK_1",
      "P_FIREWORK_2",
      "P_FIREWORK_3",
      "P_FIREWORK_4",
      "P_FIREWORK_5",
      "P_FIREWORK_6"
    },
    sheet = "LEVELSELECTION_SHEET_1",
    emitter_box = {
      minVelX = -500,
      maxVelX = 50,
      minVelY = -500,
      maxVelY = 50
    },
    minAngleVel = -17,
    maxAngleVel = 50,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.6,
    minScaleEnd = 1,
    maxScaleEnd = 1,
    lifeTime = 1.75,
    gravityX = 0,
    gravityY = 500
  },
  fireworksWeather = {
    sprites = {
      "P_FIREWORK_1",
      "P_FIREWORK_2",
      "P_FIREWORK_3",
      "P_FIREWORK_4",
      "P_FIREWORK_5",
      "P_FIREWORK_6"
    },
    animation = "lifeTime",
    sheet = "LEVELSELECTION_SHEET_1",
    emitter_circle = {
      amount = 40,
      minVel = 10,
      maxVel = 40
    },
    minAngleVel = -17,
    maxAngleVel = 50,
    minScaleBegin = 0.1,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.11,
    maxScaleEnd = 0.11,
    lifeTime = 1.75,
    gravityX = 0,
    gravityY = 40
  },
  fireworksMenu = {
    sprites = {
      "P_FIREWORK_1",
      "P_FIREWORK_2",
      "P_FIREWORK_3",
      "P_FIREWORK_4",
      "P_FIREWORK_5",
      "P_FIREWORK_6"
    },
    animation = "lifeTime",
    sheet = "LEVELSELECTION_SHEET_1",
    roundExplosions = true,
    emitter_circle = {
      amount = 40,
      minVel = 10,
      maxVel = 40
    },
    minAngleVel = -50,
    maxAngleVel = 50,
    minScaleBegin = 0.1,
    maxScaleBegin = 0.2,
    minScaleEnd = 0.11,
    maxScaleEnd = 0.11,
    lifeTime = 1.75,
    gravityX = 0,
    gravityY = 40
  },
  butterflyExplosionRed = {
    sprites = {
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_box = {
      minVelX = -200,
      maxVelX = 200,
      minVelY = -200,
      maxVelY = 200
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.75,
    minScaleEnd = 0.25,
    maxScaleEnd = 0.25,
    lifeTime = 1.75,
    gravityX = 0,
    gravityY = 0
  },
  butterflyExplosionBlue = {
    sprites = {
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_box = {
      minVelX = -200,
      maxVelX = 200,
      minVelY = -200,
      maxVelY = 200
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.75,
    minScaleEnd = 0.25,
    maxScaleEnd = 0.25,
    lifeTime = 1.75,
    gravityX = 0,
    gravityY = 0
  },
  butterflyMainMenuL2R_Red = {
    sprites = {
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_box = {
      minVelY = -5,
      maxVelY = -30,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = -0.25,
    maxScaleBegin = -0.75,
    minScaleEnd = -0.5,
    maxScaleEnd = -1.5,
    lifeTime = 20,
    gravityX = 0,
    gravityY = 0
  },
  butterflyMainMenuR2L_Red = {
    sprites = {
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3",
      "BUTTERFLY_FRAME_1",
      "BUTTERFLY_FRAME_2",
      "BUTTERFLY_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_box = {
      minVelY = -5,
      maxVelY = -30,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.25,
    maxScaleBegin = 0.75,
    minScaleEnd = 0.5,
    maxScaleEnd = 1.5,
    lifeTime = 20,
    gravityX = 0,
    gravityY = 0
  },
  butterflyMainMenuL2R_Blue = {
    sprites = {
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_box = {
      minVelY = -5,
      maxVelY = -30,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = -0.25,
    maxScaleBegin = -0.75,
    minScaleEnd = -0.5,
    maxScaleEnd = -1.5,
    lifeTime = 20,
    gravityX = 0,
    gravityY = 0
  },
  butterflyMainMenuR2L_Blue = {
    sprites = {
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3",
      "BUTTERFLY_2_FRAME_1",
      "BUTTERFLY_2_FRAME_2",
      "BUTTERFLY_2_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_box = {
      minVelY = -5,
      maxVelY = -30,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.25,
    maxScaleBegin = 0.75,
    minScaleEnd = 0.5,
    maxScaleEnd = 1.5,
    lifeTime = 20,
    gravityX = 0,
    gravityY = 0
  },
  menuBatsLeft = {
    sprites = {
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_bat = {targetX = 0.5, targetY = 0.555},
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = -0.5,
    maxScaleBegin = -1,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 10,
    gravityX = 0,
    gravityY = 0
  },
  menuBatsRight = {
    sprites = {
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3"
    },
    animation = "lifeTime",
    sheet = "MENU_ELEMENTS_2",
    emitter_bat = {targetX = 0.5, targetY = 0.555},
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.5,
    maxScaleBegin = 1,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 10,
    gravityX = 0,
    gravityY = 0
  },
  giftExplosion = {
    sprites = {
      "BLOCK_GIFT_1",
      "BLOCK_GIFT_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -200,
      maxVelX = 200,
      minVelY = -100,
      maxVelY = 50
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.1,
    maxScaleBegin = 0.7,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 300
  },
  fishiesMainMenu = {
    sprites = {"P_FISH_1"},
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.6,
    maxScaleBegin = 1,
    minScaleEnd = 0.9,
    maxScaleEnd = 0.9,
    lifeTime = 16,
    gravityX = 0,
    gravityY = 26
  },
  fishiesMainMenuIpad3 = {
    sprites = {"P_FISH_1"},
    sheet = "INGAME_BLOCKS_3",
    minVelX = -30,
    maxVelX = 30,
    minVelY = 0,
    maxVelY = 0,
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 1.2,
    maxScaleBegin = 2,
    minScaleEnd = 1.8,
    maxScaleEnd = 1.8,
    lifeTime = 16,
    gravityX = 0,
    gravityY = 26
  },
  rosesFallMainMenu = {
    sprites = {
      "P_ROSE_PETAL_1",
      "P_ROSE_PETAL_2",
      "P_ROSE_PETAL_3",
      "P_ROSE_PETAL_4",
      "P_ROSE_PETAL_5",
      "P_ROSE_PETAL_6"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 20
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.1,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.4,
    maxScaleEnd = 0.4,
    lifeTime = 70,
    gravityX = 0,
    gravityY = 6
  },
  cloversFallMainMenu = {
    sprites = {
      "P_CLOVER_1",
      "P_CLOVER_2",
      "P_CLOVER_3",
      "P_COIN_1",
      "P_COIN_2",
      "P_COIN_3",
      "P_COIN_4",
      "P_COIN_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 20
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.9,
    minScaleEnd = 0.9,
    maxScaleEnd = 0.9,
    lifeTime = 30,
    gravityX = 0,
    gravityY = 6
  },
  cherryFlowerFall = {
    sprites = {
      "P_CHERRYFLOWER_4",
      "P_CHERRYFLOWER_2",
      "P_CHERRYFLOWER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 15
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.3,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 60,
    gravityX = 0,
    gravityY = 3
  },
  teapotSparkleFall = {
    sprites = {
      "P_TEAPOT_SPARKLE_3",
      "P_TEAPOT_SPARKLE_2",
      "P_TEAPOT_SPARKLE_1"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 15
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.3,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 60,
    gravityX = 0,
    gravityY = 3
  },
  leavesFallMainMenu = {
    sprites = {
      "P_LEAF_1",
      "P_LEAF_2",
      "P_LEAF_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 20
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.1,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.4,
    maxScaleEnd = 0.4,
    lifeTime = 60,
    gravityX = 0,
    gravityY = 6
  },
  leavesFallBigMainMenu = {
    sprites = {
      "P_LEAF_1",
      "P_LEAF_2",
      "P_LEAF_3"
    },
    sheet = "MENU_ELEMENTS_2",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 20
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.1,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.4,
    maxScaleEnd = 0.4,
    lifeTime = 60,
    gravityX = 0,
    gravityY = 6
  },
  roses = {
    sprites = {
      "P_HEART_PINK_1",
      "P_HEART_PINK_2",
      "P_HEART_PINK_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 25,
      maxVelX = 75,
      minVelY = -50,
      maxVelY = -100
    },
    minAngleVel = -0.5,
    maxAngleVel = 0.5,
    minScaleBegin = 0.2,
    maxScaleBegin = 0.8,
    minScaleEnd = 1,
    maxScaleEnd = 1.6,
    lifeTime = 25,
    gravityX = 0,
    gravityY = -4,
    angleMinEmitter = -20,
    angleMaxEmitter = 20
  },
  rosesGE = {
    sprites = {
      "P_HEART_PINK_1",
      "P_HEART_PINK_2",
      "P_HEART_PINK_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 25,
      maxVelX = 75,
      minVelY = -50,
      maxVelY = -100
    },
    minAngleVel = -0.5,
    maxAngleVel = 0.5,
    minScaleBegin = 0.2,
    maxScaleBegin = 0.8,
    minScaleEnd = 1,
    maxScaleEnd = 1.6,
    lifeTime = 25,
    gravityX = 0,
    gravityY = -4,
    angleMinEmitter = -20,
    angleMaxEmitter = 20
  },
  snowMainMenu = {
    sprites = {
      "FOREGROUND_10_SNOWFLAKE_1"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -30,
      maxVelX = 30,
      minVelY = 0,
      maxVelY = 50
    },
    minAngleVel = -2.5,
    maxAngleVel = 2.5,
    minScaleBegin = 0.3,
    maxScaleBegin = 0.5,
    minScaleEnd = 0.4,
    maxScaleEnd = 0.4,
    lifeTime = 30,
    gravityX = 0,
    gravityY = 10
  },
  smokeBuff = {
    sprites = {
      "SMOKE_CLOUD_1",
      "SMOKE_CLOUD_2",
      "SMOKE_CLOUD_3",
      "SMOKE_CLOUD_4",
      "SMOKE_CLOUD_5",
      "SMOKE_CLOUD_6"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 1.5,
    maxScaleBegin = 1.5,
    minScaleEnd = 1.5,
    maxScaleEnd = 1.5,
    lifeTime = 0.35,
    gravityX = 0,
    gravityY = 0
  },
  smokeBuff2 = {
    sprites = {
      "SMOKE_CLOUD_1",
      "SMOKE_CLOUD_2",
      "SMOKE_CLOUD_3",
      "SMOKE_CLOUD_4",
      "SMOKE_CLOUD_5",
      "SMOKE_CLOUD_6"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 1.2,
    maxScaleEnd = 1.2,
    lifeTime = 0.35,
    gravityX = 0,
    gravityY = 0
  },
  smokeBuff3 = {
    sprites = {
      "SMOKE_CLOUD_1",
      "SMOKE_CLOUD_2",
      "SMOKE_CLOUD_3",
      "SMOKE_CLOUD_4",
      "SMOKE_CLOUD_5",
      "SMOKE_CLOUD_6"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 0.25,
    maxScaleBegin = 0.25,
    minScaleEnd = 0.5,
    maxScaleEnd = 0.5,
    lifeTime = 0.35,
    gravityX = 0,
    gravityY = 0
  },
  bigSmokeBuff = {
    sprites = {
      "SMOKE_CLOUD_1",
      "SMOKE_CLOUD_2",
      "SMOKE_CLOUD_3",
      "SMOKE_CLOUD_4",
      "SMOKE_CLOUD_5",
      "SMOKE_CLOUD_6"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 6,
    maxScaleBegin = 6,
    minScaleEnd = 4.75,
    maxScaleEnd = 4.75,
    lifeTime = 0.35,
    gravityX = 0,
    gravityY = 0
  },
  bigBrotherBuff = {
    sprites = {
      "BIGBROTHER_FEATHER_1",
      "BIGBROTHER_FEATHER_2",
      "BIGBROTHER_FEATHER_3",
      "BIGBROTHER_FEATHER_1",
      "BIGBROTHER_FEATHER_2",
      "BIGBROTHER_FEATHER_3",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "INGAME_BIRDS_1",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  explosionBuff = {
    sprites = {
      "EXPLOSION_CLOUD_1",
      "EXPLOSION_CLOUD_2",
      "EXPLOSION_CLOUD_3",
      "EXPLOSION_CLOUD_4",
      "EXPLOSION_CLOUD_5",
      "EXPLOSION_CLOUD_6"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 2,
    maxScaleBegin = 2,
    minScaleEnd = 1.75,
    maxScaleEnd = 1.75,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  bigExplosionBuff = {
    sprites = {
      "EXPLOSION_CLOUD_1",
      "EXPLOSION_CLOUD_2",
      "EXPLOSION_CLOUD_3",
      "EXPLOSION_CLOUD_4",
      "EXPLOSION_CLOUD_5",
      "EXPLOSION_CLOUD_6"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 8,
    maxScaleBegin = 8,
    minScaleEnd = 6.75,
    maxScaleEnd = 6.75,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  blueStarBuff = {
    sprites = {
      "BLUESTAR_PARTICLE_1",
      "BLUESTAR_PARTICLE_2",
      "BLUESTAR_PARTICLE_3",
      "BLUESTAR_PARTICLE_4",
      "BLUESTAR_PARTICLE_5",
      "BLUESTAR_PARTICLE_6",
      "BLUESTAR_PARTICLE_7"
    },
    animation = "lifeTime",
    sheet = "EXPLOSION_1",
    emitter_box = {
      minVelX = -1200,
      maxVelX = 1200,
      minVelY = -1200,
      maxVelY = 1200
    },
    minAngleVel = -1,
    maxAngleVel = 2,
    minScaleBegin = 1.6,
    maxScaleBegin = 1.9,
    minScaleEnd = 2.2,
    maxScaleEnd = 2.2,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = 3200,
    amount = 40
  },
  redStarBuff = {
    sprites = {
      "REDSTAR_PARTICLE_1",
      "REDSTAR_PARTICLE_2",
      "REDSTAR_PARTICLE_3",
      "REDSTAR_PARTICLE_4",
      "REDSTAR_PARTICLE_5",
      "REDSTAR_PARTICLE_6",
      "REDSTAR_PARTICLE_7"
    },
    animation = "lifeTime",
    sheet = "EXPLOSION_1",
    emitter_box = {
      minVelX = -1000,
      maxVelX = 1000,
      minVelY = -1000,
      maxVelY = 1000
    },
    minAngleVel = -1,
    maxAngleVel = 2,
    minScaleBegin = 1.6,
    maxScaleBegin = 1.9,
    minScaleEnd = 2.2,
    maxScaleEnd = 2.2,
    lifeTime = 0.8,
    gravityX = 0,
    gravityY = 1200,
    amount = 20
  },
  greenStarBuff = {
    sprites = {
      "GREENSTAR_PARTICLE_1",
      "GREENSTAR_PARTICLE_2",
      "GREENSTAR_PARTICLE_3",
      "GREENSTAR_PARTICLE_4",
      "GREENSTAR_PARTICLE_5",
      "GREENSTAR_PARTICLE_6",
      "GREENSTAR_PARTICLE_7"
    },
    animation = "lifeTime",
    sheet = "EXPLOSION_1",
    emitter_box = {
      minVelX = -800,
      maxVelX = 800,
      minVelY = -800,
      maxVelY = 800
    },
    minAngleVel = -1,
    maxAngleVel = 2,
    minScaleBegin = 1.6,
    maxScaleBegin = 1.9,
    minScaleEnd = 2.2,
    maxScaleEnd = 2.2,
    lifeTime = 1,
    gravityX = 0,
    gravityY = 400,
    amount = 20
  },
  portalEffectBuff = {
    sprites = {
      "PORTALTELEPARTICLE_1",
      "PORTALTELEPARTICLE_2",
      "PORTALTELEPARTICLE_3",
      "PORTALTELEPARTICLE_4",
      "PORTALTELEPARTICLE_5",
      "PORTALTELEPARTICLE_6",
      "PORTALTELEPARTICLE_7"
    },
    animation = "lifeTime",
    sheet = "PORTAL_ASSETS",
    emitter_box = {
      minVelX = -700,
      maxVelX = 700,
      minVelY = -700,
      maxVelY = 700
    },
    minAngleVel = -1,
    maxAngleVel = 2,
    minScaleBegin = 0.8,
    maxScaleBegin = 1.1,
    minScaleEnd = 1.6,
    maxScaleEnd = 1.6,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 400,
    amount = 10
  },
  woodenBuff = {
    sprites = {
      "WOOD_PARTICLE_1",
      "WOOD_PARTICLE_1",
      "WOOD_PARTICLE_1"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.6,
    maxScaleBegin = 0.9,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 120
  },
  rockBuff = {
    sprites = {
      "ROCK_PARTICLE_1",
      "ROCK_PARTICLE_2",
      "ROCK_PARTICLE_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -120,
      maxVelX = 120,
      minVelY = -120,
      maxVelY = 120
    },
    minAngleVel = -7,
    maxAngleVel = 7,
    minScaleBegin = 1.7,
    maxScaleBegin = 2.2,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.4,
    lifeTime = 1.3,
    gravityX = 0,
    gravityY = 150
  },
  lightBuff = {
    sprites = {
      "LIGHT_PARTICLE_1",
      "LIGHT_PARTICLE_2",
      "LIGHT_PARTICLE_3",
      "LIGHT_PARTICLE_4",
      "LIGHT_PARTICLE_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -120,
      maxVelX = 120,
      minVelY = -120,
      maxVelY = 120
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.2,
    maxScaleBegin = 1.5,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.3,
    lifeTime = 1.4,
    gravityX = 0,
    gravityY = 200
  },
  blueBuff = {
    sprites = {
      "BLUE_FEATHER_1",
      "BLUE_FEATHER_2",
      "BLUE_FEATHER_3",
      "BLUE_FEATHER_1",
      "BLUE_FEATHER_2",
      "BLUE_FEATHER_3",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  redBuff = {
    sprites = {
      "RED_FEATHER_1",
      "RED_FEATHER_2",
      "RED_FEATHER_3",
      "RED_FEATHER_1",
      "RED_FEATHER_2",
      "RED_FEATHER_3",
      "SMOKE_BUFF_1"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  boomerangBuff = {
    sprites = {
      "GREEN_FEATHER_1",
      "GREEN_FEATHER_2",
      "GREEN_FEATHER_3",
      "GREEN_FEATHER_1",
      "GREEN_FEATHER_2",
      "GREEN_FEATHER_3",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  whiteBuff = {
    sprites = {
      "WHITE_FEATHER_1",
      "WHITE_FEATHER_2",
      "WHITE_FEATHER_3",
      "WHITE_FEATHER_1",
      "WHITE_FEATHER_2",
      "WHITE_FEATHER_3",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  blackBuff = {
    sprites = {
      "BLACK_FEATHER_1",
      "BLACK_FEATHER_2",
      "BLACK_FEATHER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  yellowBuff = {
    sprites = {
      "YELLOW_FEATHER_1",
      "YELLOW_FEATHER_2",
      "YELLOW_FEATHER_3",
      "YELLOW_FEATHER_1",
      "YELLOW_FEATHER_2",
      "YELLOW_FEATHER_3",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  orangeBuff = {
    sprites = {
      "YELLOW_FEATHER_1",
      "YELLOW_FEATHER_2",
      "YELLOW_FEATHER_1",
      "YELLOW_FEATHER_2",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  pinkBuff = {
    sprites = {
      "PINK_FEATHER_1",
      "PINK_FEATHER_2",
      "PINK_FEATHER_3",
      "PINK_FEATHER_1",
      "PINK_FEATHER_2",
      "PINK_FEATHER_3",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = featherSizeSmall,
    maxScaleEnd = featherSizeMedium,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  magicBoxExplosionBuff = {
    sprites = {
      "MAGICBOX_EXPLOSION_FRAME_1",
      "MAGICBOX_EXPLOSION_FRAME_2",
      "MAGICBOX_EXPLOSION_FRAME_3",
      "EXPLOSION_SEQUENCE2_4",
      "MAGICBOX_EXPLOSION_FRAME_5"
    },
    animation = "lifeTime",
    sheet = "SHEET_EXPLOSION_1",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 3.3,
    maxScaleBegin = 3.3,
    minScaleEnd = 3.3,
    maxScaleEnd = 3.3,
    lifeTime = 0.55,
    gravityX = 0,
    gravityY = 0,
    amount = 1
  },
  globeDeflate = {
    sprites = {
      "BIRD_PUFFER_2"
    },
    sheet = "INGAME_BIRDS_2",
    emitter_box = {
      minVelX = -250,
      maxVelX = 250,
      minVelY = -200,
      maxVelY = -50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 1,
    gravityX = 100,
    gravityY = -1000
  },
  eggShells = {
    sprites = {
      "EGG_SHELL_1",
      "EGG_SHELL_2",
      "EGG_SHELL_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -60,
      maxVelX = 60,
      minVelY = -60,
      maxVelY = 60
    },
    minAngleVel = -4,
    maxAngleVel = 4,
    minScaleBegin = 0.8,
    maxScaleBegin = 1.3,
    minScaleEnd = 0.5,
    maxScaleEnd = 0.8,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = -20
  },
  explosion = {
    sprites = {"EXPLOSION"},
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = 11,
    maxAngleVel = 11,
    minScaleBegin = 2.5,
    maxScaleBegin = 2.5,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 0.25,
    gravityX = 0,
    gravityY = 0
  },
  bombBirdTrail = {
    sprites = {
      "EXPLOSION_CLOUD_1"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 2,
    maxScaleBegin = 2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  bomberBirdTrail = {
    sprites = {
      "GREEN_FEATHER_1",
      "GREEN_FEATHER_2",
      "GREEN_FEATHER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  redBirdTrail = {
    sprites = {
      "RED_FEATHER_1",
      "RED_FEATHER_2",
      "RED_FEATHER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  blueBirdTrail = {
    sprites = {
      "BLUE_FEATHER_1",
      "BLUE_FEATHER_2",
      "BLUE_FEATHER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  yellowBirdTrail = {
    sprites = {
      "YELLOW_FEATHER_1",
      "YELLOW_FEATHER_2",
      "YELLOW_FEATHER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  mightyEagleParticles = {
    sprites = {
      "GREEN_FEATHER_1",
      "GREEN_FEATHER_2",
      "BLACK_FEATHER_1",
      "BLACK_FEATHER_2",
      "BLACK_FEATHER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium * 2,
    maxScaleBegin = featherSizeLarge * 2,
    minScaleEnd = featherSizeSmall * 2,
    maxScaleEnd = featherSizeMedium * 2,
    lifeTime = lifeTimeRandom * 3,
    gravityX = 20,
    gravityY = -10
  },
  mightyDragonParticles = {
    sprites = {
      "P_DRAGON_1",
      "P_DRAGON_2",
      "P_DRAGON_3",
      "P_DRAGON_4"
    },
    sheet = "INGAME_MIGHTY_DRAGON_1",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -3,
    maxAngleVel = 3,
    minScaleBegin = 1,
    maxScaleBegin = 3,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 3,
    gravityX = -20,
    gravityY = -40,
    amount = 3
  },
  pumpkinBuff = {
    sprites = {
      "PARTICLE_PUMPKIN_1",
      "PARTICLE_PUMPKIN_2",
      "PARTICLE_PUMPKIN_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -300,
      maxVelX = 300,
      minVelY = -300,
      maxVelY = 300
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.825,
    maxScaleBegin = 1.75,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 1,
    gravityX = 0,
    gravityY = 600
  },
  blackPumpkinBuff = {
    sprites = {
      "PARTICLE_BLACK_PUMPKIN_1",
      "PARTICLE_BLACK_PUMPKIN_2",
      "PARTICLE_BLACK_PUMPKIN_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -300,
      maxVelX = 300,
      minVelY = -300,
      maxVelY = 300
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.825,
    maxScaleBegin = 1.75,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.2,
    lifeTime = 1,
    gravityX = 0,
    gravityY = 600
  },
  batBuff = {
    sprites = {
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2",
      "BAT_FRAME_3",
      "BAT_FRAME_1",
      "BAT_FRAME_2"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -800,
      maxVelX = 800,
      minVelY = -800,
      maxVelY = 800
    },
    angleMinEmitter = -15,
    angleMaxEmitter = 15,
    minAngleVel = -2,
    maxAngleVel = 2,
    minScaleBegin = 0.85,
    maxScaleBegin = 2.25,
    minScaleEnd = 0.5,
    maxScaleEnd = 0.6,
    lifeTime = 1.05,
    gravityX = 0,
    gravityY = -600
  },
  flameBuff = {
    sprites = {
      "FLAME_PARTICLE_1",
      "FLAME_PARTICLE_2",
      "FLAME_PARTICLE_3",
      "FLAME_PARTICLE_4",
      "FLAME_PARTICLE_5",
      "FLAME_PARTICLE_6",
      "FLAME_PARTICLE_7",
      "FLAME_PARTICLE_8"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_2",
    randomizeBirthPosition = false,
    emitter_box = {
      minVelX = -10,
      maxVelX = 10,
      minVelY = -10,
      maxVelY = 10
    },
    angleMinEmitter = -3,
    angleMaxEmitter = 3,
    minAngleVel = -0.25,
    maxAngleVel = 0.25,
    minScaleBegin = 1.75,
    maxScaleBegin = 2.25,
    minScaleEnd = 0.25,
    maxScaleEnd = 0.25,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = -600
  },
  snowBuff = {
    sprites = {
      "PARTICLE_SNOW_1",
      "PARTICLE_SNOW_2",
      "PARTICLE_SNOW_3",
      "PARTICLE_SNOW_4",
      "PARTICLE_SNOW_5",
      "PARTICLE_SNOW_6",
      "PARTICLE_SNOW_7",
      "PARTICLE_SNOW_7",
      "PARTICLE_SNOW_8",
      "PARTICLE_SNOW_8"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.3,
    maxScaleBegin = 1.7,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 320
  },
  sandBuff = {
    sprites = {
      "P_SAND_1",
      "P_SAND_2",
      "P_SAND_3",
      "P_SAND_4"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.3,
    maxScaleBegin = 1.7,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 320
  },
  giftRedBuff = {
    sprites = {
      "P_GIFT_RED_1",
      "P_GIFT_RED_2",
      "P_GIFT_RED_3",
      "P_GIFT_RED_4",
      "P_GIFT_RED_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -1,
    maxAngleVel = 0,
    minScaleBegin = 0.3,
    maxScaleBegin = 1.8,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.8,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 50,
    angleMinEmitter = -360,
    angleMaxEmitter = 360
  },
  giftBlueBuff = {
    sprites = {
      "P_GIFT_BLUE_1",
      "P_GIFT_BLUE_2",
      "P_GIFT_BLUE_3",
      "P_GIFT_BLUE_4",
      "P_GIFT_BLUE_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -1,
    maxAngleVel = 0,
    minScaleBegin = 0.3,
    maxScaleBegin = 1.8,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.8,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 50,
    angleMinEmitter = -360,
    angleMaxEmitter = 360
  },
  giftWhiteBuff = {
    sprites = {
      "P_GIFT_WHITE_1",
      "P_GIFT_WHITE_2",
      "P_GIFT_WHITE_3",
      "P_GIFT_WHITE_4",
      "P_GIFT_WHITE_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -1,
    maxAngleVel = 0,
    minScaleBegin = 0.3,
    maxScaleBegin = 1.8,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.8,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 50,
    angleMinEmitter = -360,
    angleMaxEmitter = 360
  },
  heartBuff = {
    sprites = {
      "P_HEART_FADE_1",
      "P_HEART_FADE_1",
      "P_HEART_FADE_2",
      "P_HEART_FADE_3",
      "P_HEART_FADE_4",
      "P_HEART_FADE_5",
      "P_HEART_FADE_6"
    },
    sheet = "INGAME_BLOCKS_2",
    animation = "lifeTime",
    emitter_box = {
      minVelX = -170,
      maxVelX = 170,
      minVelY = -200,
      maxVelY = 150
    },
    minAngleVel = -1.5,
    maxAngleVel = 1.5,
    minScaleBegin = 0.5,
    maxScaleBegin = 1,
    minScaleEnd = 3,
    maxScaleEnd = 1.1,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = -150,
    angleMinEmitter = -10,
    angleMaxEmitter = 10
  },
  moneyBuff = {
    sprites = {
      "P_COIN_1",
      "P_COIN_2",
      "P_COIN_3",
      "P_COIN_4",
      "P_COIN_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.5,
    maxScaleBegin = 2.2,
    minScaleEnd = 1,
    maxScaleEnd = 3.2,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  goldPotBuff = {
    sprites = {
      "P_COIN_1",
      "P_COIN_2",
      "P_COIN_3",
      "P_COIN_4",
      "P_COIN_5",
      "P_POT_1",
      "P_POT_2",
      "P_POT_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.5,
    maxScaleBegin = 2.2,
    minScaleEnd = 1,
    maxScaleEnd = 3.2,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  cloverBuff = {
    sprites = {
      "P_CLOVER_1",
      "P_CLOVER_2",
      "P_CLOVER_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.7,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  luckyCloverBuff = {
    sprites = {
      "P_CLOVER_1",
      "P_CLOVERSTAR_1",
      "P_CLOVERSTAR_2",
      "P_CLOVERSTAR_1",
      "P_CLOVERSTAR_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -150,
      maxVelY = 0
    },
    minAngleVel = -18,
    maxAngleVel = 18,
    minScaleBegin = 2.9,
    maxScaleBegin = 3.2,
    minScaleEnd = 0,
    maxScaleEnd = 0.1,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 100
  },
  cloverWoodenBuff = {
    sprites = {
      "WOOD_PARTICLE_1",
      "WOOD_PARTICLE_1",
      "WOOD_PARTICLE_1",
      "WOOD_PARTICLE_1",
      "P_CLOVER_1",
      "P_CLOVERSTAR_1",
      "P_CLOVERSTAR_2"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.8,
    maxScaleBegin = 2.7,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 120
  },
  money = {
    sprites = {
      "P_COIN_1",
      "P_COIN_2",
      "P_COIN_3",
      "P_COIN_4",
      "P_COIN_5"
    },
    sheet = "INGAME_BLOCKS_2",
    maxVelX = 250,
    minVelY = 100,
    maxVelY = 250,
    emitter_box = {
      minVelX = 100,
      minAngleVel = 0,
      maxAngleVel = 2,
      minScaleBegin = 1
    },
    maxScaleBegin = 2.5,
    minScaleEnd = 1,
    maxScaleEnd = 2.5,
    lifeTime = 12,
    gravityX = 0,
    gravityY = 20,
    angleMinEmitter = -20,
    angleMaxEmitter = 20
  },
  easterGrass = {
    sprites = {
      "P_EASTER_GRASS_1",
      "P_EASTER_GRASS_2",
      "P_EASTER_GRASS_3",
      "P_EASTER_GRASS_4"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.7,
    maxScaleBegin = 1,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.5,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  easterEggPuff = {
    sprites = {
      "P_EASTEREGG_1",
      "P_EASTEREGG_2",
      "P_EASTEREGG_3",
      "P_EASTEREGG_4",
      "P_EASTEREGG_5",
      "P_EASTEREGG_6"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.7,
    maxScaleBegin = 1,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.5,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  samsungBuff = {
    sprites = {
      "P_SPARKLE_1",
      "P_SPARKLE_2",
      "P_SPARKLE_3",
      "P_SAMSUNG_STAR_1",
      "P_SAMSUNG_STAR_2",
      "P_SAMSUNG_STAR_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  windthingBuff = {
    sprites = {
      "P_WINDTHING_1",
      "P_WINDTHING_2",
      "P_WINDTHING_3",
      "P_WINDTHING_4"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  summerglassBuff = {
    sprites = {
      "P_GLASS_1",
      "P_GLASS_2",
      "P_GLASS_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  iceCreamBuff = {
    sprites = {
      "P_ICECREAM_1",
      "P_ICECREAM_2",
      "P_ICECREAM_3"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  iceCreamConeBuff = {
    sprites = {
      "P_ICECREAM_4",
      "P_ICECREAM_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  lemonBuff = {
    sprites = {
      "P_LEMON_1",
      "P_LEMON_2",
      "P_LEMON_3",
      "P_LEMON_4",
      "P_LEMON_5"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  flower1Buff = {
    sprites = {"P_FLOWER_1", "P_FLOWER_2"},
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  flower2Buff = {
    sprites = {"P_FLOWER_7", "P_FLOWER_8"},
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  flower3Buff = {
    sprites = {
      "P_FLOWER_13"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  flower4Buff = {
    sprites = {"P_FLOWER_3", "P_FLOWER_6"},
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  flower5Buff = {
    sprites = {"P_FLOWER_9"},
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  flower6Buff = {
    sprites = {
      "P_FLOWER_12"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  flower7Buff = {
    sprites = {
      "P_FLOWER_14"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.9,
    maxScaleBegin = 1.2,
    minScaleEnd = 1.3,
    maxScaleEnd = 1.8,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  varsiBuff = {
    sprites = {
      "P_FLOWER_4",
      "P_FLOWER_5",
      "P_FLOWER_10",
      "P_FLOWER_11"
    },
    sheet = "INGAME_BLOCKS_2",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  bunnyBuff = {
    sprites = {
      "P_BUNNY_SPARKLE_1",
      "P_BUNNY_SPARKLE_2",
      "P_BUNNY_SPARKLE_3",
      "P_BUNNY_SPARKLE_4",
      "P_SAMSUNG_STAR_1",
      "P_SAMSUNG_STAR_2",
      "P_SAMSUNG_STAR_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  bunnyBuff2 = {
    sprites = {
      "B_BUNNY_STATUE_1"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500,
    amount = 1
  },
  chineseLanternBuff1 = {
    sprites = {
      "P_CHINESE_LANTERN_1",
      "P_CHINESE_LANTERN_2",
      "P_CHINESE_LANTERN_4"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  chineseLanternBuff2 = {
    sprites = {
      "P_CHINESE_LANTERN_3",
      "P_CHINESE_LANTERN_2",
      "P_CHINESE_LANTERN_4"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  chineseGrass = {
    sprites = {
      "P_CHINESE_GRASS_1",
      "P_CHINESE_GRASS_2",
      "P_CHINESE_GRASS_3",
      "P_CHINESE_GRASS_4"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  teapotBuff = {
    sprites = {
      "P_TEAPOT_SPARKLE_1",
      "P_TEAPOT_SPARKLE_2",
      "P_TEAPOT_SPARKLE_3",
      "P_TEAPOT_SPARKLE_4"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  teapotBuff2 = {
    sprites = {
      "B_CHINESE_TEAPOT_1"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500,
    amount = 1
  },
  skeletonBuff = {
    sprites = {
      "P_SKELETON_1",
      "P_SKELETON_2",
      "P_SKELETON_3",
      "P_SKELETON_4"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500,
    amount = 3
  },
  halloweenGrassBuff = {
    sprites = {
      "P_HALLOWEEN_GRASS_1",
      "P_HALLOWEEN_GRASS_2",
      "P_HALLOWEEN_GRASS_3",
      "P_HALLOWEEN_GRASS_4"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  lightBlockSparkle = {
    sprites = {
      "P_ICE_SPARKLE_1",
      "P_ICE_SPARKLE_2",
      "P_ICE_SPARKLE_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.6,
    maxScaleBegin = 1.9,
    minScaleEnd = 0.7,
    maxScaleEnd = 0.6,
    lifeTime = 1.4,
    gravityX = 0,
    gravityY = 0
  },
  cookieBuff = {
    sprites = {
      "P_XMAS_COOKIE_1",
      "P_XMAS_COOKIE_2",
      "P_XMAS_COOKIE_3",
      "P_XMAS_COOKIE_4"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -150,
      maxVelX = 150,
      minVelY = -450,
      maxVelY = -150
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 0.8,
    minScaleEnd = 1.1,
    maxScaleEnd = 1.3,
    lifeTime = 3.5,
    gravityX = 0,
    gravityY = 500
  },
  redWoodenBuff = {
    sprites = {
      "P_REDWOOD_1",
      "P_REDWOOD_2"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.8,
    maxScaleBegin = 1.2,
    minScaleEnd = 0.5,
    maxScaleEnd = 0.7,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 120
  },
  goldBlockBuff = {
    sprites = {"P_GOLD_1", "P_GOLD_2"},
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 1.2,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 120
  },
  flowerPetalBuff = {
    sprites = {
      "B_SAKURAFLOWER_PETAL_1",
      "B_SAKURAFLOWER_PETAL_1"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 1.2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.5,
    lifeTime = 3,
    gravityX = 0,
    gravityY = 150
  },
  candyStickBuff = {
    sprites = {
      "P_CANDYSTICK_1",
      "P_CANDYSTICK_2",
      "P_CANDYSTICK_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 1.2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.5,
    lifeTime = 3,
    gravityX = 0,
    gravityY = 150
  },
  misoBuff = {
    sprites = {
      "P_MISO_1",
      "P_MISO_2",
      "P_MISO_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 1.2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.5,
    lifeTime = 3,
    gravityX = 0,
    gravityY = 150
  },
  riseSeaWeedBuff = {
    sprites = {
      "P_RICE_1",
      "P_RICE_2",
      "P_SEAWEED_1",
      "P_SEAWEED_2"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 1.2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.5,
    lifeTime = 3,
    gravityX = 0,
    gravityY = 150
  },
  waterSplash = {
    sprites = {
      "P_SPARKLE_1",
      "P_SPARKLE_2",
      "P_SPARKLE_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -75,
      maxVelX = 75,
      minVelY = -400,
      maxVelY = -200
    },
    minAngleVel = -4,
    maxAngleVel = 4,
    minScaleBegin = 4,
    maxScaleBegin = 7,
    minScaleEnd = 1,
    maxScaleEnd = 2,
    lifeTime = 0.9,
    gravityX = 0,
    gravityY = 400
  },
  waterSplashUp = {
    sprites = {
      "P_SPARKLE_1",
      "P_SPARKLE_2",
      "P_SPARKLE_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -200,
      maxVelY = -100
    },
    minAngleVel = -4,
    maxAngleVel = 4,
    minScaleBegin = 4,
    maxScaleBegin = 7,
    minScaleEnd = 1,
    maxScaleEnd = 2,
    lifeTime = 0.9,
    gravityX = 0,
    gravityY = 400
  },
  bubbles = {
    sprites = {
      "P_SPARKLE_1",
      "P_SPARKLE_2",
      "P_SPARKLE_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -5,
      maxVelX = 5,
      minVelY = -25,
      maxVelY = -10
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 1,
    maxScaleBegin = 2,
    minScaleEnd = 3,
    maxScaleEnd = 4,
    lifeTime = 2.5,
    gravityX = 0,
    gravityY = 0
  },
  explosionBubbles = {
    sprites = {
      "P_SPARKLE_1",
      "P_SPARKLE_2",
      "P_SPARKLE_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = -10,
      maxVelX = 10,
      minVelY = -45,
      maxVelY = -30
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 1,
    maxScaleBegin = 2,
    minScaleEnd = 2,
    maxScaleEnd = 3,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 5
  },
  treasureChest = {
    sprites = {
      "P_PLANK_1",
      "P_PLANK_2",
      "P_GEM_1",
      "P_GEM_2",
      "P_GEM_3",
      "P_PEARL_1"
    },
    sheet = "INGAME_BLOCKS_3",
    animation = "lifeTime",
    amount = 4,
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -250,
      maxVelY = -100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1,
    maxScaleBegin = 2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.1,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 500
  },
  ancientVase = {
    sprites = {"P_AMFORA_1"},
    sheet = "INGAME_BLOCKS_3",
    animation = "lifeTime",
    amount = 5,
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -250,
      maxVelY = -100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1,
    maxScaleBegin = 2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.1,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 500
  },
  coralPieces_1 = {
    sprites = {
      "P_CORAL_1",
      "P_CORAL_2",
      "P_CORAL_3"
    },
    sheet = "INGAME_BLOCKS_3",
    animation = "lifeTime",
    amount = 4,
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -250,
      maxVelY = -100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1,
    maxScaleBegin = 2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.1,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 500
  },
  coralPieces_2 = {
    sprites = {"P_CORAL_4", "P_CORAL_5"},
    sheet = "INGAME_BLOCKS_3",
    animation = "lifeTime",
    amount = 4,
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -250,
      maxVelY = -100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1,
    maxScaleBegin = 2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.1,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 500
  },
  piglantisWeed = {
    sprites = {
      "P_PIGLANTIS_WEED_1",
      "P_PIGLANTIS_WEED_2"
    },
    sheet = "INGAME_BLOCKS_3",
    animation = "lifeTime",
    amount = 6,
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -250,
      maxVelY = -100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1,
    maxScaleBegin = 2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.1,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 500
  },
  levelCompleteStars1 = {
    sprites = {
      "P_TEAPOT_SPARKLE_1",
      "P_TEAPOT_SPARKLE_2",
      "P_TEAPOT_SPARKLE_3",
      "P_TEAPOT_SPARKLE_4",
      "P_TEAPOT_SPARKLE_4",
      "SMOKE_BUFF_3"
    },
    sheet = "",
    emitter_circle = {
      amount = 40,
      minVel = 400,
      maxVel = 1600,
      minAngleEmitter = 160,
      maxAngleEmitter = 260
    },
    minAngleVel = 2,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 2,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.2,
    lifeTime = 5,
    gravityX = 0,
    gravityY = 300,
    minAngle = -180,
    maxAngle = 180
  },
  levelCompleteStars2 = {
    sprites = {
      "P_TEAPOT_SPARKLE_1",
      "P_TEAPOT_SPARKLE_2",
      "P_TEAPOT_SPARKLE_3",
      "P_TEAPOT_SPARKLE_4",
      "P_TEAPOT_SPARKLE_4",
      "SMOKE_BUFF_3"
    },
    sheet = "INGAME_PARTICLES_1",
    amount = 40,
    emitter_circle = {
      minVel = 300,
      maxVel = 1000,
      minAngleEmitter = -150,
      maxAngleEmitter = -30
    },
    minAngleVel = 2,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 2,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.2,
    lifeTime = 5,
    gravityX = 0,
    gravityY = 300,
    minAngle = -180,
    maxAngle = 180
  },
  levelCompleteStars3 = {
    sprites = {
      "P_TEAPOT_SPARKLE_1",
      "P_TEAPOT_SPARKLE_2",
      "P_TEAPOT_SPARKLE_3",
      "P_TEAPOT_SPARKLE_4",
      "P_TEAPOT_SPARKLE_4",
      "SMOKE_BUFF_3"
    },
    sheet = "INGAME_PARTICLES_1",
    amount = 40,
    emitter_circle = {
      minVel = 400,
      maxVel = 1600,
      minAngleEmitter = 20,
      maxAngleEmitter = -70
    },
    minAngleVel = 2,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 2,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.2,
    lifeTime = 5,
    gravityX = 0,
    gravityY = 300,
    minAngle = -180,
    maxAngle = 180
  },
  levelCompleteStars4 = {
    sprites = {
      "BIRD_BOOMERANG_SPECIAL"
    },
    sheet = "",
    amount = 40,
    emitter_circle = {
      minVel = 400,
      maxVel = 1600,
      minAngleEmitter = 20,
      maxAngleEmitter = -70
    },
    minAngleVel = 2,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 2,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.2,
    lifeTime = 5,
    gravityX = 0,
    gravityY = 300,
    minAngle = -180,
    maxAngle = 180
  },
  newHighScoreStars = {
    sprites = {
      "RED_FEATHER_1",
      "RED_FEATHER_2",
      "RED_FEATHER_3",
      "RED_FEATHER_1",
      "RED_FEATHER_2",
      "RED_FEATHER_3",
      "SMOKE_BUFF_1",
      "SMOKE_BUFF_2"
    },
    sheet = "",
    minVel = 200,
    maxVel = 300,
    emitter_circle = {
      minAngleVel = 1,
      maxAngleVel = 8,
      minAngleEmitter = -180,
      maxAngleEmitter = 180
    },
    minScaleBegin = 1,
    maxScaleBegin = 1.2,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.1,
    lifeTime = 0.4,
    gravityX = 0,
    gravityY = 0,
    minAngle = -180,
    maxAngle = 180
  },
  powerupBuff = {
    sprites = {
      "EXPLOSION_SEQUENCE2_1",
      "EXPLOSION_SEQUENCE2_2",
      "EXPLOSION_SEQUENCE2_3",
      "EXPLOSION_SEQUENCE2_4",
      "EXPLOSION_SEQUENCE2_5"
    },
    sheet = "",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 2.5,
    maxScaleBegin = 2.5,
    minScaleEnd = 2.5,
    maxScaleEnd = 2.5,
    lifeTime = 0.2,
    gravityX = 0,
    gravityY = -10,
    animation = "lifeTime"
  },
  powerupBurst = {
    sprites = {
      "EXPLOSION_PARTICLE1"
    },
    sheet = "INGAME_PARTICLES_1",
    amount = 40,
    emitter_circle = {
      minVel = 200,
      maxVel = 800,
      minAngleEmitter = -180,
      maxAngleEmitter = 180
    },
    minAngleVel = 2,
    maxAngleVel = 8,
    minScaleBegin = 0.5,
    maxScaleBegin = 2,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.2,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = 300,
    minAngle = -180,
    maxAngle = 180
  },
  powerupSmokeBuff = {
    sprites = {
      "EXPLOSION_CLOUD_1",
      "EXPLOSION_CLOUD_2"
    },
    sheet = "INGAME_BIRDS_1",
    emitter_box = {
      minVelX = -50,
      maxVelX = 50,
      minVelY = -50,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium,
    maxScaleBegin = featherSizeLarge,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = -10
  },
  superSlingTrail = {
    sprites = {
      "SUPERSEED_SEQUENCE_1"
    },
    sheet = "",
    emitter_box = {
      minVelX = 0,
      maxVelX = 50,
      minVelY = 0,
      maxVelY = 50
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium * 0.6,
    maxScaleBegin = featherSizeLarge * 0.6,
    minScaleEnd = featherSizeSmall * 0.6,
    maxScaleEnd = featherSizeMedium * 0.6,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = -10
  },
  superSlingActivation = {
    sprites = {
      "POWERUP_SEQUENCE_1",
      "POWERUP_SEQUENCE_2",
      "POWERUP_SEQUENCE_3",
      "POWERUP_SEQUENCE_4",
      "POWERUP_SEQUENCE_5",
      "POWERUP_SEQUENCE_6",
      "POWERUP_SEQUENCE_7",
      "POWERUP_SEQUENCE_8",
      "POWERUP_SEQUENCE_9"
    },
    sheet = "",
    emitter_circle = {
      minVel = 0,
      maxVel = 0,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 3,
    maxScaleBegin = 3,
    minScaleEnd = 3,
    maxScaleEnd = 3,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = 0,
    animation = "lifeTime"
  },
  superSlingBurst = {
    sprites = {
      "EXPLOSION_PARTICLE1"
    },
    sheet = "INGAME_PARTICLES_1",
    amount = 40,
    emitter_circle = {
      minVel = 400,
      maxVel = 1600,
      minAngleEmitter = -110,
      maxAngleEmitter = -70
    },
    minAngleVel = 2,
    maxAngleVel = 8,
    minScaleBegin = 1,
    maxScaleBegin = 4,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 0.8,
    gravityX = 0,
    gravityY = 800,
    minAngle = -180,
    maxAngle = 180
  },
  superSeedActivation = {
    sprites = {
      "SUPERSEED_SEQUENCE_1",
      "SUPERSEED_SEQUENCE_2",
      "SUPERSEED_SEQUENCE_3",
      "SUPERSEED_SEQUENCE_4",
      "SUPERSEED_SEQUENCE_5",
      "SUPERSEED_SEQUENCE_6",
      "SUPERSEED_SEQUENCE_7"
    },
    sheet = "",
    emitter_circle = {
      minVel = 0,
      maxVel = 0,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 2,
    maxScaleBegin = 2,
    minScaleEnd = 2,
    maxScaleEnd = 2,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = 0,
    animation = "lifeTime"
  },
  cheaterStamp = {
    sprites = {
      "SUPERSEED_SEQUENCE_1",
      "SUPERSEED_SEQUENCE_2",
      "SUPERSEED_SEQUENCE_3",
      "SUPERSEED_SEQUENCE_4",
      "SUPERSEED_SEQUENCE_5",
      "SUPERSEED_SEQUENCE_6",
      "SUPERSEED_SEQUENCE_7"
    },
    sheet = "",
    emitter_circle = {
      minVel = 0,
      maxVel = 0,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 1,
    maxScaleEnd = 1,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = 0,
    animation = "lifeTime"
  },
  superSeedActivationBurst = {
    sprites = {
      "SUPERSEED_SEQUENCE_1",
      "SUPERSEED_SEQUENCE_2",
      "SUPERSEED_SEQUENCE_3",
      "SUPERSEED_SEQUENCE_4",
      "SUPERSEED_SEQUENCE_5",
      "SUPERSEED_SEQUENCE_6",
      "SUPERSEED_SEQUENCE_7"
    },
    sheet = "",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium * 0.3,
    maxScaleBegin = featherSizeLarge * 0.3,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = 100,
    animation = "lifeTime"
  },
  quake = {
    sprites = {
      "ROCK_PARTICLE_1",
      "ROCK_PARTICLE_2",
      "ROCK_PARTICLE_3",
      "ROCK_PARTICLE_1",
      "ROCK_PARTICLE_2",
      "ROCK_PARTICLE_3",
      "STALAKTITE_PARTICLE_1",
      "STALAKTITE_PARTICLE_2",
      "STALAKTITE_PARTICLE_3",
      "STALAKTITE_PARTICLE_4"
    },
    sheet = "",
    emitter_box = {
      minVelX = -80,
      maxVelX = 80,
      minVelY = -80,
      maxVelY = 80
    },
    minAngleVel = -7,
    maxAngleVel = 7,
    minScaleBegin = 1.7,
    maxScaleBegin = 2.2,
    minScaleEnd = 0.2,
    maxScaleEnd = 0.4,
    lifeTime = 2.5,
    gravityX = 0,
    gravityY = 300
  },
  quake_smoke = {
    sprites = {
      "EARTHQUAKE_SMOKE"
    },
    sheet = "",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = featherSizeMedium * 0.6,
    maxScaleBegin = featherSizeLarge * 0.6,
    minScaleEnd = featherSizeSmall * 0.6,
    maxScaleEnd = featherSizeMedium * 0.6,
    lifeTime = lifeTimeRandom,
    gravityX = 0,
    gravityY = 30
  },
  star_bits = {
    sprites = {
      "AWARD_STARDEBRIS_PARTICLE1",
      "AWARD_STARDEBRIS_PARTICLE2",
      "AWARD_STARDEBRIS_PATRICLE3",
      "AWARD_STARDEBRIS_PARTICLE4"
    },
    sheet = "",
    emitter_circle = {
      minVel = 400,
      maxVel = 1600,
      minAngleEmitter = -150,
      maxAngleEmitter = 260
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 5,
    gravityX = 0,
    gravityY = 800,
    minAngle = -180,
    maxAngle = 180
  },
  diamond_shine = {
    sprites = {
      "AWARD_UI_STAREFFECT"
    },
    sheet = "",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -featherSpinSpeed,
    maxAngleVel = featherSpinSpeed,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 0.6,
    gravityX = 0,
    gravityY = 0,
    minAngle = -180,
    maxAngle = 180
  },
  dailyRewardCount = {
    sprites = {
      "SUPERSEED_SEQUENCE_1"
    },
    sheet = "",
    emitter_circle = {
      minVel = 100,
      maxVel = 100,
      minAngleEmitter = -180,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.7,
    maxScaleBegin = 0.7,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 0.6,
    gravityX = 0,
    gravityY = 0
  },
  dailyRewardWin = {
    sprites = {
      "SUPERSEED_SEQUENCE_1",
      "SUPERSEED_SEQUENCE_2",
      "SUPERSEED_SEQUENCE_3",
      "SUPERSEED_SEQUENCE_4",
      "SUPERSEED_SEQUENCE_5",
      "SUPERSEED_SEQUENCE_6",
      "SUPERSEED_SEQUENCE_7"
    },
    sheet = "",
    emitter_circle = {
      minVel = 30,
      maxVel = 100,
      minAngleEmitter = -180,
      maxAngleEmitter = 180
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.3,
    maxScaleBegin = 0.6,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 1,
    gravityX = 0,
    gravityY = 30
  },
  shopPowerupReceived = {
    sprites = {
      "SUPERSEED_SEQUENCE_1",
      "SUPERSEED_SEQUENCE_2",
      "SUPERSEED_SEQUENCE_3",
      "SUPERSEED_SEQUENCE_4",
      "SUPERSEED_SEQUENCE_5",
      "SUPERSEED_SEQUENCE_6",
      "SUPERSEED_SEQUENCE_7"
    },
    sheet = "",
    emitter_circle = {
      minVel = 40,
      maxVel = 150,
      minAngleEmitter = -180,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.3,
    maxScaleBegin = 0.6,
    minScaleEnd = 0,
    maxScaleEnd = 0,
    lifeTime = 1,
    gravityX = 0,
    gravityY = 30
  },
  sonicBoom = {
    sprites = {
      "P_BIRDBUBBLE_3"
    },
    sheet = "INGAME_BLOCKS_3",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 0.75,
    maxScaleBegin = 0.75,
    minScaleEnd = 3.75,
    maxScaleEnd = 3.75,
    lifeTime = 0.5,
    gravityX = 0,
    gravityY = 0
  },
  bubblePop = {
    sprites = {
      "P_BUBBLE_POP_1",
      "P_BUBBLE_POP_2",
      "P_BUBBLE_POP_3"
    },
    sheet = "INGAME_BLOCKS_3",
    animation = "lifeTime",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 1,
    maxScaleEnd = 1,
    lifeTime = 0.2,
    gravityX = 0,
    gravityY = 0
  },
  bubblePopBig = {
    sprites = {
      "P_BUBBLE_POP_1",
      "P_BUBBLE_POP_2",
      "P_BUBBLE_POP_3"
    },
    sheet = "INGAME_BLOCKS_3",
    animation = "lifeTime",
    emitter_box = {
      minVelX = 0,
      maxVelX = 0,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 3.75,
    maxScaleBegin = 3.75,
    minScaleEnd = 3.75,
    maxScaleEnd = 3.75,
    lifeTime = 0.05,
    gravityX = 0,
    gravityY = 0
  },
  ghostBlockBreaking = {
    sprites = {
      "PARTICLE_BLOCK_GHOST_1"
    },
    sheet = "INGAME_BLOCKS_4",
    animation = "lifeTime",
    emitter_box = {
      minVelX = -10,
      maxVelX = 10,
      minVelY = 0,
      maxVelY = 0
    },
    minAngleVel = -1,
    maxAngleVel = 1,
    minScaleBegin = 3,
    maxScaleBegin = 3,
    minScaleEnd = 0.1,
    maxScaleEnd = 0.1,
    lifeTime = 1.5,
    gravityX = 0,
    gravityY = -150
  },
  strawBurst = {
    sprites = {"P_STRAW_1", "P_STRAW_1"},
    sheet = "INGAME_BLOCKS_4",
    emitter_box = {
      minVelX = -100,
      maxVelX = 100,
      minVelY = -100,
      maxVelY = 100
    },
    minAngleVel = -8,
    maxAngleVel = 8,
    minScaleBegin = 1.8,
    maxScaleBegin = 2.7,
    minScaleEnd = 0.3,
    maxScaleEnd = 0.5,
    lifeTime = 1.7,
    gravityX = 0,
    gravityY = 120
  },
  portalTeleportation = {
    sprites = {
      "PORTAL_EFFECT_1",
      "PORTAL_EFFECT_2",
      "PORTAL_EFFECT_3",
      "PORTAL_EFFECT_4",
      "PORTAL_EFFECT_5"
    },
    animation = "lifeTime",
    sheet = "INGAME_BLOCKS_6",
    emitter_circle = {
      minVelX = 0,
      maxVelX = 0,
      minAngleEmitter = 90,
      maxAngleEmitter = 90
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 1,
    maxScaleEnd = 1,
    lifeTime = 0.3,
    gravityX = 0,
    gravityY = 0
  },
  gravityFieldDown = {
    sprites = {
		"ELEMENT_TRANSITION_16"
    },
    animation = "lifeTime",
    sheet = "INGAME_TRANSITION_SCREEN_1",
    emitter_box = {
      minVelY = 0,
      maxVelY = 0,
      minAngleEmitter = 0,
      maxAngleEmitter = 0
    },
    minAngleVel = 0,
    maxAngleVel = 0,
    minScaleBegin = 1,
    maxScaleBegin = 1,
    minScaleEnd = 0.8,
    maxScaleEnd = 0.8,
    lifeTime = 4,
    gravityX = 0,
    gravityY = -40
  }
}
