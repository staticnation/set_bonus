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
    -- >>> SETBONUS CLASS ARMOR (auto-generated by gen_class_sets.py) >>>
    if setBonus.getSet("Heavy Armor") then
        setBonus.addItems("Heavy Armor", {
            "t_nor_iron_boots_01", "t_nor_iron_gauntletl_01", "t_nor_iron_gauntletr_01", "t_nor_iron_greaves_01",
            "t_nor_iron_pauldronl_01", "t_nor_iron_pauldronr_01", "nod_dnk_qor_cuirass", "nod_dnk_qor_p_left",
            "nod_dnk_qor_p_right", "nod_dnk_mandas_cuirass", "nod_dnk_mandas_p_left", "nod_dnk_mandas_p_right",
            "nod_dnk_duke_cuirass", "nod_dnk_seanwen_cuirass", "nod_dnk_seanwen_p_left", "nod_dnk_seanwen_p_right",
            "nod_dnk_duke_p_left", "nod_dnk_duke_p_right", "nod_dnk_dwem_boots", "nod_dnk_dwem_cuirass",
            "nod_dnk_dwem_grv", "nod_dnk_dwem_l_gaunt", "nod_dnk_dwem_l_pauldron", "nod_dnk_dwem_mask",
            "nod_dnk_dwem_r_gaunt", "nod_dnk_dwem_r_pauldron", "nod_arimpbattlemage", "nod_ar_legionbm",
            "nod_rv_duke's_helmet", "nod_rv_duke's_greaves", "nod_rv_duke's_boots", "nod_rv_duke's_pauld_r",
            "nod_rv_duke's_pauld_l", "nod_rv_duke's_gauntlet_r", "nod_rv_duke's_gauntlet_l", "nod_rv_daedric_helm_dagon",
            "nod_rv_daedric_helm_molag", "nod_rv_daedric_helm_sheo", "nod_rv_hc_cuirass", "nod_rv_hc_greaves",
            "nod_rv_hc_helmet", "nod_rv_hc_boots", "nod_rv_hc_pauldron - left", "nod_rv_hc_pauldron - right",
            "nod_rv_hc_guantlet - left", "nod_rv_hc_guantlet - right", "nod_hat_mabrigash_ah_buglord", "nod_hat_iron_rm_headwear_07",
            "nod_hat_iron_rm_headwear_08", "nod_hat_iron_rm_headwear_09",
        })
    end
    if setBonus.getSet("Medium Armor") then
        setBonus.addItems("Medium Armor", {
            "t_de_dreugh_boots_01", "t_de_dreugh_bracerl_01", "t_de_dreugh_bracerr_01", "t_de_dreugh_greaves_01",
            "t_de_dreugh_pauldronl_01", "t_de_dreugh_pauldronr_01", "nod_dnk_sarano_cuirass", "nod_dnk_virith_cuirass",
            "nod_dnk_virith_p_left", "nod_dnk_virith_p_right", "nod_dnk_sixth_cuirass", "nod_dnk_hlaalu_cuirass",
            "nod_dnk_sala_cuirass", "nod_dnk_sala_p_left", "nod_dnk_sala_p_right", "nod_dnk_dagoth_cuirass",
            "nod_ardres", "nod_arhlaalu", "nod_arindoril", "nod_arindoril2",
            "nod_arredoran", "nod_arspellsword", "nod_artelvanni", "nod_ar_indrobe1",
            "nod_ar_indhelm", "nod_ar_indrobe_nc1", "nod_arindoril_hood", "nod_arindoril_hood&mask",
            "nod_ar_indoril helmet2", "nod_ar_pauldron left", "nod_ar_pauldron right", "adnetch pauldron left",
            "adnetch boots", "adnetch gauntlet left", "adnetch gauntlet right", "adnetch cuirass",
            "adnetch greaves", "adnetch pauldron right", "adnetch cuirass_ii", "adnetch cuirass_iii",
            "adnetch coat", "adnetch glove left", "adnetch glove right", "adnetch pauldron left ii",
            "adnetch pauldron right ii", "adnetch beast boots", "adnetch shield", "nod_rv_adamantium boots",
            "nod_rv_adamantium_cuirass", "nod_rv_adamantium_helmet", "nod_rv_adamantium_greaves", "nod_rv_adamantium_gauntlet_left",
            "nod_rv_adamantium_gauntlet_r", "nod_rv_adamantium_pauldron_left", "nod_rv_adamantium_pauldron_r", "nod_rv_adamantium_robe_left",
            "nod_rv_adamantium_robe_right", "nod_rv_adamantium_cuirass 2", "nod_rv_adamantium boots_red", "nod_rv_adamantium_cuirass_red",
            "nod_rv_adamantium_cuirass 2_red", "nod_rv_adamantium_gntlet_left_r", "nod_rv_adamantium_gauntlet_r_r", "nod_rv_adamantium_helmet_red",
            "nod_rv_adamantium_pauldron_l_rd", "nod_rv_adamantium_pauldron_r_r", "nod_rv_adamantium_robe_left_r", "nod_rv_adamantium_robe_right_r",
            "nod_rv_dwemscr_boots", "nod_rv_dwemscr_bracer_left", "nod_rv_dwemscr_bracer_right", "nod_rv_dwemscr_cuirass",
            "nod_rv_dwemscr_helmet", "nod_rv_dwemscr_greaves", "nod_rv_dwemscr_pauldron_left", "nod_rv_dwemscr_pauldron_right",
            "nod_pb_neen-enamor_cuirass", "nod_pb_neen-enamor_pauldron_l", "nod_pb_neen-enamor_pauldron_r", "nod_pb_neen-enamor_helm_01",
            "nod_pb_neen-enamor_helm_02", "nod_pb_neen-enamor_helm_03", "nod_pb_tshield_dagoth", "nod_pb_tshield_dagoth_g",
            "nod_pb_neen-enamor_greaves", "nod_hat_bug_b", "nod_hat_crab_ah_crabhatmask", "nod_ah_woodenshield",
            "nod_hat_ash_vd_gondaliergoggles", "nod_bka2_femcoat_k06", "nod_bka2_femcoat_k02", "nod_bka2_femcoat_k03",
        })
    end
    if setBonus.getSet("Light Armor") then
        setBonus.addItems("Light Armor", {
            "t_imp_studdedleather_bracerl_01", "t_imp_studdedleather_bracerr_01", "t_imp_studdedleather_greaves_01", "t_imp_studdedleather_helm_01",
            "t_imp_studdedleather_pauldrl_01", "t_imp_studdedleather_pauldrr_01", "nod_hat_turban04_war_kha_br", "nod_hat_turban04_war_kha_w",
            "nod_hat_turban04_war_kha_x_br", "nod_hat_turban04_war_kha_wx", "nod_hat_war_kha_mask01", "nod_hat_war_kha_mask02",
            "nod_war_misc_backpack01a", "nod_war_misc_backpack02a", "nod_war_misc_pouch01", "nod_war_misc_pouch04",
            "nod_dnk_missun_cuirass", "nod_dnk_eno_cuirass", "nod_rv_chitin helm d_hr", "nod_rv_chitin helm e_ht",
            "nod_rv_chitin helm f_hh", "nod_hat_netch_rv_netchimans cap", "nod_1ba_pauldron_right", "nod_1ba_pauldron_left",
            "nod_1ba_guantlet_right", "nod_1ba_bracer_left", "nod_1ba_greaves", "nod_1ba_cuirass",
            "nod_1ba_boots", "nod_1ba_cuirass02", "nod_1ba_helm", "nod_1ba_hood_",
            "nod_1ba_scarf_g", "nod_arimpofficial", "nod_arnightblade", "nod_mabrigash_ar01",
            "nod_mabrigash_ar02", "nod_mabrigash_ar04", "nod_mabrigash_ar03", "nod_admscarfred",
            "nod_admscarforange", "nod_admscarfyellow", "nod_admscarfgreen", "nod_admscarfblue",
            "nod_admscarfdeepblue", "nod_admscarfpurple", "nod_admscarfrose", "nod_admscarfgrey",
            "nod_admscarfblack", "nod_kd_femgdia", "nod_kd_femgem", "nod_kd_femgru",
            "nod_kd_femgsa", "nod_kd_femssa", "nod_kd_femsdia", "nod_kd_femsem",
            "nod_kd_femsru", "nod_earrings_01", "nod_earrings_02", "nod_earrings_03",
            "nod_earrings_03a", "nod_!aoi_veil_black", "nod_!aoi_veil_blue", "nod_!aoi_veil_green",
            "nod_!aoi_veil_lavender", "nod_!aoi_veil_olive", "nod_!aoi_veil_pink", "nod_kd_bandcopper",
            "nod_kd_bandgold", "nod_kd_bandmithril", "nod_kd_bandorc", "nod_kd_chainblack",
            "nod_kd_chainblackgems", "nod_kd_chaingold", "nod_kd_chainsilver", "nod_kd_chainsilvergems",
            "nod_kd_chaingoldgems", "nod_kd_circletbblue", "nod_kd_circletbgreen", "nod_kd_circletbpearl",
            "nod_kd_circletbred", "nod_kd_circletbtopaz", "nod_kd_circletgtopaz", "nod_kd_circletgblue",
            "nod_kd_circletggreen", "nod_kd_circletgpearl", "nod_kd_circletgred", "nod_kd_circletstopaz",
            "nod_kd_circletsred", "nod_kd_circletspearl", "nod_kd_circletsgreen", "nod_kd_circletsblue",
            "nod_kd_diag", "nod_kd_dias", "nod_kd_diagdia", "nod_kd_elvdia",
            "nod_kd_elvem", "nod_kd_elvru", "nod_kd_twin", "nod_kd_twins",
            "nod_kd_diagem", "nod_kd_diagru", "nod_kd_diagsa", "nod_kd_diasdia",
            "nod_kd_diasem", "nod_kd_diasru", "nod_kd_diassa", "nod_!aoi_scarf_black",
            "nod_!aoi_scarf_blue", "nod_!aoi_scarf_green", "nod_!aoi_scarf_purple", "nod_!aoi_scarf_red",
            "nod_!aoi_scarf_silver", "nod_!aoi_scarf_teal", "nod_!aoi_scarf_yellow", "nod_kd_g01",
            "nod_kd_g02", "nod_kd_g03", "nod_kd_g04", "nod_kd_g05",
            "nod_kd_g06", "nod_kd_g01r", "nod_kd_g06r", "nod_kd_g05r",
            "nod_kd_g04r", "nod_kd_g03r", "nod_kd_g02r", "nod_kd_s06r",
            "nod_kd_s06", "nod_kd_s05r", "nod_kd_s05", "nod_kd_s04r",
            "nod_kd_s04", "nod_kd_s03r", "nod_kd_s03", "nod_kd_s02r",
            "nod_kd_s02", "nod_kd_s01r", "nod_kd_s01", "nod_!aoi_01black1",
            "nod_!aoi_01black2", "nod_!aoi_01brown1", "nod_!aoi_01brown2", "nod_!aoi_01red1",
            "nod_!aoi_01red2", "nod_!aoi_02black1", "nod_!aoi_02black2", "nod_!aoi_02black3",
            "nod_!aoi_02brown1", "nod_!aoi_02brown2", "nod_!aoi_02brown3", "nod_!aoi_02red1",
            "nod_!aoi_02white3", "nod_!aoi_03black1", "nod_!aoi_03black1s", "nod_!aoi_03brown1",
            "nod_!aoi_03red1", "nod_!aoi_03white1", "nod_!aoi_20black1", "nod_!aoi_20black1s",
            "nod_!aoi_20brown2", "nod_!aoi_20red1s", "nod_!aoi_20white1", "nod_!aoi_21black1",
            "nod_!aoi_21black1s", "nod_!aoi_21brown1", "nod_!aoi_21brown2", "nod_!aoi_21white1",
            "nod_!aoi_22black1", "nod_!aoi_22red1", "nod_!aoi_23black2", "nod_!aoi_23black2s",
            "nod_!aoi_23red1", "nod_!aoi_11black1", "nod_!aoi_11black1s", "nod_!aoi_11brown1",
            "nod_!aoi_11red1s", "nod_!aoi_11brown1s", "nod_!aoi_11white1", "nod_!aoi_17black",
            "nod_!aoi_17blacks", "nod_!aoi_17brown", "nod_!aoi_17browns", "nod_!aoi_17reds",
            "nod_!aoi_17white", "nod_!aoi_12black1", "nod_!aoi_12black1s", "nod_!aoi_12black2",
            "nod_!aoi_12brown1", "nod_!aoi_12brown2", "nod_!aoi_12red2", "nod_!aoi_12white2",
            "nod_!aoi_24red1", "nod_!aoi_24black2", "nod_!aoi_24black3", "nod_!aoi_24black4",
            "nod_!aoi_24brown1", "nod_!aoi_24brown2", "nod_!aoi_24brown3", "nod_!aoi_24red4",
            "nod_!aoi_24white1", "nod_!aoi_13black1", "nod_!aoi_13black1s", "nod_!aoi_13brown1",
            "nod_!aoi_13brown1s", "nod_!aoi_13red1", "nod_!aoi_13white1", "nod_!aoi_14black",
            "nod_!aoi_14blacks", "nod_!aoi_14browns", "nod_!aoi_14reds", "nod_!aoi_14white",
            "nod_!aoi_16black", "nod_!aoi_16blacks", "nod_!aoi_16brown", "nod_!aoi_16red",
            "nod_!aoi_16whites", "nod_!aoi_15black", "nod_!aoi_15blacks", "nod_!aoi_15brown",
            "nod_!aoi_15browns", "nod_!aoi_15red", "nod_!aoi_15white", "nod_!aoi_31black1",
            "nod_!aoi_31black2", "nod_!aoi_31red2s", "nod_!aoi_31black3", "nod_!aoi_31brown1",
            "nod_!aoi_31white2", "nod_!aoi_31brown3", "nod_!aoi_31brown3s", "nod_!aoi_31red1",
            "nod_!aoi_31white2s", "nod_!aoi_35black", "nod_!aoi_35brown", "nod_!aoi_35red",
            "nod_!aoi_35white", "nod_!aoi_23white2", "nod_!aoi_23brown2s", "nod_rv_sacred_necro_boots",
            "nod_rv_sacred_necro_cuirass", "nod_rv_sacred_necro_bracer_l", "nod_rv_sacred_necro_bracer_r", "nod_rv_sacred_necro_greaves",
            "nod_rv_sacred_necro_hood", "nod_rv_sacred_necro_pauld_l", "nod_rv_sacred_necro_pauld_r", "nod_rv_necromask",
            "nod_rv_archnecromask", "nod_rv_necroboots", "nod_rv_necrohood", "nod_rv_archnecrohood",
            "nod_retex_6th_robe1", "nod_retex_6th_ar_lbcuirass2", "ak_cloth_helm_uni", "nod_hat_ash_ah_dustmask",
            "nod_hat_ash_r0_gogglehood_w", "nod_hat_mabrigash_r0_mask", "nod_hat_shroomcap_emperor", "nod_hat_shroomcap_b",
            "nod_hat_shroomcap_br", "nod_hat_shroomcap_w", "nod_hat_bug_g", "nod_hat_shroomcap_telvanni",
            "nod_hat_shroomcowl", "nod_hat_turban01_rm", "nod_hat_turban02_rm", "nod_hat_turban03_rm",
            "nod_hat_crab_rm_mcrabhelm01", "nod_hat_crab_rm_mcrabhelm02", "nod_hat_crab_rm_mcrabhelm03", "nod_rm_mcrabshield01",
            "nod_rm_mcrabshield02", "nod_rm_mcrabshield03", "nod_hat_iron_rm_headwear04", "nod_hat_iron_rm_headwear05",
            "nod_hat_iron_rm_headwear06", "nod_hat_straw_rm_wickerhelmet01", "nod_hat_straw_rm_wickerhelmet02", "nod_hat_straw_rm_wickerhelmet03",
            "nod_rm_wickershield01", "nod_rm_wickershield02", "nod_rm_wickershield03", "nod_hat_telv_rm_headwear_10",
            "nod_hat_telv_rm_headwear_11", "nod_hat_telv_rm_headwear_12", "nod_r0_netch_leather_pauldron_l", "nod_r0_netch_leather_pauldron_r",
            "nod_hat_straw_vd_helmclosed", "nod_hat_crab_vd_mudcrabhat", "nod_hat_straw_vd_helm_cloth", "nod_hat_crab_vd_03cloth_googles",
            "nod_hat_netch_vd_boil_helm_open", "nod_hat_ash_ah_gogglehood_br", "nod_hat_crab_vd_mcrabhelmgoggle", "nod_hat_netch_vd_moragtong_mask",
            "nod_retex_2pl_mvest_1", "nod_retex_2pl_mvest_1_dk", "nod_retex_2pl_mvest_1_k", "nod_as_goth3_hat_01",
            "nod_as_goth3_hat_02", "nod_as_goth3_hat_03", "nod_as_goth3_hat_04", "nod_as_goth3_hat_05",
            "nod_as_goth3_hat_06", "nod_as_goth3_hat_07", "nod_as_goth3_hat_10", "nod_as_goth3_hat_11",
            "nod_as_goth3_hat_12", "nod_as_goth4_velvcoat1_r", "nod_as_goth4_velvcoat2_bl", "nod_as_goth4_velvcoat3_p",
            "nod_as_goth4_velvcoat4_g", "nod_as_goth4_velvcoat5_bk", "nod_as_goth4_broccoat1_p", "nod_as_goth4_broccoat2_r",
            "nod_as_goth4_broccoat3_g", "nod_as_goth4_broccoat4_bl", "nod_as_goth4_broccoat5_bk", "nod_as_goth4_webscoat",
            "nod_as_goth4_workboot_1_bk", "nod_as_goth4_workboot_2_br", "nod_rv_necromask_nolens", "_rv_antlers_1",
            "_rv_antlers_2", "_rv_horns_1", "_rv_horns_2", "_rv_horns_3",
            "_rv_ears_1", "_rv_ears_2", "_rv_glasses1", "_rv_glasses2",
            "_rv_glasses3", "_rv_glasses4", "_rv_goggles1", "_rv_goggles2",
            "_rv_goggles3", "_rv_goggles4", "_rv_glasses4s", "_rv_glasses2s",
            "_rv_glasses1s", "_rv_goggles5", "_rv_goggles6", "_rv_goggles7",
            "_rv_goggles8", "_rv_lenses1", "_rv_blindfold1", "_rv_eyepatch1l",
            "_rv_lenses2", "_rv_eyepatch1r", "_rv_facewrap_1", "_rv_facewrap_2",
            "_rv_facewrap_3", "_rv_facewrap_4", "_rv_facewrap_5", "_rv_facewrap_6",
            "_rv_facewrap_7", "_rv_facewrap_8", "_rv_ashmask_1", "_rv_ashmask_2",
            "_rv_ashmask_3", "_rv_daedramask_1", "_rv_daedramask_2", "_rv_daedramask_3",
            "_rv_orcishmask_1", "_rv_daedramask_4", "_rv_orcishmask_2", "nod_adnetch pauldron left",
            "nod_adnetch boots", "nod_adnetch gauntlet left", "nod_adnetch gauntlet right", "nod_adnetch cuirass",
            "nod_adnetch greaves", "nod_adnetch pauldron right", "nod_adnetch cuirass_ii", "nod_adnetch cuirass_iii",
            "nod_adnetch coat", "nod_adnetch glove left", "nod_adnetch glove right", "nod_adnetch pauldron left ii",
            "nod_adnetch pauldron right ii", "nod_adnetch beast boots", "nod_adnetch shield", "nod_bka2_femcoat_k07",
            "nod_bka2_femcoat_k08", "nod_bka2_thief_armor2", "nod_retex_bka2_coat_of_arm1", "nod_retex_bka2_coat_of_arm2",
            "nod_bka2_femcoat_k09", "ko_eye_patch_armor", "nod_ko_professional_curiass", "nod_ko_professional_boots_arm",
        })
    end
    -- <<< SETBONUS CLASS ARMOR <<<
end

event.register(tes3.event.initialized, registerNOD, { priority = -200 })
