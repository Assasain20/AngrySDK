function canShowPurchaseHistory()
  return customerString == "verizon" and isPurchaseHistoryImplemented()
end
g_shop_items = {
  {
    product = "bundle",
    id = "bundle_5x",
    window = "SHOP_MIDDLEWINDOW_1",
    name = "x 20",
    price = {usd = 1.99},
    message_quantity = 20,
    quantity = {
      superseed = 5,
      kingsling = 5,
      slingscope = 5,
      birdquake = 5
    }
  },
  {
    product = "bundle",
    id = "bundle_15x",
    window = "SHOP_MIDDLEWINDOW_2",
    name = "x 60",
    show = "x 40",
    free = "20",
    price = {usd = 3.99},
    message_quantity = 60,
    quantity = {
      superseed = 15,
      kingsling = 15,
      slingscope = 15,
      birdquake = 15
    }
  },
  {
    product = "bundle",
    id = "bundle_35x",
    window = "SHOP_MIDDLEWINDOW_3",
    name = "x 140",
    show = "x 100",
    free = "40",
    price = {usd = 9.99},
    message_quantity = 140,
    quantity = {
      superseed = 35,
      kingsling = 35,
      slingscope = 35,
      birdquake = 35
    }
  },
  {
    product = "bundle",
    id = "bundle_75x",
    window = "SHOP_MIDDLEWINDOW_4",
    name = "x 300",
    show = "x 200",
    free = "100",
    price = {usd = 19.99},
    message_quantity = 300,
    quantity = {
      superseed = 75,
      kingsling = 75,
      slingscope = 75,
      birdquake = 75
    }
  },
  {
    product = "superseed",
    id = "superseed_30x",
    window = "SHOP_MIDDLEWINDOW_1",
    name = "x 30",
    price = {usd = 1.99},
    quantity = {superseed = 30}
  },
  {
    product = "superseed",
    id = "superseed_80x",
    window = "SHOP_MIDDLEWINDOW_2",
    name = "x 80",
    show = "x 70",
    free = "10",
    price = {usd = 4.99},
    quantity = {superseed = 80}
  },
  {
    product = "superseed",
    id = "superseed_170x",
    window = "SHOP_MIDDLEWINDOW_3",
    name = "x 170",
    show = "x 150",
    free = "20",
    price = {usd = 9.99},
    quantity = {superseed = 170}
  },
  {
    product = "superseed",
    id = "superseed_400x",
    window = "SHOP_MIDDLEWINDOW_4",
    name = "x 400",
    show = "x 300",
    free = "100",
    price = {usd = 19.99},
    quantity = {superseed = 400}
  },
  {
    product = "kingsling",
    id = "kingsling_30x",
    window = "SHOP_MIDDLEWINDOW_1",
    name = "x 30",
    price = {usd = 1.99},
    quantity = {kingsling = 30}
  },
  {
    product = "kingsling",
    id = "kingsling_80x",
    window = "SHOP_MIDDLEWINDOW_2",
    name = "x 80",
    show = "x 70",
    free = "10",
    price = {usd = 4.99},
    quantity = {kingsling = 80}
  },
  {
    product = "kingsling",
    id = "kingsling_170x",
    window = "SHOP_MIDDLEWINDOW_3",
    name = "x 170",
    show = "x 150",
    free = "20",
    price = {usd = 9.99},
    quantity = {kingsling = 170}
  },
  {
    product = "kingsling",
    id = "kingsling_400x",
    window = "SHOP_MIDDLEWINDOW_4",
    name = "x 400",
    show = "x 300",
    free = "100",
    price = {usd = 19.99},
    quantity = {kingsling = 400}
  },
  {
    product = "slingscope",
    id = "slingscope_30x",
    window = "SHOP_MIDDLEWINDOW_1",
    name = "x 30",
    price = {usd = 1.99},
    quantity = {slingscope = 30}
  },
  {
    product = "slingscope",
    id = "slingscope_80x",
    window = "SHOP_MIDDLEWINDOW_2",
    name = "x 80",
    show = "x 70",
    free = "10",
    price = {usd = 4.99},
    quantity = {slingscope = 80}
  },
  {
    product = "slingscope",
    id = "slingscope_170x",
    window = "SHOP_MIDDLEWINDOW_3",
    name = "x 170",
    show = "x 150",
    free = "20",
    price = {usd = 9.99},
    quantity = {slingscope = 170}
  },
  {
    product = "slingscope",
    id = "slingscope_400x",
    window = "SHOP_MIDDLEWINDOW_4",
    name = "x 400",
    show = "x 300",
    free = "100",
    price = {usd = 19.99},
    quantity = {slingscope = 400}
  },
  {
    product = "birdquake",
    id = "birdquake_30x",
    window = "SHOP_MIDDLEWINDOW_1",
    name = "x 30",
    price = {usd = 1.99},
    quantity = {birdquake = 30}
  },
  {
    product = "birdquake",
    id = "birdquake_80x",
    window = "SHOP_MIDDLEWINDOW_2",
    name = "x 80",
    show = "x 70",
    free = "10",
    price = {usd = 4.99},
    quantity = {birdquake = 80}
  },
  {
    product = "birdquake",
    id = "birdquake_170x",
    window = "SHOP_MIDDLEWINDOW_3",
    name = "x 170",
    show = "x 150",
    free = "20",
    price = {usd = 9.99},
    quantity = {birdquake = 170}
  },
  {
    product = "birdquake",
    id = "birdquake_400x",
    window = "SHOP_MIDDLEWINDOW_4",
    name = "x 400",
    show = "x 300",
    free = "100",
    price = {usd = 19.99},
    quantity = {birdquake = 400}
  }
}
g_shop_products = {
  superseed = {
    name = "Super Seed",
    icon = "SHOP_SUPERSEED",
    button = "SHOP_WINDOW_SUPERSEED",
    tutorial = "TUTORIAL_SUPERSEED",
    message_icon = "UI_POWERUPS_SUPERSEEDS",
    message = "TEXT_POWERUP_RECEIVED_SUPERSEEDS",
    title_image = "SHOP_LOGO_SUPERSEED",
    item_image = "WINDOW_SUPERSEED",
    description = "TEXT_SHOP_SUPER_SEED_DESCRIPTION"
  },
  kingsling = {
    name = "King Sling",
    icon = "SHOP_POWERSLING",
    button = "SHOP_WINDOW_POWERSLING",
    tutorial = "TUTORIAL_POWERSLING",
    message_icon = "UI_POWERUPS_KINGSLING",
    message = "TEXT_POWERUP_RECEIVED_KINGSLING",
    title_image = "SHOP_LOGO_KINGSLING",
    item_image = "WINDOW_KINGSLING",
    description = "TEXT_SHOP_KING_SLING_DESCRIPTION"
  },
  slingscope = {
    name = "Sling Scope",
    icon = "SHOP_SLINGSCOPE",
    button = "SHOP_WINDOW_SLINGSCOPE",
    tutorial = "TUTORIAL_SLINGSCOPE",
    message_icon = "UI_POWERUPS_SLINGSCOPE",
    message = "TEXT_POWERUP_RECEIVED_SLINGSCOPE",
    title_image = "SHOP_LOGO_SLIGNSCOPE",
    item_image = "WINDOW_SLINGSCOPE",
    description = "TEXT_SHOP_SLING_SCOPE_DESCRIPTION"
  },
  birdquake = {
    name = "Birdquake",
    icon = "SHOP_BIRDQUAKE",
    button = "SHOP_WINDOW_BIRDQUAKE",
    tutorial = "TUTORIAL_BIRDQUAKE",
    message_icon = "UI_POWERUPS_BIRDQUAKE",
    message = "TEXT_POWERUP_RECEIVED_BIRDQUAKE",
    title_image = "SHOP_LOGO_BIRDQUAKE",
    item_image = "WINDOW_BIRDQUAKE",
    description = "TEXT_SHOP_BIRDQUAKE"
  },
  bundle = {
    name = "All-in-One Bundle",
    icon = "SHOP_BUNDLE",
    button = "SHOP_WINDOW_BUNDLE",
    tutorial = "TUTORIAL_BUNDLE",
    message_icon = "UI_POWERUPS_BUNDLE",
    message = "TEXT_POWERUP_RECIEVED_BUNDLE",
    title_image = "SHOP_LOGO_BUNDLE",
    item_image = "WINDOW_BUNDLE",
    description = "TEXT_SHOP_ALL-IN-ONE-BUNDLE"
  }
}
local g_powerup_types = {
  "bundle",
  "superseed",
  "kingsling",
  "slingscope",
  "birdquake"
}
DescriptionText = ui.Text:inherit()
function DescriptionText:init()
  ui.Text.init(self)
  self.anim_state = "IDLE"
  self.target_text = self.text
end
function DescriptionText:changeText(text, start_y)
  if text and self.target_text ~= text then
    self.target_text = text
    self.anim_state = "LEAVE"
  end
  if not self.start_y then
    self.start_y = start_y
  end
end
function DescriptionText:update(dt, time)
  ui.Text.update(self, dt, time)
  if self.anim_state == "LEAVE" then
    self.y = self.y + dt * screenHeight * 1.2
    if self.y > screenHeight + self:getHeight() * 1.3 then
      self.text = self.target_text
      self:clip()
      self.anim_state = "ENTER"
    end
  elseif self.anim_state == "ENTER" then
    self.y = self.y - dt * screenHeight * 1.2
    if self.y < self.start_y then
      self.y = self.start_y
      self.anim_state = "IDLE"
    end
  end
end
SelectionBox = ui.Image:inherit()
function SelectionBox:setTarget(target_x)
  self.target_x = target_x
  self.old_x = self.x
  self.start_time = time
end
function SelectionBox:update(dt, time)
  if self.target_x then
    local distance = self.target_x - self.old_x
    self.x = tweenEaseCubicInOut(time - self.start_time, self.old_x, distance, 0.3)
    if time >= self.start_time + 0.3 then
      self.x = self.target_x
      self.target_x = nil
      self.old_x = nil
    end
  end
end
ProductButton = ui.ImageButton:inherit()
function ProductButton:setAnimationState(state, start_time)
  if self.anim_state ~= state and not self.start_time then
    self.start_time = start_time
    self.anim_state = state
    self.force_highlight = true
  end
end
function ProductButton:update(dt, time)
  ui.ImageButton.update(self, dt, time)
  local scale_change = 0.25
  local grow_duration = 1
  if self.anim_state == "GROW" and self.start_time then
    self.scaleX = tweenEaseCubicOut(time - self.start_time, 1, scale_change, grow_duration)
    self.scaleY = self.scaleX
    if grow_duration < time - self.start_time then
      self.scaleX = 1 + scale_change
      self.scaleY = self.scaleX
      self.start_time = nil
    end
  elseif self.anim_state == "SHRINK" and self.start_time then
    self.scaleX = tweenEaseCubicOut(time - self.start_time, 1 + scale_change, -scale_change, grow_duration)
    self.scaleY = self.scaleX
    if grow_duration < time - self.start_time then
      self.scaleX = 1
      self.scaleY = 1
      self.start_time = nil
      self.force_highlight = false
    end
  end
end
ProductPage = ui.Frame:inherit()
function ProductPage:new(o)
  local o = o or {}
  return ui.Frame.new(self, o)
end
function ProductPage:init()
  ui.Frame.init(self)
  self.current_product = self.current_product or g_powerup_types[1]
  self.current_item = self.current_item or self:findFirstItem(self.current_product)
  local bg = ui.Image:new()
  bg.name = "bg"
  bg:setImage("SHOP_BG_1")
  self:addChild(bg)
  self.backgroundColour = {
    r = 148,
    g = 210,
    b = 247,
    a = 255
  }
  local scroll = ui.ScrollFrame:new()
  scroll.name = "scroll"
  self:addChild(scroll)
  self.scroll = scroll
  local description_shade = ui.Rect:new()
  description_shade.name = "description_shade"
  description_shade.a = 0.6
  self:addChild(description_shade)
  local description = DescriptionText:new({
    text = g_shop_products[self.current_product].description
  })
  description.name = "description"
  description:setFont(getFontBasic)
  description.hanchor = "HCENTER"
  description.vanchor = "VCENTER"
  self:addChild(description)
  local top_bar = ui.Image:new()
  top_bar.name = "top_bar"
  top_bar:setImage("SHOP_TOPBAR")
  self:addChild(top_bar)
  local selection = SelectionBox:new()
  selection.name = "selection"
  selection:setImage("SHOP_TOPBAR_SELECTION")
  self:addChild(selection)
  self.spinner_angle = 0
  self.spinners = {}
  for i = 1, #g_powerup_types do
    local product_button = ProductButton:new()
    product_button.name = "product" .. i
    product_button:setImage(g_shop_products[g_powerup_types[i]].icon)
    product_button.returnValue = "GOTO_PRODUCT"
    product_button.meta = i
    product_button.activateOnRelease = true
    product_button.clickSound = "menu_confirm"
    self:addChild(product_button)
    local counter_bg = ui.Image:new()
    counter_bg.name = "counter_bg" .. i
    counter_bg:setImage("SHOP_TOPBAR_AMOUNT")
    self:addChild(counter_bg)
    local counter = ui.Text:new()
    if deviceModel == "iphone" or deviceModel == "iphone4" then
      counter.font = "FONT_POWERUP_AMOUNT"
    else
      counter.font = "FONT_LS_SMALL"
    end
    counter.name = "counter"
    counter.text = "0"
    counter_bg:addChild(counter)
    if i == 1 then
      counter_bg:setVisible(false)
      counter:setVisible(false)
    end
  end
  for i, v in _G.ipairs(g_shop_items) do
    local item_button = ui.ImageButton:new()
    item_button.name = "item" .. i
    item_button:setImage(g_shop_items[i].window)
    item_button.floorCoordinates = false
    item_button.activateOnRelease = true
    scroll:addChild(item_button)
    local window_image = ui.Image:new()
    window_image.name = "window_image"
    window_image:setImage(g_shop_products[v.product].item_image)
    window_image.floorCoordinates = false
    item_button:addChild(window_image)
    local label = ui.Text:new({
      text = v.show or v.name,
      font = "FONT_SHOP_AMOUNT"
    })
    label.name = "label"
    label.hanchor = "RIGHT"
    label.floorCoordinates = false
    item_button:addChild(label)
    local free_text = ""
    if v.free then
      free_text = "+" .. (v.free or "") .. " FREE"
    end
    local free_label = ui.Text:new({text = free_text, font = getFontBasic})
    free_label.name = "free_label"
    free_label.hanchor = "RIGHT"
    free_label.floorCoordinates = false
    item_button:addChild(free_label)
    if deviceModel ~= "android" then
      local price_bg = ui.Image:new()
      price_bg.name = "price_bg"
      price_bg:setImage("SHOP_WINDOW_AMOUNT")
      price_bg.floorCoordinates = false
      item_button:addChild(price_bg)
      local price_label = ui.Text:new()
      price_label.name = "price_label"
      price_label:setFont(getFontBasic)
      price_label.text = "TEXT_SHOP_PRICE"
      price_label.hanchor = "RIGHT"
      price_label.floorCoordinates = false
      price_label.visible = false
      price_bg:addChild(price_label)
      local price = ui.Text:new()
      price.name = "price"
      price:setFont(getFontBasic)
      price.text = formatCurrency(v.price.usd, "USD-string")
      price.hanchor = "LEFT"
      price.floorCoordinates = false
      price.visible = false
      price_bg:addChild(price)
      local price_spinner = ui.Image:new()
      price_spinner.name = "price_spinner"
      price_spinner:setImage("IN_APP_LOADING")
      price_spinner.floorCoordinates = false
      price_bg:addChild(price_spinner)
      _G.table.insert(self.spinners, price_spinner)
    end
    local shade = ui.Image:new()
    shade.name = "shade"
    shade:setImage("SHOP_MIDDLEWINDOW_BLEND")
    item_button:addChild(shade)
    local buy_button = ui.ImageButton:new()
    buy_button.name = "buy" .. i
    buy_button:setImage("SHOP_PURCHASE")
    buy_button.returnValue = "BUY_PRODUCT"
    buy_button.meta = i
    buy_button.activateOnRelease = true
    buy_button.clickSound = "menu_confirm"
    buy_button.floorCoordinates = false
    item_button:addChild(buy_button)
    local shade2 = ui.Image:new()
    shade2.name = "shade"
    shade2:setImage("SHOP_PURCHASE_BLEND")
    buy_button:addChild(shade2)
  end
  local back_button = ui.ImageButton:new()
  back_button.name = "back_button"
  back_button:setImage("ARROW_LEFT")
  back_button.returnValue = "CLOSE_PRODUCT"
  back_button.attach = "fixed"
  back_button.activateOnRelease = true
  back_button.clickSound = "menu_back"
  self:addChild(back_button)
  local tutorial_button = ui.ImageButton:new()
  tutorial_button.name = "tutorial_button"
  tutorial_button:setImage("MENU_TUTORIALS")
  tutorial_button.returnValue = "SHOW_TUTORIALS"
  tutorial_button.activateOnRelease = true
  tutorial_button.clickSound = "menu_confirm"
  self:addChild(tutorial_button)
  if cheatsEnabled then
    local cheat_button = ui.ImageButton:new()
    cheat_button.name = "cheat_button"
    cheat_button:setImage("BUTTON_EMPTY")
    cheat_button.returnValue = "BUY_PRODUCT_CHEAT"
    cheat_button.meta = 4
    cheat_button.activateOnRelease = true
    cheat_button.clickSound = "menu_confirm"
    self:addChild(cheat_button)
  end
  if canShowPurchaseHistory() then
    local history_button = ui.ImageButton:new()
    history_button.name = "history_button"
    history_button:setImage("BUTTON_HISTORY")
    history_button.returnValue = "GOTO_PURCHASE_HISTORY"
    history_button.activateOnRelease = true
    history_button.clickSound = "menu_confirm"
    self:addChild(history_button)
  end
end
function ProductPage:onEntry()
  ui.Frame.onEntry(self)
  loadParticleFile()
  self:updatePowerupCounters()
  initIap()
  eventManager:addEventListener(events.EID_IAP_INIT_FINISHED, self)
  self:setPriceLabels(true)
end
function ProductPage:onExit()
  ui.Frame.onExit(self)
  eventManager:removeEventListener(events.EID_IAP_INIT_FINISHED, self)
end
function ProductPage:eventTriggered(event)
  if event.id == events.EID_IAP_INIT_FINISHED then
    self:setPriceLabels()
    self:layout()
  end
end
function ProductPage:setPriceLabels(entry)
  if deviceModel ~= "android" then
    for i = 1, #g_shop_items do
      local item_button = self:getChild("item" .. i)
      local price_bg = item_button:getChild("price_bg")
      local price_label = price_bg:getChild("price_label")
      local price = price_bg:getChild("price")
      local price_spinner = price_bg:getChild("price_spinner")
      local id = g_iap_products[g_shop_items[i].id]
      local have_price = false
      if g_iap_product_listing[id] and g_iap_product_listing[id].price then
        price.text = _G.tostring(g_iap_product_listing[id].price)
        have_price = true
      end
      if not entry or have_price then
        price_label:setVisible(true)
        price:setVisible(true)
        price_spinner:setVisible(false)
      end
      self:layout()
    end
  end
end
function ProductPage:updatePowerupCounters()
  for i = 1, #g_powerup_types do
    self:getChild("counter_bg" .. i):getChild("counter").text = settingsWrapper:getItemAmount(g_powerup_types[i])
  end
end
function ProductPage:layout()
  ui.Frame.layout(self)
  local top_bar = self:getChild("top_bar")
  local tbw, tbh = _G.res.getSpriteBounds(top_bar.image)
  tbh = tbh - 16
  top_bar.x = screenWidth / 2
  top_bar.y = 0
  local scroll = self:getChild("scroll")
  local product_interval = 0.5
  local anchors = {}
  for i = 1, #g_shop_items do
    _G.table.insert(anchors, i, {
      x = (i - 1) * product_interval * screenWidth,
      y = 0
    })
  end
  scroll:setAnchors(anchors)
  scroll:setClip({
    x = 0,
    y = tbh,
    w = screenWidth,
    h = screenHeight - tbh
  })
  local bg = self:getChild("bg")
  bg.x = 0
  bg.y = screenHeight
  local sw, sh = _G.res.getSpriteBounds(bg.image)
  if sw < screenWidth then
    bg.scaleX = screenWidth / sw
    bg.scaleY = bg.scaleX
  end
  local back_button = self:getChild("back_button")
  back_button.x = back_button.w * 0.5 + g_layoutMargin.x
  back_button.y = screenHeight - back_button.h * 0.5 - g_layoutMargin.y
  local tutorial_button = self:getChild("tutorial_button")
  tutorial_button.x = screenWidth - back_button.x
  tutorial_button.y = back_button.y
  local sw, sh = _G.res.getSpriteBounds("SHOP_TOPBAR")
  local element_interval = tbw / #g_powerup_types
  local start_x = screenWidth / 2 - tbw / 2 + element_interval / 2
  for i = 1, #g_powerup_types do
    local product_button = self:getChild("product" .. i)
    product_button.x = start_x + element_interval * (i - 1)
    product_button.y = sh * 0.5
    if self.current_product == g_powerup_types[i] then
      self:getChild("selection").x = product_button.x
    end
    local counter_bg = self:getChild("counter_bg" .. i)
    counter_bg.x = product_button.x
    counter_bg.y = product_button.y + counter_bg.h
  end
  local bbsw, _ = _G.res.getSpriteBounds(back_button.image)
  local tbsw, _ = _G.res.getSpriteBounds(tutorial_button.image)
  local description_space = screenWidth - bbsw * 1.2 - tbsw * 1.2
  local description = self:getChild("description")
  description.x = (bbsw * 1.1 + screenWidth - tbsw * 1.2) * 0.5
  description.textBoxSize = description_space
  description.y = screenHeight * 0.89
  description:clip()
  local description_shade = self:getChild("description_shade")
  description_shade.x = 0
  description_shade.y = screenHeight * 0.795
  description_shade.width = screenWidth
  description_shade.height = screenHeight - description_shade.y + 2
  if canShowPurchaseHistory() then
    local history_button = self:getChild("history_button")
    history_button.x = screenWidth - back_button.x
    history_button.y = back_button.y - history_button.h
  end
  for i = 1, #g_shop_items do
    local item_button = self:getChild("item" .. i)
    item_button.x = screenWidth * ((i - 1) * product_interval + 0.5)
    item_button.y = screenHeight * 0.5
    local sw, sh = _G.res.getSpriteBounds(item_button.image)
    local label = item_button:getChild("label")
    label.x = sw * 0.44
    label.y = sh * -0.25
    label.x0 = label.x
    label.y0 = label.y
    label.x = label.x * item_button.scaleX
    label.y = label.y * item_button.scaleY
    local free_label = item_button:getChild("free_label")
    free_label.x = label.x0
    free_label.y = -sh * 0.03
    free_label.x0 = free_label.x
    free_label.y0 = free_label.y
    free_label.x = free_label.x * item_button.scaleX
    free_label.y = free_label.y * item_button.scaleY
    local window_image = item_button:getChild("window_image")
    window_image.x = _G.math.max(-sw * 0.27, -sw / 2 + window_image.w * 0.53)
    window_image.y = _G.math.max(label.y0, -sh / 2 + window_image.h * 0.53)
    window_image.x0 = window_image.x
    window_image.y0 = window_image.y
    window_image.x = window_image.x * item_button.scaleX
    window_image.y = window_image.y * item_button.scaleY
    if deviceModel ~= "android" then
      local price_bg = item_button:getChild("price_bg")
      local price_label = price_bg:getChild("price_label")
      price_label.x = sw * -0.01
      price_label.y = 0
      local price = price_bg:getChild("price")
      price.x = sw * 0.01
      price.y = 0
      setFont(price.font)
      local w1 = _G.res.getStringWidth(price.text)
      local w2 = _G.res.getStringWidth(_G.res.getString(price_label.group, price_label.text))
      local sw = _G.res.getSpriteBounds("SHOP_WINDOW_AMOUNT")
      if w1 + w2 > sw * 0.9 then
        price_label:setVisible(false)
      else
        price_label:setVisible(price.visible)
      end
      if not price_label.visible then
        price.hanchor = "HCENTER"
      else
        price.hanchor = "LEFT"
        price.x = (w2 - w1) * 0.5 + _G.res.getStringWidth(" ")
        price_label.x = (w2 - w1) * 0.5
      end
      local label_width = 0
      setFont(price_label.font)
      local textContent = price_label.text
      if price_label.group ~= "" then
        textContent = _G.res.getString(price_label.group, price_label.text)
      end
      label_width = _G.res.getStringWidth(textContent)
      if label_width > price_bg.w * 0.5 then
        price_label.scaleX = 0.8
        price_label.scaleY = 0.8
      end
    end
  end
  self:getChild("scroll"):setCurrentAnchor(self.current_item)
  self:refreshVisibleChildren()
end
function ProductPage:isPurchaseLimitExceeded(nextItemPrice)
  local currentTime = getCurrentTime()
  currentTime.minutes = 0
  currentTime.seconds = 0
  currentTime.hour = 0
  local dailyPurchases = settingsWrapper:getIapDailyPurchases()
  local periodPurchaseAmount = 0
  for k, v in _G.pairs(dailyPurchases) do
    local difference = getTimeDifference(k, currentTime)
    if difference.days < g_iap_limit_days then
      periodPurchaseAmount = periodPurchaseAmount + v
    end
  end
  periodPurchaseAmount = periodPurchaseAmount + nextItemPrice
  if periodPurchaseAmount > g_iap_purchase_limit then
    return true
  end
  return false
end
function ProductPage:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE_PRODUCT" then
    self:exit()
  elseif result == "BUY_PRODUCT" then
    local function buy_func()
      purchaseItem(g_iap_products[g_shop_items[meta].id], function()
        self:purchaseSucceeded(meta)
      end, function(_, status, error)
        self:purchaseFailed(meta, status, error)
      end)
      eventManager:notify({
        id = events.EID_PUSH_FRAME,
        target = PurchasePage:new()
      })
    end
    if deviceModel == "android" and self:isPurchaseLimitExceeded(g_shop_items[meta].price.usd) then
      eventManager:notify({
        id = events.EID_PUSH_FRAME,
        target = ui.Prompt:new({
          content = "TEXT_SHOP_ANDROID_DAILY_PURCHASE_LIMIT"
        })
      })
    elseif deviceModel == "android" and g_shop_items[meta].price.usd >= 10 then
      notificationsFrame:addChild(ui.ConfirmPrompt:new({
        title = "You are about to purchase \n" .. g_shop_products[self.current_product].name .. " " .. g_shop_items[meta].name .. [[


 Do you wish to proceed?]],
        confirmOnLeft = deviceModel ~= "osx",
        confirm_call = buy_func
      }))
    else
      buy_func()
    end
  elseif result == "BUY_PRODUCT_CHEAT" then
    self:purchaseSucceeded(meta)
  elseif result == "GOTO_PRODUCT" then
    local scroll = self:getChild("scroll")
    scroll:setTargetAnchor(self:findFirstItem(g_powerup_types[meta]))
  elseif result == "GOTO_PURCHASE_HISTORY" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = PurchaseHistory:new({
        from = self.from,
        product = self.current_product
      })
    })
  elseif result == "SHOW_TUTORIALS" then
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = PowerupTutorial:new({
        from = self.from,
        product = self.current_product,
        item = self.current_item
      })
    })
  elseif result == "GOTO_MAGIC_MAP" then
    eventManager:notify({
      id = events.EID_MAGIC_PLACES_CLICKED,
      from = "SHOP"
    })
  elseif result == "SCROLL_PREVIOUS" then
    self:getChild("scroll"):previous()
  elseif result == "SCROLL_NEXT" then
    self:getChild("scroll"):next()
  end
  return result, meta, item
end
function ProductPage:onKeyEvent(type, key)
  local result, meta, item = ui.Frame.onKeyEvent(self, type, key)
  if not result and type == "RELEASE" and (key == "BACK" or key == "ESCAPE") then
    self:exit()
  end
  return result, meta, item
end
function ProductPage:exit()
  local completion_event, completion_call
  if self.from == "MAIN_MENU" or self.from == "MAGIC_PLACES" then
    completion_event = {
      id = events.EID_CHANGE_SCENE,
      target = "MAIN_MENU",
      from = "SHOP"
    }
  elseif self.from == "INGAME" then
    function completion_call()
      menuManager:changeRoot(g_hud_class:new())
      setGameMode(updateGame)
      setPhysicsEnabled(true)
      g_resetCameras = true
    end
  elseif self.from == "PAUSE" then
    function completion_call()
      local pause = g_hud_class:new()
      pause:instantlyShowPauseMenu()
      menuManager:changeRoot(pause)
      g_resetCameras = true
    end
  end
  if (deviceModel == "iphone4" or deviceModel == "ipad3") and self.from ~= "MAIN_MENU" then
    changeResolution = true
    wantedResolution = "FULL"
  end
  local profileName = selectFontProfile()
  eventManager:notify({
    id = events.EID_DO_LOADING,
    items = {
      function()
        _G.res.releaseFont(fontPath .. "/" .. profileName .. "/FONT_SHOP_AMOUNT.dat")
        releaseAssets({"SHOP"})
        loadImages({
          "LEVELSELECTION",
          "TUTORIALS"
        })
      end
    },
    completion_event = completion_event,
    completion_call = completion_call
  })
end
function ProductPage:purchaseFailed(item_id, status, error)
  local item = g_shop_items[item_id]
  eventManager:notify({
    id = events.EID_IAP_FAILED,
    item = item.id,
    reason = _G.tostring(status) .. "/" .. _G.tostring(error)
  })
  if self:getChild("spinner") then
    eventManager:notify({
      id = events.EID_POP_FRAME
    })
  end
end
function ProductPage:purchaseSucceeded(item_id)
  local item = g_shop_items[item_id]
  for k, v in _G.pairs(item.quantity) do
    addPowerups(k, v)
  end
  local quantity
  if item.message_quantity then
    quantity = item.message_quantity
  else
    local _
    _, quantity = _G.next(item.quantity)
  end
  local function increase_func()
    self:showPowerupIncrease(item_id)
  end
  if deviceModel == "android" then
    settingsWrapper:increaseIapPurchaseAmountForDay(getCurrentTime(), item.price.usd)
  end
  eventManager:notify({
    id = events.EID_IAP_COMPLETED,
    item = item.id
  })
  eventManager:notify({
    id = events.EID_SHOP_PURCHASE,
    item = item.id,
    powerup_type = item.product,
    amount = _G.tostring(quantity)
  })
  if self:getChild("spinner") then
    eventManager:notify({
      id = events.EID_POP_FRAME
    })
  end
  notificationsFrame:addChild(PowerupReward:new({
    image = g_shop_products[self.current_product].message_icon,
    message = g_shop_products[self.current_product].message,
    amount = quantity,
    initial_shade = 0.65,
    completion_call = increase_func
  }))
end
function ProductPage:showPowerupIncrease(item_id)
  local item = g_shop_items[item_id]
  local targets = {}
  for k, v in _G.pairs(item.quantity) do
    local product_index = find_key(g_powerup_types, k)
    local product_button = self:getChild("product" .. product_index)
    if menuManager:getRoot() == self then
      _G.particles.addParticles("shopPowerupReceived", 35, product_button.x, product_button.y, product_button.w / 2, product_button.h / 2, 0, true, true)
      if not _G.res.isAudioPlaying(getAudioName("powerup_awarded")) then
        _G.res.playAudio(getAudioName("powerup_awarded"), 1, false)
      end
    end
  end
  self.increase_amounts = deepCopy(item.quantity)
  self.old_amounts = {}
  for i = 1, #g_powerup_types do
    local powerup_name = g_powerup_types[i]
    _G.table.insert(self.old_amounts, i, settingsWrapper:getItemAmount(powerup_name) - (item.quantity[powerup_name] or 0))
  end
end
function ProductPage:findFirstItem(product)
  for i, v in _G.ipairs(g_shop_items) do
    if product == v.product then
      return i
    end
  end
end
function ProductPage:update(dt, time)
  self.spinner_angle = self.spinner_angle + dt * 10
  local angle = _G.math.floor(self.spinner_angle / 0.5235983) * 0.5235983
  for _, v in _G.pairs(self.spinners) do
    v.angle = angle
  end
  if self.scroll:getCurrentX() ~= self.previous_x then
    self:refreshVisibleChildren()
    self.previous_x = self.scroll:getCurrentX()
  end
  ui.Frame.update(self, dt, time)
  local scroll = self.scroll
  for i = 1, #g_shop_items do
    local button = scroll:getChild("item" .. i)
    if button.visible then
      local buy = scroll:getChild("buy" .. i)
      dist = _G.math.abs(button.x - scroll:getCurrentX() - screenWidth * 0.5)
      button.scaleX = 1 - 0.4 * (dist / screenWidth)
      button.scaleY = button.scaleX
      local buy_button = button:getChild("buy" .. i)
      buy_button.x = button.w * button.scaleX / 2 - buy_button.w * button.scaleX / 2 * 1.2
      buy_button.y = button.h * button.scaleY / 2 - buy_button.h * button.scaleY / 2 * 1.2
      local window_image = button:getChild("window_image")
      window_image.x = window_image.x0 * button.scaleX
      window_image.y = window_image.y0 * button.scaleY
      local shade = button:getChild("shade")
      shade.alpha = _G.math.min(dist / screenWidth, 1)
      local shade2 = buy:getChild("shade")
      shade2.alpha = shade.alpha
      local label = button:getChild("label")
      label.x = label.x0 * button.scaleX
      label.y = label.y0 * button.scaleY
      local free_label = button:getChild("free_label")
      free_label.x = free_label.x0 * button.scaleX
      free_label.y = free_label.y0 * button.scaleY
      if deviceModel ~= "android" then
        local price_bg = button:getChild("price_bg")
        price_bg.x = -(button.w * button.scaleX * 0.17)
        price_bg.y = button.h * button.scaleY * 0.285
      end
      if i == scroll:getCurrentAnchor() then
        buy:setEnabled(true)
      else
        buy:setEnabled(false)
      end
      if i == scroll:getCurrentAnchor() - 1 then
        button:setEnabled(true)
        button.returnValue = "SCROLL_PREVIOUS"
      elseif i == scroll:getCurrentAnchor() + 1 then
        button:setEnabled(true)
        button.returnValue = "SCROLL_NEXT"
      else
        button:setEnabled(false)
      end
    end
  end
  self.current_item = scroll:getCurrentAnchor()
  local old_product = self.current_product
  self.current_product = g_shop_items[self.current_item].product
  if old_product ~= self.current_product then
    local description = self:getChild("description")
    description:changeText(g_shop_products[self.current_product].description, description.y)
  end
  for i = 1, #g_powerup_types do
    local product_button = self:getChild("product" .. i)
    if i == find_key(g_powerup_types, self.current_product) or product_button.force_highlight then
      product_button:setImage(g_shop_products[g_powerup_types[i]].icon)
    else
      product_button:setImage(g_shop_products[g_powerup_types[i]].icon .. "_OVERLAY")
    end
  end
  if old_product ~= self.current_product then
    local selection = self:getChild("selection")
    for i = 1, #g_powerup_types do
      if i == find_key(g_powerup_types, self.current_product) then
        local product_button = self:getChild("product" .. i)
        self:getChild("selection"):setTarget(product_button.x)
      end
    end
  end
  local run_time = 2
  if self.increase_amounts then
    if not self.count_start_time then
      self.count_start_time = time
    end
    local continue_counting = false
    for powerup_type, amount in _G.pairs(self.increase_amounts) do
      local powerup_index = find_key(g_powerup_types, powerup_type)
      self:getChild("product" .. powerup_index):setAnimationState("GROW", time)
      local counter = self:getChild("counter_bg" .. powerup_index):getChild("counter")
      counter.text = _G.math.floor(tweenLinear(time - self.count_start_time, self.old_amounts[powerup_index], amount, run_time))
    end
    if run_time < time - self.count_start_time then
      for k, v in _G.pairs(self.increase_amounts) do
        local product = self:getChild("product" .. find_key(g_powerup_types, k))
        product:setAnimationState("SHRINK", time)
      end
      self.count_start_time = nil
      self.increase_amounts = nil
      self:updatePowerupCounters()
    end
  end
  if cheatsEnabled then
    local cheat_button = self:getChild("cheat_button")
    if cheat_button then
      cheat_button.meta = self.current_item
    end
  end
  local initial_scale = 1
  if deviceModel == "android" then
    initial_scale = 0.8
  end
  local description = self:getChild("description")
  description.scaleX = initial_scale
  description.scaleY = initial_scale
  description:clip()
  local description_shade = self:getChild("description_shade")
  if description.textBlockHeight > description_shade.height * 0.98 then
    description.scaleX = 1 / (description.textBlockHeight / description_shade.height * 1.1) * initial_scale
    description.scaleY = 1 / (description.textBlockHeight / description_shade.height * 1.1) * initial_scale
    description:clip()
  end
end
function ProductPage:refreshVisibleChildren()
  local scroll_x = self.scroll:getCurrentX()
  for _, v in _G.ipairs(self.scroll.children) do
    local x = v.x - scroll_x
    v.visible = x > screenWidth * -0.4 and x < screenWidth * 1.4
  end
end
function ProductPage:draw(x, y)
  ui.Frame.draw(self, x, y)
  if isRetinaGraphicsEnabled() then
    setRenderState(0, 0, 1, 1)
    drawRect(0, 0, 0, 1, 0, 0, screenWidth, screenHeight, false)
  end
end
PurchasePage = ui.Frame:inherit()
function PurchasePage:init()
  ui.Frame.init(self)
  local spinner = ui.Image:new()
  spinner.name = "spinner"
  spinner:setImage("IN_APP_LOADING")
  self:addChild(spinner)
  self.spinner_angle = 0
end
function PurchasePage:layout()
  ui.Frame.layout(self)
  local spinner = self:getChild("spinner")
  spinner.x = screenWidth * 0.5
  spinner.y = screenHeight * 0.5
  if isRetinaGraphicsEnabled() then
    spinner.scaleX = 2
    spinner.scaleY = 2
  else
    spinner.scaleY = 1
    spinner.scaleY = 1
  end
end
function PurchasePage:update(dt, time)
  ui.Frame.update(self, dt, time)
  local spinner = self:getChild("spinner")
  self.spinner_angle = self.spinner_angle + dt * 10
  spinner.angle = _G.math.floor(self.spinner_angle / 0.5235983) * 0.5235983
end
function PurchasePage:draw(x, y, scaleX, scaleY, angle)
  setRenderState(0, 0, 1, 1, 0, 0, 0)
  drawRect(0, 0, 0, 0.65, 0, 0, screenWidth, screenHeight, true)
  ui.Frame.draw(self, x, y, scaleX, scaleY, angle)
end
function PurchasePage:onPointerEvent(eventType, x, y)
  if self.no_blocking then
    local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
    return result, meta, item
  else
    return "BLOCK", nil, self
  end
end
function PurchasePage:onKeyEvent(type, key)
  if type ~= "RELEASE" or key == "BACK" or key == "ESCAPE" then
  end
  return "BLOCK", nil, self
end
PurchaseHistory = ui.Frame:inherit()
function PurchaseHistory:init()
  ui.Frame.init(self)
  local bg = ui.Image:new()
  bg.name = "bg"
  bg:setImage("SHOP_BG_1")
  self:addChild(bg)
  local title = ui.Text:new()
  title.name = "title"
  title.text = "PURCHASE HISTORY"
  title.vanchor = "TOP"
  title.x = screenWidth / 2
  title.y = screenHeight * 0.02
  self:addChild(title)
  local back_button = ui.ImageButton:new()
  back_button.name = "back_button"
  back_button:setImage("ARROW_LEFT")
  back_button.returnValue = "CLOSE_HISTORY"
  back_button.attach = "fixed"
  back_button.activateOnRelease = true
  back_button.clickSound = "menu_back"
  self:addChild(back_button)
  local next_button = ui.ImageButton:new()
  next_button.name = "next_button"
  next_button:setImage("BUTTON_ARROW_RIGHT")
  next_button:setAngle(_G.math.pi / 2)
  next_button.returnValue = "NEXT_PAGE"
  next_button.attach = "fixed"
  next_button.activateOnRelease = true
  self:addChild(next_button)
  local previous_button = ui.ImageButton:new()
  previous_button.name = "previous_button"
  previous_button:setImage("BUTTON_ARROW_LEFT")
  previous_button:setAngle(_G.math.pi / 2)
  previous_button.returnValue = "PREVIOUS_PAGE"
  previous_button.attach = "fixed"
  previous_button.activateOnRelease = true
  self:addChild(previous_button)
  local historyScrollFrame = HistoryScrollFrame:new()
  historyScrollFrame.name = "historyScrollFrame"
  historyScrollFrame.start_y = title.y + title:getFontLeading() * 2
  if g_purchaseHistoryLoaded then
    historyScrollFrame:setText(g_purchaseHistoryText)
  else
    historyScrollFrame:setText("")
  end
  self:addChild(historyScrollFrame)
end
function PurchaseHistory:layout()
  ui.Frame.layout(self)
  local bg = self:getChild("bg")
  bg.x = 0
  bg.y = screenHeight
  local sw, sh = _G.res.getSpriteBounds(bg.image)
  if sw < screenWidth then
    bg.scaleX = screenWidth / sw
    bg.scaleY = bg.scaleX
  end
  local title = self:getChild("title")
  title.x = screenWidth / 2
  title.y = screenHeight * 0.02
  local back_button = self:getChild("back_button")
  back_button.x = back_button.w * 0.5 + g_layoutMargin.x
  back_button.y = screenHeight - back_button.h * 0.5 - g_layoutMargin.y
  local next_button = self:getChild("next_button")
  next_button.x = screenWidth * 0.5 + next_button.w
  next_button.y = screenHeight * 0.8
  local previous_button = self:getChild("previous_button")
  previous_button.x = screenWidth * 0.5 - previous_button.w
  previous_button.y = screenHeight * 0.8
end
function PurchaseHistory:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE_HISTORY" then
    if self.spinner_active then
      eventManager:notify({
        id = events.EID_POP_FRAME
      })
    end
    eventManager:notify({
      id = events.EID_CHANGE_SCENE,
      target = ProductPage:new({
        from = self.from,
        product = self.product
      })
    })
  elseif result == "NEXT_PAGE" then
    self:getChild("historyScrollFrame"):next()
  elseif result == "PREVIOUS_PAGE" then
    self:getChild("historyScrollFrame"):previous()
  end
  return result, meta, item
end
function PurchaseHistory:onEntry()
  ui.Frame.onEntry(self)
  eventManager:notify({
    id = events.EID_PUSH_FRAME,
    target = PurchasePage:new({no_blocking = true})
  })
  self.spinner_active = true
  getPurchaseHistory()
end
function PurchaseHistory:update(dt, time)
  ui.Frame.update(self, dt, time)
  if g_purchaseHistoryLoaded and self.spinner_active then
    local history = self:getChild("historyScrollFrame")
    history:setText(g_purchaseHistoryText)
    eventManager:notify({
      id = events.EID_POP_FRAME
    })
    self.spinner_active = false
  end
  local historyScrollFrame = self:getChild("historyScrollFrame")
  local currentAnchor = historyScrollFrame:getCurrentAnchor()
  if self.last_anchor ~= currentAnchor then
    local next_button = self:getChild("next_button")
    local previous_button = self:getChild("previous_button")
    if currentAnchor == #historyScrollFrame.anchors then
      next_button.visible = false
    else
      next_button.visible = true
    end
    if currentAnchor == 1 then
      previous_button.visible = false
    else
      previous_button.visible = true
    end
    self.last_anchor = currentAnchor
  end
end
HistoryScrollFrame = ui.ScrollFrame:inherit()
function HistoryScrollFrame:init()
  ui.ScrollFrame.init(self)
  self.old_text = ""
  self.longest_lines = {
    0,
    0,
    0,
    0
  }
  self.purchased_items = {}
  self.scroll_axis = "y"
  self.line_height = 1
  self.start_y = self.start_y or 0
end
function HistoryScrollFrame:setText(text)
  local history = ui.Text:new()
  history.text = text
  history:clip()
  self.purchased_items = {}
  self.longest_lines = {
    0,
    0,
    0,
    0
  }
  self.line_height = history:getFontLeading()
  for i = 1, #history.lines do
    local start_index = 1
    local item_info = {}
    local line = history.lines[i].text
    for k = 1, 4 do
      local end_index, _ = _G.string.find(line, "\t", start_index)
      local item
      if end_index ~= nil then
        item = ui.Text:new({
          text = _G.string.sub(line, start_index, end_index - 1)
        })
        start_index = end_index + 1
      else
        item = ui.Text:new({
          text = _G.string.sub(line, start_index)
        })
      end
      if item.width > self.longest_lines[k] then
        self.longest_lines[k] = item.width
      end
      _G.table.insert(item_info, k, item)
      self:addChild(item)
    end
    _G.table.insert(self.purchased_items, i, item_info)
  end
  self:layout()
end
function HistoryScrollFrame:layout()
  if self.last_screenHeight ~= screenHeight then
    self:resetState()
    self.last_screenHeight = screenHeight
  end
  local max_height = screenHeight * 0.5
  local max_lines = _G.math.floor(max_height / self.line_height)
  local page_height = self.line_height * max_lines
  local anchors = {}
  local lines = #self.purchased_items or 1
  local anchorAmount = _G.math.max(_G.math.ceil(lines / max_lines), 1)
  for i = 1, anchorAmount do
    _G.table.insert(anchors, i, {
      x = 0,
      y = (i - 1) * page_height
    })
  end
  self:setAnchors(anchors)
  local y_margin = self.start_y + screenHeight * 0.02 + self.line_height / 2
  local x_margin = screenWidth * 0.02
  local x_spacing = screenWidth / 4 / 2
  for i, v in _G.ipairs(self.purchased_items) do
    local field_amount = #self.purchased_items[1]
    for k = 1, field_amount do
      if k == 1 then
        v[k].hanchor = "LEFT"
        v[k].x = x_margin
      elseif k == field_amount then
        v[k].hanchor = "RIGHT"
        v[k].x = screenWidth - x_margin
      elseif k <= field_amount / 2 then
        v[k].x = v[k - 1].x + self.longest_lines[k - 1] + x_margin
        v[k].hanchor = "LEFT"
      else
        v[k].x = screenWidth - x_margin - self.longest_lines[k + 1] - x_margin
        v[k].hanchor = "RIGHT"
      end
      v[k].y = y_margin + self.line_height * (i - 1)
    end
  end
  self:setClip({
    x = 0,
    y = self.start_y + screenHeight * 0.02,
    w = screenWidth,
    h = page_height
  })
end
PowerupTutorial = ui.Frame:inherit()
function PowerupTutorial:init()
  ui.Frame.init(self)
  self.initial_product = self.product
  local bg = ui.Image:new()
  bg.name = "bg"
  bg:setImage("SHOP_BG_1")
  self:addChild(bg)
  local scroll = ui.ScrollFrame:new()
  scroll.name = "scroll"
  self:addChild(scroll)
  for k, v in _G.ipairs(g_powerup_types) do
    local product_tutorial = ui.ImageButton:new()
    product_tutorial.name = "tutorial" .. k
    product_tutorial:setImage(g_shop_products[v].tutorial)
    product_tutorial.returnValue = "CLICKED_" .. g_shop_products[v].tutorial
    product_tutorial.activateOnRelease = true
    scroll:addChild(product_tutorial)
    if self.product == v then
      self.product_index = k
    end
  end
  local back_button = ui.ImageButton:new()
  back_button.name = "back_button"
  back_button:setImage("ARROW_LEFT")
  back_button.returnValue = "CLOSE_TUTORIAL"
  back_button.attach = "fixed"
  back_button.activateOnRelease = true
  back_button.clickSound = "menu_back"
  self:addChild(back_button)
  local left_button = ui.ImageButton:new()
  left_button.name = "left_button"
  left_button:setImage("BUTTON_ARROW_LEFT")
  left_button.returnValue = "SCROLL"
  left_button.meta = 1
  self:addChild(left_button)
  local right_button = ui.ImageButton:new()
  right_button.name = "right_button"
  right_button:setImage("BUTTON_ARROW_RIGHT")
  right_button.returnValue = "SCROLL"
  right_button.meta = -1
  self:addChild(right_button)
  for i = 1, #g_powerup_types do
    local dot = ui.Image:new()
    dot.name = "dot" .. i
    dot:setImage("LS_DOT_BLACK")
    self:addChild(dot)
    local pageNumber = ui.Text:new()
    pageNumber.name = "pageNumber" .. i
    pageNumber.font = "FONT_LS_SMALL"
    pageNumber.visible = false
    pageNumber.text = _G.tostring(i)
    self:addChild(pageNumber)
  end
end
function PowerupTutorial:layout()
  ui.Frame.layout(self)
  local bg = self:getChild("bg")
  bg.x = 0
  bg.y = screenHeight
  local sw, sh = _G.res.getSpriteBounds(bg.image)
  if sw < screenWidth then
    bg.scaleX = screenWidth / sw
    bg.scaleY = bg.scaleX
  end
  local back_button = self:getChild("back_button")
  back_button.x = back_button.w * 0.5 + g_layoutMargin.x
  back_button.y = screenHeight - back_button.h * 0.5 - g_layoutMargin.y
  local border, _ = _G.res.getSpriteBounds("BUTTON_ARROW_LEFT") + g_layoutMargin.x, nil
  local scroll = self:getChild("scroll")
  local anchors = {}
  for i = 1, #g_powerup_types do
    _G.table.insert(anchors, i, {
      x = (i - 1) * screenWidth * 0.7,
      y = 0
    })
    local product_tutorial = self:getChild("tutorial" .. i)
    product_tutorial.x = screenWidth * 0.5 + (i - 1) * screenWidth * 0.7
    product_tutorial.y = screenHeight * 0.4
  end
  scroll:setAnchors(anchors)
  scroll:setClip({
    x = border,
    y = 0,
    w = screenWidth - border * 2,
    h = screenHeight
  })
  scroll:setCurrentAnchor(find_key(g_powerup_types, self.product))
  local left_button = self:getChild("left_button")
  local right_button = self:getChild("right_button")
  local sw, sh = _G.res.getSpriteBounds(left_button.image)
  left_button.x = sw * 0.5 + g_layoutMargin.x
  left_button.y = screenHeight * 0.5
  right_button.x = screenWidth - sw * 0.5 - g_layoutMargin.x
  right_button.y = screenHeight * 0.5
  local dot_y = 10
  local dot_spacing = 15
  local first_dot_x = screenWidth * 0.5 - (#g_powerup_types - 1) * 0.5 * dot_spacing
  local text_y = 0.03 * screenHeight + 12
  for i = 1, #g_powerup_types do
    local dot = self:getChild("dot" .. i)
    dot.x = first_dot_x + dot_spacing * (i - 1)
    dot.y = screenHeight - dot_y - g_layoutMargin.y
    local pageNumber = self:getChild("pageNumber" .. i)
    pageNumber.x = dot.x
    pageNumber.y = screenHeight - text_y - g_layoutMargin.y
  end
end
function PowerupTutorial:onPointerEvent(eventType, x, y)
  local result, meta, item = ui.Frame.onPointerEvent(self, eventType, x, y)
  if result == "CLOSE_TUTORIAL" then
    self:exit()
  elseif result == "SCROLL" then
    if meta < 0 then
      self:getChild("scroll"):next()
    else
      self:getChild("scroll"):previous()
    end
  elseif result == "CLICKED_TUTORIAL_SUPERSEED" then
    if not _G.res.isAudioPlaying(getAudioName("big_bird")) then
      _G.res.playAudio(getAudioName("big_bird"), 1, false)
    end
  elseif result == "CLICKED_TUTORIAL_POWERSLING" then
    if not _G.res.isAudioPlaying(getAudioName("super_shot")) then
      _G.res.playAudio("super_shot", 1, false)
    end
  elseif result == "CLICKED_TUTORIAL_SLINGSCOPE" then
    if not _G.res.isAudioPlaying(getAudioName("laser_sight")) then
      _G.res.playAudio("laser_sight", 1, false)
    end
  elseif result == "CLICKED_TUTORIAL_BIRDQUAKE" then
    if not _G.res.isAudioPlaying(getAudioName("earthquake")) then
      _G.res.playAudio(getAudioName("earthquake"), 1, false)
    end
  elseif result == "CLICKED_TUTORIAL_BUNDLE" and not _G.res.isAudioPlaying(getAudioName("powerup_intro")) then
    _G.res.playAudio(getAudioName("powerup_intro"), 1, false)
  end
  return result, meta, item
end
function PowerupTutorial:onKeyEvent(type, key)
  local result, meta, item = ui.Frame.onKeyEvent(self, type, key)
  if not result and type == "RELEASE" and (key == "BACK" or key == "ESCAPE") then
    self:exit()
  end
  return result, meta, item
end
function PowerupTutorial:exit()
  if self.product ~= self.initial_product then
    self.item = nil
  end
  eventManager:notify({
    id = events.EID_CHANGE_SCENE,
    target = ProductPage:new({
      from = self.from,
      current_product = self.product,
      current_item = self.item
    })
  })
end
function PowerupTutorial:update(dt, time)
  local scroll = self:getChild("scroll")
  local old_index = scroll:getCurrentAnchor()
  ui.Frame.update(self, dt, time)
  local index = scroll:getCurrentAnchor()
  self:getChild("left_button"):setVisible(index > 1)
  self:getChild("right_button"):setVisible(index < #g_powerup_types)
  self.product = g_powerup_types[index]
  self.product_index = index
  if old_index ~= index then
    self:refreshDots(index, old_index)
  end
end
function PowerupTutorial:onEntry()
  ui.Frame.onEntry(self)
  self:refreshDots(self.product_index, self.product_index)
end
function PowerupTutorial:refreshDots(index, old_index)
  local new_dot = self:getChild("dot" .. index)
  if new_dot ~= nil then
    self:getChild("dot" .. old_index):setImage("LS_DOT_BLACK")
    self:getChild("pageNumber" .. old_index).visible = false
    new_dot:setImage("LS_DOT_WHITE")
    self:getChild("pageNumber" .. index).visible = false
  end
end
filename = "shop2.lua"
