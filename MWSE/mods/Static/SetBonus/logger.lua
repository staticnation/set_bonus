-- logger.lua -- shared logger for Set Bonus. Lives under the mod folder so the
-- MWSE Logger library can associate it with this mod's metadata.
local logger = require("logging.logger")
local settings = require("Static.SetBonus.settings")
local log = logger.new{
    name = "Set Bonus",
    logLevel = settings.logLevel or "ERROR",
    logToConsole = true,
    includeTimestamp = true,
}
return log
