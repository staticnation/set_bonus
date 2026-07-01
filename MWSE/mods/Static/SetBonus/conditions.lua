-- conditions.lua -- optional conditional bonuses for Set Bonus (MWSE).
-- Effects that carry a declarative `condition` are built as per-effect sub-spells
-- (by the interop) and toggled on/off here as the actor's state changes, while the
-- actor is at a tier that has conditional effects. Gated by settings.conditionalBonuses.
--
-- Condition descriptor (data, so it's identical on OpenMW):
--   threshold : { kind="health"|"magicka"|"fatigue", op="<"|"<="|">"|">="|"=="|"~=", value=n, fraction=true }
--               { kind="attribute"|"skill", id="strength"|"longBlade", op=">=", value=n }
--               { kind="level", op=">=", value=n }
--   state     : { kind="time", value="day"|"night" }  { kind="location", value="interior"|"exterior" }
--               { kind="weather", value="rain" or {"rain","thunder"} }  { kind="sun", value="up"|"down" }
--               { kind="race", value="Dark Elf" or {...} }  { kind="class", value="..." }  { kind="combat", value=true }
--   combine   : an array is AND; { any = {...} } is OR; { all = {...} } is AND.
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

local function removeTierSubs(ref, set, tier)
    local conds = set.conditionals and set.conditionals[tier]
    if not conds then return end
    local applied = appliedCond[ref]
    if not applied then return end
    for _, entry in ipairs(conds) do
        if applied[entry.spellId] then
            tes3.removeSpell{ reference = ref, spell = entry.spellId }
            applied[entry.spellId] = nil
        end
    end
end

local function reconcile(ref, set, tier)
    if not tier then return end
    local conds = set.conditionals and set.conditionals[tier]
    if not conds or #conds == 0 then return end
    if not ref.object then return end
    local applied = appliedCond[ref]
    if not applied then applied = {}; appliedCond[ref] = applied end
    for _, entry in ipairs(conds) do
        local met = evalCond(entry.condition, ref)
        local has = applied[entry.spellId] == true
        if met and not has then
            tes3.addSpell{ reference = ref, spell = entry.spellId }
            applied[entry.spellId] = true
        elseif not met and has then
            tes3.removeSpell{ reference = ref, spell = entry.spellId }
            applied[entry.spellId] = nil
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
    if e.oldTier and e.oldTier ~= e.newTier then removeTierSubs(e.reference, set, e.oldTier) end
    w[e.setName] = e.newTier
    reconcile(e.reference, set, e.newTier)
end)

-- Periodic re-evaluation for state that changes without an equip event (HP, time, ...).
local function tick()
    if not settings.conditionalBonuses then return end
    for ref, sets in pairs(watch) do
        if ref and ref.object and ref.mobile then
            for setName, tier in pairs(sets) do
                local set = config.sets[setName]
                if set and tier then reconcile(ref, set, tier) end
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
