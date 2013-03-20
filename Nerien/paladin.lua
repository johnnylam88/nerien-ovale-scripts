local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.PALADIN.Nerien = {
	desc = "[5.2] Nerien: Retribution",
	code =
[[
# Nerien's paladin script based on SimulationCraft
#
# Retribution
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#bb!110112
#	glyphs=double_jeopardy/mass_exorcism

Define(alabaster_shield 121467)
	SpellInfo(alabaster_shield duration=12)
Define(ancient_power 86700)
	SpellInfo(ancient_power duration=30)
Define(ardent_defender 31850)
	SpellInfo(ardent_defender cd=180 duration=10)
	SpellInfo(ardent_defender addcd=-60 itemset=T14_tank itemcount=2)
	SpellAddBuff(ardent_defender ardent_defender=1)
Define(avengers_shield 31935)
	SpellInfo(avengers_shield cd=15 duration=3)
	SpellInfo(avengers_shield cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellAddTargetDebuff(avengers_shield avengers_shield=1)
Define(avenging_wrath 31884)
	SpellInfo(avenging_wrath cd=180 duration=20)
	SpellInfo(avenging_wrath addduration=10 talent=sanctified_wrath_talent)
	SpellInfo(avenging_wrath addcd=-65 itemset=T14_melee itemcount=4)
	SpellAddBuff(avenging_wrath avenging_wrath=1)
Define(bastion_of_glory 114637)
	SpellInfo(bastion_of_glory duration=20)
Define(beacon_of_light 53563)
	SpellInfo(beacon_of_light cd=3)
Define(blessing_of_kings 20217)
	SpellInfo(blessing_of_kings duration=3600)
	SpellAddBuff(blessing_of_kings blessing_of_kings=1)
Define(blessing_of_might 19740)
	SpellInfo(blessing_of_might duration=3600)
	SpellAddBuff(blessing_of_might blessing_of_might=1)
Define(blinding_light 115750)
	SpellInfo(blinding_light cd=120)
Define(burden_of_guilt 110300)
	SpellInfo(burden_of_guilt duration=12)
Define(burden_of_guilt_talent 6)
Define(censure 31803)
	SpellInfo(censure duration=15)
Define(cleanse 4987)
	SpellInfo(cleanse cd=8)
Define(consecration 26573)
	SpellInfo(consecration cd=9 duration=9 tick=1)
	SpellInfo(consecration cd_haste=melee haste=melee if_spell=sanctity_of_battle)
Define(consecration_glyphed 116467)
Define(crusader_strike 35395)
	SpellInfo(crusader_strike holy=-1 cd=4.5)
	SpellInfo(crusader_strike cd_haste=melee haste=melee if_spell=sanctity_of_battle)
Define(daybreak 88819)
	SpellInfo(daybreak duration=6)
Define(denounce 2812)
	SpellInfo(denounce duration=4)
	SpellAddBuff(denounce glyph_of_denounce_aura=0)
	SpellAddTargetDebuff(denounce denounce=1)
Define(devotion_aura cd=180 duration=6)
	SpellAddBuff(devotion_aura devotion_aura=1)
Define(divine_favor 31842)
	SpellInfo(divine_favor cd=180 duration=20)
	SpellAddBuff(divine_favor divine_favor=1)
Define(divine_light 82326)
	SpellAddBuff(divine_light infusion_of_light=0)
Define(divine_plea 54428)
	SpellInfo(divine_plea cd=120 duration=9)
	SpellAddBuff(divine_plea divine_plea=1)
Define(divine_protection 498)
	SpellInfo(divine_protection cd=60 duration=10)
Define(divine_purpose 90174)
	SpellInfo(divine_purpose duration=8)
Define(divine_purpose_talent 15)
Define(divine_shield 642)
	SpellInfo(divine_shield cd=300 duration=8)
	SpellAddBuff(divine_shield divine_shield=1)
	SpellAddDebuff(divine_shield forbearance=1)
Define(divine_storm 53385)
	SpellInfo(divine_storm holy=3)
	SpellAddBuff(divine_storm divine_purpose=0)
Define(emancipate 121783)
Define(eternal_flame 114163)
	SpellInfo(eternal_flame duration=30 haste=spell holy=1 tick=3)
	SpellAddBuff(eternal_flame divine_purpose=0)
Define(eternal_flame_talent 8)
Define(execution_sentence 114157)
	SpellInfo(execution_sentence cd=60)
	SpellAddTargetDebuff(execution_sentence execution_sentence_aura=1)
Define(execution_sentence_aura 114916)
	SpellInfo(execution_sentence_aura duration=10 haste=spell tick=1)
Define(execution_sentence_talent 18)
Define(exorcism 879)
	SpellInfo(exorcism holy=-1 cd=15)
	SpellInfo(exorcism cd_haste=melee haste=melee if_spell=sanctity_of_battle mastery=3)
Define(exorcism_glyphed 122032)
	SpellInfo(exorcism_glyphed holy=-1 cd=15)
	SpellInfo(exorcism_glyphed cd_haste=melee haste=melee if_spell=sanctity_of_battle mastery=3)
Define(exorcism_aura 138162)
	SpellInfo(exorcism_aura duration=6)
Define(fist_of_justice 105593)
	SpellInfo(fist_of_justice cd=30 duration=6)
	SpellAddTargetDebuff(fist_of_justice fist_of_justice=1)
Define(fist_of_justice_talent 4)
Define(flash_of_light 19750)
	SpellAddBuff(flash_of_light selfless_healer=0 supplication=0)
Define(forbearance 25771)
	SpellInfo(forbearance duration=60)
Define(glyph_of_avenging_wrath_aura 115547)
	SpellInfo(glyph_of_avenging_wrath_aura duration=20 tick=2)
	SpellInfo(glyph_of_avenging_wrath_aura addduration=10 talent=sanctified_wrath_talent)
Define(glyph_of_consecration 54928)
Define(glyph_of_denounce_aura 115654)
Define(glyph_of_divine_plea 63223)
Define(glyph_of_divinity 54939)
Define(glyph_of_double_jeopardy_aura 121027)
	SpellInfo(glyph_of_double_jeopardy_aura duration=10)
Define(glyph_of_flash_of_light_aura 54957)
	SpellInfo(glyph_of_flash_of_light_aura duration=7)
Define(glyph_of_harsh_words 54938)
Define(glyph_of_mass_exorcism 122028)
Define(glyph_of_rebuke 54925)
Define(glyph_of_templars_verdict_aura 115668)
	SpellInfo(glyph_of_templars_verdict_aura duration=6)
Define(glyph_of_turn_evil 54931)
Define(glyph_of_word_of_glory_aura 115522)
	SpellInfo(glyph_of_word_of_glory_aura duration=6)
Define(guardian_of_ancient_kings_holy 86669)
	SpellInfo(guardian_of_ancient_kings_holy cd=300 duration=30)
	SpellAddBuff(guardian_of_ancient_kings_holy guardian_of_ancient_kings_holy=1)
Define(guardian_of_ancient_kings_protection 86659)
	SpellInfo(guardian_of_ancient_kings_protection cd=180 duration=12)
	SpellAddBuff(guardian_of_ancient_kings_protection guardian_of_ancient_kings_protection=1)
Define(guardian_of_ancient_kings_retribution 86698)
	SpellInfo(guardian_of_ancient_kings_retribution cd=300 duration=30)
	SpellAddBuff(guardian_of_ancient_kings_retribution guardian_of_ancient_kings_retribution=1)
Define(hammer_of_justice 853)
	SpellInfo(hammer_of_justice cd=60 duration=6)
	SpellAddTargetDebuff(hammer_of_justice hammer_of_justice=1)
Define(hammer_of_the_righteous 53595)
	SpellInfo(hammer_of_the_righteous holy=-1 cd=4.5)
	SpellInfo(hammer_of_the_righteous cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellAddTargetDebuff(hammer_of_the_righteous weakened_blows=1)
Define(hammer_of_wrath 24275)
	SpellInfo(hammer_of_wrath cd=6)
	SpellInfo(hammer_of_wrath cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellInfo(hammer_of_wrath holy=-1 mastery=3)
	SpellInfo(hammer_of_wrath addcd=-3 mastery=3 talent=sanctified_wrath_talent)
Define(hand_of_freedom 1044)
	SpellInfo(hand_of_freedom cd=25 duration=6)
Define(hand_of_protection 1022)
	SpellInfo(hand_of_protection cd=300 duration=10)
	SpellAddTargetDebuff(hand_of_protection forbearance=1)
Define(hand_of_purity 114039)
	SpellInfo(hand_of_purity cd=30 duration=6)
Define(hand_of_purity_talent 10)
Define(hand_of_sacrifice 6940)
	SpellInfo(hand_of_sacrifice cd=120 duration=12)
Define(hand_of_salvation 1038)
	SpellInfo(hand_of_salvation cd=120 duration=10)
Define(harsh_word 130552)
	SpellInfo(harsh_word holy=1)
	SpellAddBuff(harsh_word divine_purpose=0)
Define(holy_avenger 105809)
	SpellInfo(holy_avenger cd=120 duration=18)
Define(holy_avenger_talent 13)
Define(holy_light 635)
	SpellAddBuff(holy_light infusion_of_light=0)
Define(holy_prism 114165)
	SpellInfo(holy_prism cd=20)
Define(holy_prism_talent 16)
Define(holy_radiance 82327)
	SpellAddBuff(holy_radiance daybreak=1 infusion_of_light=0)
Define(holy_shock 20473)
	SpellInfo(holy_shock cd=6 holy=-1)
	SpellInfo(holy_shock cd=4 itemset=T14_heal itemcount=4)
	SpellInfo(holy_shock cd=3 talent=sanctified_wrath_talent)
	SpellInfo(holy_shock cd=2 itemset=T14_heal itemcount=4 talent=sanctified_wrath_talent)
	SpellAddBuff(holy_shock daybreak=0)
Define(holy_wrath 119072)
	SpellInfo(holy_wrath cd=9 duration=3)
	SpellInfo(holy_wrath cd_haste=melee haste=melee if_spell=sanctity_of_battle)
Define(infusion_of_light 54149)
	SpellInfo(infusion_of_light duration=15)
Define(inquisition 84963)
	SpellInfo(inquisition duration=10 holy=1)
	SpellAddBuff(inquisition divine_purpose=0 inquisition=1)
Define(judgment 20271)
	SpellInfo(judgment cd=6)
	SpellInfo(judgment cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellInfo(judgment addcd=-3 mastery=2 talent=sanctified_wrath_talent)
	SpellInfo(judgment holy=-1 if_spell=judgments_of_the_bold)
	SpellInfo(judgment holy=-1 if_spell=judgments_of_the_wise)
Define(judgments_of_the_bold 111529)
Define(judgments_of_the_pure_aura 53657)
	SpellInfo(judgments_of_the_pure_aura duration=60)
Define(judgments_of_the_wise 105424)
Define(lay_on_hands 633)
	SpellInfo(lay_on_hands cd=600)
	SpellInfo(lay_on_hands addcd=720 glyph=glyph_of_divinity)
	SpellAddTargetDebuff(lay_on_hands forbearance=1)
Define(light_of_ancient_kings 86678)
	SpellInfo(light_of_ancient_kings duration=8)
Define(light_of_dawn 85222)
	SpellInfo(light_of_dawn holy=1)
	SpellAddBuff(light_of_dawn divine_purpose=0)
Define(lights_hammer 114158)
	SpellInfo(lights_hammer cd=60)
Define(lights_hammer_talent 17)
Define(rebuke 96231)
	SpellInfo(rebuke cd=15)
	SpellInfo(rebuke addcd=5 glyph=glyph_of_rebuke)
Define(reckoning 62124)
	SpellInfo(reckoning cd=8 duration=3)
	SpellAddTargetDebuff(reckoning reckoning=3)
Define(redemption 7328)
Define(repentance 20066)
	SpellInfo(repentance cd=15 duration=60)
	SpellAddTargetDebuff(repentance repentance=1)
Define(repentance_talent 5)
Define(righteous_fury 25780)
Define(sacred_shield 20925)
	SpellInfo(sacred_shield cd=6 duration=30)
Define(sacred_shield_talent 9)
Define(sanctified_wrath_talent 14)
Define(sanctity_of_battle 25956)
Define(seal_of_command 105361)
Define(seal_of_insight 20165)
Define(seal_of_justice 20164)
Define(seal_of_justice_aura 20170)
	SpellInfo(seal_of_justice_aura duration=8)
Define(seal_of_righteousness 20154)
Define(seal_of_truth 31801)
Define(selfless_healer 114250)
	SpellInfo(selfless_healer duration=15)
Define(selfless_healer_talent 7)
Define(shield_of_the_righteous 53600)
	SpellInfo(shield_of_the_righteous cd=1.5 holy=3)
	SpellInfo(shield_of_the_righteous cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellAddBuff(shield_of_the_righteous alabaster_shield=0 bastion_of_glory=1 divine_purpose=0)
Define(speed_of_light 85499)
	SpellInfo(speed_of_light cd=45 duration=8)
Define(speed_of_light_talent 1)
Define(stay_of_execution 114917)
	SpellInfo(stay_of_execution duration=10 haste=spell tick=1)
Define(supplication 94686)
	SpellInfo(supplication duration=8)
Define(templars_verdict 85256)
	SpellInfo(templars_verdict holy=3)
	SpellAddBuff(templars_verdict divine_purpose=0)
Define(turn_evil 10326)
	SpellInfo(turn_evil duration=40)
	SpellInfo(turn_evil cd=8 glyph=glyph_of_turn_evil)
	SpellAddTargetDebuff(turn_evil turn_evil=1)
Define(weakened_blows 115798)
	SpellInfo(weakened_blows duration=30)
Define(word_of_glory 85673)
	SpellInfo(word_of_glory holy=1)
	SpellAddBuff(word_of_glory divine_purpose=0)
Define(word_of_glory_glyphed 136494)
	SpellInfo(word_of_glory_glyphed holy=1)
	SpellAddBuff(word_of_glory_glyphed divine_purpose=0)

# Items
ItemList(darkmist_vortex 86894 86336 87172)
Define(darkmist_vortex_buff 126657)
ItemList(lei_shens_final_orders 86802 86144 87072)
Define(lei_shens_final_orders_buff 126582)
Define(mogu_power_potion 76095)
Define(mogu_power_potion_buff 105706)
	SpellInfo(mogu_power_potion_buff duration=25)

# Racials
Define(arcane_torrent_chi 129597)
	SpellInfo(arcane_torrent_chi cd=120 chi=1)
Define(berserking 26297)
	SpellInfo(berserking cd=180 duration=10)
	SpellAddBuff(berserking berserking=1)
Define(blood_fury 20572)
	SpellInfo(blood_fury cd=120 duration=15)
	SpellAddBuff(blood_fury blood_fury=1)
Define(quaking_palm 107079)
	SpellInfo(quaking_palm cd=120 duration=4)
	SpellAddTargetDebuff(quaking_palm quaking_palm=1)
Define(stoneform 20594)
	SpellInfo(stoneform cd=120 duration=8)
	SpellAddBuff(stoneform stoneform=1)

AddFunction UseRacialActions
{
	Spell(berserking)
	Spell(blood_fury)
}

AddFunction UseRacialInterruptActions
{
	if target.Classification(worldboss no)
	{
		Spell(arcane_torrent_chi)
		if target.InRange(quaking_palm) Spell(quaking_palm)
	}
}

AddFunction UseRacialSurvivalActions
{
	Spell(stoneform)
}

AddCheckBox(aoe L(AOE))
AddCheckBox(potions "Use potions" default)

AddCheckBox(opt_icons_left "Left icons")
AddCheckBox(opt_icons_right "Right icons")

# Trinket CDs
AddListItem(trinketcd0 000s "Trinket 0 CD - none" default)
AddListItem(trinketcd0 060s "Trinket 0 CD - 1 min")
AddListItem(trinketcd0 090s "Trinket 0 CD - 1 min 30s")
AddListItem(trinketcd0 120s "Trinket 0 CD - 2 min")
AddListItem(trinketcd1 000s "Trinket 1 CD - none" default)
AddListItem(trinketcd1 060s "Trinket 1 CD - 1 min")
AddListItem(trinketcd1 090s "Trinket 1 CD - 1 min 30s")
AddListItem(trinketcd1 120s "Trinket 1 CD - 2 min")

AddFunction UseItemActions
{
	Item(HandsSlot usable=1)
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Paladin (all specializations)
###

AddFunction Interrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		if target.InRange(rebuke) Spell(rebuke)
		UseRacialInterruptActions()
	}
}

AddFunction UsePotion
{
	#mogu_power_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(mogu_power_potion usable=1)
}

###
### Retribution
###

AddFunction RetributionFullRotation
{
	if InCombat(no)
	{
		#flask,type=winters_bite
		#food,type=black_pepper_ribs_and_shrimp
		#blessing_of_kings,if=!aura.str_agi_int.up
		if BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_kings)
		#blessing_of_might,if=!aura.mastery.up&!aura.str_agi_int.up
		if BuffExpires(mastery 400 any=1) and BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_might)
		#seal_of_righteousness,if=active_enemies>=4
		if Enemies() >=4 and not Stance(paladin_seal_of_righteousness) Spell(seal_of_righteousness)
		#seal_of_truth,if=active_enemies<4
		if Enemies() <4 and not Stance(paladin_seal_of_truth) Spell(seal_of_truth)
		#snapshot_stats
		#mogu_power_potion
		UsePotion()
	}

	#rebuke
	Interrupt()
	#mogu_power_potion,if=(buff.bloodlust.react|(buff.ancient_power.up&buff.avenging_wrath.up)|target.time_to_die<=40)
	if BuffPresent(burst_haste any=1) or {BuffPresent(ancient_power) and BuffPresent(avenging_wrath)} or target.TimeToDie() <=40 UsePotion()
	#auto_attack
	#judgment,if=!target.debuff.physical_vulnerability.up|target.debuff.physical_vulnerability.remains<6
	if target.DebuffRemains(physical_vulnerability any=1) <6 Spell(judgment)
	if TalentPoints(divine_purpose_talent)
	{
		#inquisition,if=buff.inquisition.down&(holy_power>=1|buff.divine_purpose.react)
		if BuffExpires(inquisition) and {HolyPower() >=1 or BuffPresent(divine_purpose)} Spell(inquisition)
	}
	#inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*10|buff.divine_purpose.react)
	if BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)} Spell(inquisition)
	if BuffPresent(inquisition)
	{
		if {HasTrinket(lei_shens_final_orders) and BuffPresent(lei_shens_final_orders_buff)}
			or {HasTrinket(darkmist_vortex) and BuffPresent(darkmist_vortex_buff)}
			or {HasTrinket(lei_shens_final_orders no) and HasTrinket(darkmist_vortex no)}
		{
			if not SpellKnown(guardian_of_ancient_kings_retribution) or TalentPoints(sanctified_wrath_talent)
			{
				#avenging_wrath,if=buff.inquisition.up
				Spell(avenging_wrath)
			}
			if SpellKnown(guardian_of_ancient_kings_retribution) and not TalentPoints(sanctified_wrath_talent)
			{
				#avenging_wrath,if=buff.inquisition.up&(cooldown.guardian_of_ancient_kings.remains<291)
				if SpellCooldown(guardian_of_ancient_kings_retribution) <291 Spell(avenging_wrath)
			}
		}
	}
	if SpellKnown(avenging_wrath)
	{
		#guardian_of_ancient_kings,if=buff.avenging_wrath.up
		if TalentPoints(sanctified_wrath_talent) and BuffPresent(avenging_wrath) Spell(guardian_of_ancient_kings_retribution)
		#guardian_of_ancient_kings,if=cooldown.avenging_wrath.remains<10
		if not TalentPoints(sanctified_wrath_talent) and SpellCooldown(avenging_wrath) <10 Spell(guardian_of_ancient_kings_retribution)
	}
	if not SpellKnown(avenging_wrath)
	{
		#guardian_of_ancient_kings
		Spell(guardian_of_ancient_kings_retribution)
	}
	if TalentPoints(holy_avenger_talent)
	{
		if BuffPresent(inquisition) and HolyPower() <=2
		{
			if not SpellKnown(guardian_of_ancient_kings_retribution) Spell(holy_avenger)
			if SpellKnown(guardian_of_ancient_kings_retribution) and SpellCooldown(guardian_of_ancient_kings_retribution) <289 Spell(holy_avenger)
		}
	}
	#use_item,name=reinbinders_fists,if=buff.inquisition.up
	if BuffPresent(inquisition) and {TalentPoints(sanctified_wrath_talent) or TimeInCombat() >=14} UseItemActions()
	UseRacialActions()
	if BuffPresent(inquisition) and {TalentPoints(sanctified_wrath_talent) or TimeInCombat() >=15}
	{
		#execution_sentence,if=buff.inquisition.up
		if TalentPoints(execution_sentence_talent) Spell(execution_sentence)
		#lights_hammer,if=buff.inquisition.up
		if TalentPoints(lights_hammer_talent) Spell(lights_hammer)
	}
	if HolyPower() ==5 or BuffPresent(divine_purpose) or {BuffPresent(holy_avenger) and HolyPower() >=3}
	{
		#divine_storm,if=active_enemies>=2&(holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3))
		if Enemies() >=2 Spell(divine_storm)
		#templars_verdict,if=holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3)
		Spell(templars_verdict)
	}
	if SpellKnown(hammer_of_wrath) and {BuffPresent(avenging_wrath) or target.HealthPercent() <20}
	{
		#hammer_of_wrath
		Spell(hammer_of_wrath)
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.2
		if SpellCooldown(hammer_of_wrath) >0 and SpellCooldown(hammer_of_wrath) <=0.2
			wait Spell(hammer_of_wrath)
	}
	if SpellKnown(exorcism)
	{
		#exorcism
		Spell(exorcism)
		#wait,sec=cooldown.exorcism.remains,if=cooldown.exorcism.remains>0&cooldown.exorcism.remains<=0.2
		if SpellCooldown(exorcism) >0 and SpellCooldown(exorcism) <=0.2
			wait Spell(exorcism)
	}
	#judgment,if=!(set_bonus.tier15_4pc_melee)&(target.health.pct<=20|buff.avenging_wrath.up)&active_enemies<2
	if ArmorSetParts(T15_melee) <4 and {target.HealthPercent() <=20 or BuffPresent(avenging_wrath)} and Enemies() <2 Spell(judgment)
	#hammer_of_the_righteous,if=active_enemies>=4
	if Enemies() >=4 Spell(hammer_of_the_righteous)
	if SpellKnown(crusader_strike)
	{
		#crusader_strike
		Spell(crusader_strike)
		#wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.2
		if SpellCooldown(crusader_strike) >0 and SpellCooldown(crusader_strike) <=0.2
			wait Spell(crusader_strike)
	}
	#judgment,target=2,if=active_enemies>=2&buff.glyph_double_jeopardy.up
	if BuffPresent(glyph_of_double_jeopardy_aura) and Enemies() >=2 Spell(judgment)
	#judgment
	Spell(judgment)
	if BuffRemains(inquisition) >4
	{
		#divine_storm,if=active_enemies>=2&buff.inquisition.remains>4
		if Enemies() >=2 Spell(divine_storm)
		#templars_verdict,if=buff.inquisition.remains>4
		Spell(templars_verdict)
	}
	if TalentPoints(holy_prism_talent)
	{
		#holy_prism
		Spell(holy_prism)
	}
}

AddFunction RetributionMainActions
{
	if InCombat(no)
	{
		#flask,type=winters_bite
		#food,type=black_pepper_ribs_and_shrimp
		#blessing_of_kings,if=!aura.str_agi_int.up
		if BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_kings)
		#blessing_of_might,if=!aura.mastery.up&!aura.str_agi_int.up
		if BuffExpires(mastery 400 any=1) and BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_might)
		#seal_of_truth,if=active_enemies<4
		if not Stance(paladin_seal_of_truth) Spell(seal_of_truth)
		#snapshot_stats
	}

	#rebuke
	Interrupt()
	#auto_attack
	#judgment,if=!target.debuff.physical_vulnerability.up|target.debuff.physical_vulnerability.remains<6
	if target.DebuffRemains(physical_vulnerability any=1) <6 Spell(judgment)
	if TalentPoints(divine_purpose_talent)
	{
		#inquisition,if=buff.inquisition.down&(holy_power>=1|buff.divine_purpose.react)
		if BuffExpires(inquisition) and {HolyPower() >=1 or BuffPresent(divine_purpose)} Spell(inquisition)
	}
	#inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*10|buff.divine_purpose.react)
	if BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)} Spell(inquisition)
	if HolyPower() ==5 or BuffPresent(divine_purpose) or {BuffPresent(holy_avenger) and HolyPower() >=3}
	{
		#templars_verdict,if=holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3)
		Spell(templars_verdict)
	}
	if SpellKnown(hammer_of_wrath) and {BuffPresent(avenging_wrath) or target.HealthPercent() <20}
	{
		#hammer_of_wrath
		Spell(hammer_of_wrath)
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.2
		if SpellCooldown(hammer_of_wrath) >0 and SpellCooldown(hammer_of_wrath) <=0.2
			wait Spell(hammer_of_wrath)
	}
	if SpellKnown(exorcism)
	{
		#exorcism
		Spell(exorcism)
		#wait,sec=cooldown.exorcism.remains,if=cooldown.exorcism.remains>0&cooldown.exorcism.remains<=0.2
		if SpellCooldown(exorcism) >0 and SpellCooldown(exorcism) <=0.2
			wait Spell(exorcism)
	}
	#judgment,if=!(set_bonus.tier15_4pc_melee)&(target.health.pct<=20|buff.avenging_wrath.up)&active_enemies<2
	if ArmorSetParts(T15_melee) <4 and {target.HealthPercent() <=20 or BuffPresent(avenging_wrath)} Spell(judgment)
	if SpellKnown(crusader_strike)
	{
		#crusader_strike
		Spell(crusader_strike)
		#wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.2
		if SpellCooldown(crusader_strike) >0 and SpellCooldown(crusader_strike) <=0.2
			wait Spell(crusader_strike)
	}
	#judgment
	Spell(judgment)
	if BuffRemains(inquisition) >4
	{
		#templars_verdict,if=buff.inquisition.remains>4
		Spell(templars_verdict)
	}
	if TalentPoints(holy_prism_talent)
	{
		#holy_prism
		Spell(holy_prism)
	}
}

AddFunction RetributionAoEActions
{
	if InCombat(no)
	{
		#flask,type=winters_bite
		#food,type=black_pepper_ribs_and_shrimp
		#blessing_of_kings,if=!aura.str_agi_int.up
		if BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_kings)
		#blessing_of_might,if=!aura.mastery.up&!aura.str_agi_int.up
		if BuffExpires(mastery 400 any=1) and BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_might)
		#seal_of_righteousness,if=active_enemies>=4
		if not Stance(paladin_seal_of_righteousness) Spell(seal_of_righteousness)
		#snapshot_stats
	}

	#rebuke
	Interrupt()
	#auto_attack
	#judgment,if=!target.debuff.physical_vulnerability.up|target.debuff.physical_vulnerability.remains<6
	if target.DebuffRemains(physical_vulnerability any=1) <6 Spell(judgment)
	if TalentPoints(divine_purpose_talent)
	{
		#inquisition,if=buff.inquisition.down&(holy_power>=1|buff.divine_purpose.react)
		if BuffExpires(inquisition) and {HolyPower() >=1 or BuffPresent(divine_purpose)} Spell(inquisition)
	}
	#inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*10|buff.divine_purpose.react)
	if BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)} Spell(inquisition)
	if HolyPower() ==5 or BuffPresent(divine_purpose) or {BuffPresent(holy_avenger) and HolyPower() >=3}
	{
		#divine_storm,if=active_enemies>=2&(holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3))
		Spell(divine_storm)
	}
	if SpellKnown(hammer_of_wrath) and {BuffPresent(avenging_wrath) or target.HealthPercent() <20}
	{
		#hammer_of_wrath
		Spell(hammer_of_wrath)
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.2
		if SpellCooldown(hammer_of_wrath) >0 and SpellCooldown(hammer_of_wrath) <=0.2
			wait Spell(hammer_of_wrath)
	}
	if SpellKnown(exorcism)
	{
		#exorcism
		Spell(exorcism)
		#wait,sec=cooldown.exorcism.remains,if=cooldown.exorcism.remains>0&cooldown.exorcism.remains<=0.2
		if SpellCooldown(exorcism) >0 and SpellCooldown(exorcism) <=0.2
			wait Spell(exorcism)
	}
	#judgment,if=!(set_bonus.tier15_4pc_melee)&(target.health.pct<=20|buff.avenging_wrath.up)&active_enemies<2
	if ArmorSetParts(T15_melee) <4 and {target.HealthPercent() <=20 or BuffPresent(avenging_wrath)} and Enemies() <2 Spell(judgment)
	#hammer_of_the_righteous,if=active_enemies>=4
	Spell(hammer_of_the_righteous)
	if SpellKnown(crusader_strike)
	{
		#crusader_strike
		Spell(crusader_strike)
		#wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.2
		if SpellCooldown(crusader_strike) >0 and SpellCooldown(crusader_strike) <=0.2
			wait Spell(crusader_strike)
	}
	#judgment,target=2,if=active_enemies>=2&buff.glyph_double_jeopardy.up
	if BuffPresent(glyph_of_double_jeopardy_aura) and Enemies() >=2 Spell(judgment)
	#judgment
	Spell(judgment)
	if BuffRemains(inquisition) >4
	{
		#divine_storm,if=active_enemies>=2&buff.inquisition.remains>4
		Spell(divine_storm)
	}
	if TalentPoints(holy_prism_talent)
	{
		#holy_prism
		Spell(holy_prism)
	}
}

AddFunction RetributionShortCooldownActions
{
	unless {target.DebuffRemains(physical_vulnerability any=1) <6 and Spell(judgment)}
		or {TalentPoints(divine_purpose_talent) and BuffExpires(inquisition) and {HolyPower() >=1 or BuffPresent(divine_purpose)}}
		or {BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)}}
	{
		if BuffPresent(inquisition)
		{
			if {HasTrinket(lei_shens_final_orders) and BuffPresent(lei_shens_final_orders_buff)}
				or {HasTrinket(darkmist_vortex) and BuffPresent(darkmist_vortex_buff)}
				or {HasTrinket(lei_shens_final_orders no) and HasTrinket(darkmist_vortex no)}
			{
				if not SpellKnown(guardian_of_ancient_kings_retribution) or TalentPoints(sanctified_wrath_talent)
				{
					#avenging_wrath,if=buff.inquisition.up
					Spell(avenging_wrath)
				}
				if SpellKnown(guardian_of_ancient_kings_retribution) and not TalentPoints(sanctified_wrath_talent)
				{
					#avenging_wrath,if=buff.inquisition.up&(cooldown.guardian_of_ancient_kings.remains<291)
					if SpellCooldown(guardian_of_ancient_kings_retribution) <291 Spell(avenging_wrath)
				}
			}
		}
		if BuffPresent(inquisition) and {TalentPoints(sanctified_wrath_talent) or TimeInCombat() >=15}
		{
			#execution_sentence,if=buff.inquisition.up
			if TalentPoints(execution_sentence_talent) Spell(execution_sentence)
			#lights_hammer,if=buff.inquisition.up
			if TalentPoints(lights_hammer_talent) Spell(lights_hammer)
		}
	}
}

AddFunction RetributionCooldownActions
{
	if InCombat(no)
	{
		#mogu_power_potion
		UsePotion()
	}

	#rebuke
	Interrupt()
	#mogu_power_potion,if=(buff.bloodlust.react|(buff.ancient_power.up&buff.avenging_wrath.up)|target.time_to_die<=40)
	if BuffPresent(burst_haste any=1) or {BuffPresent(ancient_power) and BuffPresent(avenging_wrath)} or target.TimeToDie() <=40 UsePotion()

	unless {target.DebuffRemains(physical_vulnerability any=1) <6 and Spell(judgment)}
		or {TalentPoints(divine_purpose_talent) and BuffExpires(inquisition) and {HolyPower() >=1 or BuffPresent(divine_purpose)}}
		or {BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)}}
	{
		if SpellKnown(avenging_wrath)
		{
			#guardian_of_ancient_kings,if=buff.avenging_wrath.up
			if TalentPoints(sanctified_wrath_talent) and BuffPresent(avenging_wrath) Spell(guardian_of_ancient_kings_retribution)
			#guardian_of_ancient_kings,if=cooldown.avenging_wrath.remains<10
			if not TalentPoints(sanctified_wrath_talent) and SpellCooldown(avenging_wrath) <10 Spell(guardian_of_ancient_kings_retribution)
		}
		if not SpellKnown(avenging_wrath)
		{
			#guardian_of_ancient_kings
			Spell(guardian_of_ancient_kings_retribution)
		}
		if TalentPoints(holy_avenger_talent)
		{
			if BuffPresent(inquisition) and HolyPower() <=2
			{
				if not SpellKnown(guardian_of_ancient_kings_retribution) Spell(holy_avenger)
				if SpellKnown(guardian_of_ancient_kings_retribution) and SpellCooldown(guardian_of_ancient_kings_retribution) <289 Spell(holy_avenger)
			}
		}
		#use_item,name=reinbinders_fists,if=buff.inquisition.up
		if BuffPresent(inquisition) and {TalentPoints(sanctified_wrath_talent) or TimeInCombat() >=14} UseItemActions()
		UseRacialActions()
	}
}

### Retribution Icons

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	if BuffPresent(righteous_fury) Texture(spell_holy_sealoffury)
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	if IsRooted()
	{
		Spell(hand_of_freedom)
		Spell(emancipate)
	}
}

AddIcon mastery=3 help=shortcd
{
	RetributionShortCooldownActions()
}

AddIcon mastery=3 help=main
{
	RetributionMainActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	RetributionAoEActions()
}

AddIcon mastery=3 help=cd
{
	RetributionCooldownActions()
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	Spell(lay_on_hands)
}
]],
}
