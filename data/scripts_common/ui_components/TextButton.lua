TextButton = Frame:inherit()
function TextButton:init()
  self.text = self.text or ""
  self.group = self.group or "TEXTS_BASIC"
  self.textBoxSize = self.textBoxSize or gamelua.screenWidth
  self.hanchor = self.hanchor or "HCENTER"
  self.vanchor = self.vanchor or "VCENTER"
  self.font = self.font or "FONT_BASIC"
  self.scaleX = 1
  self.scaleY = 1
  self.meta = self
  if _G.type(self.font) == "function" then
    self.getFontFunction = self.font
    self.font = self.getFontFunction()
  end
  self.font = self.font or gamelua.fontBasic
  gamelua.setFont(self.font)
  local textContent = self.text
  if self.group ~= "" then
    textContent = _G.res.getString(self.group, self.text)
  end
  self.width = _G.res.getStringWidth(textContent)
  self.enabled = true
end
function TextButton:setFont(font)
  if _G.type(font) == "function" then
    self.getFontFunction = font
    self.font = self.getFontFunction()
  else
    self.font = font
  end
end
function TextButton:clip()
  local scaleX, scaleY = self.scaleY or self.scaleX or 1, 1
  gamelua.setFont(self.font)
  gamelua.clipText(self.group, self.text, self.textBoxSize / scaleX)
  local fl = _G.res.getFontLeading() * scaleY
  self.textBlockHeight = #gamelua.clippedText.lines * fl
  self.widestLine = gamelua.clippedText.widestLine
  self.lines = {}
  local k = 1
  local yCorrection = 0
  if self.vanchor == "VCENTER" then
    yCorrection = -self.textBlockHeight / 2 + fl / 2
  elseif self.vanchor == "BOTTOM" then
    yCorrection = -self.textBlockHeight + fl
  end
  while k <= #gamelua.clippedText.lines do
    local l = gamelua.clippedText.lines[k]
    local tmpItm = Text:new({
      font = self.font,
      text = l,
      y = yCorrection,
      scaleX = self.scaleX,
      scaleY = self.scaleY,
      hanchor = self.hanchor,
      vanchor = self.vanchor,
      height = fl
    })
    _G.table.insert(self.lines, tmpItm)
    k = k + 1
    yCorrection = yCorrection + fl
  end
  self.clipped = true
end
function TextButton:checkBounds(xCoord, yCoord)
  local w = _G.res.getStringWidth(_G.res.getString(self.group, self.text))
  if w > self.width then
    self.width = w
  end
  if self.clipped then
    for i = 1, #self.lines do
      if self.lines[i]:checkBounds(xCoord, yCoord) then
        return true
      end
    end
  else
    local fl = _G.res.getFontLeading()
    local xCorrection, yCorrection = self:getCorrectionParams()
    return yCoord >= self.y + yCorrection and yCoord <= self.y + yCorrection + fl and xCoord >= self.x + xCorrection and xCoord <= self.x + xCorrection + self.width
  end
end
function TextButton:layout()
  if self.getFontFunction ~= nil then
    self.font = self.getFontFunction()
  end
end
function TextButton:getCorrectionParams()
  local fl = _G.res.getFontLeading()
  local xCorrection, yCorrection = 0, 0
  if self.hanchor == "HCENTER" then
    xCorrection = -self.width / 2
  elseif self.hanchor == "RIGHT" then
    xCorrection = -self.width
  elseif self.hanchor == "LEFT" then
    xCorrection = 0
  end
  if self.vanchor == "VCENTER" then
    yCorrection = -fl / 2
  elseif self.vanchor == "BOTTOM" then
    yCorrection = -fl
  elseif self.vanchor == "TOP" then
    yCorrection = 0
  end
  return xCorrection, yCorrection
end
function TextButton:draw(x, y, scaleX, scaleY, angle)
  x = x or 0
  y = y or 0
  scaleX = scaleX or 1
  scaleY = scaleY or 1
  angle = angle or 0
  local finalScaleX = scaleX * self.scaleX
  local finalScaleY = scaleY * self.scaleY
  if self.visible ~= false then
    if self.font ~= nil then
      gamelua.setFont(self.font)
    else
      gamelua.setFont("FONT_BASIC")
    end
    if self.clipped then
      for i = 1, #self.lines do
        self.lines[i].scaleX = self.scaleX
        self.lines[i].scaleY = self.scaleY
        self.lines[i]:draw(x + self.x, y + self.y, scaleX, scaleY, angle)
      end
    else
      local xCoord, yCoord = self.x + x, self.y + y
      local xCorrection, yCorrection = self:getCorrectionParams()
      local px, py = self.pivotY or self.pivotX or 0, 0
      px = self.width / 2
      py = _G.res.getFontLeading() / 2
      local rotPx, rotPy = self.rotationPivotY or self.rotationPivotX or 0, 0
      if self.floorCoordinates ~= false then
        xCoord = _G.math.floor(xCoord / finalScaleX)
        yCoord = _G.math.floor(yCoord / finalScaleY)
      else
        xCoord = xCoord / finalScaleX
        yCoord = yCoord / finalScaleY
      end
      if debugDraw then
        gamelua.setRenderState(0, 0, 1, 1, 0, 0, 0)
        gamelua.drawRect(0.5, 1, 1, 0.5, self.x + xCorrection, self.y + yCorrection, self.x + xCorrection + self.width, self.y + yCorrection + self:getFontLeading(), true)
      end
      gamelua.setRenderState(0, 0, finalScaleX, finalScaleY, angle, rotPx, rotPy)
      _G.res.drawString(self.group, self.text, xCoord, yCoord, self.hanchor, self.vanchor)
      gamelua.setRenderState(0, 0, 1, 1, 0, 0, 0)
    end
  end
end
function TextButton:onPointerEvent(eventType, x, y)
  if (not self.activateOnRelease and eventType == "LPRESS" or self.activateOnRelease and eventType == "LRELEASE") and self.enabled ~= false and self:checkBounds(x, y) then
    return self.returnValue, self.meta, self
  end
  return Frame.onPointerEvent(self, eventType, x, y)
end
function TextButton:getHeight()
  local scaleY = self.scaleY or 1
  if self.clipped then
    return #self.lines * self:getFontLeading() * scaleY
  else
    return self:getFontLeading() * scaleY
  end
end
function TextButton:getFontLeading()
  gamelua.setFont(self.font)
  local h = _G.res.getFontLeading()
  return h
end
filename = "TextButton.lua"
