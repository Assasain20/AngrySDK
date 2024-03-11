function Credits:setupAboutText()
  local text_about
  text_about = "TEXT_ABOUT"
  if deviceModel == "ipad" then
    text_about = "TEXT_ABOUT_HD"
  end
  if deviceModel == "android" then
    if isHDVersion then
      text_about = "TEXT_ABOUT_ANDROID_HD"
    else
      text_about = "TEXT_ABOUT_ANDROID"
    end
  end
  if deviceModel == "blackberry" then
    text_about = "TEXT_ABOUT_ANDROID_HD"
  end
  text_about = _G.res.getString("TEXTS_BASIC", text_about)
  local version_string = gameVersionNumber
  if not releaseBuild then
    version_string = version_string .. " (" .. svnRevisionNumber .. ") - " .. customerString
  end
  text_about = _G.string.gsub(text_about, "(%$GAME_VERSION)", version_string)
  return text_about
end
g_credits = {
  {
    name = "birds1",
    type = "image",
    image = "ABOUT_BIRDS_1"
  },
  {
    name = "textAbout",
    type = "text",
    text = Credits:setupAboutText()
  },
  {
    name = "privacyButton",
    type = "button",
    image = "BUTTON_PRIVACY",
    returnValue = "GOTO_PRIVACY_POLICY",
    condition = g_hasWebBrowser
  },
  {
    name = "eulaButton",
    type = "button",
    image = "BUTTON_EULA",
    returnValue = "GOTO_EULA",
    condition = g_hasWebBrowser
  },
  {
    name = "birds2",
    type = "image",
    image = "ABOUT_BIRDS_2"
  },
  {
    name = "textCredits",
    type = "text",
    text = "TEXT_CREDITS_HALLOWEEN"
  },
  {
    name = "textChinaCredits",
    type = "text",
    text = "TOM_CREDITS_S60",
    condition = deviceModel == "s60" and applyChinaRestictions
  },
  {
    name = "birds3",
    type = "image",
    image = "ABOUT_BIRDS_3"
  },
  {
    name = "textOriginalCredits",
    type = "text",
    text = "TEXT_CREDITS_ORIGINAL"
  },
  {
    name = "birds4",
    type = "image",
    image = "ABOUT_BIRDS_4"
  },
  {
    name = "textAdditionalCredits",
    type = "text",
    text = "TEXT_CREDITS_ADDITIONAL"
  },
  {
    name = "birds5",
    type = "image",
    image = "ABOUT_BIRDS_5"
  }
}
filename = "game_credits.lua"
