-- Set Bonus -- OpenMW global script.
-- Builds the tier ability spells at runtime (world.createRecord) and applies the
-- correct tier to each actor based on equipped set pieces. Targets OpenMW 0.51+.
local world   = require('openmw.world')
local core    = require('openmw.core')
local types   = require('openmw.types')
local storage = require('openmw.storage')
local async   = require('openmw.async')
local I       = require('openmw.interfaces')
local data    = require('scripts.SetBonus.data')

local SPELL = {}      -- [setIndex][tier] = generated spell record (object)
local itemLink = {}   -- itemId(lower) -> { setIndex, ... }
local stateOf = {}    -- [actorId] = { [setIndex] = tier }
local cleaned = {}    -- [actorId] = true once stale spells purged
local ready = false

local cfg  -- global settings section

local function npcBonusesEnabled()
    local v = cfg and cfg:get('npcBonuses')
    if v == nil then return true end
    return v
end

local NOSCALE = { waterbreathing = true, waterwalking = true, levitate = true, jump = true, telekinesis = true }
local function isWeakness(id) return type(id) == 'string' and id:sub(1, 8) == 'weakness' end
local function benefitScaleVal()
    local v = cfg and cfg:get('scale')
    if type(v) == 'number' and v > 0 then return v end
    return 1.0
end
local function drawbackScaleVal()
    local v = cfg and cfg:get('weaknessScale')
    if type(v) == 'number' and v >= 0 then return v end
    return 1.0
end
-- Whole-number scale (round half up); a real effect (base >= 1) never rounds to 0
-- so over-time ticks (restore*) and small bonuses can't silently vanish. Scale 0
-- does zero the effect (used to switch drawbacks off).
local function roundScale(base, scale)
    if base == 0 or scale <= 0 then return 0 end
    local v = math.floor(base * scale + 0.5)
    if v < 1 and base >= 1 then v = 1 end
    return v
end

local function dbg(...)
    if cfg and cfg:get('debug') then print('[SetBonus]', ...) end
end

local function registerSettings()
    I.Settings.registerGroup{
        key = 'SettingsGlobalSetBonus',
        page = 'SetBonus',
        l10n = 'SetBonus',
        name = 'General',
        description = 'Set Bonus options (shared/global).',
        permanentStorage = true,
        settings = {
            {
                key = 'npcBonuses',
                renderer = 'checkbox',
                name = 'Apply bonuses to NPCs',
                description = 'If on, NPCs wearing full sets also receive set bonuses. Turn off for player-only bonuses.',
                default = true,
            },
            {
                key = 'debug',
                renderer = 'checkbox',
                name = 'Debug logging',
                description = 'Print Set Bonus diagnostics (spell creation, tier changes) to the log/console.',
                default = false,
            },
            {
                key = 'scale',
                renderer = 'number',
                argument = { min = 0.25, max = 3.0, integer = false },
                name = 'Benefit magnitude scale',
                description = 'Multiplies the helpful set-bonus effects. 1.0 = default, 0.5 = half, 2.0 = double. Magnitudes are always whole numbers and never drop to 0. Applies immediately.',
                default = 1.0,
            },
            {
                key = 'weaknessScale',
                renderer = 'number',
                argument = { min = 0.0, max = 3.0, integer = false },
                name = 'Weakness (drawback) scale',
                description = 'Multiplies the thematic Weakness drawbacks independently of the benefits. 1.0 = default, 0.5 = milder, 2.0 = harsher, 0 = no drawbacks. Applies immediately.',
                default = 1.0,
            },
        },
    }
    cfg = storage.globalSection('SettingsGlobalSetBonus')
end

local byName = {}     -- setName(lower) -> setIndex (into `data`)

-- Link every item of one set to its index (deduped so a repeat can't inflate counts).
local function linkItems(si)
    local s = data[si]
    for _, it in ipairs(s.items) do
        local k = it:lower()
        local list = itemLink[k]
        if not list then list = {}; itemLink[k] = list end
        local dup = false
        for _, x in ipairs(list) do if x == si then dup = true; break end end
        if not dup then list[#list + 1] = si end
    end
end

local function buildItemLinks()
    for si in ipairs(data) do linkItems(si) end
end

-- Drop every item link that points at a set index (used when a set is replaced).
local function unlinkSet(si)
    for k, list in pairs(itemLink) do
        for i = #list, 1, -1 do if list[i] == si then table.remove(list, i) end end
        if #list == 0 then itemLink[k] = nil end
    end
end

local function indexByName()
    for si, s in ipairs(data) do byName[s.name:lower()] = si end
end

local builtCount, failCount = 0, 0
-- Build (or rebuild) the tier spell records for one set, with the current scales.
local function buildSpellsForSet(si)
    local s = data[si]
    SPELL[si] = {}
    for _, tier in ipairs({ 'min', 'mid', 'max' }) do
        local effs = s.bonuses[tier]
        if effs and #effs > 0 then
            local ok, rec = pcall(function()
                local draft = {
                    name = s.name .. ' Set Bonus',
                    type = core.magic.SPELL_TYPE.Ability,
                    cost = 0,
                    effects = {},
                }
                local bsc = benefitScaleVal()
                local dsc = drawbackScaleVal()
                for _, e in ipairs(effs) do
                    local m
                    if NOSCALE[e.effect] then
                        m = e.mag
                    elseif isWeakness(e.effect) then
                        m = roundScale(e.mag, dsc)
                    else
                        m = roundScale(e.mag, bsc)
                    end
                    draft.effects[#draft.effects + 1] = {
                        id = e.effect,
                        affectedSkill = e.skill,
                        affectedAttribute = e.attribute,
                        range = core.magic.RANGE.Self,
                        area = 0,
                        duration = e.dur or 0,
                        magnitudeMin = m,
                        magnitudeMax = m,
                    }
                end
                return world.createRecord(core.magic.spells.createRecordDraft(draft))
            end)
            if ok and rec then
                SPELL[si][tier] = rec
                builtCount = builtCount + 1
            else
                failCount = failCount + 1
                print('[SetBonus] could not create spell for ' .. s.name .. ' ' .. tier .. ': ' .. tostring(rec))
            end
        end
    end
end

local function buildSpells()
    for si in ipairs(data) do buildSpellsForSet(si) end
end

local function recomputeAll()
    for _, a in ipairs(world.activeActors) do
        core.sendGlobalEvent('SetBonus_recompute', { actor = a })
    end
end

-- ---------------------------------------------------------------------------
-- Framework API (exposed as interface I.SetBonus and via global events).
-- Registration is data-only, so it works over events too. Sets registered
-- before init() are picked up by init()'s build pass; sets registered after
-- are built and applied immediately.
-- ---------------------------------------------------------------------------

local function normalizeSet(sd)
    assert(type(sd) == 'table' and type(sd.name) == 'string' and sd.name ~= '',
        '[SetBonus] registerSet: a non-empty string `name` is required')
    assert(type(sd.items) == 'table', '[SetBonus] registerSet: `items` table is required')
    assert(type(sd.bonuses) == 'table', '[SetBonus] registerSet: `bonuses` table is required')
    local t = sd.thresholds or {}
    sd.thresholds = { min = t.min or 2, mid = t.mid or 4, max = t.max or 6 }
    local seen, uniq = {}, {}
    for _, it in ipairs(sd.items) do
        if type(it) == 'string' then
            local k = it:lower()
            if not seen[k] then seen[k] = true; uniq[#uniq + 1] = k end
        end
    end
    sd.items = uniq
    return sd
end

local function registerSet(sd)
    normalizeSet(sd)
    local key = sd.name:lower()
    local si = byName[key]
    local replaced = false
    if si then
        unlinkSet(si)            -- drop the previous definition's item links first
        data[si] = sd            -- full replace (an empty set effectively disables it)
        replaced = true
    else
        data[#data + 1] = sd
        si = #data
        byName[key] = si
    end
    linkItems(si)
    if ready then
        buildSpellsForSet(si)
        if replaced then
            -- a redefinition can change tiers/effects; purge stale records by name
            cleaned = {}
            stateOf = {}
        end
        recomputeAll()
    end
    dbg(('registerSet: %s (%d items)%s'):format(sd.name, #sd.items, replaced and ' [replace]' or ''))
    return sd
end

local TIERS = { 'min', 'mid', 'max' }
local MAXEFF = 8
-- Append `src` effects onto `dst` per tier (capped at 8 effects/tier).
local function mergeBonuses(dst, src)
    dst = dst or {}
    for _, tier in ipairs(TIERS) do
        if src[tier] then
            local list = dst[tier] or {}
            for _, e in ipairs(src[tier]) do
                if #list >= MAXEFF then
                    print('[SetBonus] amendSet: ' .. tier .. ' tier capped at 8 effects; extra ignored')
                    break
                end
                list[#list + 1] = e
            end
            dst[tier] = list
        end
    end
    return dst
end

-- Non-destructively amend an existing set: append items and/or bonus effects, and
-- override individual thresholds. Unlike registerSet, it keeps what's already there.
-- patch = { items = {...}, bonuses = { min/mid/max = {...} }, thresholds = { min=,mid=,max= } }
local function amendSet(name, patch)
    if type(name) ~= 'string' or type(patch) ~= 'table' then return end
    local si = byName[name:lower()]
    if not si then dbg('amendSet: no set named ' .. tostring(name)); return end
    local s = data[si]
    if type(patch.items) == 'table' then
        local have = {}
        for _, it in ipairs(s.items) do have[it:lower()] = true end
        for _, it in ipairs(patch.items) do
            if type(it) == 'string' then
                local k = it:lower()
                if not have[k] then have[k] = true; s.items[#s.items + 1] = k end
            end
        end
    end
    if type(patch.bonuses) == 'table' then s.bonuses = mergeBonuses(s.bonuses, patch.bonuses) end
    if type(patch.thresholds) == 'table' then
        s.thresholds = s.thresholds or { min = 2, mid = 4, max = 6 }
        for _, tier in ipairs(TIERS) do
            if patch.thresholds[tier] then s.thresholds[tier] = patch.thresholds[tier] end
        end
    end
    linkItems(si)
    if ready then
        buildSpellsForSet(si)
        cleaned = {}
        stateOf = {}
        recomputeAll()
    end
    dbg(('amendSet: %s'):format(s.name))
end

local function addItems(name, items)
    if type(name) ~= 'string' or type(items) ~= 'table' then return end
    local si = byName[name:lower()]
    if not si then dbg('addItems: no set named ' .. tostring(name)); return end
    local s = data[si]
    local have = {}
    for _, it in ipairs(s.items) do have[it:lower()] = true end
    for _, it in ipairs(items) do
        if type(it) == 'string' then
            local k = it:lower()
            if not have[k] then have[k] = true; s.items[#s.items + 1] = k end
        end
    end
    linkItems(si)
    if ready then recomputeAll() end
end

local function registerSetLink(t)
    if type(t) ~= 'table' or type(t.item) ~= 'string' or type(t.set) ~= 'string' then return end
    local si = byName[t.set:lower()]
    if not si then dbg('registerSetLink: no set named ' .. tostring(t.set)); return end
    local s = data[si]
    local k = t.item:lower()
    local have = false
    for _, it in ipairs(s.items) do if it:lower() == k then have = true; break end end
    if not have then s.items[#s.items + 1] = k end
    linkItems(si)
    if ready then recomputeAll() end
end

local function getSetsForItem(itemId)
    if type(itemId) ~= 'string' then return nil end
    local links = itemLink[itemId:lower()]
    if not links then return nil end
    local names = {}
    for _, si in ipairs(links) do names[#names + 1] = data[si].name end
    return names
end

local function isItemInSet(itemId, name)
    if type(itemId) ~= 'string' or type(name) ~= 'string' then return false end
    local links = itemLink[itemId:lower()]
    local target = byName[name:lower()]
    if not links or not target then return false end
    for _, si in ipairs(links) do if si == target then return true end end
    return false
end

local function init()
    if ready then return end
    registerSettings()
    -- re-apply to everyone whenever the NPC-bonuses toggle changes
    cfg:subscribe(async:callback(function(_, key)
        if key == 'scale' or key == 'weaknessScale' then
            buildSpells()   -- rebuild records with the new scale(s)
            cleaned = {}     -- force per-actor purge-by-name + reapply
            stateOf = {}
        end
        recomputeAll()
    end))
    indexByName()
    buildItemLinks()
    buildSpells()
    ready = true
    dbg(('initialised: %d spells built, %d failed, %d sets'):format(builtCount, failCount, #data))
end

local function tierFor(s, count)
    local t = s.thresholds
    if count >= t.max then return 'max'
    elseif count >= t.mid then return 'mid'
    elseif count >= t.min then return 'min' end
    return nil
end

local function equippedIds(actor)
    local ids = {}
    for _, slot in pairs(types.Actor.EQUIPMENT_SLOT) do
        local obj = types.Actor.getEquipment(actor, slot)
        if obj and obj.recordId then ids[obj.recordId:lower()] = true end
    end
    return ids
end

local function recompute(actor)
    init()
    if not actor or not actor:isValid() then return end
    local aid = actor.id
    local isPlayer = types.Player.objectIsInstance(actor)
    local spells = types.Actor.spells(actor)

    if not cleaned[aid] then
        -- Spell record ids are regenerated every session, so match our abilities by
        -- name to purge any left on the actor from a previous save (prevents stacking).
        local stale = {}
        for _, sp in pairs(spells) do
            local nm = sp.name
            if nm and string.find(nm, " Set Bonus", 1, true) then stale[#stale + 1] = sp end
        end
        for _, sp in ipairs(stale) do spells:remove(sp) end
        stateOf[aid] = {}
        cleaned[aid] = true
    end

    local new = {}
    if isPlayer or npcBonusesEnabled() then
        local equipped = equippedIds(actor)
        local candidates = {}
        for itemId in pairs(equipped) do
            local links = itemLink[itemId]
            if links then for _, si in ipairs(links) do candidates[si] = true end end
        end
        for si in pairs(candidates) do
            local s = data[si]
            local count = 0
            for _, it in ipairs(s.items) do if equipped[it:lower()] then count = count + 1 end end
            local tier = tierFor(s, count)
            if tier and SPELL[si] and SPELL[si][tier] then new[si] = tier end
        end
    end

    local old = stateOf[aid] or {}
    local union = {}
    for si in pairs(old) do union[si] = true end
    for si in pairs(new) do union[si] = true end
    for si in pairs(union) do
        local o, n = old[si], new[si]
        if o ~= n then
            if o and SPELL[si][o] then spells:remove(SPELL[si][o]) end
            if n and SPELL[si][n] then spells:add(SPELL[si][n]) end
            dbg(('%s: %s -> %s [%s]'):format(tostring(aid), data[si].name, tostring(n), tostring(o)))
            if isPlayer then
                actor:sendEvent('SetBonus_notify', { name = data[si].name, tier = n })
            end
        end
    end
    stateOf[aid] = new
end

return {
    interfaceName = 'SetBonus',
    interface = {
        version = 1,
        -- Register a set: { name=, items={...}, bonuses={min/mid/max={ {effect=,mag=,skill=,attribute=,dur=}, ... }}, thresholds={min=2,mid=4,max=6} }
        registerSet = function(sd) return registerSet(sd) end,   -- full (re)definition; replaces an existing name
        amendSet = function(name, patch) return amendSet(name, patch) end,  -- additive merge into an existing set
        addItems = function(name, items) return addItems(name, items) end,
        registerSetLink = function(t) return registerSetLink(t) end,
        getSet = function(name)
            local si = type(name) == 'string' and byName[name:lower()]
            return si and data[si] or nil
        end,
        getSets = function() return data end,
        getSetsForItem = function(itemId) return getSetsForItem(itemId) end,
        isItemInSet = function(itemId, name) return isItemInSet(itemId, name) end,
        -- current magnitude multipliers (read-only helpers)
        benefitScale = function() return benefitScaleVal() end,
        drawbackScale = function() return drawbackScaleVal() end,
    },
    engineHandlers = {
        onUpdate = function() init() end,
    },
    eventHandlers = {
        SetBonus_recompute = function(e) recompute(e.actor) end,
        -- Registration over events (for mods without a global script). Payload is
        -- the same data table you'd pass to the interface functions.
        SetBonus_registerSet = function(e) registerSet(e) end,
        SetBonus_amendSet = function(e) amendSet(e.name, e.patch) end,
        SetBonus_addItems = function(e) addItems(e.name, e.items) end,
        SetBonus_registerSetLink = function(e) registerSetLink(e) end,
    },
}
