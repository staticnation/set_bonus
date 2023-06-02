-- Load the current configuration
local configMCM = require("Static.SetBonus.configMCM")
-- Load the sets data
local config = require("Static.SetBonus.config")

local function displaySpellEffects(setPage, spellId)
    -- Fetch the spell
    local spell = tes3.dataHandler.nonDynamicData.spells[spellId]
    if spell then
        mwse.log("[Set Bonus Mod] Found spell with ID: %s", spellId)
        -- Iterate over the spell's effects
        for _, effect in ipairs(spell.effects) do
            -- Fetch effect's name from the game's data
            local effectName = tes3.getMagicEffect(effect.id).name
            -- Add a label for each effect
            setPage:createInfo({ text = string.format("Effect ID: %s, Effect Name: %s", effect.id, effectName) })
            mwse.log("[Set Bonus Mod] Effect ID: %s, Effect Name: %s", effect.id, effectName)
        end
    else
        mwse.log("[Set Bonus Mod] Could not find spell with ID: %s", spellId)
    end
end

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
        -- Iterate over each item in the set
        for _, itemName in ipairs(set.items) do
            -- Create a label for each item
            setPage:createInfo({ text = itemName })
        end
        -- Display bonus spells
        displaySpellEffects(setPage, set.minBonus)
        displaySpellEffects(setPage, set.midBonus)
        displaySpellEffects(setPage, set.maxBonus)
    end
    -- Register the MCM
    template:register()
end

-- Register the mod config menu (MCM)
event.register("modConfigReady", registerModConfig)