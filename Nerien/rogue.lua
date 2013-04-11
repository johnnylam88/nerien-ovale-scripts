local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.ROGUE.Nerien = {
	desc = "[5.2] Nerien: Assassination, Combat, Subtlety",
	code =
[[
# Nerien's rogue script based on SimulationCraft
#
# Assassination:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#ca!200002
#	glyphs=vendetta
#
# Combat:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#cZ!200002
#	glyphs=adrenaline_rush
#
# Subtlety:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#cb!200002

# Spells
Define(adrenaline_rush 13750)
	SpellInfo(adrenaline_rush cd=180 duration=15)
	SpellAddBuff(adrenaline_rush adrenaline_rush=1)
Define(ambush 8676)
	SpellInfo(ambush buff_combo=shadow_blades combo=2 energy=60)
	SpellAddTargetDebuff(ambush find_weakness=1)
Define(anticipation 115189)
	SpellInfo(anticipation duration=15)
Define(anticipation_talent 18)
Define(backstab 53)
	SpellInfo(backstab buff_combo=shadow_blades combo=1 energy=35)
Define(blade_flurry 13877)
	SpellInfo(blade_flurry cd=10)
Define(blind 2094)
	SpellInfo(blind cd=120 duration=60 energy=15)
	SpellInfo(blind energy=0 talent=dirty_tricks_talent)
	SpellAddTargetDebuff(blind blind=1)
Define(blindside 121153)
	SpellInfo(blindside duration=10)
Define(burst_of_speed 108212)
	SpellInfo(burst_of_speed duration=4 energy=30)
	SpellAddBuff(burst_of_speed burst_of_speed=1)
Define(burst_of_speed_talent 12)
Define(cheap_shot 1833)
	SpellInfo(cheap_shot buff_combo=shadow_blades combo=2 duration=4 energy=40)
	SpellInfo(cheap_shot addduration=1 glyph=glyph_of_cheap_shot)
	SpellAddTargetDebuff(cheap_shot find_weakness=1)
Define(cheating_death 45182)
	SpellInfo(cheating_death duration=3)
Define(cloak_and_dagger_talent 10)
Define(cloak_of_shadows 31224)
	SpellInfo(cloak_of_shadows cd=60 duration=5)
Define(combat_insight 74002)
	SpellInfo(combat_insight duration=10)
Define(combat_readiness 74001)
	SpellInfo(combat_readiness cd=120 duration=20)
	SpellAddBuff(combat_readiness combat_readiness=1)
Define(crimson_tempest 121411)
	SpellInfo(crimson_tempest combo=0 energy=35)
	SpellAddBuff(crimson_tempest anticipation=0)
	SpellAddTargetDebuff(crimson_tempest crimson_tempest_dot=1)
Define(crimson_tempest_dot 122233)
	SpellInfo(crimson_tempest_dot duration=12 tick=2)
Define(crippling_poison 3408)
	SpellInfo(crippling_poison duration=3600)
	SpellAddBuff(crippling_poison crippling_poison=1)
Define(crippling_poison_debuff 3409)
	SpellInfo(crippling_poison_debuff duration=12)
Define(deadly_poison 2823)
	SpellInfo(deadly_poison duration=3600)
	SpellAddBuff(deadly_poison deadly_poison=1)
Define(deadly_poison_dot 2818)
	SpellInfo(deadly_poison_dot duration=12)
Define(deadly_throw 26679)
	SpellInfo(deadly_throw combo=0 duration=6 energy=35)
	SpellAddTargetDebuff(deadly_throw deadly_throw=1)
Define(deadly_throw_talent 4)
Define(deep_insight 84747)
	SpellInfo(deep_insight duration=15)
Define(dirty_tricks_talent 15)
Define(dismantle 51722)
	SpellInfo(dismantle cd=60 duration=8 energy=25)
	SpellAddTargetDebuff(dismantle dismantle=1)
Define(dispatch 111240)
	SpellInfo(dispatch buff_combo=shadow_blades combo=1 energy=30)
	SpellAddBuff(dispatch blindside=0)
Define(distract 1725)
	SpellInfo(distract cd=30 energy=30)
Define(envenom 32645)
	SpellInfo(envenom combo=0 energy=35)
	SpellInfo(envenom adddurationcp=1 duration=1 tick=1)
	SpellAddBuff(envenom anticipation=0 envenom=1 slice_and_dice=refresh)
Define(evasion 5277)
	SpellInfo(evasion cd=180 duration=15)
	SpellInfo(evasion addduration=5 glyph=glyph_of_evasion)
	SpellAddBuff(evasion evasion=1)
Define(eviscerate 2098)
	SpellInfo(eviscerate combo=0 energy=35)
	SpellAddBuff(eviscerate anticipation=0)
Define(expose_armor 8647)
	SpellInfo(expose_armor buff_combo=shadow_blades combo=1 energy=25)
	SpellAddTargetDebuff(expose_armor weakened_armor=1)
Define(fan_of_knives 51723)
	SpellInfo(fan_of_knives buff_combo=shadow_blades combo=1 energy=35)
Define(feint 1966)
	SpellInfo(feint duration=5 energy=20)
	SpellInfo(feint addduration=2 glyph=glyph_of_feint)
	SpellAddBuff(feint feint=1)
Define(find_weakness 91021)
	SpellInfo(find_weakness duration=10)
Define(garrote 703)
	SpellInfo(garrote buff_combo=shadow_blades combo=1 duration=18 energy=45)
	SpellAddTargetDebuff(garrote find_weakness=1)
Define(glyph_of_cheap_shot 56801)
Define(glyph_of_evasion 56799)
Define(glyph_of_feint 56804)
Define(glyph_of_shiv 56810)
Define(glyph_of_stealth 63253)
Define(glyph_of_tricks_of_the_trade 63256)
Define(glyph_of_vanish 89758)
Define(glyph_of_vendetta 63249)
Define(gouge 1776)
	SpellInfo(gouge cd=10 duration=4 energy=45)
	SpellInfo(gouge energy=0 talent=dirty_tricks_talent)
	SpellAddTargetDebuff(gouge gouge=1)
Define(hemorrhage 16511)
	SpellInfo(hemorrhage buff_combo=shadow_blades combo=1 energy=30)
	SpellAddTargetDebuff(hemorrhage hemorrhage_dot=1)
Define(hemorrhage_dot 89775)
	SpellInfo(hemorrhage_dot duration=24 tick=3)
Define(honor_among_thieves 51701)
Define(kick 1766)
	SpellInfo(kick cd=15)
Define(kidney_shot 408)
	SpellInfo(kidney_shot cd=20 combo=0 energy=25)
	SpellInfo(kidney_shot adddurationcp=1 duration=1)
	SpellAddBuff(kidney_shot anticipation=0)
	SpellAddTargetDebuff(kidney_shot kidney_shot=1)
Define(killing_spree 51690)
	SpellInfo(killing_spree cd=120 duration=3 tick=0.5)
	SpellAddBuff(killing_spree killing_spree=1)
Define(leeching_poison 108211)
	SpellInfo(leeching_poison duration=3600)
	SpellAddBuff(leeching_poison leeching_poison=1)
Define(leeching_poison_talent 8)
SpellList(lethal_poison deadly_poison wound_poison)
Define(marked_for_death 137619)
	SpellInfo(marked_for_death cd=60 combo=5 duration=60)
	SpellAddBuff(marked_for_death marked_for_death=1)
Define(marked_for_death_talent 17)
Define(master_of_subtlety 31665)
Define(mind_numbing_poison 5761)
	SpellInfo(mind_numbing_poison duration=3600)
	SpellAddBuff(mind_numbing_poison mind_numbing_poison=1)
Define(mind_numbing_poison_debuff 5760)
	SpellInfo(mind_numbing_poison_debuff duration=10)
Define(moderate_insight 84746)
	SpellInfo(moderate_insight duration=15)
Define(mutilate 1329)
	SpellInfo(mutilate buff_combo=shadow_blades combo=2 energy=55)
SpellList(non_lethal_poison crippling_poison leeching_poison mind_numbing_poison paralytic_poison)
Define(paralytic_poison 108215)
	SpellInfo(paralytic_poison duration=3600)
	SpellAddBuff(paralytic_poison paralytic_poison=1)
Define(paralytic_poison_debuff 113952)
	SpellInfo(paralytic_poison_debuff duration=15)
Define(paralytic_poison_talent 14)
Define(premeditation 14183)
	SpellInfo(premeditation cd=20 combo=2)
Define(preparation 14185)
	SpellInfo(preparation cd=300)
Define(prey_on_the_weak_talent 13)
Define(recuperate 73651)
	SpellInfo(recuperate combo=0 energy=30)
	SpellInfo(recuperate adddurationcp=6 duration=0)
Define(redirect 73981)
	SpellInfo(redirect cd=60)
Define(revealing_strike 84617)
	SpellInfo(revealing_strike buff_combo=shadow_blades combo=1 duration=18 energy=40 tick=3)
	SpellAddTargetDebuff(revealing_strike revealing_strike=1)
Define(rupture 1943)
	SpellInfo(rupture combo=0 energy=25)
	SpellInfo(rupture adddurationcp=4 duration=4 tick=2)
	SpellAddBuff(rupture anticipation=0)
	SpellAddTargetDebuff(rupture rupture=1)
Define(sap 6770)
	SpellInfo(sap duration=60 energy=35)
	SpellInfo(sap addduration=80 glyph=glyph_of_sap)
	SpellAddTargetDebuff(sap sap=1)
Define(shadow_blades 121471)
	SpellInfo(shadow_blades cd=180 duration=12)
	SpellInfo(shadow_blades addduration=12 itemset=T14 itemcount=4)
	SpellAddBuff(shadow_blades shadow_blades=1)
Define(shadow_dance 51713)
	SpellInfo(shadow_dance cd=60 duration=8)
	SpellAddBuff(shadow_dance shadow_dance=1)
Define(shadow_focus_talent 3)
Define(shadow_walk 114842)
	SpellInfo(shadow_walk cd=60 duration=6)
	SpellAddBuff(shadow_walk shadow_walk=1)
Define(shadowstep 36554)
	SpellInfo(shadowstep cd=24 duration=2)
	SpellAddBuff(shadowstep shadowstep=1)
Define(shadowstep_talent 11)
Define(shallow_insight 84745)
	SpellInfo(shallow_insight duration=15)
Define(shiv 5938)
	SpellInfo(shiv cd=10)
	SpellInfo(shiv addcd=-2 glyph=glyph_of_shiv)
Define(shroud_of_concealment 114018)
	SpellInfo(shroud_of_concealment cd=300 duration=15)
	SpellAddBuff(shroud_of_concealment shroud_of_concealment=1)
Define(shuriken_toss 16)
	SpellInfo(shuriken_toss combo=1 energy=20)
Define(shuriken_toss_talent 16)
Define(sinister_strike 1752)
	SpellInfo(sinister_strike buff_combo=shadow_blades combo=1 energy=40)
Define(slice_and_dice 5171)
	SpellInfo(slice_and_dice combo=0 energy=25)
	SpellInfo(slice_and_dice adddurationcp=6 duration=6 tick=3)
	SpellAddBuff(slice_and_dice anticipation=0 slice_and_dice=1)
Define(smoke_bomb 76577)
	SpellInfo(smoke_bomb cd=180)
Define(sprint 2983)
	SpellInfo(sprint cd=60 duration=8)
Define(stealth 1784)
	SpellInfo(stealth cd=6)
	SpellInfo(stealth addcd=-4 glyph=glyph_of_stealth)
Define(subterfuge_talent 2)
Define(throw 121733)
Define(tricks_of_the_trade 57934)
	SpellInfo(tricks_of_the_trade cd=30 duration=20 energy=15)
	SpellInfo(tricks_of_the_trade energy=0 glyph=glyph_of_tricks_of_the_trade)
	SpellAddBuff(tricks_of_the_trade tricks_of_the_trade=1)
Define(vanish 1856)
	SpellInfo(vanish cd=120)
	SpellAddBuff(vanish vanish_buff=1)
Define(vanish_buff 11327)
	SpellInfo(vanish_buff duration=3)
	SpellInfo(vanish_buff addduration=2 glyph=glyph_of_vanish)
Define(vendetta 79140)
	SpellInfo(vendetta cd=120 duration=20)
	SpellInfo(vendetta addduration=10 glyph=glyph_of_vendetta)
	SpellAddTargetDebuff(vendetta vendetta=1)
Define(weakened_armor 113746)
	SpellInfo(weakened_armor duration=30)
Define(wound_poison 8679)
	SpellInfo(wound_poison duration=3600)
	SpellAddBuff(wound_poison wound_poison=1)
Define(wound_poison_debuff 8680)
	SpellInfo(wound_poison_debuff duration=15)

# Items
Define(virmens_bite_potion 76089)
Define(virmens_bite_potion_buff 105697)
	SpellInfo(virmens_bite_potion_buff duration=25)

# Racials
Define(berserking 26297)
	SpellInfo(berserking cd=180 duration=10)
	SpellAddBuff(berserking berserking=1)
Define(blood_fury 20572)
	SpellInfo(blood_fury cd=120 duration=15)
	SpellAddBuff(blood_fury blood_fury=1)
Define(stoneform 20594)
	SpellInfo(stoneform cd=120 duration=8)
	SpellAddBuff(stoneform stoneform=1)

AddFunction UseRacialActions
{
	Spell(berserking)
	Spell(blood_fury)
}

AddFunction UseRacialSurvivalActions
{
	Spell(stoneform)
}

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
### Rogue (all specializations)
###

AddFunction ApplyPoisons
{
	if InCombat(no)
	{
		if BuffExpires(lethal_poison 400)
		{
			Spell(deadly_poison)
		}
		if BuffExpires(non_lethal_poison 400)
		{
			if TalentPoints(leeching_poison_talent) Spell(leeching_poison)
			Spell(mind_numbing_poison)
		}
	}
	if BuffExpires(lethal_poison)
	{
		Spell(deadly_poison)
	}
}

AddFunction IsStealthed
{
	Stealthed() or BuffPresent(vanish_buff) or BuffPresent(shadow_dance)
}

AddFunction Interrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		if IsStealthed() and target.InRange(cheap_shot) Spell(cheap_shot)
		if target.InRange(kick) Spell(kick)
		if not target.Classification(worldboss) and target.InRange(kidney_shot) Spell(kidney_shot)
	}
}

AddCheckBox(opt_expose_armor SpellName(expose_armor))

AddFunction ExposeArmor
{
	if CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}
	{
		Spell(expose_armor)
	}
}

AddCheckBox(opt_tricks_of_the_trade SpellName(tricks_of_the_trade) default)

AddFunction TricksOfTheTrade
{
	#tricks_of_the_trade
	if CheckBoxOn(opt_tricks_of_the_trade) and Glyph(glyph_of_tricks_of_the_trade no) Spell(tricks_of_the_trade)
}

AddFunction UsePotion
{
	#virmens_bite_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
}

###
### Assassination
###

AddFunction AssassinationFullRotation
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#apply_poison,lethal=deadly
		ApplyPoisons()
		#snapshot_stats
		#virmens_bite_potion
		UsePotion()
		if TalentPoints(marked_for_death_talent)
		{
			#marked_for_death,if=talent.marked_for_death.enabled
			Spell(marked_for_death)
			#slice_and_dice,if=talent.marked_for_death.enabled
			Spell(slice_and_dice)
		}
		#stealth
		if not IsStealthed() Spell(stealth)
	}

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <40 UsePotion()
	#preparation,if=!buff.vanish.up&cooldown.vanish.remains>60
	if BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 Spell(preparation)
	#auto_attack
	#kick
	Interrupt()
	#use_item,name=ninetailed_gloves
	UseItemActions()
	#berserking
	UseRacialActions()
	#vanish,if=time>10&!buff.stealthed.up&!buff.shadow_blades.up
	if InCombat() and TimeInCombat() >10 and not IsStealthed() and BuffExpires(shadow_blades) Spell(vanish)
	#ambush
	Spell(ambush usable=1)
	#shadow_blades,if=(buff.bloodlust.react|time>60)
	if BuffPresent(burst_haste any=1) or TimeInCombat() >60 Spell(shadow_blades)
	#slice_and_dice,if=buff.slice_and_dice.remains<2
	if BuffRemains(slice_and_dice) <2 Spell(slice_and_dice)
	if target.TicksRemain(rupture) <2 and Energy() >90
	{
		ExposeArmor()
		#dispatch,if=dot.rupture.ticks_remain<2&energy>90
		if BuffPresent(blindside) or target.HealthPercent() <35 Spell(dispatch)
		#mutilate,if=dot.rupture.ticks_remain<2&energy>90
		Spell(mutilate)
	}
	#marked_for_death,if=talent.marked_for_death.enabled&combo_points=0
	if TalentPoints(marked_for_death_talent) and ComboPoints() ==0 Spell(marked_for_death)
	#rupture,if=ticks_remain<2|(combo_points=5&ticks_remain<3)
	if target.TicksRemain(rupture) <2 Spell(rupture)
	if ComboPoints() ==5 and target.TicksRemain(rupture) <3 Spell(rupture)
	#vendetta
	Spell(vendetta)
	#envenom,if=combo_points>4
	{
		# Refinement from EJ: if not talented into Anticipation, Envenom at 4+CP unless
		# the target is below 35% health.
		if not TalentPoints(anticipation_talent) and ComboPoints() >=4 and target.HealthPercent() >35 Spell(envenom)
		if ComboPoints() >4 and target.HealthPercent() <=35 Spell(envenom)
	}
	#envenom,if=combo_points>=2&buff.slice_and_dice.remains<3
	if ComboPoints() >=2 and BuffRemains(slice_and_dice) <3 Spell(envenom)
	ExposeArmor()
	#dispatch,if=combo_points<5
	if ComboPoints() <5 and {BuffPresent(blindside) or target.HealthPercent() <35} Spell(dispatch)
	#tricks_of_the_trade
	TricksOfTheTrade()
	#mutilate
	Spell(mutilate)
}

AddFunction AssassinationPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#apply_poison,lethal=deadly
		ApplyPoisons()
		#snapshot_stats
		if TalentPoints(marked_for_death_talent)
		{
			#slice_and_dice,if=talent.marked_for_death.enabled
			Spell(slice_and_dice)
		}
		#stealth
		if not IsStealthed() Spell(stealth)
	}
}

AddFunction AssassinationMainPlusFillerActions
{
	#auto_attack
	#ambush
	Spell(ambush usable=1)
	#slice_and_dice,if=buff.slice_and_dice.remains<2
	if BuffRemains(slice_and_dice) <2 Spell(slice_and_dice)
	if target.TicksRemain(rupture) <2 and Energy() >90
	{
		ExposeArmor()
		#dispatch,if=dot.rupture.ticks_remain<2&energy>90
		if BuffPresent(blindside) or target.HealthPercent() <35 Spell(dispatch)
		#mutilate,if=dot.rupture.ticks_remain<2&energy>90
		Spell(mutilate)
	}
	#rupture,if=ticks_remain<2|(combo_points=5&ticks_remain<3)
	if target.TicksRemain(rupture) <2 Spell(rupture)
	if ComboPoints() ==5 and target.TicksRemain(rupture) <3 Spell(rupture)
	#envenom,if=combo_points>4
	{
		# Refinement from EJ: if not talented into Anticipation, Envenom at 4+CP unless
		# the target is below 35% health.
		if not TalentPoints(anticipation_talent) and ComboPoints() >=4 and target.HealthPercent() >35 Spell(envenom)
		if ComboPoints() >4 and target.HealthPercent() <=35 Spell(envenom)
	}
	#envenom,if=combo_points>=2&buff.slice_and_dice.remains<3
	if ComboPoints() >=2 and BuffRemains(slice_and_dice) <3 Spell(envenom)
	ExposeArmor()
	#dispatch,if=combo_points<5
	if ComboPoints() <5 and {BuffPresent(blindside) or target.HealthPercent() <35} Spell(dispatch)
	#tricks_of_the_trade
	TricksOfTheTrade()
	#mutilate
	Spell(mutilate)
}

AddFunction AssassinationMainActions
{
	#auto_attack
	#slice_and_dice,if=buff.slice_and_dice.remains<2
	if BuffRemains(slice_and_dice) <2 Spell(slice_and_dice)
	#rupture,if=ticks_remain<2|(combo_points=5&ticks_remain<3)
	if target.TicksRemain(rupture) <2 Spell(rupture)
	if ComboPoints() ==5 and target.TicksRemain(rupture) <3 Spell(rupture)
	#envenom,if=combo_points>4
	{
		# Refinement from EJ: if not talented into Anticipation, Envenom at 4+CP unless
		# the target is below 35% health.
		if not TalentPoints(anticipation_talent) and ComboPoints() >=4 and target.HealthPercent() >35 Spell(envenom)
		if ComboPoints() >4 and target.HealthPercent() <=35 Spell(envenom)
	}
	#envenom,if=combo_points>=2&buff.slice_and_dice.remains<3
	if ComboPoints() >=2 and BuffRemains(slice_and_dice) <3 Spell(envenom)
}

AddFunction AssassinationShortCooldownActions
{
	if InCombat(no)
	{
		if TalentPoints(marked_for_death_talent)
		{
			#marked_for_death,if=talent.marked_for_death.enabled
			Spell(marked_for_death)
		}
	}

	#preparation,if=!buff.vanish.up&cooldown.vanish.remains>60
	if BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 Spell(preparation)
	#vanish,if=time>10&!buff.stealthed.up&!buff.shadow_blades.up
	if InCombat() and TimeInCombat() >10 and not IsStealthed() and BuffExpires(shadow_blades) Spell(vanish)

	unless Spell(ambush usable=1)
		or {BuffRemains(slice_and_dice) <2 and ComboPoints() >0}
		or {target.TicksRemain(rupture) <2 and Energy() >90}
	{
		#marked_for_death,if=talent.marked_for_death.enabled&combo_points=0
		if TalentPoints(marked_for_death_talent) and ComboPoints() ==0 Spell(marked_for_death)
	}
}

AddFunction AssassinationCooldownActions
{
	if InCombat(no)
	{
		#virmens_bite_potion
		UsePotion()
	}

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <40 UsePotion()
	#kick
	Interrupt()

	unless {BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 and Spell(preparation)}
	{
		#use_item,name=ninetailed_gloves
		UseItemActions()
		#berserking
		UseRacialActions()

		unless {TimeInCombat() >10 and not IsStealthed() and BuffExpires(shadow_blades) and Spell(vanish)}
		{
			#shadow_blades,if=(buff.bloodlust.react|time>60)
			if BuffPresent(burst_haste any=1) or TimeInCombat() >60 Spell(shadow_blades)

			unless BuffRemains(slice_and_dice) <2 or target.TicksRemain(rupture) <2
			{
				#vendetta
				Spell(vendetta)
			}
		}
	}
}

AddIcon mastery=1 size=small checkboxon=opt_icons_left
{
	Spell(tricks_of_the_trade)
}

AddIcon mastery=1 size=small checkboxon=opt_icons_left
{
	Spell(redirect)
}

AddIcon mastery=1 help=shortcd
{
	AssassinationShortCooldownActions()
}

AddIcon mastery=1 help=main
{
	AssassinationPreCombatActions()
	AssassinationMainPlusFillerActions()
}

AddIcon mastery=1 help=main
{
	AssassinationPreCombatActions()
	AssassinationMainActions()
}

AddIcon mastery=1 help=cd
{
	AssassinationCooldownActions()
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	Spell(feint)
	UseRacialSurvivalActions()
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	Spell(cloak_of_shadows)
}

###
### Combat
###

AddFunction CombatGeneratorActions
{
	ExposeArmor()
	#revealing_strike,if=ticks_remain<2
	if target.TicksRemain(revealing_strike) <2 Spell(revealing_strike)
	#sinister_strike
	Spell(sinister_strike)
}

AddFunction CombatFinisherActions
{
	#rupture,if=ticks_remain<2&target.time_to_die>=26
	if target.TicksRemain(rupture) <2 and target.TimeToDie() >=26 Spell(rupture)
	#eviscerate
	Spell(eviscerate)
}

AddFunction CombatFullRotation
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#apply_poison,lethal=deadly
		ApplyPoisons()
		#snapshot_stats
		#virmens_bite_potion
		UsePotion()
		if TalentPoints(marked_for_death_talent)
		{
			#marked_for_death,if=talent.marked_for_death.enabled
			Spell(marked_for_death)
			#slice_and_dice,if=talent.marked_for_death.enabled
			Spell(slice_and_dice)
		}
		#stealth
		if not IsStealthed() Spell(stealth)
	}

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <40 UsePotion()
	#preparation,if=!buff.vanish.up&cooldown.vanish.remains>60
	if BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 Spell(preparation)
	#auto_attack
	#kick
	Interrupt()
	#use_item,name=ninetailed_gloves
	UseItemActions()
	#berserking
	UseRacialActions()
	#ambush
	Spell(ambush usable=1)
	#vanish,if=time>10&(combo_points<3|(talent.anticipation.enabled&anticipation_charges<3)|(buff.shadow_blades.down&(combo_points<4|(talent.anticipation.enabled&anticipation_charges<4))))&((talent.shadow_focus.enabled&buff.adrenaline_rush.down&energy<20)|(talent.subterfuge.enabled&energy>=90)|(!talent.shadow_focus.enabled&!talent.subterfuge.enabled&energy>=60))
	if InCombat() and TimeInCombat() >10
		and {ComboPoints() <3 or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <3}
			or {BuffExpires(shadow_blades) and {ComboPoints() <4 or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <4}}}}
		and {{TalentPoints(shadow_focus_talent) and BuffExpires(adrenaline_rush) and Energy() <20}
			or {TalentPoints(subterfuge_talent) and Energy() >=90}
			or {not TalentPoints(shadow_focus_talent) and not TalentPoints(subterfuge_talent) and Energy() >=60}}
	{
		Spell(vanish)
	}
	if ArmorSetParts(T14) <4
	{
		#shadow_blades,if=!set_bonus.tier14_4pc_melee&time>5
		if TimeInCombat() >5 Spell(shadow_blades)
		#killing_spree,if=!set_bonus.tier14_4pc_melee&energy<35&buff.adrenaline_rush.down
		if BuffExpires(adrenaline_rush) Spell(killing_spree)
		#adrenaline_rush,if=!set_bonus.tier14_4pc_melee&(energy<35|buff.shadow_blades.up)
		if Energy() <35 or BuffPresent(shadow_blades) Spell(adrenaline_rush)
	}
	if ArmorSetParts(T14) >=4
	{
		#shadow_blades,if=set_bonus.tier14_4pc_melee&((cooldown.killing_spree.remains>30.5&cooldown.adrenaline_rush.remains<=9)|(energy<35&(cooldown.killing_spree.remains=0|cooldown.adrenaline_rush.remains=0)))
		{
			if SpellCooldown(killing_spree) >30.5 and SpellCooldown(adrenaline_rush) <=9 Spell(shadow_blades)
			if Energy() <35 and {Spell(killing_spree) or Spell(adrenaline_rush)} Spell(shadow_blades)
		}
		#killing_spree,if=set_bonus.tier14_4pc_melee&((buff.shadow_blades.up&buff.adrenaline_rush.down&(energy<35|buff.shadow_blades.remains<=3.5))|(buff.shadow_blades.down&cooldown.shadow_blades.remains>30))
		{
			if BuffPresent(shadow_blades) and BuffExpires(adrenaline_rush) and {Energy() <35 or BuffRemains(shadow_blades) <=3.5} Spell(killing_spree)
			if BuffExpires(shadow_blades) and SpellCooldown(shadow_blades) >30 Spell(killing_spree)
		}
		#adrenaline_rush,if=set_bonus.tier14_4pc_melee&buff.shadow_blades.up&(energy<35|buff.shadow_blades.remains<=15)
		if BuffPresent(shadow_blades) and {Energy() <35 or BuffRemains(shadow_blades) <=15} Spell(adrenaline_rush)
	}
	#slice_and_dice,if=buff.slice_and_dice.remains<2|(buff.slice_and_dice.remains<15&buff.bandits_guile.stack=11&combo_points>=4)
	{
		if BuffRemains(slice_and_dice) <2 Spell(slice_and_dice)
		if BuffRemains(slice_and_dice) <15 and BuffPresent(moderate_insight) and ComboPoints() >=4 Spell(slice_and_dice)
	}
	#marked_for_death,if=talent.marked_for_death.enabled&combo_points=0&dot.revealing_strike.ticking
	if TalentPoints(marked_for_death_talent) and ComboPoints() ==0 and target.DebuffPresent(revealing_strike) Spell(marked_for_death)
	#run_action_list,name=generator,if=combo_points<5|(talent.anticipation.enabled&anticipation_charges<=4&!dot.revealing_strike.ticking)
	if ComboPoints() <5
		or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <=4}
		or target.DebuffExpires(revealing_strike)
	{
		CombatGeneratorActions()
	}
	#run_action_list,name=finisher,if=!talent.anticipation.enabled|buff.deep_insight.up|cooldown.shadow_blades.remains<=11|anticipation_charges>=4|(buff.shadow_blades.up&anticipation_charges>=3)
	if not TalentPoints(anticipation_talent)
		or BuffPresent(deep_insight) or SpellCooldown(shadow_blades) <=11
		or BuffStacks(anticipation) >=4	or {BuffPresent(shadow_blades) and BuffStacks(anticipation) >=3}
	{
		CombatFinisherActions()
	}
	#run_action_list,name=generator,if=energy>60|buff.deep_insight.down|buff.deep_insight.remains>5-combo_points
	if Energy() >60
		or BuffExpires(deep_insight)
		or BuffRemains(deep_insight) > {5 - ComboPoints()}
	{
		CombatGeneratorActions()
	}
}

AddFunction CombatPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#apply_poison,lethal=deadly
		ApplyPoisons()
		#snapshot_stats
		if TalentPoints(marked_for_death_talent)
		{
			#slice_and_dice,if=talent.marked_for_death.enabled
			Spell(slice_and_dice)
		}
		#stealth
		if not IsStealthed() Spell(stealth)
	}
}

AddFunction CombatMainPlusFillerActions
{
	#auto_attack
	#ambush
	Spell(ambush usable=1)
	#slice_and_dice,if=buff.slice_and_dice.remains<2|(buff.slice_and_dice.remains<15&buff.bandits_guile.stack=11&combo_points>=4)
	{
		if BuffRemains(slice_and_dice) <2 Spell(slice_and_dice)
		if BuffRemains(slice_and_dice) <15 and BuffPresent(moderate_insight) and ComboPoints() >=4 Spell(slice_and_dice)
	}
	#run_action_list,name=generator,if=combo_points<5|(talent.anticipation.enabled&anticipation_charges<=4&!dot.revealing_strike.ticking)
	if ComboPoints() <5
		or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <=4}
		or target.DebuffExpires(revealing_strike)
	{
		CombatGeneratorActions()
	}
	#run_action_list,name=finisher,if=!talent.anticipation.enabled|buff.deep_insight.up|cooldown.shadow_blades.remains<=11|anticipation_charges>=4|(buff.shadow_blades.up&anticipation_charges>=3)
	if not TalentPoints(anticipation_talent)
		or BuffPresent(deep_insight) or SpellCooldown(shadow_blades) <=11
		or BuffStacks(anticipation) >=4	or {BuffPresent(shadow_blades) and BuffStacks(anticipation) >=3}
	{
		CombatFinisherActions()
	}
	#run_action_list,name=generator,if=energy>60|buff.deep_insight.down|buff.deep_insight.remains>5-combo_points
	if Energy() >60
		or BuffExpires(deep_insight)
		or BuffRemains(deep_insight) > {5 - ComboPoints()}
	{
		CombatGeneratorActions()
	}
}

AddFunction CombatMainActions
{
	#auto_attack
	#ambush
	Spell(ambush usable=1)
	#slice_and_dice,if=buff.slice_and_dice.remains<2|(buff.slice_and_dice.remains<15&buff.bandits_guile.stack=11&combo_points>=4)
	{
		if BuffRemains(slice_and_dice) <2 Spell(slice_and_dice)
		if BuffRemains(slice_and_dice) <15 and BuffPresent(moderate_insight) and ComboPoints() >=4 Spell(slice_and_dice)
	}
	#run_action_list,name=finisher,if=!talent.anticipation.enabled|buff.deep_insight.up|cooldown.shadow_blades.remains<=11|anticipation_charges>=4|(buff.shadow_blades.up&anticipation_charges>=3)
	if not TalentPoints(anticipation_talent)
		or BuffPresent(deep_insight) or SpellCooldown(shadow_blades) <=11
		or BuffStacks(anticipation) >=4	or {BuffPresent(shadow_blades) and BuffStacks(anticipation) >=3}
	{
		CombatFinisherActions()
	}
}

AddFunction CombatShortCooldownActions
{
	if InCombat(no)
	{
		if TalentPoints(marked_for_death_talent)
		{
			#marked_for_death,if=talent.marked_for_death.enabled
			Spell(marked_for_death)
		}
	}

	#preparation,if=!buff.vanish.up&cooldown.vanish.remains>60
	if BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 Spell(preparation)
	#vanish,if=time>10&(combo_points<3|(talent.anticipation.enabled&anticipation_charges<3)|(buff.shadow_blades.down&(combo_points<4|(talent.anticipation.enabled&anticipation_charges<4))))&((talent.shadow_focus.enabled&buff.adrenaline_rush.down&energy<20)|(talent.subterfuge.enabled&energy>=90)|(!talent.shadow_focus.enabled&!talent.subterfuge.enabled&energy>=60))
	if InCombat() and TimeInCombat() >10
		and {ComboPoints() <3 or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <3}
			or {BuffExpires(shadow_blades) and {ComboPoints() <4 or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <4}}}}
		and {{TalentPoints(shadow_focus_talent) and BuffExpires(adrenaline_rush) and Energy() <20}
			or {TalentPoints(subterfuge_talent) and Energy() >=90}
			or {not TalentPoints(shadow_focus_talent) and not TalentPoints(subterfuge_talent) and Energy() >=60}}
	{
		Spell(vanish)

		unless {ComboPoints() >0 and BuffRemains(slice_and_dice) <2}
			or {BuffRemains(slice_and_dice) <15 and BuffPresent(moderate_insight) and ComboPoints() >=4}
		{
			#marked_for_death,if=talent.marked_for_death.enabled&combo_points=0&dot.revealing_strike.ticking
			if TalentPoints(marked_for_death_talent) and ComboPoints() ==0 and target.DebuffPresent(revealing_strike) Spell(marked_for_death)
		}
	}
}

AddFunction CombatCooldownActions
{
	if InCombat(no)
	{
		#virmens_bite_potion
		UsePotion()
	}

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <40 UsePotion()
	#kick
	Interrupt()

	unless {BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 and Spell(preparation)}
	{
		#use_item,name=ninetailed_gloves
		UseItemActions()
		#berserking
		UseRacialActions()

		#vanish,if=time>10&(combo_points<3|(talent.anticipation.enabled&anticipation_charges<3)|(buff.shadow_blades.down&(combo_points<4|(talent.anticipation.enabled&anticipation_charges<4))))&((talent.shadow_focus.enabled&buff.adrenaline_rush.down&energy<20)|(talent.subterfuge.enabled&energy>=90)|(!talent.shadow_focus.enabled&!talent.subterfuge.enabled&energy>=60))
		unless {Spell(vanish) and InCombat() and TimeInCombat() >10
			and {ComboPoints() <3 or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <3}
				or {BuffExpires(shadow_blades) and {ComboPoints() <4 or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) <4}}}}
			and {{TalentPoints(shadow_focus_talent) and BuffExpires(adrenaline_rush) and Energy() <20}
				or {TalentPoints(subterfuge_talent) and Energy() >=90}
				or {not TalentPoints(shadow_focus_talent) and not TalentPoints(subterfuge_talent) and Energy() >=60}}}
		{
			if ArmorSetParts(T14) <4
			{
				#shadow_blades,if=!set_bonus.tier14_4pc_melee&time>5
				if TimeInCombat() >5 Spell(shadow_blades)
				#killing_spree,if=!set_bonus.tier14_4pc_melee&energy<35&buff.adrenaline_rush.down
				if BuffExpires(adrenaline_rush) Spell(killing_spree)
				#adrenaline_rush,if=!set_bonus.tier14_4pc_melee&(energy<35|buff.shadow_blades.up)
				if Energy() <35 or BuffPresent(shadow_blades) Spell(adrenaline_rush)
			}
			if ArmorSetParts(T14) >=4
			{
				#shadow_blades,if=set_bonus.tier14_4pc_melee&((cooldown.killing_spree.remains>30.5&cooldown.adrenaline_rush.remains<=9)|(energy<35&(cooldown.killing_spree.remains=0|cooldown.adrenaline_rush.remains=0)))
				{
					if SpellCooldown(killing_spree) >30.5 and SpellCooldown(adrenaline_rush) <=9 Spell(shadow_blades)
					if Energy() <35 and {Spell(killing_spree) or Spell(adrenaline_rush)} Spell(shadow_blades)
				}
				#killing_spree,if=set_bonus.tier14_4pc_melee&((buff.shadow_blades.up&buff.adrenaline_rush.down&(energy<35|buff.shadow_blades.remains<=3.5))|(buff.shadow_blades.down&cooldown.shadow_blades.remains>30))
				{
					if BuffPresent(shadow_blades) and BuffExpires(adrenaline_rush) and {Energy() <35 or BuffRemains(shadow_blades) <=3.5} Spell(killing_spree)
					if BuffExpires(shadow_blades) and SpellCooldown(shadow_blades) >30 Spell(killing_spree)
				}
				#adrenaline_rush,if=set_bonus.tier14_4pc_melee&buff.shadow_blades.up&(energy<35|buff.shadow_blades.remains<=15)
				if BuffPresent(shadow_blades) and {Energy() <35 or BuffRemains(shadow_blades) <=15} Spell(adrenaline_rush)
			}
		}
	}
}

AddIcon mastery=2 size=small checkboxon=opt_icons_left
{
	Spell(tricks_of_the_trade)
}

AddIcon mastery=2 size=small checkboxon=opt_icons_left
{
	Spell(redirect)
}

AddIcon mastery=2 help=shortcd
{
	CombatShortCooldownActions()
}

AddIcon mastery=2 help=main
{
	CombatPreCombatActions()
	CombatMainPlusFillerActions()
}

AddIcon mastery=2 help=main
{
	CombatPreCombatActions()
	CombatMainActions()
}

AddIcon mastery=2 help=cd
{
	CombatCooldownActions()
}

AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_right
{
	Spell(feint)
	UseRacialSurvivalActions()
}

AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_right
{
	Spell(cloak_of_shadows)
}

###
### Subtlety
###

AddFunction SubtletyIsStealthed
{
	IsStealthed() or BuffPresent(shadow_dance)
}

AddFunction SubtletyFullRotation
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#apply_poison,lethal=deadly
		ApplyPoisons()
		#snapshot_stats
		#virmens_bite_potion
		UsePotion()
		if TalentPoints(marked_for_death_talent)
		{
			#marked_for_death,if=talent.marked_for_death.enabled
			Spell(marked_for_death)
			#slice_and_dice,if=talent.marked_for_death.enabled
			Spell(slice_and_dice)
		}
		#stealth
		if not IsStealthed() Spell(stealth)
		#premeditation
		if SubtletyIsStealthed() Spell(premeditation)
		#slice_and_dice
		Spell(slice_and_dice)
	}

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <40 UsePotion()
	#preparation,if=!buff.vanish.up&cooldown.vanish.remains>60
	if BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 Spell(preparation)
	#auto_attack
	#kick
	Interrupt()
	#shadow_blades
	Spell(shadow_blades)
	#pool_resource,for_next=1,extra_amount=75
	#shadow_dance,if=energy>=75&buff.stealthed.down&!target.debuff.find_weakness.up
	if Spell(shadow_dance) and not IsStealthed() and target.DebuffExpires(find_weakness)
	{
		wait if Energy() >=75 Spell(shadow_dance)
	}
	if BuffPresent(shadow_dance)
	{
		#use_item,name=ninetailed_gloves,if=buff.shadow_dance.up
		UseItemActions()
		#berserking,if=buff.shadow_dance.up
		UseRacialActions()
	}
	#pool_resource,for_next=1,extra_amount=30
	#vanish,if=time>10&energy>=45&energy<=75&combo_points<=3&!buff.shadow_dance.up&!buff.master_of_subtlety.up&!target.debuff.find_weakness.up
	if Spell(vanish) and TimeInCombat() >10 and ComboPoints() <=3
		and not SubtletyIsStealthed() and BuffExpires(master_of_subtlety) and target.DebuffExpires(find_weakness)
	{
		wait if Energy() >=45 and Energy() <=75 Spell(vanish)
	}
	#premeditation,if=(combo_points<=3&cooldown.honor_among_thieves.remains>1.75)|combo_points<=2
	if SubtletyIsStealthed() and ComboPoints() <=2 Spell(premeditation)
	#ambush,if=combo_points<=5&anticipation_charges=0
	if TalentPoints(anticipation_talent)
	{
		if ComboPoints() <=5 and BuffStacks(anticipation) ==0 Spell(ambush usable=1)
	}
	if not TalentPoints(anticipation_talent)
	{
		if ComboPoints() <4 Spell(ambush usable=1)
	}
	#marked_for_death,if=talent.marked_for_death.enabled&combo_points=0
	if TalentPoints(marked_for_death_talent) and ComboPoints() ==0 Spell(marked_for_death)
	#slice_and_dice,if=buff.slice_and_dice.remains<3&combo_points=5
	if ComboPoints() ==5 and BuffRemains(slice_and_dice) <3 Spell(slice_and_dice)
	#rupture,if=combo_points=5&dot.rupture.remains<5
	if ComboPoints() ==5 and target.DebuffRemains(rupture) <5 Spell(rupture)
	#ambush,if=anticipation_charges<3&buff.shadow_dance.remains<=2
	if TalentPoints(anticipation_talent)
	{
		if BuffStacks(anticipation) <3 and BuffRemains(shadow_dance) <=2 Spell(ambush usable=1)
	}
	#eviscerate,if=combo_points=5
	if ComboPoints() ==5 Spell(eviscerate)
	if target.DebuffRemains(hemorrhage_dot) <4
	{
		#hemorrhage,if=combo_points<4&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints() <4 Spell(hemorrhage)
		#hemorrhage,if=combo_points<5&energy>80&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints() <5 and Energy() >80 Spell(hemorrhage)
	}
	if ComboPoints() <4 ExposeArmor()
	#backstab,if=combo_points<4&(cooldown.shadow_dance.remains>7|(cooldown.shadow_dance.remains=0&time<=9))
	if ComboPoints() <4
	{
		if SpellCooldown(shadow_dance) >7 Spell(backstab)
		if Spell(shadow_dance) and TimeInCombat() <=9 Spell(backstab)
	}
	#tricks_of_the_trade
	#backstab,if=combo_points<5&energy>80&cooldown.shadow_dance.remains>=2
	if ComboPoints() <5 and Energy() >80 and SpellCooldown(shadow_dance) >=2 Spell(backstab)
}

AddFunction SubtletyPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#apply_poison,lethal=deadly
		ApplyPoisons()
		#snapshot_stats
		if TalentPoints(marked_for_death_talent)
		{
			#slice_and_dice,if=talent.marked_for_death.enabled
			Spell(slice_and_dice)
		}
		#stealth
		if not IsStealthed() Spell(stealth)
		#premeditation
		if SubtletyIsStealthed() Spell(premeditation)
		#slice_and_dice
		Spell(slice_and_dice)
	}
}

AddFunction SubtletyMainActions
{
	#auto_attack
	#premeditation,if=(combo_points<=3&cooldown.honor_among_thieves.remains>1.75)|combo_points<=2
	if SubtletyIsStealthed() and ComboPoints() <=2 Spell(premeditation)
	#ambush,if=combo_points<=5&anticipation_charges=0
	if TalentPoints(anticipation_talent)
	{
		if ComboPoints() <=5 and BuffStacks(anticipation) ==0 Spell(ambush usable=1)
	}
	if not TalentPoints(anticipation_talent)
	{
		if ComboPoints() <4 Spell(ambush usable=1)
	}
	#slice_and_dice,if=buff.slice_and_dice.remains<3&combo_points=5
	if ComboPoints() ==5 and BuffRemains(slice_and_dice) <3 Spell(slice_and_dice)
	#rupture,if=combo_points=5&dot.rupture.remains<5
	if ComboPoints() ==5 and target.DebuffRemains(rupture) <5 Spell(rupture)
	#ambush,if=anticipation_charges<3&buff.shadow_dance.remains<=2
	if TalentPoints(anticipation_talent)
	{
		if BuffStacks(anticipation) <3 and BuffRemains(shadow_dance) <=2 Spell(ambush usable=1)
	}
	#eviscerate,if=combo_points=5
	if ComboPoints() ==5 Spell(eviscerate)
	if target.DebuffRemains(hemorrhage_dot) <4
	{
		#hemorrhage,if=combo_points<4&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints() <4 Spell(hemorrhage)
		#hemorrhage,if=combo_points<5&energy>80&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints() <5 and Energy() >80 Spell(hemorrhage)
	}
	if ComboPoints() <4 ExposeArmor()
}

AddFunction SubtletyFillerActions
{
	#backstab,if=combo_points<4&(cooldown.shadow_dance.remains>7|(cooldown.shadow_dance.remains=0&time<=9))
	if ComboPoints() <4
	{
		if SpellCooldown(shadow_dance) >7 Spell(backstab)
		if Spell(shadow_dance) and TimeInCombat() <=9 Spell(backstab)
	}
	#tricks_of_the_trade
	#backstab,if=combo_points<5&energy>80&cooldown.shadow_dance.remains>=2
	if ComboPoints() <5 and Energy() >80 and SpellCooldown(shadow_dance) >=2 Spell(backstab)
	# Extra filler to prevent energy-capping if Shadow Dance is delayed.
	if TimeToMaxEnergy() <1.5 Spell(backstab)
}

AddFunction SubtletyShortCooldownActions
{
	if InCombat(no)
	{
		if TalentPoints(marked_for_death_talent)
		{
			#marked_for_death,if=talent.marked_for_death.enabled
			Spell(marked_for_death)
		}
	}

	#preparation,if=!buff.vanish.up&cooldown.vanish.remains>60
	if BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 Spell(preparation)
	#pool_resource,for_next=1,extra_amount=75
	#shadow_dance,if=energy>=75&buff.stealthed.down&!target.debuff.find_weakness.up
	if Spell(shadow_dance) and not IsStealthed() and target.DebuffExpires(find_weakness)
	{
		wait if Energy() >=75 Spell(shadow_dance)
	}
	#pool_resource,for_next=1,extra_amount=30
	#vanish,if=time>10&energy>=45&energy<=75&combo_points<=3&!buff.shadow_dance.up&!buff.master_of_subtlety.up&!target.debuff.find_weakness.up
	if Spell(vanish) and TimeInCombat() >10 and ComboPoints() <=3
		and not SubtletyIsStealthed() and BuffExpires(master_of_subtlety) and target.DebuffExpires(find_weakness)
	{
		wait if Energy() >=45 and Energy() <=75 Spell(vanish)
	}
	unless {TalentPoints(anticipation_talent) and ComboPoints() <=5 and BuffStacks(anticipation) ==0 and IsStealthed()}
		or {not TalentPoints(anticipation_talent) and ComboPoints() <4 and IsStealthed()}
	{
		#marked_for_death,if=talent.marked_for_death.enabled&combo_points=0
		if TalentPoints(marked_for_death_talent) and ComboPoints() ==0 Spell(marked_for_death)
	}
}

AddFunction SubtletyCooldownActions
{
	if InCombat(no)
	{
		#virmens_bite_potion
		UsePotion()
	}

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <40 UsePotion()
	#kick
	Interrupt()

	unless {BuffExpires(vanish_buff) and SpellCooldown(vanish) >60 and Spell(preparation)}
	{
		#shadow_blades
		Spell(shadow_blades)
		if BuffPresent(shadow_dance)
		{
			#use_item,name=ninetailed_gloves,if=buff.shadow_dance.up
			UseItemActions()
			#berserking,if=buff.shadow_dance.up
			UseRacialActions()
		}
	}
}

AddIcon mastery=3 size=small checkboxon=opt_icons_left
{
	Spell(tricks_of_the_trade)
}

AddIcon mastery=3 size=small checkboxon=opt_icons_left
{
	Spell(redirect)
}

AddIcon mastery=3 help=shortcd
{
	SubtletyShortCooldownActions()
}

AddIcon mastery=3 help=main
{
	SubtletyPreCombatActions()
	SubtletyMainActions()
	SubtletyFillerActions()
}

AddIcon mastery=3 help=main
{
	SubtletyPreCombatActions()
	SubtletyMainActions()
}

AddIcon mastery=3 help=cd
{
	SubtletyCooldownActions()
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	Spell(feint)
	UseRacialSurvivalActions()
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	Spell(cloak_of_shadows)
}
]],
}
