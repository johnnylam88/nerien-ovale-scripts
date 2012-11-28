if NerienOvaleScripts.class == "DRUID" then

NerienOvaleScripts.script.DRUID.Nerien = {
	desc = "Nerien: Guardian",
	code =
[[
# Nerien's druid script based on SimulationCraft
#
# Guardian:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Ub!...1..

# Spells.
Define(barkskin 22812)
	SpellInfo(barkskin cd=60 duration=12)
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
Define(cenarion_ward 102351)
	SpellInfo(cenarion_ward cd=30)
Define(cenarion_ward_talent 6)
Define(clearcasting 16870)
Define(cyclone 33786)
	SpellAddBuff(cyclone natures_swiftness=0)
Define(disorienting_roar_talent 10)
Define(displacer_beast_talent 2)
Define(dream_of_cenarius_talent 17)
Define(enrage 5229)
	SpellInfo(enrage cd=60 duration=10 rage=-20)
	SpellAddBuff(enrage enrage=1)
Define(entangling_roots 339)
	SpellAddBuff(entangling_roots natures_swiftness=0)
Define(faerie_fire 770)
	SpellInfo(faerie_fire cd=6 duration=300)
	SpellAddTargetDebuff(faerie_fire faerie_fire=1 weakened_armor=1)
Define(faerie_swarm_talent 7)
Define(feline_swiftness_talent 1)
Define(ferocious_bite 22568)
	SpellInfo(ferocious_bite combo=-5 energy=25)
Define(force_of_nature_talent 12)
Define(frenzied_regeneration 22842)
Define(frenzied_regeneration_buff 124769)
Define(glyph_of_frenzied_regeneration 54810)
Define(glyph_of_savagery 127540)
Define(glyph_of_shred 114234)
Define(healing_touch 5185)
	SpellAddBuff(healing_touch natures_swiftness=0)
Define(hibernate 2637)
	SpellAddBuff(hibernate natures_swiftness=0)
Define(incarnation 106731)
	SpellInfo(incarnation cd=180)
Define(incarnation_talent 11)
Define(incarnation_chosen_of_elune 102560)
	SpellInfo(incarnation_chosen_of_elune duration=30)
Define(incarnation_king_of_the_jungle 102543)
	SpellInfo(incarnation_king_of_the_jungle duration=30)
Define(incarnation_son_of_ursoc 102558)
	SpellInfo(incarnation_son_of_ursoc duration=30)
Define(incarnation_tree_of_life 33891)
	SpellInfo(incarnation_tree_of_life duration=30)
Define(infected_wounds 58180)
    SpellInfo(infected_wounds duration=12)
Define(lacerate 33745)
	SpellInfo(lacerate cd=3 duration=15 tick=3)
	SpellAddTargetDebuff(lacerate lacerate=1)
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
Define(mass_entanglement_talent 8)
Define(maul 6807)
	SpellInfo(maul cd=3 rage=30)
	SpellAddTargetDebuff(maul infected_wounds=1)
Define(might_of_ursoc 106922)
	SpellInfo(might_of_ursoc cd=180 duration=20)
	SpellAddBuff(might_of_ursoc might_of_ursoc=1)
Define(mighty_bash 5211)
	SpellInfo(mighty_bash cd=50 duration=5)
	SpellAddTargetDebuff(mighty_bash mighty_bash=1)
Define(mighty_bash_talent 15)
Define(natures_swiftness 132158)
	SpellInfo(natures_swiftness cd=60 duration=86400)
	SpellAddBuff(natures_swiftness natures_swiftness=1)
Define(natures_swiftness_talent 4)
Define(natures_vigil_talent 18)
Define(nourish 50464)
	SpellAddBuff(nourish natures_swiftness=0)
Define(rake 1822)
	SpellInfo(rake combo=1 duration=15 energy=35 tick=3)
	SpellAddTargetDebuff(rake rake=1)
Define(ravage 6785)
	SpellInfo(ravage combo=1 energy=45 inccounter=ripshreds)
	SpellAddTargetDebuff(ravage infected_wounds=1)
Define(rebirth 20484)
	SpellInfo(rebirth cd=600)
	SpellAddBuff(rebirth natures_swiftness=0)
Define(regrowth 8936)
	SpellAddBuff(regrowth natures_swiftness=0)
Define(renewal 108238)
	SpellInfo(renewal cd=120)
Define(renewal_talent 5)
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
Define(shred 5221)
	SpellInfo(shred combo=1 energy=40 inccounter=ripshreds)
	SpellAddTargetDebuff(shred infected_wounds=1)
Define(skull_bash_bear 106839)
	SpellInfo(skull_bash_bear cd=15)
Define(skull_bash_cat 80965)
	SpellInfo(skull_bash_cat cd=15 energy=15)
Define(soul_of_the_forest_talent 10)
Define(survival_instincts 61336)
	SpellInfo(survival_instincts cd=180 duration=12)
	SpellAddBuff(survival_instincts survival_instincts=1)
Define(swipe 106785)
Define(swipe_bear 779)
	SpellInfo(swipe_bear cd=3 level=22 rage=15)
Define(swipe_cat 62078)
	SpellInfo(swipe_cat combo=1 energy=45)
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
### Guardian
###

AddCheckBox(opt_maul SpellName(maul) default mastery=3)

AddFunction GuardianInterrupt
{
	if TargetInRange(skull_bash_bear) Spell(skull_bash_bear)
	if not TargetClassification(worldboss) and TalentPoints(mighty_bash_talent) and TargetInRange(mighty_bash)
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
	if TargetIsAggroed(no)
	{
		# Always bank enough rage so that if we need to switch to defense, we can.
		if CheckBoxOn(opt_maul) and Rage(more 90) Spell(maul)
	}
	if BuffExpires(savage_defense_buff 3) Spell(savage_defense)
	if Glyph(glyph_of_frenzied_regeneration) or Rage(more 60) Spell(frenzied_regeneration)
}

# Main rotation (rage-generating abilities): Mangle > Lacerate > Thrash Maintenance > FFF
AddIcon mastery=3 help=main
{
	if InCombat(no) and BuffRemains(str_agi_int any=1) <400 Spell(mark_of_the_wild)
	if not Stance(1) Spell(bear_form)

	# Debuff maintenance.
	if TargetDebuffExpires(weakened_blows 3 any=1) Spell(thrash_bear)
	if TargetDebuffExpires(weakened_armor 3 any=1) or TargetDebuffStacks(weakened_armor any=1) <3
	{
		Spell(faerie_fire)
	}

	Spell(mangle_bear)
	Spell(lacerate)
	if TargetDebuffExpires(thrash_bear 6) Spell(thrash_bear)
	Spell(faerie_fire)
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
	if TargetIsInterruptible() GuardianInterrupt()
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