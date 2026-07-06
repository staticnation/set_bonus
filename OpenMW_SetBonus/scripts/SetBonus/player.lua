-- Set Bonus -- player script: registers the settings page + toggles, and shows a
-- message when the player's set bonus tier changes.
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
        {
            key = 'tooltipDetail',
            renderer = 'select',
            name = 'Tooltip detail',
            description = 'How much of the set bonus to list on item tooltips. '
                .. 'compact (default): the active tier, or a greyed preview of the first '
                .. 'tier when the set is not active. '
                .. 'The set name turns green while its bonus is active. '
                .. 'full: every tier with thresholds. minimal: bare set names '
                .. '(green while active).',
            argument = { l10n = 'SetBonus', items = { 'compact', 'full', 'minimal' } },
            default = 'compact',
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
