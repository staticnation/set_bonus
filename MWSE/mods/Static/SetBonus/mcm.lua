-- mcm.lua -- Mod Config Menu for Static Set Bonus.
local log = require("Static.logger")
local settings = require("Static.SetBonus.settings")
local configPath = "Set Bonus"

local LOG_LEVELS = { "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "NONE" }

local function registerModConfig()
    local template = mwse.mcm.createTemplate({ name = "Set Bonus", config = settings })
    template:register()
    template:saveOnClose(configPath, settings)

    local page = template:createSideBarPage({ label = "Settings" })
    page.sidebar:createInfo{
        text = "Static Set Bonus\n\n" ..
            "Wearing several pieces of the same armour set grants a scaling, constant-effect " ..
            "bonus (by default at 2, 4 and 6+ pieces).",
    }

    local general = page:createCategory("General")

    general:createOnOffButton{
        label = "Tier-change notifications",
        description = "Show a message when your set bonus tier changes as you equip or remove pieces.",
        configKey = "notifications",
    }

    general:createOnOffButton{
        label = "Apply bonuses to NPCs",
        description = "When on, NPCs wearing full sets also gain set bonuses. " ..
            "Turn off to make set bonuses player-only.",
        configKey = "npcBonuses",
        callback = function(self)
            event.trigger("Static:RefreshNpcBonuses")
        end,
    }

    general:createSlider{
        label = "Benefit magnitude scale (%)",
        description = "Scales the helpful set-bonus effects. 100% = default, " ..
            "50% = half strength, 200% = double. Magnitudes are always whole numbers " ..
            "(rounded), and effects never drop to 0. Applies live to the player; NPCs " ..
            "update on their next equipment change or on reload.",
        min = 25,
        max = 300,
        step = 5,
        jump = 25,
        configKey = "scalePct",
        callback = function(self)
            event.trigger("Static:RescaleBonuses")
        end,
    }

    general:createSlider{
        label = "Weakness (drawback) scale (%)",
        description = "Scales the thematic Weakness drawbacks independently of the " ..
            "benefits. 100% = default, 50% = milder, 200% = harsher, 0% = no drawbacks " ..
            "at all. Applies live to the player; NPCs update on their next equipment " ..
            "change or on reload.",
        min = 0,
        max = 300,
        step = 5,
        jump = 25,
        configKey = "weaknessPct",
        callback = function(self)
            event.trigger("Static:RescaleBonuses")
        end,
    }

    local logOptions = {}
    for _, level in ipairs(LOG_LEVELS) do
        logOptions[#logOptions + 1] = { label = level, value = level }
    end
    general:createDropdown{
        label = "Log level",
        description = "Verbosity of this mod's log output. Leave at ERROR unless troubleshooting.",
        options = logOptions,
        configKey = "logLevel",
        callback = function(self)
            log:setLogLevel(self.variable.value)
        end,
    }
end

event.register(tes3.event.modConfigReady, registerModConfig)
