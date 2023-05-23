local interop = require("Static.SetBonus.interop")
local directoryPath = "sets" -- Update the path to the actual directory path

local function loadSets()
    interop.registerSetDirectory(directoryPath)
    mwse.log("All sets loaded")
end

loadSets()