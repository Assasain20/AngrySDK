function playAnimation(k, dt)
  local objDef = getObjectDefinition(k)
  local object = objects.world[k]
  if object.elapsedTime == nil then				
    object.elapsedTime = 0
  end				
  if object.elapsedTime ~= nil then
  
    local animationSprites  = objDef.animationSprites				
    local timeBetweenSprite = objDef.timeBetweenSprite					
    local spritesAmount     = #animationSprites
    
    if object.spriteIndex == nil then
      object.spriteIndex = 1	
    end
    
    object.elapsedTime = object.elapsedTime + dt					
    if object.elapsedTime >= (timeBetweenSprite) then
      --setVelocity(v1.name, 0, -10)
      if object.spriteIndex > spritesAmount then
        object.spriteIndex = 1
      end
      setSprite(object.name, animationSprites[object.spriteIndex])
      object.elapsedTime = 0
      object.spriteIndex = object.spriteIndex+1
    end
  end
end