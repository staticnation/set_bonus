-- Required libraries
local config = require("Static.SetBonus.config")
local lfs = require('lfs')

local interop = {}

-- Function to register a set
function interop.registerSet(setData)
    assert(type(setData) == "table", "Error: set data did not return a table")
    assert(type(setData.items) == "table", "Error: set data has incorrect structure")
    assert(type(setData.name) == "string", "Error: set data has incorrect structure")

    setData.name = setData.name:lower()

    for i, item in ipairs(setData.items) do
        assert(type(item) == "string", "Error: set contains non-string item")
        setData.items[i] = item:lower()
    end

    config.sets[setData.name] = setData
    table.insert(config.setsArray, setData) -- Add set to array-like structure
end


-- Function to register set link
function interop.registerSetLink(setLinkData)
    assert(type(setLinkData.item) == "string", "Error: setLink data has incorrect structure")
    assert(type(setLinkData.set) == "string", "Error: setLink data has incorrect structure")
    setLinkData.item = setLinkData.item:lower()
    setLinkData.set = setLinkData.set:lower()
    config.setLinks[setLinkData.item] = setLinkData.set
    mwse.log("Linked item %s to set %s", setLinkData.item, setLinkData.set)
end

-- Function to register a directory containing sets
function interop.registerSetDirectory(directoryPath)
    for file in lfs.dir(directoryPath) do
        if file:match("(.+)%.lua$") then
            local setData = dofile(directoryPath .. "/" .. file)
            interop.registerSet(setData)
        end
    end
end

-- Function to deeply merge two tables
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