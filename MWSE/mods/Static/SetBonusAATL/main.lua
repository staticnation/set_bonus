-- =========================================================================
--  Set Bonus -- AATL add-on (auto-generated)
--  Re-links AATL armour (bucklers, Ancient Shrouded set, replica artifacts,
--  unique pieces) to the base Set Bonus sets via the interop. Loads only when
--  AATL items are present. Low event priority so it runs after all sets (incl.
--  add-on-registered ones like House Redoran) are registered.
-- =========================================================================

local setBonus = require("Static.SetBonus.interop")

local function present(id) return tes3.getObject(id) ~= nil end

local function registerAATL()
    if not (setBonus and setBonus.version and setBonus.version >= 2) then return end

    if present("AATL_a_buck_chitin") and setBonus.getSet("Chitin") then
        setBonus.addItems("Chitin", {
            "AATL_a_buck_chitin", "AATL_a_buck_chitin_h", "AATL_a_buck_chitin_EN1",
            "AATL_a_buck_chitin_EN2", "AATL_a_buck_chitin_h_EN1",
        })
    end
    if present("AATL_a_buck_dwemer_h") and setBonus.getSet("Dwemer") then
        setBonus.addItems("Dwemer", {
            "AATL_a_buck_dwemer_h", "AATL_a_buck_dwemer_h_EN1",
        })
    end
    if present("AATL_a_buck_glass") and setBonus.getSet("Glass") then
        setBonus.addItems("Glass", {
            "AATL_a_buck_glass", "AATL_a_buck_glass_h", "AATL_a_buck_glass_h_EN1",
            "AATL_a_buck_glass_EN1",
        })
    end
    if present("AATL_a_buck_iron") and setBonus.getSet("Iron") then
        setBonus.addItems("Iron", {
            "AATL_a_buck_iron", "AATL_a_buck_niron", "AATL_a_buck_iron_EN1",
            "AATL_a_buck_iron_nord", "AATL_a_buck_iron_nord_EN1",
        })
    end
    if present("AATL_a_buck_netch_h") and setBonus.getSet("Netch Leather") then
        setBonus.addItems("Netch Leather", {
            "AATL_a_buck_netch_h", "AATL_a_buck_netch_h_EN1",
        })
    end
    if present("AATL_ART_Targe_Blooded") and setBonus.getSet("Artifacts") then
        setBonus.addItems("Artifacts", {
            "AATL_ART_Targe_Blooded", "AATL_ART_Visage_Mzund", "AATL_ART_Fearstruck",
            "AATL_ART_buck_manarend", "AATL_ART_Targe_Blooded_F", "AATL_ART_buck_manarend_F",
            "AATL_ART_Fearstruck_F", "AATL_ART_Visage_Mzund_F",
        })
    end
    if present("AATL_A_Ancient_Shroud_Chest") and setBonus.getSet("Dark Brotherhood") then
        setBonus.addItems("Dark Brotherhood", {
            "AATL_A_Ancient_Shroud_Chest", "AATL_A_Ancient_Shroud_GauntL", "AATL_A_Ancient_Shroud_GauntR",
            "AATL_A_Ancient_Shroud_Greaves", "AATL_A_Ancient_Shroud_PaulL", "AATL_A_Ancient_Shroud_PaulR",
            "AATL_A_Ancient_Shroud_Helm", "AATL_A_Ancient_Shroud_Boots",
        })
    end
    if present("AATL_AMW_A_VandasHelm") and setBonus.getSet("House Redoran") then
        setBonus.addItems("House Redoran", {
            "AATL_AMW_A_VandasHelm", "AATL_AMW_A_Vandas_BannerShield",
        })
    end
    if present("AATL_a_LandSwimmer") and setBonus.getSet("Dreugh") then
        setBonus.addItems("Dreugh", {
            "AATL_a_LandSwimmer",
        })
    end
end

event.register(tes3.event.initialized, registerAATL, { priority = -100 })
