-- Example: register your own armour sets with the Set Bonus framework (OpenMW).
--
-- This is a GLOBAL script (spell creation happens in the framework's global
-- script, so registration is done from a global context too).
--
-- Two ways to register -- pick ONE:
--   A) Interface  -- I.SetBonus.registerSet{...} / I.SetBonus.registerSets{...}
--   B) Events     -- core.sendGlobalEvent('SetBonus_registerSet', {...})
--      Use events if your mod only has local/player scripts; the payload is the
--      exact same data table.
--
-- Effect entries use OpenMW ids (all lowercase):
--   { effect = "<magiceffectid>", mag = <number>, skill = "<skillid>",
--     attribute = "<attributeid>", dur = <0 or 1>, condition = <see below> }
--   * skill/attribute only for Fortify/Damage/Drain Skill|Attribute effects.
--   * dur = 1 for over-time effects (restorehealth/restoremagicka/restorefatigue);
--     leave it out (0) for constant effects (resists, fortify, reflect, ...).
--
-- Magnitudes are scaled by the player's benefit/weakness sliders automatically,
-- always rounded to whole numbers, and never scaled down to 0 for tick effects.
-- Registered sets also show up on Inventory Extender item tooltips (with their
-- condition labels) automatically -- the framework syncs your definitions to
-- the player's tooltip script; you don't need to do anything for that.

local core = require('openmw.core')
local I    = require('openmw.interfaces')

local registered = false

-- ---------------------------------------------------------------------------
-- Example set 1: always-on identity + CONDITIONAL effects (1.6+).
-- A condition is plain data: one descriptor, an array (AND), or { any = {...} }
-- (OR) / { all = {...} } (AND). Cross-engine kinds (identical on MWSE):
--   health/magicka/fatigue (op/value, fraction=true for 0-1 of max),
--   attribute/skill (id, op, value), level, time (day/night), sun (up/down),
--   location (interior/exterior), race, class.
-- PARITY TIP: if your mod ships for both engines, stick to those kinds.
-- `combat`/`weather`/`flag` need another script to push state on OpenMW
-- (SetBonus_setFlag) and read as false until someone does.
-- ---------------------------------------------------------------------------
local exampleDwarven = {
    name = 'Example Dwarven',
    items = {
        'ex_dwrv_helm', 'ex_dwrv_cuirass', 'ex_dwrv_greaves',
        'ex_dwrv_boots', 'ex_dwrv_left_pauldron', 'ex_dwrv_right_pauldron',
    },
    -- thresholds = { min = 2, mid = 4, max = 6 },  -- optional (these are the defaults)
    bonuses = {
        min = {
            { effect = 'resistshock', mag = 10 },
        },
        mid = {
            { effect = 'resistshock', mag = 15 },
            -- kicks in only while bloodied (below 50% health):
            { effect = 'reflect', mag = 8,
              condition = { kind = 'health', op = '<', value = 0.5, fraction = true } },
        },
        max = {
            { effect = 'resistshock',   mag = 20 },
            { effect = 'fortifyskill',  skill = 'armorer', mag = 12 },
            { effect = 'restorefatigue', mag = 2, dur = 1 },
            -- AND array: only in the deep halls, after dark:
            { effect = 'sanctuary', mag = 12,
              condition = { { kind = 'location', value = 'interior' },
                            { kind = 'time', value = 'night' } } },
        },
    },
}

-- ---------------------------------------------------------------------------
-- Example set 2: an OR condition and a level gate.
-- ---------------------------------------------------------------------------
local exampleScrapper = {
    name = 'Example Scrapper',
    items = { 'ex_scrap_helm', 'ex_scrap_cuirass', 'ex_scrap_boots', 'ex_scrap_shield' },
    bonuses = {
        min = { { effect = 'fortifyfatigue', mag = 12 } },
        max = {
            { effect = 'fortifyfatigue', mag = 28 },
            -- OR: desperation luck when nearly dead OR exhausted:
            { effect = 'fortifyattribute', attribute = 'luck', mag = 10,
              condition = { any = {
                  { kind = 'health',  op = '<', value = 0.25, fraction = true },
                  { kind = 'fatigue', op = '<', value = 0.5,  fraction = true },
              } } },
            -- level gate: the kit rewards a proven wearer:
            { effect = 'fortifyattack', mag = 8,
              condition = { kind = 'level', op = '>=', value = 20 } },
        },
    },
}

local function registerMySets()
    -- BATCH registration (interface v2+): one spell-build pass and a single
    -- actor recompute for the whole list. Prefer this when you register more
    -- than a couple of sets; fall back to per-set calls on v1.
    if I.SetBonus.version and I.SetBonus.version >= 2 then
        I.SetBonus.registerSets{ exampleDwarven, exampleScrapper }
    else
        I.SetBonus.registerSet(exampleDwarven)
        I.SetBonus.registerSet(exampleScrapper)
    end

    -- You can also fold your items onto an EXISTING set (e.g. a base-game set):
    --   I.SetBonus.addItems('Iron', { 'my_iron_helm', 'my_iron_cuirass' })
    -- or link a single item:
    --   I.SetBonus.registerSetLink{ item = 'my_iron_shield', set = 'Iron' }

    -- AMEND an existing set (additive): append items/effects, override a threshold.
    -- Keeps everything already defined; effects are capped at 8 per tier.
    --   I.SetBonus.amendSet('Iron', {
    --       items      = { 'my_extra_iron_piece' },
    --       bonuses    = { max = { { effect = 'fortifyattribute', attribute = 'endurance', mag = 5 } } },
    --       thresholds = { min = 3 },
    --   })

    -- REPLACE a set entirely (redefine it). Same name = overwrite.
    --   I.SetBonus.registerSet{ name = 'Iron', items = { ... }, bonuses = { ... } }

    -- DISABLE a set you don't want (empty definition):
    --   I.SetBonus.registerSet{ name = 'Iron', items = {}, bonuses = {} }

    -- Event equivalents (no interface needed), payloads match the interface args:
    --   core.sendGlobalEvent('SetBonus_registerSet',  { name = 'Example Dwarven', items = {...}, bonuses = {...} })
    --   core.sendGlobalEvent('SetBonus_registerSets', { sets = { {...}, {...} } })  -- batch (v2+)
    --   core.sendGlobalEvent('SetBonus_amendSet',     { name = 'Iron', patch = { bonuses = {...} } })
    --   core.sendGlobalEvent('SetBonus_addItems',     { name = 'Iron', items = { 'my_iron_helm' } })
end

return {
    engineHandlers = {
        onUpdate = function()
            if registered then return end
            -- Wait until the framework's interface is available (load-order safe).
            if not (I.SetBonus and I.SetBonus.registerSet) then return end
            registerMySets()
            registered = true
        end,
    },
}
