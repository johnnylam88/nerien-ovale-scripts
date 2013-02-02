if NerienOvaleScripts.class == "DRUID" then

NerienOvaleScripts.script.DRUID.Nerien = {
	desc = "[5.1] Nerien: Feral, Guardian",
	code =
[[
# Nerien's druid script based on SimulationCraft
#
# Feral:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#UZ!.0.0.1
#	glyphs=savagery
#
# Guardian:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Ub!...1..

# Spells.
Define(aquatic_form 1066)
	SpellInfo(aquatic_form duration=86400 rage=-10)
	SpellAddBuff(aquatic_form aquatic_form=1)
Define(astral_communion 127663)
	SpellInfo(astral_communion canStopChannelling=4 duration=4 tick=1)
	SpellAddBuff(astral_communion astral_communion=1)
Define(astral_storm 106996)
	SpellInfo(astral_storm canStopChannelling=10 duration=10 tick=1)
Define(barkskin 22812)
	SpellInfo(barkskin cd=60 duration=12)
	SpellInfo(barkskin addcd=-15 mastery=4)
	SpellAddBuff(barkskin barkskin=1)
Define(bear_form 5487)
	SpellInfo(bear_form duration=86400 rage=-10)
	SpellAddBuff(bear_form bear_form=1)
Define(bear_hug 102795)
	SpellInfo(bear_hug cd=60 duration=3)
	SpellAddDebuff(bear_hug bear_hug=1)
Define(berserk 106952)
Define(berserk_bear 50334)
	SpellInfo(berserk_bear cd=180 duration=10)
	SpellAddBuff(berserk_bear berserk_bear=1)
Define(berserk_cat 106951)
	SpellInfo(berserk_cat cd=180 duration=15)
	SpellAddBuff(berserk_cat berserk_cat=1)
Define(cat_form 768)
	SpellInfo(cat_form duration=86400)
	SpellAddBuff(cat_form cat_form=1)
Define(celestial_alignment 112071)
	SpellInfo(celestial_alignment cd=180 duration=15)
	SpellAddBuff(celestial_alignment celestial_alignment=1)
Define(cenarion_ward 102351)
	SpellInfo(cenarion_ward cd=30 duration=30)
Define(cenarion_ward_hot 102352)
	SpellInfo(cenarion_ward_hot duration=6 tick=2)
Define(cenarion_ward_talent 6)
Define(chosen_of_elune 102560)
	SpellInfo(chosen_of_elune cd=180 duration=30)
Define(clearcasting 16870)
Define(cyclone 33786)
	SpellAddBuff(cyclone natures_swiftness=0 predatory_swiftness=0)
Define(dash 1850)
	SpellInfo(dash cd=180 duration=15)
	SpellInfo(dash addcd=-60 glyph=glyph_of_dash)
Define(disorienting_roar 99)
	SpellInfo(disorienting_roar cd=30)
Define(disorienting_roar_talent 10)
Define(displacer_beast 102280)
	SpellInfo(displacer_beast cd=30)
	SpellAddBuff(displacer_beast cat_form=1 displacer_beast_buff=1 prowl=1)
Define(displacer_beast_buff 137452)
	SpellInfo(displacer_beast_buff duration=4)
Define(displacer_beast_talent 2)
Define(dream_of_cenarius_damage 108381)
	SpellInfo(dream_of_cenarius_damage duration=30)
Define(dream_of_cenarius_heal 108382)
	SpellInfo(dream_of_cenarius_heal duration=30)
Define(dream_of_cenarius_talent 17)
Define(enrage 5229)
	SpellInfo(enrage cd=60 duration=10 rage=-20)
	SpellAddBuff(enrage enrage=1)
Define(entangling_roots 339)
	SpellAddBuff(entangling_roots natures_swiftness=0 predatory_swiftness=0)
Define(fae_silence 114238)
	SpellInfo(fae_silence duration=3)
Define(faerie_fire 770)
	SpellInfo(faerie_fire duration=300)
	SpellInfo(faerie_fire cd=6 if_stance=1)
	SpellInfo(faerie_fire cd=6 if_stance=3)
	SpellInfo(faerie_fire cd=15 glyph=glyph_of_fae_silence)
	SpellAddTargetDebuff(faerie_fire faerie_fire=1 weakened_armor=1)
Define(faerie_swarm 102355)
	SpellInfo(faerie_swarm duration=300)
	SpellInfo(faerie_swarm cd=6 if_stance=1)
	SpellInfo(faerie_swarm cd=6 if_stance=3)
	SpellInfo(faerie_swarm cd=15 glyph=glyph_of_fae_silence)
	SpellAddTargetDebuff(faerie_swarm faerie_swarm=1 weakened_armor=1)
Define(faerie_swarm_talent 7)
Define(feline_swiftness_talent 1)
Define(ferocious_bite 22568)
	SpellInfo(ferocious_bite combo=0 energy=25)
	# Ferocious Bite does ((316 to 658) + 762 * CP + 0.196 * AP * CP) damage (from Wowhead).
	# Average the base damage to (316 + 658) / 2 = 487.
	SpellInfo(ferocious_bite base=487 bonuscp=762 bonusapcp=0.196)
	SpellDamageBuff(ferocious_bite dream_of_cenarius_damage=1.25)
Define(force_of_nature_talent 12)
Define(frenzied_regeneration 22842)
	SpellInfo(frenzied_regeneration cd=1.5)
Define(frenzied_regeneration_glyphed 124769)
	SpellInfo(frenzied_regeneration_glyphed duration=6)
	SpellAddBuff(frenzied_regeneration_glyphed frenzied_regeneration_glyphed=1)
Define(glyph_of_blooming 121840)
Define(glyph_of_dash 59219)
Define(glyph_of_fae_silence 114237)
Define(glyph_of_frenzied_regeneration 54810)
Define(glyph_of_might_of_ursoc 116238)
Define(glyph_of_natures_grasp 116203)
Define(glyph_of_savagery 127540)
Define(glyph_of_shred 114234)
Define(glyph_of_skull_bash 116216)
Define(glyph_of_survival_instincts 114223)
Define(glyph_of_wild_growth 62970)
Define(growl 6795)
	SpellInfo(growl cd=8)
	SpellAddBuff(growl bear_form=1)
Define(healing_touch 5185)
	SpellAddBuff(healing_touch natures_swiftness=0 predatory_swiftness=0)
Define(heart_of_the_wild 108292)
	SpellInfo(heart_of_the_wild cd=360)
	SpellAddBuff(heart_of_the_wild heart_of_the_wild=1)
Define(heart_of_the_wild_talent 16)
Define(hibernate 2637)
	SpellAddBuff(hibernate natures_swiftness=0 predatory_swiftness=0)
Define(hurricane 16914)
	SpellInfo(hurricane canStopChannelling=10 duration=10 tick=1)
Define(incarnation 106731)
	SpellInfo(incarnation cd=180)
Define(incarnation_talent 11)
Define(infected_wounds 58180)
    SpellInfo(infected_wounds duration=12)
Define(innervate 29166)
	SpellInfo(innervate cd=180 duration=10 tick=1)
Define(ironbark 102342)
	SpellInfo(ironbark cd=120 duration=12)
	SpellAddTargetBuff(ironbark ironbark=1)
Define(king_of_the_jungle 102543)
	SpellInfo(king_of_the_jungle cd=180 duration=30)
Define(lacerate 33745)
	SpellInfo(lacerate cd=3 duration=15 tick=3)
	SpellAddTargetDebuff(lacerate lacerate=1)
Define(lifebloom 33763)
	SpellInfo(lifebloom duration=15 tick=1)
	SpellInfo(lifebloom addduration=-5 glyph=glyph_of_blooming)
Define(living_seed 48504)
	SpellInfo(living_seed duration=15)
Define(lunar_shower 81192)
	SpellInfo(lunar_shower duration=3)
Define(maim 22570)
	SpellInfo(maim cd=10 combo=0 energy=35)
Define(mangle 33917)
Define(mangle_bear 33878)
	SpellInfo(mangle_bear buffnocd=berserk_bear cd=6 rage=-5)
	SpellInfo(mangle_bear rage=-7 talent=soul_of_the_forest_talent)
	SpellAddTargetDebuff(mangle_bear infected_wounds=1)
Define(mangle_cat 33876)
	SpellInfo(mangle_cat combo=1 energy=35 inccounter=ripshreds)
	SpellInfo(mangle_cat critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(mangle_cat infected_wounds=1)
Define(mark_of_the_wild 1126)
	SpellInfo(mark_of_the_wild duration=3600)
	SpellAddBuff(mark_of_the_wild mark_of_the_wild=1)
Define(mass_entanglement cd=120 duration=20)
Define(mass_entanglement_talent 8)
Define(maul 6807)
	SpellInfo(maul cd=3 rage=30)
	SpellAddTargetDebuff(maul infected_wounds=1)
Define(might_of_ursoc 106922)
	SpellInfo(might_of_ursoc cd=180 duration=20)
	SpellInfo(might_of_ursoc addcd=120 glyph=glyph_of_might_of_ursoc)
	SpellInfo(might_of_ursoc addcd=-60 itemset=T14_tank itemcount=2)
	SpellAddBuff(might_of_ursoc bear_form=1 might_of_ursoc=1)
Define(mighty_bash 5211)
	SpellInfo(mighty_bash cd=50 duration=5)
	SpellAddTargetDebuff(mighty_bash mighty_bash=1)
Define(mighty_bash_talent 15)
Define(moonfire 8921)
	SpellInfo(moonfire duration=14 tick=2)
	SpellInfo(moonfire addduration=2 itemset=T14_caster itemcount=4)
	SpellAddTargetDebuff(moonfire moonfire=1)
Define(moonkin_form 24858)
	SpellInfo(moonkin_form duration=86400)
	SpellAddBuff(moonkin_form moonkin_form=1)
Define(natures_cure 88423)
	SpellInfo(natures_cure cd=8)
Define(natures_grasp 16689)
	SpellInfo(natures_grasp cd=60 duration=45)
	SpellInfo(natures_grasp addcd=-30 glyph=glyph_of_natures_grasp)
Define(natures_swiftness 132158)
	SpellInfo(natures_swiftness cd=60 duration=86400)
	SpellAddBuff(natures_swiftness natures_swiftness=1)
Define(natures_swiftness_talent 4)
Define(natures_vigil 124974)
	SpellInfo(natures_vigil cd=180 duration=30)
	SpellAddBuff(natures_vigil natures_vigil=1)
Define(natures_vigil_talent 18)
Define(nourish 50464)
	SpellAddBuff(nourish natures_swiftness=0)
Define(omen_of_clarity 135700)
Define(owlkin_frenzy 48391)
	SpellInfo(owlkin_frenzy duration=10)
Define(pounce 9005)
	SpellInfo(pounce combo=1 energy=50)
	SpellAddTargetDebuff(pounce pounce_bleed=1)
Define(pounce_incarnation 102546)
	SpellInfo(pounce_incarnation combo=1 energy=50)
	SpellAddTargetDebuff(pounce_incarnation pounce_bleed=1)
Define(pounce_bleed 9007)
	SpellInfo(pounce_bleed duration=18 tick=3)
Define(predatory_swiftness 69369)
	SpellInfo(predatory_swiftness duration=8)
Define(primal_fury 16961)
Define(prowl 5215)
	SpellInfo(prowl duration=1800)
	SpellAddBuff(prowl cat_form=1 prowl=1)
Define(prowl_incarnation 102547)
	SpellInfo(prowl_incarnation duration=1800)
	SpellAddBuff(prowl_incarnation cat_form=1 prowl_incarnation=1)
Define(rake 1822)
	SpellInfo(rake combo=1 duration=15 energy=35 tick=3)
	SpellInfo(rake critcombo=1 if_spell=primal_fury)
	# Damage(rake) = (99 + 0.3 * AP) damage per tick (from Catus).
	SpellInfo(rake base=99 bonusap=0.3)
	SpellDamageBuff(rake dream_of_cenarius_damage=1.25)
	SpellAddTargetDebuff(rake rake=1)
Define(ravage 6785)
	SpellInfo(ravage combo=1 energy=45 inccounter=ripshreds)
	SpellInfo(ravage critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(ravage infected_wounds=1)
Define(ravagebang 102545)
	SpellInfo(ravagebang combo=1 energy=0 inccounter=ripshreds)
	SpellInfo(ravagebang critcombo=1 if_spell=primal_fury)
	SpellAddBuff(ravagebang stampede=0)
	SpellAddTargetDebuff(ravagebang infected_wounds=1)
Define(rebirth 20484)
	SpellInfo(rebirth cd=600)
	SpellAddBuff(rebirth natures_swiftness=0 predatory_swiftness=0)
Define(regrowth 8936)
	SpellInfo(regrowth duration=6 tick=2)
	SpellAddBuff(regrowth natures_swiftness=0)
Define(rejuvenation 774)
	SpellInfo(rejuvenation duration=12 tick=3)
Define(remove_corruption 2782)
	SpellInfo(remove_corruption cd=8)
Define(renewal 108238)
	SpellInfo(renewal cd=120)
Define(renewal_talent 5)
Define(revive 50769)
Define(rip 1079)
	SpellInfo(rip combo=0 duration=16 energy=30 resetcounter=ripshreds tick=2)
	SpellInfo(rip addduration=4 itemset=T14_melee itemcount=4)
	# Rip does (113 + 320 * CP + 0.0484 * AP * CP * 8) damage over 16 seconds (from Wowhead).
	# Damage(rip) = (14.125 + 40 * CP + 0.0484 * AP * CP) damage per tick.
	SpellInfo(rip base=14.125 bonuscp=40 bonusapcp=0.0484)
	SpellDamageBuff(rip dream_of_cenarius_damage=1.25)
	SpellAddTargetDebuff(rip rip=1)
Define(savage_defense 62606)
	SpellInfo(savage_defense rage=60)
	SpellInfo(savage_defense itemset=T13 itemcount=2 rage=55)
	SpellAddBuff(savage_defense savage_defense_buff=1)
Define(savage_defense_buff 132402)
	SpellInfo(savage_defense_buff duration=6)
Define(savage_roar 52610)
	SpellInfo(savage_roar combo=0 duration=18 energy=25)
	SpellAddBuff(savage_roar savage_roar=1)
Define(savage_roar_glyphed 127538)
	SpellInfo(savage_roar_glyphed combo=-5 duration=18 energy=25)
	SpellAddBuff(savage_roar_glyphed savage_roar_glyphed=1)
SpellList(savage_roar_buff savage_roar savage_roar_glyphed)
Define(shooting_stars 93400)
	SpellInfo(shooting_stars duration=12)
Define(shred 5221)
	SpellInfo(shred combo=1 energy=40 inccounter=ripshreds)
	SpellInfo(shred critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(shred infected_wounds=1)
Define(shredbang 114236)
	SpellInfo(shredbang combo=1 energy=40 inccounter=ripshreds)
	SpellInfo(shredbang critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(shredbang infected_wounds=1)
Define(skull_bash_bear 106839)
	SpellInfo(skull_bash_bear cd=15)
	SpellInfo(skull_bash_bear addcd=10 glyph=glyph_of_skull_bash)
Define(skull_bash_cat 80965)
	SpellInfo(skull_bash_cat cd=15 energy=15)
	SpellInfo(skull_bash_cat addcd=10 glyph=glyph_of_skull_bash)
Define(solar_beam 78675)
	SpellInfo(solar_beam cd=60)
Define(son_of_ursoc 102558)
	SpellInfo(son_of_ursoc cd=180 duration=30)
Define(soothe 2908)
Define(soul_of_the_forest 114108)
	SpellInfo(soul_of_the_forest duration=6)
Define(soul_of_the_forest_talent 10)
Define(stampede 81022)
	SpellInfo(stampede duration=86400)
Define(stampeding_roar 106898)
	SpellInfo(stampeding_roar cd=120 duration=8)
	SpellAddBuff(stampeding_roar stampeding_roar=1)
Define(starfall 48505)
	SpellInfo(starfall cd=90 duration=10)
Define(starfire 2912)
Define(starsurge 78674)
	SpellInfo(starsurge cd=15)
	SpellAddBuff(starsurge shooting_stars=0)
Define(sunfire 93402)
	SpellInfo(sunfire duration=14 tick=2)
	SpellInfo(sunfire addduration=2 itemset=T14_caster itemcount=4)
	SpellAddTargetDebuff(sunfire sunfire=1)
Define(survival_instincts 61336)
	SpellInfo(survival_instincts cd=180 duration=12)
	SpellInfo(survival_instincts addcd=-60 duration=6 glyph=glyph_of_survival_instincts)
	SpellAddBuff(survival_instincts survival_instincts=1)
Define(swift_flight_form 40120)
	SpellInfo(swift_flight_form duration=86400)
	SpellAddBuff(swift_flight_form swift_flight_form=1)
Define(swipe 106785)
Define(swipe_bear 779)
	SpellInfo(swipe_bear cd=3 rage=15)
Define(swipe_cat 62078)
	SpellInfo(swipe_cat combo=1 energy=45)
Define(symbiosis 110309)
Define(thrash 106832)
Define(thrash_bear 77758)
	SpellInfo(thrash_bear cd=6 duration=16 tick=2)
	SpellAddTargetDebuff(thrash_bear thrash_bear=1 weakened_blows=1)
Define(thrash_cat 106830)
	SpellInfo(thrash_cat duration=15 energy=50 tick=3)
	SpellAddTargetDebuff(thrash_cat thrash_cat=1 weakened_blows=1)
Define(tigers_fury 5217)
	SpellInfo(tigers_fury cd=30 duration=6 energy=-60)
	SpellAddBuff(tigers_fury tigers_fury=1)
Define(tooth_and_claw 135286)
	SpellInfo(tooth_and_claw duration=10)
Define(tooth_and_claw_debuff 135601)
	SpellInfo(tooth_and_claw_debuff duration=15)
Define(tranquility 740)
	SpellInfo(tranquility canStopChannelling=4 cd=480 duration=8 tick=2)
Define(treants 106737)
	SpellInfo(treants cd=60)
Define(treants_balance 33831)
	SpellInfo(treants_balance cd=60)
Define(treants_feral 102703)
	SpellInfo(treants_feral cd=60)
Define(treants_guardian 102706)
	SpellInfo(treants_guardian cd=60)
Define(treants_restoration 102693)
	SpellInfo(treants_restoration cd=60)
Define(tree_of_life 33891)
	SpellInfo(tree_of_life cd=180 duration=30)
Define(typhoon 132469)
	SpellInfo(typhoon cd=20)
Define(typhoon_talent 9)
Define(ursols_vortex 102793)
	SpellInfo(ursols_vortex cd=60)
Define(ursols_vortex_talent 11)
Define(weakened_armor 113746)	# stacks 3 times
    SpellInfo(weakened_armor duration=30)
Define(weakened_blows 115798)
    SpellInfo(weakened_blows duration=30)
Define(wild_charge 102401)
	SpellInfo(wild_charge cd=15)
Define(wild_charge_bear 16979)
	SpellInfo(wild_charge_bear cd=15)
Define(wild_charge_cat 49376)
	SpellInfo(wild_charge_cat cd=15)
Define(wild_charge_moonkin 102383)
	SpellInfo(wild_charge_moonkin cd=15)
Define(wild_charge_talent 3)
Define(wild_growth 48438)
	SpellInfo(wild_growth cd=8 duration=7 tick=1)
	SpellInfo(wild_growth addcd=2 glyph=glyph_of_wild_growth)
Define(wild_mushroom 88747)
Define(wild_mushroom_bloom 102791)
	SpellInfo(wild_mushroom_bloom cd=10)
Define(wild_mushroom_detonate 88751)
	SpellInfo(wild_mushroom_detonate cd=10)
Define(wrath 5176)

# Items
Define(virmens_bite_potion 76089)
Define(virmens_bite_potion_buff 105697)
	SpellInfo(virmens_bite_potion_buff duration=25)

# Racials
Define(berserking 26297)
	SpellInfo(berserking cd=180 duration=10)
	SpellAddBuff(berserking berserking=1)

AddFunction UseRacialActions
{
	Spell(berserking)
}

AddCheckBox(aoe L(AOE))
AddCheckBox(potions "Use potions" default)

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
### Druid (all specializations)
###

# Show the full rotation in an extra icon.
AddCheckBox(full_rotation "Full rotation")

AddFunction FaerieFire
{
	if TalentPoints(faerie_swarm_talent) Spell(faerie_swarm)
	if not TalentPoints(faerie_swarm_talent) Spell(faerie_fire)
}

AddFunction FaerieFireReady
{
	{TalentPoints(faerie_swarm_talent) and Spell(faerie_swarm)}
		or {TalentPoints(faerie_swarm_talent) and Spell(faerie_fire)}
}

AddFunction RipDamageTillDead
{
	# The damage from Rip that is cast under the current conditions and lasting till target is dead.
	# Multiply the damage per tick with the number of ticks that can fit into the time to die.
	# XXX Should factor in crit somehow.
	Damage(rip) * {1 + Mastery() / 100} * {target.TimeToDie() / 2}
}

AddFunction ExistingRipDamageTillDead
{
	# The damage from Rip that is already on the target and lasting till target is dead.
	if target.DebuffPresent(rip)
	{
		# Multiply the damage per tick with the number of ticks that can fit into the time to die.
		# XXX Should factor in crit somehow.
		LastSpellEstimatedDamage(rip) * {1 + LastSpellMastery(rip) / 100} * {target.TimeToDie() / 2}
	}
	if not target.DebuffPresent(rip)
	{
		0
	}
}

###
### Feral
###

AddFunction FeralUsePotion
{
	#virmens_bite_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion)
}

AddFunction FeralSavageRoar
{
    if Glyph(glyph_of_savagery) Spell(savage_roar_glyphed)
    if Glyph(glyph_of_savagery no) and ComboPoints() >0 Spell(savage_roar)
}

AddFunction FeralSavageRoarReady
{
    {Glyph(glyph_of_savagery) and Spell(savage_roar_glyphed)}
		or {Glyph(glyph_of_savagery no) and ComboPoints() >0 and Spell(savage_roar)}
}

AddFunction FeralExecuteRange
{
	# At this target health percent, Ferocious Bite will automatically refresh Rip on the target.
	target.HealthPercent() <=25
}

AddFunction FeralInterrupt
{
	if target.InRange(skull_bash_cat) Spell(skull_bash_cat)
	if not target.Classification(worldboss)
	{
		if TalentPoints(mighty_bash_talent) and target.InRange(mighty_bash) Spell(mighty_bash)
		if TalentPoints(typhoon_talent) and target.InRange(skull_bash_cat) Spell(typhoon)
		if ComboPoints() >0 and target.InRange(maim) Spell(maim)
	}
}

AddFunction FeralPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#mark_of_the_wild,if=!aura.str_agi_int.up
		if BuffExpires(str_agi_int 400 any=1) Spell(mark_of_the_wild)
		#healing_touch,if=!buff.dream_of_cenarius_damage.up&talent.dream_of_cenarius.enabled
		if TalentPoints(dream_of_cenarius_talent) and BuffExpires(dream_of_cenarius_damage) Spell(healing_touch)
		#cat_form
		if BuffExpires(cat_form) Spell(cat_form)
		#savage_roar
		if Glyph(glyph_of_savagery no) or BuffRemains(savage_roar_buff) <8 FeralSavageRoar()
		#snapshot_stats
	}
}

AddFunction FeralBuffActions
{
	if BuffExpires(str_agi_int any=1) Spell(mark_of_the_wild)
	if BuffExpires(cat_form) Spell(cat_form)
}

AddFunction FeralFillerActions
{
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&combo_points>=5
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and ComboPoints() >=5 Spell(thrash_cat)
	if TalentPoints(incarnation_talent)
	{
		#ravage
		if BuffPresent(king_of_the_jungle) Spell(ravagebang usable=1)
		Spell(ravage usable=1)
	}
	if not TalentPoints(incarnation_talent) or BuffExpires(king_of_the_jungle)
	{
		#shred,if=buff.omen_of_clarity.react&buff.king_of_the_jungle.down
		if BuffPresent(omen_of_clarity) Spell(shred)
		#shred,if=buff.berserk.up&buff.king_of_the_jungle.down
		if BuffPresent(berserk_cat) Spell(shred)
		#mangle_cat,if=((combo_points<5&dot.rip.remains<3.0)|(combo_points=0&buff.savage_roar.remains<2))&buff.king_of_the_jungle.down
		if {ComboPoints() <5 and target.DebuffRemains(rip) <3} or {ComboPoints() ==0 and BuffRemains(savage_roar_buff) <2} Spell(mangle_cat)
		#shred,if=buff.king_of_the_jungle.down
		Spell(shred)
	}
}

### Feral rotation for talent builds with ``Dream of Cenarius''.

AddFunction FeralDreamOfCenariusFillerActions
{
	#run_action_list,name=filler,if=buff.omen_of_clarity.react
	if BuffPresent(omen_of_clarity) FeralFillerActions()
	#run_action_list,name=filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
	if {ComboPoints() <5 and target.DebuffRemains(rip) <3} or {ComboPoints() ==0 and BuffRemains(savage_roar_buff) <2} FeralFillerActions()
	#run_action_list,name=filler,if=buff.predatory_swiftness.remains>1
	if BuffRemains(predatory_swiftness) >1 FeralFillerActions()
	#run_action_list,name=filler,if=target.time_to_die<=8.5
	if target.TimeToDie() <=8.5 FeralFillerActions()
	#run_action_list,name=filler,if=buff.tigers_fury.up|buff.berserk.up
	if BuffPresent(tigers_fury) or BuffPresent(berserk_cat) FeralFillerActions()
	#run_action_list,name=filler,if=cooldown.tigers_fury.remains<=3
	if SpellCooldown(tigers_fury) <=3 FeralFillerActions()
	#run_action_list,name=filler,if=energy.time_to_max<=1
	if TimeToMaxEnergy() <=1 FeralFillerActions()
}

AddFunction FeralDreamOfCenariusFullRotation
{
	#auto_attack
	#skull_bash_cat
	if target.IsInterruptible() FeralInterrupt()
	#berserking
	UseRacialActions()
	#healing_touch,if=buff.predatory_swiftness.up&buff.predatory_swiftness.remains<=1.5&buff.dream_of_cenarius_damage.down
	if BuffPresent(predatory_swiftness) and BuffRemains(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage) Spell(healing_touch)
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor) <3 FaerieFire()
	#healing_touch,if=buff.predatory_swiftness.up&(combo_points>=4|(set_bonus.tier15_2pc_melee&combo_points>=3))&buff.dream_of_cenarius_damage.stack<2
	if BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2
		and {ComboPoints() >=4 or {ArmorSetParts(T15_melee) >=2 and ComboPoints() >=3}}
	{
		Spell(healing_touch)
	}
	#healing_touch,if=buff.natures_swiftness.up
	if BuffPresent(natures_swiftness) Spell(healing_touch)
	if not target.InRange(mangle_cat) Texture(ability_druid_catformattack)
	if TalentPoints(incarnation_talent)
	{
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		if Energy() <=35 and BuffExpires(omen_of_clarity) and Spell(tigers_fury) and Spell(berserk_cat) Spell(king_of_the_jungle)
	}
	#use_item,name=eternal_blossom_grips,sync=tigers_fury
	if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
	{
		UseItemActions()
	}
	#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
	if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	#berserk,if=buff.tigers_fury.up|(target.time_to_die<15&cooldown.tigers_fury.remains>6)
	if BuffPresent(tigers_fury) Spell(berserk_cat)
	if target.TimeToDie() <15 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	if FeralExecuteRange()
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		#natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&target.health.pct<=25
		if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 Spell(natures_swiftness)
		#virmens_bite_potion,if=(combo_points>=5&target.health.pct<=25&buff.dream_of_cenarius_damage.up)|target.time_to_die<=40
		if ComboPoints() >=5 and BuffPresent(dream_of_cenarius_damage) FeralUsePotion()
	}
	if target.TimeToDie() <=40 FeralUsePotion()
	#rip,line_cd=30,if=combo_points>=5&buff.virmens_bite_potion.up&buff.dream_of_cenarius_damage.up&target.health.pct<=25&target.time_to_die>30
	if FeralExecuteRange() and ComboPoints() >=5 and target.TimeToDie() >30
	{
		# Assume that FB will be 400% normal damage (100% increased damage + crit) to decide if we should overwrite Rip.
		if RipDamageTillDead() > {ExistingRipDamageTillDead() + Damage(ferocious_bite) * 4} Spell(rip)
	}
	#pool_resource,wait=0.25,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))
	#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=5 and target.DebuffPresent(rip)
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
	}
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&buff.dream_of_cenarius_damage.up
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2 and BuffPresent(dream_of_cenarius_damage) Spell(rip)
	if TalentPoints(natures_swiftness_talent)
	{
		#natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&dot.rip.remains<3&\
		#	(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
		if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 and target.DebuffRemains(rip) <3
			and {BuffPresent(berserk_cat) or target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury)}
		{
			Spell(natures_swiftness)
		}
	}
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2
	{
		if BuffPresent(berserk_cat) Spell(rip)
		if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
	}
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
	if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and {BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip)} FeralSavageRoar()
	#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
	if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 and {BuffRemains(savage_roar_buff) +2 <= target.DebuffRemains(rip)} FeralSavageRoar()
	#pool_resource,wait=0.25,if=combo_points>=5&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))&dot.rip.remains>=6.5
	#ferocious_bite,if=combo_points>=5&dot.rip.remains>6
	if ComboPoints() >=5 and target.DebuffRemains(rip) >6
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
	}
	#rake,if=dot.rake.remains<9&buff.dream_of_cenarius_damage.up
	if target.DebuffRemains(rake) <9 and BuffPresent(dream_of_cenarius_damage) Spell(rake)
	#rake,if=dot.rake.remains<3
	if target.DebuffRemains(rake) <3 Spell(rake)
	#pool_resource,wait=0.25,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
	FeralDreamOfCenariusFillerActions()
	if TalentPoints(force_of_nature_talent)
	{
		#treants
		Spell(treants_feral)
	}
}

AddFunction FeralDreamOfCenariusMainActions
{
	#auto_attack
	#healing_touch,if=buff.predatory_swiftness.up&buff.predatory_swiftness.remains<=1.5&buff.dream_of_cenarius_damage.down
	if BuffPresent(predatory_swiftness) and BuffRemains(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage) Spell(healing_touch)
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor) <3 FaerieFire()
	#healing_touch,if=buff.predatory_swiftness.up&(combo_points>=4|(set_bonus.tier15_2pc_melee&combo_points>=3))&buff.dream_of_cenarius_damage.stack<2
	if BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2
		and {ComboPoints() >=4 or {ArmorSetParts(T15_melee) >=2 and ComboPoints() >=3}}
	{
		Spell(healing_touch)
	}
	#healing_touch,if=buff.natures_swiftness.up
	if BuffPresent(natures_swiftness) Spell(healing_touch)
	if not target.InRange(mangle_cat) Texture(ability_druid_catformattack)
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	if FeralExecuteRange()
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
	}
	if FeralExecuteRange() and ComboPoints() >=5
	{
		#rip,line_cd=30,if=combo_points>=5&buff.virmens_bite_potion.up&buff.dream_of_cenarius_damage.up&target.health.pct<=25&target.time_to_die>30
		# Assume that FB will be 400% normal damage (100% increased damage + crit) to decide if we should overwrite Rip.
		if target.TimeToDie() >30
		{
			if RipDamageTillDead() > {ExistingRipDamageTillDead() + Damage(ferocious_bite) * 4} Spell(rip)
		}
		#pool_resource,wait=0.25,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))
		#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
		if target.DebuffPresent(rip)
		{
			wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
		}
	}
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&buff.dream_of_cenarius_damage.up
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2 and BuffPresent(dream_of_cenarius_damage) Spell(rip)
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2
	{
		if BuffPresent(berserk_cat) Spell(rip)
		if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
	}
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
	if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and {BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip)} FeralSavageRoar()
	#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
	if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 and {BuffRemains(savage_roar_buff) +2 <= target.DebuffRemains(rip)} FeralSavageRoar()
	#pool_resource,wait=0.25,if=combo_points>=5&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))&dot.rip.remains>=6.5
	#ferocious_bite,if=combo_points>=5&dot.rip.remains>6
	if ComboPoints() >=5 and target.DebuffRemains(rip) >6
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
	}
	#rake,if=dot.rake.remains<9&buff.dream_of_cenarius_damage.up
	if target.DebuffRemains(rake) <9 and BuffPresent(dream_of_cenarius_damage) Spell(rake)
	#rake,if=dot.rake.remains<3
	if target.DebuffRemains(rake) <3 Spell(rake)
	#pool_resource,wait=0.25,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
}

AddFunction FeralDreamOfCenariusShortCooldownActions
{
	#skull_bash_cat
	if target.IsInterruptible() FeralInterrupt()

	unless {BuffPresent(predatory_swiftness) and BuffExpires(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage)}
		or {BuffExpires(savage_roar_buff) and FeralSavageRoarReady()}
		or {target.DebuffStacks(weakened_armor) <3 and FaerieFireReady()}
		or {BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2
			and {ComboPoints() >=4 or {ArmorSetParts(T15_melee) >=2 and ComboPoints() >=3}}}
		or BuffPresent(natures_swiftness)
		or not target.InRange(mangle_cat)
	{
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	}
}

AddFunction FeralDreamOfCenariusCooldownActions
{
	#berserking
	UseRacialActions()

	unless {BuffPresent(predatory_swiftness) and BuffExpires(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage)}
		or {BuffExpires(savage_roar_buff) and FeralSavageRoarReady()}
		or {target.DebuffStacks(weakened_armor) <3 and FaerieFireReady()}
		or {BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2
			and {ComboPoints() >=4 or {ArmorSetParts(T15_melee) >=2 and ComboPoints() >=3}}}
		or BuffPresent(natures_swiftness)
		or not target.InRange(mangle_cat)
	{
		# Sync Incarnation, Hand enchant, and Berserk with Tiger's Fury.
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		#use_item,name=eternal_blossom_grips,sync=tigers_fury
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		#berserk,if=buff.tigers_fury.up|(target.time_to_die<15&cooldown.tigers_fury.remains>6)
		if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
		{
			if TalentPoints(incarnation_talent) and Spell(berserk_cat) Spell(king_of_the_jungle)
			UseItemActions()
			Spell(berserk_cat)
		}
		if BuffPresent(tigers_fury) Spell(berserk_cat)
		if target.TimeToDie() <15 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
		if FeralExecuteRange()
		{
			unless BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and FeralSavageRoarReady()
			{
				#natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&target.health.pct<=25
				if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 Spell(natures_swiftness)
				#virmens_bite_potion,if=(combo_points>=5&target.health.pct<=25&buff.dream_of_cenarius_damage.up)|target.time_to_die<=40
				if ComboPoints() >=5 and BuffPresent(dream_of_cenarius_damage) FeralUsePotion()
			}
		}
		if target.TimeToDie() <=40 FeralUsePotion()

		unless {{FeralExecuteRange() and ComboPoints() >=5}
				and	{{target.TimeToDie() >30 and RipDamageTillDead() > {ExistingRipDamageTillDead() + Damage(ferocious_bite) * 4}}
					or target.DebuffPresent(rip)}}
			or {target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2 and BuffPresent(dream_of_cenarius_damage)}
		{
			if TalentPoints(natures_swiftness_talent)
			{
				#natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&dot.rip.remains<3&\
				#	(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
				if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 and target.DebuffRemains(rip) <3
					and {BuffPresent(berserk_cat) or target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury)}
				{
					Spell(natures_swiftness)
				}
			}
			if TalentPoints(force_of_nature_talent)
			{
				#treants
				Spell(treants_feral)
			}
		}
	}
}

### Feral rotation for talent builds without ``Dream of Cenarius''.

AddFunction FeralNonDreamOfCenariusFillerActions
{
	#run_action_list,name=filler,if=buff.omen_of_clarity.react
	if BuffPresent(omen_of_clarity) FeralFillerActions()
	#run_action_list,name=filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
	if {ComboPoints() <5 and target.DebuffRemains(rip) <3} or {ComboPoints() ==0 and BuffRemains(savage_roar_buff) <2} FeralFillerActions()
	#run_action_list,name=filler,if=target.time_to_die<=8.5
	if target.TimeToDie() <=8.5 FeralFillerActions()
	#run_action_list,name=filler,if=buff.tigers_fury.up|buff.berserk.up
	if BuffPresent(tigers_fury) or BuffPresent(berserk_cat) FeralFillerActions()
	#run_action_list,name=filler,if=cooldown.tigers_fury.remains<=3
	if SpellCooldown(tigers_fury) <=3 FeralFillerActions()
	#run_action_list,name=filler,if=energy.time_to_max<=1
	if TimeToMaxEnergy() <=1 FeralFillerActions()
	if TalentPoints(soul_of_the_forest_talent)
	{
		#run_action_list,name=filler,if=combo_points<5
		if ComboPoints() <5 FeralFillerActions()
	}
}

AddFunction FeralNonDreamOfCenariusFullRotation
{
	#skull_bash_cat
	if target.IsInterruptible() FeralInterrupt()
	#init_use_racial_actions()
	UseRacialActions()
	#init_use_profession_actions()
	#UseProfessionActions()
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor) <3 FaerieFire()
	if not target.InRange(mangle_cat) Texture(ability_druid_catformattack)
	if TalentPoints(incarnation_talent)
	{
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		if Energy() <=35 and BuffExpires(omen_of_clarity) and Spell(tigers_fury) and Spell(berserk_cat) Spell(king_of_the_jungle)
	}
	#use_item,name=eternal_blossom_grips,sync=tigers_fury
	if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
	{
		UseItemActions()
	}
	#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
	if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	#berserk,if=buff.tigers_fury.up|(target.time_to_die<15&cooldown.tigers_fury.remains>6)
	if BuffPresent(tigers_fury) Spell(berserk_cat)
	if target.TimeToDie() <15 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
	if TalentPoints(natures_vigil_talent)
	{
		#natures_vigil,if=buff.berserk.up
		if BuffPresent(berserk_cat) Spell(natures_vigil)
	}
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	if FeralExecuteRange()
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		#virmens_bite_potion,if=(buff.berserk.up&target.health.pct<=25)|target.time_to_die<=40
		if BuffPresent(berserk_cat) FeralUsePotion()
	}
	if target.TimeToDie() <=40 FeralUsePotion()
	#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=5 and target.DebuffPresent(rip) Spell(ferocious_bite)
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2
	{
		if BuffPresent(berserk_cat) Spell(rip)
		if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
	}
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
	if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip) FeralSavageRoar()
	#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
	if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 and {BuffRemains(savage_roar_buff) +2 <= target.DebuffRemains(rip)} FeralSavageRoar()
	#ferocious_bite,if=combo_points>=5&(dot.rip.remains>10|(dot.rip.remains>6&buff.berserk.up))&dot.rip.ticking
	if ComboPoints() >=5 and target.DebuffPresent(rip)
	{
		if target.DebuffRemains(rip) >10 Spell(ferocious_bite)
		if target.DebuffRemains(rip) >6 and BuffPresent(berserk_cat) Spell(ferocious_bite)
	}
	#rake,if=dot.rake.remains<9&buff.tigers_fury.up
	if target.DebuffRemains(rake) <9 and BuffPresent(tigers_fury) Spell(rake)
	#rake,if=dot.rake.remains<3&(buff.berserk.up|(cooldown.tigers_fury.remains+0.8)>=dot.rake.remains|energy>60)
	if target.DebuffRemains(rake) <3
	{
		if BuffPresent(berserk_cat) Spell(rake)
		if SpellCooldown(tigers_fury) +0.8 >= target.DebuffRemains(rake) Spell(rake)
		if Energy() >60 Spell(rake)
	}
	#pool_resource,wait=0.1,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
	FeralNonDreamOfCenariusFillerActions()
	if TalentPoints(force_of_nature_talent)
	{
		#treants
		Spell(treants_feral)
	}
}

AddFunction FeralNonDreamOfCenariusMainActions
{
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor) <3 FaerieFire()
	if not target.InRange(mangle_cat) Texture(ability_druid_catformattack)
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	if FeralExecuteRange()
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
		if ComboPoints() >=5 and target.DebuffPresent(rip) Spell(ferocious_bite)
	}
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2
	{
		if BuffPresent(berserk_cat) Spell(rip)
		if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
	}
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
	if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip) FeralSavageRoar()
	#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
	if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 and {BuffRemains(savage_roar_buff) +2 <= target.DebuffRemains(rip)} FeralSavageRoar()
	#ferocious_bite,if=combo_points>=5&(dot.rip.remains>10|(dot.rip.remains>6&buff.berserk.up))&dot.rip.ticking
	if ComboPoints() >=5 and target.DebuffPresent(rip)
	{
		if target.DebuffRemains(rip) >10 Spell(ferocious_bite)
		if target.DebuffRemains(rip) >6 and BuffPresent(berserk_cat) Spell(ferocious_bite)
	}
	#rake,if=dot.rake.remains<9&buff.tigers_fury.up
	if target.DebuffRemains(rake) <9 and BuffPresent(tigers_fury) Spell(rake)
	#rake,if=dot.rake.remains<3&(buff.berserk.up|(cooldown.tigers_fury.remains+0.8)>=dot.rake.remains|energy>60)
	if target.DebuffRemains(rake) <3
	{
		if BuffPresent(berserk_cat) Spell(rake)
		if SpellCooldown(tigers_fury) +0.8 >= target.DebuffRemains(rake) Spell(rake)
		if Energy() >60 Spell(rake)
	}
	#pool_resource,wait=0.1,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
}

AddFunction FeralNonDreamOfCenariusShortCooldownActions
{
	#skull_bash_cat
	if target.IsInterruptible() FeralInterrupt()

	unless BuffExpires(savage_roar_buff)
		or {target.DebuffStacks(weakened_armor) <3 and FaerieFireReady()}
		or not target.InRange(mangle_cat)
	{
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	}
}

AddFunction FeralNonDreamOfCenariusCooldownActions
{
	if InCombat(no)
	{
		#virmens_bite_potion
		FeralUsePotion()
	}

	#init_use_racial_actions()
	UseRacialActions()
	#init_use_profession_actions()
	#UseProfessionActions()

	unless {BuffExpires(savage_roar_buff) and FeralSavageRoarReady()}
		or {target.DebuffStacks(weakened_armor) <3 and FaerieFireReady()}
		or not target.InRange(mangle_cat)
	{
		# Sync Incarnation, Hand enchant, and Berserk with Tiger's Fury.
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		#use_item,name=eternal_blossom_grips,sync=tigers_fury
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		#berserk,if=buff.tigers_fury.up|(target.time_to_die<15&cooldown.tigers_fury.remains>6)
		if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
		{
			if TalentPoints(incarnation_talent) and Spell(berserk_cat) Spell(king_of_the_jungle)
			UseItemActions()
			Spell(berserk_cat)
		}
		if BuffPresent(tigers_fury) Spell(berserk_cat)
		if target.TimeToDie() <15 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
		if TalentPoints(natures_vigil_talent)
		{
			#natures_vigil,if=buff.berserk.up
			if BuffPresent(berserk_cat) Spell(natures_vigil)
		}
		if FeralExecuteRange()
		{
			unless BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and FeralSavageRoarReady()
			{
				#virmens_bite_potion,if=(buff.berserk.up&target.health.pct<=25)|target.time_to_die<=40
				if BuffPresent(berserk_cat) FeralUsePotion()
			}
		}
		if target.TimeToDie() <=40 FeralUsePotion()
		if TalentPoints(force_of_nature_talent)
		{
			#treants
			Spell(treants_feral)
		}
	}
}

### Feral Icons

# Healing cooldowns.
AddIcon mastery=2 help=cd size=small
{
	Spell(barkskin)
	Spell(survival_instincts)
	if TalentPoints(renewal_talent) Spell(renewal)
	if TalentPoints(cenarion_ward_talent) Spell(cenarion_ward)
	Spell(tranquility)
}

AddIcon mastery=2 size=small
{
	if TalentPoints(displacer_beast_talent)
	{
		Spell(displacer_beast)
	}
	if TalentPoints(wild_charge_talent)
	{
		if BuffPresent(bear_form)
		{
			if target.InRange(wild_charge_bear) and not target.InRange(mangle_bear) Spell(wild_charge_bear)
		}
		if BuffPresent(cat_form)
		{
			if target.InRange(wild_charge_cat) and not target.InRange(mangle_cat) Spell(wild_charge_cat)
		}
		if target.InRange(wild_charge) Spell(wild_charge)
	}
	Spell(dash)
}

# Full rotation in a single icon.
AddIcon mastery=2 checkboxon=full_rotation
{
	FeralPreCombatActions()
	FeralBuffActions()
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusFullRotation()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusFullRotation()
	}
}

# Short cooldowns.
AddIcon mastery=2 help=shortcd
{
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusShortCooldownActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusShortCooldownActions()
	}
}

# Main rotation plus fillers.
AddIcon mastery=2 help=main
{
	FeralPreCombatActions()
	FeralBuffActions()
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusMainActions()
		FeralDreamOfCenariusFillerActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusMainActions()
		FeralNonDreamOfCenariusFillerActions()
	}
}

# Main rotation.
AddIcon mastery=2 help=main
{
	FeralPreCombatActions()
	FeralBuffActions()
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusMainActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusMainActions()
	}
}

# Cooldowns.
AddIcon mastery=2 help=cd
{
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusCooldownActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusCooldownActions()
	}
}

# Tier 6 talent cooldown.
AddIcon mastery=2 help=cd size=small
{
	if TalentPoints(heart_of_the_wild_talent) Spell(heart_of_the_wild)
	if TalentPoints(dream_of_cenarius_talent) and TalentPoints(natures_swiftness_talent) Spell(natures_swiftness)
	if TalentPoints(natures_vigil_talent) Spell(natures_vigil)
}

# Trinkets.
AddIcon mastery=2 help=cd size=small
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Guardian
###

AddCheckBox(opt_maul SpellName(maul) default mastery=3)

AddFunction GuardianInterrupt
{
	if target.InRange(skull_bash_bear) Spell(skull_bash_bear)
	if not target.Classification(worldboss) and TalentPoints(mighty_bash_talent) and target.InRange(mighty_bash)
	{
		Spell(mighty_bash)
	}
}

# Rotation from The Inconspicious Bear Mists of Pandaria Guardian Guide by Arielle:
#	http://theincbear.com/forums/viewtopic.php?p=12230#p12230

# Health increase cooldowns.
AddIcon mastery=3 help=cd size=small
{
	Spell(might_of_ursoc)
}

# Damage reduction cooldowns.
AddIcon mastery=3 help=cd size=small
{
	Spell(barkskin)
	if TalentPoints(force_of_nature_talent) Spell(treants_guardian)
	Spell(survival_instincts)
}

# Main rotation (rage-consuming abilities).
AddIcon mastery=3
{
	if CheckBoxOn(opt_maul) and target.IsAggroed(no)
	{
		# Always bank enough rage so that if we need to switch to defense, we can.
		if Rage() >90 Spell(maul)
	}
	if BuffExpires(tooth_and_claw) or {BuffPresent(tooth_and_claw) and BuffExpires(savage_defense_buff 2)}
	{
		Spell(savage_defense usable=1)
		if Glyph(glyph_of_frenzied_regeneration) or Rage() >60 Spell(frenzied_regeneration)
	}
	if Rage() >90 and BuffPresent(tooth_and_claw) Spell(maul)
}

# Main rotation (rage-generating abilities): Mangle > Lacerate > Thrash Maintenance > FFF
AddIcon mastery=3 help=main
{
	if InCombat(no) and BuffRemains(str_agi_int any=1) <400 Spell(mark_of_the_wild)
	if not Stance(1) Spell(bear_form)

	Spell(mangle_bear)

	# Debuff maintenance.
	if target.DebuffExpires(weakened_blows 3 any=1) Spell(thrash_bear)
	if target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3
	{
		FaerieFire()
	}

	Spell(lacerate)
	if target.DebuffPresent(thrash_bear 6) FaerieFire()
	Spell(thrash_bear)
}

# AoE rotation: Mangle > Thrash > Swipe
AddIcon mastery=3 help=aoe checkboxon=aoe
{
	Spell(mangle_bear)
	Spell(thrash_bear)
	Spell(swipe_bear)
}

# Rage cooldowns.
AddIcon mastery=3 help=cd
{
	if target.IsInterruptible() GuardianInterrupt()
	if Rage(less 11) Spell(enrage)
	if HealthPercent(less 25)
	{
		if BuffExpires(son_of_ursoc) Spell(berserk_bear)
		if TalentPoints(incarnation_talent) and BuffExpires(berserk_bear) Spell(son_of_ursoc)
	}
	if not BuffPresent(burst_haste any=1)
	{
		Spell(berserking)
	}
	if BuffExpires(son_of_ursoc) Spell(berserk_bear)
	if TalentPoints(incarnation_talent) and BuffExpires(berserk_bear) Spell(son_of_ursoc)
}

# Healing cooldowns.
AddIcon mastery=3 help=cd size=small
{
	if TalentPoints(natures_swiftness_talent) Spell(natures_swiftness)
	if TalentPoints(renewal_talent) Spell(renewal)
	if TalentPoints(cenarion_ward_talent) Spell(cenarion_ward)
}

# Trinkets.
AddIcon mastery=3 help=cd size=small
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]]
}

end