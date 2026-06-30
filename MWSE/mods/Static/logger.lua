-- logger.lua
local logger = require("logging.logger")
local settings = require("Static.SetBonus.settings")
local log = logger.new{
    name = "Set Bonus",
    logLevel = settings.logLevel or "ERROR",
    logToConsole = true,
    includeTimestamp = true,
}
return log
