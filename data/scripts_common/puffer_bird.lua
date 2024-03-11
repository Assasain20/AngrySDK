function triggerPufferSpecialty(object)
  local def = blockTable.blocks[object.definition]
  removeObjectUpdateFunction(object, pufferDelayTimer)
  object.puffTimer = def.puffTime
  setFriction(object.name, def.puffedValues.friction)
  setRestitution(object.name, def.puffedValues.restitution)
  setDensity(object.name, def.puffedValues.density)
  object.damageFactors = def.puffedValues.damageFactors
  object.sprite = def.spriteSpecial
  setSprite(object.name, def.spriteSpecial)
  resizeCircle(object.name, def.puffedValues.radius)
  makeExplosion(object, getObjectDefinition(object.name), nil)
  addObjectUpdateFunction(object, pufferTimer)
  playAudio(getAudioName(def.specialSound), 1, false)
end
function flyingPufferCollided(object)
  if birdSpecialtyAvailable then
    local def = blockTable.blocks[object.definition]
    object.puffTimer = def.automaticPuffDelay
    addObjectUpdateFunction(object, pufferDelayTimer)
  end
end
function pufferDelayTimer(object, dt)
  object.puffTimer = object.puffTimer - dt
  if object.puffTimer <= 0 then
    triggerBirdSpecialty(dt)
  end
end
function pufferTimer(object, dt)
  object.puffTimer = object.puffTimer - dt
  if object.puffTimer <= 0 then
    object.puffTimer = nil
    removeObjectUpdateFunction(object, pufferTimer)
    local def = blockTable.blocks[object.definition]
    object.deathTimer = def.deathTime
    object.directionChangeTimer = def.directionChangeTime
    addObjectUpdateFunction(object, pufferDeath)
    playAudio(getAudioName(def.removeSound), 1, false)
  end
end
function pufferDeath(object, dt)
  local def = blockTable.blocks[object.definition]
  object.directionChangeTimer = object.directionChangeTimer - dt
  if object.directionChangeTimer <= 0 then
    object.xVel = object.xVel + _G.math.random(-def.directionChangeMagnitude, def.directionChangeMagnitude)
    object.yVel = object.yVel + _G.math.random(-def.directionChangeMagnitude, def.directionChangeMagnitude)
    setRotation(object.name, _G.math.atan2(-object.xVel, object.yVel) - _G.math.pi * 0.5)
    setVelocity(object.name, object.xVel, object.yVel)
    object.directionChangeTimer = def.directionChangeTime
  end
  object.deathTimer = object.deathTimer - dt
  if 0 >= object.deathTimer then
    removeBird(object)
  else
    local scale = object.deathTimer / def.deathTime
    resizeCircle(object.name, def.puffedValues.radius * scale)
    setScale(object.name, scale, scale)
  end
end
filename = "puffer_bird.lua"
