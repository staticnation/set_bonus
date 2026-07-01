-- Static Set Bonus -- core runtime: counts equipped set pieces and applies the
-- matching tier ability. Registration/data lives in SetBonus/interop.lua.
local log = require("Static.SetBonus.logger")
local config = require("Static.SetBonus.config")
local settings = require("Static.SetBonus.settings")
local interop = require("Static.SetBonus.interop")
local conditions = require("Static.SetBonus.conditions")

-- Apply the saved magnitude scales before the interop builds the tier spells
-- (it builds on the 'initialized' event, which runs after this file loads).
interop.benefitScale = (settings.scalePct or 100) / 100
interop.drawbackScale = (settings.weaknessPct or 100) / 100

-- Fallback thresholds if a set somehow lacks them (registerSet normally sets these).
local DEFAULT_THRESHOLDS = { min = 2, mid = 4, max = 6 }

-- Per-reference cache of the currently-applied tier per set (weak keys).
local appliedTier = setmetatable({}, { __mode = "k" })

-- Equippable object types that can belong to a set.
local ALLOWED_TYPES = {
    [tes3.objectType.armor] = true,
    [tes3.objectType.clothing] = true,
    [tes3.objectType.weapon] = true,
}

-- Consistent Enchanting (optional): an enchanted item can carry its base item id.
local function stackItemData(stack)
    return stack and (stack.itemData or (stack.variables and stack.variables[1])) or nil
end
local function enchantedBaseId(itemData)
    local d = itemData and itemData.data
    local b = d and d.ncceEnchantedFrom
    return type(b) == "string" and b:lower() or nil
end

-- Does an equipped object belong to `setName`? By id, CE base id, or (if on) icon.
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

-- All set names an equipped object belongs to (by id, CE base id, and/or icon).
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

-- Map an equipped-piece count to a tier name (or nil), using the set's thresholds.
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

-- Apply the correct tier spell, only touching spells when the tier actually changes.
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
    -- Clear all tier spells, then add the desired one (if any). Nil-guarded.
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

-- Recompute affected sets whenever equipment changes.
local function equipsChanged(e)
    local obj = e and e.item
    if not obj then return end
    local names = setsForObject(obj, enchantedBaseId(e.itemData))
    if not names then return end
    if e.reference ~= tes3.player and not settings.npcBonuses then return end
    for setName, _ in pairs(names) do
        local set = config.sets[setName]
        if set then
            local numEquipped = countEquippedForSet(e.reference, setName)
            local tier, changed = applySetBonus(set, e.reference, numEquipped)
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

-- Apply bonuses for an actor based on what they currently wear.
local function actorLoaded(e)
    if not e.reference or not e.reference.object.equipment then return end
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

-- Re-evaluate NPC bonuses immediately when the "Apply bonuses to NPCs" toggle changes.
local function refreshNpcBonuses()
    if settings.npcBonuses then
        for _, cell in ipairs(tes3.getActiveCells()) do
            for ref in cell:iterateReferences() do
                if ref ~= tes3.player and ref.mobile and ref.object and ref.object.equipment then
                    actorLoaded({ reference = ref })
                end
            end
        end
        log:debug("refreshNpcBonuses: re-applied bonuses to active NPCs.")
    else
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

-- Rescale all Lua-defined bonus spells live when a magnitude slider changes.
local function rescaleBonuses()
    local benefit = (settings.scalePct or 100) / 100
    local drawback = (settings.weaknessPct or 100) / 100
    interop.applyScale(benefit, drawback)
    for ref, refTiers in pairs(appliedTier) do
        if ref == tes3.player or settings.npcBonuses then
            for setName in pairs(refTiers) do
                local set = config.sets[setName]
                if set then removeAllTiers(ref, set) end
            end
        end
    end
    appliedTier = setmetatable({}, { __mode = "k" })
    if tes3.player then actorLoaded({ reference = tes3.player }) end
    if settings.npcBonuses then
        for _, cell in ipairs(tes3.getActiveCells()) do
            for ref in cell:iterateReferences() do
                if ref ~= tes3.player and ref.mobile and ref.object and ref.object.equipment then
                    actorLoaded({ reference = ref })
                end
            end
        end
    end
    log:debug("rescaleBonuses: benefits %.2fx, drawbacks %.2fx; refreshed actors.", benefit, drawback)
end
event.register("Static:RescaleBonuses", rescaleBonuses)

-- -------------------------------------------------------------------------
-- Item tooltip: set, current progress, and each tier's effects (active tier
-- highlighted). Multi-set items list each set they belong to.
-- -------------------------------------------------------------------------
local COLOR = {
    gold  = { 0.86, 0.72, 0.36 },
    green = { 0.45, 0.85, 0.45 },
    white = { 0.85, 0.85, 0.85 },
    grey  = { 0.50, 0.50, 0.50 },
    red   = { 0.88, 0.46, 0.46 },
}
local TIER_KEYS = { "min", "mid", "max" }
local TIER_LABEL = { min = "Lesser", mid = "Greater", max = "Full" }

local function effectUnit(name)
    if name:find("Resist") or name:find("Weakness") or name:find("Reflect")
        or name:find("Absor") or name:find("Sanctuary") or name:find("Chameleon") then
        return "%"
    end
    return ""
end

local function formatEffect(eff)
    local name
    local ok, n = pcall(tes3.getMagicEffectName, { effect = eff.id, skill = eff.skill, attribute = eff.attribute })
    if ok and n and n ~= "" then
        name = n
    else
        local me = tes3.getMagicEffect(eff.id)
        name = (me and me.name) or ("Effect " .. tostring(eff.id))
    end
    local unit = effectUnit(name)
    local mag
    if eff.min and eff.max and eff.min ~= eff.max then
        mag = string.format("%d-%d%s", eff.min, eff.max, unit)
    else
        mag = string.format("%d%s", eff.max or eff.min or 0, unit)
    end
    return name, mag
end

local function addEffectRow(block, eff, active, condDesc)
    local name, mag = formatEffect(eff)
    local line = block:createBlock{}
    line.flowDirection = "left_to_right"
    line.autoWidth = true
    line.autoHeight = true
    line.paddingLeft = 10
    local me = tes3.getMagicEffect(eff.id)
    if me and me.icon then
        pcall(function()
            local img = line:createImage{ path = "Icons\\" .. me.icon }
            img.width, img.height = 16, 16
            img.scaleMode = true
            img.borderRight = 5
        end)
    end
    local rowText = string.format("%s  %s", name, mag)
    if condDesc and condDesc ~= "" then rowText = rowText .. "  (when " .. condDesc .. ")" end
    local lbl = line:createLabel{ text = rowText }
    local weak = name:find("Weakness") ~= nil
    lbl.color = active and (weak and COLOR.red or COLOR.white) or COLOR.grey
end

local function addSetBlock(tooltip, set, count, index, total)
    local tier = tierFor(set, count)
    local t = set.thresholds or DEFAULT_THRESHOLDS
    local block = tooltip:createBlock{}
    block.flowDirection = "top_to_bottom"
    block.autoWidth = true
    block.autoHeight = true
    block.maxWidth = 400
    block.borderTop = 6
    block.paddingAllSides = 4
    local headerText = "Set Bonus: " .. set.displayName
    if total and total > 1 then
        headerText = headerText .. string.format("  (%d of %d)", index, total)
    end
    local header = block:createLabel{ text = headerText }
    header.color = COLOR.gold
    local status = block:createLabel{}
    if tier then
        status.text = string.format("Wearing %d piece%s - %s bonus active",
            count, count == 1 and "" or "s", TIER_LABEL[tier])
        status.color = COLOR.green
    else
        status.text = string.format("Wearing %d piece%s - need %d to activate",
            count, count == 1 and "" or "s", t.min)
        status.color = COLOR.grey
    end
    for _, tk in ipairs(TIER_KEYS) do
        local spell = set[tk .. "Bonus"] and tes3.getObject(set[tk .. "Bonus"])
        local conds = set.conditionals and set.conditionals[tk]
        local hasCond = conds and #conds > 0
        if spell or hasCond then
            local active = (tier == tk)
            local reached = count >= t[tk]
            local head = block:createLabel{
                text = string.format("%d+ pieces%s", t[tk], active and "  << active" or ""),
            }
            head.color = active and COLOR.green or (reached and COLOR.white or COLOR.grey)
            head.borderTop = 3
            if spell then
                for i = 1, #spell.effects do
                    local eff = spell.effects[i]
                    if eff and eff.id and eff.id >= 0 then addEffectRow(block, eff, active, nil) end
                end
            end
            if hasCond then
                for _, entry in ipairs(conds) do
                    local cspell = tes3.getObject(entry.spellId)
                    local eff = cspell and cspell.effects[1]
                    if eff and eff.id and eff.id >= 0 then
                        addEffectRow(block, eff, active, conditions.describe(entry.condition))
                    end
                end
            end
        end
    end
end

local function objectTooltip(e)
    if not settings.showTooltip then return end
    local obj = e.object
    if not obj or not ALLOWED_TYPES[obj.objectType] then return end
    local names = setsForObject(obj, enchantedBaseId(e.itemData))
    if not names then return end
    local ordered = {}
    for setName in pairs(names) do
        if config.sets[setName] then ordered[#ordered + 1] = setName end
    end
    if #ordered == 0 then return end
    table.sort(ordered, function(a, b)
        return config.sets[a].displayName:lower() < config.sets[b].displayName:lower()
    end)
    for i, setName in ipairs(ordered) do
        local set = config.sets[setName]
        local count = tes3.player and countEquippedForSet(tes3.player, setName) or 0
        addSetBlock(e.tooltip, set, count, i, #ordered)
    end
end
event.register(tes3.event.uiObjectTooltip, objectTooltip)

-- Mod Config Menu.
require("Static.SetBonus.mcm")
