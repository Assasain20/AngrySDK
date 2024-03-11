g_max_powerups_per_level = 2
function addPowerups(item, amount)
  settingsWrapper:addItems(item, amount)
  notifyEventManager(events.EID_START_CLOUD_SYNC)
end
function getBirdCameraPosition()
  local bcd = getTempBirdCamera()
  return bcd.px, bcd.py
end
function canActivatePowerup(name)
  if g_powerups_active or contains(g_powerups_used, name) then
    return false
  end
  local bird_name = getNextBird(currentBirdIndex)
  if not bird_name and name ~= "birdquake" then
    return false
  end
  if name == "birdquake" then
    return true
  end
  local bird = objects.world[bird_name]
  if not bird or bird.shot then
    return false
  end
  return true
end
function activateSuperSeed()
  if not canActivatePowerup("superseed") then
    return false
  end
  g_super_seed_bird = objects.world[currentBirdName]
  eventManager:notify({
    id = events.EID_POWERUP_WILL_BE_USED,
    type = "superseed"
  })
  g_powerups_active = true
  g_super_seed = 1
  g_powerup_delay = 1.5
  local bcd = objects.birdCameraData[deviceModel]
  local x, y = getBirdCameraPosition()
  cameraTargetObject = nil
  cameraAnimationSliderTarget = 0
  animationWorldScale = worldScale
  sweepSpeed = 0
  local sw, sh = _G.res.getSpriteBounds("UI_POWERUPS_SUPERSEEDS")
  notificationsFrame:addChild(PowerupEffect:new({
    sprite = "UI_POWERUPS_SUPERSEEDS",
    particles = "powerupBuff",
    particles_width = sw,
    particles_height = sh
  }))
  return true
end
function superSeedGetRadius(obj, def)
  local animation_duration = 0.5
  local animation_factor = 5 / animation_duration
  if obj.superseed_timer == nil or animation_duration <= obj.superseed_timer then
    obj.superseed_timer = nil
    return obj.superseed_target_radius
  end
  return def.radius + ((_G.math.sin((obj.superseed_timer * animation_factor - 0.5) * _G.math.pi) + 1) * 0.5 + 2 * _G.math.sin(obj.superseed_timer / animation_duration * _G.math.pi)) * (obj.superseed_target_radius - def.radius)
end
function superSeedResizeBird(bird, obj, def)
  removeObject(bird)
  obj.radius = superSeedGetRadius(obj, def)
  createCircle(bird, obj.sprite, obj.x, obj.y, obj.radius, obj.density, obj.friction, obj.restitution, obj.controllable, obj.z_order)
  local new_obj = objects.world[bird]
  for k, v in _G.pairs(obj) do
    if new_obj[k] == nil then
      new_obj[k] = v
    end
  end
  setObjectParameter(bird, 5, obj.radius / def.radius)
  setObjectParameter(bird, 6, 1)
  setColliderType(bird, obj.collider)
  new_obj.useLegacyCollisionPath = nil
  if birdReady and currentBirdName == bird then
    setObjectParameter(bird, 2, 1)
  else
    setObjectParameter(bird, 2, 0)
  end
  birds[bird] = new_obj
  return new_obj
end
function activateKingSling()
  if not canActivatePowerup("kingsling") then
    return false
  end
  eventManager:notify({
    id = events.EID_POWERUP_WILL_BE_USED,
    type = "kingsling"
  })
  g_powerups_active = true
  g_king_sling = true
  g_powerup_delay = 1.5
  local bcd = objects.birdCameraData[deviceModel]
  local x, y = getBirdCameraPosition()
  cameraTargetObject = nil
  cameraAnimationSliderTarget = 0
  animationWorldScale = worldScale
  sweepSpeed = 0
  local sw, sh = _G.res.getSpriteBounds("UI_POWERUPS_KINGSLING")
  notificationsFrame:addChild(PowerupEffect:new({
    sprite = "UI_POWERUPS_KINGSLING",
    particles = "powerupBuff",
    particles_width = sw,
    particles_height = sh
  }))
  return true
end
function activateSlingScope()
  if not canActivatePowerup("slingscope") then
    return false
  end
  eventManager:notify({
    id = events.EID_POWERUP_WILL_BE_USED,
    type = "slingscope"
  })
  g_powerups_active = true
  g_sling_scope_activation = true
  g_powerup_delay = 1.5
  local bcd = objects.birdCameraData[deviceModel]
  local x, y = getBirdCameraPosition()
  cameraTargetObject = nil
  cameraAnimationSliderTarget = 0
  animationWorldScale = worldScale
  sweepSpeed = 0
  local sw, sh = _G.res.getSpriteBounds("UI_POWERUPS_SLINGSCOPE")
  notificationsFrame:addChild(PowerupEffect:new({
    sprite = "UI_POWERUPS_SLINGSCOPE",
    particles = "powerupBuff",
    particles_width = sw,
    particles_height = sh
  }))
  return true
end
local quake_duration = 2
local quake_delay = 1
function activateBirdQuake()
  if not canActivatePowerup("birdquake") then
    return false
  end
  eventManager:notify({
    id = events.EID_POWERUP_WILL_BE_USED,
    type = "birdquake"
  })
  g_powerups_active = true
  g_bird_quake = true
  g_bird_quake_timer = quake_duration
  g_powerup_delay = quake_delay
  g_bird_quake_particle_timer = 0
  g_bird_quake_sound = false
  if levelCompleteTimer ~= 0 then
    levelCompleteTimer = 0
  end
  panToCastleCamera()
  local sw, sh = _G.res.getSpriteBounds("UI_POWERUPS_BIRDQUAKE")
  notificationsFrame:addChild(PowerupEffect:new({
    sprite = "UI_POWERUPS_BIRDQUAKE",
    particles = "powerupBuff",
    particles_width = sw,
    particles_height = sh
  }))
  return true
end
function getLaunchVelocity()
  local bird = objects.world[currentBirdName]
  local bDef = getObjectDefinition(currentBirdName)
  local dist = distance(levelStartPosition.x, levelStartPosition.y, rubberBandPos.x, rubberBandPos.y)
  local distf = rubberBandLength / shootMaxLength
  if distf < 0 then
    distf = 0
  end
  if distf > 1 then
    distf = 1
  end
  local force = (bDef.slingshotLaunchForce or defaultForce) * physicsScale * bird.mass * g_slingshot_power
  local impulse_x = (rubberBandPos.x - levelStartPosition.x) / dist * force * distf
  local impulse_y = (rubberBandPos.y - levelStartPosition.y) / dist * force * distf
  local inv_mass = 1 / bird.mass
  return impulse_x * inv_mass, impulse_y * inv_mass
end
function drawSlingScope(world_scale)
  if g_sling_scope_activation then
    return
  end
  local s_vx, s_vy
  if selectedBird == nil or rubberBandLength == 0 then
    s_vx = 0
    s_vy = 0
  else
    s_vx, s_vy = getLaunchVelocity()
  end
  local rpx, rpy = _G.res.getSpritePivot("SLINGSHOT_POWERUP_SCOPE")
  local lsx, lsy = physicsToWorldTransform(levelStartPosition.x, levelStartPosition.y)
  if g_last_angle == nil then
    g_last_angle = 0
  end
  local angle
  if s_vx ~= 0 or s_vy ~= 0 then
    local target_angle = _G.math.atan2(s_vy, s_vx)
    if target_angle < g_last_angle - _G.math.pi then
      target_angle = target_angle + _G.math.pi * 2
    elseif target_angle > g_last_angle + _G.math.pi then
      target_angle = target_angle - _G.math.pi * 2
    end
    angle = g_last_angle + (target_angle - g_last_angle) * g_dt * 2
    angle = _G.math.fmod(angle, _G.math.pi * 2)
    g_last_angle = angle
  end
  if angle == nil then
    angle = g_last_angle or 0
  end
  setRenderState(-screen.left - cameraShakeX, -screen.top - cameraShakeY, world_scale, world_scale, angle, rpx, rpy)
  _G.res.drawSprite("SLINGSHOT_POWERUP_SCOPE", lsx - 60, lsy - 93)
  if dragStarted and currentBirdName and selectedBird ~= nil and rubberBandLength ~= 0 then
    local vertical_force = blockTable.blocks[selectedBird.definition].flyVerticalForce or 0
    drawSlingScopeNative(s_vx, s_vy, vertical_force)
  end
end
PowerupEffect = ui.Image:inherit()
function PowerupEffect:init()
  ui.Image.init(self)
  self:setImage(self.sprite)
end
function PowerupEffect:onEntry()
  ui.Image.onEntry(self)
  self.timer = 0
  self.scaleX = 8
  self.scaleY = 8
  _G.res.playAudio("powerup_intro", 1, false)
end
function PowerupEffect:layout()
  ui.Image.layout(self)
  self.x = 0.5 * screenWidth
  self.y = 0.5 * screenHeight
end
function PowerupEffect:update(dt, time)
  ui.Image.update(self, dt, time)
  self.timer = self.timer + dt
  local fall_time = 0.2
  self.scaleX = tweenLinear(_G.math.min(self.timer, fall_time), 8, -7, fall_time)
  self.scaleY = self.scaleX
  local shake_duration = 0.4
  if fall_time <= self.timer and self.timer <= fall_time + shake_duration then
    cameraShake = (shake_duration - (_G.math.min(self.timer, fall_time + shake_duration) - fall_time)) / shake_duration * (screenHeight / 768) * 30
  else
    cameraShake = 0
  end
  if fall_time <= self.timer and not self.triggered then
    g_menu_particle_scale = 1
    _G.particles.addParticles("powerupBurst", 50, screenWidth * 0.5, screenHeight * 0.5, 0, 0, 0, true, true)
    _G.particles.addParticles("powerupSmokeBuff", 20, screenWidth * 0.5, screenHeight * 0.5, self.particles_width or 0, self.particles_height or 0, 0, true, true)
    _G.particles.addParticles(self.particles, 1, screenWidth * 0.5, screenHeight * 0.5, 0, 0, 0, true, true)
    self.triggered = true
  end
  if self.timer >= 1 and self.timer < 1.1 then
    local scale = _G.math.sin((self.timer - 1) * 10 * _G.math.pi) * 0.25
    self.scaleX = 1 + scale
    self.scaleY = 1 + scale
  elseif self.timer >= 1.1 then
    local scale = 1 - (self.timer - 1.1) * 6.6666665
    self.scaleX = scale
    self.scaleY = scale
  end
  if self.timer > 1.25 then
    notificationsFrame:removeChild(self)
  end
end
function PowerupEffect:draw(x, y)
  drawMenuParticlesInAdvance()
  ui.Image.draw(self, x, y)
end
function updateBirdQuake(dt)
  if g_powerup_delay > 0 then
    g_powerup_delay = g_powerup_delay - dt
    panToCastleCamera()
    eagleDarkness = (quake_delay - g_powerup_delay) * 0.5
    return
  end
  dt = _G.math.min(dt, g_bird_quake_timer)
  g_bird_quake_timer = _G.math.max(g_bird_quake_timer - dt, 0)
  if g_bird_quake_timer == 0 then
    g_bird_quake = false
    g_powerups_active = false
    cameraShake = 0
    return
  end
  local particles = 0
  g_bird_quake_particle_timer = g_bird_quake_particle_timer + dt
  while g_bird_quake_particle_timer > 0.05 do
    particles = particles + 1
    g_bird_quake_particle_timer = g_bird_quake_particle_timer - 0.05
    g_menu_particle_scale = worldScale
    local _, top = worldToScreenTransform(0, 0)
    local particles = {"quake"}
    _G.particles.addParticles(particles[_G.math.random(1, #particles)], 1, screenWidth * 0.5, top + 0.5 * (screenHeight - top), screenWidth, screenHeight - top, 0, true, true)
    _G.particles.addParticles("quake_smoke", 1, screenWidth * 0.5, top - 1, screenWidth, 2, 0, true, true)
  end
  cameraShake = g_bird_quake_timer * 25
  eagleDarkness = 100
  if not g_bird_quake_sound then
    _G.res.playAudio(getAudioName("earthquake"), 1, false)
    g_bird_quake_sound = true
  end
  local material_particles = {
    woodBlocks = "woodenBuff",
    rockBlocks = "rockBuff",
    lightBlocks = "lightBuff"
  }
  for k, v in _G.pairs(objects.world) do
    if 0 < v.density then
      applyImpulse(k, dt * _G.math.cos(g_bird_quake_timer * _G.math.pi) * v.mass * 7, 0, v.x, v.y)
    end
    local def = getObjectDefinition(v.name)
    if material_particles[def.group] then
      for i = 1, particles do
        if _G.math.random() < 0.03 then
          local x, y = physicsToWorldTransform(v.x, v.y)
          local w, h = 0, 0
          if v.width and v.height then
            w, h = v.width, v.height
          elseif v.radius then
            w, h = v.radius * 2, v.radius * 2
          end
          w, h = physicsToWorldTransform(w, h)
          _G.particles.addParticles(material_particles[def.group], 1, x, y, w, h, v.angle, false, false)
        end
      end
    end
  end
end
function updateSuperSeed(dt)
  skipInput = true
  if g_powerup_delay > 0 then
    g_powerup_delay = g_powerup_delay - dt
    return
  end
  if g_super_seed == 1 then
    g_super_seed = 2
    g_powerup_delay = 0.5
    local default_growth = 1.4
    local growth_factors = {
      BlackBird = 1.3,
      SmallBlueBird = 1.3,
      BoomerangBird = 1.3,
      BasicBird2 = 1.4,
      YellowBird = 1.3,
      RedBird = 1.5,
      GlobeBird = 1.2
    }
    local v = g_super_seed_bird
    if not v.shot then
      local growth_factor = default_growth
      local bird = v.name
      local def = getObjectDefinition(bird)
      if growth_factors[v.definition] then
        growth_factor = growth_factors[v.definition]
      end
      v.superseed_timer = 0
      v.superseed_target_radius = v.radius * growth_factor
      local new_obj = superSeedResizeBird(bird, v, def)
      new_obj.powerup_scale = v.superseed_target_radius / def.radius
      local x, y = physicsToWorldTransform(v.x, v.y)
      _G.particles.addParticles("superSeedActivation", 1, x, y, 0, 0, 0, true, false)
      _G.particles.addParticles("superSeedActivationBurst", 10, x, y, 0, 0, 0, true, false)
    end
    local castleToBirdCamDist = _G.math.abs(distance(objects.birdCameraData[deviceModel].px, objects.birdCameraData[deviceModel].py, objects.castleCameraData[deviceModel].px, objects.castleCameraData[deviceModel].py))
    local camToBirdCamDist = _G.math.abs(distance(screen.x, screen.y, objects.birdCameraData[deviceModel].px, objects.birdCameraData[deviceModel].py))
    local volume = _G.math.min(1, _G.math.max(0.25, 1 - camToBirdCamDist / castleToBirdCamDist))
    _G.res.playAudio(getAudioName("big_bird"), volume, false)
  else
    g_super_seed = false
    g_powerups_active = false
  end
end
function updateKingSling(dt)
  if g_powerup_delay > 0 then
    g_powerup_delay = g_powerup_delay - dt
    return
  end
  g_powerups_active = false
  g_king_sling = false
  _G.res.playAudio(getAudioName("super_slingshot"), 1, false)
  local x, y = physicsToWorldTransform(slingShotBasePosition.x, slingShotBasePosition.y)
  _G.particles.addParticles("superSlingActivation", 1, x, y, 0, 0, 0, true, false)
  _G.particles.addParticles("superSlingBurst", 40, x, y, 0, 0, 0, true, false)
  g_slingshot_back = "SLING_SHOT_02_BACK"
  if not g_sling_scope then
    g_slingshot_front = "SLING_SHOT_02_FRONT"
  else
    g_slingshot_front = "SLINGSHOT_POWERUP_KINGSLING"
  end
  local power_increment = 0.3
  g_slingshot_power = g_slingshot_power + power_increment
  g_rubber_r = 119
  g_rubber_g = 0
  g_rubber_b = 0
end
function updateSlingScope(dt)
  if g_powerup_delay > 0 then
    g_powerup_delay = g_powerup_delay - dt
    return
  end
  g_powerups_active = false
  g_sling_scope_activation = false
  g_sling_scope = true
  _G.res.playAudio(getAudioName("super_slingshot"), 1, false)
  local x, y = physicsToWorldTransform(levelStartPosition.x, levelStartPosition.y)
  _G.particles.addParticles("powerupBuff", 1, x, y, 0, 0, 0, true, false)
  _G.particles.addParticles("powerupBurst", 40, x, y, 0, 0, 0, true, false)
  if g_slingshot_power == 1 then
    g_slingshot_front = "SLINGSHOT_POWERUP_BASIC"
  else
    g_slingshot_front = "SLINGSHOT_POWERUP_KINGSLING"
  end
end
function randomPowerupReward(amount)
  local powerup = _G.math.random(1, 4)
  local powerups = {
    "slingscope",
    "birdquake",
    "kingsling",
    "superseed"
  }
  powerupReward(amount, powerups[powerup])
end
function powerupReward(amount, powerup)
  local powerups = {
    slingscope = {
      id = "slingscope",
      image = "UI_POWERUPS_SLINGSCOPE",
      message = "TEXT_POWERUP_RECEIVED_SLINGSCOPE"
    },
    birdquake = {
      id = "birdquake",
      image = "UI_POWERUPS_BIRDQUAKE",
      message = "TEXT_POWERUP_RECEIVED_BIRDQUAKE"
    },
    kingsling = {
      id = "kingsling",
      image = "UI_POWERUPS_KINGSLING",
      message = "TEXT_POWERUP_RECEIVED_KINGSLING"
    },
    superseed = {
      id = "superseed",
      image = "UI_POWERUPS_SUPERSEEDS",
      message = "TEXT_POWERUP_RECEIVED_SUPERSEEDS"
    }
  }
  addPowerups(powerup, amount)
  notificationsFrame:addChild(PowerupReward:new({
    image = powerups[powerup].image,
    message = powerups[powerup].message,
    amount = amount
  }))
end
function bundleReward(amount, initial_shade)
  initial_shade = initial_shade or 0
  if not settingsWrapper:isChildlockOn() then
    addPowerups("slingscope", amount)
    addPowerups("birdquake", amount)
    addPowerups("kingsling", amount)
    addPowerups("superseed", amount)
    local scale = 1
    if (deviceModel == "iphone4" or deviceModel == "ipad3") and not isRetinaGraphicsEnabled() then
      scale = 0.5
    end
    local reward_popup = PowerupReward:new({
      image = "UI_POWERUPS_BUNDLE",
      message = "TEXT_POWERUP_RECIEVED_BUNDLE",
      amount = amount,
      initial_shade = initial_shade,
      image_scale = scale
    })
    notificationsFrame:addChild(reward_popup)
    return reward_popup
  end
end
function showPowerupPurchaseElements()
  return g_powerups_enabled and isIapEnabled()
end
function isPowerupUsedInLevel(powerup)
  return contains(g_powerups_used, powerup)
end
function powerupChildLockPrompt(extra_params)
  local params = deepCopy(extra_params) or {}
  params.title = ""
  params.content = params.content or "TEXT_POWERUP_PARENTAL_LOCK"
  if screenWidth >= 480 then
    params.images = {
      "UI_POWERUPS_SUPERSEEDS",
      "UI_POWERUPS_KINGSLING",
      "UI_POWERUPS_SLINGSCOPE",
      "UI_POWERUPS_BIRDQUAKE"
    }
  end
  notificationsFrame:addChild(ui.MessageBox:new(params))
end
filename = "powerups.lua"
