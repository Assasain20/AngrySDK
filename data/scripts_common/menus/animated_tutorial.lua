g_tutorial_animations = {
  TUTORIAL_1 = {
    duration = 5,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -192,
        y = -60,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_RED",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_BIG_01",
        x = 140,
        y = 60,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -192,
        y1 = -60,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -192,
        y1 = -60,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -278,
        y = -50,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -292,
        y = -40,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -306,
        y1 = -50,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -306,
        y1 = -50,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = 86,
        y2 = -6,
        x3 = 140,
        y3 = 90,
        duration = 1
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_RED_FLYING"
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2.4,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 2.4,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 90
      },
      {
        time = 2.5,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_RED_COLLISION"
      },
      {
        time = 2.5,
        action = "particles",
        effect = "redBuff",
        amount = 12,
        x = 140,
        y = 60
      }
    }
  },
  TUTORIAL_2 = {
    duration = 5.5,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -189,
        y = -63,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_BLUE",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_LIGHT_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_LIGHT_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_LIGHT_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -189,
        y1 = -63,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -189,
        y1 = -63,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = 86,
        y2 = -6,
        x3 = 140,
        y3 = 90,
        duration = 1
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_CLICK",
        x = 0,
        y = 100,
        z = 0.8
      },
      {
        time = 2,
        action = "pause_sprite_movement",
        name = "bird",
        duration = 0.5
      },
      {
        time = 2.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 2.5,
        action = "create_sprite",
        name = "bird2",
        sprite = "BIRD_BLUE",
        x = 0,
        y = 0,
        z = 0.4
      },
      {
        time = 2.5,
        action = "set_sprite_position",
        name = "bird2",
        target = "bird"
      },
      {
        time = 2.5,
        action = "set_sprite_movement",
        sprite = "bird2",
        target = "bird",
        type = "relative-linear",
        x0 = 0,
        y0 = 0,
        x = 48,
        y = 0,
        duration = 0.5
      },
      {
        time = 2.5,
        action = "copy_emitter",
        from = "bird",
        to = "bird2"
      },
      {
        time = 2.5,
        action = "create_sprite",
        name = "bird3",
        sprite = "BIRD_BLUE",
        x = -35,
        y = -34,
        z = 0.4
      },
      {
        time = 2.5,
        action = "set_sprite_position",
        name = "bird3",
        target = "bird"
      },
      {
        time = 2.5,
        action = "set_sprite_movement",
        sprite = "bird3",
        target = "bird",
        type = "relative-linear",
        x0 = 0,
        y0 = 0,
        x = -48,
        y = 0,
        duration = 0.5
      },
      {
        time = 2.5,
        action = "copy_emitter",
        from = "bird",
        to = "bird3"
      },
      {
        time = 2.7,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 2.7,
        action = "particles",
        effect = "lightBuff",
        amount = 8,
        x = 140,
        y = 10,
        w = 205,
        h = 20
      },
      {
        time = 2.8,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 2.8,
        action = "particles",
        effect = "lightBuff",
        amount = 8,
        x = 90,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 2.9,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 2.9,
        action = "particles",
        effect = "lightBuff",
        amount = 8,
        x = 190,
        y = 0,
        w = 41,
        h = 83
      },
      {
        time = 2.9,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 2.9,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 90
      },
      {
        time = 3,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_BLUE_COLLISION"
      },
      {
        time = 3,
        action = "set_sprite",
        name = "bird2",
        sprite = "BIRD_BLUE_COLLISION"
      },
      {
        time = 3,
        action = "set_sprite",
        name = "bird3",
        sprite = "BIRD_BLUE_COLLISION"
      },
      {
        time = 3,
        action = "particles",
        effect = "blueBuff",
        amount = 8,
        x = 140,
        y = 60
      },
      {
        time = 3,
        action = "particles",
        effect = "blueBuff",
        amount = 8,
        x = 92,
        y = 60
      },
      {
        time = 3,
        action = "particles",
        effect = "blueBuff",
        amount = 8,
        x = 188,
        y = 60
      }
    }
  },
  TUTORIAL_3 = {
    duration = 5.3,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -192,
        y = -60,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_YELLOW",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_WOOD_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_WOOD_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_WOOD_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -192,
        y1 = -60,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -192,
        y1 = -60,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = 86,
        y2 = -6,
        x3 = 140,
        y3 = 90,
        duration = 1.25
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_YELLOW_FLYING"
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_CLICK",
        x = 0,
        y = 100,
        z = 0.8
      },
      {
        time = 2,
        action = "pause_sprite_movement",
        name = "bird",
        duration = 0.5
      },
      {
        time = 2.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = 140,
        y = 90,
        duration = 0.25
      },
      {
        time = 2.5,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_YELLOW_SPECIAL"
      },
      {
        time = 2.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 2.65,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 2.65,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 140,
        y = 10,
        w = 205,
        h = 20
      },
      {
        time = 2.7,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 2.7,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 90,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 2.75,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 2.75,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 190,
        y = 0,
        w = 41,
        h = 83
      },
      {
        time = 2.75,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 2.75,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 90
      },
      {
        time = 2.8,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_YELLOW_COLLISION"
      },
      {
        time = 2.8,
        action = "particles",
        effect = "yellowBuff",
        amount = 12,
        x = 140,
        y = 60
      }
    }
  },
  TUTORIAL_4 = {
    duration = 10.8,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -189,
        y = -63,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_GREY",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_ROCK_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_ROCK_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_ROCK_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -189,
        y1 = -63,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -189,
        y1 = -63,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = 86,
        y2 = -6,
        x3 = 140,
        y3 = 71,
        duration = 1
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_GREY_FLYING"
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2.1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_CLICK",
        x = 0,
        y = 100,
        z = 0.8
      },
      {
        time = 2.1,
        action = "pause_sprite_movement",
        name = "bird",
        duration = 0.5
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 140,
        y = 10,
        w = 205,
        h = 20
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 90,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 190,
        y = 0,
        w = 41,
        h = 83
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 90
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "bird"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "explosionBuff",
        amount = 6,
        x = 11,
        y = -18
      },
      {
        time = 2.6,
        action = "particles",
        effect = "blackBuff",
        amount = 12,
        x = 11,
        y = -18
      },
      {time = 5.1, action = "clear_all"},
      {
        time = 5.1,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -189,
        y = -63,
        z = 0.5
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_GREY",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_ROCK_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_ROCK_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 5.1,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_ROCK_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 5.1,
        action = "create_line",
        name = "rubber_back",
        x1 = -189,
        y1 = -63,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 5.1,
        action = "create_line",
        name = "rubber_front",
        x1 = -189,
        y1 = -63,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 6.1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 6.1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 6.1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 6.1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 6.1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 6.1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 6.1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 6.1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 6.6,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 6.6,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = 86,
        y2 = -6,
        x3 = 140,
        y3 = 71,
        duration = 1
      },
      {
        time = 6.6,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 6.6,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_GREY_FLYING"
      },
      {
        time = 6.6,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 6.6,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 6.6,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 6.6,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 6.6,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 7.2,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 7.2,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 140,
        y = 10,
        w = 205,
        h = 20
      },
      {
        time = 7.5,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 7.5,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 90
      },
      {
        time = 7.6,
        action = "particles",
        effect = "blackBuff",
        amount = 12,
        x = 140,
        y = 90
      },
      {
        time = 7.6,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_GREY_1"
      },
      {
        time = 7.7,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_GREY_2"
      },
      {
        time = 7.8,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_GREY_3"
      },
      {
        time = 8.3,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 8.3,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 90,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 8.3,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 8.3,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 190,
        y = 0,
        w = 41,
        h = 83
      },
      {
        time = 8.3,
        action = "delete_sprite",
        name = "bird"
      },
      {
        time = 8.3,
        action = "particles",
        effect = "explosionBuff",
        amount = 6,
        x = 140,
        y = 90
      },
      {
        time = 8.3,
        action = "particles",
        effect = "blackBuff",
        amount = 12,
        x = 140,
        y = 90
      }
    }
  },
  TUTORIAL_5 = {
    duration = 5.4,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -199,
        y = -53,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_GREEN",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 50,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig2",
        sprite = "PIGLETTE_SMALL_01",
        x = 120,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -199,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -199,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -310,
        y = -46,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -310,
        y1 = -46,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -310,
        y1 = -46,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -109,
        x2 = 86,
        y2 = -51,
        x3 = 140,
        y3 = 30,
        duration = 0.9
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_GREEN_FLYING"
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2.2,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_CLICK",
        x = 0,
        y = 100,
        z = 0.8
      },
      {
        time = 2.2,
        action = "pause_sprite_movement",
        name = "bird",
        duration = 0.5
      },
      {
        time = 2.7,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 2.7,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_GREEN_SPECIAL"
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = 285,
        y = -200,
        duration = 0.4
      },
      {
        time = 2.7,
        action = "create_sprite",
        name = "egg",
        sprite = "DROPPABLE_EGG",
        x = 0,
        y = 0,
        z = 0.3,
        id = "ge1"
      },
      {
        time = 2.7,
        action = "set_sprite_position",
        name = "egg",
        target = "bird"
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "egg",
        type = "line-y",
        y = 85,
        duration = 0.2
      },
      {
        time = 2.9,
        action = "delete_sprite",
        name = "egg",
        id = "ge2"
      },
      {
        time = 2.9,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 2.9,
        action = "delete_sprite",
        name = "pig2"
      },
      {
        time = 2.9,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 50,
        y = 90
      },
      {
        time = 2.9,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 120,
        y = 90
      },
      {
        time = 2.9,
        action = "particles",
        effect = "explosionBuff",
        amount = 6,
        x = 85,
        y = 90
      },
      {
        time = 2.9,
        action = "particles",
        effect = "eggShells",
        amount = 5,
        x = 85,
        y = 90
      },
      {
        time = 2.9,
        action = "set_sprite_fade",
        sprite = "bird",
        alpha = 0,
        duration = 0.2
      }
    }
  },
  TUTORIAL_6 = {
    duration = 6.2,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -199,
        y = -53,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_BOOMERANG",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 100,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_ROCK_4X4_1",
        x = 0,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_ROCK_1_6",
        x = 0,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -199,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -199,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -310,
        y = -46,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -310,
        y1 = -46,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -310,
        y1 = -46,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -155,
        y1 = -100,
        x2 = 108,
        y2 = -78,
        x3 = 223,
        y3 = 23,
        duration = 1
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1.7
      },
      {
        time = 2.2,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_CLICK",
        x = 0,
        y = 100,
        z = 0.8
      },
      {
        time = 2.2,
        action = "pause_sprite_movement",
        name = "bird",
        duration = 0.5
      },
      {
        time = 2.7,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = 239,
        y1 = -22,
        x2 = 239,
        y2 = 57,
        x3 = 72,
        y3 = 92,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_BOOMERANG_SPECIAL"
      },
      {
        time = 2.7,
        action = "set_angular_velocity",
        sprite = "bird",
        angular_velocity = 8
      },
      {
        time = 3.6,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 3.6,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 100,
        y = 85
      },
      {
        time = 3.7,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_BOOMERANG_COLLISION"
      },
      {
        time = 3.7,
        action = "set_angular_velocity",
        sprite = "bird",
        angular_velocity = 0
      },
      {
        time = 3.7,
        action = "particles",
        effect = "boomerangBuff",
        amount = 12,
        x = 72,
        y = 90
      }
    }
  },
  TUTORIAL_7 = {
    duration = 5,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -206,
        y = -46,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_BIG_BROTHER",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 100,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_ROCK_1_5",
        x = 20,
        y = 80,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_WOOD_1_5",
        x = 180,
        y = 80,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_LIGHT_1_5",
        x = 30,
        y = 40,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block4",
        sprite = "BLOCK_ROCK_1_5",
        x = 170,
        y = 40,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block5",
        sprite = "BLOCK_WOOD_1_5",
        x = 58,
        y = 0,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block6",
        sprite = "BLOCK_LIGHT_1_5",
        x = 141,
        y = 0,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -206,
        y1 = -46,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -206,
        y1 = -46,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -320,
        y = -36,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -320,
        y1 = -36,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -320,
        y1 = -36,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = 86,
        y2 = -6,
        x3 = 140,
        y3 = 61,
        duration = 1
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2.05,
        action = "delete_sprite",
        name = "block5"
      },
      {
        time = 2.05,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 58,
        y = 0,
        w = 205,
        h = 20
      },
      {
        time = 2.1,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 2.1,
        action = "particles",
        effect = "lightBuff",
        amount = 8,
        x = 30,
        y = 40,
        w = 205,
        h = 20
      },
      {
        time = 2.2,
        action = "delete_sprite",
        name = "block6"
      },
      {
        time = 2.2,
        action = "particles",
        effect = "lightBuff",
        amount = 8,
        x = 141,
        y = 0,
        w = 41,
        h = 83
      },
      {
        time = 2.3,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 2.3,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 20,
        y = 80,
        w = 41,
        h = 83
      },
      {
        time = 2.3,
        action = "delete_sprite",
        name = "block4"
      },
      {
        time = 2.3,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 170,
        y = 40,
        w = 205,
        h = 20
      },
      {
        time = 2.3,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 2.3,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 180,
        y = 80,
        w = 41,
        h = 83
      },
      {
        time = 2.3,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 2.3,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 99,
        y = 90
      },
      {
        time = 2.5,
        action = "particles",
        effect = "bigBrotherBuff",
        amount = 12,
        x = 140,
        y = 60
      }
    }
  },
  TUTORIAL_8 = {
    duration = 6.4,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -189,
        y = -63,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BAIT_SARDINE",
        x = -178,
        y = -70,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_ROCK_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_ROCK_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_ROCK_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -189,
        y1 = -63,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -189,
        y1 = -63,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = 86,
        y2 = -6,
        x3 = 140,
        y3 = 71,
        duration = 1
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2.1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = 54,
        y1 = -30,
        x2 = 97,
        y2 = -30,
        x3 = 140,
        y3 = -10,
        duration = 0.4
      },
      {
        time = 3,
        action = "create_sprite",
        name = "eagle",
        sprite = "BIRD_MIGHTY_EAGLE_MOTION",
        x = -256,
        y = -128,
        z = 0.55,
        angle = 0.4
      },
      {
        time = 3,
        action = "set_sprite_alpha",
        sprite = "eagle",
        alpha = 0
      },
      {
        time = 3,
        action = "set_sprite_fade",
        sprite = "eagle",
        duration = 0.1,
        alpha = 1
      },
      {
        time = 3,
        action = "set_sprite_movement",
        sprite = "eagle",
        type = "line",
        x = 140,
        y = 85,
        duration = 0.45
      },
      {
        time = 3.3,
        action = "delete_sprite",
        name = "bird"
      },
      {
        time = 3.3,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 3.3,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 90,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 3.3,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 3.3,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 190,
        y = 0,
        w = 41,
        h = 83
      },
      {
        time = 3.3,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 3.3,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 140,
        y = 10,
        w = 205,
        h = 20
      },
      {
        time = 3.3,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 3.3,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 90
      },
      {
        time = 3.45,
        action = "set_sprite",
        name = "eagle",
        sprite = "BIRD_MIGHTY_EAGLE_RADIAL"
      },
      {
        time = 3.45,
        action = "set_angular_velocity",
        sprite = "eagle",
        angular_velocity = 16
      },
      {
        time = 3.45,
        action = "set_sprite_movement",
        sprite = "eagle",
        type = "line",
        x = 256,
        y = 20,
        duration = 0.2
      },
      {
        time = 3.75,
        action = "set_sprite_fade",
        sprite = "eagle",
        duration = 0.1,
        alpha = 0
      },
      {
        time = 3.85,
        action = "delete_sprite",
        name = "eagle"
      }
    }
  },
  TUTORIAL_9 = {
    duration = 5.1,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -189,
        y = -63,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_PUFFER_1",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_WOOD_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_WOOD_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_WOOD_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -189,
        y1 = -63,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -189,
        y1 = -63,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -109,
        x2 = 86,
        y2 = -51,
        x3 = 140,
        y3 = 30,
        duration = 0.9
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2.1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_CLICK",
        x = 0,
        y = 100,
        z = 0.8
      },
      {
        time = 2.1,
        action = "pause_sprite_movement",
        name = "bird",
        duration = 0.5
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 140,
        y = 10,
        w = 205,
        h = 20
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 90,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 190,
        y = 0,
        w = 41,
        h = 83
      },
      {
        time = 2.6,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 90
      },
      {
        time = 2.6,
        action = "set_sprite",
        name = "bird",
        sprite = "BIRD_PUFFER_2"
      },
      {
        time = 2.6,
        action = "stop_movement",
        sprite = "bird"
      },
      {
        time = 2.6,
        action = "particles",
        effect = "explosionBuff",
        amount = 6,
        x = 11,
        y = -18
      }
    }
  },
  TUTORIAL_10 = {
    duration = 6,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -189,
        y = -63,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "BIRD_PINK",
        x = -178,
        y = -70,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_WOOD_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_LIGHT_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_ROCK_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -189,
        y1 = -63,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -189,
        y1 = -63,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -109,
        x2 = 131,
        y2 = -51,
        x3 = 230,
        y3 = 30,
        duration = 0.9
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 0.5
      },
      {
        time = 2.2,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_CLICK",
        x = 0,
        y = 100,
        z = 0.8
      },
      {
        time = 2.2,
        action = "stop_movement",
        sprite = "bird"
      },
      {
        time = 2.7,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 2.7,
        action = "create_sprite",
        name = "birdbubble",
        sprite = "P_BIRDBUBBLE_3",
        x = 145,
        y = -15,
        z = 0.7
      },
      {
        time = 2.7,
        action = "create_sprite",
        name = "pigbubble",
        sprite = "P_BIRDBUBBLE_3",
        x = 140,
        y = 85,
        z = 0.7
      },
      {
        time = 2.7,
        action = "create_sprite",
        name = "bubble1",
        sprite = "P_BIRDBUBBLE_3",
        x = 90,
        y = 60,
        z = 0.7
      },
      {
        time = 2.7,
        action = "create_sprite",
        name = "bubble2",
        sprite = "P_BIRDBUBBLE_3",
        x = 190,
        y = 60,
        z = 0.7
      },
      {
        time = 2.7,
        action = "create_sprite",
        name = "bubble3",
        sprite = "P_BIRDBUBBLE_3",
        x = 140,
        y = 10,
        z = 0.7
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = 100,
        y = -165,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "birdbubble",
        type = "line",
        x = 100,
        y = -165,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "pig",
        type = "line",
        x = 135,
        y = -55,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "pigbubble",
        type = "line",
        x = 135,
        y = -55,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "block1",
        type = "line",
        x = 80,
        y = -80,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "bubble1",
        type = "line",
        x = 80,
        y = -80,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "block2",
        type = "line",
        x = 195,
        y = -80,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "bubble2",
        type = "line",
        x = 195,
        y = -80,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "block3",
        type = "line",
        x = 145,
        y = -135,
        duration = 1
      },
      {
        time = 2.7,
        action = "set_sprite_movement",
        sprite = "bubble3",
        type = "line",
        x = 145,
        y = -135,
        duration = 1
      },
      {
        time = 3.7,
        action = "delete_sprite",
        name = "birdbubble"
      },
      {
        time = 3.7,
        action = "delete_sprite",
        name = "pigbubble"
      },
      {
        time = 3.7,
        action = "delete_sprite",
        name = "bubble1"
      },
      {
        time = 3.7,
        action = "delete_sprite",
        name = "bubble2"
      },
      {
        time = 3.7,
        action = "delete_sprite",
        name = "bubble3"
      },
      {
        time = 3.7,
        action = "particles",
        effect = "bubblePop",
        amount = 1,
        x = 100,
        y = -165
      },
      {
        time = 3.7,
        action = "particles",
        effect = "bubblePop",
        amount = 1,
        x = 135,
        y = -55
      },
      {
        time = 3.7,
        action = "particles",
        effect = "bubblePop",
        amount = 1,
        x = 80,
        y = -80
      },
      {
        time = 3.7,
        action = "particles",
        effect = "bubblePop",
        amount = 1,
        x = 195,
        y = -80
      },
      {
        time = 3.7,
        action = "particles",
        effect = "bubblePop",
        amount = 1,
        x = 145,
        y = -135
      },
      {
        time = 3.7,
        action = "delete_sprite",
        name = "bird"
      },
      {
        time = 3.7,
        action = "particles",
        effect = "pinkBuff",
        amount = 5,
        x = 100,
        y = -165
      },
      {
        time = 3.7,
        action = "set_sprite_movement",
        sprite = "pig",
        type = "line",
        x = 135,
        y = 85,
        duration = 0.3
      },
      {
        time = 3.7,
        action = "set_sprite_movement",
        sprite = "block1",
        type = "line",
        x = 80,
        y = 60,
        duration = 0.3
      },
      {
        time = 3.7,
        action = "set_sprite_movement",
        sprite = "block2",
        type = "line",
        x = 195,
        y = 60,
        duration = 0.3
      },
      {
        time = 3.7,
        action = "set_sprite_movement",
        sprite = "block3",
        type = "line",
        x = 145,
        y = 90,
        duration = 0.5
      },
      {
        time = 4,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 4,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 4,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 4,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 135,
        y = 85
      },
      {
        time = 4,
        action = "particles",
        effect = "woodenBuff",
        amount = 8,
        x = 80,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 4,
        action = "particles",
        effect = "lightBuff",
        amount = 8,
        x = 195,
        y = 60,
        w = 41,
        h = 83
      },
      {
        time = 4.2,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 4,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 145,
        y = 90,
        w = 205,
        h = 20
      }
    }
  },
  TUTORIAL_11 = {
    duration = 10,
    events = {
      {
        time = 0,
        action = "create_sprite",
        name = "bg",
        sprite = "TUTORIAL_BACKGROUND",
        x = 70,
        y = 30,
        z = 0
      },
      {
        time = 0,
        action = "create_sprite",
        name = "ground",
        sprite = "TUTORIAL_GROUND",
        x = 0,
        y = 100,
        z = 0.2
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_back",
        sprite = "SLING_SHOT_01_BACK",
        x = -178,
        y = -70,
        z = 0.1
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_front",
        sprite = "SLING_SHOT_01_FRONT",
        x = -178,
        y = -70,
        z = 0.7
      },
      {
        time = 0,
        action = "create_sprite",
        name = "sling_holder",
        sprite = "SLING_HOLDER",
        x = -189,
        y = -63,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "bird",
        sprite = "DRAGON_FISH",
        x = -178,
        y = -70,
        z = 0.5
      },
      {
        time = 0,
        action = "create_sprite",
        name = "pig",
        sprite = "PIGLETTE_SMALL_01",
        x = 140,
        y = 85,
        z = 0.4
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block1",
        sprite = "BLOCK_ROCK_1_5",
        x = 90,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block2",
        sprite = "BLOCK_ROCK_1_5",
        x = 190,
        y = 60,
        z = 0.4,
        angle = 1.57
      },
      {
        time = 0,
        action = "create_sprite",
        name = "block3",
        sprite = "BLOCK_ROCK_10X1_1",
        x = 140,
        y = 10,
        z = 0.4
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_back",
        x1 = -189,
        y1 = -63,
        x2 = -158,
        y2 = -70,
        z = 0.2,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 0,
        action = "create_line",
        name = "rubber_front",
        x1 = -189,
        y1 = -63,
        x2 = -199,
        y2 = -73,
        z = 0.6,
        width = 25,
        r = 48,
        g = 23,
        b = 8
      },
      {
        time = 1,
        action = "create_sprite",
        name = "finger",
        sprite = "TUTORIAL_FINGER_SLIDE",
        x = -138,
        y = -30,
        z = 0.8
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "finger",
        type = "line",
        x = -238,
        y = -10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "line",
        x = -292,
        y = -60,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -303,
        y = -53,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -303,
        y1 = -53,
        x2 = -158,
        y2 = -70,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -303,
        y1 = -53,
        x2 = -199,
        y2 = -73,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 10,
        duration = 0.5
      },
      {
        time = 1,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 10,
        duration = 0.5
      },
      {
        time = 1.5,
        action = "delete_sprite",
        name = "finger"
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "bird",
        type = "bezier-cubic",
        x1 = -130,
        y1 = -94,
        x2 = -46,
        y2 = -51,
        x3 = 40,
        y3 = 60,
        duration = 1
      },
      {
        time = 1.5,
        action = "set_angular_velocity",
        sprite = "bird",
        angular_velocity = 2
      },
      {
        time = 1.5,
        action = "set_sprite_movement",
        sprite = "sling_holder",
        type = "line",
        x = -178,
        y = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_back",
        x1 = -178,
        y1 = -70,
        x2 = -158,
        y2 = -70,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_movement",
        line = "rubber_front",
        x1 = -178,
        y1 = -70,
        x2 = -199,
        y2 = -73,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_back",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_line_width_change",
        line = "rubber_front",
        width = 25,
        duration = 0.25
      },
      {
        time = 1.5,
        action = "set_sprite_emitting",
        name = "bird",
        sprite = {
          "TRAIL_WHITE_1",
          "TRAIL_WHITE_2",
          "TRAIL_WHITE_3"
        },
        interval = 0.08,
        z = 0.3,
        duration = 1
      },
      {
        time = 2.5,
        action = "set_angular_velocity",
        sprite = "bird",
        angular_velocity = 0
      },
      {
        time = 3,
        action = "create_sprite",
        name = "dragon1",
        sprite = "MDRAGON_1",
        x = -256,
        y = -128,
        z = 0.55,
        angle = 0.8
      },
      {
        time = 3,
        action = "set_sprite_movement",
        sprite = "dragon1",
        type = "line",
        x = 10,
        y = 20,
        duration = 1
      },
      {
        time = 3.1,
        action = "create_sprite",
        name = "dragon2",
        sprite = "MDRAGON_2",
        x = -256,
        y = -128,
        z = 0.54,
        angle = 0.65
      },
      {
        time = 3.15,
        action = "set_sprite_movement",
        sprite = "dragon2",
        type = "line",
        x = 8,
        y = 18,
        duration = 1
      },
      {
        time = 3.25,
        action = "create_sprite",
        name = "dragon3",
        sprite = "MDRAGON_3",
        x = -256,
        y = -128,
        z = 0.53,
        angle = 0.63
      },
      {
        time = 3.3,
        action = "set_sprite_movement",
        sprite = "dragon3",
        type = "line",
        x = 6,
        y = 16,
        duration = 1
      },
      {
        time = 3.4,
        action = "create_sprite",
        name = "dragon4",
        sprite = "MDRAGON_4",
        x = -256,
        y = -128,
        z = 0.52,
        angle = 0.61
      },
      {
        time = 3.45,
        action = "set_sprite_movement",
        sprite = "dragon4",
        type = "line",
        x = 4,
        y = 14,
        duration = 1
      },
      {
        time = 3.55,
        action = "create_sprite",
        name = "dragon5",
        sprite = "MDRAGON_5",
        x = -256,
        y = -128,
        z = 0.51,
        angle = 0.59
      },
      {
        time = 3.6,
        action = "set_sprite_movement",
        sprite = "dragon5",
        type = "line",
        x = 2,
        y = 12,
        duration = 1
      },
      {
        time = 3.63,
        action = "create_sprite",
        name = "dragon6",
        sprite = "MDRAGON_6",
        x = -256,
        y = -128,
        z = 0.5,
        angle = 0.57
      },
      {
        time = 3.68,
        action = "set_sprite_movement",
        sprite = "dragon6",
        type = "line",
        x = 0,
        y = 10,
        duration = 1
      },
      {
        time = 3.6,
        action = "delete_sprite",
        name = "block1"
      },
      {
        time = 3.6,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 90,
        y = 60,
        w = 205,
        h = 20
      },
      {
        time = 3.7,
        action = "delete_sprite",
        name = "block3"
      },
      {
        time = 3.7,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 140,
        y = 10,
        w = 205,
        h = 20
      },
      {
        time = 4,
        action = "delete_sprite",
        name = "bird"
      },
      {
        time = 4,
        action = "set_sprite_movement",
        sprite = "dragon1",
        type = "bezier-cubic",
        x1 = 60,
        y1 = -30,
        x2 = 60,
        y2 = -80,
        x3 = 10,
        y3 = -110,
        duration = 1
      },
      {
        time = 4,
        action = "set_angular_velocity",
        sprite = "dragon1",
        angular_velocity = -3
      },
      {
        time = 4.15,
        action = "set_sprite_movement",
        sprite = "dragon2",
        type = "bezier-cubic",
        x1 = 60,
        y1 = -30,
        x2 = 60,
        y2 = -80,
        x3 = 10,
        y3 = -110,
        duration = 1.1
      },
      {
        time = 4.15,
        action = "set_angular_velocity",
        sprite = "dragon2",
        angular_velocity = -3.5
      },
      {
        time = 4.3,
        action = "set_sprite_movement",
        sprite = "dragon3",
        type = "bezier-cubic",
        x1 = 60,
        y1 = -30,
        x2 = 60,
        y2 = -80,
        x3 = 10,
        y3 = -110,
        duration = 1.2
      },
      {
        time = 4.3,
        action = "set_angular_velocity",
        sprite = "dragon3",
        angular_velocity = -3.5
      },
      {
        time = 4.45,
        action = "set_sprite_movement",
        sprite = "dragon4",
        type = "bezier-cubic",
        x1 = 60,
        y1 = -30,
        x2 = 60,
        y2 = -80,
        x3 = 10,
        y3 = -110,
        duration = 1.3
      },
      {
        time = 4.45,
        action = "set_angular_velocity",
        sprite = "dragon4",
        angular_velocity = -3.5
      },
      {
        time = 4.6,
        action = "set_sprite_movement",
        sprite = "dragon5",
        type = "bezier-cubic",
        x1 = 60,
        y1 = -30,
        x2 = 60,
        y2 = -80,
        x3 = 10,
        y3 = -110,
        duration = 1.4
      },
      {
        time = 4.6,
        action = "set_angular_velocity",
        sprite = "dragon5",
        angular_velocity = -3.5
      },
      {
        time = 4.68,
        action = "set_sprite_movement",
        sprite = "dragon6",
        type = "bezier-cubic",
        x1 = 60,
        y1 = -30,
        x2 = 60,
        y2 = -80,
        x3 = 10,
        y3 = -110,
        duration = 1.5
      },
      {
        time = 4.68,
        action = "set_angular_velocity",
        sprite = "dragon6",
        angular_velocity = -3.5
      },
      {
        time = 5,
        action = "set_sprite_movement",
        sprite = "dragon1",
        type = "bezier-cubic",
        x1 = -60,
        y1 = -80,
        x2 = -60,
        y2 = -30,
        x3 = 10,
        y3 = 20,
        duration = 1
      },
      {
        time = 5.15,
        action = "set_sprite_movement",
        sprite = "dragon2",
        type = "bezier-cubic",
        x1 = -60,
        y1 = -80,
        x2 = -60,
        y2 = -30,
        x3 = 10,
        y3 = 20,
        duration = 1
      },
      {
        time = 5.3,
        action = "set_sprite_movement",
        sprite = "dragon3",
        type = "bezier-cubic",
        x1 = -60,
        y1 = -80,
        x2 = -60,
        y2 = -30,
        x3 = 10,
        y3 = 20,
        duration = 1
      },
      {
        time = 5.45,
        action = "set_sprite_movement",
        sprite = "dragon4",
        type = "bezier-cubic",
        x1 = -60,
        y1 = -80,
        x2 = -60,
        y2 = -30,
        x3 = 10,
        y3 = 20,
        duration = 1
      },
      {
        time = 5.6,
        action = "set_sprite_movement",
        sprite = "dragon5",
        type = "bezier-cubic",
        x1 = -60,
        y1 = -80,
        x2 = -60,
        y2 = -30,
        x3 = 10,
        y3 = 20,
        duration = 1
      },
      {
        time = 5.68,
        action = "set_sprite_movement",
        sprite = "dragon6",
        type = "bezier-cubic",
        x1 = -60,
        y1 = -80,
        x2 = -60,
        y2 = -30,
        x3 = 10,
        y3 = 20,
        duration = 1
      },
      {
        time = 6,
        action = "delete_sprite",
        name = "pig"
      },
      {
        time = 6,
        action = "particles",
        effect = "smokeBuff",
        amount = 1,
        x = 140,
        y = 85
      },
      {
        time = 6,
        action = "delete_sprite",
        name = "block2"
      },
      {
        time = 6,
        action = "particles",
        effect = "rockBuff",
        amount = 8,
        x = 190,
        y = 60,
        w = 205,
        h = 20
      },
      {
        time = 6,
        action = "set_sprite_movement",
        sprite = "dragon1",
        type = "line",
        x = 256,
        y = -128,
        duration = 1
      },
      {
        time = 6.15,
        action = "set_sprite_movement",
        sprite = "dragon2",
        type = "line",
        x = 256,
        y = -128,
        duration = 1
      },
      {
        time = 6.3,
        action = "set_sprite_movement",
        sprite = "dragon3",
        type = "line",
        x = 256,
        y = -128,
        duration = 1
      },
      {
        time = 6.3,
        action = "set_angular_velocity",
        sprite = "dragon2",
        angular_velocity = 0
      },
      {
        time = 6.45,
        action = "set_sprite_movement",
        sprite = "dragon4",
        type = "line",
        x = 256,
        y = -128,
        duration = 1
      },
      {
        time = 6.45,
        action = "set_angular_velocity",
        sprite = "dragon3",
        angular_velocity = 0
      },
      {
        time = 6.6,
        action = "set_sprite_movement",
        sprite = "dragon5",
        type = "line",
        x = 256,
        y = -128,
        duration = 1
      },
      {
        time = 6.6,
        action = "set_angular_velocity",
        sprite = "dragon4",
        angular_velocity = 0
      },
      {
        time = 6.68,
        action = "set_sprite_movement",
        sprite = "dragon6",
        type = "line",
        x = 256,
        y = -128,
        duration = 1
      },
      {
        time = 6.75,
        action = "set_angular_velocity",
        sprite = "dragon5",
        angular_velocity = 0
      },
      {
        time = 6.7,
        action = "set_angular_velocity",
        sprite = "dragon1",
        angular_velocity = 0
      },
      {
        time = 6.83,
        action = "set_angular_velocity",
        sprite = "dragon6",
        angular_velocity = 0
      },
      {
        time = 7,
        action = "delete_sprite",
        name = "dragon1"
      },
      {
        time = 7.15,
        action = "delete_sprite",
        name = "dragon2"
      },
      {
        time = 7.3,
        action = "delete_sprite",
        name = "dragon3"
      },
      {
        time = 7.45,
        action = "delete_sprite",
        name = "dragon4"
      },
      {
        time = 7.6,
        action = "delete_sprite",
        name = "dragon5"
      },
      {
        time = 7.68,
        action = "delete_sprite",
        name = "dragon6"
      }
    }
  }
}
function getTutorialScale()
  if deviceModel == "ipad" and screenWidth == 2048 then
    return 2
  elseif deviceModel == "iphone" and screenWidth >= 960 then
    return 1
  else
    if screenHeight < 320 then
      return screenHeight / 320 * 0.5
    elseif screenHeight < 768 then
      return (screenHeight - 320) / 448 * 0.5 + 0.5
    end
    return 1
  end
end
AnimatedTutorial = ui.BackgroundBox:inherit()
function AnimatedTutorial:new(tutorial, o)
  local o = o or {}
  o.tutorial = g_tutorial_animations[tutorial]
  o.tutorial_id = tutorial
  return ui.BackgroundBox.new(self, o)
end
function AnimatedTutorial:init()
  ui.BackgroundBox.init(self)
  self.hanchor = "HCENTER"
  self.vanchor = "VCENTER"
  self.components = {
    left = "TUTORIAL_LEFT",
    bottomLeft = "TUTORIAL_BOTTOM_LEFT",
    bottomMiddle = "TUTORIAL_BOTTOM_MIDDLE",
    bottomRight = "TUTORIAL_BOTTOM_RIGHT",
    right = "TUTORIAL_RIGHT",
    topRight = "TUTORIAL_TOP_RIGHT",
    topMiddle = "TUTORIAL_TOP_MIDDLE",
    topLeft = "TUTORIAL_TOP_LEFT",
    center = "TUTORIAL_CENTER"
  }
  local close = ui.ImageButton:new()
  close.name = "close"
  close:setImage("TUTORIAL_OK")
  close.returnValue = "CLOSE_TUTORIAL"
  self:addChild(close)
end
function AnimatedTutorial:onEntry()
  self.time = 0
  self.cursor = 1
  self.sprites = {}
  self.lines = {}
  self.draw_list = {}
  if g_isAccelerometerControl then
    g_rokuCursorVisible = false
  end
end
function AnimatedTutorial:onExit()
  _G.particles.clear("menu")
  if g_isAccelerometerControl then
    g_rokuCursorVisible = true
  end
end
function AnimatedTutorial:layout()
  ui.BackgroundBox.layout(self)
  local sx = 1
  local sy = 1
  self.x = screenWidth * 0.5
  self.y = screenHeight * 0.5
  local retina_multiplier = 1
  if deviceModel == "iphone" and screenWidth >= 960 or deviceModel == "ipad" and screenWidth == 2048 then
    retina_multiplier = 2
  end
  local max_w = 552 * getTutorialScale()
  local max_h = 360 * getTutorialScale()
  self.width = _G.math.ceil(max_w)
  self.height = _G.math.ceil(max_h)
  local close = self:getChild("close")
  close.x = max_w * 0.35
  close.y = max_h * 0.6
  for _, v in _G.ipairs(self.children) do
    v.scaleX = sx
    v.scaleY = sy
  end
end
if not g_isAccelerometerControl then
  function AnimatedTutorial:onPointerEvent(eventType, x, y)
    local result, meta, item = ui.BackgroundBox.onPointerEvent(self, eventType, x, y)
    if result == "CLOSE_TUTORIAL" then
      eventManager:notify({
        id = events.EID_CLOSE_TUTORIAL
      })
      skipInput = true
    end
    if eventType == "LRELEASE" and self.tutorial_id == "TUTORIAL_5" and not g_white_bird_tutorial_ge_disabled and self.time >= 2.7 and not settingsWrapper:isGoldenEggUnlocked("LevelGE_4") and g_tutorialActive and g_tutorialActive.from == "PAUSE_PAGE" and x >= self.x + self.width * -0.5 and x <= self.x + self.width * 0.5 and y >= self.y + self.height * -0.5 and y <= self.y + self.height * 0.5 then
      eventManager:notify({
        id = events.EID_GOLDEN_EGG_FROM_MENU,
        levelName = "LevelGE_4"
      })
    end
    return result, meta, item
  end
else
  function AnimatedTutorial:onPointerEvent(eventType, x, y)
    if eventType == "LRELEASE" then
      eventManager:notify({
        id = events.EID_CLOSE_TUTORIAL
      })
      skipInput = true
    end
  end
end
function AnimatedTutorial:draw(x, y)
  drawRect(0, 0, 0, 0.65, 0, 0, screenWidth, screenHeight, false)
  ui.BackgroundBox.draw(self, x, y)
  local scale = getTutorialScale()
  for _, v in _G.ipairs(self.draw_list) do
    if v.type == "sprite" then
      local flip_x = v.flip_x and -1 or 1
      local flip_y = v.flip_y and -1 or 1
      local px, py = _G.res.getSpritePivot(v.sprite)
      local xs = scale * flip_x * v.scale_x
      local ys = scale * flip_y * v.scale_y
      local alpha = v.alpha
      if alpha then
        setAlpha(alpha)
      end
      setRenderState((self.x + v.x * scale) / xs, (self.y + v.y * scale) / ys, xs, ys, v.angle or 0, px, py)
      _G.res.drawSprite(v.sprite, 0, 0)
      if alpha then
        setAlpha(1)
      end
    elseif v.type == "line" then
      setRenderState(self.x / scale, self.y / scale, scale, scale, 0, 0, 0)
      drawLine2D(v.x1, v.y1, v.x2, v.y2, v.width, v.r, v.g, v.b, v.a or 255)
    end
  end
  g_menu_particle_scale = scale
  drawMenuParticlesInAdvance()
end
function AnimatedTutorial:getTutorialSpriteScale(sprite)
  local retina = false
  if deviceModel == "ipad" and screenWidth == 2048 then
    retina = true
  end
  if contains({
    "TUTORIAL_GROUND",
    "TUTORIAL_BACKGROUND",
    "TUTORIAL_FINGER_BIG",
    "TUTORIAL_FINGER_CLICK",
    "TUTORIAL_FINGER_SLIDE"
  }, sprite) and retina then
    return 0.5
  end
  return 1
end
function AnimatedTutorial:update(dt, time)
  ui.BackgroundBox.update(self, dt, time)
  self.time = self.time + dt
  if self.time >= self.tutorial.duration then
    self.sprites = {}
    self.lines = {}
    self.time = 0
    self.cursor = 1
    clearParticles()
  end
  for _, v in _G.pairs(self.sprites) do
    if v.movement_pause and self.time >= v.movement_pause then
      v.movement_pause = nil
    end
    if not v.movement_pause and v.movement and self.time < v.movement.begin + v.movement.duration then
      if v.movement.type == "line" then
        v.x = tweenLinear(self.time - v.movement.begin, v.movement.x0, v.movement.x1 - v.movement.x0, v.movement.duration)
        v.y = tweenLinear(self.time - v.movement.begin, v.movement.y0, v.movement.y1 - v.movement.y0, v.movement.duration)
      elseif v.movement.type == "bezier-cubic" then
        local bezier_cubic = function(t, p0, p1, p2, p3)
          local u = 1 - t
          return u * u * u * p0 + 3 * u * u * t * p1 + 3 * u * t * t * p2 + t * t * t * p3
        end
        local m = v.movement
        v.x = bezier_cubic((self.time - m.begin) / m.duration, m.x0, m.x1, m.x2, m.x3)
        v.y = bezier_cubic((self.time - m.begin) / m.duration, m.y0, m.y1, m.y2, m.y3)
      elseif v.movement.type == "relative-linear" then
        local t = self.sprites[v.movement.target]
        v.x = t.x + tweenLinear(self.time - v.movement.begin, v.movement.x0, v.movement.x - v.movement.x0, v.movement.duration)
        v.y = t.y + tweenLinear(self.time - v.movement.begin, v.movement.y0, v.movement.y - v.movement.y0, v.movement.duration)
      end
    elseif v.movement and self.time >= v.movement.begin + v.movement.duration then
      if v.movement.type == "line" then
        v.x = v.movement.x1
        v.y = v.movement.y1
      elseif v.movement.type == "bezier-cubic" then
        v.x = v.movement.x3
        v.y = v.movement.y3
      elseif v.movement.type == "relative-linear" then
        local t = self.sprites[v.movement.target]
        v.x = t.x + v.movement.x
        v.y = t.y + v.movement.y
      end
      v.movement = nil
    end
    if not v.movement_pause and v.emitter and self.time < v.emitter.begin + v.emitter.duration then
      if self.time >= v.emitter.pos then
        local sprite = v.emitter.sprite[_G.math.random(1, #v.emitter.sprite)]
        local s = self:getTutorialSpriteScale(sprite)
        v.emitter.pos = v.emitter.pos + v.emitter.interval
        self.sprites["emitted-" .. self.time .. "-" .. _G.tostring(v)] = {
          name = "emitted-" .. self.time .. "-" .. _G.tostring(v),
          type = "sprite",
          sprite = sprite,
          x = v.x,
          y = v.y,
          z = v.emitter.z,
          scale_x = s,
          scale_y = s
        }
        self:refreshDrawList()
      end
    elseif not v.movement_pause and v.emitter and self.time >= v.emitter.begin + v.emitter.duration then
      v.emitter = nil
    end
    if not v.movement_pause and v.alpha_fade and self.time < v.alpha_fade.begin + v.alpha_fade.duration then
      v.alpha = tweenLinear(self.time - v.alpha_fade.begin, v.alpha_fade.a0, v.alpha_fade.a1 - v.alpha_fade.a0, v.alpha_fade.duration)
    elseif not v.movement_pause and v.alpha_fade and self.time >= v.alpha_fade.begin + v.alpha_fade.duration then
      v.alpha = v.alpha_fade.a1
      v.alpha_fade = nil
    end
    if not v.movement_pause and v.angular_velocity then
      v.angle = v.angle + v.angular_velocity * dt
    end
  end
  for _, v in _G.pairs(self.lines) do
    if v.movement and self.time < v.movement.begin + v.movement.duration then
      v.x1 = tweenLinear(self.time - v.movement.begin, v.movement.x10, v.movement.x1 - v.movement.x10, v.movement.duration)
      v.y1 = tweenLinear(self.time - v.movement.begin, v.movement.y10, v.movement.y1 - v.movement.y10, v.movement.duration)
      v.x2 = tweenLinear(self.time - v.movement.begin, v.movement.x20, v.movement.x2 - v.movement.x20, v.movement.duration)
      v.y2 = tweenLinear(self.time - v.movement.begin, v.movement.y20, v.movement.y2 - v.movement.y20, v.movement.duration)
    elseif v.movement and self.time >= v.movement.begin + v.movement.duration then
      v.x1 = v.movement.x1
      v.y1 = v.movement.y1
      v.x2 = v.movement.x2
      v.y2 = v.movement.y2
      v.movement = nil
    end
    if v.width_change and self.time < v.width_change.begin + v.width_change.duration then
      v.width = tweenLinear(self.time - v.width_change.begin, v.width_change.w0, v.width_change.w1 - v.width_change.w0, v.width_change.duration)
    elseif v.width_change and self.time >= v.width_change.begin + v.width_change.duration then
      v.width = v.width_change.w1
      v.width_change = nil
    end
  end
  while self.tutorial.events[self.cursor] and self.time >= self.tutorial.events[self.cursor].time do
    local event = self.tutorial.events[self.cursor]
    if event.id then
      if event.id == "ge1" then
        if not settingsWrapper:isGoldenEggUnlocked("LevelGE_4") and g_tutorialActive and g_tutorialActive.from == "PAUSE_PAGE" and not g_white_bird_tutorial_ge_disabled then
          event.sprite = "BLOCK_GOLDEN_EGG"
        else
          event.sprite = "DROPPABLE_EGG"
        end
      elseif event.id == "ge2" then
        if not settingsWrapper:isGoldenEggUnlocked("LevelGE_4") and g_tutorialActive and g_tutorialActive.from == "PAUSE_PAGE" and not g_white_bird_tutorial_ge_disabled then
          event.action = "disabled"
        else
          event.action = "delete_sprite"
        end
      end
    end
    if event.action == "create_sprite" then
      local s = self:getTutorialSpriteScale(event.sprite)
      self.sprites[event.name] = {
        name = event.name,
        type = "sprite",
        sprite = event.sprite,
        x = event.x,
        y = event.y,
        z = event.z,
        angle = event.angle or 0,
        scale_x = s,
        scale_y = s
      }
      self:refreshDrawList()
    elseif event.action == "delete_sprite" then
      self.sprites[event.name] = nil
      self:refreshDrawList()
    elseif event.action == "set_sprite" then
      self.sprites[event.name].sprite = event.sprite
    elseif event.action == "set_sprite_movement" then
      local s = self.sprites[event.sprite]
      if event.type == "line" then
        s.movement = {
          begin = event.time,
          duration = event.duration,
          type = event.type,
          x0 = s.x,
          y0 = s.y,
          x1 = event.x,
          y1 = event.y
        }
      elseif event.type == "line-y" then
        s.movement = {
          begin = event.time,
          duration = event.duration,
          type = "line",
          x0 = s.x,
          y0 = s.y,
          x1 = s.x,
          y1 = event.y
        }
      elseif event.type == "bezier-cubic" then
        s.movement = {
          begin = event.time,
          duration = event.duration,
          type = event.type,
          x0 = s.x,
          y0 = s.y,
          x1 = event.x1,
          y1 = event.y1,
          x2 = event.x2,
          y2 = event.y2,
          x3 = event.x3,
          y3 = event.y3
        }
      elseif event.type == "relative-linear" then
        s.movement = {
          begin = event.time,
          duration = event.duration,
          type = event.type,
          target = event.target,
          x0 = event.x0,
          y0 = event.y0,
          x = event.x,
          y = event.y
        }
      end
    elseif event.action == "particles" then
      local scale = getTutorialScale()
      _G.particles.addParticles(event.effect, event.amount, self.x + scale * event.x, self.y + scale * event.y, (event.w or 0) * scale, (event.h or 0) * scale, 0, true, true)
    elseif event.action == "create_line" then
      self.lines[event.name] = {
        name = event.name,
        type = "line",
        x1 = event.x1,
        y1 = event.y1,
        x2 = event.x2,
        y2 = event.y2,
        z = event.z,
        r = event.r,
        g = event.g,
        b = event.b,
        a = event.a,
        width = event.width
      }
      self:refreshDrawList()
    elseif event.action == "set_line_movement" then
      local l = self.lines[event.line]
      l.movement = {
        begin = event.time,
        duration = event.duration,
        x10 = l.x1,
        y10 = l.y1,
        x20 = l.x2,
        y20 = l.y2,
        x1 = event.x1,
        y1 = event.y1,
        x2 = event.x2,
        y2 = event.y2
      }
    elseif event.action == "set_line_width_change" then
      local l = self.lines[event.line]
      l.width_change = {
        begin = event.time,
        duration = event.duration,
        w0 = l.width,
        w1 = event.width
      }
    elseif event.action == "set_sprite_emitting" then
      local s = self.sprites[event.name]
      s.emitter = {
        begin = event.time,
        duration = event.duration,
        sprite = event.sprite,
        interval = event.interval,
        z = event.z,
        pos = event.time
      }
    elseif event.action == "set_sprite_position" then
      self.sprites[event.name].x = self.sprites[event.target].x
      self.sprites[event.name].y = self.sprites[event.target].y
    elseif event.action == "copy_emitter" then
      local f = self.sprites[event.from]
      local t = self.sprites[event.to]
      t.emitter = {}
      for k, v in _G.pairs(f.emitter) do
        t.emitter[k] = v
      end
    elseif event.action == "pause_sprite_movement" then
      local s = self.sprites[event.name]
      s.movement_pause = event.time + event.duration
      s.movement.begin = s.movement.begin + event.duration
      if s.emitter then
        s.emitter.begin = s.emitter.begin + event.duration
        s.emitter.pos = s.emitter.pos + event.duration
      end
    elseif event.action == "set_sprite_alpha" then
      self.sprites[event.sprite].alpha = event.alpha
    elseif event.action == "set_sprite_fade" then
      local s = self.sprites[event.sprite]
      s.alpha_fade = {
        begin = event.time,
        duration = event.duration,
        a0 = s.alpha or 1,
        a1 = event.alpha
      }
    elseif event.action == "clear_all" then
      self.sprites = {}
      self.lines = {}
      self:refreshDrawList()
    elseif event.action == "set_angular_velocity" then
      self.sprites[event.sprite].angular_velocity = event.angular_velocity
    elseif event.action == "stop_movement" then
      self.sprites[event.sprite].movement = nil
    end
    self.cursor = self.cursor + 1
  end
end
function AnimatedTutorial:refreshDrawList()
  local draw_list = {}
  for _, v in _G.pairs(self.sprites) do
    _G.table.insert(draw_list, v)
  end
  for _, v in _G.pairs(self.lines) do
    _G.table.insert(draw_list, v)
  end
  _G.table.sort(draw_list, function(a, b)
    return a.z < b.z
  end)
  self.draw_list = draw_list
end
filename = "animated_tutorial.lua"
