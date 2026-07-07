-- settings.lua -- user-facing saved configuration, edited through the MCM and
-- persisted to: Data Files/MWSE/config/Set Bonus.json
-- main.lua and mcm.lua share this exact table, so MCM changes apply live.
local defaults = {
    notifications = true,       -- show a message when the player's set bonus tier changes
    npcBonuses = true,          -- also apply set bonuses to NPCs (not just the player)
    matchByIcon = true,         -- also match items by inventory icon+mesh (enchanted/copied pieces)
    showTooltip = true,         -- show set-bonus info on armour/clothing/weapon tooltips
    tooltipDetail = "compact",  -- tooltip verbosity: "full" (all tiers), "compact" (active tier + next), "minimal" (name + progress)
    conditionalBonuses = true,  -- enable condition-gated bonus effects (off = such effects not applied)
    logLevel = "ERROR",         -- log verbosity (TRACE/DEBUG/INFO/WARN/ERROR/NONE)
    scalePct = 100,             -- benefit magnitude multiplier, in percent
    weaknessPct = 100,          -- Weakness/drawback magnitude multiplier, in percent (0 = drawbacks off)
}
return mwse.loadConfig("Set Bonus", defaults)
