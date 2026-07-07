-- conditions.lua -- optional conditional bonuses for Set Bonus (OpenMW).
-- Runs in the GLOBAL context (called from global.lua): evaluates declarative
-- condition descriptors against an actor and toggles per-effect sub-spells on/off.
-- Descriptor format is identical to the MWSE side (plain data), so sets are portable.
--
-- Supported kinds (all read natively in the GLOBAL context on both engines):
--   health/magicka/fatigue (fraction), attribute, skill, level, encumbrance (fraction),
--   bounty, faction (rank 1-indexed / expelled), time, sun, location, region,
--   race, class, sex, birthsign, werewolf, stance (weapon/spell/none).
--   faction/bounty/birthsign are player-scoped.
--   weather/combat are external only (driven via SetBonus_setFlag) -- no global read in OpenMW.
-- NOTE: OpenMW's swimming / on-ground / sneaking reads are LOCAL-only, so they are
--   deliberately NOT exposed here (they'd break cross-engine parity); use a flag for those.
local core  = require('openmw.core')
local types = require('openmw.types')

local M = {}

local OPS = {
    ["<"] = function(a, b) return a < b end,
    ["<="] = function(a, b) return a <= b end,
    [">"] = function(a, b) return a > b end,
    [">="] = function(a, b) return a >= b end,
    ["=="] = function(a, b) return a == b end,
    ["~="] = function(a, b) return a ~= b end,
}

local function eqAny(value, target)
    if target == nil then return false end
    target = tostring(target):lower()
    if type(value) == "table" then
        for _, v in ipairs(value) do if tostring(v):lower() == target then return true end end
        return false
    end
    return tostring(value):lower() == target
end

local function dyn(actor, which)
    local ok, st = pcall(function() return types.Actor.stats.dynamic[which](actor) end)
    if ok and st then return st.current, st.base end
    return nil, nil
end
local function attrVal(actor, id)
    local ok, st = pcall(function() return types.Actor.stats.attributes[id](actor) end)
    if ok and st then return st.modified end
    return nil
end
local function skillVal(actor, id)
    local ok, st = pcall(function() return types.NPC.stats.skills[id](actor) end)
    if ok and st then return st.modified end
    return nil
end
local function hourOfDay()
    -- Read the authoritative in-world hour from the vanilla GameHour global. This
    -- runs in the global context (where condition eval happens); world is required
    -- lazily so this module stays loadable from player scripts (tooltip describe).
    local okw, world = pcall(require, 'openmw.world')
    if okw and world then
        local okg, h = pcall(function()
            return world.mwscript.getGlobalVariables(world.players[1]).gamehour
        end)
        if okg and type(h) == 'number' then return h % 24 end
        local okt, t = pcall(world.getGameTime)
        if okt and type(t) == 'number' then return (t / 3600) % 24 end
    end
    return 12
end
local function isExterior(actor)
    local c = actor.cell
    return c ~= nil and c.isExterior
end

-- External state flags, pushed in by other scripts via the SetBonus_setFlag event
-- (e.g. combat, current weather). flags[actorId][id] = value.
local flags = {}
local function evalOne(c, actor)
    local kind = c.kind
    if kind == "health" or kind == "magicka" or kind == "fatigue" then
        local cur, base = dyn(actor, kind)
        if cur == nil then return false end
        local v = c.fraction and ((base and base > 0) and (cur / base) or 0) or cur
        local op = OPS[c.op or "<"]
        return op ~= nil and op(v, c.value)
    elseif kind == "attribute" then
        local v = attrVal(actor, tostring(c.id):lower())
        local op = OPS[c.op or ">="]
        return v ~= nil and op ~= nil and op(v, c.value)
    elseif kind == "skill" then
        local v = skillVal(actor, tostring(c.id):lower())
        local op = OPS[c.op or ">="]
        return v ~= nil and op ~= nil and op(v, c.value)
    elseif kind == "level" then
        local ok, st = pcall(function() return types.Actor.stats.level(actor) end)
        local lv = ok and st and st.current
        local op = OPS[c.op or ">="]
        return lv ~= nil and op ~= nil and op(lv, c.value)
    elseif kind == "encumbrance" then
        local okc, cur = pcall(function() return types.Actor.getEncumbrance(actor) end)
        if not okc or cur == nil then return false end
        local v = cur
        if c.fraction then
            local okp, cap = pcall(function() return types.Actor.getCapacity(actor) end)
            v = (okp and cap and cap > 0) and (cur / cap) or 0
        end
        local op = OPS[c.op or "<"]
        return op ~= nil and op(v, c.value)
    elseif kind == "faction" then
        -- Player-scoped for parity with MWSE (which only exposes player standing).
        -- getFactionRank is 1-indexed, 0 if not a member; throws on unknown id.
        if not (types.Player.objectIsInstance(actor) and c.id) then return false end
        if c.expelled ~= nil then
            local ok, isExp = pcall(function() return types.NPC.isExpelled(actor, c.id) end)
            if not ok then return false end
            if (isExp == true) ~= (c.expelled ~= false) then return false end
        end
        if c.value ~= nil then
            local ok, rank = pcall(function() return types.NPC.getFactionRank(actor, c.id) end)
            if not ok or rank == nil then return false end
            local op = OPS[c.op or ">="]
            if not (op and op(rank, c.value)) then return false end
        end
        return (c.expelled ~= nil) or (c.value ~= nil)
    elseif kind == "bounty" then
        if not types.Player.objectIsInstance(actor) then return false end
        local ok, b = pcall(function() return types.Player.getCrimeLevel(actor) end)
        local op = OPS[c.op or ">="]
        return ok and b ~= nil and op ~= nil and op(b, c.value)
    elseif kind == "werewolf" then
        local ok, w = pcall(function() return types.NPC.isWerewolf(actor) end)
        local is = ok and w == true
        return is == (c.value ~= false)
    elseif kind == "sex" then
        local ok, rec = pcall(function() return types.NPC.record(actor) end)
        if not (ok and rec) then return false end
        return eqAny(c.value, rec.isMale and "male" or "female")
    elseif kind == "birthsign" then
        if not types.Player.objectIsInstance(actor) then return false end
        local ok, bs = pcall(function() return types.Player.getBirthSign(actor) end)
        return ok and bs ~= nil and eqAny(c.value, bs)
    elseif kind == "region" then
        local cel = actor.cell
        local reg = cel and cel.region
        if reg == nil then return false end
        -- Cell.region may be an id string or a record; accept either.
        local rid = (type(reg) == "table" and (reg.id or reg.name)) or reg
        return rid ~= nil and eqAny(c.value, rid)
    elseif kind == "stance" then
        local ok, st = pcall(function() return types.Actor.getStance(actor) end)
        if not ok then return false end
        local S = types.Actor.STANCE
        local s = (st == S.Weapon) and "weapon" or ((st == S.Spell) and "spell" or "none")
        return eqAny(c.value, s)
    elseif kind == "time" then
        local h = hourOfDay()
        return eqAny(c.value, (h >= 6 and h < 20) and "day" or "night")
    elseif kind == "sun" then
        local h = hourOfDay()
        local up = (h >= 6 and h < 20) and isExterior(actor)
        return eqAny(c.value, up and "up" or "down")
    elseif kind == "location" then
        return eqAny(c.value, isExterior(actor) and "exterior" or "interior")
    elseif kind == "race" then
        local ok, rec = pcall(function() return types.NPC.record(actor) end)
        return ok and rec and eqAny(c.value, rec.race)
    elseif kind == "class" then
        local ok, rec = pcall(function() return types.NPC.record(actor) end)
        return ok and rec and eqAny(c.value, rec.class)
    elseif kind == "flag" then
        -- Arbitrary external state pushed via SetBonus_setFlag.
        local f = flags[actor.id]
        local v = f and f[c.id]
        if c.value ~= nil then return eqAny(c.value, v) end
        return v == true
    elseif kind == "combat" then
        -- OpenMW has no global combat read; driven by an external "combat" flag.
        local f = flags[actor.id]
        local inC = (f and f.combat) == true
        return inC == (c.value ~= false)
    elseif kind == "weather" then
        -- OpenMW has no Lua weather read; driven by an external "weather" flag.
        local f = flags[actor.id]
        if f and f.weather ~= nil then return eqAny(c.value, f.weather) end
        return false
    end
    return false
end

local function evalCond(cond, actor)
    if cond == nil then return true end
    local ok, res = pcall(function()
        if cond.any then
            for _, c in ipairs(cond.any) do if evalCond(c, actor) then return true end end
            return false
        end
        if cond.all then
            for _, c in ipairs(cond.all) do if not evalCond(c, actor) then return false end end
            return true
        end
        if cond[1] ~= nil then
            for _, c in ipairs(cond) do if not evalCond(c, actor) then return false end end
            return true
        end
        return evalOne(cond, actor)
    end)
    return ok and res or false
end
M.evaluate = evalCond

function M.setFlag(actorId, id, value)
    if not actorId or id == nil then return end
    local f = flags[actorId]
    if not f then f = {}; flags[actorId] = f end
    f[id] = value
end

-- Short human-readable label (used by the tooltip integration).
local UNIT = { health = "HP", magicka = "MP", fatigue = "FP" }
local function describeOne(c)
    local k = c.kind
    if k == "health" or k == "magicka" or k == "fatigue" then
        local v = c.fraction and (math.floor(c.value * 100 + 0.5) .. "%") or tostring(c.value)
        return string.format("%s %s %s", UNIT[k], c.op or "<", v)
    elseif k == "attribute" or k == "skill" then
        return string.format("%s %s %s", c.id or k, c.op or ">=", tostring(c.value))
    elseif k == "level" then return "Level " .. (c.op or ">=") .. " " .. tostring(c.value)
    elseif k == "encumbrance" then
        local v = c.fraction and (math.floor(c.value * 100 + 0.5) .. "%") or tostring(c.value)
        return string.format("load %s %s", c.op or "<", v)
    elseif k == "faction" then
        local parts = {}
        if c.value ~= nil then parts[#parts + 1] = (c.id or "faction") .. " rank " .. (c.op or ">=") .. " " .. tostring(c.value) end
        if c.expelled ~= nil then parts[#parts + 1] = (c.expelled ~= false) and ("expelled: " .. (c.id or "faction")) or ("in good standing: " .. (c.id or "faction")) end
        return table.concat(parts, " & ")
    elseif k == "bounty" then return "bounty " .. (c.op or ">=") .. " " .. tostring(c.value)
    elseif k == "werewolf" then return (c.value ~= false) and "werewolf" or "not werewolf"
    elseif k == "sex" then return tostring(c.value)
    elseif k == "birthsign" then
        return "sign: " .. (type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value))
    elseif k == "region" then
        return type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value)
    elseif k == "stance" then return "stance: " .. tostring(c.value)
    elseif k == "time" or k == "location" then return tostring(c.value)
    elseif k == "sun" then return "sun " .. tostring(c.value)
    elseif k == "weather" or k == "race" or k == "class" then
        return type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value)
    elseif k == "combat" then return (c.value ~= false) and "in combat" or "out of combat" end
    return "?"
end
function M.describe(cond)
    if cond == nil then return "" end
    if cond.any then
        local t = {}; for _, c in ipairs(cond.any) do t[#t + 1] = M.describe(c) end
        return table.concat(t, " or ")
    end
    if cond.all or cond[1] ~= nil then
        local list = cond.all or cond
        local t = {}; for _, c in ipairs(list) do t[#t + 1] = M.describe(c) end
        return table.concat(t, " & ")
    end
    return describeOne(cond)
end

-- ---- per-actor toggling ------------------------------------------------------
-- state[actorId] = { [record.id] = record }  (currently-applied conditional spells)
local state = {}

function M.hasApplied(actorId)
    local a = state[actorId]
    return a ~= nil and next(a) ~= nil
end

-- desired = array of { record = <spell record>, condition = <descriptor> }.
-- Applies records whose condition holds; removes any previously-applied that no
-- longer should be on. Pass an empty desired to strip everything (feature off).
function M.reconcileActor(actor, desired)
    if not actor or not actor:isValid() then return end
    local aid = actor.id
    local applied = state[aid]
    if not applied then applied = {}; state[aid] = applied end
    local want = {}
    for _, entry in ipairs(desired or {}) do
        if entry.record and evalCond(entry.condition, actor) then
            want[entry.record.id] = entry.record
        end
    end
    local spells = types.Actor.spells(actor)
    for id, rec in pairs(applied) do
        if not want[id] then
            pcall(function() spells:remove(rec) end)
            applied[id] = nil
        end
    end
    for id, rec in pairs(want) do
        if not applied[id] then
            pcall(function() spells:add(rec) end)
            applied[id] = rec
        end
    end
end

function M.forget(actorId)
    state[actorId] = nil
    flags[actorId] = nil
end

return M
