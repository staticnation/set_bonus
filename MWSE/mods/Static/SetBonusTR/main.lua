-- =========================================================================
--  Set Bonus -- Tamriel Rebuilt add-on
--  Optional companion to the Static Set Bonus framework. Holds all Tamriel
--  Rebuilt content; the base mod stays base-game only. Registers only when the
--  relevant TR assets are present, so it is safe with or without TR installed.
-- =========================================================================

local setBonus = require("Static.SetBonus.interop")
local log = require("Static.logger")

local function present(id) return tes3.getObject(id) ~= nil end

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
                    { effect = "resistFrost", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                },
                mid = {
                    { effect = "resistFrost", magnitude = 30 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                },
                max = {
                    { effect = "resistFrost", magnitude = 45 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "spellAbsorption", magnitude = 10 },
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
                    { effect = "swiftSwim", magnitude = 30 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 50 },
                    { effect = "resistShock", magnitude = 20 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 70 },
                    { effect = "resistShock", magnitude = 35 },
                    { effect = "chameleon", magnitude = 15 },
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
                    { effect = "resistFrost", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 10 },
                },
                mid = {
                    { effect = "resistFrost", magnitude = 35 },
                    { effect = "fortifyHealth", magnitude = 25 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "resistFrost", magnitude = 50 },
                    { effect = "fortifyHealth", magnitude = 40 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "turnUndead", magnitude = 25 },
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
                    { effect = "resistShock", magnitude = 15 },
                    { effect = "waterBreathing", magnitude = 1 },
                },
                mid = {
                    { effect = "resistShock", magnitude = 30 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 10 },
                },
                max = {
                    { effect = "resistShock", magnitude = 50 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 15 },
                    { effect = "reflect", magnitude = 10 },
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
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 10 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 15 },
                    { effect = "resistPoison", magnitude = 20 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 15 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 25 },
                    { effect = "resistPoison", magnitude = 35 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "shield", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "shield", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 15 },
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
                    { effect = "fortifyFatigue", magnitude = 25 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyFatigue", magnitude = 40 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyFatigue", magnitude = 60 },
                    { effect = "resistBlightDisease", magnitude = 30 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 15 },
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
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistFrost", magnitude = 15 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "resistFrost", magnitude = 30 },
                    { effect = "resistCommonDisease", magnitude = 30 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "resistFrost", magnitude = 45 },
                    { effect = "resistCommonDisease", magnitude = 50 },
                    { effect = "fortifyFatigue", magnitude = 40 },
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
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
                    { effect = "resistPoison", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
                    { effect = "resistPoison", magnitude = 20 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 15 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
                    { effect = "resistPoison", magnitude = 35 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 25 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
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
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifySkill", skill = "marksman", magnitude = 10 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "fortifySkill", skill = "marksman", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "fortifySkill", skill = "marksman", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
                    { effect = "fortifySkill", skill = "sneak", magnitude = 15 },
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
                    { effect = "resistShock", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 10 },
                },
                mid = {
                    { effect = "resistShock", magnitude = 30 },
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "resistShock", magnitude = 50 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "reflect", magnitude = 10 },
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
                    { effect = "restoreMagicka", magnitude = 1 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 2 },
                    { effect = "fortifyFatigue", magnitude = 35 },
                    { effect = "resistMagicka", magnitude = 15 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 3 },
                    { effect = "fortifyFatigue", magnitude = 50 },
                    { effect = "resistMagicka", magnitude = 25 },
                    { effect = "spellAbsorption", magnitude = 10 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "resistMagicka", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "resistMagicka", magnitude = 20 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "resistMagicka", magnitude = 30 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "turnUndead", magnitude = 25 },
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
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
                    { effect = "resistFire", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
                    { effect = "resistFire", magnitude = 35 },
                    { effect = "sanctuary", magnitude = 12 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "waterWalking", magnitude = 1 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "waterWalking", magnitude = 1 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "waterWalking", magnitude = 1 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "resistBlightDisease", magnitude = 30 },
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
                    { effect = "resistMagicka", magnitude = 15 },
                    { effect = "spellAbsorption", magnitude = 8 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 25 },
                    { effect = "spellAbsorption", magnitude = 12 },
                    { effect = "reflect", magnitude = 8 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 40 },
                    { effect = "spellAbsorption", magnitude = 18 },
                    { effect = "reflect", magnitude = 12 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "resistFrost", magnitude = 15 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "resistFrost", magnitude = 30 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "resistFrost", magnitude = 45 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "shield", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "shield", magnitude = 10 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 40 },
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
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "fortifyFatigue", magnitude = 35 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "fortifyFatigue", magnitude = 55 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
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
                    { effect = "resistMagicka", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 10 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 25 },
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 15 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 40 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 25 },
                    { effect = "turnUndead", magnitude = 25 },
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
                    { effect = "shield", magnitude = 8 },
                    { effect = "fortifyHealth", magnitude = 10 },
                },
                mid = {
                    { effect = "shield", magnitude = 12 },
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                },
                max = {
                    { effect = "shield", magnitude = 18 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
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
                    { effect = "fortifyFatigue", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyFatigue", magnitude = 40 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
                    { effect = "fortifySkill", skill = "sneak", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyFatigue", magnitude = 60 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 15 },
                    { effect = "fortifySkill", skill = "sneak", magnitude = 20 },
                    { effect = "fortifySkill", skill = "acrobatics", magnitude = 15 },
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
                    { effect = "resistPoison", magnitude = 15 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "swiftSwim", magnitude = 50 },
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
                    { effect = "swiftSwim", magnitude = 30 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 50 },
                    { effect = "fortifyFatigue", magnitude = 35 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 70 },
                    { effect = "fortifyFatigue", magnitude = 50 },
                    { effect = "resistFrost", magnitude = 25 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "resistMagicka", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "resistMagicka", magnitude = 20 },
                    { effect = "turnUndead", magnitude = 20 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "resistMagicka", magnitude = 30 },
                    { effect = "turnUndead", magnitude = 35 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 20 },
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
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistBlightDisease", magnitude = 15 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "resistBlightDisease", magnitude = 25 },
                    { effect = "resistParalysis", magnitude = 15 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "resistBlightDisease", magnitude = 40 },
                    { effect = "resistParalysis", magnitude = 30 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "resistFrost", magnitude = 15 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "resistFrost", magnitude = 30 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "resistFrost", magnitude = 45 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
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
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 5 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 10 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 10 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 3, duration = 1 },
                    { effect = "fortifyAttribute", attribute = "intelligence", magnitude = 15 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 20 },
                    { effect = "fortifySkill", skill = "alteration", magnitude = 15 },
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
                    { effect = "swiftSwim", magnitude = 30 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 50 },
                    { effect = "resistFrost", magnitude = 20 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "swiftSwim", magnitude = 70 },
                    { effect = "resistFrost", magnitude = 35 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
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
                    { effect = "resistPoison", magnitude = 15 },
                },
                mid = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "resistCommonDisease", magnitude = 30 },
                    { effect = "swiftSwim", magnitude = 40 },
                },
                max = {
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "resistCommonDisease", magnitude = 50 },
                    { effect = "swiftSwim", magnitude = 60 },
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
                    { effect = "light", magnitude = 10 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 10 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 3, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 18 },
                    { effect = "resistMagicka", magnitude = 25 },
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
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "shield", magnitude = 5 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 25 },
                    { effect = "shield", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 20 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 40 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 35 },
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
                    { effect = "resistMagicka", magnitude = 15 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 30 },
                    { effect = "spellAbsorption", magnitude = 10 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 50 },
                    { effect = "spellAbsorption", magnitude = 18 },
                    { effect = "fortifySkill", skill = "conjuration", magnitude = 15 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "fortifyAttackBonus", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                    { effect = "shield", magnitude = 8 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "shield", magnitude = 12 },
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
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 25 },
                    { effect = "fortifyFatigue", magnitude = 35 },
                },
                max = {
                    { effect = "resistFire", magnitude = 40 },
                    { effect = "fortifyFatigue", magnitude = 55 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
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
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyAttackBonus", magnitude = 5 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 25 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 20 },
                },
                max = {
                    { effect = "resistFire", magnitude = 40 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 35 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 25 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "shield", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 40 },
                    { effect = "resistBlightDisease", magnitude = 30 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "resistFire", magnitude = 25 },
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
                    { effect = "fortifyAttackBonus", magnitude = 5 },
                    { effect = "fortifyFatigue", magnitude = 25 },
                },
                mid = {
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                    { effect = "fortifyFatigue", magnitude = 40 },
                    { effect = "fortifyHealth", magnitude = 20 },
                },
                max = {
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 60 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "shield", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "shield", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
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
                    { effect = "spellAbsorption", magnitude = 8 },
                },
                mid = {
                    { effect = "spellAbsorption", magnitude = 12 },
                    { effect = "resistMagicka", magnitude = 15 },
                    { effect = "sanctuary", magnitude = 8 },
                },
                max = {
                    { effect = "spellAbsorption", magnitude = 18 },
                    { effect = "resistMagicka", magnitude = 25 },
                    { effect = "sanctuary", magnitude = 12 },
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
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
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                    { effect = "fortifyAttackBonus", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 20 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "shield", magnitude = 10 },
                },
            },
        }
    end
    if present("T_A_DeChitinHelmOpen01_Hrpen") then
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
                    { effect = "resistFire", magnitude = 25 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 50 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 10 },
                },
                max = {
                    { effect = "resistFire", magnitude = 75 },
                    { effect = "fortifySkill", skill = "destruction", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 10 },
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
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "resistParalysis", magnitude = 15 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "resistBlightDisease", magnitude = 30 },
                    { effect = "resistParalysis", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
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
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 20 },
                    { effect = "resistMagicka", magnitude = 15 },
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
                    { effect = "resistMagicka", magnitude = 15 },
                    { effect = "restoreMagicka", magnitude = 1, duration = 1 },
                },
                mid = {
                    { effect = "resistMagicka", magnitude = 30 },
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 10 },
                },
                max = {
                    { effect = "resistMagicka", magnitude = 50 },
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "spellAbsorption", magnitude = 18 },
                    { effect = "fortifySkill", skill = "alteration", magnitude = 20 },
                },
            },
        }
    end
    if present("T_A_DeChitinHelmOpen01_Hrpen") then
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "resistBlightDisease", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 25 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 40 },
                    { effect = "resistBlightDisease", magnitude = 30 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
                    { effect = "shield", magnitude = 12 },
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
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyAttackBonus", magnitude = 5 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 25 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "strength", magnitude = 5 },
                },
                max = {
                    { effect = "resistFire", magnitude = 40 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "strength", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 25 },
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
                    { effect = "shield", magnitude = 8 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                },
                mid = {
                    { effect = "shield", magnitude = 12 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
                },
                max = {
                    { effect = "shield", magnitude = 18 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 25 },
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
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 10 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 25 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 15 },
                },
                max = {
                    { effect = "resistFire", magnitude = 40 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 30 },
                    { effect = "fortifyHealth", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
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
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 20 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 25 },
                    { effect = "fortifyFatigue", magnitude = 35 },
                    { effect = "resistPoison", magnitude = 20 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 40 },
                    { effect = "fortifyFatigue", magnitude = 50 },
                    { effect = "resistPoison", magnitude = 35 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
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
                    { effect = "shield", magnitude = 5 },
                    { effect = "fortifyFatigue", magnitude = 25 },
                },
                mid = {
                    { effect = "shield", magnitude = 10 },
                    { effect = "fortifyFatigue", magnitude = 40 },
                },
                max = {
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 60 },
                    { effect = "fortifyHealth", magnitude = 25 },
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
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 5 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 10 },
                    { effect = "fortifyFatigue", magnitude = 30 },
                },
                max = {
                    { effect = "resistFire", magnitude = 40 },
                    { effect = "fortifyAttribute", attribute = "speed", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 50 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 15 },
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
                    { effect = "fortifyFatigue", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 10 },
                },
                mid = {
                    { effect = "fortifyFatigue", magnitude = 35 },
                    { effect = "fortifyHealth", magnitude = 20 },
                    { effect = "shield", magnitude = 5 },
                },
                max = {
                    { effect = "fortifyFatigue", magnitude = 50 },
                    { effect = "fortifyHealth", magnitude = 30 },
                    { effect = "shield", magnitude = 10 },
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
                    { effect = "shield", magnitude = 8 },
                },
                mid = {
                    { effect = "shield", magnitude = 12 },
                    { effect = "resistNormalWeapons", magnitude = 5 },
                },
                max = {
                    { effect = "shield", magnitude = 18 },
                    { effect = "resistNormalWeapons", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 20 },
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
                    { effect = "swiftSwim", magnitude = 30 },
                    { effect = "waterBreathing", magnitude = 1 },
                },
                mid = {
                    { effect = "swiftSwim", magnitude = 50 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistFrost", magnitude = 20 },
                },
                max = {
                    { effect = "swiftSwim", magnitude = 70 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "resistFrost", magnitude = 35 },
                    { effect = "fortifyFatigue", magnitude = 50 },
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
                    { effect = "turnUndead", magnitude = 15 },
                    { effect = "resistMagicka", magnitude = 10 },
                },
                mid = {
                    { effect = "turnUndead", magnitude = 25 },
                    { effect = "resistMagicka", magnitude = 20 },
                    { effect = "fortifyHealth", magnitude = 20 },
                },
                max = {
                    { effect = "turnUndead", magnitude = 40 },
                    { effect = "resistMagicka", magnitude = 30 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "fortifySkill", skill = "restoration", magnitude = 20 },
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
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 10 },
                },
                mid = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 20 },
                    { effect = "resistMagicka", magnitude = 15 },
                },
                max = {
                    { effect = "restoreMagicka", magnitude = 2, duration = 1 },
                    { effect = "fortifySkill", skill = "mercantile", magnitude = 30 },
                    { effect = "resistMagicka", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
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
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "shield", magnitude = 5 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 25 },
                    { effect = "shield", magnitude = 10 },
                    { effect = "fortifyHealth", magnitude = 20 },
                },
                max = {
                    { effect = "resistFire", magnitude = 40 },
                    { effect = "shield", magnitude = 15 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
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
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 5 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 10 },
                    { effect = "fortifyFatigue", magnitude = 40 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "fortifyAttribute", attribute = "endurance", magnitude = 15 },
                    { effect = "fortifyFatigue", magnitude = 60 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
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
                    { effect = "fortifyHealth", magnitude = 10 },
                    { effect = "fortifyAttackBonus", magnitude = 5 },
                },
                mid = {
                    { effect = "fortifyHealth", magnitude = 25 },
                    { effect = "fortifyAttackBonus", magnitude = 10 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
                },
                max = {
                    { effect = "fortifyHealth", magnitude = 40 },
                    { effect = "fortifyAttackBonus", magnitude = 15 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
                    { effect = "shield", magnitude = 10 },
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
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 10 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 25 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 15 },
                    { effect = "resistPoison", magnitude = 20 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 40 },
                    { effect = "fortifySkill", skill = "athletics", magnitude = 25 },
                    { effect = "resistPoison", magnitude = 35 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
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
                    { effect = "shield", magnitude = 5 },
                    { effect = "resistShock", magnitude = 10 },
                },
                mid = {
                    { effect = "shield", magnitude = 10 },
                    { effect = "resistShock", magnitude = 20 },
                },
                max = {
                    { effect = "shield", magnitude = 15 },
                    { effect = "resistShock", magnitude = 35 },
                    { effect = "fortifyHealth", magnitude = 20 },
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
                    { effect = "resistBlightDisease", magnitude = 15 },
                    { effect = "resistPoison", magnitude = 15 },
                },
                mid = {
                    { effect = "resistBlightDisease", magnitude = 25 },
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "fortifySkill", skill = "spear", magnitude = 15 },
                },
                max = {
                    { effect = "resistBlightDisease", magnitude = 40 },
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "fortifySkill", skill = "spear", magnitude = 25 },
                    { effect = "fortifyAttribute", attribute = "agility", magnitude = 10 },
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
                    { effect = "resistPoison", magnitude = 15 },
                    { effect = "resistCommonDisease", magnitude = 20 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "resistCommonDisease", magnitude = 35 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 10 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "resistCommonDisease", magnitude = 50 },
                    { effect = "fortifyAttribute", attribute = "personality", magnitude = 15 },
                    { effect = "resistMagicka", magnitude = 15 },
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
                    { effect = "resistFire", magnitude = 15 },
                    { effect = "waterBreathing", magnitude = 1 },
                },
                mid = {
                    { effect = "resistFire", magnitude = 25 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyHealth", magnitude = 20 },
                },
                max = {
                    { effect = "resistFire", magnitude = 40 },
                    { effect = "waterBreathing", magnitude = 1 },
                    { effect = "fortifyHealth", magnitude = 35 },
                    { effect = "swiftSwim", magnitude = 40 },
                },
            },
        }
    end
    if present("T_A_DeChitinHelmOpen01_Hrpen") then
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
                    { effect = "fortifyFatigue", magnitude = 20 },
                },
                mid = {
                    { effect = "nightEye", magnitude = 50 },
                    { effect = "fortifyFatigue", magnitude = 35 },
                    { effect = "fortifyHealth", magnitude = 15 },
                },
                max = {
                    { effect = "nightEye", magnitude = 75 },
                    { effect = "fortifyFatigue", magnitude = 50 },
                    { effect = "fortifyHealth", magnitude = 25 },
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
                    { effect = "resistPoison", magnitude = 15 },
                },
                mid = {
                    { effect = "resistPoison", magnitude = 25 },
                    { effect = "resistBlightDisease", magnitude = 20 },
                },
                max = {
                    { effect = "resistPoison", magnitude = 40 },
                    { effect = "resistBlightDisease", magnitude = 35 },
                    { effect = "resistParalysis", magnitude = 20 },
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

end

event.register(tes3.event.initialized, registerTRSets)
