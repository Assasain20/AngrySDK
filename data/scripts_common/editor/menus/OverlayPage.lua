OverlayPage = Page:new()
function OverlayPage:init()
  self:insertItem("shade", RectItem:new({alpha = 0}))
  self:insertItem("kingText", TextItem:new({
    default = "Pigs popped: ",
    text = "Pigs popped: ",
    x = screenWidth / 2,
    y = screenHeight / 2,
    visible = false
  }))
  self:insertItem("trainText", TextItem:new({
    default = "Carts wrecked: ",
    text = "Carts Wrecked: ",
    x = screenWidth / 2,
    y = screenHeight / 2,
    visible = false
  }))
  self:insertItem("again", TextItem:new({
    text = "Try again",
    x = screenWidth / 2,
    y = screenHeight / 2 + 0.15625 * screenHeight,
    visible = false,
    action = {
      [function(x)
        sm:changeScene(x)
      end] = "kingOfTheHill"
    }
  }))
  self:insertItem("quit", TextItem:new({
    text = "Quit",
    x = screenWidth / 2,
    y = screenHeight / 2 + 0.25 * screenHeight,
    visible = false,
    action = {
      [function(x)
        sm:changeScene(x)
      end] = "mainMenu"
    }
  }))
end
function OverlayPage:onEntry()
  self.items.shade.x1 = 0
  self.items.shade.x2 = screenWidth
  self.items.shade.y1 = 0
  self.items.shade.y2 = screenHeight
end
function OverlayPage:update(dt, time)
  if self.fadeIn == true then
    self.fadeTime = self.fadeTime - dt
    self.items.shade.alpha = self.items.shade.alpha + dt * self.fadeIncrement
    if self.fadeTime < 0 then
      self.fadeIn = false
      self.items.shade.alpha = self.fadeTo
      self.fadeTime = 0
    end
  elseif self.fadeOut == true then
    self.fadeTime = self.fadeTime - dt
    self.items.shade.alpha = self.items.shade.alpha - dt * self.fadeIncrement
    if self.fadeTime < 0 then
      self.fadeOut = false
      self.items.shade.alpha = self.fadeTo
      self.fadeTime = 0
    end
  end
end
function OverlayPage:initTexts(score)
  self.visible = true
  self.items.kingText.text = self.items.kingText.default .. score
  self.items.kingText.visible = true
  self.items.again.visible = true
  self.items.quit.visible = true
  self:fade(0, 0.3, 1)
end
function OverlayPage:initTrainTexts(score)
  self.visible = true
  self.items.trainText.text = self.items.trainText.default .. score
  self.items.trainText.visible = true
  self.items.again.visible = true
  self.items.quit.visible = true
  self:fade(0, 0.3, 1)
end
function OverlayPage:updatePositions()
  self.items.shade.x2 = screenWidth
  self.items.shade.y2 = screenHeight
  self.items.kingText.x = screenWidth / 2
  self.items.kingText.y = screenHeight / 2
  self.items.trainText.x = screenWidth / 2
  self.items.trainText.y = screenHeight / 2
  self.items.again.x = screenWidth / 2
  self.items.again.y = screenHeight / 2 + 0.15625 * screenHeight
  self.items.quit.x = screenWidth / 2
  self.items.quit.y = screenHeight / 2 + 0.25 * screenHeight
end
function OverlayPage:fade(from, to, time)
  if from < to then
    self.items.shade.alpha = from
    self.fadeTo = to
    self.fadeIncrement = (to - from) / time
    self.fadeTime = time
    self.fadeIn = true
  else
    self.items.shade.alpha = from
    self.fadeTo = to
    self.fadeIncrement = (from - to) / time
    self.fadeTime = time
    self.fadeOut = true
  end
end
