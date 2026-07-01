-- =========================================================================
--  Set Bonus -- NOD add-on (auto-generated)
--  Re-links NOD armour to the base Set Bonus sets via the interop. Loads only
--  NOTE: NOD depends on TR and OAAB; this add-on uses a lower event priority
--  (-200) so its relinks run after the TR and OAAB add-ons (priority -100).
--  when NOD items are present, so it is safe with or without NOD installed.
-- =========================================================================

local setBonus = require("Static.SetBonus.interop")

local function present(id) return tes3.getObject(id) ~= nil end

local function registerNOD()
    if not (setBonus and setBonus.version and setBonus.version >= 2) then return end

    if present("NOD_RV_adamantium boots") and setBonus.getSet("Adamantium") then
        setBonus.addItems("Adamantium", {
            "NOD_RV_adamantium boots", "NOD_RV_adamantium_cuirass", "NOD_RV_adamantium_helmet",
            "NOD_RV_adamantium_greaves", "NOD_RV_adamantium_Gauntlet_left", "NOD_RV_adamantium_Gauntlet_r",
            "NOD_RV_adamantium_pauldron_left", "NOD_RV_adamantium_pauldron_r", "NOD_RV_adamantium_robe_left",
            "NOD_RV_adamantium_robe_right", "NOD_RV_adamantium_cuirass 2", "NOD_RV_adamantium boots_red",
            "NOD_RV_adamantium_cuirass_red", "NOD_RV_adamantium_cuirass 2_red", "NOD_RV_adamantium_Gntlet_left_r",
            "NOD_RV_adamantium_Gauntlet_r_r", "NOD_RV_adamantium_helmet_red", "NOD_RV_adamantium_pauldron_l_rd",
            "NOD_RV_adamantium_pauldron_r_r", "NOD_RV_adamantium_robe_left_r", "NOD_RV_adamantium_robe_right_r",
            "AdNetch Pauldron Left", "AdNetch Boots", "AdNetch Gauntlet Left",
            "AdNetch Gauntlet Right", "AdNetch Cuirass", "AdNetch Greaves",
            "AdNetch Pauldron Right", "AdNetch Cuirass_II", "AdNetch Cuirass_III",
            "AdNetch Coat", "AdNetch Glove Left", "AdNetch Glove Right",
            "AdNetch Pauldron Left II", "AdNetch Pauldron Right II", "AdNetch Beast Boots",
            "Adnetch Shield", "NOD_AdNetch Pauldron Left", "NOD_AdNetch Boots",
            "NOD_AdNetch Gauntlet Left", "NOD_AdNetch Gauntlet Right", "NOD_AdNetch Cuirass",
            "NOD_AdNetch Greaves", "NOD_AdNetch Pauldron Right", "NOD_AdNetch Cuirass_II",
            "NOD_AdNetch Cuirass_III", "NOD_AdNetch Coat", "NOD_AdNetch Glove Left",
            "NOD_AdNetch Glove Right", "NOD_AdNetch Pauldron Left II", "NOD_AdNetch Pauldron Right II",
            "NOD_AdNetch Beast Boots", "NOD_Adnetch Shield",
        })
    end
    if present("NOD_RV_Chitin Helm D_hr") and setBonus.getSet("Chitin") then
        setBonus.addItems("Chitin", {
            "NOD_RV_Chitin Helm D_hr", "NOD_RV_Chitin Helm E_ht", "NOD_RV_Chitin Helm F_hh",
        })
    end
    if present("AK_cloth_helm_uni") and setBonus.getSet("Cloth") then
        setBonus.addItems("Cloth", {
            "AK_cloth_helm_uni", "NOD_hat_straw_vd_helm_cloth",
        })
    end
    if present("NOD_rv_Daedric_helm_dagon") and setBonus.getSet("Daedric") then
        setBonus.addItems("Daedric", {
            "NOD_rv_Daedric_helm_dagon", "NOD_rv_Daedric_helm_molag", "NOD_rv_Daedric_helm_sheo",
        })
    end
    if present("NOD_ARdres") and setBonus.getSet("House Dres") then
        setBonus.addItems("House Dres", {
            "NOD_ARdres",
        })
    end
    if present("NOD_dnk_dwem_boots") and setBonus.getSet("Dwemer") then
        setBonus.addItems("Dwemer", {
            "NOD_dnk_dwem_boots", "NOD_dnk_dwem_cuirass", "NOD_dnk_dwem_grv",
            "NOD_dnk_dwem_l_gaunt", "NOD_dnk_dwem_l_pauldron", "NOD_dnk_dwem_mask",
            "NOD_dnk_dwem_r_gaunt", "NOD_dnk_dwem_r_pauldron", "NOD_RV_dwemscr_boots",
            "NOD_RV_dwemscr_bracer_left", "NOD_RV_dwemscr_bracer_right", "NOD_RV_dwemscr_cuirass",
            "NOD_RV_dwemscr_helmet", "NOD_RV_dwemscr_greaves", "NOD_RV_dwemscr_pauldron_left",
            "NOD_RV_dwemscr_pauldron_right",
        })
    end
    if present("NOD_dnk_hlaalu_cuirass") and setBonus.getSet("House Hlaalu") then
        setBonus.addItems("House Hlaalu", {
            "NOD_dnk_hlaalu_cuirass", "NOD_ARhlaalu", "NOD_RV_Chitin Helm F_hh",
        })
    end
    if present("NOD_ARindoril") and setBonus.getSet("House Indoril") then
        setBonus.addItems("House Indoril", {
            "NOD_ARindoril", "NOD_ARindoril2", "NOD_AR_IndRobe1",
            "NOD_AR_IndHelm", "NOD_AR_IndRobe_nC1", "NOD_ARindoril_hood",
            "NOD_ARindoril_hood&Mask", "NOD_AR_indoril helmet2",
        })
    end
    if present("NOD_hat_iron_RM_HeadWear04") and setBonus.getSet("Iron") then
        setBonus.addItems("Iron", {
            "NOD_hat_iron_RM_HeadWear04", "NOD_hat_iron_RM_HeadWear05", "NOD_hat_iron_RM_HeadWear06",
            "NOD_hat_iron_RM_HeadWear_07", "NOD_hat_iron_RM_HeadWear_08", "NOD_hat_iron_RM_HeadWear_09",
        })
    end
    if present("NOD_R0_netch_leather_pauldron_l") and setBonus.getSet("Leather") then
        setBonus.addItems("Leather", {
            "NOD_R0_netch_leather_pauldron_l", "NOD_R0_netch_leather_pauldron_r",
        })
    end
    if present("NOD_hat_netch_RV_Netchimans Cap") and setBonus.getSet("Netch Leather") then
        setBonus.addItems("Netch Leather", {
            "NOD_hat_netch_RV_Netchimans Cap", "AdNetch Pauldron Left", "AdNetch Boots",
            "AdNetch Gauntlet Left", "AdNetch Gauntlet Right", "AdNetch Cuirass",
            "AdNetch Greaves", "AdNetch Pauldron Right", "AdNetch Cuirass_II",
            "AdNetch Cuirass_III", "AdNetch Coat", "AdNetch Glove Left",
            "AdNetch Glove Right", "AdNetch Pauldron Left II", "AdNetch Pauldron Right II",
            "AdNetch Beast Boots", "Adnetch Shield", "NOD_R0_netch_leather_pauldron_l",
            "NOD_R0_netch_leather_pauldron_r", "NOD_AdNetch Pauldron Left", "NOD_AdNetch Boots",
            "NOD_AdNetch Gauntlet Left", "NOD_AdNetch Gauntlet Right", "NOD_AdNetch Cuirass",
            "NOD_AdNetch Greaves", "NOD_AdNetch Pauldron Right", "NOD_AdNetch Cuirass_II",
            "NOD_AdNetch Cuirass_III", "NOD_AdNetch Coat", "NOD_AdNetch Glove Left",
            "NOD_AdNetch Glove Right", "NOD_AdNetch Pauldron Left II", "NOD_AdNetch Pauldron Right II",
            "NOD_AdNetch Beast Boots", "NOD_Adnetch Shield",
        })
    end
    if present("_RV_Orcishmask_1") and setBonus.getSet("Orcish") then
        setBonus.addItems("Orcish", {
            "_RV_Orcishmask_1", "_RV_Orcishmask_2",
        })
    end
    if present("NOD_RV_dwemscr_boots") and setBonus.getSet("Scrap") then
        setBonus.addItems("Scrap", {
            "NOD_RV_dwemscr_boots", "NOD_RV_dwemscr_bracer_left", "NOD_RV_dwemscr_bracer_right",
            "NOD_RV_dwemscr_cuirass", "NOD_RV_dwemscr_helmet", "NOD_RV_dwemscr_greaves",
            "NOD_RV_dwemscr_pauldron_left", "NOD_RV_dwemscr_pauldron_right",
        })
    end
    if present("NOD_hat_telv_RM_HeadWear_10") and setBonus.getSet("House Telvanni") then
        setBonus.addItems("House Telvanni", {
            "NOD_hat_telv_RM_HeadWear_10", "NOD_hat_telv_RM_HeadWear_11", "NOD_hat_telv_RM_HeadWear_12",
            "NOD_hat_shroomcap_telvanni", "NOD_ARtelvanni",
        })
    end
end

event.register(tes3.event.initialized, registerNOD, { priority = -200 })
