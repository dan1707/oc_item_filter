local Inventory = {}
Inventory.__index = Inventory

setmetatable(Inventory, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function Inventory.new(name, side, side_name)
  local self     = setmetatable({}, Inventory)
  self.name      = name
  self.side      = side
  self.side_name = side_name
  return self
end

function Inventory:get_name()
  return self.name
end

return Inventory