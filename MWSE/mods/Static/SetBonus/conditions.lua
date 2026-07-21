-- conditions.lua -- optional conditional bonuses for Set Bonus (MWSE).
-- Effects that carry a declarative `condition` are built as per-effect sub-spells
-- (by the interop) and toggled on/off here as the actor's state changes, while the
-- actor is at a tier that has conditional effects. Gated by settings.conditionalBonuses.
--
-- Condition descriptor (data, so it's identical on OpenMW):
--   threshold : { kind="health"|"magicka"|"fatigue", op="<"|"<="|">"|">="|"=="|"~=", value=n, fraction=true }
--               { kind="attribute"|"skill", id="strength"|"longBlade", op=">=", value=n }
--               { kind="level", op=">=", value=n }
--               { kind="encumbrance", op="<"|">=", value=0.8, fraction=true }  -- fraction of capacity
--               { kind="bounty", op=">=", value=1000 }                        -- player crime level
--   standing  : { kind="faction", id="Telvanni", op=">=", value=6 }           -- rank (1-indexed, 0=not a member)
--               { kind="faction", id="Telvanni", expelled=true }              -- and/or expelled flag
--   identity  : { kind="race", value="Dark Elf" or {...} }  { kind="class", value="..." }
--               { kind="sex", value="male"|"female" }  { kind="birthsign", value="Warrior" or {...} }
--               { kind="werewolf", value=true }
--   state     : { kind="time", value="day"|"night" }  { kind="location", value="interior"|"exterior" }
--               { kind="sun", value="up"|"down" }  { kind="region", value="Sheogorad" or {...} }
--               { kind="stance", value="weapon"|"spell"|"none" }
--   external  : { kind="weather", value="rain" or {...} }  { kind="combat", value=true }  -- MWSE-only / flag-driven
--   combine   : an array is AND; { any = {...} } is OR; { all = {...} } is AND.
-- faction/bounty/birthsign are player-scoped (evaluate false for NPCs).
local config = require("Static.SetBonus.config")
local settings = require("Static.SetBonus.settings")
local log = require("Static.SetBonus.logger")

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

local function isExterior(ref)
    local cell = ref and ref.cell
    if not cell then return false end
    return (not cell.isInterior) or cell.behavesAsExterior
end

-- External state flags pushed via the Static:SetBonusFlag event. flags[ref][id]=value.
local flags = setmetatable({}, { __mode = "k" })

-- Evaluate one leaf condition against a reference. Wrapped by evalCond (never errors).
local function evalOne(c, ref)
    local kind = c.kind
    local mobile = ref.mobile
    if kind == "health" or kind == "magicka" or kind == "fatigue" then
        if not mobile then return false end
        local st = mobile[kind]
        if not st then return false end
        local v = c.fraction and ((st.base > 0) and (st.current / st.base) or 0) or st.current
        local op = OPS[c.op or "<"]
        return op ~= nil and op(v, c.value)
    elseif kind == "attribute" or kind == "skill" then
        if not (mobile and c.id) then return false end
        local st = mobile[c.id]
        if not st then return false end
        local op = OPS[c.op or ">="]
        return op ~= nil and op(st.current, c.value)
    elseif kind == "level" then
        local lv = ref.object and ref.object.level
        local op = OPS[c.op or ">="]
        return lv ~= nil and op ~= nil and op(lv, c.value)
    elseif kind == "encumbrance" then
        if not mobile then return false end
        local st = mobile.encumbrance
        if not st then return false end
        -- fraction = carried / capacity (current / base); absolute = carried weight.
        local v = c.fraction and ((st.base > 0) and (st.current / st.base) or 0) or st.current
        local op = OPS[c.op or "<"]
        return op ~= nil and op(v, c.value)
    elseif kind == "faction" then
        -- Player-scoped: MWSE exposes only the player's rank/standing per faction.
        -- Effective rank is 1-indexed (0 = not a member) to match OpenMW.
        if ref ~= tes3.player or not c.id then return false end
        local f = tes3.getFaction(c.id)
        if not f then return false end
        if c.expelled ~= nil then
            local isExp = f.playerExpelled == true
            if isExp ~= (c.expelled ~= false) then return false end
        end
        if c.value ~= nil then
            local rank = f.playerJoined and ((f.playerRank or 0) + 1) or 0
            local op = OPS[c.op or ">="]
            if not (op and op(rank, c.value)) then return false end
        end
        return (c.expelled ~= nil) or (c.value ~= nil)
    elseif kind == "bounty" then
        if ref ~= tes3.player then return false end
        local mp = tes3.mobilePlayer
        local b = mp and mp.bounty
        local op = OPS[c.op or ">="]
        return b ~= nil and op ~= nil and op(b, c.value)
    elseif kind == "werewolf" then
        local w = (mobile and mobile.werewolf) == true
        return w == (c.value ~= false)
    elseif kind == "sex" then
        local o = ref.object
        local female = o and o.female
        if female == nil then return false end
        return eqAny(c.value, female and "female" or "male")
    elseif kind == "birthsign" then
        -- Player-scoped; MWSE exposes the birthsign on the mobile player.
        if ref ~= tes3.player then return false end
        local mp = tes3.mobilePlayer
        local bs = mp and mp.birthsign
        return bs ~= nil and eqAny(c.value, bs.id)
    elseif kind == "region" then
        local cell = ref.cell
        local reg = cell and cell.region
        return reg ~= nil and eqAny(c.value, reg.id)
    elseif kind == "stance" then
        if not mobile then return false end
        local s = mobile.weaponDrawn and "weapon" or (mobile.spellReadied and "spell" or "none")
        return eqAny(c.value, s)
    elseif kind == "time" then
        local hour = tes3.worldController and tes3.worldController.hour and tes3.worldController.hour.value or 12
        local day = hour >= 6 and hour < 20
        return eqAny(c.value, day and "day" or "night")
    elseif kind == "location" then
        return eqAny(c.value, isExterior(ref) and "exterior" or "interior")
    elseif kind == "sun" then
        local hour = tes3.worldController and tes3.worldController.hour and tes3.worldController.hour.value or 12
        local up = (hour >= 6 and hour < 20) and isExterior(ref)
        return eqAny(c.value, up and "up" or "down")
    elseif kind == "weather" then
        local w = tes3.getCurrentWeather()
        if not w then return false end
        local names = type(c.value) == "table" and c.value or { c.value }
        for _, nm in ipairs(names) do
            local idx = tes3.weather[nm]
            if idx and idx == w.index then return true end
        end
        return false
    elseif kind == "race" then
        return ref.object and ref.object.race and eqAny(c.value, ref.object.race.id)
    elseif kind == "class" then
        return ref.object and ref.object.class and eqAny(c.value, ref.object.class.id)
    elseif kind == "combat" then
        local inC = mobile and mobile.inCombat or false
        return inC == (c.value ~= false)
    elseif kind == "flag" then
        local f = flags[ref]
        local v = f and f[c.id]
        if c.value ~= nil then return eqAny(c.value, v) end
        return v == true
    end
    return false
end

-- Evaluate a condition (leaf, AND-array, {all=}, or {any=}). Safe (never errors).
local function evalCond(cond, ref)
    if cond == nil then return true end
    local ok, res = pcall(function()
        if cond.any then
            for _, c in ipairs(cond.any) do if evalCond(c, ref) then return true end end
            return false
        end
        if cond.all then
            for _, c in ipairs(cond.all) do if not evalCond(c, ref) then return false end end
            return true
        end
        if cond[1] ~= nil then
            for _, c in ipairs(cond) do if not evalCond(c, ref) then return false end end
            return true
        end
        return evalOne(cond, ref)
    end)
    return ok and res or false
end
M.evaluate = evalCond

-- Short human-readable label for a condition (tooltip). Best-effort.
local UNIT = { health = "HP", magicka = "MP", fatigue = "FP" }
local function describeOne(c)
    local k = c.kind
    if k == "health" or k == "magicka" or k == "fatigue" then
        local v = c.fraction and (math.floor(c.value * 100 + 0.5) .. "%") or tostring(c.value)
        return string.format("%s %s %s", UNIT[k], c.op or "<", v)
    elseif k == "attribute" or k == "skill" then
        return string.format("%s %s %s", c.id or k, c.op or ">=", tostring(c.value))
    elseif k == "level" then
        return "Level " .. (c.op or ">=") .. " " .. tostring(c.value)
    elseif k == "encumbrance" then
        local v = c.fraction and (math.floor(c.value * 100 + 0.5) .. "%") or tostring(c.value)
        return string.format("load %s %s", c.op or "<", v)
    elseif k == "faction" then
        local parts = {}
        if c.value ~= nil then parts[#parts + 1] = (c.id or "faction") .. " rank " .. (c.op or ">=") .. " " .. tostring(c.value) end
        if c.expelled ~= nil then parts[#parts + 1] = (c.expelled ~= false) and ("expelled: " .. (c.id or "faction")) or ("in good standing: " .. (c.id or "faction")) end
        return table.concat(parts, " & ")
    elseif k == "bounty" then
        return "bounty " .. (c.op or ">=") .. " " .. tostring(c.value)
    elseif k == "werewolf" then
        return (c.value ~= false) and "werewolf" or "not werewolf"
    elseif k == "sex" then return tostring(c.value)
    elseif k == "birthsign" then
        return "sign: " .. (type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value))
    elseif k == "region" then
        return type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value)
    elseif k == "stance" then return "stance: " .. tostring(c.value)
    elseif k == "time" then return tostring(c.value)
    elseif k == "location" then return tostring(c.value)
    elseif k == "sun" then return "sun " .. tostring(c.value)
    elseif k == "weather" then
        local v = type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value)
        return v
    elseif k == "race" then return type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value)
    elseif k == "class" then return type(c.value) == "table" and table.concat(c.value, "/") or tostring(c.value)
    elseif k == "combat" then return (c.value ~= false) and "in combat" or "out of combat"
    end
    return "?"
end
function M.describe(cond)
    if cond == nil then return "" end
    if cond.any then
        local t = {}; for _, c in ipairs(cond.any) do t[#t + 1] = M.describe(c) end
        return table.concat(t, " or ")
    end
    if cond.all then
        local t = {}; for _, c in ipairs(cond.all) do t[#t + 1] = M.describe(c) end
        return table.concat(t, " & ")
    end
    if cond[1] ~= nil then
        local t = {}; for _, c in ipairs(cond) do t[#t + 1] = M.describe(c) end
        return table.concat(t, " & ")
    end
    return describeOne(cond)
end

-- ---- runtime toggling --------------------------------------------------------
local watch = setmetatable({}, { __mode = "k" })       -- watch[ref] = { [setName] = tier }
local appliedCond = setmetatable({}, { __mode = "k" }) -- appliedCond[ref] = { [subSpellId] = true }

local function setHasConditionals(set)
    if not set.conditionals then return false end
    for _, list in pairs(set.conditionals) do if #list > 0 then return true end end
    return false
end

-- Authoritative sweep (mirrors OpenMW's reconcileActor): work out which of this
-- set's sub-spells SHOULD be active right now, then remove every sub-spell the
-- set owns -- across ALL tiers -- that isn't in that list, and add the ones that
-- are. Because removal no longer depends on knowing which tier we just left, a
-- stale sub-spell can't survive a tier drop, a full unequip, or a missed event.
-- Pass tier = nil to strip the set entirely.
local function reconcile(ref, set, tier)
    if not (ref and ref.object) then return end
    if not set.conditionals then return end
    local applied = appliedCond[ref]

    local want = {}
    local conds = tier and set.conditionals[tier]
    if conds then
        for _, entry in ipairs(conds) do
            if evalCond(entry.condition, ref) then want[entry.spellId] = true end
        end
    end

    -- Drop anything this set owns that isn't wanted, whichever tier it came from.
    if applied then
        for _, list in pairs(set.conditionals) do
            for _, entry in ipairs(list) do
                if applied[entry.spellId] and not want[entry.spellId] then
                    tes3.removeSpell{ reference = ref, spell = entry.spellId }
                    applied[entry.spellId] = nil
                end
            end
        end
    end

    -- Add whatever is wanted but not yet on.
    if next(want) then
        if not applied then applied = {}; appliedCond[ref] = applied end
        for spellId in pairs(want) do
            if not applied[spellId] then
                tes3.addSpell{ reference = ref, spell = spellId }
                applied[spellId] = true
            end
        end
    end
end

-- Track tier changes; drop the old tier's sub-spells and evaluate the new tier.
event.register("Static:SetBonusChanged", function(e)
    if not settings.conditionalBonuses then return end
    local set = e.set
    if not setHasConditionals(set) then return end
    if e.reference ~= tes3.player and not settings.npcBonuses then return end
    local w = watch[e.reference]
    if not w then w = {}; watch[e.reference] = w end
    -- Keep watching even at "no tier" (store false, not nil) so the 1s tick keeps
    -- sweeping this set and can self-heal a leak if an event is ever missed.
    w[e.setName] = e.newTier or false
    reconcile(e.reference, set, e.newTier)
end)

-- Periodic re-evaluation for state that changes without an equip event (HP, time, ...).
local function tick()
    if not settings.conditionalBonuses then return end
    for ref, sets in pairs(watch) do
        if ref and ref.object and ref.mobile then
            for setName, tier in pairs(sets) do
                local set = config.sets[setName]
                -- tier may be false ("no tier") -- pass nil so reconcile strips it.
                if set then reconcile(ref, set, tier or nil) end
            end
        end
    end
end

-- Strip every applied sub-spell (used when the feature is toggled off).
local function stripAll()
    for ref, applied in pairs(appliedCond) do
        if ref and ref.object then
            for spellId in pairs(applied) do
                tes3.removeSpell{ reference = ref, spell = spellId }
            end
        end
        appliedCond[ref] = nil
    end
end

event.register("Static:RefreshConditions", function()
    if settings.conditionalBonuses then
        tick()
    else
        stripAll()
    end
end)

-- External state hook: any mod can push per-reference flags (combat, weather, custom)
-- that `flag` conditions read: event.trigger("Static:SetBonusFlag", { reference=, id=, value= }).
event.register("Static:SetBonusFlag", function(e)
    if not (e and e.reference and e.id) then return end
    local f = flags[e.reference]
    if not f then f = {}; flags[e.reference] = f end
    f[e.id] = e.value
    tick()
end)

local started = false
event.register(tes3.event.loaded, function()
    -- References are per-session; clear tracking and (re)start the eval timer.
    watch = setmetatable({}, { __mode = "k" })
    appliedCond = setmetatable({}, { __mode = "k" })
    if not started then
        started = true
        timer.start{ type = timer.simulate, duration = 1.0, iterations = -1, callback = tick }
    end
    log:debug("conditions: ready (conditional bonuses %s)", settings.conditionalBonuses and "on" or "off")
end)

return M
