ProcessManager = {}
function ProcessManager:new(o)
  o = o or {}
  o.x = o.x or 0
  o.y = o.y or 0
  o.name = "ProcessManager"
  _G.setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end
function ProcessManager:start()
  self.running = true
  self.elapsed = 0
end
function ProcessManager:reset()
  self.running = false
  self.elapsed = 0
  for k, v in _G.pairs(self.actions) do
    loginfo("ProcessManager:reset() finished process : " .. _G.tostring(v.name))
    if v.onFinish then
      v.onFinish()
    end
    eventManager:notify({
      id = events.EID_PROCESS_FINISHED,
      target = v
    })
  end
  self.actions = {}
end
function ProcessManager:init()
  self.elapsed = 0
  self.actions = {}
  self.running = false
end
function ProcessManager:running()
  return self.running
end
function ProcessManager:resetProcess(id)
  for k, v in _G.pairs(self.actions) do
    if v.id == id and id ~= nil then
      v.finished = true
      if v.onFinish then
        v.onFinish()
      end
      loginfo("ProcessManager:resetProcess(id) finished process : " .. _G.tostring(v.name))
      eventManager:notify({
        id = events.EID_PROCESS_FINISHED,
        v
      })
    end
  end
end
function ProcessManager:insertAction(action)
  _G.table.insert(self.actions, action)
end
function ProcessManager:update(dt, time)
  if self.running ~= true then
    return
  end
  self.elapsed = self.elapsed + dt
  local allFinished = true
  for k, v in _G.pairs(self.actions) do
    local elapsedForAction = self.elapsed - v.start
    if v.finished == false then
      allFinished = false
    end
    if elapsedForAction > v.duration and v.finished == false then
      elapsedForAction = v.duration
      v.action(v.item, elapsedForAction, v.duration, dt, v.meta)
      v.finished = true
      if v.onFinish then
        v.onFinish()
      end
    end
    if v.start <= self.elapsed and not v.finished then
      v.action(v.item, elapsedForAction, v.duration, dt, v.meta)
    end
  end
  if #self.actions > 0 and allFinished then
    self:reset()
  end
end
filename = "ProcessManager.lua"
