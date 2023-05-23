-- Required libraries
local config = require("Static.SetBonus.config")
local lfs = require('lfs')

local interop = {}

-- Function to register a set
-- It checks whether the input `setData` is structured correctly,
-- normalizes the case of item IDs to lowercase, and then
-- stores the set in `config.sets` using the set's name as the key.
function interop.registerSet(setData)
    assert(type(setData) == "table", "Error: set data did not return a table")
    assert(type(setData.items) == "table", "Error: set data has incorrect structure")
    assert(type(setData.name) == "string", "Error: set data has incorrect structure")
    
    for i, item in ipairs(setData.items) do
        assert(type(item) == "string", "Error: set contains non-string item")
        setData.items[i] = item:lower()
    end

    config.sets[setData.name:lower()] = setData
end

-- Function to register a directory containing sets
-- It iterates over each Lua file in the given directory,
-- loads the set data from the file, and then registers the set.
function interop.registerSetDirectory(directoryPath)
    for file in lfs.dir(directoryPath) do
        if file:match("(.+)%.lua$") then
            local setData = dofile(directoryPath .. "/" .. file:match("(.+)%.lua$"))
            interop.registerSet(setData)
        end
    end
end

-- Function to deeply merge two tables
-- It recursively merges the keys and values of `t2` into `t1`.
-- If a key exists in both `t1` and `t2` and its values are tables, then the tables are merged.
-- Otherwise, the value from `t2` overwrites the value in `t1`.
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

return interop