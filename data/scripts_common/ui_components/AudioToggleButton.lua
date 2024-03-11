print = gamelua.print
events = gamelua.events
AudioToggleButton = ToggleButton:inherit()
function AudioToggleButton:init()
  ToggleButton.init(self)
  self.returnValue = "AUDIO_TOGGLED_INTERNAL_DUMMY"
end
function AudioToggleButton:onEntry()
  ToggleButton.onEntry(self)
  gamelua.eventManager:addEventListener(events.EID_AUDIO_STATE_CHANGED, self)
  self:audioStateChanged(gamelua.settingsWrapper:isAudioEnabled() and 1 or 0)
end
function AudioToggleButton:onExit()
  ToggleButton.onExit(self)
  gamelua.eventManager:removeEventListener(events.EID_AUDIO_STATE_CHANGED, self)
end
function AudioToggleButton:eventTriggered(event)
  if event.id == events.EID_AUDIO_STATE_CHANGED then
    self:audioStateChanged(event.state)
  end
end
function AudioToggleButton:audioStateChanged(state)
  if self.state ~= state then
    if state == 0 then
      self:setState(2)
    else
      self:setState(1)
    end
  end
end
function AudioToggleButton:onPointerEvent(eventType, x, y)
  local result, meta, item = ToggleButton.onPointerEvent(self, eventType, x, y)
  if result and result == self.returnValue then
    gamelua.changeAudio()
  end
  return result, meta, item
end
filename = "AudioToggleButton.lua"
