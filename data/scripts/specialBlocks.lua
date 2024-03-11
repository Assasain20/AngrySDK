function playAnimation(k, dt)
  local object 		    = objects.world[k]
  local animationInfo   = getObjectDefinition(k).animationSprites  
  local simpleAnimation = (animationInfo.timePerSprite~=nil)  
  if object.elapsedTime == nil then
	  if simpleAnimation then
		object.elapsedTime = animationInfo.timePerSprite
		setSprite(object.name, animationInfo[1])
	  else
		object.elapsedTime = animationInfo[1][2]
		setSprite(object.name, animationInfo[1][1])
	  end
  end    
    local spritesAmount  = #animationInfo    
    if object.spriteIndex == nil then
      object.spriteIndex = 2	
    end    
    object.elapsedTime = object.elapsedTime - dt					
    if object.elapsedTime < 0 then
      if object.spriteIndex > spritesAmount then
        object.spriteIndex = 1		
      end	  
	  if simpleAnimation then
		object.elapsedTime = animationInfo.timePerSprite
		setSprite(object.name, animationInfo[object.spriteIndex])
	  else
		object.elapsedTime = animationInfo[object.spriteIndex][2]
		setSprite(object.name, animationInfo[object.spriteIndex][1])		
	  end      
      object.spriteIndex = object.spriteIndex+1
    end
end

function playAudioOfObject(k, dt, dist)

	local objDef 		= getObjectDefinition(k)
	local object 		= objects.world[k]
	local audioInfo 	= objDef.audioInfo
	
	local alwaysPlay    = audioInfo.alwaysPlay or false
	-- If alwaysPlay is true then it won't check the distance of the audio
	local checkDistance = not alwaysPlay	
	
	local loopAudio 	= audioInfo.loop or false	
	local audioToPlay 	= audioInfo.audio or "bird_01_flying"
	local audioVolume 	= audioInfo.volume or 1
	
	if object.alreadyDisabledAudio == nil then
		object.alreadyDisabledAudio = false
	end
	
	if object.alreadyDisabledAudio == false then
		if checkDistance == true then
			audioVolume = audioVolume - dist / 1000
			if audioVolume > 0 then
				object.playAudio = true
			else
				if _G.res.isAudioPlaying(audioToPlay) == true then
					_G.res.stopAudio(audioToPlay)
					object.alreadyDisabledAudio = true
				end
				object.playAudio = false
			end		
		else
			object.playAudio = true
		end
	end
	
	if object.playAudio == true then
		if loopAudio == true then
			if _G.res.isAudioPlaying(audioToPlay) == false then
				_G.res.playAudio(audioToPlay, audioVolume, false, 4)
			end
		else
			local audioLoopTime = audioInfo.loopTime or 1
		
			if object.elapsedAudioTime == nil then				
				object.elapsedAudioTime = audioLoopTime
				if audioInfo.playImmediately == true then
					_G.res.playAudio(audioToPlay, audioVolume, false, 4)
				end
			end
			if object.elapsedAudioTime ~= nil then		
				object.elapsedAudioTime = object.elapsedAudioTime - dt
				if object.elapsedAudioTime <= 0 then
					object.elapsedAudioTime = audioLoopTime
					_G.res.playAudio(audioToPlay, audioVolume, false, 4)
				end
			end
		end
	end
end
function explosionShakeOfObject(k, v, dt)
	local objDef = getObjectDefinition(k)
	local shakeInfo = objDef.shakeInfo
	local shakeIntensity 	= shakeInfo.intensity
	local shakeDuration 	= shakeInfo.duration
	local gapBetweenShake 	= shakeInfo.gap
	local waitingTime  		= shakeInfo.waitingTime
	if gapBetweenShake < 0 then
		gapBetweenShake = 0
	end
	if v.elapsedShakeTime == nil then		
		blockShakeDuration, blockShakeAmount = 0, 0
	end
	v.elapsedShakeTime = startTimer(v.elapsedShakeTime, waitingTime, dt)	
	if v.elapsedShakeTime <= 0 then
		v.elapsedShakeTime = gapBetweenShake + shakeDuration
		blockShakeDuration = shakeDuration
		blockShakeAmount = shakeIntensity
	end	
end
function spawnParticlesOfObject(k, v, dt)
	local info 			= getObjectDefinition(k).spawnParticles	
	local particle 	    = info.particle
	local amount 		= _G.math.abs(info.amount) or 1
	local loopTime  	= _G.math.abs(info.loopTime) or 1
	local waitingTime  	= _G.math.abs(info.waitingTime) or 1	
	v.elapsedParticleTime = startTimer(v.elapsedParticleTime, waitingTime, dt)	
	if v.elapsedParticleTime <= 0 then
		v.elapsedParticleTime = loopTime
		if getObjectDefinition(k).offCenterParticle ~= nil then
			offCenteredParticle(v.name, particle, amount, true, false)
		else
			addParticles(v.name, particle, amount, true, false)
		end
	end
end
function startTimer(timer, baseValue, dt)
	if timer == nil then	
		timer = baseValue
	end
    timer = timer - dt
	return timer
end
function rotateObject(k, dt)

	local objDef 	 = getObjectDefinition(k)
	local object 	 = objects.world[k]
	local rotateInfo = objDef.rotation
	
	if rotateInfo.startASAP or isPhysicsEnabled() then	
		if object.startedRotation ~= true then
			if rotateInfo.randomSpeedLimits ~= nil then			
				object.rotateSpeed = randomValue(rotateInfo.randomSpeedLimits)
			else
				object.rotateSpeed = rotateInfo.speed or 1
			end
			if rotateInfo.randomStartAngleLimits ~= nil then
				setRotation(object.name, randomValue(rotateInfo.randomStartAngleLimits))			
			end
			if rotateInfo.randomDirection == true then
				object.rotateDirection = positiveOrNegative()
			else
				object.rotateDirection = 1
			end
			object.startedRotation = true
		end	
		
		
		if rotateInfo.loopRotation == true then
			if object.angledt == nil then
				object.originalAngle = object.angle
				object.angledt = 0
				if rotateInfo.randomLoopRadiansLimits ~= nil then
					object.rotateRadians = randomValue(rotateInfo.randomLoopRadiansLimits)
				else
					object.rotateRadians = rotateInfo.loopRadians
				end
			end
			object.angledt = object.angledt-(object.rotateSpeed*dt)
			setRotation(object.name, object.originalAngle + object.rotateDirection*object.rotateRadians*(_G.math.cos(object.angledt)+_G.math.sin(object.angledt)))
		else
			setRotation(object.name, object.angle + (dt)*(object.rotateSpeed)*(object.rotateDirection))
		end
    end			
	--[[if rotateInfo.loopTime ~= nil then
		if object.elapsedRotatingTime == nil then
			object.elapsedRotatingTime = rotateInfo.loopTime
			object.rotateDirection = 1
			object.angledt = 0
		end
		object.elapsedRotatingTime = object.elapsedRotatingTime - dt
		object.angledt = object.angledt-(speed*dt)
		if object.elapsedRotatingTime < 0 then
			--object.allowRotation = true
			object.elapsedRotatingTime = rotateInfo.loopTime
			object.rotateDirection = object.rotateDirection * (-1)
		end
		
		--if object.allowRotation then
			setRotation(object.name, object.angle + (dt)*(speed)*(object.rotateDirection))
		--end
	else
		setRotation(object.name, object.angle + (dt)*(speed))
	end]]--
	--[[if rotateInfo.backAndForth == true then
		
		if object.initialAngle == nil then
			object.initialAngle = object.angle
		end		
		local direction = 1
		local extraAngle = rotateInfo.extraAngle
		if object.angle >= (object.initialAngle + extraAngle) then
			direction = -1
		elseif object.angle <= (object.initialAngle - extraAngle) then
			direction = 1
		end		
		setRotation(object.name, object.angle + (dt*speed*direction))	
	else
		setRotation(object.name, object.angle + (dt)*(speed))	
	end]]
	
	
	
end
function insideBlockArea(xLimits, yLimits, centerBlock, randomBlock) --Block is v
	local centerX, centerY 	= centerBlock.x, -centerBlock.y
	local leftX 			= centerX - _G.math.abs(xLimits[1])
	local rightX 			= centerX + _G.math.abs(xLimits[2])
	local topY 				= centerY + _G.math.abs(yLimits[1])
	local bottomY 			= centerY - _G.math.abs(yLimits[2])
	local areaBorders 		= {leftX, rightX, topY, bottomY}
	local blockCoordinates	= {randomBlock.x, -randomBlock.y}
	return insideRectangle(areaBorders, blockCoordinates)
end
function insideRectangle(borders, targetPos)
	local x, y = targetPos[1], targetPos[2]
	local left, right = borders[1], borders[2]
	local top, bottom = borders[3], borders[4]
	if x > left and x < right and y < top and y > bottom then
		return true
	else
		return false
	end
end
function distanceAudio(v, audio)
	if audio ~= nil and audio ~= "" then
		local lsx, lsy = physicsToWorldTransform(v.x, v.y)
		local dist = vLength(screen.x - lsx, screen.y - lsy)
		local volume = 1 - dist / 1000
		if volume > 0 then
			playAudio(getAudioName(audio), volume, false, 4)
		end
	end
end
function playEntityAnimation(k, dt)
	local object 		  	    = objects.world[k]
	local entityAnimationData   = getObjectDefinition(k).entityAnimation
	local damageStateInfo = getObjectDefinition(k).damageStateAnimations
	local percentage 		    = object.strength / blockTable.blocks[object.definition].strength * 100	
	local damageState = nil
	
	for k0, v0 in _G.pairs(damageStateInfo.damageStatelimits) do
		if percentage <= damageStateInfo.damageStatelimits[k0][1] and percentage >= damageStateInfo.damageStatelimits[k0][2] then
			damageState = k0
		end
	end
	
	if object.damageState ~= damageState then
		object.damageState = damageState
		setSprite(object.name, damageStateInfo.damageStateSprites[object.damageState] or "")
		object.elapsedEntityTime = nil
		object.elapsedEntityAnimationTime = nil
		object.animationStage = "pickingGap"
		object.loopAmount = 1
	end
	
	if entityAnimationData.failedAnimation ~= nil then
		if checkLevelFailed() then
			object.animationStage = "failedAnimation"
			object.elapsedEntityTime = nil
			object.elapsedEntityAnimationTime = nil
		end
		if object.animationStage == "failedAnimation" then
			local failedAnimation = entityAnimationData.failedAnimation[object.damageState]
			if object.elapsedLevelFailedTime == nil then
				setSprite(object.name, failedAnimation[1][1])
				object.elapsedLevelFailedTime = failedAnimation[1][2]
				--_G.res.playAudio(failedAnimation[1][3] or "", 1, false, 4)
				object.failedAnimationIndex = 1
			end
			object.elapsedLevelFailedTime = object.elapsedLevelFailedTime - dt
			if object.elapsedLevelFailedTime <= 0 then
				if object.failedAnimationIndex > #failedAnimation then
					object.failedAnimationIndex = 1
				end
				local failedData = failedAnimation[object.failedAnimationIndex]
				setSprite(object.name, failedData[1])
				object.elapsedLevelFailedTime = failedData[2]
				distanceAudio(object, failedData[3])	
				object.failedAnimationIndex = object.failedAnimationIndex + 1
			end
		end
	end
	if object.animationStage ~= "playingAnimation" and object.animationStage ~= "failedAnimation" then
		if object.elapsedEntityTime == nil then
			setSprite(object.name, damageStateInfo.damageStateSprites[damageState] or "")
			object.randomGapTime = (_G.math.random(entityAnimationData.gap[1], entityAnimationData.gap[2]))/10
			object.elapsedEntityTime = object.randomGapTime
		end
		
		object.elapsedEntityTime = object.elapsedEntityTime - dt
	
		if object.elapsedEntityTime <= 0 then
			object.pickedAnimation = _G.math.random(1, #damageStateInfo[damageState])
			local loopAmountLimits = damageStateInfo[damageState][object.pickedAnimation].loopAmount
			object.loopAmount = _G.math.random(loopAmountLimits[1], loopAmountLimits[2])
			object.animationStage = "playingAnimation"
		end
	end
	if object.animationStage == "playingAnimation" and object.loopAmount > 0 then
		
		if object.elapsedEntityAnimationTime==nil then
			--setSprite(object.name, entityAnimationData[object.pickedAnimation][1][1])
			object.elapsedEntityAnimationTime = damageStateInfo[damageState][object.pickedAnimation][1][2]
			--_G.res.playAudio(entityAnimationData[damageState][object.pickedAnimation][1][3] or "", 1, false, 4)
			object.currentAnimationFrameIndex = 1						
		end
		
		local animationInfo = damageStateInfo[damageState][object.pickedAnimation]
		local spritesAmount = #animationInfo
		object.elapsedEntityAnimationTime = object.elapsedEntityAnimationTime - dt
		
		if object.elapsedEntityAnimationTime <= 0 then
			
			if object.currentAnimationFrameIndex > spritesAmount then
				object.currentAnimationFrameIndex = 1
				object.loopAmount = object.loopAmount - 1
			end
			
			if object.loopAmount ~= 0 then
				local animationFrameData = animationInfo[object.currentAnimationFrameIndex]
				setSprite(object.name, animationFrameData[1])
				object.elapsedEntityAnimationTime = animationFrameData[2]
				distanceAudio(object, animationFrameData[3])
				object.currentAnimationFrameIndex = object.currentAnimationFrameIndex+1
			end
			
		end
	end
	if object.loopAmount == 0 then
		object.elapsedEntityTime = nil
		object.elapsedEntityAnimationTime = nil
		object.animationStage = "pickingGap"
		object.loopAmount = 1 --So it doesnt execute this part again
	end	
end
function damageStateParticles(k, dt)
	local object = objects.world[k]
	local particlesArray = getObjectDefinition(k).damageStateParticles
	local waitingTime = getObjectDefinition(k).waitingDmgStateParticleTime
	local percentage = object.strength / blockTable.blocks[object.definition].strength * 100	
	
	if object.startSpawningParticles == nil then
		if object.particleTime == nil then
			object.particleTime = waitingTime
		end
		if object.particleTime ~= nil then
			object.particleTime = object.particleTime - dt
			if object.particleTime <= 0 then
				object.startSpawningParticles = true				
			end
		end
	end
	
	if object.startSpawningParticles == true then
		local damageState = nil		
		for k0, v0 in _G.pairs(particlesArray) do
			if percentage <= particlesArray[k0].max and percentage >= particlesArray[k0].min then
				damageState = k0
			end
		end		
		if object.particleState ~= damageState then
			object.particleState = damageState
			object.particleTime = nil
		end
		if object.particleTime == nil then
			if particlesArray[object.particleState].loopTime == nil and particlesArray[object.particleState].min < 0 and #particlesArray == 1 then
				crashLog(object.definition .. " is missing info: Looptime")
			end
			object.particleTime = particlesArray[object.particleState].loopTime or 1
		end
		object.particleTime = object.particleTime - dt
		if object.particleTime <= 0 then
			local pickedParticle = particlesArray[object.particleState]
			object.particleTime = pickedParticle.loopTime
			if pickedParticle.particle ~= "" and pickedParticle.particle ~= nil then
				addParticles(object.name, pickedParticle.particle, pickedParticle.amount or 1, true, false)
			end
		end		
	end
	
end
function positiveOrNegative()
	return (_G.math.random(0,1))*2 - 1
end
function tableContains(table, element)
	if table ~= nil then
		for i=1, #table do
			if table[i] == element then
				return true
			end
		end
	end
	return false
end
function getObjectPercentage(object)
	return object.strength / blockTable.blocks[object.definition].strength * 100	
end
function randomValue(array)
	return _G.math.random(array[1]*100, array[2]*100)/100
end
function crashLog(string)
	_G.error(string.."\n"..[[
Lines related to this error:]])
end
function destroyObject(k, v, dt, destroySpeed)
	if _G.type(destroySpeed) == "number" then
		if v.controllable == true then
			removeBird(v)
		else
			v.strength = v.strength - dt*destroySpeed
			local sprites = getDamageSprite(v, blockTable.blocks)
			v.damageSprite = sprites.sprite
			v.blinkSprite = sprites.blink
			v.smileSprite = sprites.smile
			if 0 >= v.strength then
				deadBlocks[k] = v
			end
		end
	else
		if v.controllable == true then
			removeBird(v)
		else
			v.strength = 0
			deadBlocks[k] = v
		end
	end
end
function objectMeetsRequirement(object, requirementInfo)
	local requirements = requirementInfo
	
	if requirements.birds then
		if object.levelGoal ~= true and object.controllable then return true end
	end
	if requirements.levelGoals then
		if object.levelGoal and object.controllable ~= true then return true end
	end
	if object.levelGoal ~= true and object.controllable == false and requirements.blocks then
		return true
	else
		return false
	end	
	
	--[[if (object.controllable == requirements.birds) and (object.levelGoal ~= true) and requirements.blocks then
		return true
	elseif (object.levelGoal == requirements.levelGoals) and (object.controllable ~= true) then
		return true
	elseif (object.controllable ~= true) and (object.levelGoal ~= true) and requirements.blocks then
		return true
	else
		return false
	end]]
end
function offCenteredParticle(object, particle, amount, ignoreLimits, menu)
  local obj = objects.world[object]
  if obj == nil then
    return
  end
  local x, y = physicsToWorldTransform(obj.x, obj.y)
	local offCenter = getObjectDefinition(object).offCenterParticle or {0, 0}
	x = x + offCenter.x * physicsToWorld
	y = y + offCenter.y * physicsToWorld
  local w, h = offCenter.w * physicsToWorld, offCenter.h * physicsToWorld
  if particle ~= nil and particle[1] then
    for i = 1, #particle do
      if particleTable.particles[particle[i]].amount then
        amount = particleTable.particles[particle[i]].amount
      end
      newParticles(particle[i], amount, x, y, w, h, getAngle(obj.name), ignoreLimits, menu)
    end
  else
    newParticles(particle, amount, x, y, w, h, getAngle(obj.name), ignoreLimits, menu)
  end
end
function returnNumberOrRandom(value)
	if _G.res.type(value) == "number" then
		return value
	else
		return (_G.math.random(value[1], value[2]))
	end
end