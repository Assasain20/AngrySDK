function selectAssetProfile(group)
  if deviceModel ~= "windows" and deviceModel ~= "osx" and screenHeight > screenWidth then
    local temp = screenHeight
    screenHeight = screenWidth
    screenWidth = temp
  end
  local profileName = "480x320"
  if deviceModel == "iphone" then
    profileName = "480x320"
    if screenWidth > 480 and group ~= "INGAME" and _G.string.sub(group, 1, 6) ~= "THEME_" then
      if group == "SPLASHES" and screenWidth > 960 then
        profileName = "1136x640"
      else
        profileName = "960x640"
      end
    end
    if isLiteVersion then
      profileName = profileName .. "_lite"
    end
  elseif deviceModel == "ipad" then
    profileName = "1024x768"
    if screenWidth > 1024 and group ~= "INGAME" and _G.string.sub(group, 1, 6) ~= "THEME_" then
      profileName = "2048x1536"
    end
    if isLiteVersion then
      profileName = profileName .. "_lite"
    end
  elseif deviceModel == "n900" then
    profileName = "864x480"
    if isLiteVersion then
      profileName = profileName .. "_lite"
    end
  elseif deviceModel == "bada" then
    if screenHeight < 480 then
      profileName = "480x320"
    else
      profileName = "864x480"
    end
  elseif deviceModel == "s60vg" then
    profileName = "640x480_openvg"
  elseif deviceModel == "s60" then
    if isKorea then
      if group == "SPLASHES" then
        profileName = "640x360_korea"
      else
        profileName = "640x360"
      end
    elseif applyChinaRestictions then
      if group == "CHINA" then
        profileName = "640x360_china"
      else
        profileName = "640x360"
      end
    else
      profileName = "640x360"
    end
    if isLiteVersion and group ~= "CHINA" then
      profileName = profileName .. "_lite"
    end
  elseif deviceModel == "windows" then
    profileName = "pc"
  elseif deviceModel == "osx" then
    profileName = "pc"
  elseif deviceModel == "palm" then
    if isHDVersion then
      profileName = "1024x768_palmHD"
    else
      profileName = "480x320_palm"
    end
    if isLiteVersion then
      profileName = "480x320_lite_palm"
    end
  elseif deviceModel == "android" then
    local isInPartialLoadList = function(group)
      return group ~= "INGAME" and group ~= "SPLASHES" and not _G.string.find(group, "THEME_")
    end
    if isHDVersion then
      if screenWidth == 1024 and screenHeight == 600 and (group == "SPLASHES" or group == "ADS") then
        profileName = "1024x600"
      else
        profileName = "1280x720"
        if isLiteVersion then
          profileName = profileName .. "_lite"
        end
      end
    elseif customerString == "nook" then
      if group == "SPLASHES" then
        if screenWidth == 1024 then
          profileName = "nook"
        elseif screenWidth > 1024 and screenWidth < 1920 then
          profileName = "nookhd"
        elseif screenWidth >= 1900 then
          profileName = "nookhdplus"
        end
      elseif screenWidth > 1024 then
        if group == "ADS" then
          profileName = "1024x600"
        else
          profileName = "1280x720"
        end
      else
        profileName = "864x480"
      end
    elseif isInPartialLoadList(group) and screenHeight < 320 then
      profileName = "320x240_android"
      if isLiteVersion then
        profileName = profileName .. "_lite"
      end
    elseif isInPartialLoadList(group) and screenHeight < 480 then
      profileName = "480x320_android"
      if isLiteVersion then
        profileName = profileName .. "_lite"
      end
    elseif group == "SPLASHES" and screenHeight > 480 then
      profileName = "960x640_android"
    else
      profileName = "864x480"
      if isLiteVersion then
        profileName = profileName .. "_lite"
      end
      if isBetaVersion then
        profileName = profileName .. "_beta"
      end
    end
  elseif deviceModel == "roku" then
    if useRokuLowAssets and (group == "BUTTONS" or group == "GOLDENEGGS" or group == "MENU" or group == "LEVELSELECTION") then
      profileName = "roku_low"
    else
      profileName = "roku"
    end
  elseif deviceModel == "blackberry" then
    if group == "SPLASHES" then
      profileName = "1024x600"
    else
      profileName = "1024x768"
    end
  elseif deviceModel == "wp8" then
    profileName = "1280x768_wp8"
  end
  return profileName
end
function selectFontProfile()
  local profileName = "480x320"
  if deviceModel == "iphone" then
    if screenWidth >= 960 then
      profileName = "960x640"
    else
      profileName = "480x320"
    end
  elseif deviceModel == "ipad" then
    profileName = "1024x768"
    if screenWidth > 1024 then
      profileName = "2048x1536"
    end
  elseif deviceModel == "n900" then
    profileName = "864x480"
  elseif deviceModel == "bada" then
    if screenHeight < 480 then
      profileName = "480x320"
    else
      profileName = "864x480"
    end
  elseif deviceModel == "s60vg" then
    profileName = "640x360"
  elseif deviceModel == "s60" then
    profileName = "640x360"
  elseif deviceModel == "windows" then
    profileName = "pc"
  elseif deviceModel == "osx" then
    profileName = "pc"
  elseif deviceModel == "palm" then
    if isHDVersion then
      profileName = "1024x768"
    else
      profileName = "480x320"
    end
  elseif deviceModel == "android" then
    if isHDVersion then
      profileName = "1024x768"
    elseif screenHeight < 320 then
      profileName = "320x240"
    elseif screenHeight < 480 then
      profileName = "480x320"
    else
      profileName = "864x480"
    end
  elseif deviceModel == "roku" then
    profileName = "roku"
  elseif deviceModel == "blackberry" then
    profileName = "1024x768"
  elseif deviceModel == "wp8" then
    profileName = "wp8"
  end
  return profileName
end
filename = "select_profiles.lua"
