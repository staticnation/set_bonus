-- Required libraries
local config = require("Static.SetBonus.config")
local lfs = require('lfs')

local interop = {}

-- Function to register a set
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

-- Function to register set link
function interop.registerSetLink(setLinkData)
    assert(type(setLinkData.item) == "string", "Error: setLink data has incorrect structure")
    assert(type(setLinkData.set) == "string", "Error: setLink data has incorrect structure")
    setLinkData.item = setLinkData.item:lower()
    setLinkData.set = setLinkData.set:lower()
    config.setLinks[setLinkData.item] = setLinkData.set
end


-- Function to register a directory containing sets
function interop.registerSetDirectory(directoryPath)
    for file in lfs.dir(directoryPath) do
        if file:match("(.+)%.lua$") then
            local setData = dofile(directoryPath .. "/" .. file:match("(.+)%.lua$")) -- Load each Lua file in the directory
            interop.registerSet(setData) -- Registers the set using the interop module
        end
    end
end

-- Function to deeply merge two tables
function interop.mergeTables(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                interop.mergeTables(t1[k] or {}, t2[k] or {}) -- If both values are tables, merge them recursively
            else
                t1[k] = v -- If the value in t1 is not a table, overwrite it
            end
        else
            t1[k] = v -- If the value in t2 is not a table, overwrite the value in t1
        end
    end
    return t1
end

return interop