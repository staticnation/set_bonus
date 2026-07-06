-- =========================================================================
--  Set Bonus -- Conditional Rebalance (optional submodule, OpenMW global).
--
--  Replaces the bonus effects of every registered Set Bonus set with an
--  alternative balance built around the 1.6 conditional-effects framework:
--  leaner always-on identity effects plus situational spikes (bloodied,
--  night, outdoors, ...) themed to each set's material, culture, or
--  faction. Item lists, thresholds, and spell names are untouched, and all
--  conditions used evaluate natively on both engines (no combat/weather).
--
--  Fully optional: disable this content file to keep the default balance.
--  Entries for sets that aren't registered (e.g. TR sets without the TR
--  data) are skipped.
--
--  The framework indexes its sets during its own first update, so we retry
--  each frame until I.SetBonus can resolve a base set, then apply once.
-- =========================================================================

local I = require('openmw.interfaces')
local rebalance = require('scripts.SetBonusRebalance.data')

local done = false

local function apply()
    if not I.SetBonus then
        print('[SetBonusRebalance] Set Bonus (setbonus.omwscripts) is not enabled; rebalance not applied.')
        return true -- give up; the framework interface will never appear
    end
    if not I.SetBonus.getSet('Iron') then
        return false -- framework not initialised yet; try again next frame
    end
    local batch, skipped = {}, 0
    for _, entry in ipairs(rebalance) do
        local set = I.SetBonus.getSet(entry.name)
        if set then
            -- Swap only the bonus definitions; re-registering the same table
            -- keeps items/thresholds and rebuilds that set's spells in place.
            set.bonuses = entry.bonuses
            batch[#batch + 1] = set
        else
            skipped = skipped + 1
        end
    end
    if I.SetBonus.registerSets then
        -- Framework v2+: one batch = one spell-build pass + one actor recompute.
        I.SetBonus.registerSets(batch)
    else
        for _, set in ipairs(batch) do I.SetBonus.registerSet(set) end
    end
    print(('[SetBonusRebalance] rebalance applied to %d set(s); %d entr%s not present (add-on not installed?).')
        :format(#batch, skipped, skipped == 1 and 'y' or 'ies'))
    return true
end

return {
    engineHandlers = {
        onUpdate = function()
            if not done then done = apply() end
        end,
    },
}
