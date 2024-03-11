gamelua.g_episodes = {
  [15] = {
    season = 2013,
    icon = "ABOUT_BIRDS_1",
    name = "Winter Wonderham",
    decor_left = "LS_THEME_X3_LEFT",
    decor_right = "LS_THEME_X3_RIGHT",
    score_achievement_limit = 9999999,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_X3",
    background_image = "LS_XMAS_2013_BACKGROUND",
    dynamic_load_group = "levelSelectionXmas3",
    featherBoxIdentifier = "X3",
    reward_completion = {sprite = "REWARD_X3", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_X3_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelX3_3star",
      sprite = "REWARD_X3_STAR"
    },
    manual_level_progression = true,
    mightyPower = {
      levelSelectionSilhouette = "LS_XMAS_EAGLE",
      levelEndSpriteOn = "RESULT_ME_FEATHER_ON",
      levelEndSpriteOff = "RESULT_ME_FEATHER_OFF"
    },
    pages = {
      {
        folder_name = "/levels/Xmas3",
        display_number = "1",
        world_number = 13,
        colour = {
          r = 200,
          g = 200,
          b = 200
        },
        level_button = "LEVEL_BOX_XMAS_CLOSED",
        layout = "xmas",
        layout_params = {rows = 5, cols = 5},
        animated_button_override = "LEVEL_BOX_XMAS2_OPEN",
        calendar = {year = 2012, month = 12},
        levels = {
          {
            name = "LevelX3_1",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX3_2",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX3_3",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX3_9",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion",
            extra_sprite = "HARBIN_SIGN"
          },
          {
            name = "LevelX3_5",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_6",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_7",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_8",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_4",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_10",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_18",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_12",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_13",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_14",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_15",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_16",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_17",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_11",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_19",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_20",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_21",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_22",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_23",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_24",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX3_25",
            disabled_button_override = "LEVEL_BOX_XMAS_CLOSED",
            animation_particles = {
              "starExplosion",
              {
                "giftExplosion",
                amount = 1
              }
            },
            clear_cutscene = "xmas2012_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggswithvideo",
        layout_params = {
          rows = 1,
          cols = 3,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "xmas3GE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelX3_3star",
            disabled_button_override = "MENU_STAR_X3_SILHOUETTE",
            level_button_override = "MENU_STAR_X3_EMPTY",
            completed_sprite_override = "MENU_STAR_X3",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\181"
          },
          {
            name = "LevelX3_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.25,
            y = 0.2
          },
          {
            name = "LevelX3_NewYear",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.7,
            y = 0.15
          }
        }
      }
    }
  },
  [14] = {
    season = 2013,
    icon = "ABOUT_BIRDS_1",
    name = "Haunted Hogs",
    decor_left = "LS_THEME_H3_LEFT",
    decor_right = "LS_THEME_H3_RIGHT",
    score_achievement_limit = 9999999,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_H3",
    background_image = "H3_SKY",
    dynamic_load_group = "levelSelectionHalloween3",
    featherBoxIdentifier = "H3",
    reward_completion = {sprite = "REWARD_H3", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_H3_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelHH_3star",
      sprite = "REWARD_H3_STAR"
    },
    pages = {
      {
        folder_name = "/levels/HauntedHogs",
        display_number = "1",
        world_number = 19,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {
            name = "LevelHH_1009",
            free_to_play = true
          },
          {
            name = "LevelHH_1024",
            free_to_play = true
          },
          {
            name = "LevelHH_967",
            free_to_play = true
          },
          {
            name = "LevelHH_972"
          },
          {
            name = "LevelHH_989"
          },
          {
            name = "LevelHH_973"
          },
          {
            name = "LevelHH_1010"
          },
          {
            name = "LevelHH_968"
          },
          {
            name = "LevelHH_1013"
          },
          {
            name = "LevelHH_988"
          },
          {
            name = "LevelHH_990"
          },
          {
            name = "LevelHH_970"
          },
          {
            name = "LevelHH_1021"
          },
          {
            name = "LevelHH_1012"
          },
          {
            name = "LevelHH_1015"
          }
        }
      },
      {
        folder_name = "/levels/HauntedHogs",
        display_number = "2",
        world_number = 20,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {
            name = "LevelHH_971"
          },
          {
            name = "LevelHH_969"
          },
          {
            name = "LevelHH_993"
          },
          {
            name = "LevelHH_974"
          },
          {
            name = "LevelHH_1020"
          },
          {
            name = "LevelHH_1018"
          },
          {
            name = "LevelHH_1011"
          },
          {
            name = "LevelHH_1014"
          },
          {
            name = "LevelHH_1016"
          },
          {
            name = "LevelHH_992"
          },
          {
            name = "LevelHH_1023"
          },
          {
            name = "LevelHH_1019"
          },
          {
            name = "LevelHH_1017"
          },
          {
            name = "LevelHH_1022"
          },
          {
            name = "LevelHH_975",
            clear_cutscene = "halloween2012_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/HauntedHogsGE",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "halloween2012GE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelHH_3star",
            disabled_button_override = "MENU_STAR_BAT_SILHOUETTE",
            level_button_override = "MENU_STAR_BAT_EMPTY",
            completed_sprite_override = "MENU_STAR_BAT",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\172"
          },
          {
            name = "LevelHH_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.8,
            y = 0.65
          }
        }
      }
    }
  },
  [13] = {
    season = 2012,
    icon = "ABOUT_BIRDS_1",
    name = "Back to School",
    decor_left = "LS_THEME_SCH_LEFT",
    decor_right = "LS_THEME_SCH_RIGHT",
    score_achievement_limit = 9999999,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_SCHOOL",
    background_image = "SCHOOL_SKY",
    dynamic_load_group = "levelSelectionSchool",
    featherBoxIdentifier = "SCH",
    reward_completion = {sprite = "REWARD_SCH", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_SCH_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelBtS_GE1",
      sprite = "REWARD_SCH_STAR"
    },
    mightyPower = {
      levelSelectionSilhouette = "LS_EAGLE_BUTTON_SMALLER",
      levelEndSpriteOn = "RESULT_ME_FEATHER_ON",
      levelEndSpriteOff = "RESULT_ME_FEATHER_OFF"
    },
    pages = {
      {
        folder_name = "/levels/BackToSchool",
        display_number = "1",
        world_number = 18,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_SMALLER",
        layout = "grid",
        layout_params = {rows = 4, cols = 5},
        levels = {
          {
            name = "LevelBtS_1",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER",
            free_to_play = true
          },
          {
            name = "LevelBtS_3",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER",
            free_to_play = true
          },
          {
            name = "LevelBtS_4",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER",
            free_to_play = true
          },
          {
            name = "LevelBtS_6",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_19",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_15",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_2",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_10",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_8",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_12",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_14",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_9",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_13",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_5",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_7",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_11",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_20",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_18",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_17",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER"
          },
          {
            name = "LevelBtS_16",
            disabled_button_override = "LS_LEVEL_BG_NORMAL_CLOSED_SMALLER",
            clear_cutscene = "school_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/BackToSchoolGE",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "schoolGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        level_number_format = "%world%",
        mighty_eagle_disabled = true,
        levels = {
          {
            name = "LevelBtS_GE1",
            disabled_button_override = "MENU_STAR_SCH_NOTE_SILHOUETTE",
            level_button_override = "MENU_STAR_SCH_NOTE_EMPTY",
            completed_sprite_override = "MENU_STAR_SCH_NOTE",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\171"
          },
          {
            name = "LevelBtS_GE2",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.8,
            y = 0.7
          }
        }
      }
    }
  },
  [12] = {
    season = 2012,
    icon = "ABOUT_BIRDS_1",
    name = "Piglantis",
    decor_left = "LS_THEME_MOV_LEFT",
    decor_right = "LS_THEME_MOV_RIGHT",
    score_achievement_limit = 9999999,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_PIGLANTIS",
    background_image = "PIGLANTIS_SKY",
    dynamic_load_group = "levelSelectionPiglantis",
    featherBoxIdentifier = "MOV",
    reward_completion = {sprite = "REWARD_MOV", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_MOV_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelPL_3star",
      sprite = "REWARD_MOV_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack16",
        display_number = "1",
        world_number = 16,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_1",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {name = "LevelPL_27", free_to_play = true},
          {name = "LevelPL_21", free_to_play = true},
          {name = "LevelPL_17", free_to_play = true},
          {name = "LevelPL_13"},
          {name = "LevelPL_5"},
          {name = "LevelPL_1"},
          {name = "LevelPL_8"},
          {name = "LevelPL_23"},
          {name = "LevelPL_24"},
          {name = "LevelPL_29"},
          {name = "LevelPL_3"},
          {name = "LevelPL_4"},
          {name = "LevelPL_6"},
          {name = "LevelPL_7"},
          {name = "LevelPL_14"}
        }
      },
      {
        folder_name = "/levels/pack17",
        display_number = "2",
        world_number = 17,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_1",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {name = "LevelPL_18"},
          {name = "LevelPL_9"},
          {name = "LevelPL_25"},
          {name = "LevelPL_15"},
          {name = "LevelPL_16"},
          {name = "LevelPL_28"},
          {name = "LevelPL_2"},
          {name = "LevelPL_19"},
          {name = "LevelPL_22"},
          {name = "LevelPL_20"},
          {name = "LevelPL_10"},
          {name = "LevelPL_11"},
          {name = "LevelPL_26"},
          {name = "LevelPL_12"},
          {
            name = "LevelPL_30",
            clear_cutscene = "movie_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "piglantisGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelPL_3star",
            disabled_button_override = "MENU_STAR_MOVIE_SILHOUETTE",
            level_button_override = "MENU_STAR_MOVIE_EMPTY",
            completed_sprite_override = "MENU_STAR_MOVIE",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\161"
          },
          {
            name = "LevelPL_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.8,
            y = 0.25
          }
        }
      }
    }
  },
  [11] = {
    season = 2012,
    icon = "ABOUT_BIRDS_1",
    name = "Cherry Blossom",
    decor_left = "LS_THEME_CF_LEFT",
    decor_right = "LS_THEME_CF_RIGHT",
    score_achievement_limit = 9999999,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_CHERRY",
    background_image = "CHERRY_SKY",
    dynamic_load_group = "levelSelectionCherry",
    featherBoxIdentifier = "CF",
    reward_completion = {sprite = "REWARD_CF", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_CF_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelCH_3star",
      sprite = "REWARD_CF_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack15",
        display_number = "1",
        world_number = 15,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {name = "LevelCH_13", free_to_play = true},
          {name = "LevelCH_15", free_to_play = true},
          {name = "LevelCH_12", free_to_play = true},
          {name = "LevelCH_10"},
          {name = "LevelCH_9"},
          {name = "LevelCH_14"},
          {name = "LevelCH_1"},
          {name = "LevelCH_7"},
          {name = "LevelCH_5"},
          {name = "LevelCH_6"},
          {name = "LevelCH_4"},
          {name = "LevelCH_8"},
          {name = "LevelCH_11"},
          {name = "LevelCH_2"},
          {
            name = "LevelCH_3",
            clear_cutscene = "cherry_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "cherryGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelCH_3star",
            disabled_button_override = "MENU_STAR_CF_FLOWER_SILHOUETTE",
            level_button_override = "MENU_STAR_CF_FLOWER_EMPTY",
            completed_sprite_override = "MENU_STAR_CF_FLOWER",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\177"
          },
          {
            name = "LevelCH_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.8,
            y = 0.25
          }
        }
      }
    }
  },
  [10] = {
    season = 2012,
    icon = "ABOUT_BIRDS_1",
    name = "Year of the Dragon",
    decor_left = "LS_THEME_YD_LEFT",
    decor_right = "LS_THEME_YD_RIGHT",
    score_achievement_limit = 9999999,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_DRAGON",
    background_image = "DRAGON_SKY",
    dynamic_load_group = "levelSelectionDragon",
    featherBoxIdentifier = "YD",
    reward_completion = {sprite = "REWARD_YD", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_YD_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelYOTD_3star",
      sprite = "REWARD_YD_STAR"
    },
    mightyPower = {
      definition = "BaitGoldenFish",
      free = true,
      dont_count_towards_feathers = true,
      highscoreTextItem = "Dragon Highscore:",
      levelEndTextItem = "Dragon Highscore",
      levelSelectionSilhouette = "LS_DRAGON_BUTTON",
      collectableReward = "LS_DRAGON_FISH",
      episodeSelectionFeather = "EPISODE_SELECTION_FISH",
      buttonEnabled = "BUTTON_USE_DRAGON",
      buttonDisabled = "BUTTON_USE_DRAGON_DISABLED",
      buttonLevelFailed = "BUTTON_DRAGON",
      buttonLostLevelFailed = "BUTTON_DRAGON_LOST",
      levelEndMeterEmpty = "DRAGON_METER_EMPTY",
      levelEndMeterFull = "DRAGON_METER_FULL",
      levelEndMeterFill = "DRAGON_METER_FILL",
      levelEndSpriteOn = "RESULT_MD_FISH_ON",
      levelEndSpriteOff = "RESULT_MD_FISH_OFF",
      availableOnAndroid = true
    },
    pages = {
      {
        folder_name = "/levels/pack11",
        display_number = "1",
        world_number = 14,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {name = "LevelD_1", free_to_play = true},
          {name = "LevelD_2", free_to_play = true},
          {name = "LevelD_3", free_to_play = true},
          {name = "LevelD_4"},
          {name = "LevelD_5"},
          {name = "LevelD_6"},
          {name = "LevelD_7"},
          {name = "LevelD_8"},
          {name = "LevelD_9"},
          {name = "LevelD_10"},
          {name = "LevelD_11"},
          {name = "LevelD_12"},
          {name = "LevelD_13"},
          {name = "LevelD_14"},
          {
            name = "LevelD_15",
            clear_cutscene = "dragon_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggswithvideo",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "dragonGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        video_link = {
          link = "DRAGON_VIDEO_URL"
        },
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelYOTD_3star",
            disabled_button_override = "MENU_STAR_YD_PAPER_SILHOUETTE",
            level_button_override = "MENU_STAR_YD_PAPER_EMPTY",
            completed_sprite_override = "MENU_STAR_YD_PAPER",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\175"
          },
          {
            name = "LevelYOTD_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.75,
            y = 0.65
          }
        }
      }
    }
  },
  [9] = {
    season = 2012,
    icon = "ABOUT_BIRDS_1",
    name = "Wreck the Halls",
    decor_left = "",
    decor_right = "",
    score_achievement_limit = 2466000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_XMAS_2",
    background_image = "LS_XMAS_2012_BACKGROUND",
    dynamic_load_group = "levelSelectionXmas2",
    featherBoxIdentifier = "X2",
    reward_completion = {sprite = "REWARD_X2", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_X2_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelX11_3star",
      sprite = "REWARD_X2_STAR"
    },
    mightyPower = {
      levelSelectionSilhouette = "LS_XMAS_EAGLE",
      levelEndSpriteOn = "RESULT_ME_FEATHER_ON",
      levelEndSpriteOff = "RESULT_ME_FEATHER_OFF"
    },
    pages = {
      {
        folder_name = "/levels/pack10",
        display_number = "1",
        world_number = 13,
        colour = {
          r = 200,
          g = 200,
          b = 200
        },
        level_button = "LEVEL_BOX_XMAS_CLOSED",
        layout = "xmas",
        layout_params = {rows = 5, cols = 5},
        clear_achievement = "Merry Happy!",
        all_levels_open = true,
        animated_button_override = "LEVEL_BOX_XMAS2_OPEN",
        levels = {
          {
            name = "LevelX11_643",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX11_644",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX11_646",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX11_631",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_637",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_638",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_639",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_635",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_641",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_648",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_649",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_640",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_642",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_645",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_647",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_633",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_634",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_651",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_655",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_654",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_632",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_652",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_653",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_636",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX11_650",
            animation_particles = {
              "starExplosion",
              {
                "giftExplosion",
                amount = 1
              }
            },
            clear_cutscene = "xmas2011_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggswithvideo",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "xmas2011GE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        video_link = {
          link = "XMAS2011_GIFT_URL",
          sprite = "LS_BUTTON_GIFT"
        },
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelX11_3star",
            disabled_button_override = "MENU_STAR_X2_COOKIE_SILHOUETTE",
            level_button_override = "MENU_STAR_X2_COOKIE_EMPTY",
            completed_sprite_override = "MENU_STAR_X2_COOKIE",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "@"
          },
          {
            name = "LevelX11_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.25,
            y = 0.2
          },
          {
            name = "LevelX11_NewYear",
            level_button_override = "GOLDEN_EGG_1",
            x = 0.7,
            y = 0.15,
            always_open = true
          }
        }
      }
    }
  },
  [8] = {
    season = 2012,
    icon = "ABOUT_BIRDS_1",
    name = "Ham'o'ween",
    decor_left = "LS_THEME_H2_LEFT",
    decor_right = "LS_THEME_H2_RIGHT",
    score_achievement_limit = 2870000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_HALLOWEEN_2",
    background_image = "HALLOWEEN2011_SKY",
    dynamic_load_group = "levelSelectionHalloween2",
    featherBoxIdentifier = "H2",
    reward_completion = {sprite = "REWARD_H2", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_H2_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelH2_3star",
      sprite = "REWARD_H2_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack8",
        display_number = "1",
        world_number = 11,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {name = "LevelH489", free_to_play = true},
          {name = "LevelH490", free_to_play = true},
          {name = "LevelH491", free_to_play = true},
          {name = "LevelH548"},
          {name = "LevelH549"},
          {name = "LevelH580"},
          {name = "LevelH576"},
          {name = "LevelH569"},
          {name = "LevelH578"},
          {name = "LevelH592"},
          {name = "LevelH550"},
          {name = "LevelH586"},
          {name = "LevelH551"},
          {name = "LevelH581"},
          {name = "LevelH547"}
        }
      },
      {
        folder_name = "/levels/pack9",
        display_number = "2",
        world_number = 12,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "Eggxorcist",
        levels = {
          {name = "LevelH584"},
          {name = "LevelH558"},
          {name = "LevelH587"},
          {name = "LevelH554"},
          {name = "LevelH574"},
          {name = "LevelH557"},
          {name = "LevelH572"},
          {name = "LevelH553"},
          {name = "LevelH585"},
          {name = "LevelH559"},
          {name = "LevelH582"},
          {name = "LevelH563"},
          {name = "LevelH583"},
          {name = "LevelH562"},
          {
            name = "LevelH593",
            clear_cutscene = "halloween2011_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggswithvideo",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "halloween2011GE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        video_link = {
          link = "HALLOWEEN_2011_VIDEO_URL"
        },
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelH2_3star",
            disabled_button_override = "MENU_STAR_H2PUMPKIN_SILHOUETTE",
            level_button_override = "MENU_STAR_H2PUMPKIN_EMPTY",
            completed_sprite_override = "MENU_STAR_H2PUMPKIN",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\167"
          },
          {
            name = "LevelH2_GE",
            level_button_override = "GOLDEN_EGG_4",
            x = 0.75,
            y = 0.65
          }
        }
      }
    }
  },
  [7] = {
    season = 2011,
    icon = "ABOUT_BIRDS_1",
    name = "Moon Festival",
    decor_left = "LS_THEME_M_LEFT",
    decor_right = "LS_THEME_M_RIGHT",
    score_achievement_limit = 3264000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_MOONCAKE",
    background_image = "MOONCAKE_SKY",
    dynamic_load_group = "levelSelectionMooncake",
    featherBoxIdentifier = "M",
    reward_completion = {sprite = "REWARD_M", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_M_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelMC_BONUS",
      sprite = "REWARD_M_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack6",
        display_number = "1",
        world_number = 9,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_1",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        levels = {
          {
            name = "LevelMC_459",
            free_to_play = true
          },
          {
            name = "LevelMC_462",
            free_to_play = true
          },
          {
            name = "LevelMC_486",
            free_to_play = true
          },
          {
            name = "LevelMC_535"
          },
          {
            name = "LevelMC_537"
          },
          {
            name = "LevelMC_542"
          },
          {
            name = "LevelMC_485"
          },
          {
            name = "LevelMC_538"
          },
          {
            name = "LevelMC_541"
          },
          {
            name = "LevelMC_461"
          },
          {
            name = "LevelMC_452"
          },
          {
            name = "LevelMC_454"
          },
          {
            name = "LevelMC_536"
          },
          {
            name = "LevelMC_539"
          },
          {
            name = "LevelMC_450"
          }
        }
      },
      {
        folder_name = "/levels/pack7",
        display_number = "2",
        world_number = 10,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_1",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "Bright Side of the Moon",
        levels = {
          {
            name = "LevelMC_451"
          },
          {
            name = "LevelMC_453"
          },
          {
            name = "LevelMC_530"
          },
          {
            name = "LevelMC_533"
          },
          {
            name = "LevelMC_534"
          },
          {
            name = "LevelMC_455"
          },
          {
            name = "LevelMC_532"
          },
          {
            name = "LevelMC_457"
          },
          {
            name = "LevelMC_528"
          },
          {
            name = "LevelMC_489"
          },
          {
            name = "LevelMC_540"
          },
          {
            name = "LevelMC_531"
          },
          {
            name = "LevelMC_487"
          },
          {
            name = "LevelMC_456"
          },
          {
            name = "LevelMC_370",
            clear_cutscene = "mooncake_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/pack7",
        display_number = "3",
        world_number = -1,
        flurry_tag = "mooncakeSocial",
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_1",
        socialPage = true,
        layout = "qzone",
        layout_params = {levels = 3},
        clear_achievement = "",
        disregard_in_rewards = true,
        no_level_progression = true,
        levels = {
          {
            name = "LevelMCExtra_369"
          },
          {
            name = "LevelMCExtra_367"
          },
          {
            name = "LevelMCExtra_368"
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        goldenEggPage = true,
        layout = "mooncake",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "FINISHED_MOONCAKE_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "mooncakeGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelMC_BONUS",
            x = 0.35,
            y = 0.5,
            halo_scale = 1.5,
            disabled_button_override = "MENU_STAR_MOONCAKE_SILHOUETTE",
            level_button_override = "MENU_STAR_MOONCAKE_EMPTY",
            completed_sprite_override = "MENU_STAR_MOONCAKE",
            world_number_override = "\194\164"
          },
          {
            name = "LevelMC_GE",
            x = 0.65,
            y = 0.5,
            halo_scale = 1.5,
            disabled_button_override = "GOLD_MOONCAKE_SILHOUETTE",
            level_button_override = "GOLD_MOONCAKE_FULL",
            made_of_pieces = true
          }
        }
      }
    }
  },
  [6] = {
    season = 2011,
    icon = "ABOUT_BIRDS_1",
    name = "Summer Pignic",
    decor_left = "",
    decor_right = "",
    score_achievement_limit = 3398000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_SUMMER",
    background_image = "LS_SUMMER_BACKGROUND",
    dynamic_load_group = "levelSelectionSummer",
    featherBoxIdentifier = "S",
    reward_completion = {sprite = "REWARD_S", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_S_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelS_3star",
      sprite = "REWARD_S_STAR"
    },
    mightyPower = {
      levelSelectionSilhouette = "LS_SUMMER_EAGLE",
      levelEndSpriteOn = "RESULT_ME_FEATHER_ON",
      levelEndSpriteOff = "RESULT_ME_FEATHER_OFF"
    },
    pages = {
      {
        folder_name = "/levels/pack5",
        display_number = "1",
        world_number = 8,
        colour = {
          r = 200,
          g = 200,
          b = 200
        },
        level_button = "LEVEL_BOX_SUMMER_CLOSED",
        layout = "calendar",
        layout_params = {
          rows = 4,
          cols = 8,
          amount = 30,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        clear_achievement = "Oh, Those Summer Nights",
        all_levels_open = true,
        animated_button_override = "LEVEL_BOX_SUMMER_OPEN",
        levels = {
          {
            name = "Level469",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            },
            free_to_play = true
          },
          {
            name = "Level465",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            },
            free_to_play = true
          },
          {
            name = "Level449",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            },
            free_to_play = true
          },
          {
            name = "Level443",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level452",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level468",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level466",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level457",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level480",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level453",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level473",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level476",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level463",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level445",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level456",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level442",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level450",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level447",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level477",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level475",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level472",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level464",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level455",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level479",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level448",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level471",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level444",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level470",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level446",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            }
          },
          {
            name = "Level451",
            animation_particles = {
              {
                "butterflyExplosionRed",
                amount = 3
              },
              {
                "butterflyExplosionBlue",
                amount = 3
              }
            },
            clear_cutscene = "summer_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggswithvideo",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "summerGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        video_link = {
          link = "SUMMER_VIDEO_URL"
        },
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelS_3star",
            disabled_button_override = "MENU_STAR_BASKET_SILHOUETTE",
            level_button_override = "MENU_STAR_BASKET_EMPTY",
            completed_sprite_override = "MENU_STAR_BASKET",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "}"
          },
          {
            name = "LevelS_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.75,
            y = 0.65
          },
          {
            name = "LevelS_GE_2",
            level_button_override = "GOLDEN_EGG_2",
            x = 0.25,
            y = 0.35
          }
        }
      }
    }
  },
  [5] = {
    season = 2011,
    icon = "ABOUT_BIRDS_1",
    name = "Easter Eggs",
    decor_left = "LS_THEME_E_LEFT",
    decor_right = "LS_THEME_E_RIGHT",
    score_achievement_limit = 1910000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_EASTER",
    background_image = "THEME_E_BG_1",
    dynamic_load_group = "levelSelectionEaster",
    featherBoxIdentifier = "E",
    reward_completion = {sprite = "REWARD_E", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_E_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelE_3star",
      sprite = "REWARD_E_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack4",
        display_number = "1",
        world_number = 7,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "Hardboiled Egg",
        levels = {
          {name = "LevelE_2", free_to_play = true},
          {name = "LevelE_7", free_to_play = true},
          {name = "LevelE_14", free_to_play = true},
          {name = "LevelE_16"},
          {name = "LevelE_5"},
          {name = "LevelE_3"},
          {name = "LevelE_4"},
          {name = "LevelE_6"},
          {name = "LevelE_12"},
          {name = "LevelE_15"},
          {name = "LevelE_18"},
          {name = "LevelE_1"},
          {name = "LevelE_11"},
          {name = "LevelE_10"},
          {
            name = "LevelE_9",
            clear_cutscene = "easter_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/pack4",
        display_number = "2",
        world_number = -1,
        flurry_tag = "easterSocial",
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        socialPage = true,
        layout = "twitter",
        layout_params = {levels = 3},
        clear_achievement = "",
        disregard_in_rewards = true,
        no_level_progression = true,
        levels = {
          {name = "LevelE_17"},
          {name = "LevelE_8"},
          {name = "LevelE_13"}
        }
      },
      {
        folder_name = "/levels/goldeneggseaster",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "easterGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelE_3star",
            disabled_button_override = "MENU_STAR_EASTEREGG_SILHOUETTE",
            level_button_override = "MENU_STAR_EASTEREGG_EMPTY",
            completed_sprite_override = "MENU_STAR_EASTEREGG",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "{"
          },
          {
            name = "LevelE_GE_1",
            level_button_override = "GOLDEN_EGG_2",
            x = 0.35,
            y = 0.13
          },
          {
            name = "LevelE_GE_2",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.1,
            y = 0.25
          },
          {
            name = "LevelE_GE_3",
            level_button_override = "GOLDEN_EGG_1",
            x = 0.25,
            y = 0.4
          },
          {
            name = "LevelE_GE_4",
            level_button_override = "GOLDEN_EGG_2",
            x = 0.1,
            y = 0.55
          },
          {
            name = "LevelE_GE_5",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.2,
            y = 0.7
          },
          {
            name = "LevelE_GE_6",
            level_button_override = "GOLDEN_EGG_1",
            x = 0.65,
            y = 0.13
          },
          {
            name = "LevelE_GE_7",
            level_button_override = "GOLDEN_EGG_2",
            x = 0.9,
            y = 0.25
          },
          {
            name = "LevelE_GE_8",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.75,
            y = 0.4
          },
          {
            name = "LevelE_GE_9",
            level_button_override = "GOLDEN_EGG_1",
            x = 0.9,
            y = 0.55
          },
          {
            name = "LevelE_GE_10",
            level_button_override = "GOLDEN_EGG_2",
            x = 0.8,
            y = 0.7
          }
        }
      }
    }
  },
  [4] = {
    season = 2011,
    icon = "ABOUT_BIRDS_1",
    name = "Go Green, Get Lucky",
    decor_left = "LS_THEME_P_LEFT",
    decor_right = "LS_THEME_P_RIGHT",
    score_achievement_limit = 1735000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_STPATRICK",
    background_image = "THEME_PATRICK_BG_1",
    dynamic_load_group = "levelSelectionStPatrick",
    featherBoxIdentifier = "P",
    reward_completion = {sprite = "REWARD_P", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_P_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelST_3star",
      sprite = "REWARD_P_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack3",
        display_number = "1",
        world_number = 6,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_2",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "It's all Hunky Dory!",
        levels = {
          {name = "LevelSt_2", free_to_play = true},
          {name = "LevelSt_14", free_to_play = true},
          {name = "LevelSt_6", free_to_play = true},
          {name = "LevelSt_3"},
          {name = "LevelSt_5"},
          {name = "LevelSt_8"},
          {name = "LevelSt_9"},
          {name = "LevelSt_10"},
          {name = "LevelSt_17"},
          {name = "LevelSt_4"},
          {name = "LevelSt_7"},
          {name = "LevelSt_13"},
          {name = "LevelSt_11"},
          {name = "LevelSt_15"},
          {
            name = "LevelSt_18",
            clear_cutscene = "stpatrick_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/pack3",
        display_number = "2",
        world_number = -1,
        flurry_tag = "stpatrickSocial",
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_2",
        layout = "facebook",
        layout_params = {levels = 3},
        clear_achievement = "",
        disregard_in_rewards = true,
        no_level_progression = true,
        levels = {
          {name = "LevelSt_1"},
          {name = "LevelSt_12"},
          {name = "LevelSt_16"}
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "stpatrickGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelST_3star",
            disabled_button_override = "MENU_STAR_GOLDPOT_SILHOUETTE",
            level_button_override = "MENU_STAR_GOLDPOT_EMPTY",
            completed_sprite_override = "MENU_STAR_GOLDPOT",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "|"
          },
          {
            name = "LevelST_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.75,
            y = 0.65
          }
        }
      }
    }
  },
  [3] = {
    season = 2011,
    icon = "ABOUT_BIRDS_1",
    name = "Hogs and Kisses",
    decor_left = "LS_THEME_V_LEFT",
    decor_right = "LS_THEME_V_RIGHT",
    score_achievement_limit = 1650000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_VALENTINE",
    background_image = "THEME_V_BG_1",
    dynamic_load_group = "levelSelectionValentine",
    featherBoxIdentifier = "V",
    reward_completion = {sprite = "REWARD_V", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_V_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelV_3star",
      sprite = "REWARD_V_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack2",
        display_number = "1",
        world_number = 5,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_1",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "All's Fair in Love and War",
        levels = {
          {name = "LevelX_39", free_to_play = true},
          {name = "LevelV_3", free_to_play = true},
          {name = "LevelX_44", free_to_play = true},
          {name = "LevelX_45"},
          {name = "LevelX_50"},
          {name = "LevelX_52"},
          {name = "LevelV_2"},
          {name = "LevelX_40"},
          {name = "LevelX_51"},
          {name = "LevelX_41"},
          {name = "LevelX_42"},
          {name = "LevelV_1"},
          {name = "LevelX_43"},
          {name = "LevelX_47"},
          {
            name = "LevelV_4",
            clear_cutscene = "valentine_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/pack2",
        display_number = "2",
        world_number = -1,
        flurry_tag = "valentineSocial",
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_1",
        layout = "facebook",
        layout_params = {levels = 3},
        clear_achievement = "",
        disregard_in_rewards = true,
        no_level_progression = true,
        levels = {
          {name = "LevelX_46"},
          {name = "LevelX_48"},
          {name = "LevelX_49"}
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "valentineGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelV_3star",
            disabled_button_override = "MENU_HEART_3STAR_DISABLED",
            level_button_override = "MENU_HEART_3STAR",
            completed_sprite_override = "MENU_HEART_3STAR",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\\"
          },
          {
            name = "LevelV_GE",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.75,
            y = 0.65
          }
        }
      }
    }
  },
  [2] = {
    season = 2011,
    icon = "ABOUT_BIRDS_1",
    name = "Season's Greedings",
    decor_left = "",
    decor_right = "",
    score_achievement_limit = 2080000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_XMAS",
    background_image = "LS_BACKGROUND",
    dynamic_load_group = "levelSelectionXmas",
    featherBoxIdentifier = "X",
    reward_completion = {sprite = "REWARD_X", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_X_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelX_3star",
      sprite = "REWARD_X_STAR"
    },
    mightyPower = {
      levelSelectionSilhouette = "LS_XMAS_EAGLE",
      levelEndSpriteOn = "RESULT_ME_FEATHER_ON",
      levelEndSpriteOff = "RESULT_ME_FEATHER_OFF"
    },
    pages = {
      {
        folder_name = "/levels/pack1",
        display_number = "1",
        world_number = 4,
        colour = {
          r = 200,
          g = 200,
          b = 200
        },
        level_button = "LEVEL_BOX_XMAS_CLOSED",
        layout = "xmas",
        layout_params = {rows = 5, cols = 5},
        clear_achievement = "Holiday Spirit",
        all_levels_open = true,
        animated_button_override = "LEVEL_BOX_XMAS_OPEN",
        levels = {
          {
            name = "LevelP1_640",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelP1_368",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX_24",
            animation_particles = "starExplosion",
            free_to_play = true
          },
          {
            name = "LevelX_26",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX_28",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX_29",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_346",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX_33",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelX_25",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_639",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_661",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_666",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_634",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_635",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_637",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_365",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_641",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_642",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_643",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_644",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_646",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_660",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_633",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_638",
            animation_particles = "starExplosion"
          },
          {
            name = "LevelP1_025",
            animation_particles = {
              "starExplosion",
              {
                "giftExplosion",
                amount = 1
              }
            },
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggswithvideo",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "xmasGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        video_link = {
          link = "XMAS_GIFT_URL",
          sprite = "LS_BUTTON_GIFT"
        },
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelX_3star",
            disabled_button_override = "LS_GIFT_CLOSED",
            level_button_override = "LS_GIFT_OPEN",
            completed_sprite_override = "LS_GIFT_OPEN",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "\194\168"
          },
          {
            name = "LevelX_GE",
            level_button_override = "GOLDEN_EGG_4",
            x = 0.8,
            y = 0.8
          }
        }
      }
    }
  },
  [1] = {
    season = 2011,
    icon = "ABOUT_BIRDS_1",
    name = "Halloween",
    decor_left = "LS_THEME_1_LEFT",
    decor_right = "LS_THEME_12_RIGHT",
    score_achievement_limit = 4100000,
    per_page_level_numbering = true,
    button = "EPISODE_SELECTION_HALLOWEEN",
    background_image = "BACKGROUND_9_LAYER_1",
    dynamic_load_group = "levelSelectionHalloween",
    featherBoxIdentifier = "H",
    reward_completion = {sprite = "REWARD_H", type = "projectile"},
    reward_three_stars = {
      sprite = "REWARD_H_STAR",
      type = "projectile"
    },
    three_stars_goldenegg = {
      level = "LevelGE_12",
      sprite = "REWARD_H_STAR"
    },
    pages = {
      {
        folder_name = "/levels/pack12",
        display_number = "1",
        world_number = 1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "Pork O'Lantern",
        levels = {
          {
            name = "LevelP5_515",
            free_to_play = true
          },
          {
            name = "LevelP5_518",
            free_to_play = true
          },
          {
            name = "LevelP5_516",
            free_to_play = true
          },
          {
            name = "LevelP5_598"
          },
          {
            name = "LevelP5_517"
          },
          {
            name = "LevelP5_597"
          },
          {
            name = "LevelP5_589"
          },
          {
            name = "LevelP5_590"
          },
          {
            name = "LevelP5_591"
          },
          {
            name = "LevelP5_592"
          },
          {
            name = "LevelP5_593"
          },
          {
            name = "LevelP5_594"
          },
          {
            name = "LevelP5_595"
          },
          {
            name = "LevelP5_523"
          },
          {
            name = "LevelP5_596"
          }
        }
      },
      {
        folder_name = "/levels/pack13",
        display_number = "2",
        world_number = 2,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_4",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "Ominous Oinker",
        levels = {
          {
            name = "LevelP5_383"
          },
          {
            name = "LevelP5_389"
          },
          {
            name = "LevelP5_411"
          },
          {
            name = "LevelP5_407"
          },
          {
            name = "LevelP5_390"
          },
          {
            name = "LevelP5_398"
          },
          {
            name = "LevelP5_414"
          },
          {
            name = "LevelP5_506"
          },
          {
            name = "LevelP5_416"
          },
          {
            name = "LevelP5_388"
          },
          {
            name = "LevelP5_395"
          },
          {
            name = "LevelP5_513"
          },
          {
            name = "LevelP5_399"
          },
          {
            name = "LevelP5_379"
          },
          {
            name = "LevelP5_393"
          }
        }
      },
      {
        folder_name = "/levels/pack14",
        display_number = "3",
        world_number = 3,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_BG_NORMAL_OPEN_3",
        layout = "grid",
        layout_params = {rows = 3, cols = 5},
        clear_achievement = "Haunted Ham",
        levels = {
          {
            name = "LevelP5_381"
          },
          {
            name = "LevelP5_380"
          },
          {
            name = "LevelP5_392"
          },
          {
            name = "LevelP5_404"
          },
          {
            name = "LevelP5_406"
          },
          {
            name = "LevelP5_387"
          },
          {
            name = "LevelP5_409"
          },
          {
            name = "LevelP5_391"
          },
          {
            name = "LevelP5_386"
          },
          {
            name = "LevelP5_400"
          },
          {
            name = "LevelP5_394"
          },
          {
            name = "LevelP5_382"
          },
          {
            name = "LevelP5_384"
          },
          {
            name = "LevelP5_385"
          },
          {
            name = "LevelP5_396",
            clear_cutscene = "halloween_ending",
            episode_end = true
          }
        }
      },
      {
        folder_name = "/levels/goldeneggs1",
        display_number = "^",
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "",
        layout = "goldeneggs",
        layout_params = {
          rows = 1,
          cols = 2,
          completed_sprite = "GOLDEN_EGG_CARVED_STAR"
        },
        free_to_play = true,
        ignoreInThreeStarCalculations = true,
        no_level_progression = true,
        flurry_tag = "halloweenGE",
        golden_egg_end_screen = true,
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        level_number_format = "%world%",
        levels = {
          {
            name = "LevelGE_12",
            disabled_button_override = "MENU_PUMPKIN_SILHOUETTE",
            level_button_override = "MENU_PUMPKIN",
            completed_sprite_override = "MENU_PUMPKIN",
            x = 0.5,
            y = 0.5,
            halo_scale = 1.5,
            world_number_override = "~"
          },
          {
            name = "LevelGE_13",
            level_button_override = "GOLDEN_EGG_3",
            x = 0.75,
            y = 0.65
          }
        }
      }
    }
  },
  ["INTEL"] = {
    name = "Intel",
    icon = "ABOUT_BIRDS_1",
    decor_left = "LS_THEME_INTEL_LEFT",
    decor_right = "LS_THEME_INTEL_RIGHT",
    background_image = "INTEL_SKY",
    dynamic_load_group = "levelSelectionIntel",
    exit_link_override = "LEVEL_SELECTION_15",
    no_ads = true,
    star_sprite_override = {
      "LS_INTEL_STARS_1",
      "LS_INTEL_STARS_2",
      "LS_INTEL_STARS_3"
    },
    pages = {
      {
        folder_name = "/levels/IntelXmas",
        display_number = 1,
        world_number = -1,
        colour = {
          r = 0,
          g = 0,
          b = 0
        },
        level_button = "LS_LEVEL_INTEL",
        layout = "intel",
        layout_params = {rows = 1, cols = 4},
        ignoreInThreeStarCalculations = true,
        flurry_tag = "intel",
        calculate_as_golden_egg_levels = true,
        disregard_in_episode_score = true,
        disregard_in_rewards = true,
        mighty_eagle_disabled = true,
        levels = {
          {name = "Intel_1"},
          {name = "Intel_2"},
          {name = "Intel_3"},
          {name = "Intel_4", disable_next_level_button = true}
        }
      }
    }
  }
}
gamelua.g_episodeIds = {}
for _FORV_3_ = 1, #gamelua.g_episodes do
  gamelua.g_episodeIds[_FORV_3_] = _FORV_3_
end
if gamelua.deviceModel == "windows" or gamelua.deviceModel == "osx" then
  _G.table.remove(gamelua.g_episodes[3].pages, 2)
  _G.table.remove(gamelua.g_episodes[4].pages, 2)
  _G.table.remove(gamelua.g_episodes[5].pages, 2)
  _G.table.remove(gamelua.g_episodes[7].pages, 3)
end
if gamelua.deviceModel == "android" and gamelua.applyChinaRestictions then
  _G.table.remove(gamelua.g_episodes[3].pages, 2)
  _G.table.remove(gamelua.g_episodes[4].pages, 2)
  _G.table.remove(gamelua.g_episodes[5].pages, 2)
end
if gamelua.deviceModel == "android" or gamelua.deviceModel == "ipad" then
  _G.table.insert(gamelua.g_episodes[15].pages[2].levels, {
    name = "Level_Intel",
    level_button_override = "GOLDEN_EGG_INTEL",
    x = 0.8,
    y = 0.65,
    return_value_override = "GOTO_INTEL_SELECTION",
    meta_override = "INTEL"
  })
  gamelua.g_episodeIds[#gamelua.g_episodeIds + 1] = "INTEL"
end
filename = "episodes.lua"
