-- Set Bonus data for OpenMW (auto-generated from the MWSE project).
-- Each set: name, tier thresholds (pieces), bonus effects per tier, and item IDs.
-- Effect ids are OpenMW MagicEffectId strings; skills/attributes are lowercase ids.
return {
  {
    name = "Adamantium",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="reflect", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="reflect", mag=8},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "adamantium_helm", "addamantium_helm", "adamantium_cuirass", "adamantium_pauldron_left",
      "adamantium_pauldron_right", "adamantium_greaves", "adamantium boots", "adamantium_bracer_left",
      "adamantium_bracer_right", "helm_tohan_unique", "nod_rv_adamantium boots", "nod_rv_adamantium_cuirass",
      "nod_rv_adamantium_helmet", "nod_rv_adamantium_greaves", "nod_rv_adamantium_gauntlet_left", "nod_rv_adamantium_gauntlet_r",
      "nod_rv_adamantium_pauldron_left", "nod_rv_adamantium_pauldron_r", "nod_rv_adamantium_robe_left", "nod_rv_adamantium_robe_right",
      "nod_rv_adamantium_cuirass 2", "nod_rv_adamantium boots_red", "nod_rv_adamantium_cuirass_red", "nod_rv_adamantium_cuirass 2_red",
      "nod_rv_adamantium_gntlet_left_r", "nod_rv_adamantium_gauntlet_r_r", "nod_rv_adamantium_helmet_red", "nod_rv_adamantium_pauldron_l_rd",
      "nod_rv_adamantium_pauldron_r_r", "nod_rv_adamantium_robe_left_r", "nod_rv_adamantium_robe_right_r", "adnetch pauldron left",
      "adnetch boots", "adnetch gauntlet left", "adnetch gauntlet right", "adnetch cuirass",
      "adnetch greaves", "adnetch pauldron right", "adnetch cuirass_ii", "adnetch cuirass_iii",
      "adnetch coat", "adnetch glove left", "adnetch glove right", "adnetch pauldron left ii",
      "adnetch pauldron right ii", "adnetch beast boots", "adnetch shield", "nod_adnetch pauldron left",
      "nod_adnetch boots", "nod_adnetch gauntlet left", "nod_adnetch gauntlet right", "nod_adnetch cuirass",
      "nod_adnetch greaves", "nod_adnetch pauldron right", "nod_adnetch cuirass_ii", "nod_adnetch cuirass_iii",
      "nod_adnetch coat", "nod_adnetch glove left", "nod_adnetch glove right", "nod_adnetch pauldron left ii",
      "nod_adnetch pauldron right ii", "nod_adnetch beast boots", "nod_adnetch shield",
    },
  },
  {
    name = "Alessian Bronze",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistmagicka", mag=5},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistmagicka", mag=8},
        {effect="fortifyattack", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistmagicka", mag=12},
        {effect="fortifyattack", mag=8},
        {effect="turnundead", mag=20},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "t_imp_alessianbrnz_boots_01", "t_imp_alessianbrnz_cuirass_01", "t_imp_alessianbrnz_gauntletl_01", "t_imp_alessianbrnz_gauntletr_01",
      "t_imp_alessianbrnz_helm_01", "t_imp_alessianbrnz_pauldronl_01", "t_imp_alessianbrnz_pauldronr_01", "t_imp_alessianbrnz_tshield_01",
    },
  },
  {
    name = "Alit Hide",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="agility", mag=3},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="resistpoison", mag=15},
        {effect="fortifyskill", skill="athletics", mag=8},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="resistpoison", mag=20},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_de_alithide_boots_01", "t_de_alithide_bracerl_01", "t_de_alithide_bracerl_poison", "t_de_alithide_bracerr_01",
      "t_de_alithide_bracerr_poison", "t_de_alithide_cuirass_01", "t_de_alithide_greaves_01", "t_de_alithide_helmopen_01",
      "t_de_alithide_helm_01", "t_de_alithide_pauldronl_01", "t_de_alithide_pauldronr_01", "t_de_alithide_shield_01",
      "t_de_alithide_shield_fatigue", "t_de_alithide_towershield_01",
    },
  },
  {
    name = "Altmer",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyattribute", attribute="intelligence", mag=3},
      },
      mid = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyattribute", attribute="intelligence", mag=5},
        {effect="fortifyskill", skill="destruction", mag=8},
        {effect="weaknesstomagicka", mag=10},
      },
      max = {
        {effect="restoremagicka", mag=2, dur=1},
        {effect="fortifyattribute", attribute="intelligence", mag=8},
        {effect="fortifyskill", skill="destruction", mag=12},
        {effect="fortifyskill", skill="alteration", mag=12},
        {effect="weaknesstomagicka", mag=20},
      },
    },
    items = {
      "t_he_altmerglass_boots_01", "t_he_altmerglass_cuirass_01", "t_he_altmerglass_greaves_01", "t_he_altmerglass_helm_01",
      "t_he_altmerglass_helm_02", "t_he_altmerglass_l_bracer_01", "t_he_altmerglass_l_pauldron_01", "t_he_altmerglass_r_bracer_01",
      "t_he_altmerglass_r_pauldron_01", "t_he_direnni_boots_01", "t_he_direnni_bracerl_01", "t_he_direnni_bracerr_01",
      "t_he_direnni_cuirass_01", "t_he_direnni_greaves_01", "t_he_direnni_helm_01", "t_he_direnni_pauldronl_01",
      "t_he_direnni_pauldronr_01",
      -- vanilla Altmer-craft gear (union of: Glass) -- kept in step with
      -- the runtime union in MWSE/mods/Static/SetBonusTR/main.lua
      "glass_helm", "glass_cuirass", "glass_shield", "glass_towershield",
      "glass_pauldron_left", "glass_pauldron_right", "glass_boots", "glass_greaves",
      "glass_bracer_left", "glass_bracer_right", "atl_a_buck_glass", "atl_a_buck_glass_h",
      "atl_a_buck_glass_kissalessia", "atl_a_buck_glass_h_delyns_kiln", "atl_a_buck_glass_wizards_ward", "t_de_glass_helm_closed_01",
      "ab_a_glassassassinpauldronleft", "ab_a_glassassassinpauldronright", "ab_a_glasshelmclose", "aatl_a_buck_glass",
      "aatl_a_buck_glass_h", "aatl_a_buck_glass_h_en1", "aatl_a_buck_glass_en1",
    },
  },
  {
    name = "Ancient Nordic",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="turnundead", mag=20},
      },
    },
    items = {
      "t_nor_ancient_boots_01", "t_nor_ancient_bracerl_01", "t_nor_ancient_bracerr_01", "t_nor_ancient_cuirass_01",
      "t_nor_ancient_greaves_01", "t_nor_ancient_helm_01", "t_nor_ancient_helm_02", "t_nor_ancient_helm_03",
      "t_nor_ancient_pauldronl_01", "t_nor_ancient_pauldronl_02", "t_nor_ancient_pauldronr_01", "t_nor_ancient_pauldronr_02",
      "t_nor_ancient_shield", "t_nor_ancient_shield_01",
    },
  },
  {
    name = "Anvil",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=20},
      },
      mid = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=30},
        {effect="resistfrost", mag=15},
      },
      max = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=40},
        {effect="resistfrost", mag=20},
        {effect="fortifyattribute", attribute="personality", mag=8},
      },
    },
    items = {
      "t_imp_guardtown1_boots_01", "t_imp_guardtown1_cuirass_01", "t_imp_guardtown1_gauntletl_01", "t_imp_guardtown1_gauntletr_01",
      "t_imp_guardtown1_greaves_01", "t_imp_guardtown1_helm_01", "t_imp_guardtown1_helmanv_01", "t_imp_guardtown1_helmstr_01",
      "t_imp_guardtown1_helmsut_01", "t_imp_guardtown1_pauldrl_01", "t_imp_guardtown1_pauldrr_01", "t_imp_guardtown1_shieldanv_01",
    },
  },
  {
    name = "Argonian",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="waterbreathing", mag=1},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="waterbreathing", mag=1},
        {effect="resistpoison", mag=15},
        {effect="resistcommondisease", mag=15},
        {effect="swiftswim", mag=30},
      },
      max = {
        {effect="waterbreathing", mag=1},
        {effect="resistpoison", mag=20},
        {effect="resistcommondisease", mag=20},
        {effect="swiftswim", mag=40},
        {effect="restorehealth", mag=1, dur=1},
      },
    },
    items = {
      "t_arg_hist_cuirass_01", "t_arg_hist_cuirass_freedom", "t_arg_hist_cuirass_visitor",
    },
  },
  {
    name = "Armun-An",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyhealth", mag=12},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "bonemold_armun-an_helm", "bonemold_armun-an_pauldron_r", "bonemold_armun-an_pauldron_l", "bonemold_armun-an_cuirass",
    },
  },
  {
    name = "Artifacts",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
        {effect="fortifyattribute", attribute="luck", mag=3},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="fortifyattribute", attribute="luck", mag=5},
        {effect="reflect", mag=5},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="fortifyattribute", attribute="luck", mag=8},
        {effect="reflect", mag=8},
        {effect="spellabsorption", mag=8},
      },
    },
    items = {
      "", "aatl_art_targe_blooded", "aatl_art_visage_mzund", "aatl_art_fearstruck",
      "aatl_art_buck_manarend", "aatl_art_targe_blooded_f", "aatl_art_buck_manarend_f", "aatl_art_fearstruck_f",
      "aatl_art_visage_mzund_f",
    },
  },
  {
    name = "Ayleid",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="light", mag=8},
      },
      mid = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="spellabsorption", mag=5},
      },
      max = {
        {effect="restoremagicka", mag=2, dur=1},
        {effect="spellabsorption", mag=8},
        {effect="resistmagicka", mag=12},
      },
    },
    items = {
      "t_ayl_saliache_boots_01", "t_ayl_saliache_bracerl_01", "t_ayl_saliache_bracerr_01", "t_ayl_saliache_cuirass_01",
      "t_ayl_saliache_greaves_01", "t_ayl_saliache_helm_01", "t_ayl_saliache_pauldronl_01", "t_ayl_saliache_pauldronr_01",
      "t_ayl_saliache_shield_01",
    },
  },
  {
    name = "Bal-Darum",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistblightdisease", mag=10},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="resistblightdisease", mag=15},
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="resistblightdisease", mag=20},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
      },
    },
    items = {
      "t_de_bonemold_stone_boots", "t_de_bonemold_stone_cuirass", "t_de_bonemold_stone_gauntletl", "t_de_bonemold_stone_gauntletr",
      "t_de_bonemold_stone_greaves", "t_de_bonemold_stone_helm", "t_de_bonemold_stone_pauldl", "t_de_bonemold_stone_pauldr",
    },
  },
  {
    name = "Bear Fur",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="fortifyattribute", attribute="endurance", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "bm bear boots", "bm bear cuirass", "bm bear left gauntlet", "bm bear right gauntlet",
      "bm bear greaves", "bm bear helmet", "bm bear right pauldron", "bm bear left pauldron",
      "bm_bear_boots_snow", "bm_bear_cuirass_snow", "bm_bear_greaves_snow", "bm_bear_helmet_snow",
      "bm_bear_left_gauntlet_snow", "bm_bear_left_pauldron_snow", "bm_bear_right_gauntlet_snow", "bm_bear_right_pauldron_snow",
      "bm bear helmet eddard", "bm bear helmet_ber", "bm bear shield",
    },
  },
  {
    name = "Bearskin",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="fortifyattribute", attribute="strength", mag=3},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="fortifyattribute", attribute="strength", mag=5},
        {effect="fortifyhealth", mag=12},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="fortifyattribute", attribute="strength", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "fur_bearskin_cuirass", "t_nor_bearskin_helm_01", "t_nor_bearskin_pauldronl_01", "t_nor_bearskin_pauldronr_01",
      "t_nor_bearskin_greaves_01", "t_nor_bearskin_boots_01", "t_nor_bearskin_bracerl_01", "t_nor_bearskin_bracerr_01",
    },
  },
  {
    name = "Bonemold",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistblightdisease", mag=15},
        {effect="restorefatigue", mag=2, dur=1},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistblightdisease", mag=20},
        {effect="restorefatigue", mag=2, dur=1},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "bonemold_helm", "bonemold_cuirass", "bonemold_pauldron_l", "bonemold_pauldron_r",
      "bonemold_bracer_left", "bonemold_bracer_right", "bonemold greaves", "bonemold_boots",
      "bonemold_shield", "bonemold_armun-an_helm", "bonemold_armun-an_cuirass", "bonemold_armun-an_pauldron_l",
      "bonemold_armun-an_pauldron_r", "bonemold_gah-julan_helm", "bonemold_gah-julan_cuirass", "bonemold_gah-julan_pauldron_l",
      "bonemold_gah-julan_pauldron_r", "bonemold_chuzei_helm", "bonemold_founders_helm", "redoran_master_helm",
      "bonemold_towershield", "bonemold_tshield_hlaaluguard", "bonemold_tshield_redoranguard", "bonemold_tshield_telvanniguard",
      "erur_dan_cuirass_unique", "heart wall", "mountain spirit", "storm helm",
      "bonemold_gah-julan_hhda", "lbonemold brace of horny fist", "rbonemold bracer of horny fist", "holy_tower_shield",
      "bonemold_tshield_hrlb", "holy_shield", "morag_tong_helm", "bonemold_greaves",
      "aa_bonemold_boots_bad", "t_de_bonemold_chuzei_boots", "t_de_bonemold_chuzei_boots_e", "t_de_bonemold_chuzei_bracerl",
      "t_de_bonemold_chuzei_bracerl_e", "t_de_bonemold_chuzei_bracerr", "t_de_bonemold_chuzei_bracerr_e", "t_de_bonemold_chuzei_cuirass",
      "t_de_bonemold_chuzei_cuirass_e", "t_de_bonemold_chuzei_greaves", "t_de_bonemold_chuzei_greaves_e", "t_de_bonemold_chuzei_helm_e",
      "t_de_bonemold_chuzei_pauldl", "t_de_bonemold_chuzei_pauldl_e", "t_de_bonemold_chuzei_pauldr", "t_de_bonemold_chuzei_pauldr_e",
      "t_de_bonemold_helmopen_01", "t_de_bonemold_helmrider_01", "t_de_bonemold_stone_boots", "t_de_bonemold_stone_cuirass",
      "t_de_bonemold_stone_gauntletl", "t_de_bonemold_stone_gauntletr", "t_de_bonemold_stone_greaves", "t_de_bonemold_stone_helm",
      "t_de_bonemold_stone_pauldl", "t_de_bonemold_stone_pauldr", "t_de_bonemold_ulvra_boots", "t_de_bonemold_ulvra_bracerl",
      "t_de_bonemold_ulvra_bracerr", "t_de_bonemold_ulvra_cuirass", "t_de_bonemold_ulvra_greaves", "t_de_bonemold_ulvra_helm",
      "t_de_bonemold_ulvra_pauldl", "t_de_bonemold_ulvra_pauldr", "t_de_bonemoldkrage_boots_01", "t_de_bonemoldkrage_cuirass_01",
      "t_de_bonemoldkrage_gauntletl_01", "t_de_bonemoldkrage_gauntletr_01", "t_de_bonemoldkrage_greaves_01", "t_de_bonemoldkrage_helm_01",
      "t_de_bonemoldkrage_pauldronl_01", "t_de_bonemoldkrage_pauldronr_01", "t_de_bonemoldkragen_helm_01", "t_de_bonemoldmarad_cuirass_01",
      "t_de_bonemoldmarad_helm_01", "t_de_bonemoldmarad_helm_02", "t_de_bonemoldmarad_pauldronl_01", "t_de_bonemoldmarad_pauldronr_01",
      "t_de_bonemoldmarad_shield_01", "t_de_bonemoldsammas_helm_01", "t_de_dresbonemold_boots_01", "t_de_dresbonemold_cuirass_01",
      "t_de_dresbonemold_gauntletl_01", "t_de_dresbonemold_gauntletr_01", "t_de_dresbonemold_greaves_01", "t_de_dresbonemold_helm_01",
      "t_de_dresbonemold_pauldronl_01", "t_de_dresbonemold_pauldronr_01", "t_de_dresbonemold_shieldtow_01", "t_de_indbonemold_boots_01",
      "t_de_indbonemold_cuirass_01", "t_de_indbonemold_gauntletl_01", "t_de_indbonemold_gauntletr_01", "t_de_indbonemold_greaves_01",
      "t_de_indbonemold_helmsaviour_01", "t_de_indbonemold_pauldronl_01", "t_de_indbonemold_pauldronl_02", "t_de_indbonemold_pauldronr_01",
      "t_de_indbonemold_pauldronr_02", "t_de_indbonemold_shield_01", "t_de_indbonemold_shield_02", "t_de_indbonemold_shield_03",
      "t_de_indbonemold_shield_04", "t_de_indbonemold_shield_05", "t_de_redbonemold_helmopen_01", "t_de_redherobonemold_cuirass_01",
      "t_de_redherobonemold_helm_01", "t_de_redherobonemold_helm_02", "t_de_redherobonemold_helm_03", "t_de_redherobonemold_pauldrl_01",
      "t_de_redherobonemold_pauldrr_01", "t_de_redmastbonemold_cuirass_01", "t_de_redmastbonemold_pauldrl_01", "t_de_redmastbonemold_pauldrr_01",
      "t_de_thirrbonemold_boots_01", "t_de_thirrbonemold_bracer_01_l", "t_de_thirrbonemold_bracer_01_r", "t_de_thirrbonemold_cuirass_01",
      "t_de_thirrbonemold_greaves_01", "t_de_thirrbonemold_helm_01", "t_de_thirrbonemold_pauldrn_01_l", "t_de_thirrbonemold_pauldrn_01_r",
      "tr_i2-235_bonemold_towershield",
    },
  },
  {
    name = "Bosmer",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="fortifyattribute", attribute="agility", mag=3},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="fortifyskill", skill="marksman", mag=8},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="fortifyskill", skill="marksman", mag=12},
        {effect="resistcommondisease", mag=20},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Breton",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="spellabsorption", mag=5},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="spellabsorption", mag=8},
        {effect="fortifyskill", skill="conjuration", mag=12},
      },
    },
    items = {
      "t_bre_bjoulsaefur_helm_01", "t_bre_ep_hatwizard_01", "t_bre_ep_hatwizard_02", "t_bre_mithril_shield_01",
      "t_bre_uni_lordlyheatershield", "t_bre_uni_trickstershield", "t_bre_woodenheater_shield_01", "t_bre_woodenheater_shield_02",
      "t_bre_woodenheater_shield_03", "t_bre_woodenheater_shield_04", "t_bre_woodenheater_shield_05", "t_bre_woodenheater_shield_06",
      "t_bre_woodenheater_shield_07", "t_bre_woodenheater_shield_08", "t_bre_woodenheater_shield_09", "t_bre_woodenheater_shield_10",
      "t_bre_woodenheater_shield_11", "t_bre_woodenheater_shield_12", "t_bre_woodenheater_shield_13",
    },
  },
  {
    name = "Bronze",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="resistshock", mag=10},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="resistshock", mag=15},
        {effect="fortifyattribute", attribute="endurance", mag=5},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="resistshock", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
      },
    },
    items = {
      "_wyrm_bronze_helm_crested", "_wyrm_bronze_towershield", "_wyrm_bronze_helmet", "_wyrm_bronze_shield",
      "t_imp_colbronzeold_helm_01", "t_imp_nibbronze_boots_01", "t_imp_nibbronze_bracerl_01", "t_imp_nibbronze_bracerr_01",
      "t_imp_nibbronze_cuirass_01", "t_imp_nibbronze_greaves_01", "t_imp_nibbronze_helm_01", "t_imp_nibbronze_pauldronl_01",
      "t_imp_nibbronze_pauldronr_01",
    },
  },
  {
    name = "Cataphract",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="fortifyattack", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="fortifyattack", mag=5},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattack", mag=8},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "t_imp_guardtown1_boots_01", "t_imp_guardtown1_cuirass_01", "t_imp_guardtown1_gauntletl_01", "t_imp_guardtown1_gauntletr_01",
      "t_imp_guardtown1_greaves_01", "t_imp_guardtown1_helm_01", "t_imp_guardtown1_helmanv_01", "t_imp_guardtown1_helmstr_01",
      "t_imp_guardtown1_helmsut_01", "t_imp_guardtown1_pauldrl_01", "t_imp_guardtown1_pauldrr_01",
    },
  },
  {
    name = "Cephalopod",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="swiftswim", mag=20},
        {effect="waterbreathing", mag=1},
      },
      mid = {
        {effect="swiftswim", mag=30},
        {effect="waterbreathing", mag=1},
        {effect="sanctuary", mag=7},
      },
      max = {
        {effect="swiftswim", mag=40},
        {effect="waterbreathing", mag=1},
        {effect="sanctuary", mag=10},
        {effect="resistfrost", mag=20},
      },
    },
    items = {
      "cephalopod_helm", "demon cephalopod", "devil cephalopod helm", "cephalopod_helm_htnk",
      "t_de_fiendcephalopodhelm_01", "t_de_telvcephalopod_boots_01", "t_de_telvcephalopod_cuirass_01", "t_de_telvcephalopod_gauntl_01",
      "t_de_telvcephalopod_gauntr_01", "t_de_telvcephalopod_greaves_01", "t_de_telvcephalopod_pauldl_01", "t_de_telvcephalopod_pauldr_01",
      "ab_a_cephhelmopen", "ab_a_cephpauldronleft", "ab_a_cephpauldronright",
    },
  },
  {
    name = "Chain Mail",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "imperial_chain_pauldron_right", "imperial_chain_pauldron_left", "imperial_chain_greaves", "imperial_chain_coif_helm",
      "imperial_chain_cuirass", "_wyrm_chain_coif", "t_com_chain_cuirass_01", "t_com_chain_cuirass_02",
      "t_com_chain_cuirass_03", "t_imp_chain_boots_01", "t_imp_chain_gauntletl_01", "t_imp_chain_gauntletr_02",
      "t_imp_chainmail_cuirass_01", "t_imp_chainmail_cuirass_02", "t_imp_chainmail_cuirass_03", "t_imp_chainmail_cuirass_04",
      "t_imp_chainmail_helm_01", "t_imp_chainmail_helm_02", "t_imp_chainmail_helm_03", "t_imp_chainmail_helm_04",
      "tr_m4_il_chaincuirass",
    },
  },
  {
    name = "Chap-thil",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_dreschapthil_helm_01a", "t_de_dreschapthil_helm_01b", "t_de_dreschapthil_helm_01c", "t_de_dreschapthil_helm_01d",
      "t_de_dreschapthil_helm_01e", "t_de_dreschapthil_helm_02a", "t_de_dreschapthil_helm_02b", "t_de_dreschapthil_helm_02c",
      "t_de_dreschapthil_helm_02d", "t_de_dreschapthil_helm_02e", "t_de_dreschapthil_helm_03a", "t_de_dreschapthil_helm_03b",
      "t_de_dreschapthil_helm_03c", "t_de_dreschapthil_helm_03d", "t_de_dreschapthil_helm_03e",
    },
  },
  {
    name = "Chev-Aram",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="fortifyattack", mag=3},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyattack", mag=5},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyattack", mag=8},
        {effect="fortifyhealth", mag=18},
      },
    },
    items = {
      "t_de_indchevaram_boots_01", "t_de_indchevaram_bracerl_01", "t_de_indchevaram_bracerr_01", "t_de_indchevaram_cuirass_01",
      "t_de_indchevaram_greaves_01", "t_de_indchevaram_helm_01", "t_de_indchevaram_helm_02", "t_de_indchevaram_pauldrl_01",
      "t_de_indchevaram_pauldrr_01",
    },
  },
  {
    name = "Chitin",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistblightdisease", mag=10},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="resistblightdisease", mag=15},
        {effect="resistpoison", mag=15},
        {effect="resistparalysis", mag=15},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistblightdisease", mag=20},
        {effect="resistpoison", mag=20},
        {effect="resistparalysis", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "chitin cuirass", "chitin helm", "chitin_mask_helm", "chitin pauldron - left",
      "chitin pauldron - right", "chitin guantlet - left", "chitin guantlet - right", "chitin greaves",
      "chitin boots", "chitin_shield", "chitin_towershield", "chitin_watchman_helm",
      "cephalopod_helm", "dust_adept_helm", "mole_crab_helm", "the_chiding_cuirass",
      "chest of fire", "merisan helm", "velothian_helm", "boneweave gauntlet",
      "left gauntlet of the horny fist", "right gauntlet of horny fist", "shield of the undaunted", "devil mole crab helm",
      "demon mole crab", "fiend helm", "devil helm", "demon helm",
      "cephalopod_helm_htnk", "devil cephalopod helm", "demon cephalopod", "veloths_shield",
      "velothian shield", "bonedancer gauntlet", "atl_a_buck_chitin_almsivi", "atl_a_buck_chitin_seryns_brew",
      "t_a_dechitinhelmopen01_hrpen", "t_a_deredwatchchitincuir01_cuirass", "t_de_redwatchchitin_pauldrl_01", "t_de_redwatchchitin_pauldrr_01",
      "t_a_deredwatchchitingreav01_greaves", "t_de_redwatchchitin_boots_01", "t_a_deredwatchchitingreav01_gauntlet_left", "t_a_deredwatchchitingreav01_gauntlet_right",
      "t_de_chitin_helmopen_01", "t_de_chitin_pauldrl_01", "t_de_chitin_pauldrr_01", "t_de_chitin_pioneerhelm_01",
      "t_de_chitin_pioneerhelm_02", "t_de_redwatchchitin_cuirass_01", "t_de_redwatchchitin_gauntll_01", "t_de_redwatchchitin_gauntlr_01",
      "t_de_redwatchchitin_greaves_01", "ab_a_chitinhelmopen", "ab_a_chitinhlahelm01", "ab_a_chitinredhelm01",
      "ab_a_chitinscouthelm", "ab_a_chitintelhelm01", "nod_rv_chitin helm d_hr", "nod_rv_chitin helm e_ht",
      "nod_rv_chitin helm f_hh", "aatl_a_buck_chitin", "aatl_a_buck_chitin_h", "aatl_a_buck_chitin_en1",
      "aatl_a_buck_chitin_en2", "aatl_a_buck_chitin_h_en1",
    },
  },
  {
    name = "Chuzei",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistblightdisease", mag=15},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistblightdisease", mag=20},
        {effect="resistnormalweapons", mag=8},
        {effect="resistfire", mag=20},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_bonemold_chuzei_boots", "t_de_bonemold_chuzei_boots_e", "t_de_bonemold_chuzei_bracerl", "t_de_bonemold_chuzei_bracerl_e",
      "t_de_bonemold_chuzei_bracerr", "t_de_bonemold_chuzei_bracerr_e", "t_de_bonemold_chuzei_cuirass", "t_de_bonemold_chuzei_cuirass_e",
      "t_de_bonemold_chuzei_greaves", "t_de_bonemold_chuzei_greaves_e", "t_de_bonemold_chuzei_helm_e", "t_de_bonemold_chuzei_pauldl",
      "t_de_bonemold_chuzei_pauldl_e", "t_de_bonemold_chuzei_pauldr", "t_de_bonemold_chuzei_pauldr_e", "t_de_indbonemold_boots_01",
      "t_de_indbonemold_cuirass_01", "t_de_indbonemold_gauntletl_01", "t_de_indbonemold_gauntletr_01", "t_de_indbonemold_greaves_01",
      "t_de_indbonemold_helmsaviour_01", "t_de_indbonemold_pauldronl_01", "t_de_indbonemold_pauldronl_02", "t_de_indbonemold_pauldronr_01",
      "t_de_indbonemold_pauldronr_02", "t_de_indbonemold_shield_01", "t_de_indbonemold_shield_02", "t_de_indbonemold_shield_03",
      "t_de_indbonemold_shield_04", "t_de_indbonemold_shield_05",
    },
  },
  {
    name = "Cloth",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="feather", mag=5},
      },
      mid = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="feather", mag=10},
        {effect="fortifyskill", skill="alteration", mag=8},
        {effect="weaknesstonormalweapons", mag=10},
      },
      max = {
        {effect="restoremagicka", mag=2, dur=1},
        {effect="feather", mag=15},
        {effect="fortifyskill", skill="alteration", mag=12},
        {effect="fortifyattribute", attribute="intelligence", mag=8},
        {effect="weaknesstonormalweapons", mag=20},
      },
    },
    items = {
      "cloth bracer left", "cloth bracer right", "right cloth horny fist bracer", "left cloth horny fist bracer",
      "ab_a_clothhelm1", "ab_a_clothhelm2", "ab_a_clothhelm3", "ak_cloth_helm_uni",
      "nod_hat_straw_vd_helm_cloth",
    },
  },
  {
    name = "Colovian",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="fortifyattribute", attribute="endurance", mag=3},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="fortifyattribute", attribute="endurance", mag=5},
        {effect="fortifyattack", mag=5},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="fortifyhealth", mag=18},
      },
    },
    items = {
      "fur_colovian_helm", "fur_colovian_helm_red", "fur_colovian_helm_white", "t_imp_colbronzeold_helm_01",
      "t_imp_colfur_boots_01", "t_imp_colfur_boots_02", "t_imp_colfur_boots_03", "t_imp_colfur_boots_04",
      "t_imp_colfur_cuirass_01", "t_imp_colfur_cuirass_02", "t_imp_colfur_cuirass_03", "t_imp_colfur_cuirass_04",
      "t_imp_colfur_gauntl_01", "t_imp_colfur_gauntl_02", "t_imp_colfur_gauntl_03", "t_imp_colfur_gauntl_04",
      "t_imp_colfur_gauntr_01", "t_imp_colfur_gauntr_02", "t_imp_colfur_gauntr_03", "t_imp_colfur_gauntr_04",
      "t_imp_colfur_helmbl_01", "t_imp_colfur_helmex_01", "t_imp_colfur_helmr_01", "t_imp_colfur_helmtiger_01",
      "t_imp_coliron1_boots_01", "t_imp_coliron1_boots_02", "t_imp_coliron1_boots_03", "t_imp_coliron1_boots_04",
      "t_imp_coliron1_cuirass_01", "t_imp_coliron1_cuirass_02", "t_imp_coliron1_cuirass_03", "t_imp_coliron1_cuirass_04",
      "t_imp_coliron1_gauntletl_01", "t_imp_coliron1_gauntletl_02", "t_imp_coliron1_gauntletl_03", "t_imp_coliron1_gauntletl_04",
      "t_imp_coliron1_gauntletr_01", "t_imp_coliron1_gauntletr_02", "t_imp_coliron1_gauntletr_03", "t_imp_coliron1_gauntletr_04",
      "t_imp_coliron1_greaves_01", "t_imp_coliron1_greaves_02", "t_imp_coliron1_greaves_03", "t_imp_coliron1_greaves_04",
      "t_imp_coliron1_helm_01", "t_imp_coliron1_helm_02", "t_imp_coliron1_helm_03", "t_imp_coliron1_helm_04",
      "t_imp_coliron1_pauldronl_01", "t_imp_coliron1_pauldronl_02", "t_imp_coliron1_pauldronl_03", "t_imp_coliron1_pauldronl_04",
      "t_imp_coliron1_pauldronr_01", "t_imp_coliron1_pauldronr_02", "t_imp_coliron1_pauldronr_03", "t_imp_coliron1_pauldronr_04",
      "t_imp_coliron2_boots_01", "t_imp_coliron2_bracerl_01", "t_imp_coliron2_bracerr_01", "t_imp_coliron2_cuirass_01",
      "t_imp_coliron2_greaves_01", "t_imp_coliron2_helm_01", "t_imp_coliron2_pauldronl_01", "t_imp_coliron2_pauldronr_01",
      "t_imp_coliron_boots_01", "t_imp_coliron_bracerl_01", "t_imp_coliron_bracerr_01", "t_imp_coliron_cuirass_01",
      "t_imp_coliron_greaves_01", "t_imp_coliron_helmet_01", "t_imp_coliron_helmet_02", "t_imp_coliron_pauldronl_01",
      "t_imp_coliron_pauldronr_01", "t_imp_colsteel1_boots_01", "t_imp_colsteel1_boots_02", "t_imp_colsteel1_boots_03",
      "t_imp_colsteel1_boots_04", "t_imp_colsteel1_bracerl_01", "t_imp_colsteel1_bracerl_02", "t_imp_colsteel1_bracerl_03",
      "t_imp_colsteel1_bracerl_04", "t_imp_colsteel1_bracerr_01", "t_imp_colsteel1_bracerr_02", "t_imp_colsteel1_bracerr_03",
      "t_imp_colsteel1_bracerr_04", "t_imp_colsteel1_cuirass_01", "t_imp_colsteel1_cuirass_02", "t_imp_colsteel1_cuirass_03",
      "t_imp_colsteel1_cuirass_04", "t_imp_colsteel1_greaves_01", "t_imp_colsteel1_greaves_02", "t_imp_colsteel1_greaves_03",
      "t_imp_colsteel1_greaves_04", "t_imp_colsteel1_helm_01", "t_imp_colsteel1_helm_02", "t_imp_colsteel1_helm_03",
      "t_imp_colsteel1_helm_04", "t_imp_colsteel1_pauldronl_01", "t_imp_colsteel1_pauldronl_02", "t_imp_colsteel1_pauldronl_03",
      "t_imp_colsteel1_pauldronl_04", "t_imp_colsteel1_pauldronr_01", "t_imp_colsteel1_pauldronr_02", "t_imp_colsteel1_pauldronr_03",
      "t_imp_colsteel1_pauldronr_04", "t_imp_colsteel_boots_01", "t_imp_colsteel_boots_02", "t_imp_colsteel_boots_03",
      "t_imp_colsteel_boots_04", "t_imp_colsteel_bracerl_03", "t_imp_colsteel_bracerl_04", "t_imp_colsteel_bracerr_03",
      "t_imp_colsteel_bracerr_04", "t_imp_colsteel_cuirass_01", "t_imp_colsteel_cuirass_02", "t_imp_colsteel_cuirass_03",
      "t_imp_colsteel_cuirass_04", "t_imp_colsteel_gauntletl_01", "t_imp_colsteel_gauntletl_02", "t_imp_colsteel_gauntletr_01",
      "t_imp_colsteel_gauntletr_02", "t_imp_colsteel_greaves_01", "t_imp_colsteel_greaves_02", "t_imp_colsteel_greaves_03",
      "t_imp_colsteel_greaves_04", "t_imp_colsteel_helm_01", "t_imp_colsteel_helm_02", "t_imp_colsteel_helm_03",
      "t_imp_colsteel_helm_04", "t_imp_colsteel_helm_05", "t_imp_colsteel_helm_06", "t_imp_colsteel_pauldronl_01",
      "t_imp_colsteel_pauldronl_02", "t_imp_colsteel_pauldronl_03", "t_imp_colsteel_pauldronl_04", "t_imp_colsteel_pauldronr_01",
      "t_imp_colsteel_pauldronr_02", "t_imp_colsteel_pauldronr_03", "t_imp_colsteel_pauldronr_04",
    },
  },
  {
    name = "Colovian Leather",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="fortifyattribute", attribute="agility", mag=3},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="fortifyskill", skill="sneak", mag=8},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="fortifyskill", skill="sneak", mag=12},
        {effect="fortifyskill", skill="acrobatics", mag=12},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_imp_colleather_boots_01", "t_imp_colleather_boots_02", "t_imp_colleather_bracerl_01", "t_imp_colleather_bracerl_02",
      "t_imp_colleather_bracerr_01", "t_imp_colleather_bracerr_02", "t_imp_colleather_cuirass_01", "t_imp_colleather_cuirass_02",
      "t_imp_colleather_greaves_01", "t_imp_colleather_greaves_02", "t_imp_colleather_helm_01", "t_imp_colleather_helm_02",
      "t_imp_colleather_pauldronl_01", "t_imp_colleather_pauldronl_02", "t_imp_colleather_pauldronr_01", "t_imp_colleather_pauldronr_02",
    },
  },
  {
    name = "Companions",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattack", mag=3},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="fortifyattack", mag=5},
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="fortifyattack", mag=8},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattribute", attribute="personality", mag=8},
      },
    },
    items = {
      "t_nor_companion_boots_01", "t_nor_companion_cuirass_01", "t_nor_companion_gauntletl_01", "t_nor_companion_gauntletr_01",
      "t_nor_companion_greaves_01", "t_nor_companion_helm_01", "t_nor_companion_pauldronl_01", "t_nor_companion_pauldronr_01",
    },
  },
  {
    name = "Crown Guard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyattribute", attribute="personality", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_rga_crownguard1_boots_01", "t_rga_crownguard1_cuirass_01", "t_rga_crownguard1_greaves_01", "t_rga_crownguard1_helm_01",
      "t_rga_crownguard1_pauldronl_01", "t_rga_crownguard1_pauldronr_01",
    },
  },
  {
    name = "Daedric",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="spellabsorption", mag=3},
      },
      mid = {
        {effect="spellabsorption", mag=5},
        {effect="resistmagicka", mag=8},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="spellabsorption", mag=8},
        {effect="resistmagicka", mag=12},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "daedric_fountain_helm", "daedric_terrifying_helm", "daedric_god_helm", "daedric_pauldron_left",
      "daedric_pauldron_right", "daedric_cuirass", "daedric_gauntlet_left", "daedric_gauntlet_right",
      "daedric_greaves", "daedric_boots", "daedric_shield", "daedric_towershield",
      "daedric_cuirass_htab", "daedric_greaves_htab", "daedric_helm_clavicusvile", "azura's servant",
      "atl_a_buck_daed", "atl_a_buck_daed_h", "atl_a_buck_daed_mana", "atl_a_buck_daed_h_thunderward",
      "atl_a_buck_daed_lightningstrike", "daedric_helm_clavicusvile_x", "t_dae_regular_helmconsolat_01", "t_dae_regular_helmhumiliat_02",
      "t_dae_regular_helmrebellion_01", "t_dae_lord_boots_01", "t_dae_lord_gauntletl_01", "t_dae_lord_gauntletr_01",
      "t_dae_lord_helm_01", "t_dae_lord_pauldronl_01", "t_dae_lord_pauldronr_01", "t_dae_regular_helmhumiliat_01",
      "t_dae_regular_pauldronl_01", "t_dae_regular_pauldronr_01", "t_dae_regular_shieldtower_01", "t_dae_uni_aurorangauntletl",
      "t_dae_uni_aurorangauntletr", "t_dae_uni_bootsofatronach", "t_dae_uni_bootsofpeace_01", "t_dae_uni_bootssaviorshide",
      "t_dae_uni_fearstruck", "t_dae_uni_gauntletofpoor_l", "t_dae_uni_gauntletofpoor_r", "t_dae_uni_greavessaviorshide",
      "t_dae_uni_helmlightwithin_01", "t_dae_uni_helmsaviorshide", "t_dae_uni_lgauntsaviorshide", "t_dae_uni_lmethatspauldron",
      "t_dae_uni_lpauldsaviorshide", "t_dae_uni_polyhedrascope_01", "t_dae_uni_rgauntsaviorshide", "t_dae_uni_rmethatspauldron",
      "t_dae_uni_rpauldsaviorshide", "t_de_daedrichide_boots_01", "t_de_daedrichide_cuirass_01", "t_de_daedrichide_gauntletl_01",
      "t_de_daedrichide_gauntletr_01", "t_de_daedrichide_greaves_01", "t_de_daedrichide_pauldronl_01", "t_de_daedrichide_pauldronr_01",
      "t_dae_alternate_boots_01", "t_dae_alternate_buckler_01", "t_dae_alternate_cuirass_01", "t_dae_alternate_gauntletl_01",
      "t_dae_alternate_gauntletr_01", "t_dae_alternate_greaves_01", "t_dae_alternate_helmopen_01", "t_dae_alternate_helm_01",
      "t_dae_alternate_pauldronl_01", "t_dae_alternate_pauldronr_01", "t_dae_alternate2_boots_01", "t_dae_alternate2_cuirass_01",
      "t_dae_alternate2_gauntletl_01", "t_dae_alternate2_gauntletr_01", "t_dae_alternate2_greaves_01", "t_dae_alternate2_helmopen_01",
      "t_dae_alternate2_helm_01", "t_dae_alternate2_pauldronl_01", "t_dae_alternate2_pauldronr_01", "ab_a_daeazurahelm",
      "ab_a_daedagonhelm", "ab_a_daemolaghelm", "ab_a_daesheoghelm", "nod_rv_daedric_helm_dagon",
      "nod_rv_daedric_helm_molag", "nod_rv_daedric_helm_sheo",
    },
  },
  {
    name = "Daedric Hide",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="spellabsorption", mag=3},
      },
      mid = {
        {effect="spellabsorption", mag=5},
        {effect="resistmagicka", mag=8},
        {effect="sanctuary", mag=7},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="spellabsorption", mag=8},
        {effect="resistmagicka", mag=12},
        {effect="sanctuary", mag=10},
        {effect="restoremagicka", mag=2, dur=1},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_de_daedrichide_cuirass_01", "t_de_daedrichide_pauldronl_01", "t_de_daedrichide_pauldronr_01", "t_de_daedrichide_greaves_01",
      "t_de_daedrichide_boots_01", "t_de_daedrichide_gauntletl_01", "t_de_daedrichide_gauntletr_01", "tr_m1_raptures fist",
    },
  },
  {
    name = "Dark Brotherhood",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyskill", skill="sneak", mag=5},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="fortifyskill", skill="sneak", mag=8},
        {effect="resistpoison", mag=15},
        {effect="chameleon", mag=7},
      },
      max = {
        {effect="fortifyskill", skill="sneak", mag=12},
        {effect="resistpoison", mag=20},
        {effect="chameleon", mag=10},
        {effect="fortifyattack", mag=8},
      },
    },
    items = {
      "darkbrotherhood helm", "darkbrotherhood cuirass", "darkbrotherhood pauldron_l", "darkbrotherhood pauldron_r",
      "darkbrotherhood greaves", "darkbrotherhood boots", "darkbrotherhood gauntlet_l", "darkbrotherhood gauntlet_r",
      "aatl_a_ancient_shroud_chest", "aatl_a_ancient_shroud_gauntl", "aatl_a_ancient_shroud_gauntr", "aatl_a_ancient_shroud_greaves",
      "aatl_a_ancient_shroud_paull", "aatl_a_ancient_shroud_paulr", "aatl_a_ancient_shroud_helm", "aatl_a_ancient_shroud_boots",
    },
  },
  {
    name = "Domina",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="personality", mag=3},
        {effect="fortifyattack", mag=3},
      },
      mid = {
        {effect="fortifyattribute", attribute="personality", mag=5},
        {effect="fortifyattack", mag=5},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
      },
    },
    items = {
      "t_imp_domina_boots_01", "t_imp_domina_cuirass_01", "t_imp_domina_gauntletl_01", "t_imp_domina_gauntletr_01",
      "t_imp_domina_greaves_01", "t_imp_domina_helm_01", "t_imp_domina_pauldronl_01", "t_imp_domina_pauldronr_01",
    },
  },
  {
    name = "Dragonbone",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="resistmagicka", mag=12},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {

    },
  },
  {
    name = "Dragonscale",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="resistmagicka", mag=8},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="resistmagicka", mag=12},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield", "t_imp_dragonscale_barcerl_01",
      "t_imp_dragonscale_barcerr_01", "t_imp_dragonscale_boots_01", "t_imp_dragonscale_cuirass_01", "t_imp_dragonscale_greaves_01",
      "t_imp_dragonscale_helm_01", "t_imp_dragonscale_pauldronl_01", "t_imp_dragonscale_pauldronr_01", "tr_i2-235_dragonscale_tower",
    },
  },
  {
    name = "Dreugh",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistshock", mag=10},
        {effect="waterbreathing", mag=1},
      },
      mid = {
        {effect="resistshock", mag=15},
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=30},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistshock", mag=20},
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=40},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "dreugh_cuirass", "dreugh_helm", "dreugh_shield", "helm of holy fire",
      "dreugh_cuirass_ttrm", "t_de_dreugh_boots_01", "t_de_dreugh_bracerl_01", "t_de_dreugh_bracerr_01",
      "t_de_dreugh_greaves_01", "t_de_dreugh_helm_closed", "t_de_dreugh_hunter_helm_01", "t_de_dreugh_hunter_helm_02",
      "t_de_dreugh_pauldronl_01", "t_de_dreugh_pauldronl_swim", "t_de_dreugh_pauldronr_01", "t_de_dreugh_pauldronr_swim",
      "t_de_dreugh_shield_swim", "ab_a_dreughboots", "ab_a_dreughbracerl", "ab_a_dreughbracerr",
      "ab_a_dreughgreaves", "ab_a_dreughhelmclose", "ab_a_dreughpldleft", "ab_a_dreughpldright",
      "aatl_a_landswimmer",
    },
  },
  {
    name = "Dunmer",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyskill", skill="destruction", mag=8},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyskill", skill="destruction", mag=12},
        {effect="fortifyattribute", attribute="speed", mag=8},
      },
    },
    items = {
      "t_a_dechitinhelmopen01_hrpen", "t_a_deredwatchchitincuir01_cuirass", "t_de_redwatchchitin_pauldrl_01", "t_de_redwatchchitin_pauldrr_01",
      "t_a_deredwatchchitingreav01_greaves", "t_de_redwatchchitin_boots_01", "t_a_deredwatchchitingreav01_gauntlet_left", "t_a_deredwatchchitingreav01_gauntlet_right",
      "t_de_almarula_helm_uni", "t_de_bonemold_chuzei_boots", "t_de_bonemold_chuzei_boots_e", "t_de_bonemold_chuzei_bracerl",
      "t_de_bonemold_chuzei_bracerl_e", "t_de_bonemold_chuzei_bracerr", "t_de_bonemold_chuzei_bracerr_e", "t_de_bonemold_chuzei_cuirass",
      "t_de_bonemold_chuzei_cuirass_e", "t_de_bonemold_chuzei_greaves", "t_de_bonemold_chuzei_greaves_e", "t_de_bonemold_chuzei_helm_e",
      "t_de_bonemold_chuzei_pauldl", "t_de_bonemold_chuzei_pauldl_e", "t_de_bonemold_chuzei_pauldr", "t_de_bonemold_chuzei_pauldr_e",
      "t_de_bonemold_helmopen_01", "t_de_bonemold_helmrider_01", "t_de_bonemold_stone_boots", "t_de_bonemold_stone_cuirass",
      "t_de_bonemold_stone_gauntletl", "t_de_bonemold_stone_gauntletr", "t_de_bonemold_stone_greaves", "t_de_bonemold_stone_helm",
      "t_de_bonemold_stone_pauldl", "t_de_bonemold_stone_pauldr", "t_de_bonemold_ulvra_boots", "t_de_bonemold_ulvra_bracerl",
      "t_de_bonemold_ulvra_bracerr", "t_de_bonemold_ulvra_cuirass", "t_de_bonemold_ulvra_greaves", "t_de_bonemold_ulvra_helm",
      "t_de_bonemold_ulvra_pauldl", "t_de_bonemold_ulvra_pauldr", "t_de_bonemoldkrage_boots_01", "t_de_bonemoldkrage_cuirass_01",
      "t_de_bonemoldkrage_gauntletl_01", "t_de_bonemoldkrage_gauntletr_01", "t_de_bonemoldkrage_greaves_01", "t_de_bonemoldkrage_helm_01",
      "t_de_bonemoldkrage_pauldronl_01", "t_de_bonemoldkrage_pauldronr_01", "t_de_bonemoldkragen_helm_01", "t_de_bonemoldmarad_cuirass_01",
      "t_de_bonemoldmarad_helm_01", "t_de_bonemoldmarad_helm_02", "t_de_bonemoldmarad_pauldronl_01", "t_de_bonemoldmarad_pauldronr_01",
      "t_de_bonemoldmarad_shield_01", "t_de_bonemoldsammas_helm_01", "t_de_canyonwatch_boots_01", "t_de_canyonwatch_bracerl_01",
      "t_de_canyonwatch_bracerr_01", "t_de_canyonwatch_cuirass_01", "t_de_canyonwatch_greaves_01", "t_de_canyonwatch_helm_01",
      "t_de_canyonwatch_pauldronl_01", "t_de_canyonwatch_pauldronr_01", "t_de_caravaner_helm_01", "t_de_chitin_helmopen_01",
      "t_de_chitin_pauldrl_01", "t_de_chitin_pauldrr_01", "t_de_chitin_pioneerhelm_01", "t_de_chitin_pioneerhelm_02",
      "t_de_cm_hattelv_01", "t_de_cm_hattelv_02", "t_de_cm_hattelv_03", "t_de_cm_hattelv_04",
      "t_de_cm_hattelv_05", "t_de_daedrichide_boots_01", "t_de_daedrichide_cuirass_01", "t_de_daedrichide_gauntletl_01",
      "t_de_daedrichide_gauntletr_01", "t_de_daedrichide_greaves_01", "t_de_daedrichide_pauldronl_01", "t_de_daedrichide_pauldronr_01",
      "t_de_diviner_helm_01", "t_de_dresbonemold_boots_01", "t_de_dresbonemold_cuirass_01", "t_de_dresbonemold_gauntletl_01",
      "t_de_dresbonemold_gauntletr_01", "t_de_dresbonemold_greaves_01", "t_de_dresbonemold_helm_01", "t_de_dresbonemold_pauldronl_01",
      "t_de_dresbonemold_pauldronr_01", "t_de_dresbonemold_shieldtow_01", "t_de_dreschapthil_helm_01a", "t_de_dreschapthil_helm_01b",
      "t_de_dreschapthil_helm_01c", "t_de_dreschapthil_helm_01d", "t_de_dreschapthil_helm_01e", "t_de_dreschapthil_helm_02a",
      "t_de_dreschapthil_helm_02b", "t_de_dreschapthil_helm_02c", "t_de_dreschapthil_helm_02d", "t_de_dreschapthil_helm_02e",
      "t_de_dreschapthil_helm_03a", "t_de_dreschapthil_helm_03b", "t_de_dreschapthil_helm_03c", "t_de_dreschapthil_helm_03d",
      "t_de_dreschapthil_helm_03e", "t_de_dreshunter_cuirass_01", "t_de_dreshunter_greaves_01", "t_de_dreshunter_helm_01",
      "t_de_dreshunter_pauldronl_01", "t_de_dreshunter_pauldronr_01", "t_de_dressaltmerc_helm_01", "t_de_dressaltmerc_helm_02",
      "t_de_dreugh_boots_01", "t_de_dreugh_bracerl_01", "t_de_dreugh_bracerr_01", "t_de_dreugh_greaves_01",
      "t_de_dreugh_helm_closed", "t_de_dreugh_hunter_helm_01", "t_de_dreugh_hunter_helm_02", "t_de_dreugh_pauldronl_01",
      "t_de_dreugh_pauldronl_swim", "t_de_dreugh_pauldronr_01", "t_de_dreugh_pauldronr_swim", "t_de_dreugh_shield_swim",
      "t_de_ebony_helm_02", "t_de_ebony_helmopen_01", "t_de_ep_hattelv_01", "t_de_ep_hattelv_02",
      "t_de_ep_hattelv_03", "t_de_et_hattelv_01", "t_de_et_hattelv_02", "t_de_ex_hattelv_01",
      "t_de_ex_hattelv_02", "t_de_fiendcephalopodhelm_01", "t_de_fiendmolecrabhelm_01", "t_de_glass_helm_closed_01",
      "t_de_hvchit_boots", "t_de_hvchit_cuirass", "t_de_hvchit_gauntlet_l", "t_de_hvchit_gauntlet_r",
      "t_de_hvchit_greaves", "t_de_hvchit_helmet", "t_de_hvchit_pauldron_l", "t_de_hvchit_pauldron_r",
      "t_de_indbonemold_boots_01", "t_de_indbonemold_cuirass_01", "t_de_indbonemold_gauntletl_01", "t_de_indbonemold_gauntletr_01",
      "t_de_indbonemold_greaves_01", "t_de_indbonemold_helmsaviour_01", "t_de_indbonemold_pauldronl_01", "t_de_indbonemold_pauldronl_02",
      "t_de_indbonemold_pauldronr_01", "t_de_indbonemold_pauldronr_02", "t_de_indbonemold_shield_01", "t_de_indbonemold_shield_02",
      "t_de_indbonemold_shield_03", "t_de_indbonemold_shield_04", "t_de_indbonemold_shield_05", "t_de_indchevaram_boots_01",
      "t_de_indchevaram_bracerl_01", "t_de_indchevaram_bracerr_01", "t_de_indchevaram_cuirass_01", "t_de_indchevaram_greaves_01",
      "t_de_indchevaram_helm_01", "t_de_indchevaram_helm_02", "t_de_indchevaram_pauldrl_01", "t_de_indchevaram_pauldrr_01",
      "t_de_molecrab_boots_01", "t_de_molecrab_bracerl_01", "t_de_molecrab_bracerr_01", "t_de_molecrab_cuirass_01",
      "t_de_molecrab_greaves_01", "t_de_molecrab_pauldronl_01", "t_de_molecrab_pauldronr_01", "t_de_nativeebony_boots_01",
      "t_de_nativeebony_cuirass_01", "t_de_nativeebony_gauntletl_01", "t_de_nativeebony_gauntletr_01", "t_de_nativeebony_greaves_01",
      "t_de_nativeebony_helmclosed_01", "t_de_nativeebony_helmclosed_02", "t_de_nativeebony_helmopen_01", "t_de_nativeebony_helmopen_02",
      "t_de_nativeebony_pauldronl_01", "t_de_nativeebony_pauldronr_01", "t_de_necrom_boots_01", "t_de_necrom_cuirass_01",
      "t_de_necrom_cuirass_02", "t_de_necrom_gauntletl_01", "t_de_necrom_gauntletr_01", "t_de_necrom_greaves_01",
      "t_de_necrom_helm_01", "t_de_necrom_pauldronl_01", "t_de_necrom_pauldronr_01", "t_de_necrom_shield_01",
      "t_de_netch_cuirass_01", "t_de_netch_cuirass_02", "t_de_netch_cuirass_03", "t_de_netch_helm_01",
      "t_de_netch_helm_02", "t_de_netchrogue_cuirass_01", "t_de_netchrogue_helm_01", "t_de_netchrogue_helm_02",
      "t_de_netchstalker_helm_01", "t_de_ordinator_greaves_01", "t_de_redbonemold_helmopen_01", "t_de_redherobonemold_cuirass_01",
      "t_de_redherobonemold_helm_01", "t_de_redherobonemold_helm_02", "t_de_redherobonemold_helm_03", "t_de_redherobonemold_pauldrl_01",
      "t_de_redherobonemold_pauldrr_01", "t_de_redmastbonemold_cuirass_01", "t_de_redmastbonemold_pauldrl_01", "t_de_redmastbonemold_pauldrr_01",
      "t_de_redoranwatchman_boots", "t_de_redoranwatchman_cuirass", "t_de_redoranwatchman_gauntletl", "t_de_redoranwatchman_gauntletr",
      "t_de_redoranwatchman_greaves", "t_de_redoranwatchman_pauldronl", "t_de_redoranwatchman_pauldronr", "t_de_redwatchchitin_cuirass_01",
      "t_de_redwatchchitin_gauntll_01", "t_de_redwatchchitin_gauntlr_01", "t_de_redwatchchitin_greaves_01", "t_de_telvcephalopod_boots_01",
      "t_de_telvcephalopod_cuirass_01", "t_de_telvcephalopod_gauntl_01", "t_de_telvcephalopod_gauntr_01", "t_de_telvcephalopod_greaves_01",
      "t_de_telvcephalopod_pauldl_01", "t_de_telvcephalopod_pauldr_01", "t_de_thirrbonemold_boots_01", "t_de_thirrbonemold_bracer_01_l",
      "t_de_thirrbonemold_bracer_01_r", "t_de_thirrbonemold_cuirass_01", "t_de_thirrbonemold_greaves_01", "t_de_thirrbonemold_helm_01",
      "t_de_thirrbonemold_pauldrn_01_l", "t_de_thirrbonemold_pauldrn_01_r", "t_de_uni_facelesshelm", "t_de_uni_irfeidsshoulderl",
      "t_de_uni_irfeidsshoulderr", "t_de_uni_preyseekerhelm", "t_de_uni_shield_abernanit", "t_de_uni_shoulderofghostlightl",
      "t_de_uni_shoulderofghostlightr", "t_de_uni_ushudimmucrown", "t_de_uni_vanguard", "t_de_uni_vivecshield",
      -- vanilla Dunmer-craft gear (union of: Chitin, Bonemold, Netch Leather, Dreugh, Cephalopod, House Indoril) -- kept in step with
      -- the runtime union in MWSE/mods/Static/SetBonusTR/main.lua
      "chitin cuirass", "chitin helm", "chitin_mask_helm", "chitin pauldron - left",
      "chitin pauldron - right", "chitin guantlet - left", "chitin guantlet - right", "chitin greaves",
      "chitin boots", "chitin_shield", "chitin_towershield", "chitin_watchman_helm",
      "cephalopod_helm", "dust_adept_helm", "mole_crab_helm", "the_chiding_cuirass",
      "chest of fire", "merisan helm", "velothian_helm", "boneweave gauntlet",
      "left gauntlet of the horny fist", "right gauntlet of horny fist", "shield of the undaunted", "devil mole crab helm",
      "demon mole crab", "fiend helm", "devil helm", "demon helm",
      "cephalopod_helm_htnk", "devil cephalopod helm", "demon cephalopod", "veloths_shield",
      "velothian shield", "bonedancer gauntlet", "atl_a_buck_chitin_almsivi", "atl_a_buck_chitin_seryns_brew",
      "ab_a_chitinhelmopen", "ab_a_chitinhlahelm01", "ab_a_chitinredhelm01", "ab_a_chitinscouthelm",
      "ab_a_chitintelhelm01", "nod_rv_chitin helm d_hr", "nod_rv_chitin helm e_ht", "nod_rv_chitin helm f_hh",
      "aatl_a_buck_chitin", "aatl_a_buck_chitin_h", "aatl_a_buck_chitin_en1", "aatl_a_buck_chitin_en2",
      "aatl_a_buck_chitin_h_en1", "bonemold_helm", "bonemold_cuirass", "bonemold_pauldron_l",
      "bonemold_pauldron_r", "bonemold_bracer_left", "bonemold_bracer_right", "bonemold greaves",
      "bonemold_boots", "bonemold_shield", "bonemold_armun-an_helm", "bonemold_armun-an_cuirass",
      "bonemold_armun-an_pauldron_l", "bonemold_armun-an_pauldron_r", "bonemold_gah-julan_helm", "bonemold_gah-julan_cuirass",
      "bonemold_gah-julan_pauldron_l", "bonemold_gah-julan_pauldron_r", "bonemold_chuzei_helm", "bonemold_founders_helm",
      "redoran_master_helm", "bonemold_towershield", "bonemold_tshield_hlaaluguard", "bonemold_tshield_redoranguard",
      "bonemold_tshield_telvanniguard", "erur_dan_cuirass_unique", "heart wall", "mountain spirit",
      "storm helm", "bonemold_gah-julan_hhda", "lbonemold brace of horny fist", "rbonemold bracer of horny fist",
      "holy_tower_shield", "bonemold_tshield_hrlb", "holy_shield", "morag_tong_helm",
      "bonemold_greaves", "aa_bonemold_boots_bad", "tr_i2-235_bonemold_towershield", "netch_leather_helm",
      "netch_leather_cuirass", "netch_leather_pauldron_left", "netch_leather_pauldron_right", "netch_leather_gauntlet_left",
      "netch_leather_gauntlet_right", "netch_leather_greaves", "netch_leather_boots", "snetch_leather_shield",
      "netch_leather_boiled_helm", "netch_leather_boiled_cuirass", "netch_leather_towershield", "boots of blinding speed[unique]",
      "left_horny_fist_gauntlet", "right horny fist gauntlet", "veloths_tower_shield", "merisan_cuirass",
      "netch_leather_shield", "atl_a_buck_netch", "atl_a_buck_netch_h", "atl_a_buck_netch_h_vampire",
      "atl_a_buck_netch_redoak", "atl_a_buck_netch_thiefsward", "tr_m1_q_cuirassofmobility", "t_de_netch_cuirass_04",
      "t_de_netch_cuirass_05", "tr_m1_q_rancidcuirass_uni", "t_de_netch_helm_03", "ab_a_netchboilpldleft",
      "ab_a_netchboilpldright", "ab_a_netchimancap", "nod_hat_netch_rv_netchimans cap", "adnetch pauldron left",
      "adnetch boots", "adnetch gauntlet left", "adnetch gauntlet right", "adnetch cuirass",
      "adnetch greaves", "adnetch pauldron right", "adnetch cuirass_ii", "adnetch cuirass_iii",
      "adnetch coat", "adnetch glove left", "adnetch glove right", "adnetch pauldron left ii",
      "adnetch pauldron right ii", "adnetch beast boots", "adnetch shield", "nod_r0_netch_leather_pauldron_l",
      "nod_r0_netch_leather_pauldron_r", "nod_adnetch pauldron left", "nod_adnetch boots", "nod_adnetch gauntlet left",
      "nod_adnetch gauntlet right", "nod_adnetch cuirass", "nod_adnetch greaves", "nod_adnetch pauldron right",
      "nod_adnetch cuirass_ii", "nod_adnetch cuirass_iii", "nod_adnetch coat", "nod_adnetch glove left",
      "nod_adnetch glove right", "nod_adnetch pauldron left ii", "nod_adnetch pauldron right ii", "nod_adnetch beast boots",
      "nod_adnetch shield", "aatl_a_buck_netch_h", "aatl_a_buck_netch_h_en1", "dreugh_cuirass",
      "dreugh_helm", "dreugh_shield", "helm of holy fire", "dreugh_cuirass_ttrm",
      "ab_a_dreughboots", "ab_a_dreughbracerl", "ab_a_dreughbracerr", "ab_a_dreughgreaves",
      "ab_a_dreughhelmclose", "ab_a_dreughpldleft", "ab_a_dreughpldright", "aatl_a_landswimmer",
      "ab_a_cephhelmopen", "ab_a_cephpauldronleft", "ab_a_cephpauldronright", "indoril shield",
      "indoril pauldron left", "indoril pauldron right", "indoril helmet", "indoril cuirass",
      "indoril left gauntlet", "indoril right gauntlet", "indoril boots", "succour of indoril",
      "spirit of indoril", "indoril_almalexia_helmet", "indoril_almalexia_boots", "indoril_almalexia_cuirass",
      "indoril_almalexia_greaves", "indoril_almalexia_pauldron_l", "indoril_almalexia_pauldron_r", "indoril_almalexia_gauntlet_r",
      "indoril_almalexia_gauntlet_l", "indoril_almalexia_shield", "indoril_mh_guard_boots", "indoril_mh_guard_cuirass",
      "indoril_mh_guard_gauntlet_l", "indoril_mh_guard_gauntlet_r", "indoril_mh_guard_greaves", "indoril_mh_guard_helmet",
      "indoril_mh_guard_pauldron_l", "indoril_mh_guard_pauldron_r", "indoril_mh_guard_shield", "tr_m3_brother_indorilhelm",
      "tr_m3_indshield_i3-606-ind", "nod_arindoril", "nod_arindoril2", "nod_ar_indrobe1",
      "nod_ar_indhelm", "nod_ar_indrobe_nc1", "nod_arindoril_hood", "nod_arindoril_hood&mask",
      "nod_ar_indoril helmet2",
    },
  },
  {
    name = "Dwemer",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistshock", mag=10},
      },
      mid = {
        {effect="resistshock", mag=15},
        {effect="reflect", mag=5},
      },
      max = {
        {effect="resistshock", mag=20},
        {effect="reflect", mag=8},
        {effect="sanctuary", mag=10},
      },
    },
    items = {
      "dwemer_cuirass", "dwemer_helm", "dwemer_pauldron_left", "dwemer_pauldron_right",
      "dwemer_bracer_left", "dwemer_bracer_right", "dwemer_greaves", "dwemer_boots",
      "dwemer_shield", "dwemer_boots of flying", "helm of wounding", "shadow_shield",
      "shield of wounds", "spell_breaker_unique", "dwemer_shield_battle_unique", "atl_a_buck_dwemer",
      "atl_a_buck_dwemer_h", "atl_a_buck_dwemer_h_vampirism", "atl_a_buck_dwemer_mzal", "roht_edwinna2_dwe_boots",
      "roht_edwinna2_dwe_helm", "tr_i2-235_dwemer_shield", "t_dwe_regular_shieldtower_01", "t_dwe_scrap_boots",
      "t_dwe_scrap_bracer_l", "t_dwe_scrap_bracer_r", "t_dwe_scrap_cuirass", "t_dwe_scrap_greaves",
      "t_dwe_scrap_helmet", "t_dwe_scrap_pauldron_l", "t_dwe_scrap_pauldron_r", "t_dwe_uni_maskofpurity",
      "t_dwe_gold_boots", "t_dwe_gold_cuirass", "t_dwe_gold_gauntlet_l", "t_dwe_gold_gauntlet_r",
      "t_dwe_gold_greaves", "t_dwe_gold_helm", "t_dwe_gold_helmopen", "t_dwe_gold_pauldron_l",
      "t_dwe_gold_pauldron_r", "nod_dnk_dwem_boots", "nod_dnk_dwem_cuirass", "nod_dnk_dwem_grv",
      "nod_dnk_dwem_l_gaunt", "nod_dnk_dwem_l_pauldron", "nod_dnk_dwem_mask", "nod_dnk_dwem_r_gaunt",
      "nod_dnk_dwem_r_pauldron", "nod_rv_dwemscr_boots", "nod_rv_dwemscr_bracer_left", "nod_rv_dwemscr_bracer_right",
      "nod_rv_dwemscr_cuirass", "nod_rv_dwemscr_helmet", "nod_rv_dwemscr_greaves", "nod_rv_dwemscr_pauldron_left",
      "nod_rv_dwemscr_pauldron_right", "aatl_a_buck_dwemer_h", "aatl_a_buck_dwemer_h_en1",
    },
  },
  {
    name = "Ebonweave",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyfatigue", mag=20},
        {effect="resistmagicka", mag=8},
      },
      max = {
        {effect="restoremagicka", mag=2, dur=1},
        {effect="fortifyfatigue", mag=28},
        {effect="resistmagicka", mag=12},
        {effect="spellabsorption", mag=8},
      },
    },
    items = {
      "t_imp_ebonweave_boots_01", "t_imp_ebonweave_bracerl_01", "t_imp_ebonweave_bracerr_01", "t_imp_ebonweave_cuirass_01",
      "t_imp_ebonweave_greaves_01", "t_imp_ebonweave_helm_01", "t_imp_ebonweave_helm_02", "t_imp_ebonweave_pauldronl_01",
      "t_imp_ebonweave_pauldronr_01",
    },
  },
  {
    name = "Ebony",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="resistmagicka", mag=12},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "ebony_closed_helm", "ebony_pauldron_right", "ebony_pauldron_left", "ebony_cuirass",
      "ebony_bracer_left", "ebony_bracer_right", "ebony_greaves", "ebony_boots",
      "ebony_shield", "ebony_towershield", "ebony_closed_helm_fghl", "ebony_shield_auriel",
      "ebony_bracer_left_tgeb", "ebony_bracer_right_tgeb", "ebony_shield_auriel_x", "ebony_cuirass_soscean",
      "darksun_shield_unique", "saint's shield", "ebon_plate_cuirass_unique", "t_de_ebony_helmopen_01",
      "t_de_nativeebony_boots_01", "t_de_nativeebony_cuirass_01", "t_de_nativeebony_gauntletl_01", "t_de_nativeebony_gauntletr_01",
      "t_de_nativeebony_greaves_01", "t_de_nativeebony_helmclosed_01", "t_de_nativeebony_helmclosed_02", "t_de_nativeebony_helmopen_01",
      "t_de_nativeebony_helmopen_02", "t_de_nativeebony_pauldronl_01", "t_de_nativeebony_pauldronl_02", "t_imp_ebony_bracerl",
      "t_imp_ebony_bracerr", "t_imp_ebony_cuirass", "t_imp_ebony_helmet_01", "t_imp_ebony_pauldronl",
      "t_imp_ebony_pauldronr", "t_imp_ebony_shieldtower_01",
    },
  },
  {
    name = "Embossed",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="personality", mag=3},
      },
      mid = {
        {effect="fortifyattribute", attribute="personality", mag=5},
        {effect="fortifyskill", skill="speechcraft", mag=8},
      },
      max = {
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="fortifyskill", skill="speechcraft", mag=12},
        {effect="fortifyattribute", attribute="luck", mag=8},
      },
    },
    items = {

    },
  },
  {
    name = "Engraved",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="fortifyattribute", attribute="personality", mag=5},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="spellabsorption", mag=8},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Falkreath Guard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistfrost", mag=10},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistfrost", mag=15},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistfrost", mag=20},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_nor_guardfalkr_boots_01", "t_nor_guardfalkr_bracerl_01", "t_nor_guardfalkr_bracerr_01", "t_nor_guardfalkr_cuirass_01",
      "t_nor_guardfalkr_greaves_01", "t_nor_guardfalkr_helm_01", "t_nor_guardfalkr_helm_02", "t_nor_guardfalkr_pauldronl_01",
      "t_nor_guardfalkr_pauldronr_01", "t_nor_guardfalkr_shield_01", "t_nor_guardfalkr_towershield_01",
    },
  },
  {
    name = "Falmer",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="chameleon", mag=5},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="chameleon", mag=7},
        {effect="nighteye", mag=40},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="chameleon", mag=10},
        {effect="nighteye", mag=50},
      },
    },
    items = {

    },
  },
  {
    name = "Fighters Guild",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattack", mag=3},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="fortifyattack", mag=5},
        {effect="fortifyhealth", mag=12},
        {effect="fortifyfatigue", mag=20},
      },
      max = {
        {effect="fortifyattack", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattribute", attribute="strength", mag=8},
      },
    },
    items = {

    },
  },
  {
    name = "Fur",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "fur_helm", "fur_colovian_helm", "fur_pauldron_left", "fur_cuirass",
      "fur_bracer_left", "fur_bracer_right", "fur_greaves", "fur_boots",
      "fur_pauldron_right", "fur_gauntlet_left", "fur_gauntlet_right", "fur_colovian_helm_red",
      "fur_colovian_helm_white", "t_bre_bjoulsaefur_helm_01", "t_imp_colfur_boots_01", "t_imp_colfur_boots_02",
      "t_imp_colfur_boots_03", "t_imp_colfur_boots_04", "t_imp_colfur_cuirass_01", "t_imp_colfur_cuirass_02",
      "t_imp_colfur_cuirass_03", "t_imp_colfur_cuirass_04", "t_imp_colfur_gauntl_01", "t_imp_colfur_gauntl_02",
      "t_imp_colfur_gauntl_03", "t_imp_colfur_gauntl_04", "t_imp_colfur_gauntr_01", "t_imp_colfur_gauntr_02",
      "t_imp_colfur_gauntr_03", "t_imp_colfur_gauntr_04", "t_imp_colfur_helmbl_01", "t_imp_colfur_helmex_01",
      "t_imp_colfur_helmr_01", "t_imp_colfur_helmtiger_01",
    },
  },
  {
    name = "Gah'Kogo",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="resistblightdisease", mag=15},
        {effect="resistparalysis", mag=15},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="resistblightdisease", mag=20},
        {effect="resistparalysis", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_dresbonemold_boots_01", "t_de_dresbonemold_cuirass_01", "t_de_dresbonemold_gauntletl_01", "t_de_dresbonemold_gauntletr_01",
      "t_de_dresbonemold_greaves_01", "t_de_dresbonemold_helm_01", "t_de_dresbonemold_pauldronl_01", "t_de_dresbonemold_pauldronr_01",
      "t_de_dresbonemold_shieldtow_01",
    },
  },
  {
    name = "Gah-Julan",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistblightdisease", mag=15},
        {effect="resistnormalweapons", mag=5},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistblightdisease", mag=20},
        {effect="resistnormalweapons", mag=8},
        {effect="resistfire", mag=20},
      },
    },
    items = {
      "bonemold_gah-julan_hhda", "bonemold_gah-julan_cuirass", "bonemold_gah-julan_pauldron_l", "bonemold_gah-julan_pauldron_r",
      "bonemold_gah-julan_helm",
    },
  },
  {
    name = "Gilded Glass",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="agility", mag=3},
        {effect="fortifyattribute", attribute="personality", mag=3},
      },
      mid = {
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="resistfire", mag=15},
        {effect="fortifyattribute", attribute="personality", mag=5},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="resistfire", mag=20},
        {effect="sanctuary", mag=10},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_glassgilded_boots_01", "t_de_glassgilded_bracerl_01", "t_de_glassgilded_bracerr_01", "t_de_glassgilded_cuirass_01",
      "t_de_glassgilded_greaves_01", "t_de_glassgilded_helm_01", "t_de_glassgilded_pauldronl_01", "t_de_glassgilded_pauldronr_01",
    },
  },
  {
    name = "Glass",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="agility", mag=3},
        {effect="resistfire", mag=10},
      },
      mid = {
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="resistfire", mag=15},
        {effect="sanctuary", mag=7},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="resistfire", mag=20},
        {effect="sanctuary", mag=10},
        {effect="chameleon", mag=10},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "glass_helm", "glass_cuirass", "glass_shield", "glass_towershield",
      "glass_pauldron_left", "glass_pauldron_right", "glass_boots", "glass_greaves",
      "glass_bracer_left", "glass_bracer_right", "atl_a_buck_glass", "atl_a_buck_glass_h",
      "atl_a_buck_glass_kissalessia", "atl_a_buck_glass_h_delyns_kiln", "atl_a_buck_glass_wizards_ward", "t_de_glass_helm_closed_01",
      "t_he_altmerglass_boots_01", "t_he_altmerglass_cuirass_01", "t_he_altmerglass_greaves_01", "t_he_altmerglass_helm_01",
      "t_he_altmerglass_helm_02", "t_he_altmerglass_l_bracer_01", "t_he_altmerglass_l_pauldron_01", "t_he_altmerglass_r_bracer_01",
      "t_he_altmerglass_r_pauldron_01", "ab_a_glassassassinpauldronleft", "ab_a_glassassassinpauldronright", "ab_a_glasshelmclose",
      "aatl_a_buck_glass", "aatl_a_buck_glass_h", "aatl_a_buck_glass_h_en1", "aatl_a_buck_glass_en1",
    },
  },
  {
    name = "Goblin",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="strength", mag=3},
        {effect="resistcommondisease", mag=10},
      },
      mid = {
        {effect="fortifyattribute", attribute="strength", mag=5},
        {effect="resistcommondisease", mag=15},
        {effect="fortifyfatigue", mag=20},
      },
      max = {
        {effect="fortifyattribute", attribute="strength", mag=8},
        {effect="resistcommondisease", mag=20},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattack", mag=8},
      },
    },
    items = {
      "goblin_shield_durgok_uni", "goblin_shield", "tr_m1_goblin_trophy", "tr_i2-235_goblin_shield",
      "t_cr_goblin_helm_01", "t_cr_goblin_pauldronl_01", "t_cr_goblin_pauldronr_01", "t_cr_goblin_shield_01",
    },
  },
  {
    name = "Gold",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="personality", mag=3},
      },
      mid = {
        {effect="fortifyattribute", attribute="personality", mag=5},
        {effect="fortifyskill", skill="mercantile", mag=8},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="fortifyskill", skill="mercantile", mag=12},
        {effect="resistmagicka", mag=12},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "t_imp_gold_boots_02", "t_imp_gold_bracerl_02", "t_imp_gold_bracerr_02", "t_imp_gold_cuirass_01",
      "t_imp_gold_cuirass_02", "t_imp_gold_gauntletl_02", "t_imp_gold_gauntletr_02", "t_imp_gold_greaves_02",
      "t_imp_gold_helm_01", "t_imp_gold_helm_02", "t_imp_gold_pauldronl_01", "t_imp_gold_pauldronl_02",
      "t_imp_gold_pauldronr_01", "t_imp_gold_pauldronr_02", "t_imp_gold_shield_01", "t_imp_gold_shieldbuckler_01",
    },
  },
  {
    name = "Golden Saint",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
        {effect="spellabsorption", mag=3},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="spellabsorption", mag=5},
        {effect="reflect", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="spellabsorption", mag=8},
        {effect="reflect", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "t_dae_gold_boots_01", "t_dae_gold_cuirass_01", "t_dae_gold_gauntletl_01", "t_dae_gold_gauntletr_01",
      "t_dae_gold_greaves_01", "t_dae_gold_helm_01", "t_dae_gold_pauldronl_01", "t_dae_gold_pauldronr_01",
    },
  },
  {
    name = "Guar Hide",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="resistblightdisease", mag=15},
        {effect="fortifyattribute", attribute="endurance", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="resistblightdisease", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_de_guarskin_boots_01", "t_de_guarskin_bracerl_01", "t_de_guarskin_bracerl_spear", "t_de_guarskin_bracerr_01",
      "t_de_guarskin_bracerr_spear", "t_de_guarskin_cuirass_01", "t_de_guarskin_greaves_01", "t_de_guarskin_helm_01",
      "t_de_guarskin_helm_02", "t_de_guarskin_helm_03", "t_de_guarskin_helm_feather", "t_de_guarskin_pauldronl_01",
      "t_de_guarskin_pauldronr_01", "t_de_guarskin_shield_01", "t_de_guarskin_shield_damfatigue",
    },
  },
  {
    name = "Guard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyattribute", attribute="endurance", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Heavy Armor",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyhealth", mag=12},
        {effect="fortifyattribute", attribute="endurance", mag=5},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattribute", attribute="endurance", mag=8},
      },
    },
    items = {
      "daedric_fountain_helm", "daedric_terrifying_helm", "daedric_god_helm", "daedric_pauldron_left",
      "daedric_pauldron_right", "daedric_cuirass", "daedric_gauntlet_left", "daedric_gauntlet_right",
      "daedric_greaves", "daedric_boots", "daedric_shield", "daedric_towershield",
      "daedric_cuirass_htab", "daedric_greaves_htab", "daedric_helm_clavicusvile", "azura's servant",
      "t_dae_regular_helmconsolat_01", "t_dae_regular_helmhumiliat_02", "t_dae_regular_helmrebellion_01",
    },
  },
  {
    name = "Her Hand",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="fortifyhealth", mag=12},
        {effect="fortifyskill", skill="restoration", mag=8},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="fortifyhealth", mag=18},
        {effect="turnundead", mag=20},
        {effect="fortifyskill", skill="restoration", mag=12},
      },
    },
    items = {
      "indoril_almalexia_helmet", "indoril_almalexia_boots", "indoril_almalexia_cuirass", "indoril_almalexia_greaves",
      "indoril_almalexia_pauldron_l", "indoril_almalexia_pauldron_r", "indoril_almalexia_gauntlet_r", "indoril_almalexia_gauntlet_l",
      "indoril_almalexia_shield", "indoril_mh_guard_boots", "indoril_mh_guard_cuirass", "indoril_mh_guard_gauntlet_l",
      "indoril_mh_guard_gauntlet_r", "indoril_mh_guard_greaves", "indoril_mh_guard_helmet", "indoril_mh_guard_pauldron_l",
      "indoril_mh_guard_pauldron_r", "indoril_mh_guard_shield",
    },
  },
  {
    name = "Hide",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyskill", skill="athletics", mag=8},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="fortifyattribute", attribute="speed", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "cuirass_savior_unique_x", "cuirass_savior_unique", "t_de_daedrichide_boots_01", "t_de_daedrichide_cuirass_01",
      "t_de_daedrichide_gauntletl_01", "t_de_daedrichide_gauntletr_01", "t_de_daedrichide_greaves_01", "t_de_daedrichide_pauldronl_01",
      "t_de_daedrichide_pauldronr_01", "t_dae_uni_bootssaviorshide", "t_dae_uni_greavessaviorshide", "t_dae_uni_helmsaviorshide",
      "t_dae_uni_lgauntsaviorshide", "t_dae_uni_lpauldsaviorshide", "t_dae_uni_rgauntsaviorshide", "t_dae_uni_rpauldsaviorshide",
    },
  },
  {
    name = "House Direnni",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
        {effect="restoremagicka", mag=1, dur=1},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="restoremagicka", mag=1, dur=1},
        {effect="spellabsorption", mag=5},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="restoremagicka", mag=2, dur=1},
        {effect="spellabsorption", mag=8},
        {effect="fortifyskill", skill="alteration", mag=12},
      },
    },
    items = {
      "t_he_direnni_boots_01", "t_he_direnni_bracerl_01", "t_he_direnni_bracerr_01", "t_he_direnni_cuirass_01",
      "t_he_direnni_greaves_01", "t_he_direnni_helm_01", "t_he_direnni_pauldronl_01", "t_he_direnni_pauldronr_01",
    },
  },
  {
    name = "House Dres",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="resistfire", mag=10},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="resistfire", mag=15},
        {effect="fortifyskill", skill="longblade", mag=8},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="resistfire", mag=20},
        {effect="fortifyskill", skill="longblade", mag=12},
        {effect="fortifyattribute", attribute="endurance", mag=8},
      },
    },
    items = {
      "t_de_dresbonemold_boots_01", "t_de_dresbonemold_cuirass_01", "t_de_dresbonemold_gauntletl_01", "t_de_dresbonemold_gauntletr_01",
      "t_de_dresbonemold_greaves_01", "t_de_dresbonemold_helm_01", "t_de_dresbonemold_pauldronl_01", "t_de_dresbonemold_pauldronr_01",
      "t_de_dresbonemold_shieldtow_01", "t_de_dreschapthil_helm_01a", "t_de_dreschapthil_helm_01b", "t_de_dreschapthil_helm_01c",
      "t_de_dreschapthil_helm_01d", "t_de_dreschapthil_helm_01e", "t_de_dreschapthil_helm_02a", "t_de_dreschapthil_helm_02b",
      "t_de_dreschapthil_helm_02c", "t_de_dreschapthil_helm_02d", "t_de_dreschapthil_helm_02e", "t_de_dreschapthil_helm_03a",
      "t_de_dreschapthil_helm_03b", "t_de_dreschapthil_helm_03c", "t_de_dreschapthil_helm_03d", "t_de_dreschapthil_helm_03e",
      "t_de_dreshunter_cuirass_01", "t_de_dreshunter_greaves_01", "t_de_dreshunter_helm_01", "t_de_dreshunter_pauldronl_01",
      "t_de_dreshunter_pauldronr_01", "t_de_dressaltmerc_helm_01", "t_de_dressaltmerc_helm_02", "tr_i2-410_a_dres_cuirass_broken",
      "nod_ardres",
    },
  },
  {
    name = "House Hlaalu",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyskill", skill="mercantile", mag=5},
        {effect="fortifyattribute", attribute="personality", mag=3},
      },
      mid = {
        {effect="fortifyskill", skill="mercantile", mag=8},
        {effect="fortifyattribute", attribute="personality", mag=5},
        {effect="fortifyskill", skill="speechcraft", mag=8},
      },
      max = {
        {effect="fortifyskill", skill="mercantile", mag=12},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="fortifyskill", skill="speechcraft", mag=12},
        {effect="fortifyattribute", attribute="luck", mag=8},
      },
    },
    items = {
      "bonemold_tshield_hlaaluguard", "tr_m4_olmshelm_i4-261-hla", "ab_a_chitinhlahelm01", "nod_dnk_hlaalu_cuirass",
      "nod_arhlaalu", "nod_rv_chitin helm f_hh",
    },
  },
  {
    name = "House Indoril",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
        {effect="fortifyskill", skill="restoration", mag=5},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="fortifyskill", skill="restoration", mag=8},
        {effect="fortifyattribute", attribute="personality", mag=5},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="fortifyskill", skill="restoration", mag=12},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="turnundead", mag=20},
      },
    },
    items = {
      "indoril shield", "indoril pauldron left", "indoril pauldron right", "indoril helmet",
      "indoril cuirass", "indoril left gauntlet", "indoril right gauntlet", "indoril boots",
      "succour of indoril", "spirit of indoril", "indoril_almalexia_helmet", "indoril_almalexia_boots",
      "indoril_almalexia_cuirass", "indoril_almalexia_greaves", "indoril_almalexia_pauldron_l", "indoril_almalexia_pauldron_r",
      "indoril_almalexia_gauntlet_r", "indoril_almalexia_gauntlet_l", "indoril_almalexia_shield", "indoril_mh_guard_boots",
      "indoril_mh_guard_cuirass", "indoril_mh_guard_gauntlet_l", "indoril_mh_guard_gauntlet_r", "indoril_mh_guard_greaves",
      "indoril_mh_guard_helmet", "indoril_mh_guard_pauldron_l", "indoril_mh_guard_pauldron_r", "indoril_mh_guard_shield",
      "tr_m3_brother_indorilhelm", "tr_m3_indshield_i3-606-ind", "t_de_indbonemold_boots_01", "t_de_indbonemold_cuirass_01",
      "t_de_indbonemold_gauntletl_01", "t_de_indbonemold_gauntletr_01", "t_de_indbonemold_greaves_01", "t_de_indbonemold_helmsaviour_01",
      "t_de_indbonemold_pauldronl_01", "t_de_indbonemold_pauldronl_02", "t_de_indbonemold_pauldronr_01", "t_de_indbonemold_pauldronr_02",
      "t_de_indbonemold_shield_01", "t_de_indbonemold_shield_02", "t_de_indbonemold_shield_03", "t_de_indbonemold_shield_04",
      "t_de_indbonemold_shield_05", "t_de_indchevaram_boots_01", "t_de_indchevaram_bracerl_01", "t_de_indchevaram_bracerr_01",
      "t_de_indchevaram_cuirass_01", "t_de_indchevaram_greaves_01", "t_de_indchevaram_helm_01", "t_de_indchevaram_helm_02",
      "t_de_indchevaram_pauldrl_01", "t_de_indchevaram_pauldrr_01", "nod_arindoril", "nod_arindoril2",
      "nod_ar_indrobe1", "nod_ar_indhelm", "nod_ar_indrobe_nc1", "nod_arindoril_hood",
      "nod_arindoril_hood&mask", "nod_ar_indoril helmet2",
    },
  },
  {
    name = "House Redoran",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistblightdisease", mag=15},
        {effect="fortifyattribute", attribute="endurance", mag=5},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistblightdisease", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="resistnormalweapons", mag=8},
      },
    },
    items = {
      "t_a_dechitinhelmopen01_hrpen", "t_a_deredwatchchitincuir01_cuirass", "t_de_redwatchchitin_pauldrl_01", "t_de_redwatchchitin_pauldrr_01",
      "t_a_deredwatchchitingreav01_greaves", "t_de_redwatchchitin_boots_01", "t_a_deredwatchchitingreav01_gauntlet_left", "t_a_deredwatchchitingreav01_gauntlet_right",
      "aatl_amw_a_vandashelm", "aatl_amw_a_vandas_bannershield",
    },
  },
  {
    name = "House Telvanni",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyattribute", attribute="intelligence", mag=3},
      },
      mid = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyattribute", attribute="intelligence", mag=5},
        {effect="fortifyskill", skill="mysticism", mag=8},
      },
      max = {
        {effect="restoremagicka", mag=2, dur=1},
        {effect="fortifyattribute", attribute="intelligence", mag=8},
        {effect="fortifyskill", skill="mysticism", mag=12},
        {effect="fortifyskill", skill="destruction", mag=12},
      },
    },
    items = {
      "bonemold_tshield_telvanniguard", "dust_adept_helm", "mole_crab_helm", "cephalopod_helm",
      "t_de_telvcephalopod_boots_01", "t_de_telvcephalopod_cuirass_01", "t_de_telvcephalopod_gauntl_01", "t_de_telvcephalopod_gauntr_01",
      "t_de_telvcephalopod_greaves_01", "t_de_telvcephalopod_pauldl_01", "t_de_telvcephalopod_pauldr_01", "t_de_molecrab_boots_01",
      "t_de_molecrab_bracerl_01", "t_de_molecrab_bracerr_01", "t_de_molecrab_cuirass_01", "t_de_molecrab_greaves_01",
      "t_de_molecrab_pauldronl_01", "t_de_molecrab_pauldronr_01", "t_de_ep_hattelv_01", "t_de_ep_hattelv_02",
      "t_de_ep_hattelv_03", "t_de_et_hattelv_01", "t_de_et_hattelv_02", "t_de_ex_hattelv_01",
      "t_de_ex_hattelv_02", "t_de_cm_hattelv_01", "t_de_cm_hattelv_02", "t_de_cm_hattelv_03",
      "t_de_cm_hattelv_04", "t_de_cm_hattelv_05", "ab_a_cephhelmopen", "ab_a_dustboots",
      "ab_a_dustbracerleft", "ab_a_dustbracerright", "ab_a_dustchest", "ab_a_dustgreaves",
      "ab_a_dusthelm", "ab_a_dustpldrleft", "ab_a_dustpldrright", "nod_hat_telv_rm_headwear_10",
      "nod_hat_telv_rm_headwear_11", "nod_hat_telv_rm_headwear_12", "nod_hat_shroomcap_telvanni", "nod_artelvanni",
    },
  },
  {
    name = "Imperial",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="personality", mag=3},
        {effect="fortifyskill", skill="speechcraft", mag=5},
      },
      mid = {
        {effect="fortifyattribute", attribute="personality", mag=5},
        {effect="fortifyskill", skill="speechcraft", mag=8},
        {effect="fortifyskill", skill="mercantile", mag=8},
      },
      max = {
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="fortifyskill", skill="speechcraft", mag=12},
        {effect="fortifyskill", skill="mercantile", mag=12},
        {effect="fortifyattack", mag=8},
      },
    },
    items = {
      "silver_helm", "silver_cuirass", "silver_dukesguard_cuirass", "templar_helmet_armor",
      "templar_cuirass", "templar_pauldron_left", "templar_pauldron_right", "templar bracer left",
      "templar bracer right", "templar_greaves", "templar boots", "imperial helmet armor",
      "imperial cuirass_armor", "imperial left pauldron", "imperial right pauldron", "imperial left gauntlet",
      "imperial right gauntlet", "imperial_greaves", "imperial boots", "imperial shield",
      "imperial_chain_coif_helm", "imperial_chain_cuirass", "imperial_chain_pauldron_left", "imperial_chain_pauldron_right",
      "imperial_chain_greaves", "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield",
      "imperial_studded_cuirass", "newtscale_cuirass", "imperial_helm_frald_uniq", "imperial helmet armor_dae_curse",
      "feather_shield", "shield_of_light", "velothis_shield", "t_imp_studdedleather_helm_01",
      "t_imp_studdedleather_pauldrl_01", "t_imp_studdedleather_pauldrr_01t", "t_imp_studdedleather_greaves_01", "t_imp_studdedleather_boots_01",
    },
  },
  {
    name = "Iron",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="fortifyfatigue", mag=28},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "nordic_iron_helm", "nordic_iron_cuirass", "iron_pauldron_left", "iron_pauldron_right",
      "iron_cuirass", "iron_shield", "iron_towershield", "iron_bracer_left",
      "iron_bracer_right", "iron_greaves", "iron_gauntlet_left", "iron_gauntlet_right",
      "iron_helmet", "iron boots", "atl_a_buck_iron", "atl_a_buck_iron_h",
      "atl_a_buck_niron", "atl_a_buck_niron_h", "atl_a_buck_niron_avalanche", "atl_a_buck_niron_h_iceward",
      "atl_a_buck_iron_h_thunderwave", "atl_a_buck_iron_devil", "atl_a_buck_iron_h_warriorsward", "t_com_iron_boots_01",
      "t_com_iron_boots_02", "t_com_iron_bracerl_01", "t_com_iron_bracerl_02", "t_com_iron_bracerr_01",
      "t_com_iron_bracerr_02", "t_com_iron_cuirass_01", "t_com_iron_cuirass_02", "t_com_iron_greaves_01",
      "t_com_iron_greaves_02", "t_com_iron_helm_01", "t_com_iron_helm_02", "t_com_iron_helm_open",
      "t_com_iron_pauldronl_01", "t_com_iron_pauldronl_02", "t_com_iron_pauldronr_01", "t_com_iron_pauldronr_02",
      "t_com_ironskull_pauldronl_01", "t_com_ironskull_pauldronr_01", "t_com_ironspike_pauldronl_01", "t_com_ironspike_pauldronr_01",
      "t_imp_coliron1_boots_01", "t_imp_coliron1_boots_02", "t_imp_coliron1_boots_03", "t_imp_coliron1_boots_04",
      "t_imp_coliron1_cuirass_01", "t_imp_coliron1_cuirass_02", "t_imp_coliron1_cuirass_03", "t_imp_coliron1_cuirass_04",
      "t_imp_coliron1_gauntletl_01", "t_imp_coliron1_gauntletl_02", "t_imp_coliron1_gauntletl_03", "t_imp_coliron1_gauntletl_04",
      "t_imp_coliron1_gauntletr_01", "t_imp_coliron1_gauntletr_02", "t_imp_coliron1_gauntletr_03", "t_imp_coliron1_gauntletr_04",
      "t_imp_coliron1_greaves_01", "t_imp_coliron1_greaves_02", "t_imp_coliron1_greaves_03", "t_imp_coliron1_greaves_04",
      "t_imp_coliron1_helm_01", "t_imp_coliron1_helm_02", "t_imp_coliron1_helm_03", "t_imp_coliron1_helm_04",
      "t_imp_coliron1_pauldronl_01", "t_imp_coliron1_pauldronl_02", "t_imp_coliron1_pauldronl_03", "t_imp_coliron1_pauldronl_04",
      "t_imp_coliron1_pauldronr_01", "t_imp_coliron1_pauldronr_02", "t_imp_coliron1_pauldronr_03", "t_imp_coliron1_pauldronr_04",
      "t_imp_coliron2_boots_01", "t_imp_coliron2_bracerl_01", "t_imp_coliron2_bracerr_01", "t_imp_coliron2_cuirass_01",
      "t_imp_coliron2_greaves_01", "t_imp_coliron2_helm_01", "t_imp_coliron2_pauldronl_01", "t_imp_coliron2_pauldronr_01",
      "t_imp_coliron_boots_01", "t_imp_coliron_bracerl_01", "t_imp_coliron_bracerr_01", "t_imp_coliron_cuirass_01",
      "t_imp_coliron_greaves_01", "t_imp_coliron_helmet_01", "t_imp_coliron_helmet_02", "t_imp_coliron_pauldronl_01",
      "t_imp_coliron_pauldronr_01", "t_nor_iron_boots_01", "t_nor_iron_boots_leap", "t_nor_iron_cuirass_wintery",
      "t_nor_iron_gauntletl_01", "t_nor_iron_gauntletr_01", "t_nor_iron_greaves_01", "t_nor_iron_pauldronl_01",
      "t_nor_iron_pauldronr_01", "t_nor_ironwood_shield_01", "t_nor_ironwood_shield_02", "tr_i2-235_iron_towershield",
      "t_rga_iron_boots_01", "t_rga_iron_boots_02", "t_rga_iron_bracerl_01", "t_rga_iron_bracerl_02",
      "t_rga_iron_bracerr_01", "t_rga_iron_bracerr_02", "t_rga_iron_cuirass_01", "t_rga_iron_cuirass_02",
      "t_rga_iron_greaves_01", "t_rga_iron_greaves_02", "t_rga_iron_helm_01", "t_rga_iron_helm_02",
      "t_rga_iron_pauldronl_01", "t_rga_iron_pauldronl_02", "t_rga_iron_pauldronr_01", "t_rga_iron_pauldronr_02",
      "ab_a_irondeboots", "ab_a_irondecuirass", "ab_a_irondehelm", "ab_a_irondehelmtong",
      "ab_a_irondepldleft", "ab_a_irondepldright", "nod_hat_iron_rm_headwear04", "nod_hat_iron_rm_headwear05",
      "nod_hat_iron_rm_headwear06", "nod_hat_iron_rm_headwear_07", "nod_hat_iron_rm_headwear_08", "nod_hat_iron_rm_headwear_09",
      "aatl_a_buck_iron", "aatl_a_buck_niron", "aatl_a_buck_iron_en1", "aatl_a_buck_iron_nord",
      "aatl_a_buck_iron_nord_en1",
    },
  },
  {
    name = "Kagouti Hide",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="speed", mag=3},
        {effect="fortifyskill", skill="athletics", mag=5},
      },
      mid = {
        {effect="fortifyattribute", attribute="speed", mag=5},
        {effect="fortifyskill", skill="athletics", mag=8},
        {effect="resistpoison", mag=15},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyattribute", attribute="speed", mag=8},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="resistpoison", mag=20},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_de_kagoutihide_boots_01", "t_de_kagoutihide_bracerl_01", "t_de_kagoutihide_bracerr_01", "t_de_kagoutihide_cuirass_01",
      "t_de_kagoutihide_cuirass_hunter", "t_de_kagoutihide_greaves_01", "t_de_kagoutihide_helmopen_01", "t_de_kagoutihide_helm_01",
      "t_de_kagoutihide_helm_hunter", "t_de_kagoutihide_pauldronl_01", "t_de_kagoutihide_pauldronr_01", "t_de_kagoutihide_shield_01",
      "t_de_kagoutihide_shield_02", "t_de_kagoutihide_shield_sanct", "t_de_kagoutihide_tshield_tusks", "t_de_kagoutihide_towershield_01",
    },
  },
  {
    name = "Kalantar",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="fortifyattack", mag=3},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyattack", mag=5},
        {effect="fortifyattribute", attribute="strength", mag=5},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyattack", mag=8},
        {effect="fortifyattribute", attribute="strength", mag=8},
        {effect="fortifyhealth", mag=18},
      },
    },
    items = {
      "t_imp_guardtown2_boots_01", "t_imp_guardtown2_cuirass_01", "t_imp_guardtown2_gauntletl_01", "t_imp_guardtown2_gauntletr_01",
      "t_imp_guardtown2_greaves_01", "t_imp_guardtown2_helm_01", "t_imp_guardtown2_helmart_01", "t_imp_guardtown2_helmbru_01",
      "t_imp_guardtown2_helmcho_01", "t_imp_guardtown2_pauldrl_01", "t_imp_guardtown2_pauldrr_01",
    },
  },
  {
    name = "Khajiit",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="nighteye", mag=25},
        {effect="fortifyattribute", attribute="agility", mag=3},
      },
      mid = {
        {effect="nighteye", mag=40},
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="fortifyskill", skill="acrobatics", mag=8},
      },
      max = {
        {effect="nighteye", mag=50},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="fortifyskill", skill="acrobatics", mag=12},
        {effect="fortifyskill", skill="handtohand", mag=12},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Klibanion",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="fortifyattribute", attribute="endurance", mag=3},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyattribute", attribute="endurance", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "t_imp_guardtown3_boots_01", "t_imp_guardtown3_cuirass_01", "t_imp_guardtown3_gauntletl_01", "t_imp_guardtown3_gauntletr_01",
      "t_imp_guardtown3_greaves_01", "t_imp_guardtown3_helm_01", "t_imp_guardtown3_helmkva_01", "t_imp_guardtown3_helmsar_01",
      "t_imp_guardtown3_helmskn_01", "t_imp_guardtown3_pauldrl_01", "t_imp_guardtown3_pauldrr_01",
    },
  },
  {
    name = "Kragen",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="fortifyskill", skill="mercantile", mag=5},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyskill", skill="mercantile", mag=8},
        {effect="fortifyhealth", mag=12},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyskill", skill="mercantile", mag=12},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_bonemoldkrage_boots_01", "t_de_bonemoldkrage_cuirass_01", "t_de_bonemoldkrage_gauntletl_01", "t_de_bonemoldkrage_gauntletr_01",
      "t_de_bonemoldkrage_greaves_01", "t_de_bonemoldkrage_helm_01", "t_de_bonemoldkrage_pauldronl_01", "t_de_bonemoldkrage_pauldronr_01",
      "t_de_bonemoldkragen_helm_01",
    },
  },
  {
    name = "Kvetchi",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistblightdisease", mag=10},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="resistblightdisease", mag=15},
        {effect="fortifyfatigue", mag=20},
        {effect="resistpoison", mag=15},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistblightdisease", mag=20},
        {effect="fortifyfatigue", mag=28},
        {effect="resistpoison", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_imp_chainmail_cuirass_04", "t_imp_chainmail_helm_04", "t_imp_colsteel_boots_02", "t_imp_colsteel_cuirass_02",
      "t_imp_colsteel_gauntletl_02", "t_imp_colsteel_gauntletr_02", "t_imp_colsteel_greaves_02", "t_imp_colsteel_helm_02",
      "t_imp_colsteel_helm_06", "t_imp_colsteel_pauldronl_02", "t_imp_colsteel_pauldronr_02",
    },
  },
  {
    name = "Kynareth",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="slowfall", mag=10},
        {effect="resistshock", mag=10},
      },
      mid = {
        {effect="slowfall", mag=15},
        {effect="resistshock", mag=15},
        {effect="fortifyattribute", attribute="speed", mag=5},
      },
      max = {
        {effect="slowfall", mag=20},
        {effect="resistshock", mag=20},
        {effect="fortifyattribute", attribute="speed", mag=8},
        {effect="fortifyfatigue", mag=28},
      },
    },
    items = {
      "_wyrm_kynareth_gauntlet_right", "_wyrm_kynareth_pauldron_right", "_wyrm_kynareth_gauntlet_left", "_wyrm_kynareth_pauldron_left",
      "_wyrm_kynareth_shield_battle", "_wyrm_kynareth_shield_round", "_wyrm_kynareth_open_helm", "_wyrm_kynareth_cuirass",
      "_wyrm_kynareth_greaves", "_wyrm_kynareth_quiver", "_wyrm_kynareth_shield", "_wyrm_kynareth_tabard",
      "_wyrm_kynareth_boots", "_wyrm_kynareth_helm", "_wyrm_kynareth_quiver2",
    },
  },
  {
    name = "Lamellar",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "t_rga_lamellar_bracer_l_01", "t_rga_lamellar_bracer_r_01", "t_rga_lamellar_cuirass", "t_rga_lamellar_cuirass_b",
      "t_rga_lamellar_cuirass_g", "t_rga_lamellar_cuirass_y", "t_rga_lamellar_helm", "t_rga_lamellar_helm_b",
      "t_rga_lamellar_helm_g", "t_rga_lamellar_helm_y", "t_imp_collamellar_boots_01", "t_imp_collamellar_bracerl_01",
      "t_imp_collamellar_bracerr_01", "t_imp_collamellar_cuirass_01", "t_imp_collamellar_greaves_01", "t_imp_collamellar_helmopen_01",
      "t_imp_collamellar_helm_01", "t_imp_collamellar_maskhelm_01", "t_imp_collamellar_maskhelm_02", "t_imp_collamellar_pauldronl_01",
      "t_imp_collamellar_pauldronr_01",
    },
  },
  {
    name = "Leather",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="fortifyskill", skill="acrobatics", mag=5},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyskill", skill="acrobatics", mag=8},
        {effect="fortifyskill", skill="sneak", mag=8},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyskill", skill="acrobatics", mag=12},
        {effect="fortifyskill", skill="sneak", mag=12},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "right leather bracer", "left leather bracer", "netch_leather_helm", "netch_leather_boiled_helm",
      "netch_leather_pauldron_left", "netch_leather_cuirass", "netch_leather_boiled_cuirass", "netch_leather_gauntlet_left",
      "netch_leather_gauntlet_right", "netch_leather_greaves", "netch_leather_boots", "netch_leather_shield",
      "netch_leather_towershield", "nordic_leather_shield", "netch_leather_pauldron_right", "heavy_leather_boots",
      "t_imp_studdedleather_boots_01", "t_imp_studdedleather_bracerl_01", "t_imp_studdedleather_bracerr_01", "t_imp_studdedleather_cuirass_02",
      "t_imp_studdedleather_cuirass_03", "t_imp_studdedleather_greaves_01", "t_imp_studdedleather_helm_01", "t_imp_studdedleather_helm_02",
      "t_imp_studdedleather_helm_03", "t_imp_studdedleather_pauldrl_01", "t_imp_studdedleather_pauldrr_01", "t_orc_leather_boots_01",
      "t_orc_leather_cuirass_01", "t_orc_leather_gauntletl_01", "t_orc_leather_gauntletr_01", "t_orc_leather_greaves_01",
      "t_orc_leather_helm_01", "t_orc_leather_pauldronl_01", "t_orc_leather_pauldronr_01", "t_rea_leather_hat_01",
      "t_rea_leather_hat_witchery", "t_nor_leather1_barcerl_01", "t_nor_leather1_barcerr_01", "t_nor_leather1_boots_01",
      "t_nor_leather1_cuirass_01", "t_nor_leather1_greaves_01", "t_nor_leather1_helm_01", "t_nor_leather1_pauldl_01",
      "t_nor_leather1_pauldr_01", "t_nor_leather2_boots_01", "t_nor_leather2_bracerl_01", "t_nor_leather2_bracerr_01",
      "t_nor_leather2_cuirass_01", "t_nor_leather2_greaves_01", "t_nor_leather2_helm_01", "t_nor_leather2_pauldl_01",
      "t_nor_leather2_pauldr_01", "ab_a_leatherhat", "nod_r0_netch_leather_pauldron_l", "nod_r0_netch_leather_pauldron_r",
    },
  },
  {
    name = "Light Armor",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="fortifyattribute", attribute="agility", mag=3},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="sanctuary", mag=7},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="sanctuary", mag=10},
        {effect="fortifyskill", skill="acrobatics", mag=12},
      },
    },
    items = {
      "imperial_studded_cuirass", "darkbrotherhood helm", "darkbrotherhood cuirass", "darkbrotherhood pauldron_l",
      "darkbrotherhood pauldron_r", "darkbrotherhood greaves", "darkbrotherhood boots", "darkbrotherhood gauntlet_l",
      "darkbrotherhood gauntlet_r", "t_a_dechitinhelmopen01_hrpen", "t_a_deredwatchchitincuir01_cuirass", "t_de_redwatchchitin_pauldrl_01",
      "t_de_redwatchchitin_pauldrr_01", "t_a_deredwatchchitingreav01_greaves", "t_de_redwatchchitin_boots_01", "t_a_deredwatchchitingreav01_gauntlet_left",
      "t_a_deredwatchchitingreav01_gauntlet_right", "t_imp_studdedleather_helm_01", "t_imp_studdedleather_pauldrl_01", "t_imp_studdedleather_pauldrr_01t",
      "t_imp_studdedleather_greaves_01", "t_imp_studdedleather_boots_01",
    },
  },
  {
    name = "Mages Guild",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyskill", skill="destruction", mag=5},
      },
      mid = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyskill", skill="destruction", mag=8},
        {effect="resistmagicka", mag=8},
      },
      max = {
        {effect="restoremagicka", mag=2, dur=1},
        {effect="fortifyskill", skill="destruction", mag=12},
        {effect="resistmagicka", mag=12},
        {effect="fortifyattribute", attribute="intelligence", mag=8},
      },
    },
    items = {

    },
  },
  {
    name = "Mananaut",
    thresholds = { min=2, mid=3, max=5 },
    bonuses = {
      min = {
        {effect="resistshock", mag=10},
        {effect="waterbreathing", mag=1},
      },
      mid = {
        {effect="resistshock", mag=15},
        {effect="waterbreathing", mag=1},
        {effect="fortifyattribute", attribute="intelligence", mag=5},
      },
      max = {
        {effect="resistshock", mag=20},
        {effect="waterbreathing", mag=1},
        {effect="fortifyattribute", attribute="intelligence", mag=8},
        {effect="reflect", mag=8},
      },
    },
    items = {
      "t_imp_mananaut_boots_01", "t_imp_mananaut_cuirass_01", "t_imp_mananaut_gauntl_01", "t_imp_mananaut_gauntr_01",
      "t_imp_mananaut_helm_01", "t_imp_mananaut_helm_02",
    },
  },
  {
    name = "Manatee Leather",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=20},
      },
      mid = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=30},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=40},
        {effect="fortifyfatigue", mag=28},
        {effect="resistfrost", mag=20},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_qyk_manatee_boots_01", "t_qyk_manatee_bracerl_01", "t_qyk_manatee_bracerr_01", "t_qyk_manatee_cuirass_01",
      "t_qyk_manatee_greaves_01", "t_qyk_manatee_helm_01", "t_qyk_manatee_pauldronl_01", "t_qyk_manatee_pauldronr_01",
    },
  },
  {
    name = "Maormer",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=20},
      },
      mid = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=30},
        {effect="resistshock", mag=15},
      },
      max = {
        {effect="waterbreathing", mag=1},
        {effect="swiftswim", mag=40},
        {effect="resistshock", mag=20},
        {effect="chameleon", mag=10},
      },
    },
    items = {
      "t_mao_scale_boots_01", "t_mao_scale_bracer_l_01", "t_mao_scale_bracer_r_01", "t_mao_scale_cuirass_01",
      "t_mao_scale_greaves_01", "t_mao_scale_helm_01", "t_mao_scale_pauld_l_01", "t_mao_scale_pauld_r_01",
    },
  },
  {
    name = "Maradlai",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="fortifyattribute", attribute="speed", mag=3},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="fortifyattribute", attribute="speed", mag=5},
        {effect="fortifyfatigue", mag=20},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="fortifyattribute", attribute="speed", mag=8},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyskill", skill="athletics", mag=12},
      },
    },
    items = {
      "t_de_bonemoldmarad_cuirass_01", "t_de_bonemoldmarad_helm_01", "t_de_bonemoldmarad_helm_02", "t_de_bonemoldmarad_pauldronl_01",
      "t_de_bonemoldmarad_pauldronr_01", "t_de_bonemoldmarad_shield_01",
    },
  },
  {
    name = "Master",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="luck", mag=3},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="fortifyattribute", attribute="luck", mag=5},
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="fortifyattribute", attribute="luck", mag=8},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattack", mag=8},
      },
    },
    items = {
      "redoran_master_helm", "t_de_redmastbonemold_cuirass_01", "t_de_redmastbonemold_pauldrl_01", "t_de_redmastbonemold_pauldrr_01",
    },
  },
  {
    name = "Medium Armor",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattribute", attribute="endurance", mag=8},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Militia",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
      },
    },
    items = {
      "t_imp_militia_boots_01", "t_imp_militia_cuirass_01", "t_imp_militia_gauntl_01", "t_imp_militia_gauntr_01",
      "t_imp_militia_greaves_01", "t_imp_militia_helm_01", "t_imp_militia_pauldronl_01", "t_imp_militia_pauldronr_01",
    },
  },
  {
    name = "Molecrab",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "tr_m1_molecrab_cuirass_protect", "t_de_molecrab_cuirass_01", "t_de_molecrab_pauldronl_01", "t_de_molecrab_pauldronr_01",
      "t_de_molecrab_greaves_01", "t_de_molecrab_boots_01", "t_de_molecrab_bracerl_01", "t_de_molecrab_bracerr_01",
    },
  },
  {
    name = "Morag Tong",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="fortifyskill", skill="shortblade", mag=5},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="fortifyskill", skill="shortblade", mag=8},
        {effect="fortifyskill", skill="sneak", mag=8},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="fortifyskill", skill="shortblade", mag=12},
        {effect="fortifyskill", skill="sneak", mag=12},
        {effect="chameleon", mag=10},
      },
    },
    items = {
      "morag_tong_helm", "t_de_moragtong_boots_01", "t_de_moragtong_bracerl_01", "t_de_moragtong_bracerr_01",
      "t_de_moragtong_cuirass_01", "t_de_moragtong_greaves_01", "t_de_moragtong_pauldronl_01", "t_de_moragtong_pauldronr_01",
      "ab_a_moragtonghelm01", "ab_a_moragtonghelm02", "ab_a_moragtonghelm03", "ab_a_moragtonghelm04",
    },
  },
  {
    name = "Narsis Watch",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyattribute", attribute="endurance", mag=5},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="fortifyskill", skill="mercantile", mag=12},
      },
    },
    items = {
      "t_de_narsiswatch_boots_01", "t_de_narsiswatch_cuirass_01", "t_de_narsiswatch_gauntletl_01", "t_de_narsiswatch_gauntletr_01",
      "t_de_narsiswatch_greaves01", "t_de_narsiswatch_helm_01", "t_de_narsiswatch_pauldronl_01", "t_de_narsiswatch_pauldronr_01",
    },
  },
  {
    name = "Native",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistblightdisease", mag=10},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="resistblightdisease", mag=15},
        {effect="resistpoison", mag=15},
        {effect="fortifyskill", skill="athletics", mag=8},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistblightdisease", mag=20},
        {effect="resistpoison", mag=20},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="resistfire", mag=20},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "bonemold_gah-julan_hhda", "bonemold_gah-julan_helm", "bonemold_chuzei_helm", "bonemold_armun-an_helm",
      "bonemold_gah-julan_pauldron_r", "bonemold_armun-an_pauldron_r", "bonemold_gah-julan_pauldron_l", "bonemold_armun-an_pauldron_l",
      "bonemold_gah-julan_cuirass", "bonemold_armun-an_cuirass", "tr_i2-410_a_dres_cuirass_broken", "t_de_thirrbonemold_boots_01",
      "t_de_thirrbonemold_bracer_01_l", "t_de_thirrbonemold_bracer_01_r", "t_de_thirrbonemold_cuirass_01", "t_de_thirrbonemold_greaves_01",
      "t_de_thirrbonemold_helm_01", "t_de_thirrbonemold_pauldrn_01_l", "t_de_thirrbonemold_pauldrn_01_r", "t_de_nativeebony_boots_01",
      "t_de_nativeebony_cuirass_01", "t_de_nativeebony_gauntletl_01", "t_de_nativeebony_gauntletr_01", "t_de_nativeebony_greaves_01",
      "t_de_nativeebony_helmclosed_01", "t_de_nativeebony_helmclosed_02", "t_de_nativeebony_helmopen_01", "t_de_nativeebony_helmopen_02",
      "t_de_nativeebony_pauldronl_01", "t_de_nativeebony_pauldronr_01", "t_de_indbonemold_boots_01", "t_de_indbonemold_cuirass_01",
      "t_de_indbonemold_gauntletl_01", "t_de_indbonemold_gauntletr_01", "t_de_indbonemold_greaves_01", "t_de_indbonemold_helmsaviour_01",
      "t_de_indbonemold_pauldronl_01", "t_de_indbonemold_pauldronl_02", "t_de_indbonemold_pauldronr_01", "t_de_indbonemold_pauldronr_02",
      "t_de_indbonemold_shield_01", "t_de_indbonemold_shield_02", "t_de_indbonemold_shield_03", "t_de_indbonemold_shield_04",
      "t_de_indbonemold_shield_05", "t_de_indchevaram_boots_01", "t_de_indchevaram_bracerl_01", "t_de_indchevaram_bracerr_01",
      "t_de_indchevaram_cuirass_01", "t_de_indchevaram_greaves_01", "t_de_indchevaram_helm_01", "t_de_indchevaram_helm_02",
      "t_de_indchevaram_pauldrl_01", "t_de_indchevaram_pauldrr_01", "t_de_bonemold_chuzei_boots", "t_de_bonemold_chuzei_boots_e",
      "t_de_bonemold_chuzei_bracerl", "t_de_bonemold_chuzei_bracerl_e", "t_de_bonemold_chuzei_bracerr", "t_de_bonemold_chuzei_bracerr_e",
      "t_de_bonemold_chuzei_cuirass", "t_de_bonemold_chuzei_cuirass_e", "t_de_bonemold_chuzei_greaves", "t_de_bonemold_chuzei_greaves_e",
      "t_de_bonemold_chuzei_helm_e", "t_de_bonemold_chuzei_pauldl", "t_de_bonemold_chuzei_pauldl_e", "t_de_bonemold_chuzei_pauldr",
      "t_de_bonemold_chuzei_pauldr_e", "t_de_bonemold_helmopen_01", "t_de_bonemold_helmrider_01", "t_de_bonemold_stone_boots",
      "t_de_bonemold_stone_cuirass", "t_de_bonemold_stone_gauntletl", "t_de_bonemold_stone_gauntletr", "t_de_bonemold_stone_greaves",
      "t_de_bonemold_stone_helm", "t_de_bonemold_stone_pauldl", "t_de_bonemold_stone_pauldr", "t_de_bonemold_ulvra_boots",
      "t_de_bonemold_ulvra_bracerl", "t_de_bonemold_ulvra_bracerr", "t_de_bonemold_ulvra_cuirass", "t_de_bonemold_ulvra_greaves",
      "t_de_bonemold_ulvra_helm", "t_de_bonemold_ulvra_pauldl", "t_de_bonemold_ulvra_pauldr", "t_de_bonemoldkrage_boots_01",
      "t_de_bonemoldkrage_cuirass_01", "t_de_bonemoldkrage_gauntletl_01", "t_de_bonemoldkrage_gauntletr_01", "t_de_bonemoldkrage_greaves_01",
      "t_de_bonemoldkrage_helm_01", "t_de_bonemoldkrage_pauldronl_01", "t_de_bonemoldkrage_pauldronr_01", "t_de_bonemoldkragen_helm_01",
      "t_de_bonemoldmarad_cuirass_01", "t_de_bonemoldmarad_helm_01", "t_de_bonemoldmarad_helm_02", "t_de_bonemoldmarad_pauldronl_01",
      "t_de_bonemoldmarad_pauldronr_01", "t_de_bonemoldmarad_shield_01", "t_de_bonemoldsammas_helm_01", "t_de_canyonwatch_boots_01",
      "t_de_canyonwatch_bracerl_01", "t_de_canyonwatch_bracerr_01", "t_de_canyonwatch_cuirass_01", "t_de_canyonwatch_greaves_01",
      "t_de_canyonwatch_helm_01", "t_de_canyonwatch_pauldronl_01", "t_de_canyonwatch_pauldronr_01", "ab_a_irondeboots",
      "ab_a_irondecuirass", "ab_a_irondehelm", "ab_a_irondehelmtong", "ab_a_irondepldleft",
      "ab_a_irondepldright",
    },
  },
  {
    name = "Navy",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="swiftswim", mag=20},
        {effect="waterbreathing", mag=1},
      },
      mid = {
        {effect="swiftswim", mag=30},
        {effect="waterbreathing", mag=1},
        {effect="resistfrost", mag=15},
      },
      max = {
        {effect="swiftswim", mag=40},
        {effect="waterbreathing", mag=1},
        {effect="resistfrost", mag=20},
        {effect="fortifyfatigue", mag=28},
      },
    },
    items = {
      "t_imp_navyoff_boots_01", "t_imp_navyoff_bracerl_01", "t_imp_navyoff_bracerr_01", "t_imp_navyoff_cuirass_01",
      "t_imp_navyoff_greaves_01", "t_imp_navyoff_helmet_01", "t_imp_navyoff_pauldronl_01", "t_imp_navyoff_pauldronr_01",
      "t_imp_navystud_boots_01", "t_imp_navystud_cuirass_01", "t_imp_navystud_gauntletl_01", "t_imp_navystud_gauntletr_01",
      "t_imp_navystud_helm_01", "t_imp_navystud_pauldrl_01", "t_imp_navystud_pauldrr_01",
    },
  },
  {
    name = "Necrom Guard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="turnundead", mag=10},
        {effect="resistmagicka", mag=5},
      },
      mid = {
        {effect="turnundead", mag=15},
        {effect="resistmagicka", mag=8},
        {effect="fortifyhealth", mag=12},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="turnundead", mag=20},
        {effect="resistmagicka", mag=12},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyskill", skill="restoration", mag=12},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_de_necrom_boots_01", "t_de_necrom_cuirass_01", "t_de_necrom_cuirass_02", "t_de_necrom_gauntletl_01",
      "t_de_necrom_gauntletr_01", "t_de_necrom_greaves_01", "t_de_necrom_helm_01", "t_de_necrom_pauldronl_01",
      "t_de_necrom_pauldronr_01", "t_de_necrom_shield_01",
    },
  },
  {
    name = "Netch Leather",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="resistpoison", mag=15},
        {effect="fortifyskill", skill="athletics", mag=8},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="resistpoison", mag=20},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="fortifyattribute", attribute="speed", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "netch_leather_helm", "netch_leather_cuirass", "netch_leather_pauldron_left", "netch_leather_pauldron_right",
      "netch_leather_gauntlet_left", "netch_leather_gauntlet_right", "netch_leather_greaves", "netch_leather_boots",
      "snetch_leather_shield", "netch_leather_boiled_helm", "netch_leather_boiled_cuirass", "netch_leather_towershield",
      "boots of blinding speed[unique]", "left_horny_fist_gauntlet", "right horny fist gauntlet", "veloths_tower_shield",
      "merisan_cuirass", "netch_leather_shield", "atl_a_buck_netch", "atl_a_buck_netch_h",
      "atl_a_buck_netch_h_vampire", "atl_a_buck_netch_redoak", "atl_a_buck_netch_thiefsward", "tr_m1_q_cuirassofmobility",
      "t_de_netch_cuirass_01", "t_de_netch_cuirass_02", "t_de_netch_cuirass_03", "t_de_netch_cuirass_04",
      "t_de_netch_cuirass_05", "tr_m1_q_rancidcuirass_uni", "t_de_netch_helm_01", "t_de_netch_helm_02",
      "t_de_netch_helm_03", "t_de_netchrogue_cuirass_01", "t_de_netchrogue_helm_01", "t_de_netchrogue_helm_02",
      "t_de_netchstalker_helm_01", "ab_a_netchboilpldleft", "ab_a_netchboilpldright", "ab_a_netchimancap",
      "nod_hat_netch_rv_netchimans cap", "adnetch pauldron left", "adnetch boots", "adnetch gauntlet left",
      "adnetch gauntlet right", "adnetch cuirass", "adnetch greaves", "adnetch pauldron right",
      "adnetch cuirass_ii", "adnetch cuirass_iii", "adnetch coat", "adnetch glove left",
      "adnetch glove right", "adnetch pauldron left ii", "adnetch pauldron right ii", "adnetch beast boots",
      "adnetch shield", "nod_r0_netch_leather_pauldron_l", "nod_r0_netch_leather_pauldron_r", "nod_adnetch pauldron left",
      "nod_adnetch boots", "nod_adnetch gauntlet left", "nod_adnetch gauntlet right", "nod_adnetch cuirass",
      "nod_adnetch greaves", "nod_adnetch pauldron right", "nod_adnetch cuirass_ii", "nod_adnetch cuirass_iii",
      "nod_adnetch coat", "nod_adnetch glove left", "nod_adnetch glove right", "nod_adnetch pauldron left ii",
      "nod_adnetch pauldron right ii", "nod_adnetch beast boots", "nod_adnetch shield", "aatl_a_buck_netch_h",
      "aatl_a_buck_netch_h_en1",
    },
  },
  {
    name = "Newtscale",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="swiftswim", mag=20},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="swiftswim", mag=30},
        {effect="waterbreathing", mag=1},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="swiftswim", mag=40},
        {effect="waterbreathing", mag=1},
        {effect="resistcommondisease", mag=20},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "newtscale_cuirass", "t_imp_newtscale_boots_01", "t_imp_newtscale_cuirass_01", "t_imp_newtscale_gauntletl_01",
      "t_imp_newtscale_gauntletr_01", "t_imp_newtscale_greaves_01", "t_imp_newtscale_helm_01", "t_imp_newtscale_pauldronl_01",
      "t_imp_newtscale_pauldronr_01",
    },
  },
  {
    name = "Nibenese",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyskill", skill="mercantile", mag=5},
      },
      mid = {
        {effect="restoremagicka", mag=1, dur=1},
        {effect="fortifyskill", skill="mercantile", mag=8},
        {effect="resistmagicka", mag=8},
      },
      max = {
        {effect="restoremagicka", mag=2, dur=1},
        {effect="fortifyskill", skill="mercantile", mag=12},
        {effect="resistmagicka", mag=12},
        {effect="fortifyattribute", attribute="personality", mag=8},
      },
    },
    items = {
      "t_imp_nibbronze_boots_01", "t_imp_nibbronze_bracerl_01", "t_imp_nibbronze_bracerr_01", "t_imp_nibbronze_cuirass_01",
      "t_imp_nibbronze_greaves_01", "t_imp_nibbronze_helm_01", "t_imp_nibbronze_pauldronl_01", "t_imp_nibbronze_pauldronr_01",
    },
  },
  {
    name = "Nordic",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="resistshock", mag=10},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="resistshock", mag=15},
        {effect="fortifyattribute", attribute="strength", mag=5},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="resistshock", mag=20},
        {effect="fortifyattribute", attribute="strength", mag=8},
        {effect="fortifyhealth", mag=18},
      },
    },
    items = {
      "fur_helm", "fur_cuirass", "fur_pauldron_left", "fur_pauldron_right",
      "fur_bracer_left", "fur_bracer_right", "fur_gauntlet_left", "fur_gauntlet_right",
      "fur_greaves", "fur_boots", "nordic_leather_shield", "fur_bearskin_cuirass",
      "nordic_ringmail_cuirass", "nordic_iron_helm", "right horny fist gauntlet", "nordic_iron_cuirass",
      "trollbone_helm", "trollbone_cuirass", "trollbone_shield", "gauntlet_of_glory_left",
      "gauntlet_of_glory_right", "icecap_unique", "bloodworm_helm_unique", "bm bear shield",
      "bm bear right pauldron", "bm bear left pauldron", "bm bear right gauntlet", "bm bear left gauntlet",
      "bm bear helmet", "bm bear greaves", "bm bear cuirass", "bm bear boots",
      "bm wolf shield", "bm wolf right pauldron", "bm wolf left pauldron", "bm wolf right gauntlet",
      "bm wolf left gauntlet", "bm wolf helmet", "bm wolf greaves", "bm wolf cuirass",
      "bm wolf boots", "bm_ice minion_shield1", "bm_nordicmail_boots", "bm_nordicmail_cuirass",
      "bm_nordicmail_greaves", "bm_nordicmail_helmet", "bm_nordicmail_gauntletl", "bm_nordicmail_gauntletr",
      "bm_nordicmail_pauldronl", "bm_nordicmail_pauldronr", "bm_nordicmail_shield", "sp_nor_uni_swimhelm",
      "sp_nor_uni_swimhelm_02", "bm_wolf_cuirass_snow", "bm_wolf_greaves_snow", "bm_wolf_helmet_snow",
      "bm_wolf_left_gauntlet_snow", "bm_wolf_left_pauldron_snow", "bm_wolf_right_gauntlet_snow", "bm_wolf_right_pauldron_snow",
      "bm_bear_boots_snow", "bm_bear_cuirass_snow", "bm_bear_greaves_snow", "bm_bear_helmet_snow",
      "bm_bear_left_gauntlet_snow", "bm_bear_left_pauldron_snow", "bm_bear_right_gauntlet_snow", "bm_bear_right_pauldron_snow",
      "bm_wolf_boots_snow", "bm bear helmet eddard", "bm_ice_boots", "bm_ice_cuirass",
      "bm_ice_gauntletl", "bm_ice_gauntletr", "bm_ice_greaves", "bm_ice_helmet",
      "bm_ice_pauldronl", "bm_ice_pauldronr", "bm bear helmet_ber", "bm_ice_shield",
      "bm wolf helmet_heartfang", "t_nor_bearskin_boots_01", "t_nor_bearskin_bracerl_01", "t_nor_bearskin_bracerl_claw",
      "t_nor_bearskin_bracerr_01", "t_nor_bearskin_bracerr_claw", "t_nor_bearskin_greaves_01", "t_nor_bearskin_helm_01",
      "t_nor_bearskin_helm_hiber", "t_nor_bearskin_pauldronl_01", "t_nor_bearskin_pauldronr_01", "t_nor_companion_boots_01",
      "t_nor_companion_cuirass_01", "t_nor_companion_gauntletl_01", "t_nor_companion_gauntletr_01", "t_nor_companion_greaves_01",
      "t_nor_companion_helm_01", "t_nor_companion_pauldronl_01", "t_nor_companion_pauldronr_01", "t_nor_guard_boots_01",
      "t_nor_guard_cuirass_01", "t_nor_guard_gauntletl_01", "t_nor_guard_gauntletr_01", "t_nor_guard_greaves_01",
      "t_nor_guard_helm_01", "t_nor_guard_pauldronl_01", "t_nor_guard_pauldronr_01", "t_nor_iron_boots_01",
      "t_nor_iron_boots_leap", "t_nor_iron_cuirass_wintery", "t_nor_iron_gauntletl_01", "t_nor_iron_gauntletr_01",
      "t_nor_iron_greaves_01", "t_nor_iron_pauldronl_01", "t_nor_iron_pauldronr_01", "t_nor_ironwood_shield_01",
      "t_nor_ironwood_shield_02", "t_nor_ringmail_boots_01", "t_nor_ringmail_boots_02", "t_nor_ringmail_bracerl_02",
      "t_nor_ringmail_bracerr_02", "t_nor_ringmail_cuirass_01", "t_nor_ringmail_greaves_01", "t_nor_ringmail_greaves_02",
      "t_nor_ringmail_helmet_01", "t_nor_ringmail_helmet_02", "t_nor_ringmail_pauldronl_02", "t_nor_ringmail_pauldronr_02",
      "t_nor_sabrecat_helm_01", "t_nor_sabrecat_helm_02", "t_nor_sabrecat_helm_sight", "t_nor_steel_boots_01",
      "t_nor_steel_cuirass_01", "t_nor_steel_cuirass_steelhearth", "t_nor_steel_gauntletl_01", "t_nor_steel_gauntletr_01",
      "t_nor_steel_greaves_01", "t_nor_steel_helm_01", "t_nor_steel_pauldronl_01", "t_nor_steel_pauldronr_01",
      "t_nor_trollbone_boots_01", "t_nor_trollbone_bracerl_01", "t_nor_trollbone_bracerr_01", "t_nor_trollbone_greaves_01",
      "t_nor_trollbone_greaves_vigor", "t_nor_trollbone_pauldronl_01", "t_nor_trollbone_pauldronr_01", "t_nor_uni_kvisahjaelmur",
      "t_nor_uni_predatorsgrace", "t_nor_uni_snowdrakepelt", "t_nor_uni_targeblooded", "t_nor_wood_shield_01",
      "t_nor_wood_shield_02", "t_nor_wood_shield_03", "t_nor_wood_shieldbuckler_01", "t_nor_wood_shieldbuckler_02",
      "t_nor_wood_shieldbuckler_03", "t_nor_wood_shieldbuckler_04", "t_nor_wood_shieldbuckler_05", "t_nor_wood_shieldbuckler_06",
      "t_nor_wood_shieldbuckler_07", "t_nor_wood_shieldbuckler_08",
    },
  },
  {
    name = "Oloman",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattribute", attribute="endurance", mag=8},
      },
    },
    items = {
      "t_imp_colsteel_boots_03", "t_imp_colsteel_bracerl_03", "t_imp_colsteel_bracerr_03", "t_imp_colsteel_cuirass_03",
      "t_imp_colsteel_greaves_03", "t_imp_colsteel_helm_03", "t_imp_colsteel_pauldronl_03", "t_imp_colsteel_pauldronr_03",
    },
  },
  {
    name = "Orcish",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="fortifyattribute", attribute="strength", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="fortifyattribute", attribute="strength", mag=5},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattribute", attribute="strength", mag=8},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "orcish_helm", "orcish_cuirass", "orcish_pauldron_left", "orcish_pauldron_right",
      "orcish_bracer_left", "orcish_bracer_right", "orcish_greaves", "orcish_boots",
      "orcish_towershield", "atl_a_buck_orc", "atl_a_buck_orc_h", "atl_a_buck_orc_kazul",
      "atl_a_buck_orc_h_blood", "t_orc_regular_helmopen_01", "tr_m4_orcish_boots_uni", "tr_m4_orcish_helmofbattle_uni",
      "tr_m4_tt_orcnocuirass", "tr_m4_tt_orcnogreaves", "tr_m4_tt_orcnohelm", "ab_a_orchelmopen",
      "_rv_orcishmask_1", "_rv_orcishmask_2",
    },
  },
  {
    name = "Orsimer",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="strength", mag=3},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="fortifyattribute", attribute="strength", mag=5},
        {effect="fortifyhealth", mag=12},
        {effect="resistmagicka", mag=8},
      },
      max = {
        {effect="fortifyattribute", attribute="strength", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="resistmagicka", mag=12},
        {effect="fortifyattack", mag=8},
      },
    },
    items = {
      "orcish_helm", "orcish_cuirass", "orcish_pauldron_left", "orcish_pauldron_right",
      "orcish_bracer_left", "orcish_bracer_right", "orcish_greaves", "orcish_boots",
      "orcish_towershield", "sky_ire_kw_orcchestiron", "atl_a_buck_orc", "atl_a_buck_orc_h",
      "atl_a_buck_orc_h_blood", "atl_a_buck_orc_kazul", "t_orc_leather_boots_01", "t_orc_leather_cuirass_01",
      "t_orc_leather_gauntletl_01", "t_orc_leather_gauntletr_01", "t_orc_leather_greaves_01", "t_orc_leather_helm_01",
      "t_orc_leather_pauldronl_01", "t_orc_leather_pauldronr_01", "t_orc_regular_helmopen_01", "tr_m4_orcish_boots_uni",
      "tr_m4_orcish_helmofbattle_uni", "tr_m4_tt_orcnocuirass", "tr_m4_tt_orcnogreaves", "tr_m4_tt_orcnohelm",
      "ab_a_orchelmopen",
      -- vanilla Orsimer-craft gear (union of: Orcish) -- kept in step with
      -- the runtime union in MWSE/mods/Static/SetBonusTR/main.lua
      "_rv_orcishmask_1", "_rv_orcishmask_2",
    },
  },
  {
    name = "Padded",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="resistfrost", mag=15},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="resistfrost", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Plate",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyhealth", mag=12},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Quey Chitin",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="waterbreathing", mag=1},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="waterbreathing", mag=1},
        {effect="resistpoison", mag=15},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="waterbreathing", mag=1},
        {effect="resistpoison", mag=20},
        {effect="resistnormalweapons", mag=8},
        {effect="swiftswim", mag=40},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_qyk_chitin_boots_01", "t_qyk_chitin_cuirass_01", "t_qyk_chitin_gauntletl_01", "t_qyk_chitin_gauntletr_01",
      "t_qyk_chitin_greaves_01", "t_qyk_chitin_helmet_01", "t_qyk_chitin_pauldronl_01", "t_qyk_chitin_pauldronr_01",
    },
  },
  {
    name = "Reach",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="fortifyattribute", attribute="endurance", mag=3},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="fortifyattribute", attribute="endurance", mag=5},
        {effect="fortifyattack", mag=5},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="spellabsorption", mag=8},
      },
    },
    items = {
      "t_rea_leather_hat_01", "t_rea_leather_hat_witchery", "t_rea_uni_feathercrown", "t_rea_wormmouth_helm_01",
      "t_rea_wormmouth_helm_poison", "t_rea_wormmouth_cuirass_01", "t_rea_wormmouth_pauldronl_01", "t_rea_wormmouth_pauldronr_01",
      "t_rea_wormmouth_bracerl_01", "t_rea_wormmouth_bracerr_01", "t_rea_wormmouth_greaves_01", "t_rea_wormmouth_boots_01",
    },
  },
  {
    name = "Reach Royal Guard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistfrost", mag=10},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistfrost", mag=15},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistfrost", mag=20},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_nor_rearoy_boots_01", "t_nor_rearoy_bracerl_01", "t_nor_rearoy_bracerr_01", "t_nor_rearoy_cuirass_01",
      "t_nor_rearoy_helm_01", "t_nor_rearoy_pauldronl_01", "t_nor_rearoy_pauldronr_01",
    },
  },
  {
    name = "Red Dome Templar",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistmagicka", mag=5},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistmagicka", mag=8},
        {effect="turnundead", mag=15},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistmagicka", mag=12},
        {effect="turnundead", mag=20},
        {effect="fortifyskill", skill="restoration", mag=12},
      },
    },
    items = {
      "t_imp_rddmtmp_boots_01", "t_imp_rddmtmp_bracerl_01", "t_imp_rddmtmp_bracerr_01", "t_imp_rddmtmp_cuirass_01",
      "t_imp_rddmtmp_greaves_01", "t_imp_rddmtmp_helmet_01", "t_imp_rddmtmp_pauldronl_01", "t_imp_rddmtmp_pauldronr_01",
      "t_imp_rddmtmp_shield_01",
    },
  },
  {
    name = "Redguard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="fortifyattribute", attribute="endurance", mag=3},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="fortifyattribute", attribute="endurance", mag=5},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_rga_alikr_buckler", "t_rga_crownguard1_boots_01", "t_rga_crownguard1_cuirass_01", "t_rga_crownguard1_greaves_01",
      "t_rga_crownguard1_helm_01", "t_rga_crownguard1_pauldronl_01", "t_rga_crownguard1_pauldronr_01", "t_rga_ep_headdress_01",
      "t_rga_lamellar_bracer_l_01", "t_rga_lamellar_bracer_r_01", "t_rga_lamellar_cuirass", "t_rga_lamellar_cuirass_b",
      "t_rga_lamellar_cuirass_g", "t_rga_lamellar_cuirass_y", "t_rga_lamellar_helm", "t_rga_lamellar_helm_b",
      "t_rga_lamellar_helm_g", "t_rga_lamellar_helm_y", "t_rga_wicker_shield",
    },
  },
  {
    name = "Redguard Iron Lamellar",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyhealth", mag=12},
        {effect="fortifyattack", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattack", mag=8},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "t_rga_ironlamellar_boots_01", "t_rga_ironlamellar_bracer_l_01", "t_rga_ironlamellar_bracer_r_01", "t_rga_ironlamellar_cuirass_01",
      "t_rga_ironlamellar_greaves_01", "t_rga_ironlamellar_helm_01", "t_rga_ironlamellar_pauld_l_01", "t_rga_ironlamellar_pauld_r_01",
    },
  },
  {
    name = "Reman",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="fortifyattack", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="fortifyattack", mag=5},
        {effect="fortifyattribute", attribute="personality", mag=5},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattack", mag=8},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="resistnormalweapons", mag=8},
      },
    },
    items = {
      "t_imp_reman_boots_01", "t_imp_reman_bracerl_01", "t_imp_reman_bracerr_01", "t_imp_reman_cuirass_01",
      "t_imp_reman_greaves_01", "t_imp_reman_helm_01", "t_imp_reman_pauldronl_01", "t_imp_reman_pauldronr_01",
      "t_imp_reman_shield_01",
    },
  },
  {
    name = "Resin Molded",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="resistblightdisease", mag=15},
        {effect="fortifyfatigue", mag=20},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistblightdisease", mag=20},
        {effect="fortifyfatigue", mag=28},
        {effect="resistpoison", mag=20},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {

    },
  },
  {
    name = "Rihad Guard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="fortifyfatigue", mag=20},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="fortifyfatigue", mag=28},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattribute", attribute="endurance", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_rga_guardrihad_boots_01", "t_rga_guardrihad_bracer_l_01", "t_rga_guardrihad_bracer_r_01", "t_rga_guardrihad_cuirass_01",
      "t_rga_guardrihad_helm_01", "t_rga_guardrihad_pauldron_l_01", "t_rga_guardrihad_pauldron_r_01",
    },
  },
  {
    name = "Ring Mail",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="fortifyattribute", attribute="agility", mag=3},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "nordic_ringmail_cuirass", "t_nor_ringmail_boots_01", "t_nor_ringmail_boots_02", "t_nor_ringmail_bracerl_02",
      "t_nor_ringmail_bracerr_02", "t_nor_ringmail_cuirass_01", "t_nor_ringmail_greaves_01", "t_nor_ringmail_greaves_02",
      "t_nor_ringmail_helmet_01", "t_nor_ringmail_helmet_02", "t_nor_ringmail_pauldronl_02", "t_nor_ringmail_pauldronr_02",
    },
  },
  {
    name = "Riverwatch",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="waterwalking", mag=1},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="waterwalking", mag=1},
        {effect="resistnormalweapons", mag=5},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="waterwalking", mag=1},
        {effect="resistnormalweapons", mag=8},
        {effect="resistblightdisease", mag=20},
      },
    },
    items = {
      "t_de_riverwatch_boots_01", "t_de_riverwatch_boots_waterwalk", "t_de_riverwatch_cuirass_01", "t_de_riverwatch_gauntl_01",
      "t_de_riverwatch_gauntr_01", "t_de_riverwatch_greaves_01", "t_de_riverwatch_helm_01", "t_de_riverwatch_pauldronl_01",
      "t_de_riverwatch_pauldronr_01",
    },
  },
  {
    name = "Rourken",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistshock", mag=10},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistshock", mag=15},
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
      },
      max = {
        {effect="resistshock", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="reflect", mag=8},
      },
    },
    items = {
      "t_dwe_rourken_boots_01", "t_dwe_rourken_bracer_l_01", "t_dwe_rourken_bracer_r_01", "t_dwe_rourken_cuirass_01",
      "t_dwe_rourken_greaves_01", "t_dwe_rourken_helm_01", "t_dwe_rourken_pauld_l_01", "t_dwe_rourken_pauld_r_01",
    },
  },
  {
    name = "Royal Guard",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
        {effect="resistmagicka", mag=8},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="resistmagicka", mag=12},
        {effect="fortifyattack", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "helsethguard_helmet", "helsethguard_cuirass ", "helsethguard_pauldron_left", "helsethguard_pauldron_right",
      "helsethguard_greaves", "helsethguard_boots", "helsethguard_gauntlet_left", "helsethguard_gauntlet_right",
    },
  },
  {
    name = "Sacred Lands",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="fortifyhealth", mag=12},
        {effect="fortifyskill", skill="restoration", mag=8},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="fortifyhealth", mag=18},
        {effect="fortifyskill", skill="restoration", mag=12},
        {effect="turnundead", mag=20},
      },
    },
    items = {
      "t_de_bonemoldsacred_boots_01", "t_de_bonemoldsacred_cuirass_01", "t_de_bonemoldsacred_gauntl_01", "t_de_bonemoldsacred_gauntr_01",
      "t_de_bonemoldsacred_helm_01", "t_de_bonemoldsacred_pauldl_01", "t_de_bonemoldsacred_pauldr_01",
    },
  },
  {
    name = "Saliache",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistblightdisease", mag=10},
        {effect="fortifyskill", skill="athletics", mag=5},
      },
      mid = {
        {effect="resistblightdisease", mag=15},
        {effect="fortifyskill", skill="athletics", mag=8},
        {effect="resistpoison", mag=15},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistblightdisease", mag=20},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="resistpoison", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_ayl_saliache_boots_01", "t_ayl_saliache_bracerl_01", "t_ayl_saliache_bracerr_01", "t_ayl_saliache_cuirass_01",
      "t_ayl_saliache_greaves_01", "t_ayl_saliache_helm_01", "t_ayl_saliache_pauldronl_01", "t_ayl_saliache_pauldronr_01",
      "t_ayl_saliache_shield_01",
    },
  },
  {
    name = "Scale Mail",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "newtscale_cuirass", "dragonscale_helm", "dragonscale_cuirass", "dragonscale_towershield",
    },
  },
  {
    name = "Scrap",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyattribute", attribute="luck", mag=3},
      },
      mid = {
        {effect="fortifyattribute", attribute="luck", mag=5},
        {effect="fortifyfatigue", mag=20},
      },
      max = {
        {effect="fortifyattribute", attribute="luck", mag=8},
        {effect="fortifyfatigue", mag=28},
        {effect="resistnormalweapons", mag=8},
      },
    },
    items = {
      "t_dwe_scrap_boots", "t_dwe_scrap_bracer_l", "t_dwe_scrap_bracer_r", "t_dwe_scrap_cuirass",
      "t_dwe_scrap_greaves", "t_dwe_scrap_helmet", "t_dwe_scrap_pauldron_l", "t_dwe_scrap_pauldron_r",
      "nod_rv_dwemscr_boots", "nod_rv_dwemscr_bracer_left", "nod_rv_dwemscr_bracer_right", "nod_rv_dwemscr_cuirass",
      "nod_rv_dwemscr_helmet", "nod_rv_dwemscr_greaves", "nod_rv_dwemscr_pauldron_left", "nod_rv_dwemscr_pauldron_right",
    },
  },
  {
    name = "Shellmold",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="resistshock", mag=10},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="resistshock", mag=15},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="resistshock", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_qc_shellmold_boots_01", "t_qc_shellmold_bracerl_01", "t_qc_shellmold_bracerr_01", "t_qc_shellmold_cuirass_01",
      "t_qc_shellmold_greaves_01", "t_qc_shellmold_helm_01", "t_qc_shellmold_pauldl_01", "t_qc_shellmold_pauldr_01",
      "t_qyc_shellmold_boots_01", "t_qyc_shellmold_bracerl_01", "t_qyc_shellmold_bracerr_01", "t_qyc_shellmold_cuirass_01",
      "t_qyc_shellmold_greaves_01", "t_qyc_shellmold_helm_01", "t_qyc_shellmold_pauldl_01", "t_qyc_shellmold_pauldr_01",
    },
  },
  {
    name = "Shinathi Chitin",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="resistblightdisease", mag=10},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="resistblightdisease", mag=15},
        {effect="resistparalysis", mag=15},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="resistblightdisease", mag=20},
        {effect="resistparalysis", mag=20},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_shinchitin_boots", "t_de_shinchitin_bracerl", "t_de_shinchitin_bracerr", "t_de_shinchitin_cuirass",
      "t_de_shinchitin_greaves", "t_de_shinchitin_helm", "t_de_shinchitin_pauldl", "t_de_shinchitin_pauldr",
    },
  },
  {
    name = "Shipal-Arai",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistblightdisease", mag=10},
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="resistblightdisease", mag=15},
        {effect="resistpoison", mag=15},
        {effect="fortifyskill", skill="spear", mag=8},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistblightdisease", mag=20},
        {effect="resistpoison", mag=20},
        {effect="fortifyskill", skill="spear", mag=12},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_canyonwatch_boots_01", "t_de_canyonwatch_bracerl_01", "t_de_canyonwatch_bracerr_01", "t_de_canyonwatch_cuirass_01",
      "t_de_canyonwatch_greaves_01", "t_de_canyonwatch_helm_01", "t_de_canyonwatch_pauldronl_01", "t_de_canyonwatch_pauldronr_01",
    },
  },
  {
    name = "Silver",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="turnundead", mag=15},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="turnundead", mag=20},
        {effect="spellabsorption", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "silver_helm", "silver_cuirass", "silver_dukesguard_cuirass", "silver_helm_uvenim",
      "tr_m1_silver_duchguard_cuirass", "t_imp_silver_boots_01", "t_imp_silver_bracerl_01", "t_imp_silver_bracerr_01",
      "t_imp_silver_cap_01", "t_imp_silver_cap_02", "t_imp_silver_cuirassfw_01", "t_imp_silver_cuirassred_01",
      "t_imp_silver_greaves_01", "t_imp_silver_helm_mask", "t_imp_silver_pauldronl_01", "t_imp_silver_pauldronr_01",
    },
  },
  {
    name = "Skingrad",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="resistcommondisease", mag=10},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="resistcommondisease", mag=15},
        {effect="fortifyattribute", attribute="personality", mag=5},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="resistcommondisease", mag=20},
        {effect="fortifyattribute", attribute="personality", mag=8},
        {effect="resistmagicka", mag=12},
      },
    },
    items = {
      "t_imp_colsteel_boots_04", "t_imp_colsteel_bracerl_04", "t_imp_colsteel_bracerr_04", "t_imp_colsteel_cuirass_04",
      "t_imp_colsteel_greaves_04", "t_imp_colsteel_helm_04", "t_imp_colsteel_pauldronl_04", "t_imp_colsteel_pauldronr_04",
    },
  },
  {
    name = "Splint",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistnormalweapons", mag=3},
        {effect="fortifyhealth", mag=8},
      },
      mid = {
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyhealth", mag=12},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "",
    },
  },
  {
    name = "Stalhrim",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="restoremagicka", mag=1, dur=1},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="restoremagicka", mag=2, dur=1},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "bm_ice_boots", "bm_ice_cuirass ", "bm_ice_greaves", "bm_ice_helmet",
      "bm_ice_gauntletl", "bm_ice_gauntletr", "bm_ice_pauldronl boots", "bm_ice_pauldronr",
      "bm_ice_shield",
    },
  },
  {
    name = "Steel",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="fortifyattack", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="fortifyattack", mag=5},
        {effect="weaknesstoshock", mag=10},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="fortifyattack", mag=8},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstoshock", mag=20},
      },
    },
    items = {
      "steel_helm", "steel_cuirass", "steel_pauldron_left", "steel_pauldron_right",
      "steel_gauntlet_left", "steel_gauntlet_right", "steel_greaves", "steel_boots",
      "steel_shield", "steel_towershield", "blessed_shield", "blessed_tower_shield",
      "blood_feast_shield", "steel_boots_ancient", "steel_cuirass_ancient", "steel_gauntlet_left_ancient",
      "steel_gauntlet_right_ancient", "steel_greaves_ancient", "steel_helm_ancient", "steel_pauldron_left_ancient",
      "steel_pauldron_right_ancient", "steel_towershield_ancient", "atl_a_buck_steel", "atl_a_buck_steel_h",
      "atl_a_buck_steel_divines", "atl_a_buck_steel_h_vesicle", "t_com_steel_boots_consuming", "t_com_steel_boots_creeping",
      "t_com_steel_boots_glacial", "t_com_steel_boots_perfection", "t_com_steel_cuirass_01", "t_com_steel_cuirass_02",
      "t_com_steel_cuirass_03", "t_com_steel_cuirass_04", "t_com_steel_cuirass_duskdawn", "t_com_steel_cuirass_finalvirtue",
      "t_com_steel_cuirass_outermost", "t_com_steel_cuirass_scalypelt", "t_com_steel_cuirass_steelhearth", "t_com_steel_gauntletl_rainfire",
      "t_com_steel_gauntletl_scathing", "t_com_steel_gauntletl_summer", "t_com_steel_gauntletl_wonder", "t_com_steel_gauntletr_rainfire",
      "t_com_steel_gauntletr_scathing", "t_com_steel_gauntletr_summer", "t_com_steel_gauntletr_wonder", "t_com_steel_greaves_bitingpains",
      "t_com_steel_greaves_kings", "t_com_steel_greaves_stamptoad", "t_com_steel_greaves_unrequited", "t_com_steel_helm_01",
      "t_com_steel_helm_despair", "t_com_steel_helm_open_01", "t_com_steel_helm_open_02", "t_com_steel_helm_preciptious",
      "t_com_steel_helm_tonguewyrm", "t_com_steel_helm_windingroad", "t_com_steel_pauldronl_01", "t_com_steel_pauldronl_02",
      "t_com_steel_pauldronl_03", "t_com_steel_pauldronl_mishand", "t_com_steel_pauldronl_monkeyapp", "t_com_steel_pauldronl_sacred",
      "t_com_steel_pauldronl_winterwin", "t_com_steel_pauldronr_01", "t_com_steel_pauldronr_02", "t_com_steel_pauldronr_03",
      "t_com_steel_pauldronr_mishand", "t_com_steel_pauldronr_monkeyapp", "t_com_steel_pauldronr_sacred", "t_com_steel_pauldronr_winterwin",
      "t_com_steelspike_pauldronl_01", "t_com_steelspike_pauldronr_01", "t_imp_colsteel1_boots_01", "t_imp_colsteel1_boots_02",
      "t_imp_colsteel1_boots_03", "t_imp_colsteel1_boots_04", "t_imp_colsteel1_bracerl_01", "t_imp_colsteel1_bracerl_02",
      "t_imp_colsteel1_bracerl_03", "t_imp_colsteel1_bracerl_04", "t_imp_colsteel1_bracerr_01", "t_imp_colsteel1_bracerr_02",
      "t_imp_colsteel1_bracerr_03", "t_imp_colsteel1_bracerr_04", "t_imp_colsteel1_cuirass_01", "t_imp_colsteel1_cuirass_02",
      "t_imp_colsteel1_cuirass_03", "t_imp_colsteel1_cuirass_04", "t_imp_colsteel1_greaves_01", "t_imp_colsteel1_greaves_02",
      "t_imp_colsteel1_greaves_03", "t_imp_colsteel1_greaves_04", "t_imp_colsteel1_helm_01", "t_imp_colsteel1_helm_02",
      "t_imp_colsteel1_helm_03", "t_imp_colsteel1_helm_04", "t_imp_colsteel1_pauldronl_01", "t_imp_colsteel1_pauldronl_02",
      "t_imp_colsteel1_pauldronl_03", "t_imp_colsteel1_pauldronl_04", "t_imp_colsteel1_pauldronr_01", "t_imp_colsteel1_pauldronr_02",
      "t_imp_colsteel1_pauldronr_03", "t_imp_colsteel1_pauldronr_04", "t_imp_colsteel_boots_01", "t_imp_colsteel_boots_02",
      "t_imp_colsteel_boots_03", "t_imp_colsteel_boots_04", "t_imp_colsteel_bracerl_03", "t_imp_colsteel_bracerl_04",
      "t_imp_colsteel_bracerr_03", "t_imp_colsteel_bracerr_04", "t_imp_colsteel_cuirass_01", "t_imp_colsteel_cuirass_02",
      "t_imp_colsteel_cuirass_03", "t_imp_colsteel_cuirass_04", "t_imp_colsteel_gauntletl_01", "t_imp_colsteel_gauntletl_02",
      "t_imp_colsteel_gauntletr_01", "t_imp_colsteel_gauntletr_02", "t_imp_colsteel_greaves_01", "t_imp_colsteel_greaves_02",
      "t_imp_colsteel_greaves_03", "t_imp_colsteel_greaves_04", "t_imp_colsteel_helm_01", "t_imp_colsteel_helm_02",
      "t_imp_colsteel_helm_03", "t_imp_colsteel_helm_04", "t_imp_colsteel_helm_05", "t_imp_colsteel_helm_06",
      "t_imp_colsteel_pauldronl_01", "t_imp_colsteel_pauldronl_02", "t_imp_colsteel_pauldronl_03", "t_imp_colsteel_pauldronl_04",
      "t_imp_colsteel_pauldronr_01", "t_imp_colsteel_pauldronr_02", "t_imp_colsteel_pauldronr_03", "t_imp_colsteel_pauldronr_04",
      "t_nor_steel_boots_01", "t_nor_steel_cuirass_01", "t_nor_steel_cuirass_steelhearth", "t_nor_steel_gauntletl_01",
      "t_nor_steel_gauntletr_01", "t_nor_steel_greaves_01", "t_nor_steel_helm_01", "t_nor_steel_pauldronl_01",
      "t_nor_steel_pauldronr_01", "tr_i2-235_steel_towershield", "tr_m3_steel_fireheart_i3-647", "t_rga_steel_boots_01",
      "t_rga_steel_cuirass_01", "t_rga_steel_gauntletl_01", "t_rga_steel_gauntletr_01", "t_rga_steel_greaves_01",
      "t_rga_steel_helm_01", "t_rga_steel_pauldronl_01", "t_rga_steel_pauldronr_01", "ab_a_steelboots",
      "ab_a_steelcuirass", "ab_a_steelgntlleft", "ab_a_steelgntlright", "ab_a_steelgreaves",
      "ab_a_steelhelm", "ab_a_steelhelmopen", "ab_a_steelpldrleft", "ab_a_steelpldrright",
    },
  },
  {
    name = "Studded",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyfatigue", mag=12},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="fortifyfatigue", mag=20},
        {effect="resistnormalweapons", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="fortifyfatigue", mag=28},
        {effect="resistnormalweapons", mag=8},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "imperial_studded_cuirass", "t_imp_studdedleather_helm_01", "t_imp_studdedleather_pauldrl_01", "t_imp_studdedleather_pauldrr_01t",
      "t_imp_studdedleather_greaves_01", "t_imp_studdedleather_boots_01",
    },
  },
  {
    name = "Sutch Mail",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="resistnormalweapons", mag=3},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="resistnormalweapons", mag=5},
        {effect="fortifyattack", mag=5},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="resistnormalweapons", mag=8},
        {effect="fortifyattack", mag=8},
        {effect="fortifyfatigue", mag=28},
      },
    },
    items = {
      "t_imp_guardsutch_cuirass_01", "t_imp_guardsutch_gauntletl_01", "t_imp_guardsutch_gauntletr_01", "t_imp_guardsutch_helm_01",
      "t_imp_guardsutch_pauldrl_01", "t_imp_guardsutch_pauldrr_01", "t_imp_guardsutch_shieldtow_01",
    },
  },
  {
    name = "Templar",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyhealth", mag=8},
        {effect="turnundead", mag=10},
      },
      mid = {
        {effect="fortifyhealth", mag=12},
        {effect="turnundead", mag=15},
        {effect="resistmagicka", mag=8},
      },
      max = {
        {effect="fortifyhealth", mag=18},
        {effect="turnundead", mag=20},
        {effect="resistmagicka", mag=12},
        {effect="fortifyattack", mag=8},
      },
    },
    items = {
      "templar_helmet_armor", "templar_cuirass", "templar_pauldron_left", "templar_pauldron_right",
      "templar bracer left", "templar bracer right", "templar_greaves", "templar boots",
      "_wyrm_templar_pld_l", "_wyrm_templar_pld_r", "t_imp_templar_shieldtower_01",
    },
  },
  {
    name = "Thieves Guild",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="fortifyskill", skill="sneak", mag=5},
        {effect="fortifyskill", skill="security", mag=5},
      },
      mid = {
        {effect="fortifyskill", skill="sneak", mag=8},
        {effect="fortifyskill", skill="security", mag=8},
        {effect="chameleon", mag=7},
      },
      max = {
        {effect="fortifyskill", skill="sneak", mag=12},
        {effect="fortifyskill", skill="security", mag=12},
        {effect="chameleon", mag=10},
        {effect="fortifyattribute", attribute="agility", mag=8},
      },
    },
    items = {

    },
  },
  {
    name = "Thirr",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfire", mag=10},
        {effect="waterbreathing", mag=1},
      },
      mid = {
        {effect="resistfire", mag=15},
        {effect="waterbreathing", mag=1},
        {effect="fortifyhealth", mag=12},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistfire", mag=20},
        {effect="waterbreathing", mag=1},
        {effect="fortifyhealth", mag=18},
        {effect="swiftswim", mag=40},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_de_thirrbonemold_boots_01", "t_de_thirrbonemold_bracer_01_l", "t_de_thirrbonemold_bracer_01_r", "t_de_thirrbonemold_cuirass_01",
      "t_de_thirrbonemold_greaves_01", "t_de_thirrbonemold_helm_01", "t_de_thirrbonemold_pauldrn_01_l", "t_de_thirrbonemold_pauldrn_01_r",
    },
  },
  {
    name = "Toadscale",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="resistfrost", mag=10},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="resistfrost", mag=15},
        {effect="resistcommondisease", mag=15},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="resistfrost", mag=20},
        {effect="resistcommondisease", mag=20},
        {effect="fortifyfatigue", mag=28},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_nor_toadscale_boots_01", "t_nor_toadscale_boots_02", "t_nor_toadscale_cuirass_01", "t_nor_toadscale_cuirass_02",
      "t_nor_toadscale_gauntletl_01", "t_nor_toadscale_gauntletl_02", "t_nor_toadscale_gauntletr_01", "t_nor_toadscale_gauntletr_02",
      "t_nor_toadscale_greaves_01", "t_nor_toadscale_greaves_02", "t_nor_toadscale_helm_01", "t_nor_toadscale_helm_02",
      "t_nor_toadscale_helm_03", "t_nor_toadscale_helm_04", "t_nor_toadscale_pauldl_01", "t_nor_toadscale_pauldl_02",
      "t_nor_toadscale_pauldr_01", "t_nor_toadscale_pauldr_02", "t_nor_toadscale_shield_01", "t_nor_toadscale_shield_02",
    },
  },
  {
    name = "Tribunal Temple",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistmagicka", mag=5},
        {effect="fortifyskill", skill="restoration", mag=5},
      },
      mid = {
        {effect="resistmagicka", mag=8},
        {effect="fortifyskill", skill="restoration", mag=8},
        {effect="restorehealth", mag=1, dur=1},
      },
      max = {
        {effect="resistmagicka", mag=12},
        {effect="fortifyskill", skill="restoration", mag=12},
        {effect="restorehealth", mag=1, dur=1},
        {effect="turnundead", mag=20},
      },
    },
    items = {
      "indoril helmet", "indoril cuirass", "indoril pauldron left", "indoril pauldron right",
      "indoril left gauntlet", "indoril right gauntlet", "indoril boots", "indoril shield",
      "spirit of indoril", "succour of indoril", "indoril_mh_guard_helmet", "indoril_mh_guard_cuirass ",
      "indoril_mh_guard_pauldron_l", "indoril_mh_guard_pauldron_r", "indoril_mh_guard_greaves", "indoril_mh_guard_boots",
      "indoril_mh_guard_gauntlet_l", "indoril_mh_guard_gauntlet_r", "indoril_mh_guard_shield",
    },
  },
  {
    name = "Trollbone",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="restorehealth", mag=1, dur=1},
      },
      mid = {
        {effect="restorehealth", mag=1, dur=1},
        {effect="resistfrost", mag=15},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="restorehealth", mag=1, dur=1},
        {effect="resistfrost", mag=20},
        {effect="fortifyhealth", mag=18},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "trollbone_helm", "trollbone_cuirass", "trollbone_shield", "t_nor_trollbone_boots_01",
      "t_nor_trollbone_bracerl_01", "t_nor_trollbone_bracerr_01", "t_nor_trollbone_greaves_01", "t_nor_trollbone_greaves_vigor",
      "t_nor_trollbone_pauldronl_01", "t_nor_trollbone_pauldronr_01",
    },
  },
  {
    name = "Watchman",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="nighteye", mag=25},
        {effect="fortifyfatigue", mag=12},
      },
      mid = {
        {effect="nighteye", mag=40},
        {effect="fortifyfatigue", mag=20},
        {effect="fortifyhealth", mag=12},
      },
      max = {
        {effect="nighteye", mag=50},
        {effect="fortifyfatigue", mag=28},
        {effect="fortifyhealth", mag=18},
        {effect="detectanimal", mag=50},
      },
    },
    items = {
      "t_a_dechitinhelmopen01_hrpen", "t_a_deredwatchchitincuir01_cuirass", "t_de_redwatchchitin_pauldrl_01", "t_de_redwatchchitin_pauldrr_01",
      "t_a_deredwatchchitingreav01_greaves", "t_de_redwatchchitin_boots_01", "t_a_deredwatchchitingreav01_gauntlet_left", "t_a_deredwatchchitingreav01_gauntlet_right",
    },
  },
  {
    name = "Wenbone",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
        {effect="fortifyskill", skill="marksman", mag=5},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="fortifyskill", skill="marksman", mag=8},
        {effect="fortifyattribute", attribute="agility", mag=5},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="fortifyskill", skill="marksman", mag=12},
        {effect="fortifyattribute", attribute="agility", mag=8},
        {effect="fortifyskill", skill="sneak", mag=12},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "t_we_wenbone_boots_01", "t_we_wenbone_bracerl_01", "t_we_wenbone_bracerr_01", "t_we_wenbone_cuirass_01",
      "t_we_wenbone_greaves_01", "t_we_wenbone_helm_01", "t_we_wenbone_pauldronl_01", "t_we_wenbone_pauldronr_01",
      "t_we_wenbone_shieldtow_01",
    },
  },
  {
    name = "Wolf Fur",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistfrost", mag=10},
        {effect="fortifyattribute", attribute="speed", mag=3},
      },
      mid = {
        {effect="resistfrost", mag=15},
        {effect="fortifyattribute", attribute="speed", mag=5},
        {effect="nighteye", mag=40},
        {effect="weaknesstofire", mag=10},
      },
      max = {
        {effect="resistfrost", mag=20},
        {effect="fortifyattribute", attribute="speed", mag=8},
        {effect="nighteye", mag=50},
        {effect="fortifyskill", skill="athletics", mag=12},
        {effect="weaknesstofire", mag=20},
      },
    },
    items = {
      "bm wolf cuirass", "bm wolf greaves", "bm wolf helmet", "bm wolf left gauntlet",
      "bm wolf left pauldron", "bm wolf right gauntlet", "bm wolf right pauldron", "bm wolf boots",
      "bm_wolf_cuirass_snow", "bm_wolf_greaves_snow", "bm_wolf_helmet_snow", "bm_wolf_left_gauntlet_snow",
      "bm_wolf_left_pauldron_snow", "bm_wolf_right_gauntlet_snow", "bm_wolf_right_pauldron_snow", "bm_wolf_boots_snow",
      "bm wolf shield", "bm wolf helmet_heartfang",
    },
  },
  {
    name = "Wormmouth",
    thresholds = { min=2, mid=4, max=6 },
    bonuses = {
      min = {
        {effect="resistpoison", mag=10},
      },
      mid = {
        {effect="resistpoison", mag=15},
        {effect="resistblightdisease", mag=15},
        {effect="weaknesstofrost", mag=10},
      },
      max = {
        {effect="resistpoison", mag=20},
        {effect="resistblightdisease", mag=20},
        {effect="resistparalysis", mag=20},
        {effect="weaknesstofrost", mag=20},
      },
    },
    items = {
      "t_rea_wormmouth_boots_01", "t_rea_wormmouth_bracerl_01", "t_rea_wormmouth_bracerr_01", "t_rea_wormmouth_cuirass_01",
      "t_rea_wormmouth_greaves_01", "t_rea_wormmouth_helm_01", "t_rea_wormmouth_helm_poison", "t_rea_wormmouth_pauldronl_01",
      "t_rea_wormmouth_pauldronr_01",
    },
  },
}