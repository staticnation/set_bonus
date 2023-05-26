-- Import required modules
-- The 'config' module holds the configuration data for the Set Bonus mod
local config = require("Static.SetBonus.config")
local lfs = require('lfs')

-- Define the interop table to contain the module's functions
local interop = {}

-- 'registerSet' function: registers a set in the configuration
-- The function asserts the validity of input set data before proceeding with registration
function interop.registerSet(setData)
    -- Validating the set data
    assert(type(setData) == "table", "Error: set data did not return a table")
    assert(type(setData.items) == "table", "Error: set data has incorrect structure")
    assert(type(setData.name) == "string", "Error: set data has incorrect structure")

    -- Standardize set name to lowercase for consistency
    setData.name = setData.name:lower()

    -- Loop over each item in the set, validate the item, convert to lowercase, and register in the 'setLinks' table
    for i, item in ipairs(setData.items) do
        assert(type(item) == "string", "Error: set contains non-string item")
        setData.items[i] = item:lower()
        config.setLinks[setData.items[i]] = setData  -- Link item to set in the 'setLinks' table
    end

    -- Register set in the 'sets' table
    config.sets[setData.name] = setData
    -- Add set to an array-like structure for additional functionality
    table.insert(config.setsArray, setData) 
end

-- 'registerSetLink' function: registers a set link in the configuration
-- The function validates the input set link data before registration
function interop.registerSetLink(setLinkData)
    -- Validate set link data
    assert(type(setLinkData.item) == "string", "Error: setLink data has incorrect structure")
    assert(type(setLinkData.set) == "string", "Error: setLink data has incorrect structure")

    -- Standardize item ID and set name to lowercase for consistency
    setLinkData.item = setLinkData.item:lower()
    setLinkData.set = setLinkData.set:lower()

    -- Register set link in the 'setLinks' table
    config.setLinks[setLinkData.item] = setLinkData.set
end

-- 'initFile' function: registers a defined Lua file as sets
-- The function scans the files and registers each set in the file
function interop.initFile(filePath)
    for file in lfs.dir(filePath) do
        if file:match("(.+)%.lua$") then
            local successFile, set = dofile(filePath)
        if successFile then
            interop.registerSet(set)
        else
            mwse.log("Error loading set file: %s. Error: %s", filePath, set)
        end
    end
        -- Add links for each item to its set in the 'setLinks' table
    for _, set in pairs(config.sets) do
        for _, item in ipairs(set.items) do
            config.setLinks[item] = set
        end
    end
end

-- 'initAll' function: initializes and registers all sets in a specified directory path
-- This function iterates over each Lua file in the directory, loads it, and registers it as a set
function interop.initAll(pathDir)
    for file in lfs.dir(pathDir) do
        if file:match("(.+)%.lua$") then
            local modulePath = pathDir .. "/" .. file
            local successScan, set = pcall(dofile, modulePath)
            if successScan then
                interop.registerSet(set)
            else
                mwse.log("Error loading set file: %s. Error: %s", modulePath, set)
            end
        end
    end
    -- Add links for each item to its set in the 'setLinks' table
    for _, set in pairs(config.sets) do
        for _, item in ipairs(set.items) do
            config.setLinks[item] = set
        end
    end
end

-- 'mergeTables' function: merges two tables deeply
-- This function recursively merges two tables and returns the merged result
function interop.mergeTables(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                interop.mergeTables(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

-- Return the interop module
return interop

--[[ 
SUMMARY:

1. The interop module provides functions to register and manage sets and their items for the Set Bonus mod.
2. 'registerSet' registers a new set after validating its data. It ensures all names are in lowercase for consistency.
3. 'registerSetLink' registers a set link, connecting an item to a set.
4. 'initFile' registers a defined Lua file as sets.  It also adds links for each item to its set in the 'setLinks' table.
5. 'initAll' initializes and registers all sets within a specific directory. It also adds links for each item to its set in the 'setLinks' table.
6. 'mergeTables' is a utility function that merges two tables deeply, including nested tables.
7. All functions utilize configuration data defined in 'config.lua'.
]]
