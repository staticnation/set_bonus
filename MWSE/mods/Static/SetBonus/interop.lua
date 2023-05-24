-- Required libraries
local config = require("Static.SetBonus.config")
local lfs = require('lfs')

-- Create a table to hold the functions for the module
local interop = {}

-- Function to register a set
-- This function takes as input a table containing set data. It first checks the input data for validity
-- and then proceeds to register the set in the configuration.
function interop.registerSet(setData)
    -- Assertions to ensure the validity of the input set data
    assert(type(setData) == "table", "Error: set data did not return a table")
    assert(type(setData.items) == "table", "Error: set data has incorrect structure")
    assert(type(setData.name) == "string", "Error: set data has incorrect structure")

    -- Convert the set name to lowercase for consistency
    setData.name = setData.name:lower()

    -- Loop through each item in the set, validate the item, convert it to lowercase, 
    -- and register the item in the setLinks table.
    for i, item in ipairs(setData.items) do
        assert(type(item) == "string", "Error: set contains non-string item")
        setData.items[i] = item:lower()

        -- Add a link from the item to the set in the setLinks table
        config.setLinks[setData.items[i]] = setData
    end

    -- Register the set in the sets table
    config.sets[setData.name] = setData
    -- Add set to array-like structure for additional functionality
    table.insert(config.setsArray, setData) 
end

-- Function to register a set link
-- This function takes a table containing set link data and registers it in the setLinks table.
function interop.registerSetLink(setLinkData)
    -- Assertions to ensure the validity of the input set link data
    assert(type(setLinkData.item) == "string", "Error: setLink data has incorrect structure")
    assert(type(setLinkData.set) == "string", "Error: setLink data has incorrect structure")

    -- Convert the item ID and set name to lowercase for consistency
    setLinkData.item = setLinkData.item:lower()
    setLinkData.set = setLinkData.set:lower()

    -- Register the set link in the setLinks table
    config.setLinks[setLinkData.item] = setLinkData.set
end

-- Function to register a directory containing sets
-- This function takes a directory path as input and registers all Lua files in the directory as sets.
function interop.registerSetDirectory(directoryPath)
    for file in lfs.dir(directoryPath) do
        if file:match("(.+)%.lua$") then
            local setFilePath = directoryPath .. "/" .. file
            local setData = dofile(setFilePath)
            local setName = setData.name or "unknown"
            interop.registerSet(setData)
        end
    end
end

-- Function to deeply merge two tables
-- This function takes two tables as input and returns a new table that combines the data from both.
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

-- Return the module table
return interop

-- This code is for a module named interop, which provides functions to register and manage sets 
-- and their items for the Set Bonus mod. The module provides functions to register a set, 
-- register a set link, register a directory containing sets, and merge two tables. It uses the 
-- configuration data defined in config.lua.