-- Set Bonus -- OPTIONAL item-tooltip integration for OpenMW via Inventory Extender.
--
-- OpenMW doesn't let Lua edit the vanilla item tooltip, but Inventory Extender
-- exposes `I.InventoryExtender.registerTooltipModifier`. When that mod is present
-- we append set-bonus info (set, progress, per-tier effects, active tier
-- highlighted, multi-set aware) to a set piece's tooltip. Without Inventory
-- Extender this script does nothing. Everything is guarded so it can never break
-- Inventory Extender's own tooltips (on any error we return the layout untouched).
--
-- The layout structure and helper patterns follow Inventory Extender's own API
-- and its integration examples (e.g. Sun's Dusk).

local core    = require('openmw.core')
local self    = require('openmw.self')
local types   = require('openmw.types')
local util    = require('openmw.util')
local storage = require('openmw.storage')
local I       = require('openmw.interfaces')
local data    = require('scripts.SetBonus.data')

local v2 = util.vector2
local GOLD  = util.color.rgb(0.86, 0.72, 0.36)
local GREEN = util.color.rgb(0.45, 0.85, 0.45)
local WHITE = util.color.rgb(0.82, 0.82, 0.82)
local GREY  = util.color.rgb(0.55, 0.55, 0.55)
local RED   = util.color.rgb(0.88, 0.46, 0.46)

local cfg  = storage.globalSection('SettingsGlobalSetBonus')
local pcfg = storage.playerSection('SettingsPlayerSetBonus')
local function opt(section, key, default)
    local v = section:get(key)
    if v == nil then return default end
    return v
end
local function dbg(...)
    local ok, v = pcall(function() return cfg:get('debug') end)
    if ok and v then print('[SetBonus/IE]', ...) end
end

-- ---- magnitude scaling (mirrors global.lua) --------------------------------
local NOSCALE = { waterbreathing = true, waterwalking = true, levitate = true, jump = true, telekinesis = true }
local function isWeakness(id) return type(id) == 'string' and id:sub(1, 8) == 'weakness' end
local function benefitScale()  local v = cfg:get('scale');         return (type(v) == 'number' and v > 0)  and v or 1 end
local function drawbackScale() local v = cfg:get('weaknessScale'); return (type(v) == 'number' and v >= 0) and v or 1 end
local function roundScale(base, s)
    if base == 0 or s <= 0 then return 0 end
    local r = math.floor(base * s + 0.5)
    if r < 1 and base >= 1 then r = 1 end
    return r
end
local function scaledMag(e)
    if NOSCALE[e.effect] then return e.mag end
    if isWeakness(e.effect) then return roundScale(e.mag, drawbackScale()) end
    return roundScale(e.mag, benefitScale())
end

-- ---- set membership index (built lazily, in-game) --------------------------
local ICON_TYPES = { types.Armor, types.Clothing, types.Weapon }
local function iconForId(id)
    for _, t in ipairs(ICON_TYPES) do
        local ok, rec = pcall(t.record, id)
        if ok and rec and rec.icon and rec.icon ~= '' then return rec.icon:lower() end
    end
end
local function iconForObj(o)
    for _, t in ipairs(ICON_TYPES) do
        if t.objectIsInstance(o) then
            local r = t.record(o)
            if r and r.icon and r.icon ~= '' then return r.icon:lower() end
            return nil
        end
    end
end
local itemLink, iconLink, built = {}, {}, false
local function build()
    for si, s in ipairs(data) do
        for _, it in ipairs(s.items) do
            local k = it:lower()
            itemLink[k] = itemLink[k] or {}; itemLink[k][si] = true
            local ic = iconForId(it)
            if ic then iconLink[ic] = iconLink[ic] or {}; iconLink[ic][si] = true end
        end
    end
    built = true
end
local function iconMatchOn() return opt(cfg, 'matchByIcon', true) end
local function setsForRecord(id, icon)
    local sids = {}
    if id and itemLink[id] then for si in pairs(itemLink[id]) do sids[si] = true end end
    if iconMatchOn() and icon and iconLink[icon] then for si in pairs(iconLink[icon]) do sids[si] = true end end
    return sids
end
local function equippedEntries()
    local list = {}
    for _, slot in pairs(types.Actor.EQUIPMENT_SLOT) do
        local o = types.Actor.getEquipment(self, slot)
        if o then list[#list + 1] = { id = o.recordId and o.recordId:lower() or nil, icon = iconForObj(o) } end
    end
    return list
end
local function inSet(entry, si)
    if entry.id and itemLink[entry.id] and itemLink[entry.id][si] then return true end
    if iconMatchOn() and entry.icon and iconLink[entry.icon] and iconLink[entry.icon][si] then return true end
    return false
end
local function countForSet(si, eq)
    local c = 0
    for _, e in ipairs(eq) do if inSet(e, si) then c = c + 1 end end
    return c
end

-- ---- effect display --------------------------------------------------------
local function pretty(id) return (tostring(id):gsub('^%l', string.upper)) end
local function effectName(e)
    local rec
    pcall(function() rec = core.magic.effects.records[e.effect] end)
    local name = (rec and rec.name) or pretty(e.effect)
    if e.skill then name = name .. ' ' .. pretty(e.skill)
    elseif e.attribute then name = name .. ' ' .. pretty(e.attribute) end
    return name
end
local function isPercentName(n)
    return n:find('Resist') or n:find('Weakness') or n:find('Reflect')
        or n:find('Absor') or n:find('Sanctuary') or n:find('Chameleon')
end

local TIERS = { 'min', 'mid', 'max' }
local TLABEL = { min = 'Lesser', mid = 'Greater', max = 'Full' }
local function tierFor(s, c)
    local t = s.thresholds
    if c >= t.max then return 'max' elseif c >= t.mid then return 'mid' elseif c >= t.min then return 'min' end
    return nil
end

-- Inventory Extender templates (captured when we register, once IE is confirmed).
local BASE
local function textRow(content, str, color, spaced)
    if spaced then content:add(BASE.intervalV(2)) end
    content:add({ template = BASE.textNormal, props = { text = str, textColor = color } })
end
local function separator(content)
    content:add(BASE.intervalV(8))
    pcall(function()
        content:add({ template = I.MWUI.templates.horizontalLine, props = { size = v2(220, 2) } })
    end)
    content:add(BASE.intervalV(2))
end
-- IE tooltip layout: boxSolid -> [padding] -> [tooltip flex] -> innerContent.
local function innerContentOf(layout)
    local ok, r = pcall(function() return layout.content[1].content[1].content end)
    return ok and r or nil
end

local function addSetRows(content, si, count, idx, total)
    local s = data[si]
    local t = s.thresholds
    local tier = tierFor(s, count)
    if idx == 1 then separator(content) else textRow(content, '', GREY, true) end
    local htext = 'Set Bonus: ' .. s.name
    if total > 1 then htext = htext .. string.format('  (%d of %d)', idx, total) end
    textRow(content, htext, GOLD)
    if tier then
        textRow(content, ('Wearing %d piece%s - %s bonus active'):format(count, count == 1 and '' or 's', TLABEL[tier]), GREEN)
    else
        textRow(content, ('Wearing %d piece%s - need %d to activate'):format(count, count == 1 and '' or 's', t.min), GREY)
    end
    for _, tk in ipairs(TIERS) do
        local effs = s.bonuses[tk]
        if effs and #effs > 0 then
            local active, reached = (tier == tk), (count >= t[tk])
            textRow(content, ('%d+ pieces%s'):format(t[tk], active and '  << active' or ''),
                active and GREEN or (reached and WHITE or GREY))
            for _, e in ipairs(effs) do
                local name = effectName(e)
                local unit = isPercentName(name) and '%' or ''
                local color = active and (isWeakness(e.effect) and RED or WHITE) or GREY
                textRow(content, ('  %s %d%s'):format(name, scaledMag(e), unit), color)
            end
        end
    end
end

local function modifier(item, layout)
    local ok, result = pcall(function()
        if not BASE then return layout end
        if not opt(pcfg, 'tooltip', true) then return layout end
        if not built then build() end
        local id = item.recordId and item.recordId:lower() or nil
        local sids = setsForRecord(id, iconForObj(item))
        dbg('tooltip for', id, next(sids) and 'in a set' or 'no set')
        if not next(sids) then return layout end
        local content = innerContentOf(layout)
        if not content then dbg('inner content not found'); return layout end
        local ordered = {}
        for si in pairs(sids) do ordered[#ordered + 1] = si end
        table.sort(ordered, function(a, b) return data[a].name:lower() < data[b].name:lower() end)
        local eq = equippedEntries()
        for idx, si in ipairs(ordered) do
            addSetRows(content, si, countForSet(si, eq), idx, #ordered)
        end
        dbg('added', #ordered, 'block(s)')
        return layout
    end)
    if not ok then dbg('modifier error:', tostring(result)) end
    return (ok and result) or layout
end

local registered = false
return {
    engineHandlers = {
        onUpdate = function()
            if registered then return end
            if I.InventoryExtender and I.InventoryExtender.registerTooltipModifier then
                BASE = I.InventoryExtender.Templates and I.InventoryExtender.Templates.BASE
                pcall(I.InventoryExtender.registerTooltipModifier, 'SetBonus', modifier)
                registered = true
                dbg('registered tooltip modifier with Inventory Extender; BASE=', BASE ~= nil)
            end
        end,
    },
}
