-- Load the current configuration
local configMCM = require("Static.SetBonus.configMCM")
-- Load the sets data
local config = require("Static.SetBonus.config")

local function registerModConfig()
    -- Create the template for the MCM
    local template = mwse.mcm.createTemplate({ name = "Set Bonus Mod" })
    -- Save the config changes when we close the MCM
    template:saveOnClose("Static.SetBonus.configMCM", configMCM)
    -- Create a page for the settings
    local settingsPage = template:createSideBarPage({ label = "Settings" })
    -- Create a button to enable/disable the mod
    settingsPage:createOnOffButton({
        label = "Enable Mod",
        description = "Enable or disable the Set Bonus Mod",
        variable = mwse.mcm.createTableVariable({ id = "enabled", table = configMCM })
    })
    -- Iterate over each set in the sets data
    for setName, set in pairs(config.sets) do
        -- Create a page for each set
        local setPage = template:createSideBarPage({ label = setName })
        -- Add a header for the items list
        setPage:createInfo({ text = "Items in the Set:" })
        -- Iterate over each item in the set
        for _, itemName in ipairs(set.items) do
            -- Create a label for each item
            setPage:createInfo({ text = "  " .. itemName })
        end
        -- Add some space before the bonuses
        setPage:createLabel({ text = "" })
        -- Display bonus spells
        setPage:createInfo({ text = "Bonuses:" })
        setPage:createInfo({ text = "  Min: " .. set.minBonus })
        setPage:createInfo({ text = "  Mid: " .. set.midBonus })
        setPage:createInfo({ text = "  Max: " .. set.maxBonus })
    end
    -- Register the MCM
    template:register()
end

-- Register the mod config menu (MCM)
event.register("modConfigReady", registerModConfig)