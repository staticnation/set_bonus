local lfs = require('lfs')
local config = require("Static.Set Bonus.config")
local sets = config.sets
local setLinks = config.setLinks
local interop = require("Static.Set Bonus.init")
local util = require("Static.Set Bonus.util")

local function initAll(path)
    path = "Data Files/MWSE/mods/Static/Set Bonus/" .. path .. "/"
    for file in lfs.dir(path) do
        if file:match("(.+)%.lua$") then
            local set = require("Static.Set Bonus." .. path .. file:match("(.+)%.lua$"))
            interop.registerSet(set)
        end
    end
end

-- Load set files using interop
initAll("sets")

for id, set in pairs(sets) do
    mwse.log("Creating links for set: %s", set.name)
    for _, item in ipairs(set.items) do
        mwse.log("  setLinks[%s] = sets[%s]", item, id)
        setLinks[item:lower()] = set
    end
end

local function countItemsEquipped(ref, items)
    local count = 0
    for _, item in ipairs(items) do
        if mwscript.hasItemEquipped{reference=ref, item=item} then
            count = count + 1
        end
    end
    return count
end

local function addSpell(t)
    for _, spell in ipairs(t.spell) do
        if not mwscript.getSpellEffects{reference=t.reference, spell=spell} then
            mwscript.addSpell{reference=t.reference, spell=spell}
        end
    end
end

local function removeSpell(t)
    for _, spell in ipairs(t.spell) do
        if mwscript.getSpellEffects{reference=t.reference, spell=spell} then
            mwscript.removeSpell{reference=t.reference, spell=spell}
        end
    end
end

local function addSetBonus(set, ref, numEquipped)
    if numEquipped >= 6 then
        removeSpell{reference=ref, spell=set.minBonus}
        addSpell{reference=ref, spell=set.maxBonus}
    elseif numEquipped >= 4 then
        addSpell{reference=ref, spell=set.minBonus}
        removeSpell{reference=ref, spell=set.maxBonus}
    else
        removeSpell{reference=ref, spell=set.minBonus}
        removeSpell{reference=ref, spell=set.maxBonus}
    end
end

local function equipsChanged(e)
    local id = e and e.item and e.item.id
    if not id then return end
    local set = setLinks[id:lower()]
    if not set then return end
    local numEquipped = countItemsEquipped(e.reference, set.items)
    if e.reference == tes3.player then
        tes3.messageBox("You have %s items of the %s set equipped", numEquipped, set.name)
    end
    addSetBonus(set, e.reference, numEquipped)
end

event.register("equipped", equipsChanged)
event.register("unequipped", equipsChanged)
event.register("loaded", equipsChanged)

local function npcLoaded(e)
    if not e.reference then return end
    local set_counts = {}

    for stack in tes3.iterate(e.reference.object.equipment) do
        if stack.object.objectType == tes3.objectType.armor then
            local set = setLinks[stack.object.id:lower()]
            if set then
                set_counts[set] = (set_counts[set] or 0) + 1
            end
        end
    end

    for set, count in pairs(set_counts) do
        addSetBonus(set, e.reference, count)
    end
end

event.register("mobileActivated", npcLoaded)
event.register("loaded", npcLoaded)