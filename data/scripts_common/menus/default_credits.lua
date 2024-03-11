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
    text = "TEXT_CREDITS"
  },
  {
    name = "textAdditionalCredits",
    type = "text",
    text = "TOM_CREDITS_S60",
    condition = deviceModel == "s60" and applyChinaRestictions
  },
  {
    name = "birds3",
    type = "image",
    image = "ABOUT_BIRDS_3"
  }
}
filename = "default_credits.lua"
