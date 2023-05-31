-- Import required modules
-- The 'config' module holds the configuration data for the Set Bonus mod
local log = require("Static.logger")
local config = require("Static.SetBonus.config")
local lfs = require('lfs')
-- Define the interop table to contain the module's functions
local interop = {}
-- 'registerSet' function: registers a set in the config
-- The function asserts the validity of input set data before proceeding with registration
---@param setData table responsible for registering a new set with its items into the system
function interop.registerSet(setData)
    log:info("registerSet: Entry point")
    -- Validating the set data
    assert(type(setData) == "table", "Error: set data did not return a table")
    assert(type(setData.name) == "string", "Error: set data has incorrect structure")
    assert(type(setData.items) == "table", "Error: set data has incorrect structure")
    assert(type(setData.minBonus) == "string", "Error: set data does not have valid minBonus")
    assert(type(setData.midBonus) == "string", "Error: set data does not have valid midBonus")
    assert(type(setData.maxBonus) == "string", "Error: set data does not have valid maxBonus")
    -- Standardize set name to lowercase for consistency
    setData.name = setData.name:lower()
    setData.minBonus = setData.minBonus:lower()
    setData.midBonus = setData.midBonus:lower()
    setData.maxBonus = setData.maxBonus:lower()
    -- Loop over each item in the set, validate the item, convert to lowercase, and register in the 'setLinks' table
    for i, item in ipairs(setData.items) do
        assert(type(item) == "string", "Error: set contains non-string item")
        setData.items[i] = item:lower()
        -- If item already linked to a set, add this set to the list. If not, create a new list for this item
        if not config.setLinks[setData.items[i]] then
            config.setLinks[setData.items[i]] = {} -- Initialize a new table for this item
        end
        -- Add the current set to the list of sets that this item belongs to
        config.setLinks[setData.items[i]][setData.name] = true -- Link the item to the set
    end
    -- Register set in the 'sets' table
    config.sets[setData.name] = setData
    -- Add set to an array-like structure for additional functionality
    table.insert(config.setsArray, setData)
    log:info("registerSet: Exit point")
end
-- 'registerSetLink' function: registers a set link in the configuration
-- The function validates the input set link data before registration
---@param setLinkData table responsible for creating a link between an already registered item and set
function interop.registerSetLink(setLinkData)
    log:info("registerSetLink: Entry point")
    -- Validate set link data
    assert(type(setLinkData.item) == "string", "Error: setLink data has incorrect structure")
    assert(type(setLinkData.set) == "string", "Error: setLink data has incorrect structure")
    -- Standardize item ID and set name to lowercase for consistency
    setLinkData.item = setLinkData.item:lower()
    setLinkData.set = setLinkData.set:lower()
    -- If this item hasn't been added to config.setLinks yet, add it as a new table
    if not config.setLinks[setLinkData.item] then
        config.setLinks[setLinkData.item] = {}
    end
    -- Add the current set to the list of sets that this item belongs to
    config.setLinks[setLinkData.item][setLinkData.set] = true
    log:info("registerSetLink: Exit point")
end
-- 'initFile' function: registers a defined Lua file as sets
-- The function scans the files and registers each set in the file
---@param filePath string The path to the file to initialize
function interop.initFile(filePath)
    log:info("initFile: Entry point")
    for file in lfs.dir(filePath) do
        if file:match("(.+)%.lua$") then
            local successFile, set = dofile(filePath)
            if successFile then
                interop.registerSet(set)
            else
                log:debug("Error loading set file: %s. Error: %s", filePath, set)
            end
        end
    end
    log:info("initFile: Exit point")
end
-- 'initAll' function: initializes and registers all sets in a specified directory path
-- This function iterates over each Lua file in the directory, loads it, and registers it as a set
---@param pathDir string The path to the directory containing the files to initialize
function interop.initAll(pathDir)
    log:info("initAll: Entry point")
    for file in lfs.dir(pathDir) do
        if file:match("(.+)%.lua$") then
            local modulePath = pathDir .. "/" .. file
            local successScan, set = pcall(dofile, modulePath)
            if successScan then
                interop.registerSet(set)
            else
                log:debug("Error loading set file: %s. Error: %s", modulePath, set)
            end
        end
    end
    log:info("initAll: Exit point")
end
-- 'mergeTables' function: merges two tables deeply
-- This function recursively merges two tables and returns the merged result
---@param t1 table The first table to merge
---@param t2 table The second table to merge
function interop.mergeTables(t1, t2)
    log:info("mergeTables: Entry point")
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
    log:info("mergeTables: Exit point")
    return t1
end
-- Return the interop module
return interop
