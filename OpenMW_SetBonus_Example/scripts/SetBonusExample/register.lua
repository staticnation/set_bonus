-- Example: register your own armour set with the Set Bonus framework (OpenMW).
--
-- This is a GLOBAL script (spell creation happens in the framework's global
-- script, so registration is done from a global context too).
--
-- Two ways to register -- pick ONE:
--   A) Interface  -- call I.SetBonus.registerSet{...}  (shown below).
--   B) Events     -- core.sendGlobalEvent('SetBonus_registerSet', {...})
--      Use events if your mod only has local/player scripts; the payload is the
--      exact same data table.
--
-- Effect entries use OpenMW ids (all lowercase):
--   { effect = "<magiceffectid>", mag = <number>, skill = "<skillid>",
--     attribute = "<attributeid>", dur = <0 or 1> }
--   * skill/attribute only for Fortify/Damage/Drain Skill|Attribute effects.
--   * dur = 1 for over-time effects (restorehealth/restoremagicka/restorefatigue);
--     leave it out (0) for constant effects (resists, fortify, reflect, ...).
--
-- Magnitudes are scaled by the player's benefit/weakness sliders automatically,
-- always rounded to whole numbers, and never scaled down to 0 for tick effects.

local core = require('openmw.core')
local I    = require('openmw.interfaces')

local registered = false

local function registerMySets()
    I.SetBonus.registerSet{
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
                { effect = 'reflect',     mag = 5  },
            },
            max = {
                { effect = 'resistshock',   mag = 20 },
                { effect = 'reflect',       mag = 8  },
                { effect = 'fortifyskill',  skill = 'armorer', mag = 12 },
                { effect = 'restorefatigue', mag = 2, dur = 1 },
            },
        },
    }

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
    --   core.sendGlobalEvent('SetBonus_registerSet', { name = 'Example Dwarven', items = {...}, bonuses = {...} })
    --   core.sendGlobalEvent('SetBonus_amendSet',    { name = 'Iron', patch = { bonuses = {...} } })
    --   core.sendGlobalEvent('SetBonus_addItems',    { name = 'Iron', items = { 'my_iron_helm' } })
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
