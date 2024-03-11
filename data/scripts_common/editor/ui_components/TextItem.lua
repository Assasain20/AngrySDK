TextItem = Item:new({
  text = "",
  group = "TEXTS_BASIC",
  textBoxSize = screenWidth,
  hanchor = "HCENTER",
  vanchor = "VCENTER"
})
function TextItem:init()
  self.text = self.text or ""
  self.group = self.group or "TEXTS_BASIC"
  self.textBoxSize = self.textBoxSize or screenWidth
  self.hanchor = self.hanchor or "HCENTER"
  self.vanchor = self.vanchor or "VCENTER"
  self.width = _G.res.getStringWidth(_G.res.getString(self.group, self.text))
end
function TextItem:clip()
  setFont(self.font)
  clipText(self.group, self.text, self.textBoxSize)
  local fl = _G.res.getFontLeading()
  self.textBlockHeight = #clippedText.lines * fl
  self.widestLine = clippedText.widestLine
  self.lines = {}
  local k = 1
  local yCorrection = 0
  if self.vanchor == "VCENTER" then
    yCorrection = -self.textBlockHeight / 2 + fl / 2
  elseif self.vanchor == "BOTTOM" then
    yCorrection = -self.textBlockHeight + fl
  end
  while k <= #clippedText.lines do
    local l = clippedText.lines[k]
    local tmpItm = TextItem:new({
      font = self.font,
      text = l,
      x = self.x,
      y = self.y + yCorrection,
      hanchor = self.hanchor,
      vanchor = self.vanchor
    })
    _G.table.insert(self.lines, tmpItm)
    k = k + 1
    yCorrection = yCorrection + fl
  end
  self.clipped = true
end
function TextItem:checkBounds(xCoord, yCoord)
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
    return yCoord >= self.y + yCorrection and yCoord <= self.y + yCorrection + fl and xCoord >= self.x + xCorrection and xCoord <= self.x + xCorrection + self.width
  end
end
function TextItem:draw()
  if self.visible ~= false then
    setFont(self.font)
    if self.clipped then
      for i = 1, #self.lines do
        self.lines[i]:draw()
      end
    else
      _G.res.drawString(self.group, self.text, self.x, self.y, self.hanchor, self.vanchor)
    end
  end
end
