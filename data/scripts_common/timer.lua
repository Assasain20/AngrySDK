BinaryHeap = {}
BinaryHeap.__index = BinaryHeap
function BinaryHeap.new()
  local obj = {
    values = {}
  }
  _G.setmetatable(obj, BinaryHeap)
  return obj
end
function BinaryHeap:insert(k, v)
  local new_index = #self.values + 1
  _G.table.insert(self.values, new_index, {key = k, value = v})
  if new_index == 1 then
    return
  end
  while true do
    local parent_index = _G.math.floor(new_index * 0.5)
    if k < self.values[parent_index].key then
      self.values[parent_index], self.values[new_index] = self.values[new_index], self.values[parent_index]
      new_index = parent_index
      if new_index == 1 then
        break
      end
    else
      break
    end
  end
end
function BinaryHeap:remove()
  local count = #self.values
  if count == 0 then
    return nil
  end
  local r = self.values[1].value
  self.values[1] = self.values[count]
  local k = self.values[1].key
  _G.table.remove(self.values, count)
  local current = 1
  while true do
    local c0, c1 = 2 * current, 2 * current + 1
    local n0, n1 = self.values[c0], self.values[c1]
    local swp
    if n0 == nil or k < n0.key then
      if n1 == nil or k < n1.key then
        break
      else
        swp = c1
      end
    elseif n1 == nil or k < n1.key then
      swp = c0
    elseif n0.key < n1.key then
      swp = c0
    else
      swp = c1
    end
    self.values[current], self.values[swp] = self.values[swp], self.values[current]
    current = swp
  end
  return r
end
function BinaryHeap:peek()
  if #self.values == 0 then
    return nil
  else
    return self.values[1].key
  end
end
Timer = {}
Timer.__index = Timer
function Timer.new(time)
  local obj = {
    delayed = BinaryHeap.new(),
    time = time
  }
  _G.setmetatable(obj, Timer)
  return obj
end
function Timer:once(event, listener, seconds)
  self.delayed:insert(self.time + seconds, {event = event, listener = listener})
end
function Timer:update(dt, time)
  self.time = self.time + dt
  while true do
    local k = self.delayed:peek()
    if k ~= nil and k < self.time then
      local v = self.delayed:remove()
      if _G.type(v.listener) == "function" then
        v.listener(v.event)
      else
        v.listener:eventTriggered(v.event)
      end
    else
      break
    end
  end
end
filename = "timer.lua"
