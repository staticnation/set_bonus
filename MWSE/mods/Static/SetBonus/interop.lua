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

local log = require("Static.SetBonus.logger")
local config = require("Static.SetBonus.config")
local lfs = require("lfs")

local interop = {}

--- API version. Authors can gate features on this, e.g. `if setBonus.version >= 2 then`.
interop.version = 2

--- Default tier thresholds (number of equipped pieces). Overridable per set.
interop.defaultThresholds = { min = 2, mid = 4, max = 6 }

--- Magnitude multipliers applied to all Lua-defined bonus effects at build time
--- (and via interop.applyScale). 1 = unscaled. `benefitScale` scales the helpful
--- effects; `drawbackScale` scales the Weakness-type drawbacks independently
--- (set it to 0 to disable drawbacks entirely). Set these before the spells build,
--- or call interop.applyScale() afterwards to rescale live.
interop.benefitScale = 1
interop.drawbackScale = 1

-- Binary/flag effects whose magnitude is meaningless (a value of 1 = "on"); these
-- must never be scaled or they could be rounded to 0 and silently disabled.
local NOSCALE = {
    waterbreathing = true, waterwalking = true, levitate = true,
    jump = true, telekinesis = true,
}
local function effLower(eff)
    return (type(eff) == "string") and eff:lower() or nil
end
local function isFlagEffect(eff)
    local n = effLower(eff)
    return n ~= nil and NOSCALE[n] == true
end
-- Weakness-type effects (weaknessToFire/Shock/Magicka/...) are the "drawbacks".
local function isWeaknessEffect(eff)
    local n = effLower(eff)
    return n ~= nil and n:sub(1, 8) == "weakness"
end
-- Round base*scale to a whole number (round half up), and never let a real effect
-- (base >= 1) round down to 0 -- that would break over-time ticks (Restore*) and
-- silently drop bonuses. A scale of 0 does fully zero the effect (used to disable
-- drawbacks). Result is always an integer.
local function roundScale(base, scale)
    base = base or 0
    if base == 0 or scale <= 0 then return 0 end
    local v = math.floor(base * scale + 0.5)
    if v < 1 and base >= 1 then v = 1 end
    return v
end
-- Compute the scaled (min, max) magnitudes for one effect def, picking the right
-- scale and leaving flag effects untouched.
local function scaledMinMax(def)
    local baseMin = def.min or def.magnitude or 0
    local baseMax = def.max or def.magnitude or baseMin
    if isFlagEffect(def.effect) then
        return baseMin, baseMax
    end
    local scale = isWeaknessEffect(def.effect) and interop.drawbackScale or interop.benefitScale
    return roundScale(baseMin, scale), roundScale(baseMax, scale)
end

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

-- Spell record ids are capped at 31 characters by the engine. Long display
-- names can overflow once the tier and conditional suffixes are appended
-- ("_sb_redguard_iron_lamellar_max_c1" is 33), so over-long ids are shortened
-- and kept unique with a small hash of the full id. Deterministic, so the same
-- set always regenerates the same id (safe across saves and re-registration).
local function hash4(s)
    local h = 5381
    for i = 1, #s do h = (h * 33 + s:byte(i)) % 1679616 end -- 36^4
    local digits, out = "0123456789abcdefghijklmnopqrstuvwxyz", ""
    for _ = 1, 4 do
        local d = (h % 36) + 1
        out = digits:sub(d, d) .. out
        h = math.floor(h / 36)
    end
    return out
end
local function clampId(id)
    if #id <= 31 then return id end
    return id:sub(1, 26) .. "_" .. hash4(id)
end

-- Map an item's inventory ICON+MESH to a set, so player-enchanted (or otherwise
-- copied) versions of a set piece -- which get a new object id but keep the same
-- icon and mesh -- still count toward the set. Icon alone is not safe: icon-
-- replacer/compilation mods (e.g. NOD) routinely point unrelated armor records at
-- the same shared icon to save texture slots (a House Hlaalu helm ending up on
-- the same icon as the Indoril helm, say), which would false-match them into the
-- wrong set. Two different armor pieces essentially never also share a mesh, so
-- requiring both keeps this fallback narrow to actual copies/enchants.
-- Only resolvable in-game; file-scope registrations are covered by the bulk pass
-- in the 'initialized' handler below.
local function iconMeshSig(obj)
    local icon = obj and obj.icon
    local mesh = obj and obj.mesh
    -- Require BOTH icon and mesh (see main.lua): never degrade to icon-only.
    if not (icon and icon ~= "" and mesh and mesh ~= "") then return nil end
    return icon:lower() .. "|" .. mesh:lower()
end
local function linkIconFor(itemId, setName)
    if not gameInitialized then return end
    local obj = tes3.getObject(itemId)
    local sig = iconMeshSig(obj)
    if sig then
        config.iconLinks[sig] = config.iconLinks[sig] or {}
        config.iconLinks[sig][setName] = true
    end
end

-- -------------------------------------------------------------------------
-- Runtime spell creation for Lua-defined sets.
-- -------------------------------------------------------------------------

--- Builds the tier spells for a Lua-defined set and assigns set.min/mid/maxBonus.
--- Only valid after the game has initialised; registerSet/initAll handle timing.
---@param set table
function interop.buildSpellsForSet(set)
    if not set.bonuses then return end
    set.conditionals = set.conditionals or {}
    for _, tier in ipairs({ "min", "mid", "max" }) do
        local defs = set.bonuses[tier] or {}
        -- Split effects: unconditional -> base tier spell; conditional -> sub-spells.
        local uncond, cond = {}, {}
        for _, d in ipairs(defs) do
            if d.condition then cond[#cond + 1] = d else uncond[#uncond + 1] = d end
        end
        local spellId = clampId(set.spellPrefix .. "_" .. tier)

        if #uncond > 0 then
            assert(#uncond <= 8, string.format(
                "[SetBonus] '%s' %s tier has %d unconditional effects (engine maximum is 8).",
                set.displayName, tier, #uncond))
            local spellName = set.displayName .. " Set Bonus"
            if #spellName > 31 then spellName = set.displayName:sub(1, 21) .. " Set Bonus" end
            local spell = tes3.getObject(spellId) or tes3.createObject({
                objectType = tes3.objectType.spell,
                id = spellId,
                name = spellName,
                castType = tes3.spellType.ability,
            })
            for i = 1, 8 do
                local e = spell.effects[i]
                local def = uncond[i]
                if def then
                    e.id = resolveEffect(def.effect, " in set '" .. set.displayName .. "'")
                    e.rangeType = resolveRange(def.range)
                    e.skill = resolveSkill(def.skill)
                    e.attribute = resolveAttribute(def.attribute)
                    e.min, e.max = scaledMinMax(def)
                    e.duration = def.duration or 0
                    e.radius = def.radius or 0
                else
                    e.id = -1
                end
            end
            set[tier .. "Bonus"] = spellId
        else
            local spell = tes3.getObject(spellId)
            if spell then for i = 1, 8 do spell.effects[i].id = -1 end end
            set[tier .. "Bonus"] = nil
        end

        -- Conditional sub-spells: one single-effect ability per conditional effect.
        local list = {}
        for j, def in ipairs(cond) do
            local cid = clampId(spellId .. "_c" .. j)
            local cname = set.displayName .. " Bonus"
            if #cname > 31 then cname = set.displayName:sub(1, 25) .. " Bonus" end
            local spell = tes3.getObject(cid) or tes3.createObject({
                objectType = tes3.objectType.spell,
                id = cid,
                name = cname,
                castType = tes3.spellType.ability,
            })
            for i = 1, 8 do
                local e = spell.effects[i]
                if i == 1 then
                    e.id = resolveEffect(def.effect, " in set '" .. set.displayName .. "'")
                    e.rangeType = resolveRange(def.range)
                    e.skill = resolveSkill(def.skill)
                    e.attribute = resolveAttribute(def.attribute)
                    e.min, e.max = scaledMinMax(def)
                    e.duration = def.duration or 0
                    e.radius = def.radius or 0
                else
                    e.id = -1
                end
            end
            list[j] = { spellId = cid, condition = def.condition, def = def }
        end
        set.conditionals[tier] = list
    end
    log:debug("buildSpellsForSet: built '%s'", set.displayName)
end

--- Rescale every already-built Lua-defined bonus spell (in place). `benefitScale`
--- scales helpful effects; `drawbackScale` scales Weakness drawbacks (0 = off).
--- Either arg may be nil to keep the current value. Edits the existing spell
--- records' effect magnitudes, so callers should force affected actors to refresh
--- (remove + re-add) for the change to take effect.
---@param benefitScale number|nil
---@param drawbackScale number|nil
function interop.applyScale(benefitScale, drawbackScale)
    if type(benefitScale) == "number" and benefitScale > 0 then
        interop.benefitScale = benefitScale
    end
    if type(drawbackScale) == "number" and drawbackScale >= 0 then
        interop.drawbackScale = drawbackScale
    end
    for _, set in ipairs(config.setsArray) do
        if set.bonuses then
            for _, tier in ipairs({ "min", "mid", "max" }) do
                local defs = set.bonuses[tier]
                if defs then
                    local id = set[tier .. "Bonus"]
                    if id then
                        local spell = tes3.getObject(id)
                        if spell then
                            local i = 0
                            for _, def in ipairs(defs) do
                                if not def.condition then
                                    i = i + 1
                                    local e = spell.effects[i]
                                    if e then e.min, e.max = scaledMinMax(def) end
                                end
                            end
                        end
                    end
                    local conds = set.conditionals and set.conditionals[tier]
                    if conds then
                        for _, entry in ipairs(conds) do
                            local spell = tes3.getObject(entry.spellId)
                            if spell and spell.effects[1] then
                                spell.effects[1].min, spell.effects[1].max = scaledMinMax(entry.def)
                            end
                        end
                    end
                end
            end
        end
    end
    log:debug("applyScale: benefits %.2fx, drawbacks %.2fx",
        interop.benefitScale, interop.drawbackScale)
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

    -- If a set with this name already exists, this call REPLACES it (an empty set
    -- effectively disables it). Drop the old definition's item links first so any
    -- removed items stop counting.
    local existing = config.sets[setData.name]
    -- Keep the same generated spell IDs on replace so worn abilities update in
    -- place (rather than leaving a stale spell of the old definition behind).
    if existing then setData.spellPrefix = existing.spellPrefix or setData.spellPrefix end
    if existing and existing.items then
        for _, olditem in ipairs(existing.items) do
            local links = config.setLinks[olditem:lower()]
            if links then links[setData.name] = nil end
        end
    end

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
            linkIconFor(key, setData.name)
        end
    end
    setData.items = unique

    config.sets[setData.name] = setData
    if existing then
        -- Swap in place so setsArray doesn't accumulate stale duplicates.
        for i, s in ipairs(config.setsArray) do
            if s == existing then config.setsArray[i] = setData; break end
        end
    else
        table.insert(config.setsArray, setData)
    end

    -- Build runtime spells now if the game is already up; otherwise the
    -- 'initialized' handler below builds them once data is loaded.
    if gameInitialized and hasLuaBonuses then
        interop.buildSpellsForSet(setData)
        -- A redefinition can change effects the player is already wearing -- refresh.
        if existing then event.trigger("Static:RescaleBonuses") end
    end

    log:debug("registerSet: registered '%s' (%d items)%s", setData.name, #setData.items,
        existing and " [replace]" or "")
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
    linkIconFor(item, setName)
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
            linkIconFor(key, setName)
        end
    end
    return set
end

-- Append `src` effect defs onto `dst` per tier (capped at 8 effects per tier).
local function mergeBonuses(dst, src)
    dst = dst or {}
    for _, tier in ipairs({ "min", "mid", "max" }) do
        if src[tier] then
            local list = dst[tier] or {}
            for _, e in ipairs(src[tier]) do
                if #list >= 8 then
                    log:warn("amendSet: %s tier capped at 8 effects; extra ignored", tier)
                    break
                end
                list[#list + 1] = e
            end
            dst[tier] = list
        end
    end
    return dst
end

--- Non-destructively amend an existing (Lua-defined) set: append items and/or bonus
--- effects, and override individual thresholds -- unlike registerSet, existing
--- content is kept. Rebuilds the set's spells and refreshes worn bonuses live.
---@param setName string
---@param patch table { items = {...}, bonuses = { min/mid/max = {...} }, thresholds = { min=, mid=, max= } }
---@return table|nil set
function interop.amendSet(setName, patch)
    if type(setName) ~= "string" or type(patch) ~= "table" then return end
    setName = setName:lower()
    local set = config.sets[setName]
    if not set then
        log:warn("amendSet: no registered set named '%s'", setName)
        return
    end
    if type(patch.items) == "table" then
        for _, item in ipairs(patch.items) do
            if type(item) == "string" then
                local key = item:lower()
                if not (config.setLinks[key] and config.setLinks[key][setName]) then
                    table.insert(set.items, key)
                    if not config.setLinks[key] then config.setLinks[key] = {} end
                    config.setLinks[key][setName] = true
                    linkIconFor(key, setName)
                end
            end
        end
    end
    if type(patch.bonuses) == "table" then set.bonuses = mergeBonuses(set.bonuses, patch.bonuses) end
    if type(patch.thresholds) == "table" then
        set.thresholds = set.thresholds or { min = 2, mid = 4, max = 6 }
        for _, tier in ipairs({ "min", "mid", "max" }) do
            if patch.thresholds[tier] then set.thresholds[tier] = patch.thresholds[tier] end
        end
    end
    if gameInitialized then
        interop.buildSpellsForSet(set)
        event.trigger("Static:RescaleBonuses")
    end
    log:debug("amendSet: amended '%s'", set.name)
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
    -- Bulk-build the icon+mesh index for every item registered so far (file-scope
    -- sets). Items added later at runtime link via linkIconFor as they are added.
    for itemId, setmap in pairs(config.setLinks) do
        local obj = tes3.getObject(itemId)
        local sig = iconMeshSig(obj)
        if sig then
            local dst = config.iconLinks[sig] or {}
            for setName in pairs(setmap) do dst[setName] = true end
            config.iconLinks[sig] = dst
        end
    end
    log:debug("interop initialized: %d set(s) registered.", #config.setsArray)
end)

return interop
