local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_library"
	local desc = string.format("[9.1] %s: Library", Private.name)
	local code = [[
Include(ovale_common)

# Racial Abilities
Define(ancestral_call 274738)
	SpellInfo(ancestral_call cd=120 gcd=0 offgcd=1)
SpellList(ancestral_call_buff ferocity_of_the_frostwolf might_of_the_blackrock rictus_of_the_laughing_skull zeal_of_the_burning_blade)
Define(arcane_torrent_deathknight 50613)
	SpellInfo(arcane_torrent_deathknight cd=120 runicpower=-20)
	SpellRequire(arcane_torrent_deathknight unusable set=1 enabled=(not Class(DEATHKNIGHT)))
Define(arcane_torrent_demonhunter 202719)
	SpellInfo(arcane_torrent_demonhunter cd=120 fury=-15)
	SpellRequire(arcane_torrent_demonhunter unusable set=1 enabled=(not Class(DEMONHUNTER)))
Define(arcane_torrent_hunter 80483)
	SpellInfo(arcane_torrent_hunter cd=120 focus=-15)
	SpellRequire(arcane_torrent_hunter unusable set=1 enabled=(not Class(HUNTER)))
Define(arcane_torrent_monk 129597)
	SpellInfo(arcane_torrent_monk cd=120)
	SpellRequire(arcane_torrent_monk unusable set=1 enabled=(not Class(MONK)))
	SpellRequire(arcane_torrent_monk energy set=-15 enabled=(Specialization(brewmaster)))
	SpellRequire(arcane_torrent_monk energy set=-15 enabled=(Specialization(windwalker)))
Define(arcane_torrent_paladin 155145)
	SpellInfo(arcane_torrent_paladin cd=120 holypower=-1)
	SpellRequire(arcane_torrent_paladin unusable set=1 enabled=(not Class(PALADIN)))
Define(arcane_torrent_priest 232633)
	SpellInfo(arcane_torrent_priest cd=120)
	SpellRequire(arcane_torrent_priest unusable set=1 enabled=(not Class(PRIEST)))
	SpellRequire(arcane_torrent_priest insanity set=-1500 enabled=(Specialization(shadow)))
Define(arcane_torrent_rogue 25046)
	SpellInfo(arcane_torrent_rogue cd=120 energy=-15)
	SpellRequire(arcane_torrent_rogue unusable set=1 enabled=(not Class(ROGUE)))
Define(arcane_torrent_warrior 69179)
	SpellInfo(arcane_torrent_warrior cd=120 rage=-15)
	SpellRequire(arcane_torrent_warrior unusable set=1 enabled=(not Class(WARRIOR)))
Define(berserking 26297)
	SpellInfo(berserking cd=120 duration=12 gcd=0 offgcd=1)
	SpellAddBuff(berserking berserking add=1)
Define(blood_fury_ap 20572)
	SpellInfo(blood_fury_ap cd=120 duration=15 gcd=0 offgcd=1)
	SpellRequire(blood_fury_ap unusable set=1 enabled=(not Class(DEATHKNIGHT) and not Class(HUNTER) and not Class(ROGUE) and not Class(WARRIOR)))
	SpellAddBuff(blood_fury_ap blood_fury_ap add=1)
Define(blood_fury_int 33702)
	SpellInfo(blood_fury_int cd=120 duration=15 gcd=0 offgcd=1)
	SpellRequire(blood_fury_int unusable set=1 enabled=(not Class(MAGE) and not Class(WARLOCK)))
	SpellAddBuff(blood_fury_int blood_fury_int add=1)
Define(blood_fury_ap_and_int 33697)
	SpellInfo(blood_fury_ap_and_int cd=120 duration=15 gcd=0 offgcd=1)
	SpellRequire(blood_fury_ap_and_int unusable set=1 enabled=(not Class(MONK) and not Class(SHAMAN)))
	SpellAddBuff(blood_fury_ap_and_int blood_fury_ap_and_int add=1)
Define(bull_rush 255654)
	SpellInfo(bull_rush cd=120)
Define(ferocity_of_the_frostwolf 274741)
	SpellInfo(ferocity_of_the_frostwolf duration=15)
Define(fireblood 265221)
	SpellInfo(fireblood cd=120 gcd=0 offgcd=1)
Define(haymaker 287712)
	SpellInfo(haymaker cd=150)
Define(might_of_the_blackrock 274742)
	SpellInfo(might_of_the_blackrock duration=15)
Define(quaking_palm 107079)
	SpellInfo(quaking_palm cd=120)
Define(rictus_of_the_laughing_skull 274739)
	SpellInfo(rictus_of_the_laughing_skull duration=15)
Define(shadowmeld 58984)
	SpellInfo(shadowmeld cd=120 gcd=0 offgcd=1)
Define(stoneform 20594)
	SpellInfo(stoneform cd=120 gcd=0 offgcd=1)
Define(war_stomp 20549)
	SpellInfo(war_stomp cd=90 gcd=0 offgcd=1)
Define(will_of_the_forsaken 7744)
	SpellInfo(will_of_the_forsaken cd=120)
Define(will_to_survive 59752)
	SpellInfo(will_to_survive cd=180)
Define(zeal_of_the_burning_blade 274740)
	SpellInfo(zeal_of_the_burning_blade duration=15)

# Covenant Signature Abilities
Define(fleshcraft 324631)
	SpellInfo(fleshcraft cd=120 unusable=1)
    SpellRequire(fleshcraft unusable set=0 enabled=(IsCovenant(necrolord)))
Define(summon_steward 324739)
	SpellInfo(summon_steward cd=300 unusable=1)
    SpellRequire(summon_steward unusable set=0 enabled=(IsCovenant(kyrian)))
Define(item_phial_of_serenity 177278)
	ItemInfo(item_phial_of_serenity cd=180 unusable=1)
	ItemRequire(item_phial_of_serenity unusable set=0 enabled=(IsCovenant(kyrian)))

# Items
Define(item_healthstone 5512)
Define(item_spiritual_healing_potion 171267)
Define(item_mistcaller_ocarina 178715)
Define(mistcaller_ocarina_crit_buff 332299)
	SpellInfo(mistcaller_ocarina_crit_buff duration=900)
Define(mistcaller_ocarina_haste_buff 332300)
	SpellInfo(mistcaller_ocarina_haste_buff duration=900)
Define(mistcaller_ocarina_mastery_buff 332301)
	SpellInfo(mistcaller_ocarina_mastery_buff duration=900)
Define(mistcaller_ocarina_versatility_buff 330067)
	SpellInfo(mistcaller_ocarina_versatility_buff duration=900)
SpellList(mistcaller_ocarina_buff mistcaller_ocarina_crit_buff mistcaller_ocarina_haste_buff mistcaller_ocarina_mastery_buff mistcaller_ocarina_versatility_buff)

AddFunction ItemHealActions
{
	if (HealthPercent() < 35) 
	{
		Item(item_healthstone usable=1)
		Item(item_spiritual_healing_potion usable=1)
	}
}

AddFunction InterruptActions
{
	if (not focus.IsFriend() and focus.Casting() and not focus.Classification(worldboss))
	{
		if (focus.Distance() < 6) Spell(bull_rush help=focus)
		if (focus.Distance() < 6 and CastTime(haymaker) < focus.RemainingCastTime()) Spell(haymaker text=focus)
		if focus.InRange(quaking_palm) Spell(quaking_palm text=focus)
		if (focus.Distance() < 8) Spell(war_stomp text=focus)
	}
	if (not target.IsFriend() and target.Casting() and not target.Classification(worldboss))
	{
		if (target.Distance() < 6) Spell(bull_rush)
		if (target.Distance() < 6 and CastTime(haymaker) < target.RemainingCastTime()) Spell(haymaker)
		if target.InRange(quaking_palm) Spell(quaking_palm)
		if (target.Distance() < 8) Spell(war_stomp)
	}
}

AddFunction DefensiveDispelActions
{
	if player.HasDebuffType(poison disease curse bleed)
	{
		Item(item_phial_of_serenity usable=1)
	}
	if player.HasDebuffType(poison disease curse magic bleed)
	{
		Spell(fireblood)
		Spell(stoneform)
	}
}

AddFunction OffensiveDispelActions
{
	if (target.Distance() < 8 and target.HasDebuffType(magic))
	{
		Spell(arcane_torrent_deathknight)
		Spell(arcane_torrent_demonhunter)
		Spell(arcane_torrent_hunter)
		Spell(arcane_torrent_monk)
		Spell(arcane_torrent_paladin)
		Spell(arcane_torrent_priest)
		Spell(arcane_torrent_rogue)
		Spell(arcane_torrent_warrior)
	}
}

AddFunction PrecombatShortCdActions
{
	Spell(fleshcraft)
	if (ItemCount(item_phial_of_serenity) < 2) Spell(summon_steward)
}

AddFunction PrecombatCdActions
{
	# XXX HasTrinket() seems to always return true.
	#if (HasTrinket(item_mistcaller_ocarina) and BuffRemaining(mistcaller_ocarina_buff) < 600) Item(item_mistcaller_ocarina)
}
]]
	Private.scripts:registerScript(nil, nil, name, desc, code, "include")
end