local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.PALADIN.Nerien = {
	desc = "[5.3] Nerien: Protection, Retribution",
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
	SpellInfo(avengers_shield buff_holy=grand_crusader cd=15 duration=3)
	SpellInfo(avengers_shield cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellAddBuff(avengers_shield grand_crusader=0)
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
	SpellInfo(daybreak duration=10)
Define(denounce 2812)
	SpellInfo(denounce duration=4)
	SpellAddBuff(denounce glyph_of_denounce_aura=0)
	SpellAddTargetDebuff(denounce denounce=1)
Define(devotion_aura 31821)
	SpellInfo(devotion_aura cd=180 duration=6)
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
	SpellAddBuff(eternal_flame bastion_of_glory=0 divine_purpose=0)
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
Define(glyph_of_focused_shield 54930)
Define(glyph_of_harsh_words 54938)
Define(glyph_of_mass_exorcism 122028)
Define(glyph_of_rebuke 54925)
Define(glyph_of_templars_verdict_aura 115668)
	SpellInfo(glyph_of_templars_verdict_aura duration=6)
Define(glyph_of_turn_evil 54931)
Define(glyph_of_word_of_glory 54936)
Define(glyph_of_word_of_glory_aura 115522)
	SpellInfo(glyph_of_word_of_glory_aura duration=6)
Define(grand_crusader 85416)
	SpellInfo(grand_crusader duration=6)
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
	SpellInfo(holy_radiance holy=-1)
	SpellAddBuff(holy_radiance daybreak=1 infusion_of_light=0)
Define(holy_shock 20473)
	SpellInfo(holy_shock cd=6 holy=-1)
	SpellInfo(holy_shock cd=5 itemset=T14_heal itemcount=4)
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
	SpellInfo(sacred_shield cd=6 duration=30 haste=spell tick=6)
	SpellAddBuff(sacred_shield sacred_shield=1)
Define(sacred_shield_aura 65148)
	SpellInfo(sacred_shield_aura duration=6)
Define(sacred_shield_talent 9)
Define(sanctified_wrath 114232)
	SpellInfo(sanctified_wrath duration=30)
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
	SpellAddBuff(shield_of_the_righteous alabaster_shield=0 bastion_of_glory=1 divine_purpose=0 shield_of_the_righteous_buff=1)
Define(shield_of_the_righteous_divine_purpose 132403)
	SpellInfo(shield_of_the_righteous_divine_purpose cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellAddBuff(shield_of_the_righteous_divine_purpose alabaster_shield=0 bastion_of_glory=1 divine_purpose=0 shield_of_the_righteous_buff=1)
Define(shield_of_the_righteous_buff 132403)
	SpellInfo(shield_of_the_righteous_buff duration=3)
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
	SpellAddBuff(word_of_glory bastion_of_glory=0 divine_purpose=0)
Define(word_of_glory_divine_purpose 130551)
	SpellAddBuff(word_of_glory_divine_purpose bastion_of_glory=0 divine_purpose=0)
Define(word_of_glory_glyphed 136494)
	SpellInfo(word_of_glory_glyphed holy=1)
	SpellAddBuff(word_of_glory_glyphed bastion_of_glory=0 divine_purpose=0)

# Items
Define(tier15_4pc_melee 138169)
Define(mogu_power_potion 76095)
Define(mogu_power_potion_buff 105706)
	SpellInfo(mogu_power_potion_buff duration=25)

# Racials
Define(arcane_torrent_mana 28730)
	SpellInfo(arcane_torrent_mana cd=120)
Define(stoneform 20594)
	SpellInfo(stoneform cd=120 duration=8)
	SpellAddBuff(stoneform stoneform=1)

AddFunction UseRacialInterruptActions
{
	if target.Classification(worldboss no)
	{
		Spell(arcane_torrent_mana)
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

AddFunction PreCombatBuffActions
{
	if InCombat(no)
	{
		if BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_kings)
		if BuffExpires(mastery 400 any=1) and BuffExpires(str_agi_int 400 any=1) Spell(blessing_of_might)
	}
}

AddFunction BuffActions
{
	if BuffExpires(str_agi_int any=1) Spell(blessing_of_kings)
	if BuffExpires(mastery any=1) and BuffExpires(str_agi_int any=1) Spell(blessing_of_might)
}

AddFunction HasMaxHolyPower
{
	# Boundless Conviction is a level 85 ability.
	BuffPresent(divine_purpose) or HolyPower() ==5 or {Level() <85 and HolyPower() >=3}
}

AddFunction HasThreeHolyPower
{
	BuffPresent(divine_purpose) or HolyPower() >=3
}

AddFunction Interrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		if target.InRange(rebuke) Spell(rebuke)
		if target.Classification(worldboss no)
		{
			if TalentPoints(fist_of_justice_talent) and target.InRange(fist_of_justice) Spell(fist_of_justice)
			if not TalentPoints(fist_of_justice_talent) and target.InRange(hammer_of_justice) Spell(hammer_of_justice)
			#Spell(blinding_light)
		}
		UseRacialInterruptActions()
	}
}

AddFunction Tier6TalentActions
{
	if TalentPoints(holy_prism_talent) Spell(holy_prism)
	if TalentPoints(lights_hammer_talent) Spell(lights_hammer)
	if TalentPoints(execution_sentence_talent) Spell(execution_sentence)
}

AddFunction WordOfGlory
{
	if BuffPresent(divine_purpose) Spell(word_of_glory_divine_purpose)
	if BuffExpires(divine_purpose) Spell(word_of_glory)
}

###
### Holy
###

AddFunction HolyPreCombatActions
{
	PreCombatBuffActions()
	if not Stance(paladin_seal_of_insight) Spell(seal_of_insight)
}

### Holy Icons

# Damage reduction cooldowns.
AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_left
{
	Spell(divine_protection)
	Spell(devotion_aura)
	UseRacialSurvivalActions()
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_left
{
	if ManaPercent() <98 Spell(arcane_torrent_mana)
	if ManaPercent() <88 Spell(divine_plea)
	# Show "dash" icon if not in melee range.
	if target.IsFriend(no) and not target.InRange(crusader_strike) Texture(ability_druid_dash)
}

AddIcon mastery=1 help=shortcd
{
	Tier6TalentActions()
}

AddIcon mastery=1 help=main
{
	HolyPreCombatActions()
	BuffActions()
	if HasMaxHolyPower()
	{
		if TalentPoints(eternal_flame_talent) Spell(eternal_flame)
		WordOfGlory()
	}
	if target.IsFriend(no) and target.InRange(crusader_strike) Spell(crusader_strike)
	Spell(holy_shock)
	Spell(divine_light)
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	HolyPreCombatActions()
	BuffActions()
	if HasMaxHolyPower()
	{
		if TalentPoints(eternal_flame_talent) Spell(eternal_flame)
		Spell(light_of_dawn)
	}
	if target.IsFriend(no) and target.InRange(crusader_strike) Spell(crusader_strike)
	Spell(holy_shock)
	Spell(holy_radiance)
}

AddIcon mastery=1 help=cd
{
	Interrupt()
	if IsRooted() Spell(hand_of_freedom)
	if TalentPoints(holy_avenger_talent) Spell(holy_avenger)
	Spell(avenging_wrath)
	Spell(divine_favor)
	Spell(guardian_of_ancient_kings_holy)
}

# Righteous Fury indicator.
AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	if BuffPresent(righteous_fury) Texture(spell_holy_sealoffury)
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Protection
###
# Rotations from from the Maintankadin thread "Theck's MATLAB thread - MoP/5.x":
#     http://maintankadin.failsafedesign.com/forum/viewtopic.php?f=6&t=32805
#
#     ^WB > CS > J > AS > HW > Cons > SotR (default)
#     ^WB > EF[buffEF<2.5] > CS > J > AS > HW > Cons > SotR5 (Eternal Flame)
#     ^WB > CS > J > AS > HW > Cons > SS > SotR (Sacred Shield)
#     ^WB > SotR > J > CS > AS > HW > Cons (Sanctified Wrath)

# Protection rotation.
AddListItem(opt_prot_rotation balanced "Balanced rotation" default mastery=2)
AddListItem(opt_prot_rotation max_dps "Max DPS rotation" mastery=2)
AddListItem(opt_prot_rotation max_survival "Max survival rotation" mastery=2)

AddFunction Consecration
{
	if Glyph(glyph_of_consecration) Spell(consecration_glyphed)
	if Glyph(glyph_of_consecration no) Spell(consecration)
}

AddFunction ShieldOfTheRighteous
{
	if BuffPresent(divine_purpose) Spell(shield_of_the_righteous_divine_purpose)
	if BuffExpires(divine_purpose) Spell(shield_of_the_righteous)
}

AddFunction ProtectionPreCombatActions
{
	PreCombatBuffActions()
	if InCombat(no)
	{
		if not Stance(paladin_seal_of_insight) Spell(seal_of_insight)
		if BuffRemains(sacred_shield) <12 Spell(sacred_shield)
	}
}

AddFunction ProtectionHolyPowerGeneratorActions
{
	# ^WB > CS > J > AS+
	if target.DebuffExpires(weakened_blows) Spell(hammer_of_the_righteous)
	if BuffPresent(sanctified_wrath)
	{
		Spell(judgment)
		Spell(crusader_strike)
	}
	if BuffExpires(sanctified_wrath)
	{
		Spell(crusader_strike)
		Spell(judgment)
	}
	if BuffPresent(grand_crusader) Spell(avengers_shield)
}

AddFunction ProtectionFillerActions
{
	# AS > L90 > (MaxSurv: SS[buffSS<5]) > HW > HoW > Cons > SS
	Spell(avengers_shield)
	#Tier6TalentActions()
	if List(opt_prot_rotation max_survival) and TalentPoints(sacred_shield_talent) and BuffRemains(sacred_shield) <5 Spell(sacred_shield)
	Spell(holy_wrath)
	Spell(hammer_of_wrath usable=1)
	Consecration()
	if TalentPoints(sacred_shield_talent) Spell(sacred_shield)
	if TalentPoints(selfless_healer_talent) and BuffStacks(selfless_healer) >=3 Spell(flash_of_light)
}

AddFunction ProtectionTruckActions
{
	# L90[health_pct<20] > HoW > AS
	#if target.HealthPercent() <20 Tier6TalentActions()
	if Glyph(glyph_of_focused_shield) Spell(avengers_shield)
	Spell(hammer_of_wrath usable=1)
	Spell(avengers_shield)
}

AddFunction ProtectionTier6TalentActions
{
	# Truck actions.
	if List(opt_prot_rotation max_dps) and target.HealthPercent() <20 Tier6TalentActions()
	# Filler actions (after holy power generator actions).
	unless {target.DebuffExpires(weakened_blows) and Spell(hammer_of_the_righteous)}
		or Spell(judgment)
		or Spell(crusader_strike)
		or Spell(avengers_shield)
	{
		Tier6TalentActions()
	}
}

### Protection Icons

# Damage reduction cooldowns.
AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_left
{
	Spell(divine_protection)
	Spell(ardent_defender)
	Spell(devotion_aura)
	UseRacialSurvivalActions()
}

# Cooldowns that apply Forbearance.
AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_left
{
	if DebuffExpires(forbearance)
	{
		Spell(lay_on_hands)
		Spell(hand_of_protection)
		Spell(divine_shield)
	}
}

# Defensive abilities.
AddIcon mastery=2 help=shortcd
{
	if BuffExpires(righteous_fury) Spell(righteous_fury)
	if TalentPoints(eternal_flame_talent)
	{
		# EF[buffEF<2.5]
		if {BuffPresent(divine_purpose) or HolyPower() >=1} and BuffRemains(eternal_flame) <2.5 Spell(eternal_flame)
		# SotR5
		if BuffExpires(shield_of_the_righteous_buff) and HasMaxHolyPower() ShieldOfTheRighteous()
	}
	if not TalentPoints(eternal_flame_talent)
	{
		# SotR
		if HasThreeHolyPower()
		{
			if BuffPresent(shield_of_the_righteous_buff) and HealthPercent() <60 WordOfGlory()
			ShieldOfTheRighteous()
		}
	}
	ProtectionTier6TalentActions()
}

AddIcon mastery=2 help=main
{
	ProtectionPreCombatActions()
	BuffActions()

	if List(opt_prot_rotation max_dps) ProtectionTruckActions()
	ProtectionHolyPowerGeneratorActions()
	ProtectionFillerActions()
}

AddIcon mastery=2 help=aoe
{
	ProtectionPreCombatActions()
	BuffActions()

	# HotR > AS > Cons > J > HW
	Spell(hammer_of_the_righteous)
	if not List(opt_prot_rotation max_dps) Spell(judgment)
	Spell(avengers_shield)
	Consecration()
	Spell(judgment)
	Spell(holy_wrath)
}

AddIcon mastery=2 help=cd
{
	Interrupt()
	if IsRooted() Spell(hand_of_freedom)
	Spell(avenging_wrath)
	if TalentPoints(holy_avenger_talent) Spell(holy_avenger)
}

# Righteous Fury indicator.
AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_right
{
	if BuffPresent(righteous_fury) Texture(spell_holy_sealoffury)
}

AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Retribution
###

AddFunction RetributionUsePotion
{
	#mogu_power_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(mogu_power_potion usable=1)
}

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
		#seal_of_truth,if=active_enemies<4
		if Enemies() <4 and not Stance(paladin_seal_of_truth) Spell(seal_of_truth)
		#seal_of_righteousness,if=active_enemies>=4
		if Enemies() >=4 and not Stance(paladin_seal_of_righteousness) Spell(seal_of_righteousness)
		#snapshot_stats
		#mogu_power_potion
		RetributionUsePotion()
	}

	#rebuke
	Interrupt()
	#mogu_power_potion,if=(buff.bloodlust.react|(buff.ancient_power.up&buff.avenging_wrath.up)|target.time_to_die<=40)
	if BuffPresent(burst_haste any=1) or {BuffPresent(ancient_power) and BuffPresent(avenging_wrath)} or target.TimeToDie() <=40 RetributionUsePotion()
	#auto_attack
	#inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*10|buff.divine_purpose.react)
	if BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)} Spell(inquisition)
	# // Avenging Wrath
	{
		#avenging_wrath,if=buff.inquisition.up&(cooldown.guardian_of_ancient_kings.remains<291)
		#avenging_wrath,if=buff.inquisition.up
		if BuffPresent(inquisition)
			and {{not TalentPoints(sanctified_wrath_talent)
					and SpellKnown(guardian_of_ancient_kings_retribution)
					and SpellCooldown(guardian_of_ancient_kings_retribution) <291}
				or TalentPoints(sanctified_wrath_talent)
				or not SpellKnown(guardian_of_ancient_kings_retribution)}
		{
			Spell(avenging_wrath)
		}
	}
	# // Guardian of Ancient Kings
	{
		#guardian_of_ancient_kings,if=cooldown.avenging_wrath.remains<10|target.time_to_die<=60
		#guardian_of_ancient_kings,if=buff.avenging_wrath.up|target.time_to_die<=60
		if {not TalentPoints(sanctified_wrath_talent) and SpellKnown(avenging_wrath) and SpellCooldown(avenging_wrath) <10}
			or {TalentPoints(sanctified_wrath_talent) and BuffPresent(avenging_wrath)}
			or not SpellKnown(avenging_wrath)
			or target.TimeToDie() <=60
		{
			Spell(guardian_of_ancient_kings_retribution)
		}
	}
	# // Holy Avenger
	if TalentPoints(holy_avenger_talent)
	{
		#holy_avenger,if=buff.inquisition.up&(cooldown.guardian_of_ancient_kings.remains<289)&holy_power<=2
		if BuffPresent(inquisition) and HolyPower() <=2 and SpellCooldown(guardian_of_ancient_kings_retribution) <289 Spell(holy_avenger)
	}
	#use_item,name=reinbinders_fists,if=buff.inquisition.up
	if BuffPresent(inquisition) and {TalentPoints(sanctified_wrath_talent) or TimeInCombat() >=14} UseItemActions()
	# // Execution Sentence and Light's Hammer
	{
		#execution_sentence,if=buff.inquisition.up&(buff.ancient_power.down|buff.ancient_power.stack=20)
		#execution_sentence,if=buff.inquisition.up&time>=15
		#lights_hammer,if=buff.inquisition.up&(buff.ancient_power.down|buff.ancient_power.stack=20)
		#lights_hammer,if=buff.inquisition.up&time>=15
		if BuffPresent(inquisition)
			and {{TalentPoints(sanctified_wrath_talent) and {BuffExpires(ancient_power) or BuffStacks(ancient_power) ==20}}
				or {not TalentPoints(sanctified_wrath_talent) and TimeInCombat() >=15}}
		{
			if TalentPoints(execution_sentence_talent) Spell(execution_sentence)
			if TalentPoints(lights_hammer_talent) Spell(lights_hammer)
		}
	}
	if HasMaxHolyPower() or {BuffPresent(holy_avenger) and HolyPower() >=3}
	{
		#divine_storm,if=active_enemies>=2&(holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3))
		if Enemies() >=2 Spell(divine_storm)
		#templars_verdict,if=holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3)
		Spell(templars_verdict)
	}
	#hammer_of_wrath
	{
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.2
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.1
		if TalentPoints(sanctified_wrath_talent) Spell(hammer_of_wrath usable=1 wait=0.2)
		if not TalentPoints(sanctified_wrath_talent) Spell(hammer_of_wrath usable=1 wait=0.1)
	}
	#crusader_strike
	{
		#wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.2
		Spell(crusader_strike wait=0.2)
	}
	#exorcism,if=active_enemies>=2&active_enemies<=4&set_bonus.tier15_2pc_melee&glyph.mass_exorcism.enabled
	if Enemies() >=2 and Enemies() <=4 and ArmorSetParts(T15_melee) >=2 and Glyph(glyph_of_mass_exorcism) Spell(exorcism_glyphed)
	#hammer_of_the_righteous,if=active_enemies>=4
	if Enemies() >=4 Spell(hammer_of_the_righteous)
	#templars_verdict,if=buff.avenging_wrath.up
	if BuffPresent(avenging_wrath) Spell(templars_verdict)
	#judgment,target=2,if=active_enemies>=2&buff.glyph_double_jeopardy.up
	if BuffPresent(glyph_of_double_jeopardy_aura) and Enemies() >=2 Spell(judgment)
	#judgment
	{
		#wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.2
		Spell(judgment wait=0.2)
	}
	#exorcism
	{
		#wait,sec=cooldown.exorcism.remains,if=cooldown.exorcism.remains>0&cooldown.exorcism.remains<=0.2
		if Glyph(glyph_of_mass_exorcism) Spell(exorcism_glyphed wait=0.2)
		if Glyph(glyph_of_mass_exorcism no) Spell(exorcism wait=0.2)
	}
	#templars_verdict,if=buff.tier15_4pc_melee.up
	if BuffPresent(tier15_4pc_melee) Spell(templars_verdict)
	if BuffRemains(inquisition) >4
	{
		#divine_storm,if=active_enemies>=2&buff.inquisition.remains>4
		if Enemies() >=2 Spell(divine_storm)
		#templars_verdict,if=buff.inquisition.remains>4
		Spell(templars_verdict)
	}
	#holy_prism
	if TalentPoints(holy_prism_talent) Spell(holy_prism)
}

AddFunction RetributionPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=winters_bite
		#food,type=black_pepper_ribs_and_shrimp
		PreCombatBuffActions()
		#seal_of_truth,if=active_enemies<4
		if not Stance(paladin_seal_of_truth) Spell(seal_of_truth)
		#snapshot_stats
	}
}

AddFunction RetributionMainActions
{
	#auto_attack
	#inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*10|buff.divine_purpose.react)
	if BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)} Spell(inquisition)
	if HasMaxHolyPower() or {BuffPresent(holy_avenger) and HolyPower() >=3}
	{
		#templars_verdict,if=holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3)
		Spell(templars_verdict)
	}
	#hammer_of_wrath
	{
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.2
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.1
		if TalentPoints(sanctified_wrath_talent) Spell(hammer_of_wrath usable=1 wait=0.2)
		if not TalentPoints(sanctified_wrath_talent) Spell(hammer_of_wrath usable=1 wait=0.1)
	}
	#crusader_strike
	{
		#wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.2
		Spell(crusader_strike wait=0.2)
	}
	#templars_verdict,if=buff.avenging_wrath.up
	if BuffPresent(avenging_wrath) Spell(templars_verdict)
	#judgment
	{
		#wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.2
		Spell(judgment wait=0.2)
	}
	#exorcism
	{
		#wait,sec=cooldown.exorcism.remains,if=cooldown.exorcism.remains>0&cooldown.exorcism.remains<=0.2
		if Glyph(glyph_of_mass_exorcism) Spell(exorcism_glyphed wait=0.2)
		if Glyph(glyph_of_mass_exorcism no) Spell(exorcism wait=0.2)
	}
	#templars_verdict,if=buff.tier15_4pc_melee.up
	if BuffPresent(tier15_4pc_melee) Spell(templars_verdict)
	if BuffRemains(inquisition) >4
	{
		#templars_verdict,if=buff.inquisition.remains>4
		Spell(templars_verdict)
	}
	#holy_prism
	if TalentPoints(holy_prism_talent) Spell(holy_prism)
}

AddFunction RetributionAoEActions
{
	#auto_attack
	#inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*10|buff.divine_purpose.react)
	if BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)} Spell(inquisition)
	if HasMaxHolyPower() or {BuffPresent(holy_avenger) and HolyPower() >=3}
	{
		#divine_storm,if=active_enemies>=2&(holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3))
		Spell(divine_storm)
	}
	#hammer_of_wrath
	{
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.2
		#wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.1
		if TalentPoints(sanctified_wrath_talent) Spell(hammer_of_wrath usable=1 wait=0.2)
		if not TalentPoints(sanctified_wrath_talent) Spell(hammer_of_wrath usable=1 wait=0.1)
	}
	#crusader_strike
	{
		#wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.2
		Spell(crusader_strike wait=0.2)
	}
	#exorcism,if=active_enemies>=2&active_enemies<=4&set_bonus.tier15_2pc_melee&glyph.mass_exorcism.enabled
	if Enemies() <=4 and ArmorSetParts(T15_melee) >=2 and Glyph(glyph_of_mass_exorcism) Spell(exorcism_glyphed)
	#hammer_of_the_righteous,if=active_enemies>=4
	if Enemies() >=4 Spell(hammer_of_the_righteous)
	#templars_verdict,if=buff.avenging_wrath.up
	if BuffPresent(avenging_wrath) Spell(templars_verdict)
	#judgment,target=2,if=active_enemies>=2&buff.glyph_double_jeopardy.up
	if BuffPresent(glyph_of_double_jeopardy_aura) Spell(judgment)
	#judgment
	{
		#wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.2
		Spell(judgment wait=0.2)
	}
	#exorcism
	{
		#wait,sec=cooldown.exorcism.remains,if=cooldown.exorcism.remains>0&cooldown.exorcism.remains<=0.2
		if Glyph(glyph_of_mass_exorcism) Spell(exorcism_glyphed wait=0.2)
		if Glyph(glyph_of_mass_exorcism no) Spell(exorcism wait=0.2)
	}
	#templars_verdict,if=buff.tier15_4pc_melee.up
	if BuffPresent(tier15_4pc_melee) Spell(templars_verdict)
	if BuffRemains(inquisition) >4
	{
		#divine_storm,if=active_enemies>=2&buff.inquisition.remains>4
		Spell(divine_storm)
	}
	#holy_prism
	if TalentPoints(holy_prism_talent) Spell(holy_prism)
}

AddFunction RetributionShortCooldownActions
{
	#inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*10|buff.divine_purpose.react)
	unless BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)}
	{
		# // Avenging Wrath
		{
			#avenging_wrath,if=buff.inquisition.up&(cooldown.guardian_of_ancient_kings.remains<291)
			#avenging_wrath,if=buff.inquisition.up
			if BuffPresent(inquisition)
				and {{not TalentPoints(sanctified_wrath_talent)
						and SpellKnown(guardian_of_ancient_kings_retribution)
						and SpellCooldown(guardian_of_ancient_kings_retribution) <291}
					or TalentPoints(sanctified_wrath_talent)
					or not SpellKnown(guardian_of_ancient_kings_retribution)}
			{
				Spell(avenging_wrath)
			}
		}
		# // Execution Sentence and Light's Hammer
		{
			#execution_sentence,if=buff.inquisition.up&(buff.ancient_power.down|buff.ancient_power.stack=20)
			#execution_sentence,if=buff.inquisition.up&time>=15
			#lights_hammer,if=buff.inquisition.up&(buff.ancient_power.down|buff.ancient_power.stack=20)
			#lights_hammer,if=buff.inquisition.up&time>=15
			if BuffPresent(inquisition)
				and {{TalentPoints(sanctified_wrath_talent) and {BuffExpires(ancient_power) or BuffStacks(ancient_power) ==20}}
					or {not TalentPoints(sanctified_wrath_talent) and TimeInCombat() >=15}}
			{
				if TalentPoints(execution_sentence_talent) Spell(execution_sentence)
				if TalentPoints(lights_hammer_talent) Spell(lights_hammer)
			}
		}
	}
}

AddFunction RetributionCooldownActions
{
	if InCombat(no)
	{
		#mogu_power_potion
		RetributionUsePotion()
	}

	#rebuke
	Interrupt()
	#mogu_power_potion,if=(buff.bloodlust.react|(buff.ancient_power.up&buff.avenging_wrath.up)|target.time_to_die<=40)
	if BuffPresent(burst_haste any=1) or {BuffPresent(ancient_power) and BuffPresent(avenging_wrath)} or target.TimeToDie() <=40 RetributionUsePotion()

	unless BuffRemains(inquisition) <=2 and {HolyPower() >=3 or target.TimeToDie() < HolyPower() *10 or BuffPresent(divine_purpose)}
	{
		# // Guardian of Ancient Kings
		{
			#guardian_of_ancient_kings,if=cooldown.avenging_wrath.remains<10|target.time_to_die<=60
			#guardian_of_ancient_kings,if=buff.avenging_wrath.up|target.time_to_die<=60
			if {not TalentPoints(sanctified_wrath_talent) and SpellKnown(avenging_wrath) and SpellCooldown(avenging_wrath) <10}
				or {TalentPoints(sanctified_wrath_talent) and BuffPresent(avenging_wrath)}
				or not SpellKnown(avenging_wrath)
				or target.TimeToDie() <=60
			{
				Spell(guardian_of_ancient_kings_retribution)
			}
		}
		# // Holy Avenger
		if TalentPoints(holy_avenger_talent)
		{
			#holy_avenger,if=buff.inquisition.up&(cooldown.guardian_of_ancient_kings.remains<289)&holy_power<=2
			if BuffPresent(inquisition) and HolyPower() <=2 and SpellCooldown(guardian_of_ancient_kings_retribution) <289 Spell(holy_avenger)
		}
		#use_item,name=reinbinders_fists,if=buff.inquisition.up
		if BuffPresent(inquisition) and {TalentPoints(sanctified_wrath_talent) or TimeInCombat() >=14} UseItemActions()
	}
}

### Retribution Icons

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	if IsRooted()
	{
		Spell(hand_of_freedom)
		Spell(emancipate)
	}
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	Spell(lay_on_hands)
	Spell(hand_of_protection)
	if DebuffExpires(forbearance) Spell(divine_shield)
}

AddIcon mastery=3 help=shortcd
{
	RetributionShortCooldownActions()
}

AddIcon mastery=3 help=main
{
	RetributionPreCombatActions()
	BuffActions()
	RetributionMainActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	BuffActions()
	RetributionAoEActions()
}

AddIcon mastery=3 help=cd
{
	RetributionCooldownActions()
}

# Righteous Fury indicator.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	if BuffPresent(righteous_fury) Texture(spell_holy_sealoffury)
	if Enemies() >=4 and not Stance(paladin_seal_of_righteousness) Spell(seal_of_righteousness)
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]],
}
