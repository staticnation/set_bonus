local interop = {}
local config = require("Static.Set Bonus.config")

function interop.registerSet(setData)
  table.insert(config.sets, setData)
end

function interop.registerSetLink(setLinkData)
  table.insert(config.setLinks, setLinkData)
end
return interop