if NerienOvaleScripts.class == "ROGUE" then

NerienOvaleScripts.script.ROGUE.Nerien = {
	desc = "[5.0] Nerien: Assassination, Combat, Subtlety",
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
	SpellInfo(ambush combo=2 energy=60)
	SpellAddTargetDebuff(ambush find_weakness=1)
Define(anticipation 115189)
	SpellInfo(anticipation duration=15)
Define(anticipation_talent 18)
Define(blade_flurry 13877)
	SpellInfo(blade_flurry cd=10)
Define(blindside 121153)
	SpellInfo(blindside duration=10)
Define(cheap_shot 1833)
	SpellInfo(cheap_shot combo=2 duration=4 energy=40)
Define(cloak_of_shadows 31224)
	SpellInfo(cloak_of_shadows cd=120)
Define(crimson_tempest 121411)
	SpellInfo(crimson_tempest combo=0 energy=35)
	SpellAddTargetDebuff(crimson_tempest crimson_tempest_dot=1)
Define(crimson_tempest_dot 122233)
	SpellInfo(crimson_tempest_dot duration=12 tick=2)
Define(deadly_poison 2823)
	SpellInfo(deadly_poison duration=3600)
	SpellAddBuff(deadly_poison deadly_poison=1)
Define(deep_insight 84747)
	SpellInfo(deep_insight duration=15)
Define(dispatch 111240)
	SpellInfo(dispatch combo=1 energy=30)
Define(envenom 32645)
	SpellInfo(envenom combo=0 energy=35)
	SpellInfo(envenom adddurationcp=1 duration=1 tick=1)
	SpellAddBuff(envenom envenom=1 slice_and_dice=refresh)
Define(eviscerate 2098)
	SpellInfo(eviscerate combo=0 energy=35)
Define(expose_armor 8647)
	SpellInfo(expose_armor combo=1 energy=25)
	SpellAddTargetDebuff(expose_armor weakened_armor=1)
Define(feint 1966)
	SpellInfo(feint duration=5 energy=20)
	SpellInfo(feint addduration=2 glyph=glyph_of_feint)
	SpellAddBuff(feint feint=1)
Define(find_weakness 91021)
	SpellInfo(find_weakness duration=10)
Define(glyph_of_feint 56804)
Define(glyph_of_shiv 56810)
Define(glyph_of_stealth 63253)
Define(glyph_of_tricks_of_the_trade 63256)
Define(glyph_of_vanish 89758)
Define(glyph_of_vendetta 63249)
Define(hemorrhage 16511)
	SpellInfo(hemorrhage combo=1 energy=30)
	SpellAddTargetDebuff(hemorrhage hemorrhage_dot=1)
Define(hemorrhage_dot 89775)
	SpellInfo(hemorrhage_dot duration=24 tick=3)
Define(honor_among_thieves 51701)
Define(kick 1766)
	SpellInfo(kick cd=15 energy=15)
Define(kidney_shot 408)
	SpellInfo(kidney_shot cd=20 combo=0 energy=25)
	SpellInfo(kidney_shot adddurationcp=1 duration=1)
	SpellAddTargetDebuff(kidney_shot kidney_shot=1)
Define(killing_spree 51690)
	SpellInfo(killing_spree cd=120 duration=3 tick=0.5)
	SpellAddBuff(killing_spree killing_spree=1)
Define(leeching_poison 108211)
	SpellInfo(leeching_poison duration=3600)
	SpellAddBuff(leeching_poison leeching_poison=1)
Define(leeching_poison_talent 8)
SpellList(lethal_poison 2823 8679)
Define(master_of_subtlety 31665)
Define(mind_numbing_poison 5761)
	SpellInfo(mind_numbing_poison duration=3600)
	SpellAddBuff(mind_numbing_poison mind_numbing_poison=1)
Define(moderate_insight 84746)
	SpellInfo(moderate_insight duration=15)
Define(mutilate 1329)
	SpellInfo(mutilate combo=2 energy=55)
SpellList(non_lethal_poison 3408 5761 108211 108215)
Define(paralytic_poison 108215)
	SpellInfo(paralytic_poison duration=3600)
	SpellAddBuff(paralytic_poison paralytic_poison=1)
Define(paralytic_poison_talent 14)
Define(premeditation 14183)
	SpellInfo(premeditation cd=20 combo=2)
Define(preparation 14185)
	SpellInfo(preparation cd=300)
Define(preparation_talent 10)
Define(revealing_strike 84617)
	SpellInfo(revealing_strike combo=1 duration=18 energy=40 tick=3)
	SpellAddTargetDebuff(revealing_strike revealing_strike=1)
Define(rupture 1943)
	SpellInfo(rupture combo=0 combo=0 energy=25)
	SpellInfo(rupture adddurationcp=4 duration=4 tick=2)
	SpellAddTargetDebuff(rupture rupture=1)
Define(shadow_blades 121471)
	SpellInfo(shadow_blades cd=180 duration=12)
	SpellInfo(shadow_blades addduration=12 itemset=T14 itemcount=4)
	SpellAddBuff(shadow_blades shadow_blades=1)
Define(shadow_dance 51713)
	SpellInfo(shadow_dance cd=60 duration=8)
	SpellAddBuff(shadow_dance shadow_dance=1)
Define(shadowstep 36554)
	SpellInfo(shadowstep cd=24 duration=2)
	SpellAddBuff(shadowstep shadowstep=1)
Define(shadowstep_talent 11)
Define(shallow_insight 84745)
	SpellInfo(shallow_insight duration=15)
Define(shiv 5938)
	SpellInfo(shiv cd=10)
	SpellInfo(shiv addcd=-2 glyph=glyph_of_shiv)
Define(shuriken_toss 16)
	SpellInfo(shuriken_toss combo=1 energy=20)
Define(shuriken_toss_talent 16)
Define(sinister_strike 1752)
	SpellInfo(sinister_strike combo=1 energy=40)
Define(slice_and_dice 5171)
	SpellInfo(slice_and_dice combo=0 energy=25)
	SpellInfo(slice_and_dice adddurationcp=6 duration=6 tick=3)
	SpellAddBuff(slice_and_dice slice_and_dice=1)
Define(stealth 1784)
	SpellInfo(stealth cd=6)
	SpellInfo(stealth addcd=-4 glyph=glyph_of_stealth)
Define(throw 121733)
Define(tricks_of_the_trade 57934)
	SpellInfo(tricks_of_the_trade cd=30 duration=20 energy=15)
	SpellInfo(tricks_of_the_trade energy=0 glyph=glyph_of_tricks_of_the_trade)
	SpellAddBuff(tricks_of_the_trade tricks_of_the_trade=1)
Define(vanish 1856)
	SpellInfo(vanish cd=180)
	SpellAddBuff(vanish vanish_buff=1)
Define(vanish_buff 11327)
	SpellInfo(vanish_buff duration=3)
	SpellInfo(vanish_buff addduration=2 glyph=glyph_of_vanish)
Define(vendetta 79140)
	SpellInfo(vendetta cd=120 duration=20)
	SpellInfo(vendetta addduration=10 glyph=glyph_of_vendetta)
	SpellAddTargetDebuff(vendetta vendetta=1)
Define(versatility_talent 17)
Define(weakened_armor 113746)
	SpellInfo(weakened_armor duration=30)
Define(wound_poison 8679)
	SpellInfo(wound_poison duration=3600)
	SpellAddBuff(wound_poison wound_poison=1)

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

# Common rogue actions.

AddCheckBox(opt_expose_armor) SpellName(expose_armor))
AddCheckBox(opt_tricks_of_the_trade SpellName(tricks_of_the_trade) default)

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
	Stealthed() or BuffPresent(vanish_buff)
}

AddFunction Interrupt
{
	if {IsStealthed() or BuffPresent(shadow_dance)} and target.InRange(cheap_shot) Spell(cheap_shot)
	if target.InRange(kick) Spell(kick)
	if not target.Classification(worldboss) and target.InRange(kidney_shot) Spell(kidney_shot)
}

AddIcon size=small
{
	Spell(tricks_of_the_trade)
}

AddIcon size=small
{
	Spell(redirect)
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
		if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
		#stealth
		if not IsStealthed() Spell(stealth)
	}

	ApplyPoisons()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if CheckBoxOn(potions) and target.Classification(worldboss) and {BuffPresent(burst_haste any=1) or target.TimeToDie() <40}
	{
		Item(virmens_bite_potion usable=1)
	}
	#preparation,if=talent.preparation.enabled&!buff.vanish.up&cooldown.vanish.remains>60
	if TalentPoints(preparation_talent) and BuffExpires(vanish) and SpellCooldown(vanish) >60 Spell(preparation)
	#auto_attack
	#kick
	if target.IsInterruptible() Interrupt()
	#use_item,name=gloves_of_the_thousandfold_blades
	UseItemActions()
	#berserking
	UseRacialActions()
	#vanish,if=time>10&!buff.stealthed.up&!buff.shadow_blades.up
	if TimeInCombat(more 10) and not IsStealthed() and BuffExpires(shadow_blades) Spell(vanish)
	#ambush
	if IsStealthed() Spell(ambush)
	#shadow_blades,if=(buff.bloodlust.react|time>60)
	if BuffPresent(burst_haste any=1) or TimeInCombat(more 60) Spell(shadow_blades)
	#tricks_of_the_trade,if=set_bonus.tier13_2pc_melee
	if CheckBoxOn(opt_tricks_of_the_trade) and ArmorSetParts(T13 more 1) Spell(tricks_of_the_trade)
	#slice_and_dice,if=buff.slice_and_dice.remains<2
	if BuffExpires(slice_and_dice 2) Spell(slice_and_dice)
	if CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}
	{
		Spell(expose_armor)
	}
	if target.TicksRemain(rupture) <2 and Energy(more 90)
	{
		#dispatch,if=dot.rupture.ticks_remain<2&energy>90
		if BuffPresent(blindside) or target.HealthPercent(less 35) Spell(dispatch)
		#mutilate,if=dot.rupture.ticks_remain<2&energy>90
		Spell(mutilate)
	}
	#rupture,if=ticks_remain<2|(combo_points=5&ticks_remain<3)
	if target.TicksRemain(rupture) <2 or {ComboPoints(more 4) and target.TicksRemain(rupture) <3} Spell(rupture)
	#vendetta
	Spell(vendetta)
	#envenom,if=combo_points>4
	if ComboPoints(more 4) Spell(envenom)
	#envenom,if=combo_points>=2&buff.slice_and_dice.remains<3
	if ComboPoints(more 1) and BuffExpires(slice_and_dice 3) Spell(envenom)
	#dispatch,if=combo_points<5
	if ComboPoints(less 5) and {BuffPresent(blindside) or target.HealthPercent(less 35)} Spell(dispatch)
	#tricks_of_the_trade
	if CheckBoxOn(opt_tricks_of_the_trade) Spell(tricks_of_the_trade)
	#mutilate
	Spell(mutilate)
}

AddFunction AssassinationMainActions
{
	#auto_attack
	#ambush
	if IsStealthed() Spell(ambush)
	#tricks_of_the_trade,if=set_bonus.tier13_2pc_melee
	if CheckBoxOn(opt_tricks_of_the_trade) and ArmorSetParts(T13 more 1) Spell(tricks_of_the_trade)
	#slice_and_dice,if=buff.slice_and_dice.remains<2
	if BuffExpires(slice_and_dice 2) Spell(slice_and_dice)
	#rupture,if=ticks_remain<2|(combo_points=5&ticks_remain<3)
	if target.TicksRemain(rupture) <2 or {ComboPoints(more 4) and target.TicksRemain(rupture) <3} Spell(rupture)
	#envenom,if=combo_points>=4&buff.envenom.remains<1
	if ComboPoints(more 3) and BuffExpires(envenom 1) Spell(envenom)
	#envenom,if=combo_points>4
	if ComboPoints(more 4) Spell(envenom)
	#envenom,if=combo_points>=2&buff.slice_and_dice.remains<3
	if ComboPoints(more 1) and BuffExpires(slice_and_dice 3) Spell(envenom)
	#tricks_of_the_trade
	if CheckBoxOn(opt_tricks_of_the_trade) Spell(tricks_of_the_trade)
}

AddFunction AssassinationMainPlusFillerActions
{
	#auto_attack
	#ambush
	if IsStealthed() Spell(ambush)
	#tricks_of_the_trade,if=set_bonus.tier13_2pc_melee
	if CheckBoxOn(opt_tricks_of_the_trade) and ArmorSetParts(T13 more 1) Spell(tricks_of_the_trade)
	#slice_and_dice,if=buff.slice_and_dice.remains<2
	if BuffExpires(slice_and_dice 2) Spell(slice_and_dice)
	if CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}
	{
		Spell(expose_armor)
	}
	if target.TicksRemain(rupture) <2 and Energy(more 90)
	{
		#dispatch,if=dot.rupture.ticks_remain<2&energy>90
		if BuffPresent(blindside) or target.HealthPercent(less 35) Spell(dispatch)
		#mutilate,if=dot.rupture.ticks_remain<2&energy>90
		Spell(mutilate)
	}
	#rupture,if=ticks_remain<2|(combo_points=5&ticks_remain<3)
	if target.TicksRemain(rupture) <2 or {ComboPoints(more 4) and target.TicksRemain(rupture) <3} Spell(rupture)
	#envenom,if=combo_points>4
	if ComboPoints(more 4) Spell(envenom)
	#envenom,if=combo_points>=2&buff.slice_and_dice.remains<3
	if ComboPoints(more 1) and BuffExpires(slice_and_dice 3) Spell(envenom)
	#dispatch,if=combo_points<5
	if ComboPoints(less 5) and {BuffPresent(blindside) or target.HealthPercent(less 35)} Spell(dispatch)
	#tricks_of_the_trade
	if CheckBoxOn(opt_tricks_of_the_trade) Spell(tricks_of_the_trade)
	#mutilate
	Spell(mutilate)
}

AddFunction AssassinationCooldownActions
{
	if InCombat(no)
	{
		if BuffPresent(lethal_poison 400) and BuffPresent(non_lethal_poison 400)
		{
			#virmens_bite_potion
			if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
			#stealth
			if not IsStealthed() Spell(stealth)
		}
	}

	if BuffPresent(lethal_poison)
	{
		#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
		if CheckBoxOn(potions) and target.Classification(worldboss) and {BuffPresent(burst_haste any=1) or target.TimeToDie() <40}
		{
			Item(virmens_bite_potion usable=1)
		}
		#preparation,if=talent.preparation.enabled&!buff.vanish.up&cooldown.vanish.remains>60
		if TalentPoints(preparation_talent) and BuffExpires(vanish) and SpellCooldown(vanish) >60 Spell(preparation)
		#kick
		if target.IsInterruptible() Interrupt()
		#use_item,name=gloves_of_the_thousandfold_blades
		UseItemActions()
		#berserking
		UseRacialActions()
		#vanish,if=time>10&!buff.stealthed.up&!buff.shadow_blades.up
		if TimeInCombat(more 10) and not IsStealthed() and BuffExpires(shadow_blades) Spell(vanish)

		unless IsStealthed()
		{
			#shadow_blades,if=(buff.bloodlust.react|time>60)
			if BuffPresent(burst_haste any=1) or TimeInCombat(more 60) Spell(shadow_blades)

			unless {BuffExpires(slice_and_dice 2) and ComboPoints(more 0)}
				or {CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}}
				or {target.TicksRemain(rupture) <2 and Energy(more 90)}
				or {target.TicksRemain(rupture) <2 or {ComboPoints(more 4) and target.TicksRemain(rupture) <3} and ComboPoints(more 0)}
			{
				#vendetta
				Spell(vendetta)
			}
		}
	}
}

AddIcon mastery=1 help=main
{
	AssassinationMainActions()
}

AddIcon mastery=1 help=main
{
	ApplyPoisons()
	AssassinationMainPlusFillerActions()
}

AddIcon mastery=1 help=cd
{
	AssassinationCooldownActions()
}

###
### Combat
###

AddFunction CombatFillerCondition
{
	{TalentPoints(anticipation_talent)
		and {{BuffExpires(deep_insight) and BuffStacks(anticipation) <5} or {BuffPresent(deep_insight) and ComboPoints(less 5)}}}
	or {not TalentPoints(anticipation_talent)
		and {ComboPoints() < {5 - BuffStacks(shadow_blades)}}}
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
		if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
		#stealth
		if not IsStealthed() Spell(stealth)
	}

	ApplyPoisons()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if CheckBoxOn(potions) and target.Classification(worldboss) and {BuffPresent(burst_haste any=1) or target.TimeToDie() <40}
	{
		Item(virmens_bite_potion usable=1)
	}
	#preparation,if=talent.preparation.enabled&!buff.vanish.up&cooldown.vanish.remains>60
	if TalentPoints(preparation_talent) and BuffExpires(vanish) and SpellCooldown(vanish) >60 Spell(preparation)
	#auto_attack
	#kick
	if target.IsInterruptible() Interrupt()
	#use_item,name=gloves_of_the_thousandfold_blades
	UseItemActions()
	#berserking
	UseRacialActions()
	if TimeInCombat(more 10) and not IsStealthed() and BuffExpires(shadow_blades) and BuffExpires(adrenaline_rush) and Energy(less 20)
	{
		if TalentPoints(anticipation_talent)
		{
			#vanish,if=time>10&!buff.shadow_blades.up&!buff.adrenaline_rush.up&energy<20&((buff.deep_insight.up&combo_points<4)|anticipation_charges<4)
			if {BuffPresent(deep_insight) and ComboPoints(less 4)} or BuffStacks(anticipation) <4 Spell(vanish)
		}
		if not TalentPoints(anticipation_talent)
		{
			#vanish,if=time>10&!buff.shadow_blades.up&!buff.adrenaline_rush.up&energy<20&combo_points<4
			if ComboPoints(less 4) Spell(vanish)
		}
	}
	#ambush
	if IsStealthed() Spell(ambush)
	#tricks_of_the_trade,if=set_bonus.tier13_2pc_melee
	if CheckBoxOn(opt_tricks_of_the_trade) and ArmorSetParts(T13 more 1) Spell(tricks_of_the_trade)
	#slice_and_dice,if=buff.slice_and_dice.remains<2|(buff.slice_and_dice.remains<15&buff.bandits_guile.stack=11&combo_points>=4)
	if BuffExpires(slice_and_dice 2)
		or {BuffExpires(slice_and_dice 15) and BuffPresent(moderate_insight) and ComboPoints(more 3)}
	{
		Spell(slice_and_dice)
	}
	#shadow_blades,if=(buff.bloodlust.react|time>60)&buff.slice_and_dice.remains>=buff.shadow_blades.duration
	if {BuffPresent(burst_haste any=1) or TimeInCombat(more 60)} and BuffRemains(slice_and_dice) >= SpellData(shadow_blades duration)
	{
		Spell(shadow_blades)
	}
	#killing_spree,if=energy<35&buff.slice_and_dice.remains>4&buff.adrenaline_rush.down
	if Energy(less 35) and BuffPresent(slice_and_dice 4) and BuffExpires(adrenaline_rush) Spell(killing_spree)
	#adrenaline_rush,if=energy<35|buff.shadow_blades.up
	if Energy(less 35) or BuffPresent(shadow_blades) Spell(adrenaline_rush)
	#rupture,if=ticks_remain<2&combo_points=5&buff.deep_insight.up&target.time_to_die>10
	if target.TicksRemain(rupture) < 2 and ComboPoints(more 4) and BuffPresent(deep_insight) and target.TimeToDie() >10 Spell(rupture)
	if TalentPoints(anticipation_talent)
	{
		#eviscerate,if=(combo_points=5&buff.deep_insight.up)|anticipation_charges>=4
		if {ComboPoints(more 4) and BuffPresent(deep_insight)} or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) >= 4}
		{
			Spell(eviscerate)
		}
	}
	if not TalentPoints(anticipation_talent)
	{
		#eviscerate,if=combo_points>=(5-buff.shadow_blades.up)
		if ComboPoints() >= {5 - BuffStacks(shadow_blades)}
		{
			Spell(eviscerate)
		}
	}
	#rupture,if=ticks_remain<2&combo_points=5&target.time_to_die>10
	if target.TicksRemain(rupture) < 2 and ComboPoints(more 5) and target.TimeToDie() >10 Spell(rupture)
	if CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}
	{
		Spell(expose_armor)
	}
	#revealing_strike,if=((buff.deep_insight.down&anticipation_charges<5)|(buff.deep_insight.up&combo_points<5))&ticks_remain<2
	if target.TicksRemain(revealing_strike) < 2 and CombatFillerCondition() Spell(revealing_strike)
	#tricks_of_the_trade
	if CheckBoxOn(opt_tricks_of_the_trade) Spell(tricks_of_the_trade)
	#sinister_strike,if=(buff.deep_insight.down&anticipation_charges<5)|(buff.deep_insight.up&combo_points<5)
	if CombatFillerCondition() Spell(sinister_strike)
}

AddFunction CombatFillerActions
{
	if CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}
	{
		Spell(expose_armor)
	}
	#revealing_strike,if=((buff.deep_insight.down&anticipation_charges<5)|(buff.deep_insight.up&combo_points<5))&ticks_remain<2
	if target.TicksRemain(revealing_strike) < 2 and CombatFillerCondition() Spell(revealing_strike)
	#sinister_strike,if=(buff.deep_insight.down&anticipation_charges<5)|(buff.deep_insight.up&combo_points<5)
	if CombatFillerCondition() Spell(sinister_strike)
}

AddFunction CombatMainActions
{
	#auto_attack
	#ambush
	if IsStealthed() Spell(ambush)
	#tricks_of_the_trade,if=set_bonus.tier13_2pc_melee
	if CheckBoxOn(opt_tricks_of_the_trade) and ArmorSetParts(T13 more 1) Spell(tricks_of_the_trade)
	#slice_and_dice,if=buff.slice_and_dice.remains<2|(buff.slice_and_dice.remains<15&buff.bandits_guile.stack=11&combo_points>=4)
	if BuffExpires(slice_and_dice 2)
		or {BuffExpires(slice_and_dice 15) and BuffPresent(moderate_insight) and ComboPoints(more 3)}
	{
		Spell(slice_and_dice)
	}
	#rupture,if=ticks_remain<2&combo_points=5&buff.deep_insight.up&target.time_to_die>10
	if target.TicksRemain(rupture) < 2 and ComboPoints(more 4) and BuffPresent(deep_insight) and target.TimeToDie() >10 Spell(rupture)
	if TalentPoints(anticipation_talent)
	{
		#eviscerate,if=(combo_points=5&buff.deep_insight.up)|anticipation_charges>=4
		if {ComboPoints(more 4) and BuffPresent(deep_insight)} or {TalentPoints(anticipation_talent) and BuffStacks(anticipation) >= 4}
		{
			Spell(eviscerate)
		}
	}
	if not TalentPoints(anticipation_talent)
	{
		#eviscerate,if=combo_points>=(5-buff.shadow_blades.up)
		if ComboPoints() >= {5 - BuffStacks(shadow_blades)}
		{
			Spell(eviscerate)
		}
	}
	#rupture,if=ticks_remain<2&combo_points=5&target.time_to_die>10
	if target.TicksRemain(rupture) < 2 and ComboPoints(more 5) and target.TimeToDie() >10 Spell(rupture)

	unless {CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}}
		or {target.TicksRemain(revealing_strike) < 2 and CombatFillerCondition()}
	{
		#tricks_of_the_trade
		if CheckBoxOn(opt_tricks_of_the_trade) Spell(tricks_of_the_trade)
	}
}

AddFunction CombatCooldownActions
{
	if InCombat(no)
	{
		if BuffPresent(lethal_poison 400) and BuffPresent(non_lethal_poison 400)
		{
			#virmens_bite_potion
			if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
			#stealth
			if not IsStealthed() Spell(stealth)
		}
	}

	if BuffPresent(lethal_poison)
	{
		#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
		if CheckBoxOn(potions) and target.Classification(worldboss) and {BuffPresent(burst_haste any=1) or target.TimeToDie() <40}
		{
			Item(virmens_bite_potion usable=1)
		}
		#preparation,if=talent.preparation.enabled&!buff.vanish.up&cooldown.vanish.remains>60
		if TalentPoints(preparation_talent) and BuffExpires(vanish) and SpellCooldown(vanish) >60 Spell(preparation)
		#kick
		if target.IsInterruptible() Interrupt()
		#use_item,name=gloves_of_the_thousandfold_blades
		UseItemActions()
		#berserking
		UseRacialActions()
		if TimeInCombat(more 10) and not IsStealthed() and BuffExpires(shadow_blades) and BuffExpires(adrenaline_rush) and Energy(less 20)
		{
			if TalentPoints(anticipation_talent)
			{
				#vanish,if=time>10&!buff.shadow_blades.up&!buff.adrenaline_rush.up&energy<20&((buff.deep_insight.up&combo_points<4)|anticipation_charges<4)
				if {BuffPresent(deep_insight) and ComboPoints(less 4)} or BuffStacks(anticipation) <4 Spell(vanish)
			}
			if not TalentPoints(anticipation_talent)
			{
				#vanish,if=time>10&!buff.shadow_blades.up&!buff.adrenaline_rush.up&energy<20&combo_points<4
				if ComboPoints(less 4) Spell(vanish)
			}
		}

		unless IsStealthed()
			or {CheckBoxOn(opt_tricks_of_the_trade) and ArmorSetParts(T13 more 1) and Spell(tricks_of_the_trade)}
			or {BuffExpires(slice_and_dice 2)
				or {BuffExpires(slice_and_dice 15) and BuffPresent(moderate_insight) and ComboPoints(more 3)}}
		{
			#shadow_blades,if=(buff.bloodlust.react|time>60)&buff.slice_and_dice.remains>=buff.shadow_blades.duration
			if {BuffPresent(burst_haste any=1) or TimeInCombat(more 60)} and BuffRemains(slice_and_dice) >= SpellData(shadow_blades duration)
			{
				Spell(shadow_blades)
			}
			#killing_spree,if=energy<35&buff.slice_and_dice.remains>4&buff.adrenaline_rush.down
			if Energy(less 35) and BuffPresent(slice_and_dice 4) and BuffExpires(adrenaline_rush) Spell(killing_spree)
			#adrenaline_rush,if=energy<35|buff.shadow_blades.up
			if Energy(less 35) or BuffPresent(shadow_blades) Spell(adrenaline_rush)
		}
	}
}

AddIcon mastery=2 help=main
{
	CombatMainActions()
}

AddIcon mastery=2 help=main
{
	ApplyPoisons()
	CombatMainActions()
	CombatFillerActions()
}

AddIcon mastery=2 help=cd
{
	CombatCooldownActions()
}

###
### Subtlety
###

# Subtlety rogues try to line up their on-use trinkets with Shadow Dance.
AddFunction UseItemActionsSubtlety
{
	if not List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	if not List(trinketcd1 000s) Item(Trinket1Slot usable=1)

	if List(trinketcd0 000s)
	{
		if List(trinketcd1 000s)
			if BuffPresent(shadow_dance) Item(HandsSlot usable=1)
		if not List(trinketcd1 000s)
			if BuffPresent(shadow_dance) Item(Trinket1Slot usable=1)
	}
	if not List(trinketcd0 000s)
	{
		if BuffPresent(shadow_dance) Item(Trinket0Slot usable=1)
		if not List(trinketcd1 000s)
			if SpellCooldown(shadow_dance) >20 Item(Trinket1Slot usable=1)
	}
	if not {List(trinketcd0 000s) and List(trinketcd1 000s)}
		if SpellCooldown(shadow_dance) >20 Item(HandsSlot usable=1)
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
		if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
		#stealth
		if not IsStealthed() Spell(stealth)
		#premeditation
		if IsStealthed() or BuffPresent(shadow_dance) Spell(premeditation)
		#slice_and_dice
		Spell(slice_and_dice)
	}

	ApplyPoisons()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
	if CheckBoxOn(potions) and target.Classification(worldboss) and {BuffPresent(burst_haste any=1) or target.TimeToDie() <40}
	{
		Item(virmens_bite_potion usable=1)
	}
	#preparation,if=talent.preparation.enabled&!buff.vanish.up&cooldown.vanish.remains>60
	if TalentPoints(preparation_talent) and BuffExpires(vanish) and SpellCooldown(vanish) >60 Spell(preparation)
	#auto_attack
	#kick
	if target.IsInterruptible() Interrupt()
	#shadow_blades
	Spell(shadow_blades)
	#pool_resource,for_next=1,extra_amount=75
	#shadow_dance,if=energy>=75&buff.stealthed.down&!target.debuff.find_weakness.up
	if Energy(more 75) and not IsStealthed() and target.DebuffExpires(find_weakness) Spell(shadow_dance)
	#use_item,name=gloves_of_the_thousandfold_blades,if=buff.shadow_dance.up
	UseItemActionsSubtlety()
	#berserking,if=buff.shadow_dance.up
	if BuffPresent(shadow_dance) UseRacialActions()
	#pool_resource,for_next=1,extra_amount=30
	#vanish,if=time>10&energy>=45&energy<=75&combo_points<=3&!buff.shadow_dance.up&!buff.master_of_subtlety.up&!target.debuff.find_weakness.up
	if TimeInCombat(more 10) and not IsStealthed() and Energy(more 45) and Energy(less 75)
		and BuffExpires(shadow_dance) and BuffExpires(master_of_subtlety) and target.DebuffExpires(find_weakness)
	{
		Spell(vanish)
	}
	#premeditation,if=(combo_points<=3&cooldown.honor_among_thieves.remains>1.75)|combo_points<=2
	if ComboPoints(less 3) and {IsStealthed() or BuffPresent(shadow_dance)} Spell(premeditation)
	#ambush,if=combo_points<=5&anticipation_charges=0
	if IsStealthed() or BuffPresent(shadow_dance)
	{
		if TalentPoints(anticipation_talent) and BuffStacks(anticipation) ==0 Spell(ambush)
		if not TalentPoints(anticipation_talent) and ComboPoints(less 3) Spell(ambush)
	}
	if ComboPoints(more 4)
	{
		#slice_and_dice,if=buff.slice_and_dice.remains<3&combo_points=5
		if BuffExpires(slice_and_dice 3) Spell(slice_and_dice)
		#rupture,if=combo_points=5&dot.rupture.remains<5
		if target.DebuffExpires(rupture 5) Spell(rupture)
	}
	#ambush,if=anticipation_charges<3&buff.shadow_dance.remains<=2
	if IsStealthed() or {BuffPresent(shadow_dance) and BuffExpires(shadow_dance 2)}
	{
		if TalentPoints(anticipation_talent) and BuffStacks(anticipation) <3 Spell(ambush)
		if not TalentPoints(anticipation_talent) and ComboPoints(less 3) Spell(ambush)
	}
	#eviscerate,if=combo_points=5
	if ComboPoints(more 4) Spell(eviscerate)
	if target.DebuffExpires(hemorrhage_dot 4)
	{
		#hemorrhage,if=combo_points<4&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints(less 4) Spell(hemorrhage)
		#hemorrhage,if=combo_points<5&energy>80&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints(less 5) and Energy(more 80) Spell(hemorrhage)
	}
	if CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}
	{
		Spell(expose_armor)
	}
	#backstab,if=combo_points<4&(cooldown.shadow_dance.remains>7|(cooldown.shadow_dance.remains=0&time<=9))
	if ComboPoints(less 4) and {SpellCooldown(shadow_dance) >7 or {Spell(shadow_dance) and TimeInCombat(less 9)}} Spell(backstab)
	#tricks_of_the_trade
	if CheckBoxOn(opt_tricks_of_the_trade) Spell(tricks_of_the_trade)
	#backstab,if=combo_points<5&energy>80&cooldown.shadow_dance.remains>=2
	if ComboPoints(less 5) and Energy(more 80) and SpellCooldown(shadow_dance) >=2 Spell(backstab)
}

AddFunction SubtletyMainActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#apply_poison,lethal=deadly
		ApplyPoisons()
		#snapshot_stats
		#slice_and_dice
		Spell(slice_and_dice)
	}

	ApplyPoisons()
	#auto_attack
	#ambush,if=combo_points<=5&anticipation_charges=0
	if IsStealthed() or BuffPresent(shadow_dance)
	{
		if TalentPoints(anticipation_talent) and BuffStacks(anticipation) ==0 Spell(ambush)
		if not TalentPoints(anticipation_talent) and ComboPoints(less 3) Spell(ambush)
	}
	if ComboPoints(more 4)
	{
		#slice_and_dice,if=buff.slice_and_dice.remains<3&combo_points=5
		if BuffExpires(slice_and_dice 3) Spell(slice_and_dice)
		#rupture,if=combo_points=5&dot.rupture.remains<5
		if target.DebuffExpires(rupture 5) Spell(rupture)
	}
	#ambush,if=anticipation_charges<3&buff.shadow_dance.remains<=2
	if IsStealthed() or {BuffPresent(shadow_dance) and BuffExpires(shadow_dance 2)}
	{
		if TalentPoints(anticipation_talent) and BuffStacks(anticipation) <3 Spell(ambush)
		if not TalentPoints(anticipation_talent) and ComboPoints(less 3) Spell(ambush)
	}
	#eviscerate,if=combo_points=5
	if ComboPoints(more 4) Spell(eviscerate)
	if target.DebuffExpires(hemorrhage_dot 4)
	{
		#hemorrhage,if=combo_points<4&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints(less 4) Spell(hemorrhage)
		#hemorrhage,if=combo_points<5&energy>80&(dot.hemorrhage.remains<4|position_front)
		if ComboPoints(less 5) and Energy(more 80) Spell(hemorrhage)
	}
	if CheckBoxOn(opt_expose_armor) and {target.DebuffExpires(weakened_armor 3 any=1) or target.DebuffStacks(weakened_armor any=1) <3}
	{
		Spell(expose_armor)
	}
	#backstab,if=combo_points<4&(cooldown.shadow_dance.remains>7|(cooldown.shadow_dance.remains=0&time<=9))
	if ComboPoints(less 4) and {SpellCooldown(shadow_dance) >7 or {Spell(shadow_dance) and TimeInCombat(less 9)}} Spell(backstab)
	#tricks_of_the_trade
	if CheckBoxOn(opt_tricks_of_the_trade) Spell(tricks_of_the_trade)
	#backstab,if=combo_points<5&energy>80&cooldown.shadow_dance.remains>=2
	if ComboPoints(less 5) and Energy(more 80) and SpellCooldown(shadow_dance) >=2 Spell(backstab)
}

AddFunction SubtletyStealthCooldownActions
{
	if InCombat(no)
	{
		if BuffPresent(lethal_poison 400) and BuffPresent(non_lethal_poison 400)
		{
			#stealth
			if not IsStealthed() Spell(stealth)
			#premeditation
			if IsStealthed() or BuffPresent(shadow_dance) Spell(premeditation)
		}
	}

	if BuffPresent(lethal_poison)
	{
		#preparation,if=talent.preparation.enabled&!buff.vanish.up&cooldown.vanish.remains>60
		if TalentPoints(preparation_talent) and BuffExpires(vanish) and SpellCooldown(vanish) >60 Spell(preparation)
		#pool_resource,for_next=1,extra_amount=75
		#shadow_dance,if=energy>=75&buff.stealthed.down&!target.debuff.find_weakness.up
		if Energy(more 75) and not IsStealthed() and target.DebuffExpires(find_weakness) Spell(shadow_dance)
		unless Spell(shadow_dance) and not IsStealthed() and target.DebuffExpires(find_weakness)
		{
			#pool_resource,for_next=1,extra_amount=30
			#vanish,if=time>10&energy>=45&energy<=75&combo_points<=3&!buff.shadow_dance.up&!buff.master_of_subtlety.up&!target.debuff.find_weakness.up
			if TimeInCombat(more 10) and not IsStealthed() and Energy(more 45) and Energy(less 75)
				and BuffExpires(shadow_dance) and BuffExpires(master_of_subtlety) and target.DebuffExpires(find_weakness)
			{
				Spell(vanish)
			}
			unless Spell(vanish) and TimeInCombat(more 10) and not IsStealthed() and Energy(less 75)
				and BuffExpires(shadow_dance) and BuffExpires(master_of_subtlety) and target.DebuffExpires(find_weakness)
			{
				#premeditation,if=(combo_points<=3&cooldown.honor_among_thieves.remains>1.75)|combo_points<=2
				if ComboPoints(less 3) and {IsStealthed() or BuffPresent(shadow_dance)} Spell(premeditation)
			}
		}
	}
}

AddFunction SubtletyCooldownActions
{
	if InCombat(no)
	{
		if BuffPresent(lethal_poison 400) and BuffPresent(non_lethal_poison 400)
		{
			#virmens_bite_potion
			if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
		}
	}

	if BuffPresent(lethal_poison)
	{
		#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<40
		if CheckBoxOn(potions) and target.Classification(worldboss) and {BuffPresent(burst_haste any=1) or target.TimeToDie() <40}
		{
			Item(virmens_bite_potion usable=1)
		}
		unless {TalentPoints(preparation_talent) and BuffExpires(vanish) and SpellCooldown(vanish) >60 and Spell(preparation)}
		{
			#kick
			if target.IsInterruptible() Interrupt()
			#shadow_blades
			Spell(shadow_blades)
			#pool_resource,for_next=1,extra_amount=75
			#shadow_dance,if=energy>=75&buff.stealthed.down&!target.debuff.find_weakness.up
			unless Spell(shadow_dance) and not IsStealthed() and target.DebuffExpires(find_weakness)
			{
				#use_item,name=gloves_of_the_thousandfold_blades,if=buff.shadow_dance.up
				UseItemActionsSubtlety()
				#berserking,if=buff.shadow_dance.up
				if BuffPresent(shadow_dance) UseRacialActions()
			}
		}
	}
}

AddIcon mastery=3 help=main
{
	SubtletyMainActions()
}

AddIcon mastery=3 help=cd
{
	SubtletyStealthCooldownActions()
}

AddIcon mastery=3 help=cd
{
	SubtletyCooldownActions()
}

# Survival cooldowns
AddIcon help=cd size=small
{
	Spell(feint)
	UseRacialSurvivalActions()
}

AddIcon help=cd size=small
{
	Spell(cloak_of_shadows)
}
]]
}

end