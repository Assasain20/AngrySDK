function spawnMightyDragon(baitX, baitY)
  levelCompleteTimer = 0
  levelFailedTimer = -200
  eagleX, eagleY = nil, nil
  local newName = "MightyDragon_a"
  local blockDef = blockTable.blocks.MightyDragonCreature
  createCircle(newName, blockDef.sprite, levelLimitMinX + 30, baitY - (baitX - levelLimitMinX + 1) / 2, blockDef.radius, blockDef.density, blockDef.friction, blockDef.restitution, true, blockDef.z_order)
  objects.world[newName].targetX = baitX
  objects.world[newName].targetY = baitY
  local velX = objects.world[newName].targetX - objects.world[newName].x
  local velY = objects.world[newName].targetY - objects.world[newName].y
  objects.world[newName].initVelX, objects.world[newName].initVelY = vNormalize(velX, velY)
  objects.world[newName].exitAngle = _G.math.atan2(objects.world[newName].initVelY * -1, objects.world[newName].initVelX)
  objects.world[newName].definition = "MightyDragonCreature"
  objects.world[newName].totalAngle = 0
  objects.world[newName].controllable = blockDef.controllable
  objects.world[newName].strength = blockDef.strength
  objects.world[newName].defence = blockDef.defence
  objects.world[newName].material = blockDef.material
  objects.world[newName].damageFactors = blockDef.damageFactors
  objects.world[newName].useLegacyCollisionPath = blockDef.useLegacyCollisionPath
  objects.world[newName].levelGoal = false
  objects.world[newName].phase = 0
  local xp, yp = _G.res.getSpritePivot("INGAME_MIGHTY_DRAGON_1", blockDef.sprite)
  objects.world[newName].spritePivotX = xp
  objects.world[newName].spritePivotY = yp
  objects.world[newName].damageSprite = blockDef.sprite
  objects.world[newName].currentX = levelLimitMinX + 1
  objects.world[newName].currentY = baitY - (baitX - levelLimitMinX + 1) / 2
  objects.world[newName].xVel = 0
  objects.world[newName].yVel = 0
  setSprite(newName, objects.world[newName].damageSprite)
  setRotation(newName, 0)
  setVelocity(newName, objects.world[newName].xVel, objects.world[newName].yVel)
  objects.world[newName].animTimer = 9999
  objects.world[newName].jumpTimer = 9999
  objects.world[newName].animOn = false
  objects.world[newName].isMightyEagle = true
  objects.world[newName].caughtBait = false
  objects.world[newName].dragonLoopEnabled = false
  objects.world[newName].shot = true
  objects.world[newName].particleTimer = 0
  objects.world[newName].particleTimerLimit = 0.025
  objects.world[newName].recordTrajectory = false
  local _ENV = _G.getfenv(1)
  objects.world[newName].collisionFunction = _ENV[blockTable.blocks[objects.world[newName].definition].collisionFunction]
  objects.world[newName].frozenFunction = _ENV[blockTable.blocks[objects.world[newName].definition].frozenFunction]
  objects.world[newName].updateFunction = _ENV[blockTable.blocks[objects.world[newName].definition].updateFunction]
  birds[newName] = objects.world[newName]
  playAudio(getAudioName(blockTable.blocks[objects.world[newName].definition].specialSound))
  birdsCounter = birdsCounter + 1
  currentZoomedScale = objects.castleCameraData[deviceModel].sx
  cameraAnimationSliderTarget = 1
  flyingBird = objects.world[newName]
  setMaxTranslation(5)
  _G.particles.setHardLimit(250)
  _G.particles.setSoftLimit(0, 0.2)
  createMightyDragonTail(baitX, baitY)
  fauxDragonKillTimer = nil
  fauxDragonTimer = nil
  setColliderType(newName, blockDef.collider)
  playAudio("Enter_The_Dragon")
end
function createMightyDragonTail(baitX, baitY)
  local tailBlocks = {}
  for i = 2, 6 do
    local newName = "MightyDragonTail" .. i .. "_a"
    local blockDef = blockTable.blocks["MightyDragonTail" .. i]
    createCircle(newName, blockDef.sprite, levelLimitMinX + 10, baitY - (baitX - levelLimitMinX + 1) / 2, blockDef.radius, blockDef.density, blockDef.friction, blockDef.restitution, true, blockDef.z_order)
    local xp, yp = _G.res.getSpritePivot("INGAME_MIGHTY_DRAGON_1", objects.world[newName].sprite)
    objects.world[newName].targetX = baitX
    objects.world[newName].targetY = baitY
    local velX = objects.world[newName].targetX - objects.world[newName].x
    local velY = objects.world[newName].targetY - objects.world[newName].y
    objects.world[newName].initVelX, objects.world[newName].initVelY = vNormalize(velX, velY)
    objects.world[newName].okGo = false
    objects.world[newName].spritePivotX = xp
    objects.world[newName].spritePivotY = yp
    objects.world[newName].definition = "MightyDragonTail" .. i
    objects.world[newName].controllable = blockDef.controllable
    objects.world[newName].strength = blockDef.strength
    objects.world[newName].defence = blockDef.defence
    objects.world[newName].material = blockDef.material
    objects.world[newName].damageFactors = blockDef.damageFactors
    objects.world[newName].useLegacyCollisionPath = blockDef.useLegacyCollisionPath
    objects.world[newName].levelGoal = false
    objects.world[newName].damageSprite = blockDef.sprite
    objects.world[newName].xVel = 1
    objects.world[newName].yVel = 1
    objects.world[newName].spriteWidth, objects.world[newName].spriteHeight = _G.res.getSpriteBounds(blockDef.sprite)
    if i > 2 then
      objects.world[newName].previousPieceName = "MightyDragonTail" .. i - 1 .. "_a"
    elseif i == 2 then
      objects.world[newName].previousPieceName = "MightyDragon_a"
    end
    objects.world[newName].currentX = levelLimitMinX + 1
    objects.world[newName].currentY = baitY - (baitX - levelLimitMinX + 1) / 2
    setSprite(newName, objects.world[newName].damageSprite)
    setRotation(newName, 0)
    setVelocity(newName, objects.world[newName].xVel, objects.world[newName].yVel)
    objects.world[newName].animTimer = 9999
    objects.world[newName].jumpTimer = 9999
    objects.world[newName].animOn = false
    objects.world[newName].caughtBait = false
    objects.world[newName].dragonLoopEnabled = false
    objects.world[newName].shot = true
    objects.world[newName].particleTimer = 0
    objects.world[newName].particleTimerLimit = 0.025
    objects.world[newName].recordTrajectory = false
    setColliderType(newName, blockDef.collider)
  end
end
function animateMightyDragon(mightyDragon, dt)
  local speed = 90 * dt
  local incrementalAngle = 240 * dt
  local maxLoops = 1
  local frequency = 6
  local amplitude = 50
  local angle = getAngle(mightyDragon.name)
  explodingDragonCheat = true
  if explodingDragonCheat then
    createExplosion(mightyDragon, blockTable.blocks.MightyDragonCreature, nil)
  end
  mightyDragon.phase = mightyDragon.phase - dt * frequency
  local anglePhase = 0
  if mightyDragon.caughtBait == false then
    anglePhase = _G.math.sin(mightyDragon.phase) * (_G.math.pi / 180) * amplitude
  else
    anglePhase = _G.math.sin(mightyDragon.phase) * (_G.math.pi / 180) * (amplitude / 2)
  end
  setVelocity(mightyDragon.name, 1, -1)
  for i = 2, 6 do
    setVelocity("MightyDragonTail" .. i .. "_a", 1, -1)
  end
  mightyDragon.particleTimer = mightyDragon.particleTimer + dt
  local particleAmount = _G.math.floor(mightyDragon.particleTimer / mightyDragon.particleTimerLimit)
  if particleAmount > 0 then
    mightyDragon.particleTimer = _G.math.fmod(mightyDragon.particleTimer, mightyDragon.particleTimerLimit)
    addParticles(mightyDragon.name, "mightyDragonParticles", particleAmount / 2, false, false)
  end
  if mightyDragon.dragonLoopEnabled then
    mightyDragon.phase = 0
    local delta = 0
    if mightyDragon.totalAngle > maxLoops * 360 * -1 or angle > mightyDragon.exitAngle and angle > _G.math.pi / -3 then
      delta = -1 * incrementalAngle * (_G.math.pi / 180)
    else
      mightyDragon.exitAngle = angle
      mightyDragon.dragonLoopEnabled = false
    end
    local newAngle = angle + delta
    mightyDragon.totalAngle = mightyDragon.totalAngle - incrementalAngle
    if 0 > objects.world.ground.y - mightyDragon.y then
      if mightyDragon.aboveGround then
        newAngle = 0
        mightyDragon.aboveGround = false
      end
    else
      mightyDragon.aboveGround = true
    end
    moveMightyDragon(newAngle, speed, mightyDragon)
  else
    eagleHeight = levelStartPosition.y - mightyDragon.y
    eagleHeight = _G.math.max(_G.math.min(eagleHeight, 50), 0)
    if mightyDragon.caughtBait == false then
      local bait = objects.world.BaitGoldenFish_1
      if mightyDragon ~= nil and bait ~= nil and not mightyDragon.caughtBait and (bait.x ~= nil and bait.y ~= nil and bait.x ~= mightyDragon.targetX or bait.y ~= mightyDragon.targetY) then
        mightyDragon.targetX = bait.x
        mightyDragon.targetY = bait.y
      end
      if mightyDragon.currentX >= mightyDragon.targetX then
        mightyDragon.dragonLoopEnabled = true
        mightyDragon.caughtBait = true
        fauxDragonTimer = 0
        return
      end
      local x, y = vNormalize(mightyDragon.targetX - mightyDragon.currentX, mightyDragon.targetY - mightyDragon.currentY)
      local angle = _G.math.atan2(y, x)
      if 0 > objects.world.ground.y - mightyDragon.y then
        if mightyDragon.aboveGround then
          angle = 0
          mightyDragon.aboveGround = false
        end
      else
        mightyDragon.aboveGround = true
      end
      moveMightyDragon(angle + anglePhase, speed, mightyDragon)
    elseif mightyDragon.caughtBait == true then
      local angle = mightyDragon.exitAngle
      if 0 > objects.world.ground.y - mightyDragon.y then
        if mightyDragon.aboveGround then
          angle = 0
          mightyDragon.aboveGround = false
        end
      else
        mightyDragon.aboveGround = true
      end
      moveMightyDragon(angle + anglePhase, speed, mightyDragon)
    end
  end
  for i = 2, 6 do
    local tailPieceName = "MightyDragonTail" .. i .. "_a"
    tailPiece = objects.world[tailPieceName]
    if tailPiece ~= nil then
      local previousTailPiece = objects.world[tailPiece.previousPieceName]
      if previousTailPiece ~= nil then
        local distanceX = previousTailPiece.currentX - tailPiece.currentX
        local distanceY = previousTailPiece.currentY - tailPiece.currentY
        local newAngle = _G.math.atan2(distanceY, distanceX)
        if (vLength(distanceX, distanceY) >= 8 or i == 6 and vLength(distanceX, distanceY) >= 4) and not tailPiece.okGo then
          tailPiece.okGo = true
        elseif tailPiece.okGo then
          setRotation(tailPiece.name, newAngle)
          velVectorX, velVectorY = calculateSpeedComponentsFromRadians(newAngle)
          local distance = 3
          if i ~= 6 then
            distance = 6
          end
          local norX, norY = vNormalize(distanceX, distanceY)
          tailPiece.currentX = previousTailPiece.currentX - norX * distance
          tailPiece.currentY = previousTailPiece.currentY - norY * distance
          setPosition(tailPiece.name, tailPiece.currentX, tailPiece.currentY)
        end
      end
    end
  end
end
function moveMightyDragon(angle, speed, mightyDragon)
  velVectorX, velVectorY = calculateSpeedComponentsFromRadians(angle)
  mightyDragon.currentX = mightyDragon.currentX + velVectorX * speed
  mightyDragon.currentY = mightyDragon.currentY + velVectorY * speed
  setRotation(mightyDragon.name, angle)
  setPosition(mightyDragon.name, mightyDragon.currentX, mightyDragon.currentY)
end
function updateMightyBaitFish(v, dt)
  if flyingBird ~= nil and flyingBird.definition == "BaitGoldenFish" and flyingBird.collision == true and flyingBird.dragonTimer == nil then
    flyingBird.dragonTimer = 2
    flyingBird.oAngle = flyingBird.angle
  end
  if v.shot == true then
    if v.angularVelocity == nil then
      v.angularVelocity = 0
    end
    if v.hasCollided ~= true and v.hitWater ~= true then
      v.angularVelocity = v.angularVelocity + dt * 10
      if v.angularVelocity > 20 then
        v.angularVelocity = 20
      end
      setAngularVelocity(v.name, v.angularVelocity)
    end
  end
  if v.dragonTimer then
    if v.dragonTimer > 0 then
      v.dragonTimer = v.dragonTimer - dt
    else
      v.dragonTimer = nil
      birdSpecialtyAvailable = false
      eagleMoving = false
      spawnMightyDragon(v.x, v.y)
    end
  end
end
function updateMightyDragonTimer(dt)
  if fauxDragonKillTimer ~= nil and fauxDragonKillTimer > 0 then
    fauxDragonKillTimer = fauxDragonKillTimer - dt
    if fauxDragonKillTimer <= 0 then
      for k, v in _G.pairs(objects.world) do
        if v.strength ~= nil and v.levelGoal then
          v.strength = 0
          deadBlocks[k] = v
        end
      end
      eagleTimer = -1
    end
  end
  if fauxDragonTimer ~= nil then
    fauxDragonTimer = fauxDragonTimer - dt
    if 0 > fauxDragonTimer then
      triggerEarthQuake("mighty_eagle_thump")
      fauxDragonKillTimer = 2
      fauxDragonTimer = nil
    end
  end
  if cameraShake ~= nil and 0 < cameraShake then
    cameraShake = _G.math.max(cameraShake - cameraShake * dt * 2.2, 0)
    if cameraShake < 0.01 then
      cameraShake = nil
    end
  end
end
function mightyDragonBaitFishFrozen(v)
  eagleX, eagleY = v.x, v.y
  if v.isMightyBait and dragonTimer == nil then
    fauxDragonTimer = 3
    eagleMoving = true
    playAudio("Enter_The_Dragon")
  end
end
function mightyDragonFrozen(v)
  for b = 2, 6 do
    local name = "MightyDragonTail" .. b .. "_a"
    removeObject(name)
    objects.world[name] = nil
    levelGoals[name] = nil
  end
  local name = "MightyDragon_a"
  if not v.caughtBait then
    triggerEarthQuake("mighty_eagle_thump")
  end
end
function mightyDragonCollision(object1, object2)
  local obj1 = objects.world[object1]
  local obj2 = objects.world[object2]
  if obj2.isMightyBait then
    obj2.strength = 0
    deadBlocks[object2] = obj2
    birds[object2] = nil
  elseif 0 > objects.world.ground.y - obj1.y or object2 == "ground" then
    mightyDragonGroundCollision(object1)
  end
  if (obj1.frozen or obj2.frozen) and not obj1.dragonLoopEnabled and not obj2.dragonLoopEnabled then
    print("Enabling whoop-da-loop")
    if obj1.isMightyEagle then
      obj1.caughtBait = true
      obj1.dragonLoopEnabled = true
      playAudio("dragon_loop")
    elseif obj2.isMightyEagle then
      obj2.caughtBait = true
      obj2.dragonLoopEnabled = true
      playAudio("dragon_loop")
    end
  end
end
function mightyDragonGroundCollision(object1)
  objects.world[object1].hitGround = true
  local bDef = getObjectDefinition(objects.world[object1].name)
  objects.world[object1].sprite = bDef.spriteCollision
  setSprite(object1, objects.world[object1].sprite)
  triggerEarthQuake("mighty_eagle_thump")
  eagleTimer = 4
end
function mightyDragonBaitFishCollision(object1, object2)
  local obj1 = objects.world[object1]
  local obj2 = objects.world[object2]
  if objects.world[object2].isMightyEagle then
    obj1.strength = 0
    deadBlocks[object1] = objects.world[object1]
    birds[object1] = nil
  elseif (obj1.frozen or obj2.frozen) and not obj1.dragonLoopEnabled and not obj2.dragonLoopEnabled then
    print("Enabling whoop-da-loop")
    obj1.caughtBait = true
    obj1.dragonLoopEnabled = true
    playAudio("dragon_loop")
  end
end
function triggerEarthQuake(soundClip)
  playAudio(soundClip)
  cameraShake = 100
  for k, v in _G.pairs(objects.world) do
    if v.strength ~= nil and v.levelGoal then
      local force = -v.mass * 15
      applyImpulse(v.name, 0, force, v.x, v.y)
      v.strength = 1.0E-4
      v.defence = 0
    elseif v.isMightyBait then
      v.strength = 0
    elseif v.material == "cookie" then
      v.strength = 0
    end
  end
  destroyJoints = true
end
function calculateSpeedComponentsFromRadians(angle)
  return _G.math.cos(angle), _G.math.sin(angle)
end
filename = "mightyDragon.lua"
