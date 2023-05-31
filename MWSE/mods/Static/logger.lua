-- logger.lua
local logger = require("logging.logger")
local log = logger.new{
    name = "SetBonus",
    logLevel = "TRACE",
    logToConsole = true,
    includeTimestamp = true,
}

return log