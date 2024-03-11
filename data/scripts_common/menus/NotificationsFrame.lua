NotificationsFrame = ui.Frame:inherit()
function NotificationsFrame:eventTriggered(event)
  if event.id == events.EID_SHOW_LOADING_PAGE then
    self:getChild("loading").visible = true
  elseif event.id == events.EID_HIDE_LOADING_PAGE then
    self:getChild("loading").visible = false
  end
  if event.id == events.EID_PROCESS_FINISHED then
    local allChildren = {}
    if event.target ~= nil then
      self:removeChild(event.target.item)
    end
  end
end
filename = "NotificationsFrame.lua"
