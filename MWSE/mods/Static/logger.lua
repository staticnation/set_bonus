-- logger.lua
local logger = require("logging.logger")
local log = logger.new{
    name = "SetBonus",
    logLevel = "TRACE",
    logToConsole = false,
    includeTimestamp = true,
}

return log