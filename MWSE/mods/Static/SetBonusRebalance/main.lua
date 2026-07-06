-- =========================================================================
--  Set Bonus -- Conditional Rebalance (optional submodule, MWSE)
--
--  Replaces the bonus effects of every registered Set Bonus set with an
--  alternative balance built around the 1.6 conditional-effects framework:
--  leaner always-on identity effects plus situational spikes (bloodied,
--  night, outdoors, in combat, ...) themed to each set's material, culture,
--  or faction. Item lists, thresholds, and spell IDs are untouched.
--
--  Fully optional: delete this folder (or don't install it) to keep the
--  default balance. Works with or without the TR/OAAB/NOD/AATL add-ons --
--  entries for sets that aren't registered are skipped.
--
--  Runs at low priority on 'initialized' so it applies AFTER the base sets
--  and every companion add-on (TR registers its sets on the same event).
-- =========================================================================

local interop = require("Static.SetBonus.interop")
local rebalance = require("Static.SetBonusRebalance.data")

local function apply()
    if not (interop and interop.version and interop.version >= 2) then
        mwse.log("[SetBonusRebalance] Set Bonus interop v2+ not found; rebalance not applied.")
        return
    end
    local applied, skipped = 0, 0
    for _, entry in ipairs(rebalance) do
        local set = interop.getSet(entry.name)
        if set and set.bonuses then
            -- Swap only the bonus definitions; items, thresholds, and the
            -- generated spell prefix stay exactly as registered.
            set.bonuses = entry.bonuses
            local ok, err = pcall(interop.buildSpellsForSet, set)
            if ok then
                applied = applied + 1
            else
                mwse.log("[SetBonusRebalance] failed to rebuild '%s': %s", entry.name, tostring(err))
            end
        else
            skipped = skipped + 1
        end
    end
    -- One refresh at the end (instead of one per set) so worn bonuses and
    -- conditional sub-spells update to the new definitions.
    event.trigger("Static:RescaleBonuses")
    event.trigger("Static:RefreshConditions")
    mwse.log("[SetBonusRebalance] rebalance applied to %d set(s); %d entr%s not present (add-on not installed?).",
        applied, skipped, skipped == 1 and "y" or "ies")
end

-- Priority -100: after the interop's own 'initialized' build pass and after
-- the TR/OAAB/NOD/AATL add-ons (default priority 0) have registered.
event.register(tes3.event.initialized, apply, { priority = -100 })
