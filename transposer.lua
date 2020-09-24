local sides = require("sides")

local side_names = {
  [0] = 'down',
  [1] = 'up',
  [2] = 'north',
  [3] = 'south',
  [4] = 'west',
  [5] = 'east',
}

local Transposer = {}
Transposer.__index = Transposer

setmetatable(Transposer, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function Transposer.new(id, proxy)
  local self = setmetatable({}, Transposer)
  self.id = id
  self.proxy = proxy
  return self
end

function Transposer:get_id()
  return self.id
end

function Transposer:scan()
  for _, side in ipairs({sides.down, sides.up, sides.north, sides.south, sides.west, sides.east}) do
    local name = self.proxy.getInventoryName(side)
    if name ~= nil then
      print('Side: ' .. side_names[side] .. ' Inventory: ' .. name)
    end
  end
end

return Transposer