local component = require('component')
local Transposer = require('transposer')

local TRANSPOSER_TYPE = 'transposer'

local function init_transposer()
  if not component.isAvailable(TRANSPOSER_TYPE) then
    error('No Transposer component found')
    return
  end

  for id, type in pairs(component.list()) do
    if type == TRANSPOSER_TYPE then
      print('Address: ' .. id .. ' Type: ' .. type)
      local tp = Transposer(id, component.proxy(id))
      tp:scan()
    end
  end
end

local function main()
  init_transposer()
end

main()