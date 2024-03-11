EventManager = {}
function EventManager:new(o)
  o = o or {}
  o.name = "EventManager"
  _G.setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end
function EventManager:init()
  self.eventListeners = {}
  self.queuedEvents = {}
  self.useBufferedQueue = false
  self.bufferedEvents = {}
end
function EventManager:tick()
  self.useBufferedQueue = true
  for i = 1, #self.queuedEvents do
    self:notify(self.queuedEvents[i])
  end
  self.useBufferedQueue = false
  self.queuedEvents = {}
  for i = 1, #self.bufferedEvents do
    _G.table.insert(self.queuedEvents, self.bufferedEvents[i])
  end
  self.bufferedEvents = {}
end
function EventManager:addEventListener(eventId, listener)
  _G.assert(eventId ~= nil, "event id was nil at EventManager:addEventListener, listener name =  " .. _G.tostring(listener.name))
  _G.assert(listener ~= nil, "listener was nil at EventManager:addEventListener, eventId = " .. eventId)
  if not listener.eventTriggered then
    gamelua.print("---  ERROR, listener must implement eventTriggered(event)!\n")
    _G.assert(listener.eventTriggered, " listener must implement eventTriggered(event) ")
  end
  for k, v in _G.pairs(self.eventListeners) do
    if k == eventId then
      for k1, v1 in _G.pairs(v) do
        if v1 == listener then
          gamelua.print("---  ERROR, attempted to add same listener twice \n")
          _G.assert(v1 ~= listener, "---  ERROR, attempted to add same listener twice, eventId = " .. eventId)
        end
      end
    end
  end
  local listeners = self.eventListeners[eventId]
  if listeners == nil then
    self.eventListeners[eventId] = {}
  end
  _G.table.insert(self.eventListeners[eventId], listener)
end
function EventManager:removeEventListener(eventId, listener)
  _G.assert(eventId ~= nil)
  _G.assert(listener ~= nil)
  if self.eventListeners[eventId] == nil or #self.eventListeners[eventId] == 0 then
    gamelua.print("ERROR: attempted to remove a nonexistant listener for event " .. eventId .. "\n")
    _G.assert(false, "ERROR: attempted to remove a nonexistant listener for event " .. eventId .. "\n")
  end
  for k, v in _G.pairs(self.eventListeners[eventId]) do
    if v == listener then
      self.eventListeners[eventId][k] = nil
      return
    end
  end
  _G.assert(false)
end
function EventManager:queueEvent(event)
  if self.useBufferedQueue ~= true then
    _G.table.insert(self.queuedEvents, event)
  else
    _G.table.insert(self.bufferedEvents, event)
  end
end
function EventManager:notify(event)
  _G.assert(event.id ~= nil, "Event ID was not defined (it's probably not defined in events.lua, or it is misspelled in call)")
  if self.eventListeners[event.id] == nil or self.eventListeners[event.id] ~= nil and #self.eventListeners[event.id] == 0 then
    gamelua.print("* WARNING EventManager has no listeners for this type of event: " .. event.id .. " \n")
  end
  for k, v in _G.pairs(self.eventListeners) do
    if k == event.id then
      for k1, v1 in _G.pairs(v) do
        v1:eventTriggered(event)
      end
    end
  end
end
filename = "EventManager.lua"
