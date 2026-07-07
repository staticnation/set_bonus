-- =========================================================================
--  Set Bonus -- Tamriel Rebuilt add-on
--  Optional companion to the Static Set Bonus framework. Holds all Tamriel
--  Rebuilt content; the base mod stays base-game only. Registers only when the
--  relevant TR assets are present, so it is safe with or without TR installed.
-- =========================================================================

local setBonus = require("Static.SetBonus.interop")
local log = require("Static.SetBonus.logger")

local function present(id) return tes3.getObject(id) ~= nil end
local function anyPresent(ids)
    for _, id in ipairs(ids) do
        if tes3.getObject(id) ~= nil then return true end
    end
    return false
end
-- Gate for the RedWatch-chitin family (Dunmer / House Redoran / Watchman):
-- checks several ids because single gate items have been renamed between
-- Tamriel_Data releases before (T_A_DeChitinHelmOpen01_Hrpen went missing).
local REDWATCH_GATE = {
    "T_A_DeChitinHelmOpen01_Hrpen", "T_De_Chitin_HelmOpen_01",
    "T_De_Chitin_PauldrL_01", "T_De_RedWatchChitin_Boots_01",
    "T_De_RedWatchChitin_Cuirass_01", "T_De_Bonemold_Chuzei_Boots",
    "T_De_AlmaRula_Helm_UNI",
}

local function registerTRSets()
    if not (setBonus and setBonus.version and setBonus.version >= 2) then
        log:warn("SetBonusTR: Set Bonus interop v2+ not found; skipping TR sets.")
        return
    end
    log:debug("SetBonusTR: Tamriel_Data.esm active = %s", tostring(tes3.isModActive("Tamriel_Data.esm")))

    -- === New TR sets ===
    if present("T_Rea_Wormmouth_Cuirass_01") then
        setBonus.registerSet{
            name = "Reach",
            displayName = "Reach",
            items = {
                "T_Rea_Leather_Hat_01", "T_Rea_Leather_Hat_Witchery", "T_Rea_UNI_FeatherCrown",
                "T_Rea_Wormmouth_Helm_01", "T_Rea_Wormmouth_Helm_Poison", "T_Rea_Wormmouth_Cuirass_01",
                "T_Rea_Wormmouth_PauldronL_01", "T_Rea_Wormmouth_PauldronR_01", "T_Rea_Wormmouth_BracerL_01",
                "T_Rea_Wormmouth_BracerR_01", "T_Rea_Wormmouth_Greaves_01", "T_Rea_Wormmouth_Boots_01",
            },
            bonuses = {
                min = {
                    { effect = "resistFrost", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 },
                },
                mid = {
                    { effect = "resistFrost", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                    { effect = "fortifyAttack", magnitude = 5 },
                },
                max = {
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "spellAbsorption", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Mao_Scale_Boots_01") then
        setBonus.registerSet{
            name = "Maormer",
            displayName = "Maormer Sea Scale",
            items = {
                "T_Mao_Scale_Boots_01", "T_Mao_Scale_Bracer_L_01", "T_Mao_Scale_Bracer_R_01",
                "T_Mao_Scale_Cuirass_01", "T_Mao_Scale_Greaves_01", "T_Mao_Scale_Helm_01",
                "T_Mao_Scale_Pauld_L_01", "T_Mao_Scale_Pauld_R_01",
            },
            bonuses = {
                min = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 20 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 30 },
                    { effect = "resistShock", magnitude = 15 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 40 },
                    { effect = "resistShock", magnitude = 20 },
                    { effect = "chameleon", magnitude = 10 },
                },
            },
        }
    end
    if present("T_Nor_Ancient_Boots_01") then
        setBonus.registerSet{
            name = "Ancient Nordic",
            displayName = "Ancient Nordic",
            items = {
                "T_Nor_Ancient_Boots_01", "T_Nor_Ancient_BracerL_01", "T_Nor_Ancient_BracerR_01",
                "T_Nor_Ancient_Cuirass_01", "T_Nor_Ancient_Greaves_01", "T_Nor_Ancient_Helm_01",
                "T_Nor_Ancient_Helm_02", "T_Nor_Ancient_Helm_03", "T_Nor_Ancient_PauldronL_01",
                "T_Nor_Ancient_PauldronL_02", "T_Nor_Ancient_PauldronR_01", "T_Nor_Ancient_PauldronR_02",
                "T_Nor_Ancient_Shield", "T_Nor_Ancient_Shield_01",
            },
            bonuses = {
                min = {
                    { effect = "resistFrost", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 8 },
                },
                mid = {
                    { effect = "resistFrost", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                },
                max = {
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "turnUndead", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_Mananaut_Boots_01") then
        setBonus.registerSet{
            name = "Mananaut",
            displayName = "Mananaut Diving Suit",
            thresholds = { min = 2, mid = 3, max = 5 },
            items = {
                "T_Imp_Mananaut_Boots_01", "T_Imp_Mananaut_Cuirass_01", "T_Imp_Mananaut_GauntL_01",
                "T_Imp_Mananaut_GauntR_01", "T_Imp_Mananaut_Helm_01", "T_Imp_Mananaut_Helm_02",
            },
            bonuses = {
                min = {
                    { effect = "resistShock", magnitude = 10 },
                    { effect = "waterBreathing", magnitude = 1 },
                },
                mid = {
                    { effect = "resistShock", magnitude = 15 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
                },
                max = {
                    { effect = "resistShock", magnitude = 20 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
                    { effect = "reflect", magnitude = 8 },
                },
            },
        }
    end
    if present("T_De_KagoutiHide_Boots_01") then
        setBonus.registerSet{
            name = "Kagouti Hide",
            displayName = "Kagouti Hide",
            items = {
                "T_De_KagoutiHide_Boots_01", "T_De_KagoutiHide_BracerL_01", "T_De_KagoutiHide_BracerR_01",
                "T_De_KagoutiHide_Cuirass_01", "T_De_KagoutiHide_Cuirass_Hunter", "T_De_KagoutiHide_Greaves_01",
                "T_De_KagoutiHide_HelmOpen_01", "T_De_KagoutiHide_Helm_01", "T_De_KagoutiHide_Helm_Hunter",
                "T_De_KagoutiHide_PauldronL_01", "T_De_KagoutiHide_PauldronR_01", "T_De_KagoutiHide_Shield_01",
                "T_De_KagoutiHide_Shield_02", "T_De_KagoutiHide_Shield_Sanct", "T_De_KagoutiHide_TShield_Tusks",
                "T_De_KagoutiHide_TowerShield_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 3 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 8 },
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_NarsisWatch_Boots_01") then
        setBonus.registerSet{
            name = "Narsis Watch",
            displayName = "Narsis Watch",
            items = {
                "T_De_NarsisWatch_Boots_01", "T_De_NarsisWatch_Cuirass_01", "T_De_NarsisWatch_GauntletL_01",
                "T_De_NarsisWatch_GauntletR_01", "T_De_NarsisWatch_Greaves01", "T_De_NarsisWatch_Helm_01",
                "T_De_NarsisWatch_PauldronL_01", "T_De_NarsisWatch_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistNormalWeapons", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
                },
            },
        }
    end
    if present("T_De_Guarskin_Boots_01") then
        setBonus.registerSet{
            name = "Guar Hide",
            displayName = "Guar Hide",
            items = {
                "T_De_Guarskin_Boots_01", "T_De_Guarskin_BracerL_01", "T_De_Guarskin_BracerL_Spear",
                "T_De_Guarskin_BracerR_01", "T_De_Guarskin_BracerR_Spear", "T_De_Guarskin_Cuirass_01",
                "T_De_Guarskin_Greaves_01", "T_De_Guarskin_Helm_01", "T_De_Guarskin_Helm_02",
                "T_De_Guarskin_Helm_03", "T_De_Guarskin_Helm_Feather", "T_De_Guarskin_PauldronL_01",
                "T_De_Guarskin_PauldronR_01", "T_De_Guarskin_Shield_01", "T_De_Guarskin_Shield_DamFatigue",
            },
            bonuses = {
                min = {
                    { effect = "fortifyFatigue", magnitude = 12 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Nor_Toadscale_Boots_01") then
        setBonus.registerSet{
            name = "Toadscale",
            displayName = "Toadscale",
            items = {
                "T_Nor_Toadscale_Boots_01", "T_Nor_Toadscale_Boots_02", "T_Nor_Toadscale_Cuirass_01",
                "T_Nor_Toadscale_Cuirass_02", "T_Nor_Toadscale_GauntletL_01", "T_Nor_Toadscale_GauntletL_02",
                "T_Nor_Toadscale_GauntletR_01", "T_Nor_Toadscale_GauntletR_02", "T_Nor_Toadscale_Greaves_01",
                "T_Nor_Toadscale_Greaves_02", "T_Nor_Toadscale_Helm_01", "T_Nor_Toadscale_Helm_02",
                "T_Nor_Toadscale_Helm_03", "T_Nor_Toadscale_Helm_04", "T_Nor_Toadscale_PauldL_01",
                "T_Nor_Toadscale_PauldL_02", "T_Nor_Toadscale_PauldR_01", "T_Nor_Toadscale_PauldR_02",
                "T_Nor_Toadscale_Shield_01", "T_Nor_Toadscale_Shield_02",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                    { effect = "resistFrost", magnitude = 10 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistFrost", magnitude = 15 },
                    { effect = "resistCommonDisease", magnitude = 15 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "resistCommonDisease", magnitude = 20 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_AlitHide_Boots_01") then
        setBonus.registerSet{
            name = "Alit Hide",
            displayName = "Alit Hide",
            items = {
                "T_De_AlitHide_Boots_01", "T_De_AlitHide_BracerL_01", "T_De_AlitHide_BracerL_Poison",
                "T_De_AlitHide_BracerR_01", "T_De_AlitHide_BracerR_Poison", "T_De_AlitHide_Cuirass_01",
                "T_De_AlitHide_Greaves_01", "T_De_AlitHide_HelmOpen_01", "T_De_AlitHide_Helm_01",
                "T_De_AlitHide_PauldronL_01", "T_De_AlitHide_PauldronR_01", "T_De_AlitHide_Shield_01",
                "T_De_AlitHide_Shield_Fatigue", "T_De_AlitHide_TowerShield_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
                    { effect = "resistPoison", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_We_Wenbone_Boots_01") then
        setBonus.registerSet{
            name = "Wenbone",
            displayName = "Wenbone",
            items = {
                "T_We_Wenbone_Boots_01", "T_We_Wenbone_BracerL_01", "T_We_Wenbone_BracerR_01",
                "T_We_Wenbone_Cuirass_01", "T_We_Wenbone_Greaves_01", "T_We_Wenbone_Helm_01",
                "T_We_Wenbone_PauldronL_01", "T_We_Wenbone_PauldronR_01", "T_We_Wenbone_ShieldTow_01",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                    { effect = "fortifySkill", skill = "marksman", magnitude = 5 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifySkill", skill = "marksman", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifySkill", skill = "marksman", magnitude = 12 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "fortifySkill", skill = "sneak", magnitude = 12 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Dwe_Rourken_Boots_01") then
        setBonus.registerSet{
            name = "Rourken",
            displayName = "Rourken Dwemer",
            items = {
                "T_Dwe_Rourken_Boots_01", "T_Dwe_Rourken_Bracer_L_01", "T_Dwe_Rourken_Bracer_R_01",
                "T_Dwe_Rourken_Cuirass_01", "T_Dwe_Rourken_Greaves_01", "T_Dwe_Rourken_Helm_01",
                "T_Dwe_Rourken_Pauld_L_01", "T_Dwe_Rourken_Pauld_R_01",
            },
            bonuses = {
                min = {
                    { effect = "resistShock", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 8 },
                },
                mid = {
                    { effect = "resistShock", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                },
                max = {
                    { effect = "resistShock", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "reflect", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Imp_Ebonweave_Boots_01") then
        setBonus.registerSet{
            name = "Ebonweave",
            displayName = "Ebonweave",
            items = {
                "T_Imp_Ebonweave_Boots_01", "T_Imp_Ebonweave_BracerL_01", "T_Imp_Ebonweave_BracerR_01",
                "T_Imp_Ebonweave_Cuirass_01", "T_Imp_Ebonweave_Greaves_01", "T_Imp_Ebonweave_Helm_01",
                "T_Imp_Ebonweave_Helm_02", "T_Imp_Ebonweave_PauldronL_01", "T_Imp_Ebonweave_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "fortifyFatigue", magnitude = 12 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "resistMagicka", magnitude = 8 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "spellAbsorption", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Imp_AlessianBrnz_Boots_01") then
        setBonus.registerSet{
            name = "Alessian Bronze",
            displayName = "Alessian Bronze",
            items = {
                "T_Imp_AlessianBrnz_Boots_01", "T_Imp_AlessianBrnz_Cuirass_01", "T_Imp_AlessianBrnz_GauntletL_01",
                "T_Imp_AlessianBrnz_GauntletR_01", "T_Imp_AlessianBrnz_Helm_01", "T_Imp_AlessianBrnz_PauldronL_01",
                "T_Imp_AlessianBrnz_PauldronR_01", "T_Imp_AlessianBrnz_TShield_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistMagicka", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "weaknesstoShock", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "turnUndead", magnitude = 20 },
                    { effect = "weaknesstoShock", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_GlassGilded_Boots_01") then
        setBonus.registerSet{
            name = "Gilded Glass",
            displayName = "Gilded Glass",
            items = {
                "T_De_GlassGilded_Boots_01", "T_De_GlassGilded_BracerL_01", "T_De_GlassGilded_BracerR_01",
                "T_De_GlassGilded_Cuirass_01", "T_De_GlassGilded_Greaves_01", "T_De_GlassGilded_Helm_01",
                "T_De_GlassGilded_PauldronL_01", "T_De_GlassGilded_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "sanctuary", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_RiverWatch_Boots_01") then
        setBonus.registerSet{
            name = "Riverwatch",
            displayName = "Ouada-An Riverwatch",
            items = {
                "T_De_RiverWatch_Boots_01", "T_De_RiverWatch_Boots_WaterWalk", "T_De_RiverWatch_Cuirass_01",
                "T_De_RiverWatch_GauntL_01", "T_De_RiverWatch_GauntR_01", "T_De_RiverWatch_Greaves_01",
                "T_De_RiverWatch_Helm_01", "T_De_RiverWatch_PauldronL_01", "T_De_RiverWatch_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "waterWalking", magnitude = 1 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "waterWalking", magnitude = 1 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "waterWalking", magnitude = 1 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Dae_Gold_Boots_01") then
        setBonus.registerSet{
            name = "Golden Saint",
            displayName = "Golden Saint",
            items = {
                "T_Dae_Gold_Boots_01", "T_Dae_Gold_Cuirass_01", "T_Dae_Gold_GauntletL_01",
                "T_Dae_Gold_GauntletR_01", "T_Dae_Gold_Greaves_01", "T_Dae_Gold_Helm_01",
                "T_Dae_Gold_PauldronL_01", "T_Dae_Gold_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistMagicka", magnitude = 5 },
                    { effect = "spellAbsorption", magnitude = 3 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "spellAbsorption", magnitude = 5 },
                    { effect = "reflect", magnitude = 5 },
                    { effect = "weaknesstoShock", magnitude = 10 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "spellAbsorption", magnitude = 8 },
                    { effect = "reflect", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "weaknesstoShock", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Nor_GuardFalkr_Boots_01") then
        setBonus.registerSet{
            name = "Falkreath Guard",
            displayName = "Falkreath Guard",
            items = {
                "T_Nor_GuardFalkr_Boots_01", "T_Nor_GuardFalkr_BracerL_01", "T_Nor_GuardFalkr_BracerR_01",
                "T_Nor_GuardFalkr_Cuirass_01", "T_Nor_GuardFalkr_Greaves_01", "T_Nor_GuardFalkr_Helm_01",
                "T_Nor_GuardFalkr_Helm_02", "T_Nor_GuardFalkr_PauldronL_01", "T_Nor_GuardFalkr_PauldronR_01",
                "T_Nor_GuardFalkr_Shield_01", "T_Nor_GuardFalkr_TowerShield_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistFrost", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistFrost", magnitude = 15 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_GuardSutch_Cuirass_01") then
        setBonus.registerSet{
            name = "Sutch Mail",
            displayName = "Sutch Mail",
            items = {
                "T_Imp_GuardSutch_Cuirass_01", "T_Imp_GuardSutch_GauntletL_01", "T_Imp_GuardSutch_GauntletR_01",
                "T_Imp_GuardSutch_Helm_01", "T_Imp_GuardSutch_PauldrL_01", "T_Imp_GuardSutch_PauldrR_01",
                "T_Imp_GuardSutch_ShieldTow_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistNormalWeapons", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyAttack", magnitude = 5 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                },
            },
        }
    end
    if present("T_Rga_GuardRihad_Boots_01") then
        setBonus.registerSet{
            name = "Rihad Guard",
            displayName = "Rihad Guard",
            items = {
                "T_Rga_GuardRihad_Boots_01", "T_Rga_GuardRihad_Bracer_L_01", "T_Rga_GuardRihad_Bracer_R_01",
                "T_Rga_GuardRihad_Cuirass_01", "T_Rga_GuardRihad_Helm_01", "T_Rga_GuardRihad_Pauldron_L_01",
                "T_Rga_GuardRihad_Pauldron_R_01",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                    { effect = "fortifyFatigue", magnitude = 12 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_BonemoldSacred_Boots_01") then
        setBonus.registerSet{
            name = "Sacred Lands",
            displayName = "Sacred Lands Bonemold",
            items = {
                "T_De_BonemoldSacred_Boots_01", "T_De_BonemoldSacred_Cuirass_01", "T_De_BonemoldSacred_GauntL_01",
                "T_De_BonemoldSacred_GauntR_01", "T_De_BonemoldSacred_Helm_01", "T_De_BonemoldSacred_PauldL_01",
                "T_De_BonemoldSacred_PauldR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistMagicka", magnitude = 5 },
                    { effect = "fortifyHealth", magnitude = 8 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 8 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 12 },
                    { effect = "turnUndead", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Rga_IronLamellar_Boots_01") then
        setBonus.registerSet{
            name = "Redguard Iron Lamellar",
            displayName = "Redguard Iron Lamellar",
            items = {
                "T_Rga_IronLamellar_Boots_01", "T_Rga_IronLamellar_Bracer_L_01", "T_Rga_IronLamellar_Bracer_R_01",
                "T_Rga_IronLamellar_Cuirass_01", "T_Rga_IronLamellar_Greaves_01", "T_Rga_IronLamellar_Helm_01",
                "T_Rga_IronLamellar_Pauld_L_01", "T_Rga_IronLamellar_Pauld_R_01",
            },
            bonuses = {
                min = {
                    { effect = "resistNormalWeapons", magnitude = 3 },
                    { effect = "fortifyHealth", magnitude = 8 },
                },
                mid = {
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "weaknesstoShock", magnitude = 10 },
                },
                max = {
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "weaknesstoShock", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_ColLeather_Boots_01") then
        setBonus.registerSet{
            name = "Colovian Leather",
            displayName = "Colovian Leather",
            items = {
                "T_Imp_ColLeather_Boots_01", "T_Imp_ColLeather_Boots_02", "T_Imp_ColLeather_BracerL_01",
                "T_Imp_ColLeather_BracerL_02", "T_Imp_ColLeather_BracerR_01", "T_Imp_ColLeather_BracerR_02",
                "T_Imp_ColLeather_Cuirass_01", "T_Imp_ColLeather_Cuirass_02", "T_Imp_ColLeather_Greaves_01",
                "T_Imp_ColLeather_Greaves_02", "T_Imp_ColLeather_Helm_01", "T_Imp_ColLeather_Helm_02",
                "T_Imp_ColLeather_PauldronL_01", "T_Imp_ColLeather_PauldronL_02", "T_Imp_ColLeather_PauldronR_01",
                "T_Imp_ColLeather_PauldronR_02",
            },
            bonuses = {
                min = {
                    { effect = "fortifyFatigue", magnitude = 12 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
                    { effect = "fortifySkill", skill = "sneak", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "fortifySkill", skill = "sneak", magnitude = 12 },
                    { effect = "fortifySkill", skill = "acrobatics", magnitude = 12 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_QyK_Chitin_Boots_01") then
        setBonus.registerSet{
            name = "Quey Chitin",
            displayName = "Quey Chitin",
            items = {
                "T_QyK_Chitin_Boots_01", "T_QyK_Chitin_Cuirass_01", "T_QyK_Chitin_GauntletL_01",
                "T_QyK_Chitin_GauntletR_01", "T_QyK_Chitin_Greaves_01", "T_QyK_Chitin_Helmet_01",
                "T_QyK_Chitin_PauldronL_01", "T_QyK_Chitin_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 10 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "swiftSwim", magnitude = 40 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_QyK_Manatee_Boots_01") then
        setBonus.registerSet{
            name = "Manatee Leather",
            displayName = "Manatee Leather",
            items = {
                "T_QyK_Manatee_Boots_01", "T_QyK_Manatee_BracerL_01", "T_QyK_Manatee_BracerR_01",
                "T_QyK_Manatee_Cuirass_01", "T_QyK_Manatee_Greaves_01", "T_QyK_Manatee_Helm_01",
                "T_QyK_Manatee_PauldronL_01", "T_QyK_Manatee_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 20 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 30 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 40 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_RdDmTmp_Boots_01") then
        setBonus.registerSet{
            name = "Red Dome Templar",
            displayName = "Red Dome Templar",
            items = {
                "T_Imp_RdDmTmp_Boots_01", "T_Imp_RdDmTmp_BracerL_01", "T_Imp_RdDmTmp_BracerR_01",
                "T_Imp_RdDmTmp_Cuirass_01", "T_Imp_RdDmTmp_Greaves_01", "T_Imp_RdDmTmp_Helmet_01",
                "T_Imp_RdDmTmp_PauldronL_01", "T_Imp_RdDmTmp_PauldronR_01", "T_Imp_RdDmTmp_Shield_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistMagicka", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "turnUndead", magnitude = 15 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "turnUndead", magnitude = 20 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 12 },
                },
            },
        }
    end
    if present("T_De_ShinChitin_Boots") then
        setBonus.registerSet{
            name = "Shinathi Chitin",
            displayName = "Shinathi Chitin",
            items = {
                "T_De_ShinChitin_Boots", "T_De_ShinChitin_BracerL", "T_De_ShinChitin_BracerR",
                "T_De_ShinChitin_Cuirass", "T_De_ShinChitin_Greaves", "T_De_ShinChitin_Helm",
                "T_De_ShinChitin_PauldL", "T_De_ShinChitin_PauldR",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "resistParalysis", magnitude = 15 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "resistParalysis", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Nor_ReaRoy_Boots_01") then
        setBonus.registerSet{
            name = "Reach Royal Guard",
            displayName = "Reach Royal Guard",
            items = {
                "T_Nor_ReaRoy_Boots_01", "T_Nor_ReaRoy_BracerL_01", "T_Nor_ReaRoy_BracerR_01",
                "T_Nor_ReaRoy_Cuirass_01", "T_Nor_ReaRoy_Helm_01", "T_Nor_ReaRoy_PauldronL_01",
                "T_Nor_ReaRoy_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistFrost", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistFrost", magnitude = 15 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end

    -- === Relocated sets (were entirely TR) ===
    if present("T_He_AltmerGlass_Boots_01") then
        setBonus.registerSet{
            name = "Altmer",
            displayName = "Altmer",
            items = {
                "T_He_AltmerGlass_Boots_01", "T_He_AltmerGlass_Cuirass_01", "T_He_AltmerGlass_Greaves_01",
                "T_He_AltmerGlass_Helm_01", "T_He_AltmerGlass_Helm_02", "T_He_AltmerGlass_L_Bracer_01",
                "T_He_AltmerGlass_L_Pauldron_01", "T_He_AltmerGlass_R_Bracer_01", "T_He_AltmerGlass_R_Pauldron_01",
                "T_He_Direnni_Boots_01", "T_He_Direnni_BracerL_01", "T_He_Direnni_BracerR_01",
                "T_He_Direnni_Cuirass_01", "T_He_Direnni_Greaves_01", "T_He_Direnni_Helm_01",
                "T_He_Direnni_PauldronL_01", "T_He_Direnni_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 3 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 8 },
                    { effect = "weaknesstoMagicka", magnitude = 10 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 8 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 12 },
                    { effect = "fortifySkill", skill = "alteration", magnitude = 12 },
                    { effect = "weaknesstoMagicka", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_GuardTown1_Boots_01") then
        setBonus.registerSet{
            name = "Anvil",
            displayName = "Anvil",
            items = {
                "T_Imp_GuardTown1_Boots_01", "T_Imp_GuardTown1_Cuirass_01", "T_Imp_GuardTown1_GauntletL_01",
                "T_Imp_GuardTown1_GauntletR_01", "T_Imp_GuardTown1_Greaves_01", "T_Imp_GuardTown1_Helm_01",
                "T_Imp_GuardTown1_HelmAnv_01", "T_Imp_GuardTown1_HelmStr_01", "T_Imp_GuardTown1_HelmSut_01",
                "T_Imp_GuardTown1_PauldrL_01", "T_Imp_GuardTown1_PauldrR_01", "T_Imp_GuardTown1_ShieldAnv_01",
            },
            bonuses = {
                min = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 20 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 30 },
                    { effect = "resistFrost", magnitude = 15 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 40 },
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Arg_Hist_Cuirass_01") then
        setBonus.registerSet{
            name = "Argonian",
            displayName = "Argonian",
            items = {
                "T_Arg_Hist_Cuirass_01", "T_Arg_Hist_Cuirass_Freedom", "T_Arg_Hist_Cuirass_Visitor",
            },
            bonuses = {
                min = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 10 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistCommonDisease", magnitude = 15 },
                    { effect = "swiftSwim", magnitude = 30 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "resistCommonDisease", magnitude = 20 },
                    { effect = "swiftSwim", magnitude = 40 },
                    { effect = "restoreHealth", magnitude = 1, duration = 1 },
                },
            },
        }
    end
    if present("T_Ayl_Saliache_Boots_01") then
        setBonus.registerSet{
            name = "Ayleid",
            displayName = "Ayleid",
            items = {
                "T_Ayl_Saliache_Boots_01", "T_Ayl_Saliache_BracerL_01", "T_Ayl_Saliache_BracerR_01",
                "T_Ayl_Saliache_Cuirass_01", "T_Ayl_Saliache_Greaves_01", "T_Ayl_Saliache_Helm_01",
                "T_Ayl_Saliache_PauldronL_01", "T_Ayl_Saliache_PauldronR_01", "T_Ayl_Saliache_Shield_01",
            },
            bonuses = {
                min = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "light", magnitude = 8 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 5 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 8 },
                    { effect = "resistMagicka", magnitude = 12 },
                },
            },
        }
    end
    if present("T_De_Bonemold_Stone_Boots") then
        setBonus.registerSet{
            name = "Bal-Darum",
            displayName = "Bal-Darum",
            items = {
                "T_De_Bonemold_Stone_Boots", "T_De_Bonemold_Stone_Cuirass", "T_De_Bonemold_Stone_GauntletL",
                "T_De_Bonemold_Stone_GauntletR", "T_De_Bonemold_Stone_Greaves", "T_De_Bonemold_Stone_Helm",
                "T_De_Bonemold_Stone_PauldL", "T_De_Bonemold_Stone_PauldR",
            },
            bonuses = {
                min = {
                    { effect = "resistBlightDisease", magnitude = 10 },
                    { effect = "resistNormalWeapons", magnitude = 3 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyHealth", magnitude = 12 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                },
            },
        }
    end
    if present("T_Bre_BjoulsaeFur_Helm_01") then
        setBonus.registerSet{
            name = "Breton",
            displayName = "Breton",
            items = {
                "T_Bre_BjoulsaeFur_Helm_01", "T_Bre_Ep_HatWizard_01", "T_Bre_Ep_HatWizard_02",
                "T_Bre_Mithril_Shield_01", "T_Bre_UNI_LordlyHeaterShield", "T_Bre_UNI_TricksterShield",
                "T_Bre_WoodenHeater_Shield_01", "T_Bre_WoodenHeater_Shield_02", "T_Bre_WoodenHeater_Shield_03",
                "T_Bre_WoodenHeater_Shield_04", "T_Bre_WoodenHeater_Shield_05", "T_Bre_WoodenHeater_Shield_06",
                "T_Bre_WoodenHeater_Shield_07", "T_Bre_WoodenHeater_Shield_08", "T_Bre_WoodenHeater_Shield_09",
                "T_Bre_WoodenHeater_Shield_10", "T_Bre_WoodenHeater_Shield_11", "T_Bre_WoodenHeater_Shield_12",
                "T_Bre_WoodenHeater_Shield_13",
            },
            bonuses = {
                min = {
                    { effect = "resistMagicka", magnitude = 5 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "spellAbsorption", magnitude = 5 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "spellAbsorption", magnitude = 8 },
                    { effect = "fortifySkill", skill = "conjuration", magnitude = 12 },
                },
            },
        }
    end
    if present("T_Imp_GuardTown1_Boots_01") then
        setBonus.registerSet{
            name = "Cataphract",
            displayName = "Cataphract",
            items = {
                "T_Imp_GuardTown1_Boots_01", "T_Imp_GuardTown1_Cuirass_01", "T_Imp_GuardTown1_GauntletL_01",
                "T_Imp_GuardTown1_GauntletR_01", "T_Imp_GuardTown1_Greaves_01", "T_Imp_GuardTown1_Helm_01",
                "T_Imp_GuardTown1_HelmAnv_01", "T_Imp_GuardTown1_HelmStr_01", "T_Imp_GuardTown1_HelmSut_01",
                "T_Imp_GuardTown1_PauldrL_01", "T_Imp_GuardTown1_PauldrR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "weaknesstoShock", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "weaknesstoShock", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_DresChapthil_Helm_01a") then
        setBonus.registerSet{
            name = "Chap-thil",
            displayName = "Chap-thil",
            items = {
                "T_De_DresChapthil_Helm_01a", "T_De_DresChapthil_Helm_01b", "T_De_DresChapthil_Helm_01c",
                "T_De_DresChapthil_Helm_01d", "T_De_DresChapthil_Helm_01e", "T_De_DresChapthil_Helm_02a",
                "T_De_DresChapthil_Helm_02b", "T_De_DresChapthil_Helm_02c", "T_De_DresChapthil_Helm_02d",
                "T_De_DresChapthil_Helm_02e", "T_De_DresChapthil_Helm_03a", "T_De_DresChapthil_Helm_03b",
                "T_De_DresChapthil_Helm_03c", "T_De_DresChapthil_Helm_03d", "T_De_DresChapthil_Helm_03e",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                    { effect = "fortifyFatigue", magnitude = 12 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_IndChevAram_Boots_01") then
        setBonus.registerSet{
            name = "Chev-Aram",
            displayName = "Chev-Aram",
            items = {
                "T_De_IndChevAram_Boots_01", "T_De_IndChevAram_BracerL_01", "T_De_IndChevAram_BracerR_01",
                "T_De_IndChevAram_Cuirass_01", "T_De_IndChevAram_Greaves_01", "T_De_IndChevAram_Helm_01",
                "T_De_IndChevAram_Helm_02", "T_De_IndChevAram_PauldrL_01", "T_De_IndChevAram_PauldrR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                    { effect = "fortifyAttack", magnitude = 3 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "fortifyHealth", magnitude = 12 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                },
            },
        }
    end
    if present("T_De_Bonemold_Chuzei_Boots") then
        setBonus.registerSet{
            name = "Chuzei",
            displayName = "Chuzei",
            items = {
                "T_De_Bonemold_Chuzei_Boots", "T_De_Bonemold_Chuzei_Boots_E", "T_De_Bonemold_Chuzei_BracerL",
                "T_De_Bonemold_Chuzei_BracerL_E", "T_De_Bonemold_Chuzei_BracerR", "T_De_Bonemold_Chuzei_BracerR_E",
                "T_De_Bonemold_Chuzei_Cuirass", "T_De_Bonemold_Chuzei_Cuirass_E", "T_De_Bonemold_Chuzei_Greaves",
                "T_De_Bonemold_Chuzei_Greaves_E", "T_De_Bonemold_Chuzei_Helm_E", "T_De_Bonemold_Chuzei_PauldL",
                "T_De_Bonemold_Chuzei_PauldL_E", "T_De_Bonemold_Chuzei_PauldR", "T_De_Bonemold_Chuzei_PauldR_E",
                "T_De_IndBonemold_Boots_01", "T_De_IndBonemold_Cuirass_01", "T_De_IndBonemold_GauntletL_01",
                "T_De_IndBonemold_GauntletR_01", "T_De_IndBonemold_Greaves_01", "T_De_IndBonemold_HelmSaviour_01",
                "T_De_IndBonemold_PauldronL_01", "T_De_IndBonemold_PauldronL_02", "T_De_IndBonemold_PauldronR_01",
                "T_De_IndBonemold_PauldronR_02", "T_De_IndBonemold_Shield_01", "T_De_IndBonemold_Shield_02",
                "T_De_IndBonemold_Shield_03", "T_De_IndBonemold_Shield_04", "T_De_IndBonemold_Shield_05",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Nor_Companion_Boots_01") then
        setBonus.registerSet{
            name = "Companions",
            displayName = "Companions",
            items = {
                "T_Nor_Companion_Boots_01", "T_Nor_Companion_Cuirass_01", "T_Nor_Companion_GauntletL_01",
                "T_Nor_Companion_GauntletR_01", "T_Nor_Companion_Greaves_01", "T_Nor_Companion_Helm_01",
                "T_Nor_Companion_PauldronL_01", "T_Nor_Companion_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyAttack", magnitude = 3 },
                    { effect = "fortifyFatigue", magnitude = 12 },
                },
                mid = {
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 12 },
                },
                max = {
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Rga_CrownGuard1_Boots_01") then
        setBonus.registerSet{
            name = "Crown Guard",
            displayName = "Crown Guard",
            items = {
                "T_Rga_CrownGuard1_Boots_01", "T_Rga_CrownGuard1_Cuirass_01", "T_Rga_CrownGuard1_Greaves_01",
                "T_Rga_CrownGuard1_Helm_01", "T_Rga_CrownGuard1_PauldronL_01", "T_Rga_CrownGuard1_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistNormalWeapons", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_DaedricHide_Cuirass_01") then
        setBonus.registerSet{
            name = "Daedric Hide",
            displayName = "Daedric Hide",
            items = {
                "T_De_DaedricHide_Cuirass_01", "T_De_DaedricHide_PauldronL_01", "T_De_DaedricHide_PauldronR_01",
                "T_De_DaedricHide_Greaves_01", "T_De_DaedricHide_Boots_01", "T_De_DaedricHide_GauntletL_01",
                "T_De_DaedricHide_GauntletR_01", "TR_m1_raptures fist",
            },
            bonuses = {
                min = {
                    { effect = "spellAbsorption", magnitude = 3 },
                },
                mid = {
                    { effect = "spellAbsorption", magnitude = 5 },
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "sanctuary", magnitude = 7 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "spellAbsorption", magnitude = 8 },
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "sanctuary", magnitude = 10 },
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_Domina_Boots_01") then
        setBonus.registerSet{
            name = "Domina",
            displayName = "Domina",
            items = {
                "T_Imp_Domina_Boots_01", "T_Imp_Domina_Cuirass_01", "T_Imp_Domina_GauntletL_01",
                "T_Imp_Domina_GauntletR_01", "T_Imp_Domina_Greaves_01", "T_Imp_Domina_Helm_01",
                "T_Imp_Domina_PauldronL_01", "T_Imp_Domina_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
                    { effect = "fortifyAttack", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "fortifyHealth", magnitude = 12 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                },
            },
        }
    end
    if anyPresent(REDWATCH_GATE) then
        setBonus.registerSet{
            name = "Dunmer",
            displayName = "Dunmer",
            items = {
                "T_A_DeChitinHelmOpen01_Hrpen", "T_A_DeRedWatchChitinCuir01_Cuirass", "T_De_RedWatchChitin_PauldrL_01",
                "T_De_RedWatchChitin_PauldrR_01", "T_A_DeRedWatchChitinGreav01_Greaves", "T_De_RedWatchChitin_Boots_01",
                "T_A_DeRedWatchChitinGreav01_Gauntlet_left", "T_A_DeRedWatchChitinGreav01_Gauntlet_right", "T_De_AlmaRula_Helm_UNI",
                "T_De_Bonemold_Chuzei_Boots", "T_De_Bonemold_Chuzei_Boots_E", "T_De_Bonemold_Chuzei_BracerL",
                "T_De_Bonemold_Chuzei_BracerL_E", "T_De_Bonemold_Chuzei_BracerR", "T_De_Bonemold_Chuzei_BracerR_E",
                "T_De_Bonemold_Chuzei_Cuirass", "T_De_Bonemold_Chuzei_Cuirass_E", "T_De_Bonemold_Chuzei_Greaves",
                "T_De_Bonemold_Chuzei_Greaves_E", "T_De_Bonemold_Chuzei_Helm_E", "T_De_Bonemold_Chuzei_PauldL",
                "T_De_Bonemold_Chuzei_PauldL_E", "T_De_Bonemold_Chuzei_PauldR", "T_De_Bonemold_Chuzei_PauldR_E",
                "T_De_Bonemold_HelmOpen_01", "T_De_Bonemold_HelmRider_01", "T_De_Bonemold_Stone_Boots",
                "T_De_Bonemold_Stone_Cuirass", "T_De_Bonemold_Stone_GauntletL", "T_De_Bonemold_Stone_GauntletR",
                "T_De_Bonemold_Stone_Greaves", "T_De_Bonemold_Stone_Helm", "T_De_Bonemold_Stone_PauldL",
                "T_De_Bonemold_Stone_PauldR", "T_De_Bonemold_Ulvra_Boots", "T_De_Bonemold_Ulvra_BracerL",
                "T_De_Bonemold_Ulvra_BracerR", "T_De_Bonemold_Ulvra_Cuirass", "T_De_Bonemold_Ulvra_Greaves",
                "T_De_Bonemold_Ulvra_Helm", "T_De_Bonemold_Ulvra_PauldL", "T_De_Bonemold_Ulvra_PauldR",
                "T_De_BonemoldKrage_Boots_01", "T_De_BonemoldKrage_Cuirass_01", "T_De_BonemoldKrage_GauntletL_01",
                "T_De_BonemoldKrage_GauntletR_01", "T_De_BonemoldKrage_Greaves_01", "T_De_BonemoldKrage_Helm_01",
                "T_De_BonemoldKrage_PauldronL_01", "T_De_BonemoldKrage_PauldronR_01", "T_De_BonemoldKragen_Helm_01",
                "T_De_BonemoldMarad_Cuirass_01", "T_De_BonemoldMarad_Helm_01", "T_De_BonemoldMarad_Helm_02",
                "T_De_BonemoldMarad_PauldronL_01", "T_De_BonemoldMarad_PauldronR_01", "T_De_BonemoldMarad_Shield_01",
                "T_De_BonemoldSammas_Helm_01", "T_De_CanyonWatch_Boots_01", "T_De_CanyonWatch_BracerL_01",
                "T_De_CanyonWatch_BracerR_01", "T_De_CanyonWatch_Cuirass_01", "T_De_CanyonWatch_Greaves_01",
                "T_De_CanyonWatch_Helm_01", "T_De_CanyonWatch_PauldronL_01", "T_De_CanyonWatch_PauldronR_01",
                "T_De_Caravaner_Helm_01", "T_De_Chitin_HelmOpen_01", "T_De_Chitin_PauldrL_01",
                "T_De_Chitin_PauldrR_01", "T_De_Chitin_PioneerHelm_01", "T_De_Chitin_PioneerHelm_02",
                "T_De_Cm_HatTelv_01", "T_De_Cm_HatTelv_02", "T_De_Cm_HatTelv_03",
                "T_De_Cm_HatTelv_04", "T_De_Cm_HatTelv_05", "T_De_DaedricHide_Boots_01",
                "T_De_DaedricHide_Cuirass_01", "T_De_DaedricHide_GauntletL_01", "T_De_DaedricHide_GauntletR_01",
                "T_De_DaedricHide_Greaves_01", "T_De_DaedricHide_PauldronL_01", "T_De_DaedricHide_PauldronR_01",
                "T_De_Diviner_Helm_01", "T_De_DresBonemold_Boots_01", "T_De_DresBonemold_Cuirass_01",
                "T_De_DresBonemold_GauntletL_01", "T_De_DresBonemold_GauntletR_01", "T_De_DresBonemold_Greaves_01",
                "T_De_DresBonemold_Helm_01", "T_De_DresBonemold_PauldronL_01", "T_De_DresBonemold_PauldronR_01",
                "T_De_DresBonemold_ShieldTow_01", "T_De_DresChapthil_Helm_01a", "T_De_DresChapthil_Helm_01b",
                "T_De_DresChapthil_Helm_01c", "T_De_DresChapthil_Helm_01d", "T_De_DresChapthil_Helm_01e",
                "T_De_DresChapthil_Helm_02a", "T_De_DresChapthil_Helm_02b", "T_De_DresChapthil_Helm_02c",
                "T_De_DresChapthil_Helm_02d", "T_De_DresChapthil_Helm_02e", "T_De_DresChapthil_Helm_03a",
                "T_De_DresChapthil_Helm_03b", "T_De_DresChapthil_Helm_03c", "T_De_DresChapthil_Helm_03d",
                "T_De_DresChapthil_Helm_03e", "T_De_DresHunter_Cuirass_01", "T_De_DresHunter_Greaves_01",
                "T_De_DresHunter_Helm_01", "T_De_DresHunter_PauldronL_01", "T_De_DresHunter_PauldronR_01",
                "T_De_DresSaltMerc_Helm_01", "T_De_DresSaltMerc_Helm_02", "T_De_Dreugh_Boots_01",
                "T_De_Dreugh_BracerL_01", "T_De_Dreugh_BracerR_01", "T_De_Dreugh_Greaves_01",
                "T_De_Dreugh_Helm_Closed", "T_De_Dreugh_Hunter_Helm_01", "T_De_Dreugh_Hunter_Helm_02",
                "T_De_Dreugh_PauldronL_01", "T_De_Dreugh_PauldronL_Swim", "T_De_Dreugh_PauldronR_01",
                "T_De_Dreugh_PauldronR_Swim", "T_De_Dreugh_Shield_Swim", "T_De_Ebony_Helm_02",
                "T_De_Ebony_HelmOpen_01", "T_De_Ep_HatTelv_01", "T_De_Ep_HatTelv_02",
                "T_De_Ep_HatTelv_03", "T_De_Et_HatTelv_01", "T_De_Et_HatTelv_02",
                "T_De_Ex_HatTelv_01", "T_De_Ex_HatTelv_02", "T_De_FiendCephalopodHelm_01",
                "T_De_FiendMoleCrabHelm_01", "T_De_Glass_Helm_Closed_01", "T_De_HvChit_Boots",
                "T_De_HvChit_Cuirass", "T_De_HvChit_Gauntlet_L", "T_De_HvChit_Gauntlet_R",
                "T_De_HvChit_Greaves", "T_De_HvChit_Helmet", "T_De_HvChit_Pauldron_L",
                "T_De_HvChit_Pauldron_R", "T_De_IndBonemold_Boots_01", "T_De_IndBonemold_Cuirass_01",
                "T_De_IndBonemold_GauntletL_01", "T_De_IndBonemold_GauntletR_01", "T_De_IndBonemold_Greaves_01",
                "T_De_IndBonemold_HelmSaviour_01", "T_De_IndBonemold_PauldronL_01", "T_De_IndBonemold_PauldronL_02",
                "T_De_IndBonemold_PauldronR_01", "T_De_IndBonemold_PauldronR_02", "T_De_IndBonemold_Shield_01",
                "T_De_IndBonemold_Shield_02", "T_De_IndBonemold_Shield_03", "T_De_IndBonemold_Shield_04",
                "T_De_IndBonemold_Shield_05", "T_De_IndChevAram_Boots_01", "T_De_IndChevAram_BracerL_01",
                "T_De_IndChevAram_BracerR_01", "T_De_IndChevAram_Cuirass_01", "T_De_IndChevAram_Greaves_01",
                "T_De_IndChevAram_Helm_01", "T_De_IndChevAram_Helm_02", "T_De_IndChevAram_PauldrL_01",
                "T_De_IndChevAram_PauldrR_01", "T_De_Molecrab_Boots_01", "T_De_Molecrab_BracerL_01",
                "T_De_Molecrab_BracerR_01", "T_De_Molecrab_Cuirass_01", "T_De_Molecrab_Greaves_01",
                "T_De_Molecrab_PauldronL_01", "T_De_Molecrab_PauldronR_01", "T_De_NativeEbony_Boots_01",
                "T_De_NativeEbony_Cuirass_01", "T_De_NativeEbony_GauntletL_01", "T_De_NativeEbony_GauntletR_01",
                "T_De_NativeEbony_Greaves_01", "T_De_NativeEbony_HelmClosed_01", "T_De_NativeEbony_HelmClosed_02",
                "T_De_NativeEbony_HelmOpen_01", "T_De_NativeEbony_HelmOpen_02", "T_De_NativeEbony_PauldronL_01",
                "T_De_NativeEbony_PauldronR_01", "T_De_Necrom_Boots_01", "T_De_Necrom_Cuirass_01",
                "T_De_Necrom_Cuirass_02", "T_De_Necrom_GauntletL_01", "T_De_Necrom_GauntletR_01",
                "T_De_Necrom_Greaves_01", "T_De_Necrom_Helm_01", "T_De_Necrom_PauldronL_01",
                "T_De_Necrom_PauldronR_01", "T_De_Necrom_Shield_01", "T_De_Netch_Cuirass_01",
                "T_De_Netch_Cuirass_02", "T_De_Netch_Cuirass_03", "T_De_Netch_Helm_01",
                "T_De_Netch_Helm_02", "T_De_NetchRogue_Cuirass_01", "T_De_NetchRogue_Helm_01",
                "T_De_NetchRogue_Helm_02", "T_De_NetchStalker_Helm_01", "T_De_Ordinator_Greaves_01",
                "T_De_RedBonemold_HelmOpen_01", "T_De_RedHeroBonemold_Cuirass_01", "T_De_RedHeroBonemold_Helm_01",
                "T_De_RedHeroBonemold_Helm_02", "T_De_RedHeroBonemold_Helm_03", "T_De_RedHeroBonemold_PauldrL_01",
                "T_De_RedHeroBonemold_PauldrR_01", "T_De_RedMastBonemold_Cuirass_01", "T_De_RedMastBonemold_PauldrL_01",
                "T_De_RedMastBonemold_PauldrR_01", "T_De_RedoranWatchman_Boots", "T_De_RedoranWatchman_Cuirass",
                "T_De_RedoranWatchman_GauntletL", "T_De_RedoranWatchman_GauntletR", "T_De_RedoranWatchman_Greaves",
                "T_De_RedoranWatchman_PauldronL", "T_De_RedoranWatchman_PauldronR", "T_De_RedWatchChitin_Cuirass_01",
                "T_De_RedWatchChitin_GauntlL_01", "T_De_RedWatchChitin_GauntlR_01", "T_De_RedWatchChitin_Greaves_01",
                "T_De_TelvCephalopod_Boots_01", "T_De_TelvCephalopod_Cuirass_01", "T_De_TelvCephalopod_GauntL_01",
                "T_De_TelvCephalopod_GauntR_01", "T_De_TelvCephalopod_Greaves_01", "T_De_TelvCephalopod_PauldL_01",
                "T_De_TelvCephalopod_PauldR_01", "T_De_ThirrBonemold_Boots_01", "T_De_ThirrBonemold_Bracer_01_L",
                "T_De_ThirrBonemold_Bracer_01_R", "T_De_ThirrBonemold_Cuirass_01", "T_De_ThirrBonemold_Greaves_01",
                "T_De_ThirrBonemold_Helm_01", "T_De_ThirrBonemold_Pauldrn_01_L", "T_De_ThirrBonemold_Pauldrn_01_R",
                "T_De_UNI_FacelessHelm", "T_De_UNI_IrfeidsShoulderL", "T_De_UNI_IrfeidsShoulderR",
                "T_De_UNI_PreyseekerHelm", "T_De_UNI_Shield_Abernanit", "T_De_UNI_ShoulderOfGhostlightL",
                "T_De_UNI_ShoulderOfGhostlightR", "T_De_UNI_UshuDimmuCrown", "T_De_UNI_Vanguard",
                "T_De_UNI_VivecShield",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 8 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 12 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
                },
            },
        }
    end
    if present("T_De_DresBonemold_Boots_01") then
        setBonus.registerSet{
            name = "Gah'Kogo",
            displayName = "Gah'Kogo",
            items = {
                "T_De_DresBonemold_Boots_01", "T_De_DresBonemold_Cuirass_01", "T_De_DresBonemold_GauntletL_01",
                "T_De_DresBonemold_GauntletR_01", "T_De_DresBonemold_Greaves_01", "T_De_DresBonemold_Helm_01",
                "T_De_DresBonemold_PauldronL_01", "T_De_DresBonemold_PauldronR_01", "T_De_DresBonemold_ShieldTow_01",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "resistParalysis", magnitude = 15 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "resistParalysis", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_Gold_Boots_02") then
        setBonus.registerSet{
            name = "Gold",
            displayName = "Gold",
            items = {
                "T_Imp_Gold_Boots_02", "T_Imp_Gold_BracerL_02", "T_Imp_Gold_BracerR_02",
                "T_Imp_Gold_Cuirass_01", "T_Imp_Gold_Cuirass_02", "T_Imp_Gold_GauntletL_02",
                "T_Imp_Gold_GauntletR_02", "T_Imp_Gold_Greaves_02", "T_Imp_Gold_Helm_01",
                "T_Imp_Gold_Helm_02", "T_Imp_Gold_PauldronL_01", "T_Imp_Gold_PauldronL_02",
                "T_Imp_Gold_PauldronR_01", "T_Imp_Gold_PauldronR_02", "T_Imp_Gold_Shield_01",
                "T_Imp_Gold_ShieldBuckler_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
                    { effect = "weaknesstoShock", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "weaknesstoShock", magnitude = 20 },
                },
            },
        }
    end
    if present("T_He_Direnni_Boots_01") then
        setBonus.registerSet{
            name = "House Direnni",
            displayName = "House Direnni",
            items = {
                "T_He_Direnni_Boots_01", "T_He_Direnni_BracerL_01", "T_He_Direnni_BracerR_01",
                "T_He_Direnni_Cuirass_01", "T_He_Direnni_Greaves_01", "T_He_Direnni_Helm_01",
                "T_He_Direnni_PauldronL_01", "T_He_Direnni_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistMagicka", magnitude = 5 },
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 5 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 8 },
                    { effect = "fortifySkill", skill = "alteration", magnitude = 12 },
                },
            },
        }
    end
    if anyPresent(REDWATCH_GATE) then
        setBonus.registerSet{
            name = "House Redoran",
            displayName = "House Redoran",
            items = {
                "T_A_DeChitinHelmOpen01_Hrpen", "T_A_DeRedWatchChitinCuir01_Cuirass", "T_De_RedWatchChitin_PauldrL_01",
                "T_De_RedWatchChitin_PauldrR_01", "T_A_DeRedWatchChitinGreav01_Greaves", "T_De_RedWatchChitin_Boots_01",
                "T_A_DeRedWatchChitinGreav01_Gauntlet_left", "T_A_DeRedWatchChitinGreav01_Gauntlet_right",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Imp_GuardTown2_Boots_01") then
        setBonus.registerSet{
            name = "Kalantar",
            displayName = "Kalantar",
            items = {
                "T_Imp_GuardTown2_Boots_01", "T_Imp_GuardTown2_Cuirass_01", "T_Imp_GuardTown2_GauntletL_01",
                "T_Imp_GuardTown2_GauntletR_01", "T_Imp_GuardTown2_Greaves_01", "T_Imp_GuardTown2_Helm_01",
                "T_Imp_GuardTown2_HelmArt_01", "T_Imp_GuardTown2_HelmBru_01", "T_Imp_GuardTown2_HelmCho_01",
                "T_Imp_GuardTown2_PauldrL_01", "T_Imp_GuardTown2_PauldrR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                    { effect = "fortifyAttack", magnitude = 3 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "strength", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                },
            },
        }
    end
    if present("T_Imp_GuardTown3_Boots_01") then
        setBonus.registerSet{
            name = "Klibanion",
            displayName = "Klibanion",
            items = {
                "T_Imp_GuardTown3_Boots_01", "T_Imp_GuardTown3_Cuirass_01", "T_Imp_GuardTown3_GauntletL_01",
                "T_Imp_GuardTown3_GauntletR_01", "T_Imp_GuardTown3_Greaves_01", "T_Imp_GuardTown3_Helm_01",
                "T_Imp_GuardTown3_HelmKva_01", "T_Imp_GuardTown3_HelmSar_01", "T_Imp_GuardTown3_HelmSkn_01",
                "T_Imp_GuardTown3_PauldrL_01", "T_Imp_GuardTown3_PauldrR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistNormalWeapons", magnitude = 3 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 },
                },
                mid = {
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                    { effect = "weaknesstoShock", magnitude = 10 },
                },
                max = {
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "weaknesstoShock", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_BonemoldKrage_Boots_01") then
        setBonus.registerSet{
            name = "Kragen",
            displayName = "Kragen",
            items = {
                "T_De_BonemoldKrage_Boots_01", "T_De_BonemoldKrage_Cuirass_01", "T_De_BonemoldKrage_GauntletL_01",
                "T_De_BonemoldKrage_GauntletR_01", "T_De_BonemoldKrage_Greaves_01", "T_De_BonemoldKrage_Helm_01",
                "T_De_BonemoldKrage_PauldronL_01", "T_De_BonemoldKrage_PauldronR_01", "T_De_BonemoldKragen_Helm_01",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 5 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_Chainmail_cuirass_04") then
        setBonus.registerSet{
            name = "Kvetchi",
            displayName = "Kvetchi",
            items = {
                "T_Imp_Chainmail_cuirass_04", "T_Imp_Chainmail_Helm_04", "T_Imp_ColSteel_Boots_02",
                "T_Imp_ColSteel_Cuirass_02", "T_Imp_ColSteel_GauntletL_02", "T_Imp_ColSteel_GauntletR_02",
                "T_Imp_ColSteel_Greaves_02", "T_Imp_ColSteel_Helm_02", "T_Imp_ColSteel_Helm_06",
                "T_Imp_ColSteel_PauldronL_02", "T_Imp_ColSteel_PauldronR_02",
            },
            bonuses = {
                min = {
                    { effect = "resistBlightDisease", magnitude = 10 },
                    { effect = "fortifyFatigue", magnitude = 12 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Rga_Lamellar_Bracer_L_01") then
        setBonus.registerSet{
            name = "Lamellar",
            displayName = "Lamellar",
            items = {
                "T_Rga_Lamellar_Bracer_L_01", "T_Rga_Lamellar_Bracer_R_01", "T_Rga_Lamellar_Cuirass",
                "T_Rga_Lamellar_Cuirass_B", "T_Rga_Lamellar_Cuirass_G", "T_Rga_Lamellar_Cuirass_Y",
                "T_Rga_Lamellar_Helm", "T_Rga_Lamellar_Helm_B", "T_Rga_Lamellar_Helm_G",
                "T_Rga_Lamellar_Helm_Y",
            },
            bonuses = {
                min = {
                    { effect = "resistNormalWeapons", magnitude = 3 },
                    { effect = "fortifyFatigue", magnitude = 12 },
                },
                mid = {
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "weaknesstoShock", magnitude = 10 },
                },
                max = {
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "weaknesstoShock", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_BonemoldMarad_Cuirass_01") then
        setBonus.registerSet{
            name = "Maradlai",
            displayName = "Maradlai",
            items = {
                "T_De_BonemoldMarad_Cuirass_01", "T_De_BonemoldMarad_Helm_01", "T_De_BonemoldMarad_Helm_02",
                "T_De_BonemoldMarad_PauldronL_01", "T_De_BonemoldMarad_PauldronR_01", "T_De_BonemoldMarad_Shield_01",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 3 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 8 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
                },
            },
        }
    end
    if present("T_Imp_Militia_Boots_01") then
        setBonus.registerSet{
            name = "Militia",
            displayName = "Militia",
            items = {
                "T_Imp_Militia_Boots_01", "T_Imp_Militia_Cuirass_01", "T_Imp_Militia_GauntL_01",
                "T_Imp_Militia_GauntR_01", "T_Imp_Militia_Greaves_01", "T_Imp_Militia_Helm_01",
                "T_Imp_Militia_PauldronL_01", "T_Imp_Militia_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyFatigue", magnitude = 12 },
                    { effect = "fortifyHealth", magnitude = 8 },
                },
                mid = {
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                },
                max = {
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                },
            },
        }
    end
    if present("TR_m1_molecrab_cuirass_protect") then
        setBonus.registerSet{
            name = "Molecrab",
            displayName = "Molecrab",
            items = {
                "TR_m1_molecrab_cuirass_protect", "T_De_Molecrab_Cuirass_01", "T_De_Molecrab_PauldronL_01",
                "T_De_Molecrab_PauldronR_01", "T_De_Molecrab_Greaves_01", "T_De_Molecrab_Boots_01",
                "T_De_Molecrab_BracerL_01", "T_De_Molecrab_BracerR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistNormalWeapons", magnitude = 3 },
                },
                mid = {
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_NavyOff_Boots_01") then
        setBonus.registerSet{
            name = "Navy",
            displayName = "Navy",
            items = {
                "T_Imp_NavyOff_Boots_01", "T_Imp_NavyOff_BracerL_01", "T_Imp_NavyOff_BracerR_01",
                "T_Imp_NavyOff_Cuirass_01", "T_Imp_NavyOff_Greaves_01", "T_Imp_NavyOff_Helmet_01",
                "T_Imp_NavyOff_PauldronL_01", "T_Imp_NavyOff_PauldronR_01", "T_Imp_NavyStud_Boots_01",
                "T_Imp_NavyStud_Cuirass_01", "T_Imp_NavyStud_GauntletL_01", "T_Imp_NavyStud_GauntletR_01",
                "T_Imp_NavyStud_Helm_01", "T_Imp_NavyStud_PauldrL_01", "T_Imp_NavyStud_PauldrR_01",
            },
            bonuses = {
                min = {
                    { effect = "swiftSwim", magnitude = 20 },
                    { effect = "waterBreathing", magnitude = 1 },
                },
                mid = {
                    { effect = "swiftSwim", magnitude = 30 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistFrost", magnitude = 15 },
                },
                max = {
                    { effect = "swiftSwim", magnitude = 40 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                },
            },
        }
    end
    if present("T_De_Necrom_Boots_01") then
        setBonus.registerSet{
            name = "Necrom Guard",
            displayName = "Necrom Guard",
            items = {
                "T_De_Necrom_Boots_01", "T_De_Necrom_Cuirass_01", "T_De_Necrom_Cuirass_02",
                "T_De_Necrom_GauntletL_01", "T_De_Necrom_GauntletR_01", "T_De_Necrom_Greaves_01",
                "T_De_Necrom_Helm_01", "T_De_Necrom_PauldronL_01", "T_De_Necrom_PauldronR_01",
                "T_De_Necrom_Shield_01",
            },
            bonuses = {
                min = {
                    { effect = "turnUndead", magnitude = 10 },
                    { effect = "resistMagicka", magnitude = 5 },
                },
                mid = {
                    { effect = "turnUndead", magnitude = 15 },
                    { effect = "resistMagicka", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "turnUndead", magnitude = 20 },
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 12 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_NibBronze_Boots_01") then
        setBonus.registerSet{
            name = "Nibenese",
            displayName = "Nibenese",
            items = {
                "T_Imp_NibBronze_Boots_01", "T_Imp_NibBronze_BracerL_01", "T_Imp_NibBronze_BracerR_01",
                "T_Imp_NibBronze_Cuirass_01", "T_Imp_NibBronze_Greaves_01", "T_Imp_NibBronze_Helm_01",
                "T_Imp_NibBronze_PauldronL_01", "T_Imp_NibBronze_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 5 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 8 },
                    { effect = "resistMagicka", magnitude = 8 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 12 },
                    { effect = "resistMagicka", magnitude = 12 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Imp_ColSteel_Boots_03") then
        setBonus.registerSet{
            name = "Oloman",
            displayName = "Oloman",
            items = {
                "T_Imp_ColSteel_Boots_03", "T_Imp_ColSteel_BracerL_03", "T_Imp_ColSteel_BracerR_03",
                "T_Imp_ColSteel_Cuirass_03", "T_Imp_ColSteel_Greaves_03", "T_Imp_ColSteel_Helm_03",
                "T_Imp_ColSteel_PauldronL_03", "T_Imp_ColSteel_PauldronR_03",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                    { effect = "resistNormalWeapons", magnitude = 3 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "fortifyHealth", magnitude = 12 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Rga_Alikr_Buckler") then
        setBonus.registerSet{
            name = "Redguard",
            displayName = "Redguard",
            items = {
                "T_Rga_Alikr_Buckler", "T_Rga_CrownGuard1_Boots_01", "T_Rga_CrownGuard1_Cuirass_01",
                "T_Rga_CrownGuard1_Greaves_01", "T_Rga_CrownGuard1_Helm_01", "T_Rga_CrownGuard1_PauldronL_01",
                "T_Rga_CrownGuard1_PauldronR_01", "T_Rga_Ep_Headdress_01", "T_Rga_Lamellar_Bracer_L_01",
                "T_Rga_Lamellar_Bracer_R_01", "T_Rga_Lamellar_Cuirass", "T_Rga_Lamellar_Cuirass_B",
                "T_Rga_Lamellar_Cuirass_G", "T_Rga_Lamellar_Cuirass_Y", "T_Rga_Lamellar_Helm",
                "T_Rga_Lamellar_Helm_B", "T_Rga_Lamellar_Helm_G", "T_Rga_Lamellar_Helm_Y",
                "T_Rga_Wicker_Shield",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 3 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "weaknesstoFire", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 8 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "weaknesstoFire", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_Reman_Boots_01") then
        setBonus.registerSet{
            name = "Reman",
            displayName = "Reman",
            items = {
                "T_Imp_Reman_Boots_01", "T_Imp_Reman_BracerL_01", "T_Imp_Reman_BracerR_01",
                "T_Imp_Reman_Cuirass_01", "T_Imp_Reman_Greaves_01", "T_Imp_Reman_Helm_01",
                "T_Imp_Reman_PauldronL_01", "T_Imp_Reman_PauldronR_01", "T_Imp_Reman_Shield_01",
            },
            bonuses = {
                min = {
                    { effect = "fortifyHealth", magnitude = 8 },
                    { effect = "fortifyAttack", magnitude = 3 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "fortifyAttack", magnitude = 5 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "fortifyAttack", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                    { effect = "resistNormalWeapons", magnitude = 8 },
                },
            },
        }
    end
    if present("T_Ayl_Saliache_Boots_01") then
        setBonus.registerSet{
            name = "Saliache",
            displayName = "Saliache",
            items = {
                "T_Ayl_Saliache_Boots_01", "T_Ayl_Saliache_BracerL_01", "T_Ayl_Saliache_BracerR_01",
                "T_Ayl_Saliache_Cuirass_01", "T_Ayl_Saliache_Greaves_01", "T_Ayl_Saliache_Helm_01",
                "T_Ayl_Saliache_PauldronL_01", "T_Ayl_Saliache_PauldronR_01", "T_Ayl_Saliache_Shield_01",
            },
            bonuses = {
                min = {
                    { effect = "resistBlightDisease", magnitude = 10 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 5 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 8 },
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 12 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_QC_Shellmold_Boots_01") then
        setBonus.registerSet{
            name = "Shellmold",
            displayName = "Shellmold",
            items = {
                "T_QC_Shellmold_Boots_01", "T_QC_Shellmold_BracerL_01", "T_QC_Shellmold_BracerR_01",
                "T_QC_Shellmold_Cuirass_01", "T_QC_Shellmold_Greaves_01", "T_QC_Shellmold_Helm_01",
                "T_QC_Shellmold_PauldL_01", "T_QC_Shellmold_PauldR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistNormalWeapons", magnitude = 3 },
                    { effect = "resistShock", magnitude = 10 },
                },
                mid = {
                    { effect = "resistNormalWeapons", magnitude = 5 },
                    { effect = "resistShock", magnitude = 15 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistNormalWeapons", magnitude = 8 },
                    { effect = "resistShock", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_De_CanyonWatch_Boots_01") then
        setBonus.registerSet{
            name = "Shipal-Arai",
            displayName = "Shipal-Arai",
            items = {
                "T_De_CanyonWatch_Boots_01", "T_De_CanyonWatch_BracerL_01", "T_De_CanyonWatch_BracerR_01",
                "T_De_CanyonWatch_Cuirass_01", "T_De_CanyonWatch_Greaves_01", "T_De_CanyonWatch_Helm_01",
                "T_De_CanyonWatch_PauldronL_01", "T_De_CanyonWatch_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistBlightDisease", magnitude = 10 },
                    { effect = "resistPoison", magnitude = 10 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifySkill", skill = "spear", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifySkill", skill = "spear", magnitude = 12 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 8 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if present("T_Imp_ColSteel_Boots_04") then
        setBonus.registerSet{
            name = "Skingrad",
            displayName = "Skingrad",
            items = {
                "T_Imp_ColSteel_Boots_04", "T_Imp_ColSteel_BracerL_04", "T_Imp_ColSteel_BracerR_04",
                "T_Imp_ColSteel_Cuirass_04", "T_Imp_ColSteel_Greaves_04", "T_Imp_ColSteel_Helm_04",
                "T_Imp_ColSteel_PauldronL_04", "T_Imp_ColSteel_PauldronR_04",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                    { effect = "resistCommonDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistCommonDisease", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "resistCommonDisease", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 8 },
                    { effect = "resistMagicka", magnitude = 12 },
                },
            },
        }
    end
    if present("T_De_ThirrBonemold_Boots_01") then
        setBonus.registerSet{
            name = "Thirr",
            displayName = "Thirr",
            items = {
                "T_De_ThirrBonemold_Boots_01", "T_De_ThirrBonemold_Bracer_01_L", "T_De_ThirrBonemold_Bracer_01_R",
                "T_De_ThirrBonemold_Cuirass_01", "T_De_ThirrBonemold_Greaves_01", "T_De_ThirrBonemold_Helm_01",
                "T_De_ThirrBonemold_Pauldrn_01_L", "T_De_ThirrBonemold_Pauldrn_01_R",
            },
            bonuses = {
                min = {
                    { effect = "resistFire", magnitude = 10 },
                    { effect = "waterBreathing", magnitude = 1 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyHealth", magnitude = 12 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "swiftSwim", magnitude = 40 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end
    if anyPresent(REDWATCH_GATE) then
        setBonus.registerSet{
            name = "Watchman",
            displayName = "Watchman",
            items = {
                "T_A_DeChitinHelmOpen01_Hrpen", "T_A_DeRedWatchChitinCuir01_Cuirass", "T_De_RedWatchChitin_PauldrL_01",
                "T_De_RedWatchChitin_PauldrR_01", "T_A_DeRedWatchChitinGreav01_Greaves", "T_De_RedWatchChitin_Boots_01",
                "T_A_DeRedWatchChitinGreav01_Gauntlet_left", "T_A_DeRedWatchChitinGreav01_Gauntlet_right",
            },
            bonuses = {
                min = {
                    { effect = "nightEye", magnitude = 25 },
                    { effect = "fortifyFatigue", magnitude = 12 },
                },
                mid = {
                    { effect = "nightEye", magnitude = 40 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 12 },
                },
                max = {
                    { effect = "nightEye", magnitude = 50 },
                    { effect = "fortifyFatigue", magnitude = 28 },
                    { effect = "fortifyHealth", magnitude = 18 },
                    { effect = "detectAnimal", magnitude = 50 },
                },
            },
        }
    end
    if present("T_Rea_Wormmouth_Boots_01") then
        setBonus.registerSet{
            name = "Wormmouth",
            displayName = "Wormmouth",
            items = {
                "T_Rea_Wormmouth_Boots_01", "T_Rea_Wormmouth_BracerL_01", "T_Rea_Wormmouth_BracerR_01",
                "T_Rea_Wormmouth_Cuirass_01", "T_Rea_Wormmouth_Greaves_01", "T_Rea_Wormmouth_Helm_01",
                "T_Rea_Wormmouth_Helm_Poison", "T_Rea_Wormmouth_PauldronL_01", "T_Rea_Wormmouth_PauldronR_01",
            },
            bonuses = {
                min = {
                    { effect = "resistPoison", magnitude = 10 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "weaknesstoFrost", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "resistParalysis", magnitude = 20 },
                    { effect = "weaknesstoFrost", magnitude = 20 },
                },
            },
        }
    end

    -- === Re-link TR items to mixed base sets ===
    if present("T_Nor_Bearskin_Helm_01") and setBonus.getSet("Bearskin") then
        setBonus.addItems("Bearskin", {
            "T_Nor_Bearskin_Helm_01", "T_Nor_Bearskin_PauldronL_01", "T_Nor_Bearskin_PauldronR_01",
            "T_Nor_Bearskin_Greaves_01", "T_Nor_Bearskin_Boots_01", "T_Nor_Bearskin_BracerL_01",
            "T_Nor_Bearskin_BracerR_01",
        })
    end
    if present("T_De_Bonemold_Chuzei_Boots") and setBonus.getSet("Bonemold") then
        setBonus.addItems("Bonemold", {
            "T_De_Bonemold_Chuzei_Boots", "T_De_Bonemold_Chuzei_Boots_E", "T_De_Bonemold_Chuzei_BracerL",
            "T_De_Bonemold_Chuzei_BracerL_E", "T_De_Bonemold_Chuzei_BracerR", "T_De_Bonemold_Chuzei_BracerR_E",
            "T_De_Bonemold_Chuzei_Cuirass", "T_De_Bonemold_Chuzei_Cuirass_E", "T_De_Bonemold_Chuzei_Greaves",
            "T_De_Bonemold_Chuzei_Greaves_E", "T_De_Bonemold_Chuzei_Helm_E", "T_De_Bonemold_Chuzei_PauldL",
            "T_De_Bonemold_Chuzei_PauldL_E", "T_De_Bonemold_Chuzei_PauldR", "T_De_Bonemold_Chuzei_PauldR_E",
            "T_De_Bonemold_HelmOpen_01", "T_De_Bonemold_HelmRider_01", "T_De_Bonemold_Stone_Boots",
            "T_De_Bonemold_Stone_Cuirass", "T_De_Bonemold_Stone_GauntletL", "T_De_Bonemold_Stone_GauntletR",
            "T_De_Bonemold_Stone_Greaves", "T_De_Bonemold_Stone_Helm", "T_De_Bonemold_Stone_PauldL",
            "T_De_Bonemold_Stone_PauldR", "T_De_Bonemold_Ulvra_Boots", "T_De_Bonemold_Ulvra_BracerL",
            "T_De_Bonemold_Ulvra_BracerR", "T_De_Bonemold_Ulvra_Cuirass", "T_De_Bonemold_Ulvra_Greaves",
            "T_De_Bonemold_Ulvra_Helm", "T_De_Bonemold_Ulvra_PauldL", "T_De_Bonemold_Ulvra_PauldR",
            "T_De_BonemoldKrage_Boots_01", "T_De_BonemoldKrage_Cuirass_01", "T_De_BonemoldKrage_GauntletL_01",
            "T_De_BonemoldKrage_GauntletR_01", "T_De_BonemoldKrage_Greaves_01", "T_De_BonemoldKrage_Helm_01",
            "T_De_BonemoldKrage_PauldronL_01", "T_De_BonemoldKrage_PauldronR_01", "T_De_BonemoldKragen_Helm_01",
            "T_De_BonemoldMarad_Cuirass_01", "T_De_BonemoldMarad_Helm_01", "T_De_BonemoldMarad_Helm_02",
            "T_De_BonemoldMarad_PauldronL_01", "T_De_BonemoldMarad_PauldronR_01", "T_De_BonemoldMarad_Shield_01",
            "T_De_BonemoldSammas_Helm_01", "T_De_DresBonemold_Boots_01", "T_De_DresBonemold_Cuirass_01",
            "T_De_DresBonemold_GauntletL_01", "T_De_DresBonemold_GauntletR_01", "T_De_DresBonemold_Greaves_01",
            "T_De_DresBonemold_Helm_01", "T_De_DresBonemold_PauldronL_01", "T_De_DresBonemold_PauldronR_01",
            "T_De_DresBonemold_ShieldTow_01", "T_De_IndBonemold_Boots_01", "T_De_IndBonemold_Cuirass_01",
            "T_De_IndBonemold_GauntletL_01", "T_De_IndBonemold_GauntletR_01", "T_De_IndBonemold_Greaves_01",
            "T_De_IndBonemold_HelmSaviour_01", "T_De_IndBonemold_PauldronL_01", "T_De_IndBonemold_PauldronL_02",
            "T_De_IndBonemold_PauldronR_01", "T_De_IndBonemold_PauldronR_02", "T_De_IndBonemold_Shield_01",
            "T_De_IndBonemold_Shield_02", "T_De_IndBonemold_Shield_03", "T_De_IndBonemold_Shield_04",
            "T_De_IndBonemold_Shield_05", "T_De_RedBonemold_HelmOpen_01", "T_De_RedHeroBonemold_Cuirass_01",
            "T_De_RedHeroBonemold_Helm_01", "T_De_RedHeroBonemold_Helm_02", "T_De_RedHeroBonemold_Helm_03",
            "T_De_RedHeroBonemold_PauldrL_01", "T_De_RedHeroBonemold_PauldrR_01", "T_De_RedMastBonemold_Cuirass_01",
            "T_De_RedMastBonemold_PauldrL_01", "T_De_RedMastBonemold_PauldrR_01", "T_De_ThirrBonemold_Boots_01",
            "T_De_ThirrBonemold_Bracer_01_L", "T_De_ThirrBonemold_Bracer_01_R", "T_De_ThirrBonemold_Cuirass_01",
            "T_De_ThirrBonemold_Greaves_01", "T_De_ThirrBonemold_Helm_01", "T_De_ThirrBonemold_Pauldrn_01_L",
            "T_De_ThirrBonemold_Pauldrn_01_R", "TR_i2-235_bonemold_towershield",
        })
    end
    if present("T_Imp_ColBronzeOld_Helm_01") and setBonus.getSet("Bronze") then
        setBonus.addItems("Bronze", {
            "T_Imp_ColBronzeOld_Helm_01", "T_Imp_NibBronze_Boots_01", "T_Imp_NibBronze_BracerL_01",
            "T_Imp_NibBronze_BracerR_01", "T_Imp_NibBronze_Cuirass_01", "T_Imp_NibBronze_Greaves_01",
            "T_Imp_NibBronze_Helm_01", "T_Imp_NibBronze_PauldronL_01", "T_Imp_NibBronze_PauldronR_01",
        })
    end
    if present("T_De_FiendCephalopodHelm_01") and setBonus.getSet("Cephalopod") then
        setBonus.addItems("Cephalopod", {
            "T_De_FiendCephalopodHelm_01", "T_De_TelvCephalopod_Boots_01", "T_De_TelvCephalopod_Cuirass_01",
            "T_De_TelvCephalopod_GauntL_01", "T_De_TelvCephalopod_GauntR_01", "T_De_TelvCephalopod_Greaves_01",
            "T_De_TelvCephalopod_PauldL_01", "T_De_TelvCephalopod_PauldR_01",
        })
    end
    if present("T_Com_Chain_Cuirass_01") and setBonus.getSet("Chain Mail") then
        setBonus.addItems("Chain Mail", {
            "T_Com_Chain_Cuirass_01", "T_Com_Chain_Cuirass_02", "T_Com_Chain_Cuirass_03",
            "T_Imp_Chain_Boots_01", "T_Imp_Chain_GauntletL_01", "T_Imp_Chain_GauntletR_02",
            "T_Imp_Chainmail_cuirass_01", "T_Imp_Chainmail_cuirass_02", "T_Imp_Chainmail_cuirass_03",
            "T_Imp_Chainmail_cuirass_04", "T_Imp_Chainmail_Helm_01", "T_Imp_Chainmail_Helm_02",
            "T_Imp_Chainmail_Helm_03", "T_Imp_Chainmail_Helm_04", "TR_m4_IL_chaincuirass",
        })
    end
    if present("T_A_DeChitinHelmOpen01_Hrpen") and setBonus.getSet("Chitin") then
        setBonus.addItems("Chitin", {
            "T_A_DeChitinHelmOpen01_Hrpen", "T_A_DeRedWatchChitinCuir01_Cuirass", "T_De_RedWatchChitin_PauldrL_01",
            "T_De_RedWatchChitin_PauldrR_01", "T_A_DeRedWatchChitinGreav01_Greaves", "T_De_RedWatchChitin_Boots_01",
            "T_A_DeRedWatchChitinGreav01_Gauntlet_left", "T_A_DeRedWatchChitinGreav01_Gauntlet_right", "T_De_Chitin_HelmOpen_01",
            "T_De_Chitin_PauldrL_01", "T_De_Chitin_PauldrR_01", "T_De_Chitin_PioneerHelm_01",
            "T_De_Chitin_PioneerHelm_02", "T_De_RedWatchChitin_Cuirass_01", "T_De_RedWatchChitin_GauntlL_01",
            "T_De_RedWatchChitin_GauntlR_01", "T_De_RedWatchChitin_Greaves_01",
        })
    end
    if present("T_Imp_ColBronzeOld_Helm_01") and setBonus.getSet("Colovian") then
        setBonus.addItems("Colovian", {
            "T_Imp_ColBronzeOld_Helm_01", "T_Imp_ColFur_Boots_01", "T_Imp_ColFur_Boots_02",
            "T_Imp_ColFur_Boots_03", "T_Imp_ColFur_Boots_04", "T_Imp_ColFur_Cuirass_01",
            "T_Imp_ColFur_Cuirass_02", "T_Imp_ColFur_Cuirass_03", "T_Imp_ColFur_Cuirass_04",
            "T_Imp_ColFur_GauntL_01", "T_Imp_ColFur_GauntL_02", "T_Imp_ColFur_GauntL_03",
            "T_Imp_ColFur_GauntL_04", "T_Imp_ColFur_GauntR_01", "T_Imp_ColFur_GauntR_02",
            "T_Imp_ColFur_GauntR_03", "T_Imp_ColFur_GauntR_04", "T_Imp_ColFur_HelmBl_01",
            "T_Imp_ColFur_HelmEx_01", "T_Imp_ColFur_HelmR_01", "T_Imp_ColFur_HelmTiger_01",
            "T_Imp_ColIron1_Boots_01", "T_Imp_ColIron1_Boots_02", "T_Imp_ColIron1_Boots_03",
            "T_Imp_ColIron1_Boots_04", "T_Imp_ColIron1_Cuirass_01", "T_Imp_ColIron1_Cuirass_02",
            "T_Imp_ColIron1_Cuirass_03", "T_Imp_ColIron1_Cuirass_04", "T_Imp_ColIron1_GauntletL_01",
            "T_Imp_ColIron1_GauntletL_02", "T_Imp_ColIron1_GauntletL_03", "T_Imp_ColIron1_GauntletL_04",
            "T_Imp_ColIron1_GauntletR_01", "T_Imp_ColIron1_GauntletR_02", "T_Imp_ColIron1_GauntletR_03",
            "T_Imp_ColIron1_GauntletR_04", "T_Imp_ColIron1_Greaves_01", "T_Imp_ColIron1_Greaves_02",
            "T_Imp_ColIron1_Greaves_03", "T_Imp_ColIron1_Greaves_04", "T_Imp_ColIron1_Helm_01",
            "T_Imp_ColIron1_Helm_02", "T_Imp_ColIron1_Helm_03", "T_Imp_ColIron1_Helm_04",
            "T_Imp_ColIron1_PauldronL_01", "T_Imp_ColIron1_PauldronL_02", "T_Imp_ColIron1_PauldronL_03",
            "T_Imp_ColIron1_PauldronL_04", "T_Imp_ColIron1_PauldronR_01", "T_Imp_ColIron1_PauldronR_02",
            "T_Imp_ColIron1_PauldronR_03", "T_Imp_ColIron1_PauldronR_04", "T_Imp_ColIron2_Boots_01",
            "T_Imp_ColIron2_BracerL_01", "T_Imp_ColIron2_BracerR_01", "T_Imp_ColIron2_Cuirass_01",
            "T_Imp_ColIron2_Greaves_01", "T_Imp_ColIron2_Helm_01", "T_Imp_ColIron2_PauldronL_01",
            "T_Imp_ColIron2_PauldronR_01", "T_Imp_ColIron_Boots_01", "T_Imp_ColIron_BracerL_01",
            "T_Imp_ColIron_BracerR_01", "T_Imp_ColIron_Cuirass_01", "T_Imp_ColIron_Greaves_01",
            "T_Imp_ColIron_Helmet_01", "T_Imp_ColIron_Helmet_02", "T_Imp_ColIron_PauldronL_01",
            "T_Imp_ColIron_PauldronR_01", "T_Imp_ColSteel1_Boots_01", "T_Imp_ColSteel1_Boots_02",
            "T_Imp_ColSteel1_Boots_03", "T_Imp_ColSteel1_Boots_04", "T_Imp_ColSteel1_BracerL_01",
            "T_Imp_ColSteel1_BracerL_02", "T_Imp_ColSteel1_BracerL_03", "T_Imp_ColSteel1_BracerL_04",
            "T_Imp_ColSteel1_BracerR_01", "T_Imp_ColSteel1_BracerR_02", "T_Imp_ColSteel1_BracerR_03",
            "T_Imp_ColSteel1_BracerR_04", "T_Imp_ColSteel1_Cuirass_01", "T_Imp_ColSteel1_Cuirass_02",
            "T_Imp_ColSteel1_Cuirass_03", "T_Imp_ColSteel1_Cuirass_04", "T_Imp_ColSteel1_Greaves_01",
            "T_Imp_ColSteel1_Greaves_02", "T_Imp_ColSteel1_Greaves_03", "T_Imp_ColSteel1_Greaves_04",
            "T_Imp_ColSteel1_Helm_01", "T_Imp_ColSteel1_Helm_02", "T_Imp_ColSteel1_Helm_03",
            "T_Imp_ColSteel1_Helm_04", "T_Imp_ColSteel1_PauldronL_01", "T_Imp_ColSteel1_PauldronL_02",
            "T_Imp_ColSteel1_PauldronL_03", "T_Imp_ColSteel1_PauldronL_04", "T_Imp_ColSteel1_PauldronR_01",
            "T_Imp_ColSteel1_PauldronR_02", "T_Imp_ColSteel1_PauldronR_03", "T_Imp_ColSteel1_PauldronR_04",
            "T_Imp_ColSteel_Boots_01", "T_Imp_ColSteel_Boots_02", "T_Imp_ColSteel_Boots_03",
            "T_Imp_ColSteel_Boots_04", "T_Imp_ColSteel_BracerL_03", "T_Imp_ColSteel_BracerL_04",
            "T_Imp_ColSteel_BracerR_03", "T_Imp_ColSteel_BracerR_04", "T_Imp_ColSteel_Cuirass_01",
            "T_Imp_ColSteel_Cuirass_02", "T_Imp_ColSteel_Cuirass_03", "T_Imp_ColSteel_Cuirass_04",
            "T_Imp_ColSteel_GauntletL_01", "T_Imp_ColSteel_GauntletL_02", "T_Imp_ColSteel_GauntletR_01",
            "T_Imp_ColSteel_GauntletR_02", "T_Imp_ColSteel_Greaves_01", "T_Imp_ColSteel_Greaves_02",
            "T_Imp_ColSteel_Greaves_03", "T_Imp_ColSteel_Greaves_04", "T_Imp_ColSteel_Helm_01",
            "T_Imp_ColSteel_Helm_02", "T_Imp_ColSteel_Helm_03", "T_Imp_ColSteel_Helm_04",
            "T_Imp_ColSteel_Helm_05", "T_Imp_ColSteel_Helm_06", "T_Imp_ColSteel_PauldronL_01",
            "T_Imp_ColSteel_PauldronL_02", "T_Imp_ColSteel_PauldronL_03", "T_Imp_ColSteel_PauldronL_04",
            "T_Imp_ColSteel_PauldronR_01", "T_Imp_ColSteel_PauldronR_02", "T_Imp_ColSteel_PauldronR_03",
            "T_Imp_ColSteel_PauldronR_04",
        })
    end
    if present("T_Dae_Regular_HelmConsolat_01") and setBonus.getSet("Daedric") then
        setBonus.addItems("Daedric", {
            "T_Dae_Regular_HelmConsolat_01", "T_Dae_Regular_HelmHumiliat_02", "T_Dae_Regular_HelmRebellion_01",
            "T_Dae_Lord_Boots_01", "T_Dae_Lord_GauntletL_01", "T_Dae_Lord_GauntletR_01",
            "T_Dae_Lord_Helm_01", "T_Dae_Lord_PauldronL_01", "T_Dae_Lord_PauldronR_01",
            "T_Dae_Regular_HelmHumiliat_01", "T_Dae_Regular_PauldronL_01", "T_Dae_Regular_PauldronR_01",
            "T_Dae_Regular_ShieldTower_01", "T_Dae_UNI_AuroranGauntletL", "T_Dae_UNI_AuroranGauntletR",
            "T_Dae_UNI_BootsOfAtronach", "T_Dae_UNI_BootsOfPeace_01", "T_Dae_UNI_BootsSaviorsHide",
            "T_Dae_UNI_Fearstruck", "T_Dae_UNI_GauntletOfPoor_L", "T_Dae_UNI_GauntletOfPoor_R",
            "T_Dae_UNI_GreavesSaviorsHide", "T_Dae_UNI_HelmLightWithin_01", "T_Dae_UNI_HelmSaviorsHide",
            "T_Dae_UNI_LGauntSaviorsHide", "T_Dae_UNI_LMethatsPauldron", "T_Dae_UNI_LPauldSaviorsHide",
            "T_Dae_UNI_Polyhedrascope_01", "T_Dae_UNI_RGauntSaviorsHide", "T_Dae_UNI_RMethatsPauldron",
            "T_Dae_UNI_RPauldSaviorsHide", "T_De_DaedricHide_Boots_01", "T_De_DaedricHide_Cuirass_01",
            "T_De_DaedricHide_GauntletL_01", "T_De_DaedricHide_GauntletR_01", "T_De_DaedricHide_Greaves_01",
            "T_De_DaedricHide_PauldronL_01", "T_De_DaedricHide_PauldronR_01", "T_Dae_Alternate_Boots_01",
            "T_Dae_Alternate_Buckler_01", "T_Dae_Alternate_Cuirass_01", "T_Dae_Alternate_GauntletL_01",
            "T_Dae_Alternate_GauntletR_01", "T_Dae_Alternate_Greaves_01", "T_Dae_Alternate_HelmOpen_01",
            "T_Dae_Alternate_Helm_01", "T_Dae_Alternate_PauldronL_01", "T_Dae_Alternate_PauldronR_01",
            "T_Dae_Alternate2_Boots_01", "T_Dae_Alternate2_Cuirass_01", "T_Dae_Alternate2_GauntletL_01",
            "T_Dae_Alternate2_GauntletR_01", "T_Dae_Alternate2_Greaves_01", "T_Dae_Alternate2_HelmOpen_01",
            "T_Dae_Alternate2_Helm_01", "T_Dae_Alternate2_PauldronL_01", "T_Dae_Alternate2_PauldronR_01",
        })
    end
    if present("T_Imp_Dragonscale_BarcerL_01") and setBonus.getSet("Dragonscale") then
        setBonus.addItems("Dragonscale", {
            "T_Imp_Dragonscale_BarcerL_01", "T_Imp_Dragonscale_BarcerR_01", "T_Imp_Dragonscale_Boots_01",
            "T_Imp_Dragonscale_cuirass_01", "T_Imp_Dragonscale_Greaves_01", "T_Imp_Dragonscale_helm_01",
            "T_Imp_Dragonscale_PauldronL_01", "T_Imp_Dragonscale_PauldronR_01", "TR_i2-235_dragonscale_tower",
        })
    end
    if present("T_De_Dreugh_Boots_01") and setBonus.getSet("Dreugh") then
        setBonus.addItems("Dreugh", {
            "T_De_Dreugh_Boots_01", "T_De_Dreugh_BracerL_01", "T_De_Dreugh_BracerR_01",
            "T_De_Dreugh_Greaves_01", "T_De_Dreugh_Helm_Closed", "T_De_Dreugh_Hunter_Helm_01",
            "T_De_Dreugh_Hunter_Helm_02", "T_De_Dreugh_PauldronL_01", "T_De_Dreugh_PauldronL_Swim",
            "T_De_Dreugh_PauldronR_01", "T_De_Dreugh_PauldronR_Swim", "T_De_Dreugh_Shield_Swim",
        })
    end
    if present("TR_i2-235_dwemer_shield") and setBonus.getSet("Dwemer") then
        setBonus.addItems("Dwemer", {
            "TR_i2-235_dwemer_shield", "T_Dwe_Regular_ShieldTower_01", "T_Dwe_Scrap_boots",
            "T_Dwe_Scrap_Bracer_L", "T_Dwe_Scrap_Bracer_R", "T_Dwe_Scrap_cuirass",
            "T_Dwe_Scrap_greaves", "T_Dwe_Scrap_helmet", "T_Dwe_Scrap_Pauldron_L",
            "T_Dwe_Scrap_Pauldron_R", "T_Dwe_UNI_MaskOfPurity",
        })
    end
    if present("T_De_Ebony_HelmOpen_01") and setBonus.getSet("Ebony") then
        setBonus.addItems("Ebony", {
            "T_De_Ebony_HelmOpen_01", "T_De_NativeEbony_Boots_01", "T_De_NativeEbony_Cuirass_01",
            "T_De_NativeEbony_GauntletL_01", "T_De_NativeEbony_GauntletR_01", "T_De_NativeEbony_Greaves_01",
            "T_De_NativeEbony_HelmClosed_01", "T_De_NativeEbony_HelmClosed_02", "T_De_NativeEbony_HelmOpen_01",
            "T_De_NativeEbony_HelmOpen_02", "T_De_NativeEbony_PauldronL_01", "T_De_NativeEbony_PauldronL_02",
            "T_Imp_Ebony_BracerL", "T_Imp_Ebony_BracerR", "T_Imp_Ebony_Cuirass",
            "T_Imp_Ebony_Helmet_01", "T_Imp_Ebony_PauldronL", "T_Imp_Ebony_PauldronR",
            "T_Imp_Ebony_ShieldTower_01",
        })
    end
    if present("T_Bre_BjoulsaeFur_Helm_01") and setBonus.getSet("Fur") then
        setBonus.addItems("Fur", {
            "T_Bre_BjoulsaeFur_Helm_01", "T_Imp_ColFur_Boots_01", "T_Imp_ColFur_Boots_02",
            "T_Imp_ColFur_Boots_03", "T_Imp_ColFur_Boots_04", "T_Imp_ColFur_Cuirass_01",
            "T_Imp_ColFur_Cuirass_02", "T_Imp_ColFur_Cuirass_03", "T_Imp_ColFur_Cuirass_04",
            "T_Imp_ColFur_GauntL_01", "T_Imp_ColFur_GauntL_02", "T_Imp_ColFur_GauntL_03",
            "T_Imp_ColFur_GauntL_04", "T_Imp_ColFur_GauntR_01", "T_Imp_ColFur_GauntR_02",
            "T_Imp_ColFur_GauntR_03", "T_Imp_ColFur_GauntR_04", "T_Imp_ColFur_HelmBl_01",
            "T_Imp_ColFur_HelmEx_01", "T_Imp_ColFur_HelmR_01", "T_Imp_ColFur_HelmTiger_01",
        })
    end
    if present("T_De_Glass_Helm_Closed_01") and setBonus.getSet("Glass") then
        setBonus.addItems("Glass", {
            "T_De_Glass_Helm_Closed_01", "T_He_AltmerGlass_Boots_01", "T_He_AltmerGlass_Cuirass_01",
            "T_He_AltmerGlass_Greaves_01", "T_He_AltmerGlass_Helm_01", "T_He_AltmerGlass_Helm_02",
            "T_He_AltmerGlass_L_Bracer_01", "T_He_AltmerGlass_L_Pauldron_01", "T_He_AltmerGlass_R_Bracer_01",
            "T_He_AltmerGlass_R_Pauldron_01",
        })
    end
    if present("TR_m1_Goblin_Trophy") and setBonus.getSet("Goblin") then
        setBonus.addItems("Goblin", {
            "TR_m1_Goblin_Trophy", "TR_i2-235_goblin_shield", "T_Cr_Goblin_Helm_01",
            "T_Cr_Goblin_PauldronL_01", "T_Cr_Goblin_PauldronR_01", "T_Cr_Goblin_Shield_01",
        })
    end
    if present("T_Dae_Regular_HelmConsolat_01") and setBonus.getSet("Heavy Armor") then
        setBonus.addItems("Heavy Armor", {
            "T_Dae_Regular_HelmConsolat_01", "T_Dae_Regular_HelmHumiliat_02", "T_Dae_Regular_HelmRebellion_01",
        })
    end
    if present("T_De_DaedricHide_Boots_01") and setBonus.getSet("Hide") then
        setBonus.addItems("Hide", {
            "T_De_DaedricHide_Boots_01", "T_De_DaedricHide_Cuirass_01", "T_De_DaedricHide_GauntletL_01",
            "T_De_DaedricHide_GauntletR_01", "T_De_DaedricHide_Greaves_01", "T_De_DaedricHide_PauldronL_01",
            "T_De_DaedricHide_PauldronR_01", "T_Dae_UNI_BootsSaviorsHide", "T_Dae_UNI_GreavesSaviorsHide",
            "T_Dae_UNI_HelmSaviorsHide", "T_Dae_UNI_LGauntSaviorsHide", "T_Dae_UNI_LPauldSaviorsHide",
            "T_Dae_UNI_RGauntSaviorsHide", "T_Dae_UNI_RPauldSaviorsHide",
        })
    end
    if present("T_De_DresBonemold_Boots_01") and setBonus.getSet("House Dres") then
        setBonus.addItems("House Dres", {
            "T_De_DresBonemold_Boots_01", "T_De_DresBonemold_Cuirass_01", "T_De_DresBonemold_GauntletL_01",
            "T_De_DresBonemold_GauntletR_01", "T_De_DresBonemold_Greaves_01", "T_De_DresBonemold_Helm_01",
            "T_De_DresBonemold_PauldronL_01", "T_De_DresBonemold_PauldronR_01", "T_De_DresBonemold_ShieldTow_01",
            "T_De_DresChapthil_Helm_01a", "T_De_DresChapthil_Helm_01b", "T_De_DresChapthil_Helm_01c",
            "T_De_DresChapthil_Helm_01d", "T_De_DresChapthil_Helm_01e", "T_De_DresChapthil_Helm_02a",
            "T_De_DresChapthil_Helm_02b", "T_De_DresChapthil_Helm_02c", "T_De_DresChapthil_Helm_02d",
            "T_De_DresChapthil_Helm_02e", "T_De_DresChapthil_Helm_03a", "T_De_DresChapthil_Helm_03b",
            "T_De_DresChapthil_Helm_03c", "T_De_DresChapthil_Helm_03d", "T_De_DresChapthil_Helm_03e",
            "T_De_DresHunter_Cuirass_01", "T_De_DresHunter_Greaves_01", "T_De_DresHunter_Helm_01",
            "T_De_DresHunter_PauldronL_01", "T_De_DresHunter_PauldronR_01", "T_De_DresSaltMerc_Helm_01",
            "T_De_DresSaltMerc_Helm_02", "TR_i2-410_a_dres_cuirass_broken",
        })
    end
    if present("TR_m4_olmshelm_i4-261-hla") and setBonus.getSet("House Hlaalu") then
        setBonus.addItems("House Hlaalu", {
            "TR_m4_olmshelm_i4-261-hla",
        })
    end
    if present("TR_m3_Brother_IndorilHelm") and setBonus.getSet("House Indoril") then
        setBonus.addItems("House Indoril", {
            "TR_m3_Brother_IndorilHelm", "TR_m3_indshield_i3-606-ind", "T_De_IndBonemold_Boots_01",
            "T_De_IndBonemold_Cuirass_01", "T_De_IndBonemold_GauntletL_01", "T_De_IndBonemold_GauntletR_01",
            "T_De_IndBonemold_Greaves_01", "T_De_IndBonemold_HelmSaviour_01", "T_De_IndBonemold_PauldronL_01",
            "T_De_IndBonemold_PauldronL_02", "T_De_IndBonemold_PauldronR_01", "T_De_IndBonemold_PauldronR_02",
            "T_De_IndBonemold_Shield_01", "T_De_IndBonemold_Shield_02", "T_De_IndBonemold_Shield_03",
            "T_De_IndBonemold_Shield_04", "T_De_IndBonemold_Shield_05", "T_De_IndChevAram_Boots_01",
            "T_De_IndChevAram_BracerL_01", "T_De_IndChevAram_BracerR_01", "T_De_IndChevAram_Cuirass_01",
            "T_De_IndChevAram_Greaves_01", "T_De_IndChevAram_Helm_01", "T_De_IndChevAram_Helm_02",
            "T_De_IndChevAram_PauldrL_01", "T_De_IndChevAram_PauldrR_01",
        })
    end
    if present("T_De_TelvCephalopod_Boots_01") and setBonus.getSet("House Telvanni") then
        setBonus.addItems("House Telvanni", {
            "T_De_TelvCephalopod_Boots_01", "T_De_TelvCephalopod_Cuirass_01", "T_De_TelvCephalopod_GauntL_01",
            "T_De_TelvCephalopod_GauntR_01", "T_De_TelvCephalopod_Greaves_01", "T_De_TelvCephalopod_PauldL_01",
            "T_De_TelvCephalopod_PauldR_01", "T_De_Molecrab_Boots_01", "T_De_Molecrab_BracerL_01",
            "T_De_Molecrab_BracerR_01", "T_De_Molecrab_Cuirass_01", "T_De_Molecrab_Greaves_01",
            "T_De_Molecrab_PauldronL_01", "T_De_Molecrab_PauldronR_01", "T_De_Ep_HatTelv_01",
            "T_De_Ep_HatTelv_02", "T_De_Ep_HatTelv_03", "T_De_Et_HatTelv_01",
            "T_De_Et_HatTelv_02", "T_De_Ex_HatTelv_01", "T_De_Ex_HatTelv_02",
            "T_De_Cm_HatTelv_01", "T_De_Cm_HatTelv_02", "T_De_Cm_HatTelv_03",
            "T_De_Cm_HatTelv_04", "T_De_Cm_HatTelv_05",
        })
    end
    if present("T_Imp_StuddedLeather_Helm_01") and setBonus.getSet("Imperial") then
        setBonus.addItems("Imperial", {
            "T_Imp_StuddedLeather_Helm_01", "T_Imp_StuddedLeather_PauldrL_01", "T_Imp_StuddedLeather_PauldrR_01t",
            "T_Imp_StuddedLeather_Greaves_01", "T_Imp_StuddedLeather_Boots_01",
        })
    end
    if present("T_Com_Iron_Boots_01") and setBonus.getSet("Iron") then
        setBonus.addItems("Iron", {
            "T_Com_Iron_Boots_01", "T_Com_Iron_Boots_02", "T_Com_Iron_BracerL_01",
            "T_Com_Iron_BracerL_02", "T_Com_Iron_BracerR_01", "T_Com_Iron_BracerR_02",
            "T_Com_Iron_Cuirass_01", "T_Com_Iron_Cuirass_02", "T_Com_Iron_Greaves_01",
            "T_Com_Iron_Greaves_02", "T_Com_Iron_Helm_01", "T_Com_Iron_Helm_02",
            "T_Com_Iron_Helm_Open", "T_Com_Iron_PauldronL_01", "T_Com_Iron_PauldronL_02",
            "T_Com_Iron_PauldronR_01", "T_Com_Iron_PauldronR_02", "T_Com_IronSkull_PauldronL_01",
            "T_Com_IronSkull_PauldronR_01", "T_Com_IronSpike_PauldronL_01", "T_Com_IronSpike_PauldronR_01",
            "T_Imp_ColIron1_Boots_01", "T_Imp_ColIron1_Boots_02", "T_Imp_ColIron1_Boots_03",
            "T_Imp_ColIron1_Boots_04", "T_Imp_ColIron1_Cuirass_01", "T_Imp_ColIron1_Cuirass_02",
            "T_Imp_ColIron1_Cuirass_03", "T_Imp_ColIron1_Cuirass_04", "T_Imp_ColIron1_GauntletL_01",
            "T_Imp_ColIron1_GauntletL_02", "T_Imp_ColIron1_GauntletL_03", "T_Imp_ColIron1_GauntletL_04",
            "T_Imp_ColIron1_GauntletR_01", "T_Imp_ColIron1_GauntletR_02", "T_Imp_ColIron1_GauntletR_03",
            "T_Imp_ColIron1_GauntletR_04", "T_Imp_ColIron1_Greaves_01", "T_Imp_ColIron1_Greaves_02",
            "T_Imp_ColIron1_Greaves_03", "T_Imp_ColIron1_Greaves_04", "T_Imp_ColIron1_Helm_01",
            "T_Imp_ColIron1_Helm_02", "T_Imp_ColIron1_Helm_03", "T_Imp_ColIron1_Helm_04",
            "T_Imp_ColIron1_PauldronL_01", "T_Imp_ColIron1_PauldronL_02", "T_Imp_ColIron1_PauldronL_03",
            "T_Imp_ColIron1_PauldronL_04", "T_Imp_ColIron1_PauldronR_01", "T_Imp_ColIron1_PauldronR_02",
            "T_Imp_ColIron1_PauldronR_03", "T_Imp_ColIron1_PauldronR_04", "T_Imp_ColIron2_Boots_01",
            "T_Imp_ColIron2_BracerL_01", "T_Imp_ColIron2_BracerR_01", "T_Imp_ColIron2_Cuirass_01",
            "T_Imp_ColIron2_Greaves_01", "T_Imp_ColIron2_Helm_01", "T_Imp_ColIron2_PauldronL_01",
            "T_Imp_ColIron2_PauldronR_01", "T_Imp_ColIron_Boots_01", "T_Imp_ColIron_BracerL_01",
            "T_Imp_ColIron_BracerR_01", "T_Imp_ColIron_Cuirass_01", "T_Imp_ColIron_Greaves_01",
            "T_Imp_ColIron_Helmet_01", "T_Imp_ColIron_Helmet_02", "T_Imp_ColIron_PauldronL_01",
            "T_Imp_ColIron_PauldronR_01", "T_Nor_Iron_Boots_01", "T_Nor_Iron_Boots_Leap",
            "T_Nor_Iron_Cuirass_Wintery", "T_Nor_Iron_GauntletL_01", "T_Nor_Iron_GauntletR_01",
            "T_Nor_Iron_Greaves_01", "T_Nor_Iron_PauldronL_01", "T_Nor_Iron_PauldronR_01",
            "T_Nor_Ironwood_Shield_01", "T_Nor_Ironwood_Shield_02", "TR_i2-235_iron_towershield",
        })
    end
    if present("T_Imp_StuddedLeather_Boots_01") and setBonus.getSet("Leather") then
        setBonus.addItems("Leather", {
            "T_Imp_StuddedLeather_Boots_01", "T_Imp_StuddedLeather_BracerL_01", "T_Imp_StuddedLeather_BracerR_01",
            "T_Imp_StuddedLeather_cuirass_02", "T_Imp_StuddedLeather_cuirass_03", "T_Imp_StuddedLeather_Greaves_01",
            "T_Imp_StuddedLeather_Helm_01", "T_Imp_StuddedLeather_Helm_02", "T_Imp_StuddedLeather_Helm_03",
            "T_Imp_StuddedLeather_PauldrL_01", "T_Imp_StuddedLeather_PauldrR_01", "T_Orc_Leather_Boots_01",
            "T_Orc_Leather_Cuirass_01", "T_Orc_Leather_GauntletL_01", "T_Orc_Leather_GauntletR_01",
            "T_Orc_Leather_Greaves_01", "T_Orc_Leather_Helm_01", "T_Orc_Leather_PauldronL_01",
            "T_Orc_Leather_PauldronR_01", "T_Rea_Leather_Hat_01", "T_Rea_Leather_Hat_Witchery",
        })
    end
    if present("T_A_DeChitinHelmOpen01_Hrpen") and setBonus.getSet("Light Armor") then
        setBonus.addItems("Light Armor", {
            "T_A_DeChitinHelmOpen01_Hrpen", "T_A_DeRedWatchChitinCuir01_Cuirass", "T_De_RedWatchChitin_PauldrL_01",
            "T_De_RedWatchChitin_PauldrR_01", "T_A_DeRedWatchChitinGreav01_Greaves", "T_De_RedWatchChitin_Boots_01",
            "T_A_DeRedWatchChitinGreav01_Gauntlet_left", "T_A_DeRedWatchChitinGreav01_Gauntlet_right", "T_Imp_StuddedLeather_Helm_01",
            "T_Imp_StuddedLeather_PauldrL_01", "T_Imp_StuddedLeather_PauldrR_01t", "T_Imp_StuddedLeather_Greaves_01",
            "T_Imp_StuddedLeather_Boots_01",
        })
    end
    if present("T_De_RedMastBonemold_Cuirass_01") and setBonus.getSet("Master") then
        setBonus.addItems("Master", {
            "T_De_RedMastBonemold_Cuirass_01", "T_De_RedMastBonemold_PauldrL_01", "T_De_RedMastBonemold_PauldrR_01",
        })
    end
    if present("TR_i2-410_a_dres_cuirass_broken") and setBonus.getSet("Native") then
        setBonus.addItems("Native", {
            "TR_i2-410_a_dres_cuirass_broken", "T_De_ThirrBonemold_Boots_01", "T_De_ThirrBonemold_Bracer_01_L",
            "T_De_ThirrBonemold_Bracer_01_R", "T_De_ThirrBonemold_Cuirass_01", "T_De_ThirrBonemold_Greaves_01",
            "T_De_ThirrBonemold_Helm_01", "T_De_ThirrBonemold_Pauldrn_01_L", "T_De_ThirrBonemold_Pauldrn_01_R",
            "T_De_NativeEbony_Boots_01", "T_De_NativeEbony_Cuirass_01", "T_De_NativeEbony_GauntletL_01",
            "T_De_NativeEbony_GauntletR_01", "T_De_NativeEbony_Greaves_01", "T_De_NativeEbony_HelmClosed_01",
            "T_De_NativeEbony_HelmClosed_02", "T_De_NativeEbony_HelmOpen_01", "T_De_NativeEbony_HelmOpen_02",
            "T_De_NativeEbony_PauldronL_01", "T_De_NativeEbony_PauldronR_01", "T_De_IndBonemold_Boots_01",
            "T_De_IndBonemold_Cuirass_01", "T_De_IndBonemold_GauntletL_01", "T_De_IndBonemold_GauntletR_01",
            "T_De_IndBonemold_Greaves_01", "T_De_IndBonemold_HelmSaviour_01", "T_De_IndBonemold_PauldronL_01",
            "T_De_IndBonemold_PauldronL_02", "T_De_IndBonemold_PauldronR_01", "T_De_IndBonemold_PauldronR_02",
            "T_De_IndBonemold_Shield_01", "T_De_IndBonemold_Shield_02", "T_De_IndBonemold_Shield_03",
            "T_De_IndBonemold_Shield_04", "T_De_IndBonemold_Shield_05", "T_De_IndChevAram_Boots_01",
            "T_De_IndChevAram_BracerL_01", "T_De_IndChevAram_BracerR_01", "T_De_IndChevAram_Cuirass_01",
            "T_De_IndChevAram_Greaves_01", "T_De_IndChevAram_Helm_01", "T_De_IndChevAram_Helm_02",
            "T_De_IndChevAram_PauldrL_01", "T_De_IndChevAram_PauldrR_01", "T_De_Bonemold_Chuzei_Boots",
            "T_De_Bonemold_Chuzei_Boots_E", "T_De_Bonemold_Chuzei_BracerL", "T_De_Bonemold_Chuzei_BracerL_E",
            "T_De_Bonemold_Chuzei_BracerR", "T_De_Bonemold_Chuzei_BracerR_E", "T_De_Bonemold_Chuzei_Cuirass",
            "T_De_Bonemold_Chuzei_Cuirass_E", "T_De_Bonemold_Chuzei_Greaves", "T_De_Bonemold_Chuzei_Greaves_E",
            "T_De_Bonemold_Chuzei_Helm_E", "T_De_Bonemold_Chuzei_PauldL", "T_De_Bonemold_Chuzei_PauldL_E",
            "T_De_Bonemold_Chuzei_PauldR", "T_De_Bonemold_Chuzei_PauldR_E", "T_De_Bonemold_HelmOpen_01",
            "T_De_Bonemold_HelmRider_01", "T_De_Bonemold_Stone_Boots", "T_De_Bonemold_Stone_Cuirass",
            "T_De_Bonemold_Stone_GauntletL", "T_De_Bonemold_Stone_GauntletR", "T_De_Bonemold_Stone_Greaves",
            "T_De_Bonemold_Stone_Helm", "T_De_Bonemold_Stone_PauldL", "T_De_Bonemold_Stone_PauldR",
            "T_De_Bonemold_Ulvra_Boots", "T_De_Bonemold_Ulvra_BracerL", "T_De_Bonemold_Ulvra_BracerR",
            "T_De_Bonemold_Ulvra_Cuirass", "T_De_Bonemold_Ulvra_Greaves", "T_De_Bonemold_Ulvra_Helm",
            "T_De_Bonemold_Ulvra_PauldL", "T_De_Bonemold_Ulvra_PauldR", "T_De_BonemoldKrage_Boots_01",
            "T_De_BonemoldKrage_Cuirass_01", "T_De_BonemoldKrage_GauntletL_01", "T_De_BonemoldKrage_GauntletR_01",
            "T_De_BonemoldKrage_Greaves_01", "T_De_BonemoldKrage_Helm_01", "T_De_BonemoldKrage_PauldronL_01",
            "T_De_BonemoldKrage_PauldronR_01", "T_De_BonemoldKragen_Helm_01", "T_De_BonemoldMarad_Cuirass_01",
            "T_De_BonemoldMarad_Helm_01", "T_De_BonemoldMarad_Helm_02", "T_De_BonemoldMarad_PauldronL_01",
            "T_De_BonemoldMarad_PauldronR_01", "T_De_BonemoldMarad_Shield_01", "T_De_BonemoldSammas_Helm_01",
            "T_De_CanyonWatch_Boots_01", "T_De_CanyonWatch_BracerL_01", "T_De_CanyonWatch_BracerR_01",
            "T_De_CanyonWatch_Cuirass_01", "T_De_CanyonWatch_Greaves_01", "T_De_CanyonWatch_Helm_01",
            "T_De_CanyonWatch_PauldronL_01", "T_De_CanyonWatch_PauldronR_01",
        })
    end
    if present("TR_m1_q_CuirassOfMobility") and setBonus.getSet("Netch Leather") then
        setBonus.addItems("Netch Leather", {
            "TR_m1_q_CuirassOfMobility", "T_De_Netch_Cuirass_01", "T_De_Netch_Cuirass_02",
            "T_De_Netch_Cuirass_03", "T_De_Netch_Cuirass_04", "T_De_Netch_Cuirass_05",
            "TR_m1_q_RancidCuirass_UNI", "T_De_Netch_Helm_01", "T_De_Netch_Helm_02",
            "T_De_Netch_Helm_03", "T_De_NetchRogue_Cuirass_01", "T_De_NetchRogue_Helm_01",
            "T_De_NetchRogue_Helm_02", "T_De_NetchStalker_Helm_01",
        })
    end
    if present("T_Imp_Newtscale_Boots_01") and setBonus.getSet("Newtscale") then
        setBonus.addItems("Newtscale", {
            "T_Imp_Newtscale_Boots_01", "T_Imp_Newtscale_Cuirass_01", "T_Imp_Newtscale_GauntletL_01",
            "T_Imp_Newtscale_GauntletR_01", "T_Imp_Newtscale_Greaves_01", "T_Imp_Newtscale_Helm_01",
            "T_Imp_Newtscale_PauldronL_01", "T_Imp_Newtscale_PauldronR_01",
        })
    end
    if present("T_Nor_Bearskin_Boots_01") and setBonus.getSet("Nordic") then
        setBonus.addItems("Nordic", {
            "T_Nor_Bearskin_Boots_01", "T_Nor_Bearskin_BracerL_01", "T_Nor_Bearskin_BracerL_Claw",
            "T_Nor_Bearskin_BracerR_01", "T_Nor_Bearskin_BracerR_Claw", "T_Nor_Bearskin_Greaves_01",
            "T_Nor_Bearskin_Helm_01", "T_Nor_Bearskin_Helm_Hiber", "T_Nor_Bearskin_PauldronL_01",
            "T_Nor_Bearskin_PauldronR_01", "T_Nor_Companion_Boots_01", "T_Nor_Companion_Cuirass_01",
            "T_Nor_Companion_GauntletL_01", "T_Nor_Companion_GauntletR_01", "T_Nor_Companion_Greaves_01",
            "T_Nor_Companion_Helm_01", "T_Nor_Companion_PauldronL_01", "T_Nor_Companion_PauldronR_01",
            "T_Nor_Guard_Boots_01", "T_Nor_Guard_Cuirass_01", "T_Nor_Guard_GauntletL_01",
            "T_Nor_Guard_GauntletR_01", "T_Nor_Guard_Greaves_01", "T_Nor_Guard_Helm_01",
            "T_Nor_Guard_PauldronL_01", "T_Nor_Guard_PauldronR_01", "T_Nor_Iron_Boots_01",
            "T_Nor_Iron_Boots_Leap", "T_Nor_Iron_Cuirass_Wintery", "T_Nor_Iron_GauntletL_01",
            "T_Nor_Iron_GauntletR_01", "T_Nor_Iron_Greaves_01", "T_Nor_Iron_PauldronL_01",
            "T_Nor_Iron_PauldronR_01", "T_Nor_Ironwood_Shield_01", "T_Nor_Ironwood_Shield_02",
            "T_Nor_Ringmail_Boots_01", "T_Nor_Ringmail_Boots_02", "T_Nor_Ringmail_BracerL_02",
            "T_Nor_Ringmail_BracerR_02", "T_Nor_Ringmail_Cuirass_01", "T_Nor_Ringmail_Greaves_01",
            "T_Nor_Ringmail_Greaves_02", "T_Nor_Ringmail_Helmet_01", "T_Nor_Ringmail_Helmet_02",
            "T_Nor_Ringmail_PauldronL_02", "T_Nor_Ringmail_PauldronR_02", "T_Nor_Sabrecat_Helm_01",
            "T_Nor_Sabrecat_Helm_02", "T_Nor_Sabrecat_Helm_Sight", "T_Nor_Steel_Boots_01",
            "T_Nor_Steel_Cuirass_01", "T_Nor_Steel_Cuirass_SteelHearth", "T_Nor_Steel_GauntletL_01",
            "T_Nor_Steel_GauntletR_01", "T_Nor_Steel_Greaves_01", "T_Nor_Steel_Helm_01",
            "T_Nor_Steel_PauldronL_01", "T_Nor_Steel_PauldronR_01", "T_Nor_Trollbone_Boots_01",
            "T_Nor_Trollbone_BracerL_01", "T_Nor_Trollbone_BracerR_01", "T_Nor_Trollbone_Greaves_01",
            "T_Nor_Trollbone_Greaves_Vigor", "T_Nor_Trollbone_PauldronL_01", "T_Nor_Trollbone_PauldronR_01",
            "T_Nor_UNI_Kvisahjaelmur", "T_Nor_UNI_PredatorsGrace", "T_Nor_UNI_SnowDrakePelt",
            "T_Nor_UNI_TargeBlooded", "T_Nor_Wood_Shield_01", "T_Nor_Wood_Shield_02",
            "T_Nor_Wood_Shield_03", "T_Nor_Wood_ShieldBuckler_01", "T_Nor_Wood_ShieldBuckler_02",
            "T_Nor_Wood_ShieldBuckler_03", "T_Nor_Wood_ShieldBuckler_04", "T_Nor_Wood_ShieldBuckler_05",
            "T_Nor_Wood_ShieldBuckler_06", "T_Nor_Wood_ShieldBuckler_07", "T_Nor_Wood_ShieldBuckler_08",
        })
    end
    if present("T_Orc_Regular_HelmOpen_01") and setBonus.getSet("Orcish") then
        setBonus.addItems("Orcish", {
            "T_Orc_Regular_HelmOpen_01", "TR_m4_orcish_boots_uni", "TR_m4_orcish_helmofbattle_uni",
            "TR_m4_TT_OrcNoCuirass", "TR_m4_TT_OrcNoGreaves", "TR_m4_TT_OrcNoHelm",
        })
    end
    if present("T_Orc_Leather_Boots_01") and setBonus.getSet("Orsimer") then
        setBonus.addItems("Orsimer", {
            "T_Orc_Leather_Boots_01", "T_Orc_Leather_Cuirass_01", "T_Orc_Leather_GauntletL_01",
            "T_Orc_Leather_GauntletR_01", "T_Orc_Leather_Greaves_01", "T_Orc_Leather_Helm_01",
            "T_Orc_Leather_PauldronL_01", "T_Orc_Leather_PauldronR_01", "T_Orc_Regular_HelmOpen_01",
            "TR_m4_orcish_boots_uni", "TR_m4_orcish_helmofbattle_uni", "TR_m4_TT_OrcNoCuirass",
            "TR_m4_TT_OrcNoGreaves", "TR_m4_TT_OrcNoHelm",
        })
    end
    if present("T_Nor_Ringmail_Boots_01") and setBonus.getSet("Ring Mail") then
        setBonus.addItems("Ring Mail", {
            "T_Nor_Ringmail_Boots_01", "T_Nor_Ringmail_Boots_02", "T_Nor_Ringmail_BracerL_02",
            "T_Nor_Ringmail_BracerR_02", "T_Nor_Ringmail_Cuirass_01", "T_Nor_Ringmail_Greaves_01",
            "T_Nor_Ringmail_Greaves_02", "T_Nor_Ringmail_Helmet_01", "T_Nor_Ringmail_Helmet_02",
            "T_Nor_Ringmail_PauldronL_02", "T_Nor_Ringmail_PauldronR_02",
        })
    end
    if present("T_Dwe_Scrap_boots") and setBonus.getSet("Scrap") then
        setBonus.addItems("Scrap", {
            "T_Dwe_Scrap_boots", "T_Dwe_Scrap_Bracer_L", "T_Dwe_Scrap_Bracer_R",
            "T_Dwe_Scrap_cuirass", "T_Dwe_Scrap_greaves", "T_Dwe_Scrap_helmet",
            "T_Dwe_Scrap_Pauldron_L", "T_Dwe_Scrap_Pauldron_R",
        })
    end
    if present("TR_m1_silver_duchguard_cuirass") and setBonus.getSet("Silver") then
        setBonus.addItems("Silver", {
            "TR_m1_silver_duchguard_cuirass", "T_Imp_Silver_Boots_01", "T_Imp_Silver_BracerL_01",
            "T_Imp_Silver_BracerR_01", "T_Imp_Silver_Cap_01", "T_Imp_Silver_Cap_02",
            "T_Imp_Silver_CuirassFW_01", "T_Imp_Silver_CuirassRed_01", "T_Imp_Silver_Greaves_01",
            "T_Imp_Silver_Helm_Mask", "T_Imp_Silver_PauldronL_01", "T_Imp_Silver_PauldronR_01",
        })
    end
    if present("T_Com_Steel_Boots_Consuming") and setBonus.getSet("Steel") then
        setBonus.addItems("Steel", {
            "T_Com_Steel_Boots_Consuming", "T_Com_Steel_Boots_Creeping", "T_Com_Steel_Boots_Glacial",
            "T_Com_Steel_Boots_Perfection", "T_Com_Steel_Cuirass_01", "T_Com_Steel_Cuirass_02",
            "T_Com_Steel_Cuirass_03", "T_Com_Steel_Cuirass_04", "T_Com_Steel_Cuirass_DuskDawn",
            "T_Com_Steel_Cuirass_FinalVirtue", "T_Com_Steel_Cuirass_Outermost", "T_Com_Steel_Cuirass_ScalyPelt",
            "T_Com_Steel_Cuirass_Steelhearth", "T_Com_Steel_GauntletL_RainFire", "T_Com_Steel_GauntletL_Scathing",
            "T_Com_Steel_GauntletL_Summer", "T_Com_Steel_GauntletL_Wonder", "T_Com_Steel_GauntletR_RainFire",
            "T_Com_Steel_GauntletR_Scathing", "T_Com_Steel_GauntletR_Summer", "T_Com_Steel_GauntletR_Wonder",
            "T_Com_Steel_Greaves_BitingPains", "T_Com_Steel_Greaves_Kings", "T_Com_Steel_Greaves_StampToad",
            "T_Com_Steel_Greaves_Unrequited", "T_Com_Steel_Helm_01", "T_Com_Steel_Helm_Despair",
            "T_Com_Steel_Helm_Open_01", "T_Com_Steel_Helm_Open_02", "T_Com_Steel_Helm_Preciptious",
            "T_Com_Steel_Helm_TongueWyrm", "T_Com_Steel_Helm_WindingRoad", "T_Com_Steel_PauldronL_01",
            "T_Com_Steel_PauldronL_02", "T_Com_Steel_PauldronL_03", "T_Com_Steel_PauldronL_MisHand",
            "T_Com_Steel_PauldronL_MonkeyApp", "T_Com_Steel_PauldronL_Sacred", "T_Com_Steel_PauldronL_WinterWin",
            "T_Com_Steel_PauldronR_01", "T_Com_Steel_PauldronR_02", "T_Com_Steel_PauldronR_03",
            "T_Com_Steel_PauldronR_MisHand", "T_Com_Steel_PauldronR_MonkeyApp", "T_Com_Steel_PauldronR_Sacred",
            "T_Com_Steel_PauldronR_WinterWin", "T_Com_SteelSpike_PauldronL_01", "T_Com_SteelSpike_PauldronR_01",
            "T_Imp_ColSteel1_Boots_01", "T_Imp_ColSteel1_Boots_02", "T_Imp_ColSteel1_Boots_03",
            "T_Imp_ColSteel1_Boots_04", "T_Imp_ColSteel1_BracerL_01", "T_Imp_ColSteel1_BracerL_02",
            "T_Imp_ColSteel1_BracerL_03", "T_Imp_ColSteel1_BracerL_04", "T_Imp_ColSteel1_BracerR_01",
            "T_Imp_ColSteel1_BracerR_02", "T_Imp_ColSteel1_BracerR_03", "T_Imp_ColSteel1_BracerR_04",
            "T_Imp_ColSteel1_Cuirass_01", "T_Imp_ColSteel1_Cuirass_02", "T_Imp_ColSteel1_Cuirass_03",
            "T_Imp_ColSteel1_Cuirass_04", "T_Imp_ColSteel1_Greaves_01", "T_Imp_ColSteel1_Greaves_02",
            "T_Imp_ColSteel1_Greaves_03", "T_Imp_ColSteel1_Greaves_04", "T_Imp_ColSteel1_Helm_01",
            "T_Imp_ColSteel1_Helm_02", "T_Imp_ColSteel1_Helm_03", "T_Imp_ColSteel1_Helm_04",
            "T_Imp_ColSteel1_PauldronL_01", "T_Imp_ColSteel1_PauldronL_02", "T_Imp_ColSteel1_PauldronL_03",
            "T_Imp_ColSteel1_PauldronL_04", "T_Imp_ColSteel1_PauldronR_01", "T_Imp_ColSteel1_PauldronR_02",
            "T_Imp_ColSteel1_PauldronR_03", "T_Imp_ColSteel1_PauldronR_04", "T_Imp_ColSteel_Boots_01",
            "T_Imp_ColSteel_Boots_02", "T_Imp_ColSteel_Boots_03", "T_Imp_ColSteel_Boots_04",
            "T_Imp_ColSteel_BracerL_03", "T_Imp_ColSteel_BracerL_04", "T_Imp_ColSteel_BracerR_03",
            "T_Imp_ColSteel_BracerR_04", "T_Imp_ColSteel_Cuirass_01", "T_Imp_ColSteel_Cuirass_02",
            "T_Imp_ColSteel_Cuirass_03", "T_Imp_ColSteel_Cuirass_04", "T_Imp_ColSteel_GauntletL_01",
            "T_Imp_ColSteel_GauntletL_02", "T_Imp_ColSteel_GauntletR_01", "T_Imp_ColSteel_GauntletR_02",
            "T_Imp_ColSteel_Greaves_01", "T_Imp_ColSteel_Greaves_02", "T_Imp_ColSteel_Greaves_03",
            "T_Imp_ColSteel_Greaves_04", "T_Imp_ColSteel_Helm_01", "T_Imp_ColSteel_Helm_02",
            "T_Imp_ColSteel_Helm_03", "T_Imp_ColSteel_Helm_04", "T_Imp_ColSteel_Helm_05",
            "T_Imp_ColSteel_Helm_06", "T_Imp_ColSteel_PauldronL_01", "T_Imp_ColSteel_PauldronL_02",
            "T_Imp_ColSteel_PauldronL_03", "T_Imp_ColSteel_PauldronL_04", "T_Imp_ColSteel_PauldronR_01",
            "T_Imp_ColSteel_PauldronR_02", "T_Imp_ColSteel_PauldronR_03", "T_Imp_ColSteel_PauldronR_04",
            "T_Nor_Steel_Boots_01", "T_Nor_Steel_Cuirass_01", "T_Nor_Steel_Cuirass_SteelHearth",
            "T_Nor_Steel_GauntletL_01", "T_Nor_Steel_GauntletR_01", "T_Nor_Steel_Greaves_01",
            "T_Nor_Steel_Helm_01", "T_Nor_Steel_PauldronL_01", "T_Nor_Steel_PauldronR_01",
            "TR_i2-235_steel_towershield", "TR_m3_steel_fireheart_i3-647",
        })
    end
    if present("T_Imp_StuddedLeather_Helm_01") and setBonus.getSet("Studded") then
        setBonus.addItems("Studded", {
            "T_Imp_StuddedLeather_Helm_01", "T_Imp_StuddedLeather_PauldrL_01", "T_Imp_StuddedLeather_PauldrR_01t",
            "T_Imp_StuddedLeather_Greaves_01", "T_Imp_StuddedLeather_Boots_01",
        })
    end
    if present("T_Imp_Templar_ShieldTower_01") and setBonus.getSet("Templar") then
        setBonus.addItems("Templar", {
            "T_Imp_Templar_ShieldTower_01",
        })
    end
    if present("T_Nor_Trollbone_Boots_01") and setBonus.getSet("Trollbone") then
        setBonus.addItems("Trollbone", {
            "T_Nor_Trollbone_Boots_01", "T_Nor_Trollbone_BracerL_01", "T_Nor_Trollbone_BracerR_01",
            "T_Nor_Trollbone_Greaves_01", "T_Nor_Trollbone_Greaves_Vigor", "T_Nor_Trollbone_PauldronL_01",
            "T_Nor_Trollbone_PauldronR_01",
        })
    end

    -- === Fold TR material variants into existing sets ===
    if present("T_Rga_Iron_Boots_01") and setBonus.getSet("Iron") then
        setBonus.addItems("Iron", {
            "T_Rga_Iron_Boots_01", "T_Rga_Iron_Boots_02", "T_Rga_Iron_BracerL_01",
            "T_Rga_Iron_BracerL_02", "T_Rga_Iron_BracerR_01", "T_Rga_Iron_BracerR_02",
            "T_Rga_Iron_Cuirass_01", "T_Rga_Iron_Cuirass_02", "T_Rga_Iron_Greaves_01",
            "T_Rga_Iron_Greaves_02", "T_Rga_Iron_Helm_01", "T_Rga_Iron_Helm_02",
            "T_Rga_Iron_PauldronL_01", "T_Rga_Iron_PauldronL_02", "T_Rga_Iron_PauldronR_01",
            "T_Rga_Iron_PauldronR_02",
        })
    end
    if present("T_Rga_Steel_Boots_01") and setBonus.getSet("Steel") then
        setBonus.addItems("Steel", {
            "T_Rga_Steel_Boots_01", "T_Rga_Steel_Cuirass_01", "T_Rga_Steel_GauntletL_01",
            "T_Rga_Steel_GauntletR_01", "T_Rga_Steel_Greaves_01", "T_Rga_Steel_Helm_01",
            "T_Rga_Steel_PauldronL_01", "T_Rga_Steel_PauldronR_01",
        })
    end
    if present("T_Imp_ColLamellar_Boots_01") and setBonus.getSet("Lamellar") then
        setBonus.addItems("Lamellar", {
            "T_Imp_ColLamellar_Boots_01", "T_Imp_ColLamellar_BracerL_01", "T_Imp_ColLamellar_BracerR_01",
            "T_Imp_ColLamellar_Cuirass_01", "T_Imp_ColLamellar_Greaves_01", "T_Imp_ColLamellar_HelmOpen_01",
            "T_Imp_ColLamellar_Helm_01", "T_Imp_ColLamellar_MaskHelm_01", "T_Imp_ColLamellar_MaskHelm_02",
            "T_Imp_ColLamellar_PauldronL_01", "T_Imp_ColLamellar_PauldronR_01",
        })
    end
    if present("T_Dwe_Gold_Boots") and setBonus.getSet("Dwemer") then
        setBonus.addItems("Dwemer", {
            "T_Dwe_Gold_Boots", "T_Dwe_Gold_Cuirass", "T_Dwe_Gold_Gauntlet_L",
            "T_Dwe_Gold_Gauntlet_R", "T_Dwe_Gold_Greaves", "T_Dwe_Gold_Helm",
            "T_Dwe_Gold_HelmOpen", "T_Dwe_Gold_Pauldron_L", "T_Dwe_Gold_Pauldron_R",
        })
    end
    if present("T_Nor_Leather1_BarcerL_01") and setBonus.getSet("Leather") then
        setBonus.addItems("Leather", {
            "T_Nor_Leather1_BarcerL_01", "T_Nor_Leather1_BarcerR_01", "T_Nor_Leather1_Boots_01",
            "T_Nor_Leather1_Cuirass_01", "T_Nor_Leather1_Greaves_01", "T_Nor_Leather1_Helm_01",
            "T_Nor_Leather1_PauldL_01", "T_Nor_Leather1_PauldR_01", "T_Nor_Leather2_Boots_01",
            "T_Nor_Leather2_BracerL_01", "T_Nor_Leather2_BracerR_01", "T_Nor_Leather2_Cuirass_01",
            "T_Nor_Leather2_Greaves_01", "T_Nor_Leather2_Helm_01", "T_Nor_Leather2_PauldL_01",
            "T_Nor_Leather2_PauldR_01",
        })
    end
    if present("T_QyC_Shellmold_Boots_01") and setBonus.getSet("Shellmold") then
        setBonus.addItems("Shellmold", {
            "T_QyC_Shellmold_Boots_01", "T_QyC_Shellmold_BracerL_01", "T_QyC_Shellmold_BracerR_01",
            "T_QyC_Shellmold_Cuirass_01", "T_QyC_Shellmold_Greaves_01", "T_QyC_Shellmold_Helm_01",
            "T_QyC_Shellmold_PauldL_01", "T_QyC_Shellmold_PauldR_01",
        })
    end
    if present("T_De_MoragTong_Boots_01") and setBonus.getSet("Morag Tong") then
        setBonus.addItems("Morag Tong", {
            "T_De_MoragTong_Boots_01", "T_De_MoragTong_BracerL_01", "T_De_MoragTong_BracerR_01",
            "T_De_MoragTong_Cuirass_01", "T_De_MoragTong_Greaves_01", "T_De_MoragTong_PauldronL_01",
            "T_De_MoragTong_PauldronR_01",
        })
    end

    -- ---------------------------------------------------------------------
    -- Cultural umbrellas cover the VANILLA gear of the same craft, not just
    -- the TR-made pieces, so identical-looking items behave alike (a vanilla
    -- chitin gauntlet counts as Dunmer-made exactly like TR's mainland one).
    -- Done as a runtime union so items other add-ons fold into the source
    -- sets are inherited automatically. This module runs after the base sets
    -- and the OAAB/NOD/AATL companions, so the source lists are complete.
    -- ---------------------------------------------------------------------
    local function extendSet(umbrella, sources)
        if not setBonus.getSet(umbrella) then return end
        for _, src in ipairs(sources) do
            local from = setBonus.getSet(src)
            if from and from.items then
                setBonus.addItems(umbrella, from.items)
            end
        end
    end
    extendSet("Dunmer", { "Chitin", "Bonemold", "Netch Leather", "Dreugh", "Cephalopod", "House Indoril" })
    extendSet("Altmer", { "Glass" })
    extendSet("Orsimer", { "Orcish" })

    -- ---------------------------------------------------------------------
    -- Visibility: TR item ids drift between Tamriel_Data releases, and a set
    -- whose gate item vanished used to disappear silently. Report anything
    -- this module was expected to register but didn't.
    -- ---------------------------------------------------------------------
    local expectedTRSets = {
        "Alessian Bronze", "Alit Hide", "Altmer", "Ancient Nordic", "Anvil",
        "Argonian", "Ayleid", "Bal-Darum", "Breton", "Cataphract", "Chap-thil",
        "Chev-Aram", "Chuzei", "Colovian Leather", "Companions", "Crown Guard",
        "Daedric Hide", "Domina", "Dunmer", "Ebonweave", "Falkreath Guard",
        "Gah'Kogo", "Gilded Glass", "Gold", "Golden Saint", "Guar Hide",
        "House Direnni", "House Redoran", "Kagouti Hide", "Kalantar",
        "Klibanion", "Kragen", "Kvetchi", "Lamellar", "Mananaut",
        "Manatee Leather", "Maormer", "Maradlai", "Militia", "Molecrab",
        "Narsis Watch", "Navy", "Necrom Guard", "Nibenese", "Oloman",
        "Quey Chitin", "Reach", "Reach Royal Guard", "Red Dome Templar",
        "Redguard", "Redguard Iron Lamellar", "Reman", "Rihad Guard",
        "Riverwatch", "Rourken", "Sacred Lands", "Saliache", "Shellmold",
        "Shinathi Chitin", "Shipal-Arai", "Skingrad", "Sutch Mail", "Thirr",
        "Toadscale", "Watchman", "Wenbone", "Wormmouth",
    }
    for _, n in ipairs(expectedTRSets) do
        if not setBonus.getSet(n) then
            log:warn("SetBonusTR: set '%s' was NOT registered -- its gate item is missing from this Tamriel_Data version.", n)
        end
    end

    -- >>> SETBONUS CLASS ARMOR (auto-generated by gen_class_sets.py) >>>
    if setBonus.getSet("Heavy Armor") then
        setBonus.addItems("Heavy Armor", {
            "t_bre_tourneyheater_shield_eec", "t_bre_tourneyheater_shield_fg", "t_bre_tourneyheater_shield_hdre", "t_bre_tourneyheater_shield_hhla",
            "t_bre_tourneyheater_shield_hind", "t_bre_tourneyheater_shield_hred", "t_bre_tourneyheater_shield_htel", "t_bre_tourneyheater_shield_mas",
            "t_bre_tourneyheater_shield_mg", "t_bre_tourneyheater_shield_oe", "t_bre_uni_lordlyheatershield", "t_bre_uni_trickstershield",
            "t_bre_woodenheater_shield_01", "t_bre_woodenheater_shield_02", "t_bre_woodenheater_shield_03", "t_bre_woodenheater_shield_04",
            "t_bre_woodenheater_shield_05", "t_bre_woodenheater_shield_06", "t_bre_woodenheater_shield_07", "t_bre_woodenheater_shield_08",
            "t_bre_woodenheater_shield_09", "t_bre_woodenheater_shield_10", "t_bre_woodenheater_shield_11", "t_bre_woodenheater_shield_12",
            "t_bre_woodenheater_shield_13", "t_bre_woodenheater_shield_14", "t_bre_woodenheater_shield_15", "t_bre_woodenheater_shield_glyph",
            "t_bre_woodenheater_shield_gn", "t_bre_woodenheater_shield_rose", "t_com_ironskull_pauldronl_01", "t_com_ironskull_pauldronr_01",
            "t_com_ironspike_helm_01", "t_com_ironspike_helm_shield", "t_com_ironspike_pauldronl_01", "t_com_ironspike_pauldronr_01",
            "t_com_iron_boots_01", "t_com_iron_boots_02", "t_com_iron_boots_shield", "t_com_iron_bracerl_01",
            "t_com_iron_bracerl_02", "t_com_iron_bracerl_blunt", "t_com_iron_bracerr_01", "t_com_iron_bracerr_02",
            "t_com_iron_bracerr_blunt", "t_com_iron_cuirass_01", "t_com_iron_cuirass_02", "t_com_iron_cuirass_strength",
            "t_com_iron_gauntletl_axe", "t_com_iron_gauntletr_axe", "t_com_iron_greaves_01", "t_com_iron_greaves_02",
            "t_com_iron_helm_01", "t_com_iron_helm_02", "t_com_iron_helm_03", "t_com_iron_helm_04",
            "t_com_iron_helm_open", "t_com_iron_helm_open_02", "t_com_iron_pauldronl_01", "t_com_iron_pauldronl_02",
            "t_com_iron_pauldronr_01", "t_com_iron_pauldronr_02", "t_com_iron_shield_fire", "t_com_steelspike_pauldronl_01",
            "t_com_steelspike_pauldronr_01", "t_com_steel_boots_consuming", "t_com_steel_boots_creeping", "t_com_steel_boots_glacial",
            "t_com_steel_boots_perfection", "t_com_steel_boots_shield", "t_com_steel_cuirass_01", "t_com_steel_cuirass_02",
            "t_com_steel_cuirass_03", "t_com_steel_cuirass_04", "t_com_steel_cuirass_crusader", "t_com_steel_cuirass_duskdawn",
            "t_com_steel_cuirass_finalvirtue", "t_com_steel_cuirass_outermost", "t_com_steel_cuirass_scalypelt", "t_com_steel_cuirass_steelhearth",
            "t_com_steel_gauntletl_rainfire", "t_com_steel_gauntletl_scathing", "t_com_steel_gauntletl_summer", "t_com_steel_gauntletl_wonder",
            "t_com_steel_gauntletr_rainfire", "t_com_steel_gauntletr_scathing", "t_com_steel_gauntletr_summer", "t_com_steel_gauntletr_wonder",
            "t_com_steel_greaves_bitingpains", "t_com_steel_greaves_kings", "t_com_steel_greaves_stamptoad", "t_com_steel_greaves_unrequited",
            "t_com_steel_helm_01", "t_com_steel_helm_despair", "t_com_steel_helm_open_01", "t_com_steel_helm_open_02",
            "t_com_steel_helm_preciptious", "t_com_steel_helm_tonguewyrm", "t_com_steel_helm_turnundead", "t_com_steel_helm_windingroad",
            "t_com_steel_pauldronl_01", "t_com_steel_pauldronl_02", "t_com_steel_pauldronl_03", "t_com_steel_pauldronl_mishand",
            "t_com_steel_pauldronl_monkeyapp", "t_com_steel_pauldronl_sacred", "t_com_steel_pauldronl_winterwin", "t_com_steel_pauldronr_01",
            "t_com_steel_pauldronr_02", "t_com_steel_pauldronr_03", "t_com_steel_pauldronr_mishand", "t_com_steel_pauldronr_monkeyapp",
            "t_com_steel_pauldronr_sacred", "t_com_steel_pauldronr_winterwin", "t_com_steel_shield_silence", "t_com_steel_tshield_scamp",
            "t_com_uni_handofglory_helnim", "t_com_uni_requiem", "t_cr_goblin_helm_01", "t_cr_goblin_pauldronl_01",
            "t_cr_goblin_pauldronr_01", "t_dae_alternate2_boots_01", "t_dae_alternate2_cuirass_01", "t_dae_alternate2_gauntletl_01",
            "t_dae_alternate2_gauntletr_01", "t_dae_alternate2_greaves_01", "t_dae_alternate2_helmopen_01", "t_dae_alternate2_helm_01",
            "t_dae_alternate2_pauldronl_01", "t_dae_alternate2_pauldronr_01", "t_dae_alternate_boots_01", "t_dae_alternate_buckler_01",
            "t_dae_alternate_cuirass_01", "t_dae_alternate_gauntletl_01", "t_dae_alternate_gauntletr_01", "t_dae_alternate_greaves_01",
            "t_dae_alternate_helmopen_01", "t_dae_alternate_helm_01", "t_dae_alternate_pauldronl_01", "t_dae_alternate_pauldronr_01",
            "t_dae_lord_boots_01", "t_dae_lord_gauntletl_01", "t_dae_lord_gauntletr_01", "t_dae_lord_helm_01",
            "t_dae_lord_pauldronl_01", "t_dae_lord_pauldronr_01", "t_dae_regular_helmaberration_01", "t_dae_regular_helmconsolat_01",
            "t_dae_regular_helmhumiliat_01", "t_dae_regular_helmhumiliat_02", "t_dae_regular_helmrebellion_01", "t_dae_regular_helmrenewal_01",
            "t_dae_regular_pauldronl_01", "t_dae_regular_pauldronr_01", "t_dae_regular_shieldtower_01", "t_dae_uni_bootsofpeace_01",
            "t_dae_uni_fearstruck", "t_dae_uni_helmlightwithin_01", "t_dae_uni_lmethatspauldron", "t_dae_uni_rmethatspauldron",
            "t_de_almarula_helm_uni", "t_de_ebony_helmopen_01", "t_de_ebony_helm_02", "t_de_hvchit_boots",
            "t_de_hvchit_cuirass", "t_de_hvchit_gauntlet_l", "t_de_hvchit_gauntlet_r", "t_de_hvchit_greaves",
            "t_de_hvchit_helmet", "t_de_hvchit_pauldron_l", "t_de_hvchit_pauldron_r", "t_de_uni_eboncres_narsis",
            "t_de_uni_ebonycuirass_pasoroth", "t_de_uni_gildedslavebracer_l", "t_de_uni_gildedslavebracer_r", "t_de_uni_pasoroth_boots",
            "t_de_uni_pasoroth_cuirass", "t_de_uni_pasoroth_gaunt_l", "t_de_uni_pasoroth_gaunt_r", "t_de_uni_pasoroth_greaves",
            "t_de_uni_pasoroth_helm", "t_de_uni_pasoroth_pauld_l", "t_de_uni_pasoroth_pauld_r", "t_de_uni_shield_abernanit",
            "t_de_uni_veloth_pauld_l", "t_de_uni_veloth_pauld_r", "t_dwe_gold_boots", "t_dwe_gold_cuirass",
            "t_dwe_gold_gauntlet_l", "t_dwe_gold_gauntlet_r", "t_dwe_gold_greaves", "t_dwe_gold_helm",
            "t_dwe_gold_pauldron_l", "t_dwe_gold_pauldron_r", "t_dwe_regular_cuirass_lightning", "t_dwe_regular_shieldtower_01",
            "t_dwe_rourken_boots_01", "t_dwe_rourken_bracer_l_01", "t_dwe_rourken_bracer_r_01", "t_dwe_rourken_cuirass_01",
            "t_dwe_rourken_greaves_01", "t_dwe_rourken_helm_01", "t_dwe_rourken_pauld_l_01", "t_dwe_rourken_pauld_r_01",
            "t_dwe_uni_maskofpurity", "t_he_steel_shield_01", "t_imp_alessianbrnz_boots_01", "t_imp_alessianbrnz_cuirass_01",
            "t_imp_alessianbrnz_gauntletl_01", "t_imp_alessianbrnz_gauntletr_01", "t_imp_alessianbrnz_helm_01", "t_imp_alessianbrnz_pauldronl_01",
            "t_imp_alessianbrnz_pauldronr_01", "t_imp_alessianbrnz_tshield_01", "t_imp_coliron1_boots_01", "t_imp_coliron1_boots_02",
            "t_imp_coliron1_boots_03", "t_imp_coliron1_boots_04", "t_imp_coliron1_cuirass_01", "t_imp_coliron1_cuirass_02",
            "t_imp_coliron1_cuirass_03", "t_imp_coliron1_cuirass_04", "t_imp_coliron1_gauntletl_01", "t_imp_coliron1_gauntletl_02",
            "t_imp_coliron1_gauntletl_03", "t_imp_coliron1_gauntletl_04", "t_imp_coliron1_gauntletr_01", "t_imp_coliron1_gauntletr_02",
            "t_imp_coliron1_gauntletr_03", "t_imp_coliron1_gauntletr_04", "t_imp_coliron1_greaves_01", "t_imp_coliron1_greaves_02",
            "t_imp_coliron1_greaves_03", "t_imp_coliron1_greaves_04", "t_imp_coliron1_helm_01", "t_imp_coliron1_helm_02",
            "t_imp_coliron1_helm_03", "t_imp_coliron1_helm_04", "t_imp_coliron1_pauldronl_01", "t_imp_coliron1_pauldronl_02",
            "t_imp_coliron1_pauldronl_03", "t_imp_coliron1_pauldronl_04", "t_imp_coliron1_pauldronr_01", "t_imp_coliron1_pauldronr_02",
            "t_imp_coliron1_pauldronr_03", "t_imp_coliron1_pauldronr_04", "t_imp_coliron_boots_01", "t_imp_coliron_bracerl_01",
            "t_imp_coliron_bracerr_01", "t_imp_coliron_cuirass_01", "t_imp_coliron_greaves_01", "t_imp_coliron_helmet_01",
            "t_imp_coliron_helmet_02", "t_imp_coliron_pauldronl_01", "t_imp_coliron_pauldronr_01", "t_imp_colsteel1_boots_01",
            "t_imp_colsteel1_boots_02", "t_imp_colsteel1_boots_03", "t_imp_colsteel1_boots_04", "t_imp_colsteel1_bracerl_01",
            "t_imp_colsteel1_bracerl_02", "t_imp_colsteel1_bracerl_03", "t_imp_colsteel1_bracerl_04", "t_imp_colsteel1_bracerr_01",
            "t_imp_colsteel1_bracerr_02", "t_imp_colsteel1_bracerr_03", "t_imp_colsteel1_bracerr_04", "t_imp_colsteel1_cuirass_01",
            "t_imp_colsteel1_cuirass_02", "t_imp_colsteel1_cuirass_03", "t_imp_colsteel1_cuirass_04", "t_imp_colsteel1_greaves_01",
            "t_imp_colsteel1_greaves_02", "t_imp_colsteel1_greaves_03", "t_imp_colsteel1_greaves_04", "t_imp_colsteel1_helm_01",
            "t_imp_colsteel1_helm_02", "t_imp_colsteel1_helm_03", "t_imp_colsteel1_helm_04", "t_imp_colsteel1_pauldronl_01",
            "t_imp_colsteel1_pauldronl_02", "t_imp_colsteel1_pauldronl_03", "t_imp_colsteel1_pauldronl_04", "t_imp_colsteel1_pauldronr_01",
            "t_imp_colsteel1_pauldronr_02", "t_imp_colsteel1_pauldronr_03", "t_imp_colsteel1_pauldronr_04", "t_imp_colsteel_boots_01",
            "t_imp_colsteel_boots_02", "t_imp_colsteel_boots_03", "t_imp_colsteel_boots_04", "t_imp_colsteel_bracerl_03",
            "t_imp_colsteel_bracerl_04", "t_imp_colsteel_bracerr_03", "t_imp_colsteel_bracerr_04", "t_imp_colsteel_cuirass_01",
            "t_imp_colsteel_cuirass_02", "t_imp_colsteel_cuirass_03", "t_imp_colsteel_cuirass_04", "t_imp_colsteel_gauntletl_01",
            "t_imp_colsteel_gauntletl_02", "t_imp_colsteel_gauntletr_01", "t_imp_colsteel_gauntletr_02", "t_imp_colsteel_greaves_01",
            "t_imp_colsteel_greaves_02", "t_imp_colsteel_greaves_03", "t_imp_colsteel_greaves_04", "t_imp_colsteel_helm_01",
            "t_imp_colsteel_helm_02", "t_imp_colsteel_helm_03", "t_imp_colsteel_helm_04", "t_imp_colsteel_helm_05",
            "t_imp_colsteel_helm_06", "t_imp_colsteel_pauldronl_01", "t_imp_colsteel_pauldronl_02", "t_imp_colsteel_pauldronl_03",
            "t_imp_colsteel_pauldronl_04", "t_imp_colsteel_pauldronr_01", "t_imp_colsteel_pauldronr_02", "t_imp_colsteel_pauldronr_03",
            "t_imp_colsteel_pauldronr_04", "t_imp_ebony_boots", "t_imp_ebony_bracerl", "t_imp_ebony_bracerr",
            "t_imp_ebony_cuirass", "t_imp_ebony_helmet_01", "t_imp_ebony_helmet_02", "t_imp_ebony_helmet_02b",
            "t_imp_ebony_helmet_03", "t_imp_ebony_helmet_03b", "t_imp_ebony_pauldronl", "t_imp_ebony_pauldronr",
            "t_imp_ebony_shieldtower_01", "t_imp_gold_boots_02", "t_imp_gold_bracerl_02", "t_imp_gold_bracerr_02",
            "t_imp_gold_cuirass_02", "t_imp_gold_gauntletl_02", "t_imp_gold_gauntletr_02", "t_imp_gold_greaves_02",
            "t_imp_gold_helm_02", "t_imp_gold_pauldronl_02", "t_imp_gold_pauldronr_02", "t_imp_gold_shield_01",
            "t_imp_guardtown1_boots_01", "t_imp_guardtown1_helmanv_01", "t_imp_guardtown1_helmstr_01", "t_imp_guardtown1_helmsut_01",
            "t_imp_guardtown1_helm_01", "t_imp_guardtown2_helmart_01", "t_imp_guardtown2_helmbru_01", "t_imp_guardtown2_helmcho_01",
            "t_imp_guardtown2_helm_01", "t_imp_guardtown3_boots_01", "t_imp_guardtown3_gauntletl_01", "t_imp_guardtown3_gauntletr_01",
            "t_imp_guardtown3_greaves_01", "t_imp_guardtown3_helmkva_01", "t_imp_guardtown3_helmsar_01", "t_imp_guardtown3_helmskn_01",
            "t_imp_guardtown3_helm_01", "t_imp_militia_boots_01", "t_imp_militia_greaves_01", "t_imp_militia_helm_01",
            "t_imp_militia_pauldronl_01", "t_imp_militia_pauldronr_01", "t_imp_mothherder_helmet_01", "t_imp_navyoff_boots_01",
            "t_imp_navyoff_bracerl_01", "t_imp_navyoff_bracerr_01", "t_imp_navyoff_cuirass_01", "t_imp_navyoff_greaves_01",
            "t_imp_navyoff_helmet_01", "t_imp_navyoff_pauldronl_01", "t_imp_navyoff_pauldronr_01", "t_imp_nibbronze_boots_01",
            "t_imp_nibbronze_bracerl_01", "t_imp_nibbronze_bracerr_01", "t_imp_nibbronze_cuirass_01", "t_imp_nibbronze_greaves_01",
            "t_imp_nibbronze_helm_01", "t_imp_nibbronze_pauldronl_01", "t_imp_nibbronze_pauldronr_01", "t_imp_rddmtmp_boots_01",
            "t_imp_rddmtmp_bracerl_01", "t_imp_rddmtmp_bracerr_01", "t_imp_rddmtmp_cuirass_01", "t_imp_rddmtmp_greaves_01",
            "t_imp_rddmtmp_helmet_01", "t_imp_rddmtmp_pauldronl_01", "t_imp_rddmtmp_pauldronr_01", "t_imp_rddmtmp_shield_01",
            "t_imp_silver_boots_01", "t_imp_silver_bracerl_01", "t_imp_silver_bracerr_01", "t_imp_silver_cap_01",
            "t_imp_silver_cap_02", "t_imp_silver_cuirassfw_01", "t_imp_silver_cuirassred_01", "t_imp_silver_greaves_01",
            "t_imp_silver_helm_mask", "t_imp_silver_pauldronl_01", "t_imp_silver_pauldronr_01", "t_imp_steel_helm_health",
            "t_imp_templar_shieldtower_01", "t_imp_uni_blacksmithshandl", "t_imp_uni_blacksmithshandr", "t_imp_uni_bracerl_bifurication",
            "t_imp_uni_bracerr_bifurication", "t_imp_uni_dragoneye", "t_imp_uni_evergaurd", "t_imp_uni_urielshield_01",
            "t_imp_uni_queennagheacuir", "t_imp_wood_shieldtower_01", "t_kha_copper_shield_01", "t_nor_ancient_boots_01",
            "t_nor_ancient_bracerl_01", "t_nor_ancient_bracerr_01", "t_nor_ancient_cuirass_01", "t_nor_ancient_greaves_01",
            "t_nor_ancient_helm_01", "t_nor_ancient_helm_02", "t_nor_ancient_helm_03", "t_nor_ancient_pauldronl_01",
            "t_nor_ancient_pauldronl_02", "t_nor_ancient_pauldronr_01", "t_nor_ancient_pauldronr_02", "t_nor_ancient_shield",
            "t_nor_ancient_shield_01", "t_nor_companion_helm_01", "t_nor_iron_boots_01", "t_nor_iron_boots_leap",
            "t_nor_iron_cuirass_wintery", "t_nor_iron_gauntletl_01", "t_nor_iron_gauntletr_01", "t_nor_iron_greaves_01",
            "t_nor_iron_helm_resistfrost", "t_nor_iron_pauldronl_01", "t_nor_iron_pauldronr_01", "t_nor_rearoy_boots_01",
            "t_nor_rearoy_bracerl_01", "t_nor_rearoy_bracerr_01", "t_nor_rearoy_cuirass_01", "t_nor_rearoy_helm_01",
            "t_nor_rearoy_pauldronl_01", "t_nor_rearoy_pauldronr_01", "t_nor_steel_boots_01", "t_nor_steel_cuirass_01",
            "t_nor_steel_cuirass_steelhearth", "t_nor_steel_gauntletl_01", "t_nor_steel_gauntletr_01", "t_nor_steel_greaves_01",
            "t_nor_steel_helm_01", "t_nor_steel_pauldronl_01", "t_nor_steel_pauldronr_01", "t_nor_trollbone_boots_01",
            "t_nor_trollbone_bracerl_01", "t_nor_trollbone_bracerr_01", "t_nor_trollbone_greaves_01", "t_nor_trollbone_greaves_vigor",
            "t_nor_trollbone_pauldronl_01", "t_nor_trollbone_pauldronr_01", "t_nor_uni_kvisahjaelmur", "t_nor_uni_targeblooded",
            "t_qyk_chitin_boots_01", "t_qyk_chitin_cuirass_01", "t_qyk_chitin_gauntletl_01", "t_qyk_chitin_gauntletr_01",
            "t_qyk_chitin_greaves_01", "t_qyk_chitin_helmet_01", "t_qyk_chitin_pauldronl_01", "t_qyk_chitin_pauldronr_01",
            "t_rga_ironlamellar_boots_01", "t_rga_ironlamellar_bracer_l_01", "t_rga_ironlamellar_bracer_r_01", "t_rga_ironlamellar_cuirass_01",
            "t_rga_ironlamellar_greaves_01", "t_rga_ironlamellar_helm_01", "t_rga_ironlamellar_pauld_l_01", "t_rga_ironlamellar_pauld_r_01",
            "t_rga_iron_boots_01", "t_rga_iron_boots_02", "t_rga_iron_bracerl_01", "t_rga_iron_bracerl_02",
            "t_rga_iron_bracerr_01", "t_rga_iron_bracerr_02", "t_rga_iron_cuirass_01", "t_rga_iron_cuirass_02",
            "t_rga_iron_greaves_01", "t_rga_iron_greaves_02", "t_rga_iron_helm_01", "t_rga_iron_helm_02",
            "t_rga_iron_pauldronl_01", "t_rga_iron_pauldronl_02", "t_rga_iron_pauldronr_01", "t_rga_iron_pauldronr_02",
            "t_rga_steel_boots_01", "t_rga_steel_cuirass_01", "t_rga_steel_gauntletl_01", "t_rga_steel_gauntletr_01",
            "t_rga_steel_greaves_01", "t_rga_steel_helm_01", "t_rga_steel_pauldronl_01", "t_rga_steel_pauldronr_01",
        })
    end
    if setBonus.getSet("Medium Armor") then
        setBonus.addItems("Medium Armor", {
            "t_aka_regular_shield_01", "t_arg_hist_cuirass_01", "t_arg_hist_cuirass_freedom", "t_arg_hist_cuirass_visitor",
            "t_bre_mithril_boots_01", "t_bre_mithril_cuirass_01", "t_bre_mithril_gauntlet_l_01", "t_bre_mithril_gauntlet_r_01",
            "t_bre_mithril_greaves_01", "t_bre_mithril_helm_01", "t_bre_mithril_helm_02", "t_bre_mithril_pauldron_l_01",
            "t_bre_mithril_pauldron_r_01", "t_bre_mithril_shield_01", "t_com_adamant_helm_01", "t_com_adamant_shield_01",
            "t_com_adamant_towershield_01", "t_com_chain_cuirass_01", "t_com_chain_cuirass_02", "t_com_chain_cuirass_03",
            "t_dae_gold_boots_01", "t_dae_gold_cuirass_01", "t_dae_gold_gauntletl_01", "t_dae_gold_gauntletr_01",
            "t_dae_gold_greaves_01", "t_dae_gold_helm_01", "t_dae_gold_pauldronl_01", "t_dae_gold_pauldronr_01",
            "t_dae_uni_bootsofatronach", "t_dae_uni_polyhedrascope_01", "t_de_bonemoldhearthguardboots", "t_de_bonemoldhearthguardcuirass",
            "t_de_bonemoldhearthguardg_l", "t_de_bonemoldhearthguardg_r", "t_de_bonemoldhearthguardgreaves", "t_de_bonemoldhearthguardhelm",
            "t_de_bonemoldhearthguardp_l", "t_de_bonemoldhearthguardp_r", "t_de_bonemoldkrage_boots_01", "t_de_bonemoldkrage_cuirass_01",
            "t_de_bonemoldkrage_gauntletl_01", "t_de_bonemoldkrage_gauntletr_01", "t_de_bonemoldkrage_greaves_01", "t_de_bonemoldkrage_helm_01",
            "t_de_bonemoldkrage_pauldronl_01", "t_de_bonemoldkrage_pauldronr_01", "t_de_bonemoldkragen_helm_01", "t_de_bonemoldmarad_cuirass_01",
            "t_de_bonemoldmarad_cuirass_fire", "t_de_bonemoldmarad_helm_01", "t_de_bonemoldmarad_helm_02", "t_de_bonemoldmarad_helm_frost",
            "t_de_bonemoldmarad_pauldronl_01", "t_de_bonemoldmarad_pauldronr_01", "t_de_bonemoldmarad_shield_01", "t_de_bonemoldmarad_shield_fire",
            "t_de_bonemoldsacred_boots_01", "t_de_bonemoldsacred_cuirass_01", "t_de_bonemoldsacred_gauntl_01", "t_de_bonemoldsacred_gauntr_01",
            "t_de_bonemoldsacred_helm_01", "t_de_bonemoldsacred_pauldl_01", "t_de_bonemoldsacred_pauldr_01", "t_de_bonemoldsammas_helm_01",
            "t_de_bonemold_bracerl_longblade", "t_de_bonemold_bracerr_longblade", "t_de_bonemold_chuzei_boots", "t_de_bonemold_chuzei_boots_e",
            "t_de_bonemold_chuzei_bracerl", "t_de_bonemold_chuzei_bracerl_e", "t_de_bonemold_chuzei_bracerr", "t_de_bonemold_chuzei_bracerr_e",
            "t_de_bonemold_chuzei_cuirass", "t_de_bonemold_chuzei_cuirass_e", "t_de_bonemold_chuzei_greaves", "t_de_bonemold_chuzei_greaves_e",
            "t_de_bonemold_chuzei_helm_e", "t_de_bonemold_chuzei_helm_fshld", "t_de_bonemold_chuzei_pauldl", "t_de_bonemold_chuzei_pauldl_e",
            "t_de_bonemold_chuzei_pauldr", "t_de_bonemold_chuzei_pauldr_e", "t_de_bonemold_cuirass_seryn", "t_de_bonemold_cuirass_spite",
            "t_de_bonemold_cuirass_stonewall", "t_de_bonemold_dagoth_shield_01", "t_de_bonemold_helmopen_01", "t_de_bonemold_helmrider_01",
            "t_de_bonemold_indoril_shield_01", "t_de_bonemold_mora_boots_01", "t_de_bonemold_mora_brcrl_01", "t_de_bonemold_mora_brcrr_01",
            "t_de_bonemold_mora_cuir_01", "t_de_bonemold_mora_greaves_01", "t_de_bonemold_mora_helm_01", "t_de_bonemold_mora_pauldl_01",
            "t_de_bonemold_mora_pauldr_01", "t_de_bonemold_orethan_boots_01", "t_de_bonemold_orethan_brcrl_01", "t_de_bonemold_orethan_brcrr_01",
            "t_de_bonemold_orethan_cuir_01", "t_de_bonemold_orethan_grvs_01", "t_de_bonemold_orethan_helm_01", "t_de_bonemold_orethan_pauldl_01",
            "t_de_bonemold_orethan_pauldr_01", "t_de_bonemold_shield_skeleton", "t_de_bonemold_stone_boots", "t_de_bonemold_stone_cuirass",
            "t_de_bonemold_stone_gauntletl", "t_de_bonemold_stone_gauntletr", "t_de_bonemold_stone_greaves", "t_de_bonemold_stone_helm",
            "t_de_bonemold_stone_pauldl", "t_de_bonemold_stone_pauldr", "t_de_bonemold_tshield_gbonewalk", "t_de_bonemold_ulvra_boots",
            "t_de_bonemold_ulvra_bracerl", "t_de_bonemold_ulvra_bracerr", "t_de_bonemold_ulvra_cuirass", "t_de_bonemold_ulvra_greaves",
            "t_de_bonemold_ulvra_helm", "t_de_bonemold_ulvra_pauldl", "t_de_bonemold_ulvra_pauldr", "t_de_bonemold_water_boots",
            "t_de_bonemold_water_boots_swim", "t_de_bonemold_water_bracerl", "t_de_bonemold_water_bracerr", "t_de_bonemold_water_cuirass",
            "t_de_bonemold_water_greaves", "t_de_bonemold_water_helm", "t_de_bonemold_water_pauldl", "t_de_bonemold_water_pauldr",
            "t_de_canyonwatch_boots_01", "t_de_canyonwatch_boots_jump", "t_de_canyonwatch_bracerl_01", "t_de_canyonwatch_bracerr_01",
            "t_de_canyonwatch_celerity", "t_de_canyonwatch_cuirass_01", "t_de_canyonwatch_greaves_01", "t_de_canyonwatch_helm_01",
            "t_de_canyonwatch_helm_attack", "t_de_canyonwatch_pauldronl_01", "t_de_canyonwatch_pauldronr_01", "t_de_dresbonemold_boots_01",
            "t_de_dresbonemold_cuirass_01", "t_de_dresbonemold_gauntletl_01", "t_de_dresbonemold_gauntletr_01", "t_de_dresbonemold_greaves_01",
            "t_de_dresbonemold_helm_01", "t_de_dresbonemold_pauldronl_01", "t_de_dresbonemold_pauldronr_01", "t_de_dresbonemold_shieldtow_01",
            "t_de_dreugh_boots_01", "t_de_dreugh_bracerl_01", "t_de_dreugh_bracerr_01", "t_de_dreugh_greaves_01",
            "t_de_dreugh_helm_closed", "t_de_dreugh_hunter_helm_01", "t_de_dreugh_hunter_helm_02", "t_de_dreugh_pauldronl_01",
            "t_de_dreugh_pauldronl_swim", "t_de_dreugh_pauldronr_01", "t_de_dreugh_pauldronr_swim", "t_de_dreugh_shield_swim",
            "t_de_guarskin_boots_01", "t_de_guarskin_bracerl_01", "t_de_guarskin_bracerl_spear", "t_de_guarskin_bracerr_01",
            "t_de_guarskin_bracerr_spear", "t_de_guarskin_cuirass_01", "t_de_guarskin_greaves_01", "t_de_guarskin_helm_01",
            "t_de_guarskin_helm_02", "t_de_guarskin_helm_03", "t_de_guarskin_helm_feather", "t_de_guarskin_pauldronl_01",
            "t_de_guarskin_pauldronr_01", "t_de_guarskin_shield_01", "t_de_guarskin_shield_damfatigue", "t_de_indbonemold_boots_01",
            "t_de_indbonemold_cuirass_01", "t_de_indbonemold_gauntletl_01", "t_de_indbonemold_gauntletr_01", "t_de_indbonemold_greaves_01",
            "t_de_indbonemold_helmsaviour_01", "t_de_indbonemold_pauldronl_01", "t_de_indbonemold_pauldronl_02", "t_de_indbonemold_pauldronr_01",
            "t_de_indbonemold_pauldronr_02", "t_de_indbonemold_shield_01", "t_de_indbonemold_shield_02", "t_de_indbonemold_shield_03",
            "t_de_indbonemold_shield_04", "t_de_indbonemold_shield_05", "t_de_narsiswatch_boots_01", "t_de_narsiswatch_cuirass_01",
            "t_de_narsiswatch_gauntletl_01", "t_de_narsiswatch_gauntletr_01", "t_de_narsiswatch_greaves01", "t_de_narsiswatch_helm_01",
            "t_de_narsiswatch_pauldronl_01", "t_de_narsiswatch_pauldronr_01", "t_de_nativeebony_boots_01", "t_de_nativeebony_cuirass_01",
            "t_de_nativeebony_gauntletl_01", "t_de_nativeebony_gauntletr_01", "t_de_nativeebony_greaves_01", "t_de_nativeebony_helmclosed_01",
            "t_de_nativeebony_helmclosed_02", "t_de_nativeebony_helmopen_01", "t_de_nativeebony_helmopen_02", "t_de_nativeebony_pauldronl_01",
            "t_de_nativeebony_pauldronr_01", "t_de_necrom_boots_01", "t_de_necrom_cuirass_01", "t_de_necrom_cuirass_02",
            "t_de_necrom_gauntletl_01", "t_de_necrom_gauntletr_01", "t_de_necrom_greaves_01", "t_de_necrom_helm_01",
            "t_de_necrom_pauldronl_01", "t_de_necrom_pauldronr_01", "t_de_necrom_shield_01", "t_de_ordinator_greaves_01",
            "t_de_redbonemold_helmopen_01", "t_de_redherobonemold_cuirass_01", "t_de_redherobonemold_helm_01", "t_de_redherobonemold_helm_02",
            "t_de_redherobonemold_helm_03", "t_de_redherobonemold_pauldrl_01", "t_de_redherobonemold_pauldrr_01", "t_de_redmastbonemold_cuirass_01",
            "t_de_redmastbonemold_pauldrl_01", "t_de_redmastbonemold_pauldrr_01", "t_de_riverwatch_boots_01", "t_de_riverwatch_boots_waterwalk",
            "t_de_riverwatch_cuirass_01", "t_de_riverwatch_gauntl_01", "t_de_riverwatch_gauntr_01", "t_de_riverwatch_greaves_01",
            "t_de_riverwatch_helm_01", "t_de_riverwatch_pauldronl_01", "t_de_riverwatch_pauldronr_01", "t_de_thirrbonemold_boots_01",
            "t_de_thirrbonemold_bracer_01_l", "t_de_thirrbonemold_bracer_01_r", "t_de_thirrbonemold_cuirass_01", "t_de_thirrbonemold_greaves_01",
            "t_de_thirrbonemold_helm_01", "t_de_thirrbonemold_pauldrn_01_l", "t_de_thirrbonemold_pauldrn_01_r", "t_de_uni_dreugh_tyrant_helm",
            "t_de_uni_facelesshelm", "t_de_uni_irfeidsshoulderl", "t_de_uni_irfeidsshoulderr", "t_de_uni_shoulderofghostlightl",
            "t_de_uni_shoulderofghostlightr", "t_de_uni_vanguard", "t_de_uni_vivecshield", "t_de_uni_wraithmail_01",
            "t_dwe_gold_helmopen", "t_dwe_scrap_bracer_l", "t_dwe_scrap_bracer_r", "t_dwe_scrap_pauldron_l",
            "t_dwe_scrap_pauldron_r", "t_dwe_scrap_boots", "t_dwe_scrap_cuirass", "t_dwe_scrap_greaves",
            "t_dwe_scrap_helmet", "t_glb_var_decapitationhelm", "t_imp_chain_boots_01", "t_imp_chain_gauntletl_01",
            "t_imp_chain_gauntletr_02", "t_imp_chainmail_helm_01", "t_imp_chainmail_helm_02", "t_imp_chainmail_helm_03",
            "t_imp_chainmail_helm_04", "t_imp_chainmail_cuirass_01", "t_imp_chainmail_cuirass_02", "t_imp_chainmail_cuirass_03",
            "t_imp_chainmail_cuirass_04", "t_imp_colbronzeold_helm_01", "t_imp_coliron2_boots_01", "t_imp_coliron2_bracerl_01",
            "t_imp_coliron2_bracerr_01", "t_imp_coliron2_cuirass_01", "t_imp_coliron2_greaves_01", "t_imp_coliron2_helm_01",
            "t_imp_coliron2_pauldronl_01", "t_imp_coliron2_pauldronr_01", "t_imp_collamellar_boots_01", "t_imp_collamellar_bracerl_01",
            "t_imp_collamellar_bracerr_01", "t_imp_collamellar_cuirass_01", "t_imp_collamellar_greaves_01", "t_imp_collamellar_helmopen_01",
            "t_imp_collamellar_helm_01", "t_imp_collamellar_maskhelm_01", "t_imp_collamellar_maskhelm_02", "t_imp_collamellar_pauldronl_01",
            "t_imp_collamellar_pauldronr_01", "t_imp_dragonscale_barcerl_01", "t_imp_dragonscale_barcerr_01", "t_imp_dragonscale_boots_01",
            "t_imp_dragonscale_bracerl_01", "t_imp_dragonscale_bracerl_heal", "t_imp_dragonscale_bracerr_01", "t_imp_dragonscale_bracerr_heal",
            "t_imp_dragonscale_greaves_01", "t_imp_dragonscale_pauldronl_01", "t_imp_dragonscale_pauldronr_01", "t_imp_dragonscale_cuirass_01",
            "t_imp_dragonscale_helm_01", "t_imp_gold_cuirass_01", "t_imp_gold_helm_01", "t_imp_gold_pauldronl_01",
            "t_imp_gold_pauldronr_01", "t_imp_gold_shieldbuckler_01", "t_imp_gold_shieldbuckler_luck", "t_imp_guardsutch_cuirass_01",
            "t_imp_guardsutch_gauntletl_01", "t_imp_guardsutch_gauntletr_01", "t_imp_guardsutch_helm_01", "t_imp_guardsutch_pauldrl_01",
            "t_imp_guardsutch_pauldrr_01", "t_imp_guardsutch_shieldtow_01", "t_imp_guardtown1_cuirass_01", "t_imp_guardtown1_gauntletl_01",
            "t_imp_guardtown1_gauntletr_01", "t_imp_guardtown1_greaves_01", "t_imp_guardtown1_pauldrl_01", "t_imp_guardtown1_pauldrr_01",
            "t_imp_guardtown1_shieldanv_01", "t_imp_guardtown2_boots_01", "t_imp_guardtown2_cuirass_01", "t_imp_guardtown2_gauntletl_01",
            "t_imp_guardtown2_gauntletr_01", "t_imp_guardtown2_greaves_01", "t_imp_guardtown2_pauldrl_01", "t_imp_guardtown2_pauldrr_01",
            "t_imp_guardtown3_cuirass_01", "t_imp_guardtown3_pauldrl_01", "t_imp_guardtown3_pauldrr_01", "t_imp_mananaut_boots_01",
            "t_imp_mananaut_cuirass_01", "t_imp_mananaut_gauntl_01", "t_imp_mananaut_gauntr_01", "t_imp_mananaut_helm_01",
            "t_imp_mananaut_helm_02", "t_imp_militia_cuirass_01", "t_imp_militia_gauntl_01", "t_imp_militia_gauntr_01",
            "t_imp_oathbound_shield_01", "t_imp_reman_boots_01", "t_imp_reman_bracerl_01", "t_imp_reman_bracerr_01",
            "t_imp_reman_cuirass_01", "t_imp_reman_greaves_01", "t_imp_reman_helm_01", "t_imp_reman_pauldronl_01",
            "t_imp_reman_pauldronr_01", "t_imp_reman_shield_01", "t_imp_uni_benduolohelm", "t_imp_uni_wardofakavir",
            "t_imp_uni_nafaalilargusscales", "t_mao_scale_boots_01", "t_mao_scale_bracer_l_01", "t_mao_scale_bracer_r_01",
            "t_mao_scale_cuirass_01", "t_mao_scale_greaves_01", "t_mao_scale_helm_01", "t_mao_scale_pauld_l_01",
            "t_mao_scale_pauld_r_01", "t_nor_companion_boots_01", "t_nor_companion_cuirass_01", "t_nor_companion_gauntletl_01",
            "t_nor_companion_gauntletr_01", "t_nor_companion_greaves_01", "t_nor_companion_pauldronl_01", "t_nor_companion_pauldronr_01",
            "t_nor_guardfalkr_boots_01", "t_nor_guardfalkr_bracerl_01", "t_nor_guardfalkr_bracerr_01", "t_nor_guardfalkr_cuirass_01",
            "t_nor_guardfalkr_greaves_01", "t_nor_guardfalkr_helm_01", "t_nor_guardfalkr_helm_02", "t_nor_guardfalkr_pauldronl_01",
            "t_nor_guardfalkr_pauldronr_01", "t_nor_guardfalkr_shield_01", "t_nor_guardfalkr_towershield_01", "t_nor_guardkarth_shield_01",
            "t_nor_guard_boots_01", "t_nor_guard_cuirass_01", "t_nor_guard_gauntletl_01", "t_nor_guard_gauntletr_01",
            "t_nor_guard_greaves_01", "t_nor_guard_helm_01", "t_nor_guard_pauldronl_01", "t_nor_guard_pauldronr_01",
            "t_nor_ironwood_shield_01", "t_nor_ironwood_shield_02", "t_nor_ringmail_boots_01", "t_nor_ringmail_boots_02",
            "t_nor_ringmail_bracerl_02", "t_nor_ringmail_bracerr_02", "t_nor_ringmail_cuirass_01", "t_nor_ringmail_cuirass_sbulwark",
            "t_nor_ringmail_greaves_01", "t_nor_ringmail_greaves_02", "t_nor_ringmail_helm_closed", "t_nor_ringmail_helmet_01",
            "t_nor_ringmail_helmet_02", "t_nor_ringmail_pauldronl_02", "t_nor_ringmail_pauldronr_02", "t_nor_sabrecat_helm_01",
            "t_nor_sabrecat_helm_02", "t_nor_sabrecat_helm_sight", "t_nor_toadscale_boots_01", "t_nor_toadscale_boots_02",
            "t_nor_toadscale_cuirass_01", "t_nor_toadscale_cuirass_02", "t_nor_toadscale_gauntletl_01", "t_nor_toadscale_gauntletl_02",
            "t_nor_toadscale_gauntletr_01", "t_nor_toadscale_gauntletr_02", "t_nor_toadscale_greaves_01", "t_nor_toadscale_greaves_02",
            "t_nor_toadscale_helm_01", "t_nor_toadscale_helm_02", "t_nor_toadscale_helm_03", "t_nor_toadscale_helm_04",
            "t_nor_toadscale_pauldl_01", "t_nor_toadscale_pauldl_02", "t_nor_toadscale_pauldr_01", "t_nor_toadscale_pauldr_02",
            "t_nor_toadscale_shield_01", "t_nor_toadscale_shield_02", "t_nor_uni_dcultmask_01", "t_nor_uni_snowdrakepelt",
            "t_nor_wood_shield_01", "t_nor_wood_shield_02", "t_nor_wood_shield_03", "t_orc_regular_helmopen_01",
            "t_qc_shellmold_boots_01", "t_qc_shellmold_bracerl_01", "t_qc_shellmold_bracerr_01", "t_qc_shellmold_cuirass_01",
            "t_qc_shellmold_greaves_01", "t_qc_shellmold_helm_01", "t_qc_shellmold_pauldl_01", "t_qc_shellmold_pauldr_01",
            "t_qyc_shellmold_boots_01", "t_qyc_shellmold_bracerl_01", "t_qyc_shellmold_bracerr_01", "t_qyc_shellmold_cuirass_01",
            "t_qyc_shellmold_greaves_01", "t_qyc_shellmold_helm_01", "t_qyc_shellmold_pauldl_01", "t_qyc_shellmold_pauldr_01",
            "t_rea_wormmouth_boots_01", "t_rea_wormmouth_bracerl_01", "t_rea_wormmouth_bracerr_01", "t_rea_wormmouth_cuirass_01",
            "t_rea_wormmouth_greaves_01", "t_rea_wormmouth_helm_01", "t_rea_wormmouth_helm_poison", "t_rea_wormmouth_pauldronl_01",
            "t_rea_wormmouth_pauldronr_01", "t_rga_alikr_buckler", "t_rga_crownguard1_boots_01", "t_rga_crownguard1_cuirass_01",
            "t_rga_crownguard1_greaves_01", "t_rga_crownguard1_helm_01", "t_rga_crownguard1_pauldronl_01", "t_rga_crownguard1_pauldronr_01",
            "t_we_wenbone_boots_01", "t_we_wenbone_bracerl_01", "t_we_wenbone_bracerr_01", "t_we_wenbone_cuirass_01",
            "t_we_wenbone_greaves_01", "t_we_wenbone_helm_01", "t_we_wenbone_pauldronl_01", "t_we_wenbone_pauldronr_01",
            "t_we_wenbone_shieldtow_01",
        })
    end
    if setBonus.getSet("Light Armor") then
        setBonus.addItems("Light Armor", {
            "t_ayl_saliache_boots_01", "t_ayl_saliache_bracerl_01", "t_ayl_saliache_bracerr_01", "t_ayl_saliache_cuirass_01",
            "t_ayl_saliache_greaves_01", "t_ayl_saliache_helm_01", "t_ayl_saliache_pauldronl_01", "t_ayl_saliache_pauldronr_01",
            "t_ayl_saliache_shield_01", "t_bre_bjoulsaefur_helm_01", "t_bre_cm_hatchef_01", "t_bre_cm_hat_01a",
            "t_bre_cm_hat_01b", "t_bre_cm_hat_02", "t_bre_cm_hat_03", "t_bre_cm_hat_04a",
            "t_bre_cm_hat_04b", "t_bre_cm_hat_04c", "t_bre_cm_hat_05a", "t_bre_cm_hat_05b",
            "t_bre_cm_hat_06", "t_bre_ep_hatost_01", "t_bre_ep_hatwizard_01", "t_bre_ep_hatwizard_02",
            "t_bre_ep_hat_01", "t_bre_ep_hat_02", "t_bre_ep_hat_03", "t_bre_ep_hat_04",
            "t_bre_ep_hat_05", "t_bre_ep_hat_06a", "t_bre_ep_hat_06b", "t_bre_ep_hat_07",
            "t_bre_ep_hat_08a", "t_bre_ep_hat_08b", "t_bre_et_boots_01", "t_bre_et_boots_02",
            "t_bre_et_hat_01", "t_bre_et_hat_02", "t_bre_et_hat_03", "t_bre_ex_hat_01",
            "t_bre_ex_hat_02", "t_com_bound_greaves_01", "t_com_bound_pauldronl_01", "t_com_bound_pauldronr_01",
            "t_com_chitin_gauntletl_restor", "t_com_chitin_gauntletr_restor", "t_com_cloth_bracerl_shortblade", "t_com_cloth_bracerr_shortblade",
            "t_com_cm_hatclothcoif_01", "t_com_cm_hatclothcoif_02", "t_com_cm_hat_01", "t_com_cm_hat_02",
            "t_com_cm_hat_03", "t_com_cm_hat_04", "t_com_cm_hat_05", "t_com_cm_hat_06",
            "t_com_cm_hat_haggling", "t_com_eq_hat_01", "t_com_et_hatclothcoif_01", "t_com_et_hat_01",
            "t_com_et_hat_02", "t_com_et_hat_03", "t_com_et_hat_04", "t_com_et_hat_05",
            "t_com_et_hat_foresight", "t_com_et_hat_imperious", "t_com_foolshat_01", "t_com_foolshat_02",
            "t_com_netch_helm_nighteye", "t_cr_goblin_shield_01", "t_dae_uni_aurorangauntletl", "t_dae_uni_aurorangauntletr",
            "t_dae_uni_bootssaviorshide", "t_dae_uni_gauntletofpoor_l", "t_dae_uni_gauntletofpoor_r", "t_dae_uni_greavessaviorshide",
            "t_dae_uni_helmsaviorshide", "t_dae_uni_lgauntsaviorshide", "t_dae_uni_lpauldsaviorshide", "t_dae_uni_rgauntsaviorshide",
            "t_dae_uni_rpauldsaviorshide", "t_de_alithide_boots_01", "t_de_alithide_bracerl_01", "t_de_alithide_bracerl_poison",
            "t_de_alithide_bracerr_01", "t_de_alithide_bracerr_poison", "t_de_alithide_cuirass_01", "t_de_alithide_greaves_01",
            "t_de_alithide_helmopen_01", "t_de_alithide_helm_01", "t_de_alithide_pauldronl_01", "t_de_alithide_pauldronr_01",
            "t_de_alithide_shield_01", "t_de_alithide_shield_fatigue", "t_de_alithide_towershield_01", "t_de_ashl_scout_helm",
            "t_de_caravaner_helm_01", "t_de_chitin_boots_speed", "t_de_chitin_helmopen_01", "t_de_chitin_pauldrl_01",
            "t_de_chitin_pauldrr_01", "t_de_chitin_pioneerhelm_01", "t_de_chitin_pioneerhelm_02", "t_de_chitin_tshield_health",
            "t_de_cm_hattelv_01", "t_de_cm_hattelv_02", "t_de_cm_hattelv_03", "t_de_cm_hattelv_04",
            "t_de_cm_hattelv_05", "t_de_daedrichide_boots_01", "t_de_daedrichide_cuirass_01", "t_de_daedrichide_gauntletl_01",
            "t_de_daedrichide_gauntletr_01", "t_de_daedrichide_greaves_01", "t_de_daedrichide_pauldronl_01", "t_de_daedrichide_pauldronr_01",
            "t_de_diviner_helm_01", "t_de_dreschapthil_helm_01a", "t_de_dreschapthil_helm_01b", "t_de_dreschapthil_helm_01c",
            "t_de_dreschapthil_helm_01d", "t_de_dreschapthil_helm_01e", "t_de_dreschapthil_helm_02a", "t_de_dreschapthil_helm_02b",
            "t_de_dreschapthil_helm_02c", "t_de_dreschapthil_helm_02d", "t_de_dreschapthil_helm_02e", "t_de_dreschapthil_helm_03a",
            "t_de_dreschapthil_helm_03b", "t_de_dreschapthil_helm_03c", "t_de_dreschapthil_helm_03d", "t_de_dreschapthil_helm_03e",
            "t_de_dreshunter_cuirass_01", "t_de_dreshunter_greaves_01", "t_de_dreshunter_helm_01", "t_de_dreshunter_pauldronl_01",
            "t_de_dreshunter_pauldronr_01", "t_de_dressaltmerc_helm_01", "t_de_dressaltmerc_helm_02", "t_de_ep_hattelv_01",
            "t_de_ep_hattelv_02", "t_de_ep_hattelv_03", "t_de_et_hattelv_01", "t_de_et_hattelv_02",
            "t_de_ex_hattelv_01", "t_de_ex_hattelv_02", "t_de_fiendcephalopodhelm_01", "t_de_fiendmolecrabhelm_01",
            "t_de_glassgilded_boots_01", "t_de_glassgilded_bracerl_01", "t_de_glassgilded_bracerr_01", "t_de_glassgilded_cuirass_01",
            "t_de_glassgilded_greaves_01", "t_de_glassgilded_helm_01", "t_de_glassgilded_pauldronl_01", "t_de_glassgilded_pauldronr_01",
            "t_de_glass_helm_closed_01", "t_de_indchevaram_boots_01", "t_de_indchevaram_bracerl_01", "t_de_indchevaram_bracerr_01",
            "t_de_indchevaram_cuirass_01", "t_de_indchevaram_greaves_01", "t_de_indchevaram_helm_01", "t_de_indchevaram_helm_02",
            "t_de_indchevaram_pauldrl_01", "t_de_indchevaram_pauldrr_01", "t_de_kagoutihide_boots_01", "t_de_kagoutihide_bracerl_01",
            "t_de_kagoutihide_bracerr_01", "t_de_kagoutihide_cuirass_01", "t_de_kagoutihide_cuirass_hunter", "t_de_kagoutihide_greaves_01",
            "t_de_kagoutihide_helmopen_01", "t_de_kagoutihide_helm_01", "t_de_kagoutihide_helm_hunter", "t_de_kagoutihide_pauldronl_01",
            "t_de_kagoutihide_pauldronr_01", "t_de_kagoutihide_shield_01", "t_de_kagoutihide_shield_02", "t_de_kagoutihide_shield_sanct",
            "t_de_kagoutihide_tshield_tusks", "t_de_kagoutihide_towershield_01", "t_de_molecrab_boots_01", "t_de_molecrab_boots_feather",
            "t_de_molecrab_boots_slowfall", "t_de_molecrab_bracerl_01", "t_de_molecrab_bracerl_conj", "t_de_molecrab_bracerl_dest",
            "t_de_molecrab_bracerl_illusion", "t_de_molecrab_bracerr_01", "t_de_molecrab_bracerr_conj", "t_de_molecrab_bracerr_dest",
            "t_de_molecrab_bracerr_illusion", "t_de_molecrab_cuirass_01", "t_de_molecrab_cuirass_absorp", "t_de_molecrab_greaves_01",
            "t_de_molecrab_pauldronl_01", "t_de_molecrab_pauldronr_01", "t_de_moragtong_boots_01", "t_de_moragtong_bracerl_01",
            "t_de_moragtong_bracerr_01", "t_de_moragtong_cuirass_01", "t_de_moragtong_greaves_01", "t_de_moragtong_pauldronl_01",
            "t_de_moragtong_pauldronr_01", "t_de_netchrogue_cuirass_01", "t_de_netchrogue_helm_01", "t_de_netchrogue_helm_02",
            "t_de_netchrogue_helm_key", "t_de_netchstalker_helm_01", "t_de_netch_boots_speed", "t_de_netch_cuirass_01",
            "t_de_netch_cuirass_02", "t_de_netch_cuirass_03", "t_de_netch_gauntletl_marksman", "t_de_netch_gauntletr_marksman",
            "t_de_netch_helm_01", "t_de_netch_helm_02", "t_de_redwatchchitin_boots_01", "t_de_redwatchchitin_cuirass_01",
            "t_de_redwatchchitin_gauntll_01", "t_de_redwatchchitin_gauntlr_01", "t_de_redwatchchitin_greaves_01", "t_de_redwatchchitin_pauldrl_01",
            "t_de_redwatchchitin_pauldrr_01", "t_de_redoranwatchman_boots", "t_de_redoranwatchman_boots_fati", "t_de_redoranwatchman_cuirass",
            "t_de_redoranwatchman_gauntletl", "t_de_redoranwatchman_gauntletr", "t_de_redoranwatchman_greaves", "t_de_redoranwatchman_helm_det",
            "t_de_redoranwatchman_pauldronl", "t_de_redoranwatchman_pauldronr", "t_de_shinchitin_boots", "t_de_shinchitin_bracerl",
            "t_de_shinchitin_bracerr", "t_de_shinchitin_cuirass", "t_de_shinchitin_greaves", "t_de_shinchitin_helm",
            "t_de_shinchitin_pauldl", "t_de_shinchitin_pauldr", "t_de_telvcephalopod_boots_01", "t_de_telvcephalopod_boots_burd",
            "t_de_telvcephalopod_boots_lev", "t_de_telvcephalopod_cuirass_01", "t_de_telvcephalopod_gauntl_01", "t_de_telvcephalopod_gauntl_alt",
            "t_de_telvcephalopod_gauntl_mys", "t_de_telvcephalopod_gauntr_01", "t_de_telvcephalopod_gauntr_alt", "t_de_telvcephalopod_gauntr_mys",
            "t_de_telvcephalopod_greaves_01", "t_de_telvcephalopod_pauldl_01", "t_de_telvcephalopod_pauldr_01", "t_de_telvcephalopod_reflect",
            "t_de_uni_kagoutihide_bracerl_01", "t_de_uni_kagoutihide_bracerr_01", "t_de_uni_kingofrats_01", "t_de_uni_preyseekerhelm",
            "t_de_uni_ushudimmucrown", "t_de_uni_vizard_draloris", "t_glb_var_headfixer", "t_he_altmerglass_boots_01",
            "t_he_altmerglass_cuirass_01", "t_he_altmerglass_greaves_01", "t_he_altmerglass_helm_01", "t_he_altmerglass_helm_02",
            "t_he_altmerglass_helm_03", "t_he_altmerglass_l_bracer_01", "t_he_altmerglass_l_pauldron_01", "t_he_altmerglass_r_bracer_01",
            "t_he_altmerglass_r_pauldron_01", "t_he_direnni_boots_01", "t_he_direnni_bracerl_01", "t_he_direnni_bracerr_01",
            "t_he_direnni_cuirass_01", "t_he_direnni_greaves_01", "t_he_direnni_helm_01", "t_he_direnni_pauldronl_01",
            "t_he_direnni_pauldronr_01", "t_he_glass_towershield_01", "t_imp_cm_bootscol_01", "t_imp_cm_bootscol_02",
            "t_imp_cm_bootscol_03", "t_imp_cm_bootscol_04", "t_imp_cm_hatcolwest_01", "t_imp_cm_hatcolwest_02",
            "t_imp_colfur_boots_01", "t_imp_colfur_boots_02", "t_imp_colfur_boots_03", "t_imp_colfur_boots_04",
            "t_imp_colfur_cuirass_01", "t_imp_colfur_cuirass_02", "t_imp_colfur_cuirass_03", "t_imp_colfur_cuirass_04",
            "t_imp_colfur_gauntl_01", "t_imp_colfur_gauntl_02", "t_imp_colfur_gauntl_03", "t_imp_colfur_gauntl_04",
            "t_imp_colfur_gauntr_01", "t_imp_colfur_gauntr_02", "t_imp_colfur_gauntr_03", "t_imp_colfur_gauntr_04",
            "t_imp_colfur_helmbl_01", "t_imp_colfur_helmex_01", "t_imp_colfur_helmr_01", "t_imp_colfur_helmtiger_01",
            "t_imp_colgoathide_boots_01", "t_imp_colgoathide_greaves_01", "t_imp_colgoathide_helmet_01", "t_imp_colleather_boots_01",
            "t_imp_colleather_boots_02", "t_imp_colleather_bracerl_01", "t_imp_colleather_bracerl_02", "t_imp_colleather_bracerr_01",
            "t_imp_colleather_bracerr_02", "t_imp_colleather_cuirass_01", "t_imp_colleather_cuirass_02", "t_imp_colleather_greaves_01",
            "t_imp_colleather_greaves_02", "t_imp_colleather_helm_01", "t_imp_colleather_helm_02", "t_imp_colleather_pauldronl_01",
            "t_imp_colleather_pauldronl_02", "t_imp_colleather_pauldronr_01", "t_imp_colleather_pauldronr_02", "t_imp_domina_boots_01",
            "t_imp_domina_cuirass_01", "t_imp_domina_gauntletl_01", "t_imp_domina_gauntletr_01", "t_imp_domina_greaves_01",
            "t_imp_domina_helm_01", "t_imp_domina_pauldronl_01", "t_imp_domina_pauldronr_01", "t_imp_ebonweave_boots_01",
            "t_imp_ebonweave_bracerl_01", "t_imp_ebonweave_bracerr_01", "t_imp_ebonweave_cuirass_01", "t_imp_ebonweave_greaves_01",
            "t_imp_ebonweave_helm_01", "t_imp_ebonweave_helm_02", "t_imp_ebonweave_pauldronl_01", "t_imp_ebonweave_pauldronr_01",
            "t_imp_ep_hatcolwest_01", "t_imp_ep_hatcolwest_02", "t_imp_ep_hatcolwest_03", "t_imp_ep_hatcolwest_04",
            "t_imp_ep_hat_02", "t_imp_et_hatcolnorth_01", "t_imp_et_hatcolnorth_02", "t_imp_et_hatcolnorth_03",
            "t_imp_et_hatcolnorth_04", "t_imp_et_hatcolnorth_05", "t_imp_navystud_boots_01", "t_imp_navystud_cuirass_01",
            "t_imp_navystud_gauntletl_01", "t_imp_navystud_gauntletr_01", "t_imp_navystud_helm_01", "t_imp_navystud_pauldrl_01",
            "t_imp_navystud_pauldrr_01", "t_imp_newtscale_boots_01", "t_imp_newtscale_cuirass_01", "t_imp_newtscale_gauntletl_01",
            "t_imp_newtscale_gauntletr_01", "t_imp_newtscale_greaves_01", "t_imp_newtscale_helm_01", "t_imp_newtscale_pauldronl_01",
            "t_imp_newtscale_pauldronr_01", "t_imp_studdedleather_boots_01", "t_imp_studdedleather_bracerl_01", "t_imp_studdedleather_bracerr_01",
            "t_imp_studdedleather_greaves_01", "t_imp_studdedleather_helm_01", "t_imp_studdedleather_helm_02", "t_imp_studdedleather_helm_03",
            "t_imp_studdedleather_pauldrl_01", "t_imp_studdedleather_pauldrr_01", "t_imp_studdedleather_cuirass_02", "t_imp_studdedleather_cuirass_03",
            "t_imp_uni_katariahsdeathmask", "t_imp_uni_masquedcaptain", "t_imp_uni_shadowweave", "t_nor_bearskin_boots_01",
            "t_nor_bearskin_bracerl_01", "t_nor_bearskin_bracerl_claw", "t_nor_bearskin_bracerr_01", "t_nor_bearskin_bracerr_claw",
            "t_nor_bearskin_greaves_01", "t_nor_bearskin_helm_01", "t_nor_bearskin_helm_hiber", "t_nor_bearskin_pauldronl_01",
            "t_nor_bearskin_pauldronr_01", "t_nor_haafscpol_boots_01", "t_nor_haafscpol_helm_01", "t_nor_hornedleather_helm_01",
            "t_nor_leather1_barcerl_01", "t_nor_leather1_barcerr_01", "t_nor_leather1_boots_01", "t_nor_leather1_cuirass_01",
            "t_nor_leather1_greaves_01", "t_nor_leather1_helm_01", "t_nor_leather1_pauldl_01", "t_nor_leather1_pauldr_01",
            "t_nor_leather2_boots_01", "t_nor_leather2_bracerl_01", "t_nor_leather2_bracerr_01", "t_nor_leather2_cuirass_01",
            "t_nor_leather2_greaves_01", "t_nor_leather2_helm_01", "t_nor_leather2_pauldl_01", "t_nor_leather2_pauldr_01",
            "t_nor_unihornedleather_helm", "t_nor_uni_predatorsgrace", "t_nor_wolf_helm_black_01", "t_nor_wolf_helm_red_01",
            "t_nor_wolf_helm_white_01", "t_nor_wood_shieldbuckler_01", "t_nor_wood_shieldbuckler_02", "t_nor_wood_shieldbuckler_03",
            "t_nor_wood_shieldbuckler_04", "t_nor_wood_shieldbuckler_05", "t_nor_wood_shieldbuckler_06", "t_nor_wood_shieldbuckler_07",
            "t_nor_wood_shieldbuckler_08", "t_orc_leather_boots_01", "t_orc_leather_cuirass_01", "t_orc_leather_gauntletl_01",
            "t_orc_leather_gauntletr_01", "t_orc_leather_greaves_01", "t_orc_leather_helm_01", "t_orc_leather_pauldronl_01",
            "t_orc_leather_pauldronr_01", "t_qyk_manatee_boots_01", "t_qyk_manatee_bracerl_01", "t_qyk_manatee_bracerr_01",
            "t_qyk_manatee_cuirass_01", "t_qyk_manatee_greaves_01", "t_qyk_manatee_helm_01", "t_qyk_manatee_pauldronl_01",
            "t_qyk_manatee_pauldronr_01", "t_qy_ngalom_bracerl_uni", "t_qy_ngalom_bracerr_uni", "t_rea_leather_hat_01",
            "t_rea_leather_hat_witchery", "t_rea_uni_feathercrown", "t_rga_cm_hat_01", "t_rga_cm_hat_02",
            "t_rga_cm_hat_03", "t_rga_ep_headdress_01", "t_rga_guardrihad_boots_01", "t_rga_guardrihad_bracer_l_01",
            "t_rga_guardrihad_bracer_r_01", "t_rga_guardrihad_cuirass_01", "t_rga_guardrihad_helm_01", "t_rga_guardrihad_pauldron_l_01",
            "t_rga_guardrihad_pauldron_r_01", "t_rga_lamellar_bracer_l_01", "t_rga_lamellar_bracer_r_01", "t_rga_lamellar_cuirass",
            "t_rga_lamellar_cuirass_b", "t_rga_lamellar_cuirass_g", "t_rga_lamellar_cuirass_y", "t_rga_lamellar_helm",
            "t_rga_lamellar_helm_b", "t_rga_lamellar_helm_g", "t_rga_lamellar_helm_y", "t_rga_wicker_shield",
            "t_cr_goblin_helm_01", "t_cr_goblin_pauldronl_01", "t_cr_goblin_pauldronr_01",
        })
    end
    -- <<< SETBONUS CLASS ARMOR <<<
end

event.register(tes3.event.initialized, registerTRSets)
