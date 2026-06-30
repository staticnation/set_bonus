-- =========================================================================
--  Static Set Bonus -- Interop API for mod authors
--
--  Other mods register their own armour sets with:
--      local setBonus = require("Static.SetBonus.interop")
--      setBonus.registerSet{ ... }
--
--  Two ways to define a set's bonuses:
--    1. Lua-defined effects  -> the framework builds the tier spells at runtime
--                               (no ESP record needed).
--    2. ESP spell IDs        -> point min/mid/max at spells you defined in a plugin.
--
--  See SetBonus_Interop_Guide.md for full documentation and examples.
-- =========================================================================

local log = require("Static.logger")
local config = require("Static.SetBonus.config")
local lfs = require("lfs")

local interop = {}

--- API version. Authors can gate features on this, e.g. `if setBonus.version >= 2 then`.
interop.version = 2

--- Default tier thresholds (number of equipped pieces). Overridable per set.
interop.defaultThresholds = { min = 2, mid = 4, max = 6 }

-- True once the game has finished loading; controls whether runtime spell
-- creation can happen immediately or must wait for the 'initialized' event.
local gameInitialized = false

-- -------------------------------------------------------------------------
-- Internal: resolve string-or-constant inputs into engine constants.
-- -------------------------------------------------------------------------

-- Accepts a tes3.effect constant (number) or a camelCase name ("fortifyHealth").
local function resolveEffect(value, ctx)
    if type(value) == "number" then return value end
    if type(value) == "string" then
        local id = tes3.effect[value]
        assert(id ~= nil, string.format("[SetBonus] Unknown magic effect '%s'%s", value, ctx or ""))
        return id
    end
    error("[SetBonus] effect must be a string name or tes3.effect constant" .. (ctx or ""))
end

-- nil -> -1 (unused); otherwise a tes3.skill constant or camelCase name ("longBlade").
local function resolveSkill(value)
    if value == nil then return -1 end
    if type(value) == "number" then return value end
    local id = tes3.skill[value]
    assert(id ~= nil, string.format("[SetBonus] Unknown skill '%s'", tostring(value)))
    return id
end

-- nil -> -1 (unused); otherwise a tes3.attribute constant or camelCase name ("strength").
local function resolveAttribute(value)
    if value == nil then return -1 end
    if type(value) == "number" then return value end
    local id = tes3.attribute[value]
    assert(id ~= nil, string.format("[SetBonus] Unknown attribute '%s'", tostring(value)))
    return id
end

-- nil -> Self; otherwise a tes3.effectRange constant or name ("self"/"touch"/"target").
local function resolveRange(value)
    if value == nil then return tes3.effectRange.self end
    if type(value) == "number" then return value end
    local r = tes3.effectRange[value]
    assert(r ~= nil, string.format("[SetBonus] Unknown range '%s'", tostring(value)))
    return r
end

-- Sanitise a name into a spell-id-safe token.
local function tokenize(name)
    return (name:lower():gsub("[^%w]", "_"))
end

-- -------------------------------------------------------------------------
-- Runtime spell creation for Lua-defined sets.
-- -------------------------------------------------------------------------

--- Builds the tier spells for a Lua-defined set and assigns set.min/mid/maxBonus.
--- Only valid after the game has initialised; registerSet/initAll handle timing.
---@param set table
function interop.buildSpellsForSet(set)
    if not set.bonuses then return end
    for _, tier in ipairs({ "min", "mid", "max" }) do
        local defs = set.bonuses[tier]
        if defs and #defs > 0 then
            assert(#defs <= 8, string.format(
                "[SetBonus] '%s' %s tier has %d effects (engine maximum is 8).", set.displayName, tier, #defs))
            local spellId = set.spellPrefix .. "_" .. tier
            local spell = tes3.getObject(spellId)
            if not spell then
                spell = tes3.createObject({
                    objectType = tes3.objectType.spell,
                    id = spellId,
                    name = set.displayName .. " Set Bonus",
                    castType = tes3.spellType.ability,
                })
                for i, def in ipairs(defs) do
                    local e = spell.effects[i]
                    e.id = resolveEffect(def.effect, " in set '" .. set.displayName .. "'")
                    e.rangeType = resolveRange(def.range)
                    e.skill = resolveSkill(def.skill)
                    e.attribute = resolveAttribute(def.attribute)
                    e.min = def.min or def.magnitude or 0
                    e.max = def.max or def.magnitude or (def.min or 0)
                    e.duration = def.duration or 0
                    e.radius = def.radius or 0
                end
                log:debug("buildSpellsForSet: created '%s' for set '%s'", spellId, set.displayName)
            end
            set[tier .. "Bonus"] = spellId
        end
    end
end

-- -------------------------------------------------------------------------
-- Public registration API.
-- -------------------------------------------------------------------------

--- Register an armour set.
--- Required: name (string), items (array of item IDs), and EITHER a `bonuses`
--- table (Lua-defined effects) OR min/mid/maxBonus spell IDs (from an ESP).
--- Optional: thresholds = { min=2, mid=4, max=6 }, displayName, spellPrefix.
---@param setData table
---@return table set
function interop.registerSet(setData)
    assert(type(setData) == "table", "[SetBonus] registerSet: setData must be a table.")
    assert(type(setData.name) == "string" and setData.name ~= "",
        "[SetBonus] registerSet: 'name' (non-empty string) is required.")
    assert(type(setData.items) == "table",
        string.format("[SetBonus] registerSet '%s': 'items' (table) is required.", tostring(setData.name)))

    local hasSpellIds = setData.minBonus or setData.midBonus or setData.maxBonus
    local hasLuaBonuses = type(setData.bonuses) == "table"
    assert(hasSpellIds or hasLuaBonuses, string.format(
        "[SetBonus] registerSet '%s': provide a 'bonuses' table or min/mid/maxBonus spell IDs.", setData.name))

    -- Keep the pretty name for display/spell names; lowercase the lookup key.
    setData.displayName = setData.displayName or setData.name
    setData.name = setData.name:lower()
    setData.spellPrefix = setData.spellPrefix or ("_sb_" .. tokenize(setData.displayName))

    -- Normalise thresholds, defaulting any missing tier to 2/4/6.
    local t = setData.thresholds or {}
    setData.thresholds = {
        min = t.min or interop.defaultThresholds.min,
        mid = t.mid or interop.defaultThresholds.mid,
        max = t.max or interop.defaultThresholds.max,
    }

    -- Lowercase, de-duplicate, and link each item to this set.
    -- De-duping matters: countItemsEquipped() tallies one hit per list entry, so a
    -- repeated item ID would inflate the equipped-piece count and trigger a tier early.
    local seen, unique = {}, {}
    for i, item in ipairs(setData.items) do
        assert(type(item) == "string",
            string.format("[SetBonus] set '%s' contains a non-string item at index %d.", setData.name, i))
        local key = item:lower()
        if not seen[key] then
            seen[key] = true
            unique[#unique + 1] = key
            if not config.setLinks[key] then config.setLinks[key] = {} end
            config.setLinks[key][setData.name] = true
        end
    end
    setData.items = unique

    config.sets[setData.name] = setData
    table.insert(config.setsArray, setData)

    -- Build runtime spells now if the game is already up; otherwise the
    -- 'initialized' handler below builds them once data is loaded.
    if gameInitialized and hasLuaBonuses then
        interop.buildSpellsForSet(setData)
    end

    log:debug("registerSet: registered '%s' (%d items)", setData.name, #setData.items)
    return setData
end

--- Link an additional item ID to an already-registered set.
---@param setLinkData table { item = "id", set = "setname" }
function interop.registerSetLink(setLinkData)
    assert(type(setLinkData) == "table" and type(setLinkData.item) == "string" and type(setLinkData.set) == "string",
        "[SetBonus] registerSetLink: requires { item = <string>, set = <string> }.")
    local item = setLinkData.item:lower()
    local setName = setLinkData.set:lower()
    if not config.setLinks[item] then config.setLinks[item] = {} end
    config.setLinks[item][setName] = true
    log:debug("registerSetLink: linked '%s' -> '%s'", item, setName)
end

--- Add multiple item IDs to an existing set (e.g. for compatibility patches).
---@param setName string
---@param items string[]
---@return table set
function interop.addItems(setName, items)
    setName = setName:lower()
    local set = config.sets[setName]
    assert(set, string.format("[SetBonus] addItems: no registered set named '%s'.", setName))
    assert(type(items) == "table", "[SetBonus] addItems: 'items' must be a table.")
    for _, item in ipairs(items) do
        local key = item:lower()
        if not (config.setLinks[key] and config.setLinks[key][setName]) then
            table.insert(set.items, key)
            if not config.setLinks[key] then config.setLinks[key] = {} end
            config.setLinks[key][setName] = true
        end
    end
    return set
end

-- -------------------------------------------------------------------------
-- Query helpers.
-- -------------------------------------------------------------------------

--- @return table|nil set The registered set table, or nil.
function interop.getSet(name)
    return name and config.sets[name:lower()] or nil
end

--- @return table setsArray Array of all registered set tables.
function interop.getSets()
    return config.setsArray
end

--- @return table|nil A set-name keyed table of sets this item belongs to, or nil.
function interop.getSetsForItem(itemId)
    return itemId and config.setLinks[itemId:lower()] or nil
end

--- @return boolean Whether the item belongs to the named set.
function interop.isItemInSet(itemId, setName)
    if not (itemId and setName) then return false end
    local links = config.setLinks[itemId:lower()]
    return links ~= nil and links[setName:lower()] == true
end

-- -------------------------------------------------------------------------
-- Bulk loading of set data files from a directory.
-- -------------------------------------------------------------------------

--- Load and register every *.lua set-definition file in a directory.
---@param pathDir string Path relative to the Morrowind install (e.g. "Data Files/MWSE/mods/Author/Mod/sets").
function interop.initAll(pathDir)
    log:trace("initAll: scanning %s", pathDir)
    for file in lfs.dir(pathDir) do
        if file:match("(.+)%.lua$") then
            local modulePath = pathDir .. "/" .. file
            local ok, set = pcall(dofile, modulePath)
            if ok and type(set) == "table" then
                local okReg, err = pcall(interop.registerSet, set)
                if not okReg then
                    log:error("initAll: registerSet failed for %s: %s", modulePath, err)
                end
            else
                log:error("initAll: could not load set file %s: %s", modulePath, tostring(set))
            end
        end
    end
end

-- -------------------------------------------------------------------------
-- Deferred runtime spell creation: build all Lua-defined sets once the game
-- is ready. Sets registered after this point are built immediately above.
-- -------------------------------------------------------------------------
event.register(tes3.event.initialized, function()
    gameInitialized = true
    for _, set in ipairs(config.setsArray) do
        if set.bonuses then
            local ok, err = pcall(interop.buildSpellsForSet, set)
            if not ok then
                log:error("initialized: buildSpellsForSet failed for '%s': %s", set.displayName, err)
            end
        end
    end
    log:debug("interop initialized: %d set(s) registered.", #config.setsArray)
end)

return interop
