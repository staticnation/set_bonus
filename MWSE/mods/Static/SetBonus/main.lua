-- Static Set Bonus -- core runtime: counts equipped set pieces and applies the
-- matching tier ability. Registration/data lives in SetBonus/interop.lua.
local log = require("Static.logger")
local config = require("Static.SetBonus.config")
local settings = require("Static.SetBonus.settings")

-- Fallback thresholds if a set somehow lacks them (registerSet normally sets these).
local DEFAULT_THRESHOLDS = { min = 2, mid = 4, max = 6 }

-- Per-reference cache of the currently-applied tier per set.
-- Weak keys so dead references can be garbage-collected.
-- Shape: appliedTier[ref] = { [setName] = "min"|"mid"|"max" }
local appliedTier = setmetatable({}, { __mode = "k" })

-- 'countItemsEquipped' counts how many items from a list a reference has equipped.
---@param ref tes3reference
---@param items tes3item[]
---@return number
local function countItemsEquipped(ref, items)
    if not items or type(items) ~= "table" then
        log:error("countItemsEquipped: invalid items input; must be a table.")
        return 0
    end
    local count = 0
    for _, item in ipairs(items) do
        ---@diagnostic disable-next-line
        if ref.object:hasItemEquipped(item) then
            count = count + 1
        end
    end
    return count
end

-- 'tierFor' maps an equipped-piece count to a tier name (or nil below the minimum),
-- using the set's own thresholds.
---@param set table
---@param numEquipped number
---@return string|nil
local function tierFor(set, numEquipped)
    local t = set.thresholds or DEFAULT_THRESHOLDS
    if numEquipped >= t.max then
        return "max"
    elseif numEquipped >= t.mid then
        return "mid"
    elseif numEquipped >= t.min then
        return "min"
    end
    return nil
end

-- 'applySetBonus' applies the correct tier spell, only touching spells when the
-- tier actually changes. Fires "Static:SetBonusChanged" on change.
---@param set table
---@param ref tes3reference
---@param numEquipped number
---@return string|nil tier, boolean changed
local function applySetBonus(set, ref, numEquipped)
    local tier = tierFor(set, numEquipped)

    local refTiers = appliedTier[ref]
    if not refTiers then
        refTiers = {}
        appliedTier[ref] = refTiers
    end
    local oldTier = refTiers[set.name]
    if oldTier == tier then
        return tier, false
    end

    -- Clear all tier spells, then add the desired one (if any).
    tes3.removeSpell{ reference = ref, spell = set.minBonus }
    tes3.removeSpell{ reference = ref, spell = set.midBonus }
    tes3.removeSpell{ reference = ref, spell = set.maxBonus }
    local spell = (tier == "max" and set.maxBonus)
        or (tier == "mid" and set.midBonus)
        or (tier == "min" and set.minBonus)
        or nil
    if spell then
        tes3.addSpell{ reference = ref, spell = spell }
        log:debug("applySetBonus: %s -> %s tier (%s) on %s", set.name, tier, tostring(spell), ref)
    else
        log:debug("applySetBonus: %s -> no bonus on %s", set.name, ref)
    end

    refTiers[set.name] = tier

    -- Let other mods react to the tier change.
    event.trigger("Static:SetBonusChanged", {
        reference = ref,
        set = set,
        setName = set.name,
        oldTier = oldTier,
        newTier = tier,
        count = numEquipped,
    })

    return tier, true
end

-- 'equipsChanged' recomputes affected sets whenever equipment changes.
---@param e equippedEventData|unequippedEventData
local function equipsChanged(e)
    local id = e and e.item and e.item.id
    if not id then return end
    local linkSet = config.setLinks[id:lower()]
    if not linkSet then return end
    -- Respect the "apply to NPCs" setting.
    if e.reference ~= tes3.player and not settings.npcBonuses then return end

    for setName, _ in pairs(linkSet) do
        local set = config.sets[setName]
        if set then
            local numEquipped = countItemsEquipped(e.reference, set.items)
            local tier, changed = applySetBonus(set, e.reference, numEquipped)
            -- Notify the player, but only when the tier actually changes.
            if changed and e.reference == tes3.player and settings.notifications then
                if tier then
                    tes3.messageBox("%s set bonus active (%s, %d pieces).", set.displayName, tier, numEquipped)
                else
                    tes3.messageBox("%s set bonus lost.", set.displayName)
                end
            end
        end
    end
end
event.register(tes3.event.equipped, equipsChanged)
event.register(tes3.event.unequipped, equipsChanged)

-- 'actorLoaded' applies bonuses for an actor based on what they currently wear.
-- Fires on mobileActivated, which also covers the player after a game load.
---@param e mobileActivatedEventData
local function actorLoaded(e)
    if not e.reference or not e.reference.object.equipment then return end
    -- Respect the "apply to NPCs" setting.
    if e.reference ~= tes3.player and not settings.npcBonuses then return end

    local setCounts = {}
    local allowedTypes = {
        [tes3.objectType.armor] = true,
        [tes3.objectType.clothing] = true,
        [tes3.objectType.weapon] = true,
    }
    for _, stack in pairs(e.reference.object.equipment) do
        if allowedTypes[stack.object.objectType] then
            local keySets = config.setLinks[stack.object.id:lower()]
            if keySets ~= nil then
                for set, _ in pairs(keySets) do
                    setCounts[set] = (setCounts[set] or 0) + 1
                end
            end
        end
    end

    for setName, count in pairs(setCounts) do
        local set = config.sets[setName]
        if set then
            applySetBonus(set, e.reference, count)
        end
    end
end
event.register(tes3.event.mobileActivated, actorLoaded)

-- Remove every tier spell of a set from a reference (nil-safe).
local function removeAllTiers(ref, set)
    if set.minBonus then tes3.removeSpell{ reference = ref, spell = set.minBonus } end
    if set.midBonus then tes3.removeSpell{ reference = ref, spell = set.midBonus } end
    if set.maxBonus then tes3.removeSpell{ reference = ref, spell = set.maxBonus } end
end

-- Re-evaluate NPC bonuses immediately when the "Apply bonuses to NPCs" setting
-- changes (so the player doesn't have to wait for a cell reload).
local function refreshNpcBonuses()
    if settings.npcBonuses then
        -- Re-apply: scan actors in the currently-active cells.
        for _, cell in ipairs(tes3.getActiveCells()) do
            for ref in cell:iterateReferences() do
                if ref ~= tes3.player and ref.mobile and ref.object and ref.object.equipment then
                    actorLoaded({ reference = ref })
                end
            end
        end
        log:debug("refreshNpcBonuses: re-applied bonuses to active NPCs.")
    else
        -- Remove: strip bonuses from every non-player reference we've applied to.
        for ref, refTiers in pairs(appliedTier) do
            if ref ~= tes3.player then
                for setName, tier in pairs(refTiers) do
                    local set = config.sets[setName]
                    if set and tier then removeAllTiers(ref, set) end
                    refTiers[setName] = nil
                end
            end
        end
        log:debug("refreshNpcBonuses: cleared bonuses from NPCs.")
    end
end
event.register("Static:RefreshNpcBonuses", refreshNpcBonuses)

-- Mod Config Menu.
require("Static.SetBonus.mcm")
