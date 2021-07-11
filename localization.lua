local _, Private = ...

if Private.initialized then
	local localization = LibStub:GetLibrary("ovale/ui/Localization")
	local L = localization and localization.l or nil
	do
		-- backwards compatibiility for Ovale<=9.0.43
		L = L or (localization and localization.L or nil)
	end
	L = L or {}
	local locale = GetLocale()

	--[[
	--	Insert additional localization strings into the Ovale localization
	--	table. These symbol-to-string translations are used in the scripts
	--	with the L() conditions, e.g., L(dispel), etc., for displaying the
	--	correct string for text parameters.
	--]]

	-- Default locale (enUS)
	L.dispel = [[Dispels]]
	--L.interrupt = [[Interrupts]]
	L.mage_arcane_ap_burn = [[Arcane Power Burn phase]]
	L.mage_arcane_mini_burn = [[Mini Burn phase]]
	L.mage_arcane_conserve = [[Conserve phase]]
	--L.not_in_melee_range = [[Not in melee range]]
	L.opt_nerien_shield_block = [[Always suggest Shield Block]]
	L.trinkets = [[Trinkets]]
end
