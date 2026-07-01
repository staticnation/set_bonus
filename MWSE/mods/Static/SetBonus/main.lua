-- Static Set Bonus -- core runtime: counts equipped set pieces and applies the
-- matching tier ability. Registration/data lives in SetBonus/interop.lua.
local log = require("Static.SetBonus.logger")
local config = require("Static.SetBonus.config")
local settings = require("Static.SetBonus.settings")
local interop = require("Static.SetBonus.interop")

-- Apply the saved magnitude scales before the interop builds the tier spells
-- (it builds on the 'initialized' event, which runs after this file loads).
interop.benefitScale = (settings.scalePct or 100) / 100
interop.drawbackScale = (settings.weaknessPct or 100) / 100

-- Fallback thresholds if a set somehow lacks them (registerSet normally sets these).
local DEFAULT_THRESHOLDS = { min = 2, mid = 4, max = 6 }

-- Per-reference cache of the currently-applied tier per set.
-- Weak keys so dead references can be garbage-collected.
-- Shape: appliedTier[ref] = { [setName] = "min"|"mid"|"max" }
local appliedTier = setmetatable({}, { __mode = "k" })

-- Equippable object types that can belong to a set.
local ALLOWED_TYPES = {
    [tes3.objectType.armor] = true,
    [tes3.objectType.clothing] = true,
    [tes3.objectType.weapon] = true,
}

-- Consistent Enchanting (optional soft-dependency): when the player enchants an
-- item, CE can record the base item it was made from in the item's data as
-- `ncceEnchantedFrom`. If present we match that base id too -- an exact match with
-- no false positives, which works even when icon matching is turned off.
local function stackItemData(stack)
    return stack and (stack.itemData or (stack.variables and stack.variables[1])) or nil
end
local function enchantedBaseId(itemData)
    local d = itemData and itemData.data
    local b = d and d.ncceEnchantedFrom
    return type(b) == "string" and b:lower() or nil
end

-- Does an equipped object belong to `setName`? Matches by item ID; by the base id
-- of a Consistent-Enchanting item (exact); and -- when 'match by icon' is on -- by
-- inventory icon, so a player-enchanted or copied piece (new object ID) still counts.
---@param obj tes3item
---@param setName string
---@param baseId string|nil  the CE base item id, if any
---@return boolean
local function objInSet(obj, setName, baseId)
    local id = obj.id and obj.id:lower()
    if id and config.setLinks[id] and config.setLinks[id][setName] then return true end
    if baseId and config.setLinks[baseId] and config.setLinks[baseId][setName] then return true end
    if settings.matchByIcon and obj.icon then
        local il = config.iconLinks[obj.icon:lower()]
        if il and il[setName] then return true end
    end
    return false
end

-- All set names an equipped object belongs to (by ID, CE base id, and/or icon).
---@param obj tes3item
---@param baseId string|nil
---@return table|nil names  { [setName] = true } or nil
local function setsForObject(obj, baseId)
    local names
    local function merge(src)
        if not src then return end
        names = names or {}
        for s in pairs(src) do names[s] = true end
    end
    local id = obj.id and obj.id:lower()
    if id then merge(config.setLinks[id]) end
    if baseId then merge(config.setLinks[baseId]) end
    if settings.matchByIcon and obj.icon then merge(config.iconLinks[obj.icon:lower()]) end
    return names
end

-- Count how many equipped pieces a reference has for a given set.
---@param ref tes3reference
---@param setName string
---@return number
local function countEquippedForSet(ref, setName)
    if not (ref.object and ref.object.equipment) then return 0 end
    local count = 0
    for _, stack in pairs(ref.object.equipment) do
        local obj = stack.object
        if obj and ALLOWED_TYPES[obj.objectType] then
            local baseId = enchantedBaseId(stackItemData(stack))
            if objInSet(obj, setName, baseId) then count = count + 1 end
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

    -- Clear all tier spells, then add the desired one (if any). Guard against nil
    -- ids: a set may define only some tiers, or a tier's spell may have failed to build.
    if set.minBonus then tes3.removeSpell{ reference = ref, spell = set.minBonus } end
    if set.midBonus then tes3.removeSpell{ reference = ref, spell = set.midBonus } end
    if set.maxBonus then tes3.removeSpell{ reference = ref, spell = set.maxBonus } end
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
    local obj = e and e.item
    if not obj then return end
    -- Find sets by the changed item's ID, CE base id, and (if enabled) its icon.
    local names = setsForObject(obj, enchantedBaseId(e.itemData))
    if not names then return end
    -- Respect the "apply to NPCs" setting.
    if e.reference ~= tes3.player and not settings.npcBonuses then return end

    for setName, _ in pairs(names) do
        local set = config.sets[setName]
        if set then
            local numEquipped = countEquippedForSet(e.reference, setName)
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
    for _, stack in pairs(e.reference.object.equipment) do
        local obj = stack.object
        if obj and ALLOWED_TYPES[obj.objectType] then
            local baseId = enchantedBaseId(stackItemData(stack))
            local names = setsForObject(obj, baseId)
            if names then
                for setName in pairs(names) do
                    setCounts[setName] = (setCounts[setName] or 0) + 1
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
        -- Re-apply: scan actors in the currently-active c