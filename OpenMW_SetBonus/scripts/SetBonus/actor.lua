-- Set Bonus -- local script on each actor (player, NPCs, creatures).
-- Watches for equipment changes and asks the global script to recompute bonuses.
local self  = require('openmw.self')
local types = require('openmw.types')
local core  = require('openmw.core')

local lastSig
local timer = 0
local POLL = 0.5  -- seconds between equipment checks

local function signature()
    local parts = {}
    for _, slot in pairs(types.Actor.EQUIPMENT_SLOT) do
        local obj = types.Actor.getEquipment(self.object, slot)
        parts[#parts + 1] = obj and obj.recordId or '-'
    end
    return table.concat(parts, ',')
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
            timer = timer + dt
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
