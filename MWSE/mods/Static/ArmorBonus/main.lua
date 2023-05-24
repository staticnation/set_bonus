-- Load the interop module from the Static.SetBonus package
-- The interop module allows interaction between this script and other scripts in the same package
local interop = require("Static.SetBonus.interop")

-- A string representing the directory path to the set definition files
-- Set definition files are Lua scripts that define the properties of different item sets
-- The directory path should be updated to the actual directory path containing these files
local directoryPath = "Static.ArmorBonus.sets"

-- Function to load all set definition files in the specified directory
local function loadSets()
    -- The registerSetDirectory function from the interop module is called with the directory path as argument
    -- This function will iterate over all Lua files in the directory and register them as sets, along with their items and bonus spells
    -- Each set and its corresponding items will be stored in a table within the interop module for later use
    interop.registerSetDirectory(directoryPath)

    -- Logs a message to the console stating that all sets have been loaded successfully
    -- This is useful for debugging purposes, as you can check the MWSE.log file to confirm that this function has been executed correctly
    mwse.log("All sets loaded")
end

-- Calls the loadSets function
-- This will register all sets from the defined directory, making them available for the bonus system to use
-- This function call should be placed outside any other function definitions or event handlers so it is executed when the script is loaded
loadSets()

-- This script is responsible for registering set definitions. These definitions are Lua files that describe different sets of items in the
-- game that can confer bonuses to the character when equipped. The script uses functions from the interop module, which provides a way to
-- share data and functionality between different scripts within the same mod.