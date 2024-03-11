MenuManager = {}
function MenuManager:new(o)
  o = o or {}
  _G.setmetatable(o, self)
  self.__index = self
  o.links = {}
  o.currentRoot = nil
  o.screenWidth = screenWidth
  o.screenHeight = screenHeight
  o.queudRoot = nil
  o.allowInput = true
  o.updateEnabled = true
  o.delegateBackClicks = true
  o.menus = {}
  o.menu_order = {"root"}
  o.input_order = {"root"}
  o.menu_queue = {}
  o.multi_touch_activation_count = 0
  o.touches_down = {}
  return o
end
function MenuManager:eventTriggered(event)
  if event.id == gamelua.events.EID_CHANGE_SCENE then
    _G.assert(event.target ~= nil, "no target for event")
    self.delegateBackClicks = true
    if _G.type(event.target) == "table" then
      self:changeRoot(event.target, event.menu or "root")
    else
      self:handleResult(event.target, event.menu or "root")
    end
  elseif event.id == gamelua.events.EID_PUSH_FRAME then
    local frame
    local menu_name = event.menu or "root"
    local targetRoot = self.menu_queue[menu_name] or self.menus[menu_name]
    local queued = self.menu_queue[menu_name] ~= nil
    if _G.type(event.target) == "string" then
      frame = self.links[event.target].instance
    else
      frame = event.target
    end
    gamelua.eventManager:notify({
      id = gamelua.events.EID_FRAME_PUSHED,
      frame = frame,
      menu = menu_name
    })
    targetRoot.in_init = true
    targetRoot:addChild(frame)
    targetRoot.in_init = false
    if not queued then
      frame:onEntry()
      frame:layout()
    end
  elseif event.id == gamelua.events.EID_POP_FRAME then
    self:popFrame(event.menu or "root")
  end
end
function MenuManager:popFrame(menu)
  menu = menu or "root"
  local targetRoot = self.menu_queue[menu] or self.menus[menu]
  local popped_frame = targetRoot:popChild()
  popped_frame:onExit()
  return popped_frame
end
function MenuManager:addLink(action, menu, ...)
  self.links[action] = {type = "link", instance = menu}
end
function MenuManager:getLink(action)
  if self.links[action] then
    return self.links[action].instance
  end
  return nil
end
function MenuManager:handleResult(result, menu)
  local link = self.links[result]
  if link.type == "link" then
    self:changeRoot(link.instance, menu)
  end
end
function MenuManager:setRootVisible(visible, menu)
  menu = menu or "root"
  local root = self.menu_queue[menu] or self.menus[menu]
  _G.assert(root ~= nil, "no root to set visible")
  root.visible = true
end
function MenuManager:deactivate()
  self:changeRoot(nil, "root")
end
function MenuManager:getRoot(menu)
  menu = menu or "root"
  local root = self.menu_queue[menu] or self.menus[menu]
  return root
end
local enterMenu = function(menu)
  if not gamelua.useDynamicAssets then
    return
  end
  menu:prepareForDynamicAssets()
  gamelua.dynamic.load(gamelua.dynamic.getRequirements(menu))
end
local exitMenu = function(menu)
  if not gamelua.useDynamicAssets then
    return
  end
  gamelua.dynamic.delayrelease(gamelua.dynamic.getRequirements(menu))
end
function MenuManager:setRoot(root, menu)
  menu = menu or "root"
  self.menus[menu] = root
  if root ~= nil then
    if gamelua.ui.Frame.entryCounts ~= nil then
    end
    enterMenu(self.menus[menu])
    self.menus[menu]:onEntry()
    if menu == "root" then
      local bg = root.backgroundColour
      if bg then
        gamelua.drawRect(bg.r / 255, bg.g / 255, bg.b / 255, bg.a / 255, 0, 0, gamelua.screenWidth, gamelua.screenHeight, false)
      end
    end
    self.menus[menu]:layout()
    gamelua.eventManager:notify({
      id = gamelua.events.EID_MENUMANAGER_ROOT_CHANGED,
      root = root,
      menu = menu
    })
  end
end
function MenuManager:exitCurrentRoot(menu)
  menu = menu or "root"
  if self.menus[menu] ~= nil then
    self.menus[menu]:onExit()
    exitMenu(self.menus[menu])
    self.menus[menu] = nil
  end
end
function MenuManager:changeRoot(root, menu)
  menu = menu or "root"
  if root == nil then
    self:exitCurrentRoot(menu)
  end
  self.menu_queue[menu] = root
end
function MenuManager:isMenuActive(menu)
  menu = menu or "root"
  return self.menus[menu] ~= nil
end
function MenuManager:gameResumed()
  for _, v in _G.pairs(self.menus) do
    v:layout()
  end
end
function MenuManager:update(dt, time)
  if not self.updateEnabled then
    return
  end
  for k, v in _G.pairs(self.menu_queue) do
    self:exitCurrentRoot(k)
    self:setRoot(v, k)
    self.menu_queue[k] = nil
  end
  local resolution_changed = false
  if self.screenWidth ~= gamelua.screenWidth or self.screenHeight ~= gamelua.screenHeight then
    resolution_changed = true
    self.screenWidth = gamelua.screenWidth
    self.screenHeight = gamelua.screenHeight
  end
  for _, v in _G.ipairs(self.menu_order) do
    local menu = self.menus[v]
    if menu then
      if resolution_changed then
        menu:layout()
      end
      menu:update(dt, time)
    end
  end
  self:delegateClicks()
  self:delegateKeyEvents()
  if self.multi_touch_activation_count > 0 then
    self:delegateMultiTouchEvents()
  end
end
function MenuManager:draw()
  _G.res.setClipRect(0, 0, gamelua.screenWidth, gamelua.screenHeight)
  if self.menus.root and self.menus.root.backgroundColour then
    local bg = self.menus.root.backgroundColour
    gamelua.setBGColor(bg.r, bg.g, bg.b)
  end
  for _, v in _G.ipairs(self.menu_order) do
    local menu = self.menus[v]
    if menu then
      menu:draw(0, 0)
    end
  end
end
function MenuManager:setAllowInput(allowInput)
  self.allowInput = allowInput
end
function MenuManager:setUpdateEnabled(enabled)
  self.updateEnabled = enabled
end
function MenuManager:delegateKeyEvents()
  if self.allowInput and self.delegateBackClicks and self.menus.root ~= nil then
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.keyReleased.KEY_BACK and menu ~= nil then
        local result, meta = menu:onKeyEvent("RELEASE", "BACK")
        if result then
          break
        end
      end
    end
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.keyReleased.RETURN and menu ~= nil then
        local result, meta = menu:onKeyEvent("RELEASE", "RETURN")
        if result then
          break
        end
      end
    end
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.keyReleased.KEY_MENU and menu ~= nil then
        local result, meta = menu:onKeyEvent("RELEASE", "KEY_MENU")
        if result then
          break
        end
      end
    end
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.keyReleased.ESCAPE and menu ~= nil then
        local result, meta = menu:onKeyEvent("RELEASE", "ESCAPE")
        if result then
          break
        end
      end
    end
    if gamelua.deviceModel == "windows" or gamelua.deviceModel == "osx" then
      if not gamelua.keyHold.CONTROL then
        local characters = {
          "A",
          "B",
          "C",
          "D",
          "E",
          "F",
          "G",
          "H",
          "I",
          "J",
          "K",
          "L",
          "M",
          "N",
          "O",
          "P",
          "Q",
          "R",
          "S",
          "T",
          "U",
          "V",
          "W",
          "X",
          "Y",
          "Z"
        }
        for _, v in _G.pairs(characters) do
          if gamelua.keyPressed[v] then
            self.menus.root:onKeyEvent("PRESS", v)
          end
          if gamelua.keyHold[v] then
            self.menus.root:onKeyEvent("HOLD", v)
          end
          if gamelua.keyReleased[v] then
            self.menus.root:onKeyEvent("RELEASE", v)
          end
        end
      end
      local extra_keys = {
        BACKSPACE = "BACKSPACE",
        SUBTRACT = "-",
        DASH = "-",
        LEFT = "LEFT",
        RIGHT = "RIGHT",
        UP = "UP",
        DOWN = "DOWN"
      }
      for k, v in _G.pairs(extra_keys) do
        if gamelua.keyPressed[k] then
          self.menus.root:onKeyEvent("PRESS", v)
        end
        if gamelua.keyHold[k] then
          self.menus.root:onKeyEvent("HOLD", v)
        end
        if gamelua.keyReleased[k] then
          self.menus.root:onKeyEvent("RELEASE", v)
        end
      end
      if gamelua.keyHold.CONTROL then
        local ctrl_keys = {V = "PASTE"}
        for k, v in _G.pairs(ctrl_keys) do
          if gamelua.keyPressed[k] then
            self.menus.root:onKeyEvent("PRESS", v)
          end
          if gamelua.keyHold[k] then
            self.menus.root:onKeyEvent("HOLD", v)
          end
          if gamelua.keyReleased[k] then
            self.menus.root:onKeyEvent("RELEASE", v)
          end
        end
      end
    elseif gamelua.deviceModel == "roku" or gamelua.deviceModel == "freebox" then
      local extra_keys = {
        PAUSE = "PAUSE",
        F5 = "RESTART",
        UP = "UP",
        DOWN = "DOWN",
        LEFT = "LEFT",
        RIGHT = "RIGHT",
        PAGEUP = "FORWARD",
        PAGEDOWN = "BACKWARD",
        KEY_GAMING_A = "BUTTON_A",
        KEY_GAMING_B = "BUTTON_B",
        KEY_MENU = "KEY_MENU"
      }
      if gamelua.keyHold.UP then
        self.menus.root:onKeyEvent("HOLD", extra_keys.UP)
      end
      if gamelua.keyHold.DOWN then
        self.menus.root:onKeyEvent("HOLD", extra_keys.DOWN)
      end
      for k, v in _G.pairs(extra_keys) do
        if gamelua.keyPressed[k] then
          self.menus.root:onKeyEvent("PRESS", v)
        elseif gamelua.keyReleased[k] then
          self.menus.root:onKeyEvent("RELEASE", v)
        end
      end
    end
  end
end
function MenuManager:delegateClicks()
  if self.allowInput then
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.keyPressed.LBUTTON and menu ~= nil then
        local result, meta = menu:onPointerEvent("LPRESS", gamelua.cursor.x, gamelua.cursor.y)
        if result then
          break
        end
      end
    end
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.keyHold.LBUTTON and menu ~= nil then
        local result, meta = menu:onPointerEvent("LHOLD", gamelua.cursor.x, gamelua.cursor.y)
        if result then
          break
        end
      end
    end
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.keyReleased.LBUTTON and menu ~= nil then
        local result, meta = menu:onPointerEvent("LRELEASE", gamelua.cursor.x, gamelua.cursor.y)
        if result then
          break
        end
      end
    end
    for _, v in _G.ipairs(self.input_order) do
      local menu = self.menus[v]
      if gamelua.cursor.wheelTriggered and menu ~= nil then
        local result, meta, item = menu:onPointerEvent("WHEEL", gamelua.cursor.x, gamelua.cursor.y)
        if result then
          break
        end
      end
    end
    if gamelua.g_enableHoverScaling then
      local item
      for _, v in _G.ipairs(self.input_order) do
        local menu = self.menus[v]
        if menu then
          local result, _
          result, _, item = menu:onPointerEvent("HOVER", gamelua.cursor.x, gamelua.cursor.y)
          if result then
            break
          end
        end
      end
      if (not item or item ~= self.hovered_item) and self.hovered_item and self.hovered_item.onMouseLeave then
        self.hovered_item:onMouseLeave()
      end
      if item and item ~= self.hovered_item and item.onMouseEnter then
        item:onMouseEnter()
      end
      if item and item == self.hovered_item and item.onMouseHover then
        item:onMouseHover()
      end
      self.hovered_item = item
    end
  end
end
function MenuManager:delegateMultiTouchEvents()
  if self.allowInput then
    local touches = gamelua.touches
    local new_touches = {}
    for k, v in _G.pairs(touches) do
      if not self.touches_down[k] then
        for _, v2 in _G.ipairs(self.input_order) do
          local menu = self.menus[v2]
          if menu then
            local result, meta, item = menu:onTouchEvent("TOUCHDOWN", k, v.x, v.y)
            if result then
              break
            end
          end
        end
      elseif self.touches_down[k] then
        for _, v2 in _G.ipairs(self.input_order) do
          local menu = self.menus[v2]
          if menu then
            local result, meta, item = menu:onTouchEvent("TOUCHHOLD", k, v.x, v.y)
            if result then
              break
            end
          end
        end
      end
      new_touches[k] = v
    end
    for k, v in _G.pairs(self.touches_down) do
      if not touches[k] then
        for _, v2 in _G.ipairs(self.input_order) do
          local menu = self.menus[v2]
          if menu then
            local result, meta, item = menu:onTouchEvent("TOUCHUP", k, v.x, v.y)
            if result then
              break
            end
          end
        end
      end
    end
    self.touches_down = new_touches
  end
end
function MenuManager:enableMultiTouch()
  self.multi_touch_activation_count = self.multi_touch_activation_count + 1
end
function MenuManager:disableMultiTouch()
  self.multi_touch_activation_count = self.multi_touch_activation_count - 1
end
filename = "MenuManager.lua"
