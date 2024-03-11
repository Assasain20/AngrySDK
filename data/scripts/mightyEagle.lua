function createMightyEagle(meX, meY)
  levelCompleteTimer = 0
  levelFailedTimer = -200
  eagleX, eagleY = nil, nil
  local newName = "MightyEagle_a"
  local blockDef = blockTable.blocks.MightyEagleBird
  createCircle(newName, blockDef.sprite, levelLimitMinX + 1, meY - (meX - levelLimitMinX + 1) / 2, blockDef.radius, blockDef.density, blockDef.friction, blockDef.restitution, true, blockDef.z_order)
  objects.world[newName].targetX = meX
  objects.world[newName].targetY = meY
  objects.world[newName].initVelX, objects.world[newName].initVelY = vNormalize(objects.world[newName].targetX - objects.world[newName].x, objects.world[newName].targetY - objects.world[newName].y)
  objects.world[newName].definition = "MightyEagleBird"
  objects.world[newName].controllable = blockDef.controllable
  objects.world[newName].strength = blockDef.strength
  objects.world[newName].defence = blockDef.defence
  objects.world[newName].materialName = blockDef.materialName
  objects.world[newName].damageFactors = blockDef.damageFactors
  objects.world[newName].useLegacyCollisionPath = blockDef.useLegacyCollisionPath
  objects.world[newName].levelGoal = false
  local xp, yp = _G.res.getSpritePivot("", blockDef.sprite)
  objects.world[newName].spritePivotX = xp
  objects.world[newName].spritePivotY = yp
  objects.world[newName].damageSprite = blockDef.sprite
  objects.world[newName].xVel = 0
  objects.world[newName].yVel = 0
  setSprite(newName, objects.world[newName].damageSprite)
  setRotation(newName, 0)
  setVelocity(newName, objects.world[newName].xVel, objects.world[newName].yVel)
  objects.world[newName].animTimer = 9999
  objects.world[newName].jumpTimer = 9999
  objects.world[newName].animOn = false
  objects.world[newName].isMightyEagle = true
  objects.world[newName].shot = true
  objects.world[newName].particleTimer = 0
  objects.world[newName].particleTimerLimit = 0.025
  objects.world[newName].recordTrajectory = false
  local _ENV = _G.getfenv(1)
  objects.world[newName].collisionFunction = _ENV[blockTable.blocks[objects.world[newName].definition].collisionFunction]
  objects.world[newName].frozenFunction = _ENV[blockTable.blocks[objects.world[newName].definition].frozenFunction]
  objects.world[newName].updateFunction = _ENV[blockTable.blocks[objects.world[newName].definition].updateFunction]
  birds[newName] = objects.world[newName]
  birdsCounter = birdsCounter + 1
  currentZoomedScale = objects.castleCameraData[deviceModel].sx
  flyingBird = objects.world[newName]
  setMaxTranslation(5)
  _G.particles.setHardLimit(250)
  _G.particles.setSoftLimit(0, 0.2)
  setColliderType(newName, blockDef.collider)
end
function updateMightyEagleBait(v, dt)
  if eagleTimer ~= nil and eagleTimer < 6.2 and eagleMoving == true then
    birdSpecialtyAvailable = false
    eagleMoving = false
    createMightyEagle(v.x, v.y)
  end
  if v.shot then
    if v.angularVelocity == nil then
      v.angularVelocity = 0
    end
    if v.hasCollided ~= true then
      v.angularVelocity = v.angularVelocity + dt * 10
      if v.angularVelocity > 20 then
        v.angularVelocity = 20
      end
      setAngularVelocity(v.name, v.angularVelocity)
    end
  end
end
function updateMightyEagle(v, dt)
  eagleHeight = levelStartPosition.y - v.y
  eagleHeight = _G.math.max(_G.math.min(eagleHeight, 50), 0)
  local speed = 10000
  v.particleTimer = v.particleTimer + dt
  local particleAmount = _G.math.floor(v.particleTimer / v.particleTimerLimit)
  if particleAmount > 0 then
    v.particleTimer = _G.math.fmod(v.particleTimer, v.particleTimerLimit)
    addParticles(v.name, "mightyEagleParticles", particleAmount, false, false)
  end
  if v.hitGround ~= true then
    local angle = _G.math.atan2(v.initVelY, v.initVelX)
    setVelocity(v.name, v.initVelX * speed, v.initVelY * speed)
    setRotation(v.name, angle)
  elseif v.hitGround == true then
    setVelocity(v.name, v.initVelX * speed, -v.initVelY * speed)
    setAngularVelocity(v.name, _G.math.pi * 4)
  end
end
function mightyEagleBaitFrozen(v, dt)
  eagleX, eagleY = v.x, v.y
  print("baitSardine frozen!\n")
  if eagleTimer == nil then
    eagleTimer = 8.7
    eagleMoving = true
  end
end
function mightyEagleFrozen(v, dt)
  if not v.hitGround then
    cameraShake = 100
    playAudio("mighty_eagle_thump", 1, false)
    for k2, v2 in _G.pairs(objects.world) do
      if v2 ~= nil and v2.strength ~= nil and v2.levelGoal then
        local force = -v2.mass * 15
        applyImpulse(v2.name, 0, force, v2.x, v2.y)
        v2.strength = 1.0E-5
        v2.defence = 0
      end
    end
    if objects.joints ~= nil then
      for k, v in _G.pairs(objects.joints) do
        destroyJoint(v.name)
      end
    end
    eagleTimer = 4
  end
end
function mightyEagleCollision(object1, object2)
  local obj1 = objects.world[object1]
  local obj2 = objects.world[object2]
  if obj2.isMightyBait then
    obj2.strength = 0
    deadBlocks[object2] = obj2
    birds[object2] = nil
  elseif 0 > objects.world.ground.y - obj1.y or object2 == "ground" then
    mightyEagleGroundCollision(object1)
  end
end
function mightyEagleGroundCollision(object1)
  objects.world[object1].hitGround = true
  cameraShake = 100
  local bDef = getObjectDefinition(objects.world[object1].name)
  objects.world[object1].sprite = bDef.spriteCollision
  setSprite(object1, objects.world[object1].sprite)
  playAudio("mighty_eagle_thump", 1, false)
  for k, v in _G.pairs(objects.world) do
    if v.strength ~= nil and v.levelGoal then
      local force = -v.mass * 15
      applyImpulse(v.name, 0, force, v.x, v.y)
      v.strength = 1.0E-4
      v.defence = 0
    elseif v.isMightyBait then
      v.strength = 0
      deadBlocks[k] = v
      birds[k] = nil
    end
  end
  destroyJoints = true
  eagleTimer = 4
end
function mightyEagleBaitCollision(object1, object2)
  if objects.world[object2].isMightyEagle then
    obj1.strength = 0
    deadBlocks[object1] = objects.world[object1]
    birds[object1] = nil
  elseif objects.world[object1].collision ~= true and eagleTimer == nil then
    eagleTimer = 8.7
    eagleMoving = true
  end
end
function mightyEagleAndBaitTimerUpdate(dt)
  if eagleTimer ~= nil then
    eagleTimer = eagleTimer - dt
    if eagleTimer < 6.2 and eagleMoving == true and eagleX ~= nil and eagleY ~= nil then
      birdSpecialtyAvailable = false
      eagleMoving = false
      createMightyEagle(eagleX, eagleY)
    elseif eagleTimer < 7.7 and eagleSoundPlayed ~= true then
      playAudio("mighty_eagle_yell", 1, false)
      playAudio("mighty_eagle_fly", 1, false)
      eagleSoundPlayed = true
    end
    if cameraShake ~= nil and cameraShake > 0 then
      cameraShake = _G.math.max(cameraShake - cameraShake * dt * 2.2, 0)
    end
    if eagleTimer < 0 then
      for k, v in _G.pairs(objects.world) do
        if v.strength ~= nil and v.levelGoal then
          v.strength = 0
          deadBlocks[k] = v
        end
      end
    end
    if destroyJoints then
      if objects.joints ~= nil then
        for k, v in _G.pairs(objects.joints) do
          destroyJoint(v.name)
        end
      end
      destroyJoints = nil
    end
  end
end
filename = "mightyEagle.lua"
