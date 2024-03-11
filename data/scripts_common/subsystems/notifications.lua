print = gamelua.print
function init(self)
  events = gamelua.events
  eventManager = gamelua.eventManager
  eventManager:addEventListener(events.EID_DAILYREWARD_RECEIVED, self)
  if g_inactivity_notification then
    removeNotification("inactivity")
    addNotificationAfter("inactivity", g_inactivity_notification_time, "NOTIFICATION_INACTIVITY")
  end
end
function eventTriggered(self, event)
  if event.id == events.EID_DAILYREWARD_RECEIVED and g_daily_reward_notifications then
    removeNotification("dailyreward")
    addNotificationAfter("dailyreward", g_daily_reward_notification_time, "NOTIFICATION_DAILY_REWARD")
  end
end
function update()
end
filename = "notifications.lua"
