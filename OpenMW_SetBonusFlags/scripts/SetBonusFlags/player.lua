-- Set Bonus -- OPTIONAL flag companion (OpenMW). Player local script.
--
-- Bridges locally-readable runtime state to Set Bonus's global flag hook
-- (the SetBonus_setFlag global event), so sets MAY use
--   { kind = "flag", id = "<name>", value = <expected> }
-- conditions that the core cross-engine framework can't ship.
--
-- IMPORTANT engine limits: OpenMW's Lua API exposes swimming and movement to a
-- LOCAL script, but does NOT expose weather or combat state at all. So this
-- companion provides only `swimming` and `moving`. `weather` and `combat` flags
-- must be fed by some other mod that can detect them, using the same public
-- event:  core.sendGlobalEvent('SetBonus_setFlag', { actor = <player>, id = 'combat', value = true })
-- Without this mod (and without such a provider) the corresponding flag
-- conditions simply never fire.

local self  = require('openmw.self')
local core  = require('openmw.core')
local types = require('openmw.types')

local INTERVAL = 0.3 -- seconds between polls
local acc = 0
local last = {}

local function push(id, value)
    if last[id] == value then return end -- only on change
    last[id] = value
    core.sendGlobalEvent('SetBonus_setFlag', { actor = self.object, id = id, value = value })
end

local function poll()
    local swimming = false
    local ok, r = pcall(function() return types.Actor.isSwimming(self) end)
    if ok then swimming = r == true end
    push('swimming', swimming)

    local moving = false
    local oks, sp = pcall(function() return types.Actor.getCurrentSpeed(self) end)
    if oks and type(sp) == 'number' then moving = sp > 1 end
    push('moving', moving)
end

return {
    engineHandlers = {
        onUpdate = function(dt)
            acc = acc + dt
            if acc < INTERVAL then return end
            acc = 0
            poll()
        end,
    },
}
