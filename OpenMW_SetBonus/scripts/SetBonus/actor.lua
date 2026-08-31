-- Set Bonus -- local script on each actor (player, NPCs, creatures).
-- Watches for equipment changes and asks the global script to recompute bonuses.
--
-- Polling is driven by a self-rescheduling async timer instead of an onUpdate
-- handler: the engine's timer list does the waiting, so nothing runs between
-- fires and there's no per-frame call. A generation counter guarantees exactly
-- one live poll chain per actor even across re-activation or save/load -- a
-- stale restored timer sees an old generation and stops.
--
-- Gear only really changes fast mid-combat, so when the Combat interface is
-- present we also refresh on being hit (event-driven, ~3s cooldown, free out of
-- combat). That lets NPCs poll slowly (30s) without feeling stale; without the
-- interface they fall back to a 2s poll. The player always polls fast (0.5s) for
-- snappy tier feedback. Interface detection is deferred to the first onActive so
-- it doesn't race the Combat provider's own local script at load.
local self  = require('openmw.self')
local types = require('openmw.types')
local core  = require('openmw.core')
local async = require('openmw.async')
local I     = require('openmw.interfaces')

-- Cache the slot list once; an array scan is cheaper than iterating the hash.
local SLOTS = {}
for _, slot in pairs(types.Actor.EQUIPMENT_SLOT) do SLOTS[#SLOTS + 1] = slot end
local NSLOTS = #SLOTS

local isPlayer = types.Player.objectIsInstance(self.object)

local lastSig
local parts = {}  -- reused between polls to avoid per-poll garbage
local function signature()
    for i = 1, NSLOTS do
        local obj = types.Actor.getEquipment(self.object, SLOTS[i])
        parts[i] = obj and obj.recordId or '-'
    end
    return table.concat(parts, ',', 1, NSLOTS)
end

local function notify()
    core.sendGlobalEvent('SetBonus_recompute', { actor = self.object })
end

local function refresh()
    local sig = signature()
    if sig ~= lastSig then
        lastSig = sig
        notify()
    end
end

-- ---- self-rescheduling poll (replaces the onUpdate poll) --------------------
local POLL = 2.0   -- finalised in initOnce() once the Combat interface is known
local gen = 0
local pollCb
pollCb = async:registerTimerCallback('SetBonus_actorPoll', function(myGen)
    if myGen ~= gen then return end                 -- superseded / stale restored timer
    refresh()
    async:newSimulationTimer(POLL, pollCb, myGen)    -- re-arm
end)

local function startPolling()
    gen = gen + 1                                    -- invalidate any prior chain
    async:newSimulationTimer(POLL, pollCb, gen)
end

-- ---- one-time init (deferred to first onActive: interfaces are ready then) --
local started = false
local function initOnce()
    if started then return end
    started = true
    local hitHook = I.Combat ~= nil and I.Combat.addOnHitHandler ~= nil
    -- On-hit refresh covers combat gear swaps, so NPCs can poll slowly with it on.
    POLL = isPlayer and 0.5 or (hitHook and 30.0 or 2.0)
    if hitHook then
        local hitArmed = true
        I.Combat.addOnHitHandler(function(_attack)
            if hitArmed then
                hitArmed = false                     -- ~3s cooldown per actor
                refresh()
                async:newUnsavableSimulationTimer(3, function() hitArmed = true end)
            end
            -- no return value: let other on-hit handlers run
        end)
    end
end

return {
    engineHandlers = {
        onActive = function()
            initOnce()
            lastSig = signature()
            notify()
            startPolling()
        end,
    },
}
