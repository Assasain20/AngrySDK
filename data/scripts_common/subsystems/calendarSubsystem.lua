local SECONDS_PER_DAY = 86400
local SECONDS_PER_HOUR = 3600
CalendarSubsystem = SubSystem:inherit()
function CalendarSubsystem:init()
  self.data = self.data or {}
  self.success_event = self.success_event or {}
  gamelua.checkLevelAvailabilityOnline()
end
function CalendarSubsystem:update(dt, time)
  local loadingData = gamelua.getOnlineCheckStatus()
  if loadingData and loadingData.status then
    if loadingData.status == -1 then
      if not self.data.no_popup then
        gamelua.eventManager:notify({
          id = gamelua.events.EID_PUSH_FRAME,
          target = gamelua.ui.Prompt:new({
            title = "Network Error",
            content = "A connection error has occurred. Please check your internet connection and try again."
          })
        })
      end
      return true
    elseif loadingData.status == 1 then
      if loadingData.today ~= "" then
        local todayDateYear = _G.tonumber(_G.string.sub(loadingData.today, 1, 4))
        local todayDateMonth = _G.tonumber(_G.string.sub(loadingData.today, 6, 7))
        local todayDateDay = _G.tonumber(_G.string.sub(loadingData.today, 9))
        if todayDateYear > self.data.year then
          gamelua.settingsWrapper:setLastOpenLevel(self.data.episode, 200)
        elseif todayDateMonth >= self.data.month then
          gamelua.settingsWrapper:setLastOpenLevel(self.data.episode, todayDateDay)
        else
          todayDateDay = -1
        end
        if self.data.level <= gamelua.settingsWrapper:getLastOpenLevel(self.data.episode) then
          gamelua.eventManager:notify(self.success_event)
        elseif not self.data.no_popup and not self.data.no_time_popup then
          local timeLeft = loadingData.timeToNext + (self.data.level - todayDateDay - 1) * SECONDS_PER_DAY
          local timeLeftDays = _G.math.floor(timeLeft / SECONDS_PER_DAY)
          local timeLeftHours = _G.math.floor(_G.math.fmod(timeLeft, SECONDS_PER_DAY) / SECONDS_PER_HOUR)
          local timeLeftMinutes = _G.math.floor(_G.math.fmod(timeLeft, SECONDS_PER_HOUR) / 60)
          local timeString = (timeLeftDays > 0 and "" .. timeLeftDays .. " days, " or "") .. (timeLeftHours > 0 and "" .. timeLeftHours .. " hours, " or "") .. (timeLeftMinutes > 1 and "" .. timeLeftMinutes .. " minutes" or "1 minute") .. "."
          gamelua.eventManager:notify({
            id = gamelua.events.EID_PUSH_FRAME,
            target = gamelua.ui.Prompt:new({
              title = "Level available in:",
              content = timeString
            })
          })
        end
      end
      return true
    end
  end
  return false
end
filename = "calendarSubsystem.lua"
