-- STUB: no armor items for the Resin Molded set were found in the provided dumps (armor.csv / raw.csv).
-- The spells (_sn_resin_min/mid/max) exist in Set_Bonus.esp, so just fill in the
-- equippable item IDs below (lowercase or any case; they are lowercased on load) and the
-- set bonus will start working. An empty list is harmless: the set simply never triggers.
return {
	name = "Resin Molded",
	items = {  },
	minBonus = "_sn_resin_min",
	midBonus = "_sn_resin_mid",
	maxBonus = "_sn_resin_max"
}
