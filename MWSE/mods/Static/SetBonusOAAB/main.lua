-- =========================================================================
--  Set Bonus -- OAAB add-on (auto-generated)
--  Re-links OAAB armour to the base Set Bonus sets via the interop. Loads only
--  when OAAB items are present, so it is safe with or without OAAB installed.
-- =========================================================================

local setBonus = require("Static.SetBonus.interop")

local function present(id) return tes3.getObject(id) ~= nil end

local function registerOAAB()
    if not (setBonus and setBonus.version and setBonus.version >= 2) then return end

    if present("AB_a_CephHelmOpen") and setBonus.getSet("Cephalopod") then
        setBonus.addItems("Cephalopod", {
            "AB_a_CephHelmOpen", "AB_a_CephPauldronLeft", "AB_a_CephPauldronRight",
        })
    end
    if present("AB_a_ChitinHelmOpen") and setBonus.getSet("Chitin") then
        setBonus.addItems("Chitin", {
            "AB_a_ChitinHelmOpen", "AB_a_ChitinHlaHelm01", "AB_a_ChitinRedHelm01",
            "AB_a_ChitinScoutHelm", "AB_a_ChitinTelHelm01",
        })
    end
    if present("AB_a_ClothHelm1") and setBonus.getSet("Cloth") then
        setBonus.addItems("Cloth", {
            "AB_a_ClothHelm1", "AB_a_ClothHelm2", "AB_a_ClothHelm3",
        })
    end
    if present("AB_a_DaeAzuraHelm") and setBonus.getSet("Daedric") then
        setBonus.addItems("Daedric", {
            "AB_a_DaeAzuraHelm", "AB_a_DaeDagonHelm", "AB_a_DaeMolagHelm",
            "AB_a_DaeSheogHelm",
        })
    end
    if present("AB_a_DreughBoots") and setBonus.getSet("Dreugh") then
        setBonus.addItems("Dreugh", {
            "AB_a_DreughBoots", "AB_a_DreughBracerL", "AB_a_DreughBracerR",
            "AB_a_DreughGreaves", "AB_a_DreughHelmClose", "AB_a_DreughPldLeft",
            "AB_a_DreughPldRight",
        })
    end
    if present("AB_a_GlassAssassinPauldronLeft") and setBonus.getSet("Glass") then
        setBonus.addItems("Glass", {
            "AB_a_GlassAssassinPauldronLeft", "AB_a_GlassAssassinPauldronRight", "AB_a_GlassHelmClose",
        })
    end
    if present("AB_a_ChitinHlaHelm01") and setBonus.getSet("House Hlaalu") then
        setBonus.addItems("House Hlaalu", {
            "AB_a_ChitinHlaHelm01",
        })
    end
    if present("AB_a_IronDeBoots") and setBonus.getSet("Iron") then
        setBonus.addItems("Iron", {
            "AB_a_IronDeBoots", "AB_a_IronDeCuirass", "AB_a_IronDeHelm",
            "AB_a_IronDeHelmTong", "AB_a_IronDePldLeft", "AB_a_IronDePldRight",
        })
    end
    if present("AB_a_LeatherHat") and setBonus.getSet("Leather") then
        setBonus.addItems("Leather", {
            "AB_a_LeatherHat",
        })
    end
    if present("AB_a_MoragTongHelm01") and setBonus.getSet("Morag Tong") then
        setBonus.addItems("Morag Tong", {
            "AB_a_MoragTongHelm01", "AB_a_MoragTongHelm02", "AB_a_MoragTongHelm03",
            "AB_a_MoragTongHelm04",
        })
    end
    if present("AB_a_IronDeBoots") and setBonus.getSet("Native") then
        setBonus.addItems("Native", {
            "AB_a_IronDeBoots", "AB_a_IronDeCuirass", "AB_a_IronDeHelm",
            "AB_a_IronDeHelmTong", "AB_a_IronDePldLeft", "AB_a_IronDePldRight",
        })
    end
    if present("AB_a_NetchBoilPldLeft") and setBonus.getSet("Netch Leather") then
        setBonus.addItems("Netch Leather", {
            "AB_a_NetchBoilPldLeft", "AB_a_NetchBoilPldRight", "AB_a_NetchimanCap",
        })
    end
    if present("AB_a_OrcHelmOpen") and setBonus.getSet("Orcish") then
        setBonus.addItems("Orcish", {
            "AB_a_OrcHelmOpen",
        })
    end
    if present("AB_a_OrcHelmOpen") and setBonus.getSet("Orsimer") then
        setBonus.addItems("Orsimer", {
            "AB_a_OrcHelmOpen",
        })
    end
    if present("AB_a_SteelBoots") and setBonus.getSet("Steel") then
        setBonus.addItems("Steel", {
            "AB_a_SteelBoots", "AB_a_SteelCuirass", "AB_a_SteelGntlLeft",
            "AB_a_SteelGntlRight", "AB_a_SteelGreaves", "AB_a_SteelHelm",
            "AB_a_SteelHelmOpen", "AB_a_SteelPldrLeft", "AB_a_SteelPldrRight",
        })
    end
    if present("AB_a_CephHelmOpen") and setBonus.getSet("House Telvanni") then
        setBonus.addItems("House Telvanni", {
            "AB_a_CephHelmOpen", "AB_a_DustBoots", "AB_a_DustBracerLeft",
            "AB_a_DustBracerRight", "AB_a_DustChest", "AB_a_DustGreaves",
            "AB_a_DustHelm", "AB_a_DustPldrLeft", "AB_a_DustPldrRight",
        })
    end
end

event.register(tes3.event.initialized, registerOAAB, { priority = -100 })
