-- Set Bonus -- OPTIONAL flag companion (MWSE).
--
-- The core Set Bonus framework only ships conditions that read identically on
-- BOTH engines. Combat, weather, and movement can't (OpenMW 0.51 can't read them
-- in the global context), so they are deliberately kept out of the shipped set
-- data. This optional mod bridges that gap: it polls the player's runtime state
-- and pushes it to Set Bonus's external flag hook, so sets MAY use
--   { kind = "flag", id = "<name>", value = <expected> }
-- conditions. Without this mod installed, such flag conditions simply never fire
-- and nothing else is affected.
--
-- Flag vocabulary pushed for the player (matches the OpenMW companion where the
-- engine allows it):
--   combat   (bool)   -- the player is in combat
--   swimming (bool)   -- the player is in water
--   sneaking (bool)   -- the player is sneaking
--   moving   (bool)   -- the player is moving on foot
--   weather  (string) -- current weather region name, one of:
--                        clear cloudy foggy overcast rain thunder ash blight snow blizzard
--
-- Example set condition (author-defined sets only, NOT the shipped rebalance):
--   { kind = "flag", id = "weather", value = { "rain", "thunder" } }   -- when it storms
--   { kind = "flag", id = "swimming" }                                 -- while swimming
--   { all = { { kind = "flag", id = "combat" }, BLOODIED } }           -- hurt, in a fight

local INTERVAL = 0.3 -- seconds between polls

local WEATHER = {
    [0] = "clear", [1] = "cloudy", [2] = "foggy", [3] = "overcast", [4] = "rain",
    [5] = "thunder", [6] = "ash", [7] = "blight", [8] = "snow", [9] = "blizzard",
}

local last = {}

local function push(id, value)
    if last[id] == value then return end -- only on change (avoids re-eval spam)
    last[id] = value
    event.trigger("Static:SetBonusFlag", { reference = tes3.player, id = id, value = value })
end

local function isTrue(v) return v == true end

local function poll()
    local mp = tes3.mobilePlayer
    if not mp then return end
    push("combat", isTrue(mp.inCombat))
    push("sneaking", isTrue(mp.isSneaking))
    push("swimming", isTrue(mp.isSwimming)) -- nil-safe if the field is absent
    push("moving", isTrue(mp.isMovingForward) or isTrue(mp.isMovingBack)
        or isTrue(mp.isMovingLeft) or isTrue(mp.isMovingRight))
    local w = tes3.getCurrentWeather()
    push("weather", (w and WEATHER[w.index]) or "clear")
end

event.register(tes3.event.loaded, function()
    last = {}
    timer.start{ type = timer.simulate, duration = INTERVAL, iterations = -1, callback = poll }
end)
