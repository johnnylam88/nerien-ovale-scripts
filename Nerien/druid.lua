if NerienOvaleScripts.class == "DRUID" then

NerienOvaleScripts.script.DRUID.Nerien = {
	desc = "[5.1] Nerien: Guardian",
	code =
[[
# Nerien's druid script based on SimulationCraft
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
	SpellInfo(faerie_fire cd=15 glyph=glyph_of_fae_silence)
	SpellAddTargetDebuff(faerie_fire faerie_fire=1 weakened_armor=1)
Define(faerie_swarm 102355)
	SpellInfo(faerie_swarm duration=300)
	SpellInfo(faerie_swarm cd=15 glyph=glyph_of_fae_silence)
	SpellAddTargetDebuff(faerie_swarm faerie_swarm=1 weakened_armor=1)
Define(faerie_swarm_talent 7)
Define(feline_swiftness_talent 1)
Define(ferocious_bite 22568)
	SpellInfo(ferocious_bite combo=-5 energy=25)
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
Define(hibernate 2637)
	SpellAddBuff(hibernate natures_swiftness=0 predatory_swiftness=0)
Define(hurricane 16914)
	SpellInfo(hurricane canStopChannelling=10 duration=10 tick=1)
Define(incarnation 106731)
	SpellInfo(incarnation cd=180)
Define(incarnation_talent 11)
Define(incarnation_chosen_of_elune 102560)
	SpellInfo(incarnation_chosen_of_elune cd=180 duration=30)
Define(incarnation_king_of_the_jungle 102543)
	SpellInfo(incarnation_king_of_the_jungle cd=180 duration=30)
Define(incarnation_son_of_ursoc 102558)
	SpellInfo(incarnation_son_of_ursoc cd=180 duration=30)
Define(incarnation_tree_of_life 33891)
	SpellInfo(incarnation_tree_of_life cd=180 duration=30)
Define(infected_wounds 58180)
    SpellInfo(infected_wounds duration=12)
Define(innervate 29166)
	SpellInfo(innervate cd=180 duration=10 tick=1)
Define(ironbark 102342)
	SpellInfo(ironbark cd=120 duration=12)
	SpellAddTargetBuff(ironbark ironbark=1)
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
	SpellInfo(maim cd=10 combo=-5 energy=35)
Define(mangle 33917)
Define(mangle_bear 33878)
	SpellInfo(mangle_bear buffnocd=berserk_bear cd=6 rage=-5)
	SpellInfo(mangle_bear rage=-7 talent=soul_of_the_forest_talent)
	SpellAddTargetDebuff(mangle_bear infected_wounds=1)
Define(mangle_cat 33876)
	SpellInfo(mangle_cat combo=1 energy=35 inccounter=ripshreds)
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
	Spellinfo(might_of_ursoc addcd=120 glyph=glyph_of_might_of_ursoc)
	SpellAddBuff(might_of_ursoc bear_form=1 might_of_ursoc=1)
Define(mighty_bash 5211)
	SpellInfo(mighty_bash cd=50 duration=5)
	SpellAddTargetDebuff(mighty_bash mighty_bash=1)
Define(mighty_bash_talent 15)
Define(moonfire 8921)
	SpellInfo(moonfire duration=14 tick=2)
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
Define(prowl 5215)
	SpellInfo(prowl duration=1800)
	SpellAddBuff(prowl cat_form=1 prowl=1)
Define(prowl_incarnation 102547)
	SpellInfo(prowl_incarnation duration=1800)
	SpellAddBuff(prowl_incarnation cat_form=1 prowl_incarnation=1)
Define(rake 1822)
	SpellInfo(rake combo=1 duration=15 energy=35 tick=3)
	SpellAddTargetDebuff(rake rake=1)
Define(ravage 6785)
	SpellInfo(ravage combo=1 energy=45 inccounter=ripshreds)
	SpellAddTargetDebuff(ravage infected_wounds=1)
Define(ravagebang 102545)
	SpellInfo(ravagebang combo=1 energy=45 inccounter=ripshreds)
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
	SpellInfo(rip combo=-5 duration=16 energy=30 resetcounter=ripshreds tick=2)
	SpellAddTargetDebuff(rip rip=1)
Define(savage_defense 62606)
	SpellInfo(savage_defense rage=60)
	SpellInfo(savage_defense itemset=T13 itemcount=2 rage=55)
	SpellAddBuff(savage_defense savage_defense_buff=1)
Define(savage_defense_buff 132402)
	SpellInfo(savage_defense_buff duration=6)
Define(savage_roar 52610)
	SpellInfo(savage_roar combo=-5 energy=25)
	SpellAddBuff(savage_roar savage_roar_buff=1)
Define(savage_roar_buff 127538)
Define(shooting_stars 93400)
	SpellInfo(shooting_stars duration=12)
Define(shred 5221)
	SpellInfo(shred combo=1 energy=40 inccounter=ripshreds)
	SpellAddTargetDebuff(shred infected_wounds=1)
Define(skull_bash_bear 106839)
	SpellInfo(skull_bash_bear cd=15)
	SpellInfo(skull_bash_bear addcd=10 glyph=glyph_of_skull_bash)
Define(skull_bash_cat 80965)
	SpellInfo(skull_bash_cat cd=15 energy=15)
	SpellInfo(skull_bash_cat addcd=10 glyph=glyph_of_skull_bash)
Define(solar_beam 78675)
	SpellInfo(solar_beam cd=60)
Define(soothe 2908)
Define(soul_of_the_forest 114108)
	SpellInfo(soul_of_the_forest duration=6)
Define(soul_of_the_forest_talent 10)
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
Define(wild_charge_talent 3)
Define(wild_charge_bear 16979)
	SpellInfo(wild_charge_bear cd=15)
Define(wild_charge_cat 49376)
	SpellInfo(wild_charge_cat cd=15)
Define(wild_charge_moonkin 102383)
	SpellInfo(wild_charge_moonkin cd=15)
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

AddFunction FaerieFire
{
	if TalentPoints(faerie_swarm_talent) Spell(faerie_swarm)
	if not TalentPoints(faerie_swarm_talent) Spell(faerie_fire)
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
		if BuffExpires(incarnation_son_of_ursoc) Spell(berserk_bear)
		if TalentPoints(incarnation_talent) and BuffExpires(berserk_bear) Spell(incarnation_son_of_ursoc)
	}
	if not BuffPresent(burst_haste any=1)
	{
		Spell(berserking)
	}
	if BuffExpires(incarnation_son_of_ursoc) Spell(berserk_bear)
	if TalentPoints(incarnation_talent) and BuffExpires(berserk_bear) Spell(incarnation_son_of_ursoc)
}

# Healing cooldowns.
AddIcon mastery=3 help=cd size=small
{
	if TalentPoints(natures_swiftness_talent) Spell(natures_swiftness)
	if TalentPoints(renewal_talent) Spell(renewal)
	if TalentPoints(cenarion_ward_talent) Spell(cenarion_ward)
}

AddIcon mastery=3 help=cd size=small
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]]
}

end