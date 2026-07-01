-- Set Bonus -- player script: registers the settings page + notification toggle,
-- and shows a message when the player's set bonus tier changes.
local storage = require('openmw.storage')
local ui      = require('openmw.ui')
local I       = require('openmw.interfaces')

I.Settings.registerPage{
    key = 'SetBonus',
    l10n = 'SetBonus',
    name = 'Set Bonus',
    description = 'Armour set bonuses: wearing several pieces of a set grants a scaling, constant bonus.',
}

I.Settings.registerGroup{
    key = 'SettingsPlayerSetBonus',
    page = 'SetBonus',
    l10n = 'SetBonus',
    name = 'Notifications',
    description = 'Player-specific Set Bonus options.',
    permanentStorage = true,
    settings = {
        {
            key = 'notifications',
            renderer = 'checkbox',
            name = 'Tier-change notifications',
            description = 'Show a message when your set bonus tier changes as you equip or remove pieces.',
            default = true,
        },
        {
            key = 'tooltip',
            renderer = 'checkbox',
            name = 'Set info on item tooltips',
            description = 'Show set-bonus info on item tooltips. Requires the Inventory Extender mod (which provides the tooltip hook); has no effect without it.',
            default = true,
        },
    },
}

local cfg = storage.playerSection('SettingsPlayerSetBonus')

return {
    eventHandlers = {
        SetBonus_notify = function(e)
            if cfg:get('notifications') then
                if e.tier then
                    ui.showMessage(e.name .. ' set bonus active (' .. e.tier .. ').')
                else
                    ui.showMessage(e.name .. ' set bonus lost.')
                end
            end
        end,
    },
}
