Text = Frame:inherit()
function Text:init()
  self.text = self.text or ""
  self.group = self.group or "TEXTS_BASIC"
  self.textBoxSize = self.textBoxSize or gamelua.screenWidth
  self.hanchor = self.hanchor or "HCENTER"
  self.vanchor = self.vanchor or "VCENTER"
  if _G.type(self.font) == "function" then
    self.getFontFunction = self.font
    self.font = self.getFontFunction()
  end
  self.font = self.font or gamelua.fontBasic
  self.scaleX = 1
  self.scaleY = 1
  self.visible = true
  self.floorCoordinates = true
  if gamelua.setFont then
    gamelua.setFont(self.font)
    local textContent = self.text
    if self.group ~= "" then
      textContent = _G.res.getString(self.group, self.text)
    end
    self.width = _G.res.getStringWidth(textContent)
  else
    self.width = 0
  end
end
function Text:setFont(font)
  if _G.type(font) == "function" then
    self.getFontFunction = font
    self.font = self.getFontFunction()
  else
    self.font = font
  end
end
function Text:layout()
  if self.getFontFunction ~= nil then
    self.font = self.getFontFunction()
  end
end
function Text:clip()
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
function Text:checkBounds(xCoord, yCoord)
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
function Text:getCorrectionParams()
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
function Text:drawFast(x, y)
  gamelua.setFont(self.font)
  _G.res.drawString(self.group, self.text, _G.math.floor(self.x + x), _G.math.floor(self.y + y), self.hanchor, self.vanchor)
end
local debug_draw = false
local pivot_correction = {
  HCENTER = 0.5,
  VCENTER = 0.5,
  LEFT = 0,
  RIGHT = 1,
  TOP = 0,
  BOTTOM = 1
}
if not debug_draw then
  Text.draw = gamelua.drawUITextNative
else
  function Text:draw(x, y, scale_x, scale_y, angle, hover_scale)
    if hover_scale ~= nil then
      gamelua.drawUITextNative(self, x, y, scale_x, scale_y, angle, hover_scale)
    else
      gamelua.drawUITextNative(self, x, y, scale_x, scale_y, angle)
    end
    local w = _G.res.getStringWidth(_G.res.getString(self.group, _G.tostring(self.text)))
    local l = _G.res.getFontLeading()
    local hp = pivot_correction[self.hanchor]
    local vp = pivot_correction[self.vanchor]
    local x1 = x + self.x - hp * w
    local y1 = y + self.y - vp * l
    local x2 = x1 + w
    local y2 = y1 + l
    gamelua.drawRect(1, 1, 1, 0.2, x1, y1, x2, y2, false)
    gamelua.setRenderState(0, 0, 1, 1, 0, 0, 0)
    gamelua.drawLine2D(x1, y1, x2, y1, 1, 0, 255, 255, 255)
    gamelua.drawLine2D(x2, y1, x2, y2, 1, 0, 255, 255, 255)
    gamelua.drawLine2D(x2, y2, x1, y2, 1, 0, 255, 255, 255)
    gamelua.drawLine2D(x1, y2, x1, y1, 1, 0, 255, 255, 255)
    gamelua.drawLine2D(x1, y + self.y, x2, y + self.y, 1, 0, 0, 255, 0)
  end
end
function Text:getHeight()
  local scaleY = self.scaleY or 1
  if self.clipped then
    return #self.lines * self:getFontLeading() * scaleY
  else
    return self:getFontLeading() * scaleY
  end
end
function Text:getWidth()
  gamelua.setFont(self.font)
  return _G.res.getStringWidth(_G.res.getString(self.group, _G.tostring(self.text)))
end
function Text:getFontLeading()
  gamelua.setFont(self.font)
  local h = _G.res.getFontLeading()
  return h
end
filename = "Text.lua"
