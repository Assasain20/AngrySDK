function contains(table, item)
  return find_key(table, item) ~= nil
end
function find_key(table, item)
  for k, v in _G.pairs(table) do
    if item == v then
      return k
    end
  end
  return nil
end
function deepCopy(item)
  local ret
  if _G.type(item) == "table" then
    ret = {}
    for k, v in _G.pairs(item) do
      ret[k] = deepCopy(v)
    end
  else
    ret = item
  end
  return ret
end
function accumulate(table)
  local sum = 0
  for _, v in _G.pairs(table) do
    sum = sum + v
  end
  return sum
end
function getVariable(t, name)
  if _G.type(name) == "string" then
    return t[name]
  elseif _G.type(name) == "table" then
    local temp = t
    for _, v in _G.ipairs(name) do
      temp = temp[v]
      if temp == nil then
        return nil
      end
    end
    return temp
  end
  return nil
end
function split(str, pat)
  local t = {}
  local fpat = "(.-)" .. pat
  local last_end = 1
  local s, e, cap = str:find(fpat, 1)
  while s do
    if s ~= 1 or cap ~= "" then
      _G.table.insert(t, cap)
    end
    last_end = e + 1
    s, e, cap = str:find(fpat, last_end)
  end
  if last_end <= #str then
    cap = str:sub(last_end)
    _G.table.insert(t, cap)
  end
  return t
end
Set = {}
function Set.intersection(t1, t2)
  local result = {}
  for _, v1 in _G.pairs(t1) do
    for _, v2 in _G.pairs(t2) do
      if v1 == v2 then
        _G.table.insert(result, v1)
      end
    end
  end
  return result
end
function Set.difference(t1, t2)
  local result = {}
  for _, v1 in _G.pairs(t1) do
    local found = false
    for _, v2 in _G.pairs(t2) do
      if v1 == v2 then
        found = true
        break
      end
    end
    if not found then
      _G.table.insert(result, v1)
    end
  end
  return result
end
function formatCurrency(amount, currency)
  if currency == "USD" then
    return "$" .. _G.string.format("%.2f", amount)
  elseif currency == "USD-string" then
    return "USD " .. _G.string.format("%.2f", amount)
  end
end
function countdownTimeParts(time)
  return _G.math.floor(time / 60), _G.string.format("%02u", _G.math.floor(time % 60)), _G.string.format("%02u", _G.math.floor(time % 1 * 100))
end
function serializeDate(day)
  return _G.os.date("%Y%m%d", _G.os.time(day))
end
function deserializeDate(dateString)
  local retVal = {}
  retVal.minutes = 0
  retVal.seconds = 0
  retVal.hour = 0
  retVal.year = dateString:sub(1, 4)
  retVal.month = dateString:sub(5, 6)
  retVal.day = dateString:sub(7, 8)
  return retVal
end
filename = "utils.lua"
