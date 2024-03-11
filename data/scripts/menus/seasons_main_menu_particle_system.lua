MainMenuParticleSystem = {}
function MainMenuParticleSystem:new(o)
  o = o or {}
  o.firstFrame = true
  o.theme = settingsWrapper:getCurrentMainMenuTheme()
  o.particleTimer = 0
  _G.setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end
function MainMenuParticleSystem:init()
end
function MainMenuParticleSystem:setFirstFrame(value)
  self.firstFrame = value or true
end
function MainMenuParticleSystem:layout()
  self.theme = settingsWrapper:getCurrentMainMenuTheme()
  if self.firstFrame then
    self.firstFrame = false
    if blockTable.themes[self.theme].particles then
      local particles = blockTable.themes[self.theme].particles
      if not particles.callFunction then
        _G.particles.addParticles(particles.name, particles.firstAmount or 100, screenWidth / 2, screenHeight / 2, screenWidth, screenHeight, 0, true, true)
      elseif particles.initFunction then
        self[particles.initFunction](self)
      end
    end
  end
end
function MainMenuParticleSystem:update(dt, time)
  if blockTable.themes[self.theme].particles then
    local particles = blockTable.themes[self.theme].particles
    if not particles.callFunction then
      self.particleTimer = self.particleTimer + dt
      local delay = particles.delay or 1
      if delay < self.particleTimer then
        local widthMultiplier = particles.widthMultiplier or 1
        self.particleTimer = 0
        _G.particles.addParticles(particles.name, particles.amount or 10, screenWidth / 2, -10, screenWidth * widthMultiplier, 1, 0, true, true)
      end
    else
      self[particles.callFunction](self, dt, time)
    end
  end
end
function MainMenuParticleSystem:initHalloweenBats()
  self.particleTimer = 3
end
function MainMenuParticleSystem:drawHalloweenBats(dt, time)
  self.particleTimer = self.particleTimer + dt
  if self.particleTimer > 3 then
    self.particleTimer = 3 - _G.math.random(8, 14) * 0.1
    local particle = "menuBatsRight"
    local posX, posY = _G.math.floor(screenWidth / 10 + _G.math.random(screenWidth * 0.8)), screenHeight
    if posX < _G.math.floor(screenWidth / 2) then
      particle = "menuBatsLeft"
    end
    _G.particles.addParticles(particle, 1, posX, posY, 0, 0, 0, true, true)
  end
end
function MainMenuParticleSystem:firstSummerButterflies()
  local butterflies = {
    "butterflyMainMenuL2R_Red",
    "butterflyMainMenuR2L_Red",
    "butterflyMainMenuL2R_Blue",
    "butterflyMainMenuR2L_Blue"
  }
  for _, v in _G.ipairs(butterflies) do
    local minVel = (screenWidth + 50) / particleTable.particles[v].lifeTime
    if _G.string.find(v, "R2L") then
      particleTable.particles[v].emitter_box.minVelX = -minVel
    else
      particleTable.particles[v].emitter_box.minVelX = minVel
    end
    particleTable.particles[v].emitter_box.maxVelX = 2 * particleTable.particles[v].emitter_box.minVelX
  end
  _G.particles.addParticles("butterflyMainMenuL2R_Red", 1, screenWidth / 2, screenHeight / 2, screenWidth, screenHeight, 0, true, true)
  _G.particles.addParticles("butterflyMainMenuR2L_Red", 1, screenWidth / 2, screenHeight / 2, screenWidth, screenHeight, 0, true, true)
  _G.particles.addParticles("butterflyMainMenuL2R_Blue", 1, screenWidth / 2, screenHeight / 2, screenWidth, screenHeight, 0, true, true)
  _G.particles.addParticles("butterflyMainMenuR2L_Blue", 1, screenWidth / 2, screenHeight / 2, screenWidth, screenHeight, 0, true, true)
end
function MainMenuParticleSystem:spawnSummerButterflies(dt, time)
  self.particleTimer = self.particleTimer + dt
  if self.particleTimer > 3 then
    self.particleTimer = 0
    _G.particles.addParticles("butterflyMainMenuL2R_Red", 1, -10, screenHeight / 2, 5, screenHeight, 0, true, true)
    _G.particles.addParticles("butterflyMainMenuR2L_Red", 1, screenWidth + 10, screenHeight / 2, 5, screenHeight, 0, true, true)
    _G.particles.addParticles("butterflyMainMenuL2R_Blue", 1, -10, screenHeight / 2, 5, screenHeight, 0, true, true)
    _G.particles.addParticles("butterflyMainMenuR2L_Blue", 1, screenWidth + 10, screenHeight / 2, 5, screenHeight, 0, true, true)
  end
end
function MainMenuParticleSystem:spawnDragonFireworks(dt, time)
  self.particleTimer = self.particleTimer + dt
  if self.particleTimer > 3 then
    self.particleTimer = 0
    if _G.math.random(10) < 5 then
      self.particleTimer = 3 - _G.math.random(4, 7) * 0.1
    else
      self.particleTimer = _G.math.random() * 0.25 * 3
    end
    local posX, posY = _G.math.floor(screenWidth / 4 + _G.math.random(screenWidth / 2)), _G.math.floor(screenHeight / 4 + _G.math.random(screenHeight / 4))
    _G.particles.addParticles("fireworksMenu", 40, posX, posY, 0, 0, 0, true, true)
    playAudio(getAudioName("fireworks"), 1, false)
  end
end
filename = "seasons_main_menu_particle_system.lua"
