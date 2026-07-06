-- Set Bonus -- local script on each actor (player, NPCs, creatures).
-- Watches for equipment changes and asks the global script to recompute
-- bonuses. Tuned for busy cells (community report: visible Lua cost in large
-- cities on 1.6):
--   * the player polls fast (0.5s) for snappy tier feedback; NPCs/creatures
--     change gear rarely, so they poll slowly (2s),
--   * each actor starts at a random phase so a city's actors don't all poll
--     on the same frame (the old synchronized spike),
--   * the slot list is cached and the signature buffer is reused, so a poll
--     allocates no garbage beyond the one signature string.
local self  = require('openmw.self')
local types = require('openmw.types')
local core  = require('openmw.core')

-- Cache the slot list once; pairs() over EQUIPMENT_SLOT on every poll is
-- wasted work, and an array scan is cheaper than a hash iteration.
local SLOTS = {}
for _, slot in pairs(types.Actor.EQUIPMENT_SLOT) do SLOTS[#SLOTS + 1] = slot end
local NSLOTS = #SLOTS

local POLL = types.Player.objectIsInstance(self.object) and 0.5 or 2.0
local timer = math.random() * POLL  -- random phase: stagger polls across actors
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

return {
    engineHandlers = {
        onActive = function()
            lastSig = signature()
            notify()
        end,
        onUpdate = function(dt)
            timer = timer + (dt or 0)
            if timer < POLL then return end
            timer = 0
            local sig = signature()
            if sig ~= lastSig then
                lastSig = sig
                notify()
            end
        end,
    },
}
