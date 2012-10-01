NerienOvaleScripts.script.HUNTER.Nerien = {
	desc = "Nerien: Beast Mastery, Survival",
	code =
[[
# Nerien's hunter script based on SimulationCraft
#
# Beast Mastery:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Ya!...120
#
# Survival:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Yb!...120

# Spells
Define(a_murder_of_crows 131894)
	SpellInfo(a_murder_of_crows cd=120 duration=30 focus=60 resetcounter=ss)
	SpellAddTargetDebuff(a_murder_of_crows a_murder_of_crows=1)
Define(a_murder_of_crows_talent 13)
Define(aimed_shot 19434)
	SpellInfo(aimed_shot focus=50 resetcounter=ss)
Define(arcane_shot 3044)
	SpellInfo(arcane_shot focus=20 resetcounter=ss)
Define(aspect_of_the_fox 82661)
Define(aspect_of_the_hawk 13165)
Define(aspect_of_the_iron_hawk 109260)
Define(aspect_of_the_iron_hawk_talent 8)
Define(barrage 120360)
	SpellInfo(barrage cd=30 focus=30 resetcounter=ss)
	SpellAddBuff(barrage barrage_buff=1)
Define(barrage_buff 120361)
	SpellInfo(barrage_buff duration=3 tick=0.2)
Define(barrage_talent 18)
Define(beast_within 34471)
	SpellInfo(beast_within duration=10)
Define(bestial_wrath 19574)
	SpellInfo(bestial_wrath cd=60)
	SpellAddBuff(bestial_wrath beast_within=1)
Define(binding_shot 109248)
	SpellInfo(binding_shot cd=45 focus=20 resetcounter=ss)
Define(binding_shot_talent 6)
Define(black_arrow 3674)
	SpellInfo(black_arrow cd=30 duration=20 focus=35 sharedcd=firetrap tick=2)
	SpellAddTargetDebuff(black_arrow black_arrow=1)
Define(blink_strike 130392)
	SpellInfo(blink_strike cd=20)
Define(blink_strike_talent 14)
Define(call_pet_1 883)
Define(chimera_shot 53209)
	SpellInfo(chimera_shot cd=9 focus=45 resetcounter=ss)
	SpellAddTargetDebuff(chimera_shot serpent_sting_dot=refresh)
Define(cobra_shot 77767)
	SpellInfo(cobra_shot focus=-14)
	SpellInfo(cobra_shot focus=-28 itemset=T13 itemcount=2)
Define(crouching_tiger_hidden_chimera_talent 3)
Define(deterrence 19263)
	SpellInfo(deterrence cd=120 duration=5)
	SpellInfo(deterrence addcd=-60 talent=crouching_tiger_hidden_chimera_talent)
	SpellAddBuff(deterrence deterrence=1)
Define(dire_beast 120679)
	SpellInfo(dire_beast cd=30)
Define(dire_beast_talent 11)
Define(disengage 781)
	SpellInfo(disengage cd=25)
	SpellInfo(disengage addcd=-10 talent=crouching_tiger_hidden_chimera_talent)
Define(explosive_shot 53301)
	SpellInfo(explosive_shot buffnocd=lock_and_load cd=6 duration=2 focus=25 tick=1)
	SpellAddTargetDebuff(explosive_shot explosive_shot=1)
Define(explosive_trap 13813)
	SpellInfo(explosive_trap cd=30 resetcounter=ss sharedcd=firetrap)
Define(explosive_trap_dot 13812)
	SpellInfo(explosive_trap_dot duration=20 tick=2)
Define(feign_death 5384)
	SpellInfo(feign_death cd=30 duration=360)
	SpellAddBuff(feign_death feign_death=1)
Define(fervor 82726)
	SpellInfo(fervor cd=30 duration=10 focus=-50)
	SpellAddBuff(fervor fervor=1)
Define(fervor_talent 10)
Define(focus_fire 82692)
	SpellInfo(focus_fire duration=20)
	SpellAddBuff(focus_fire focus_fire=1 pet_frenzy=0)
Define(glaive_toss 117050)
	SpellInfo(glaive_toss cd=15 focus=15 resetcounter=ss)
Define(glaive_toss_talent 16)
Define(glyph_of_marked_for_death 132106)
Define(glyph_of_tranquilizing_shot 119384)
Define(hunters_mark 1130)
	SpellInfo(hunters_mark duration=300)
	SpellAddTargetDebuff(hunters_mark hunters_mark=1)
Define(kill_command 34026)
	SpellInfo(kill_command cd=6 focus=40)
Define(kill_shot 53351)
	SpellInfo(kill_shot cd=10 resetcounter=ss)
Define(lock_and_load 56453)
Define(lynx_rush 120697)
	SpellInfo(lynx_rush cd=90)
Define(lynx_rush_talent 15)
Define(master_marksman_fire 82926)
	SpellInfo(master_marksman_fire duration=10)
Define(misdirection 34477)
	SpellInfo(misdirection cd=30 duration=20)
	SpellAddBuff(misdirection misdirection=1)
Define(multi_shot 2643)
	SpellInfo(multi_shot focus=40 resetcounter=ss)
Define(pet_frenzy 19615)
	SpellInfo(pet_frenzy duration=30)
Define(pet_nether_shock 50479)
	SpellInfo(pet_nether_shock cd=40)
Define(pet_pummel 26090)
	SpellInfo(pet_pummel cd=30)
Define(pet_serenity_dust 50318)
	SpellInfo(pet_serenity_dust cd=60)
Define(powershot 109259)
	SpellInfo(powershot focus=20 cd=60 resetcounter=ss)
Define(powershot_talent 17)
Define(rapid_fire 3045)
	SpellInfo(rapid_fire duration=15 cd=180)
	SpellAddBuff(rapid_fire rapid_fire=1)
Define(readiness 23989)
	SpellInfo(readiness cd=300)
Define(revive_pet 982)
Define(serpent_sting 1978)
	SpellInfo(serpent_sting focus=25 resetcounter=ss)
	SpellInfo(serpent_sting cd=1) # fake cd to allow for travel time
	SpellAddTargetDebuff(serpent_sting serpent_sting_dot=1)
Define(serpent_sting_dot 118253)
	SpellInfo(serpent_sting_dot duration=15 tick=3)
Define(silencing_shot 34490)
	SpellInfo(silencing_shot cd=20 resetcounter=ss)
Define(silencing_shot_talent 4)
Define(stampede 121818)
	SpellInfo(stampede cd=300)
Define(steady_focus 53220)
	SpellInfo(steady_focus duration=10)
Define(steady_shot 56641)
	SpellInfo(steady_shot focus=-14 inccounter=ss)
	SpellInfo(steady_shot focus=-28 itemset=T13 itemcount=2)
Define(thrill_of_the_hunt 34720)
	SpellInfo(thrill_of_the_hunt duration=15)
	SpellAddBuff(thrill_of_the_hunt thrill_of_the_hunt=1)
Define(thrill_of_the_hunt_talent 12)
Define(tier13_4pc 105919)
	SpellInfo(tier13_4pc duration=15)
Define(trap_launcher 77769)
	SpellInfo(trap_launcher cd=1.5)
Define(tranquilizing_shot 19801)
	SpellInfo(tranquilizing_shot focus=20)
	SpellInfo(tranquilizing_shot cd=10 focus=0 glyph=glyph_of_tranquilizing_shot resetcounter=ss)
Define(widow_venom 82654)
	SpellInfo(widow_venom duration=30 focus=15 resetcounter=ss)
	SpellAddTargetDebuff(widow_venom widow_venom=1)
Define(wyvern_sting 19386)
	SpellInfo(wyvern_sting cd=60 duration=30 focus=10 resetcounter=ss)
	SpellAddTargetDebuff(wyvern_sting wyvern_sting=1)
Define(wyvern_sting_talent 5)

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

AddCheckBox(targetdummy "Target Dummy")
AddFunction TimeUntilTargetIsDead
{
	if CheckBoxOn(targetdummy) 3600
	if CheckBoxOff(targetdummy) target.TimeToDie()
}

# Common hunter actions.

AddCheckBox(opt_widow_venom SpellName(widow_venom))

AddFunction SummonPet
{
	if pet.Present(no) Texture(ability_hunter_beastcall)
	if pet.Health(equal 0) Spell(revive_pet)
}

AddFunction Interrupt
{
	if TalentPoints(silencing_shot_talent) Spell(silencing_shot)
	if pet.Present()
	{
		Spell(pet_nether_shock)
		Spell(pet_pummel)
		Spell(pet_serenity_dust)
	}
}

# Misdirection.
AddIcon size=small
{
	Spell(misdirection)
}

# Aspect.
AddIcon help=offgcd size=small
{
	#aspect_of_the_hawk,moving=0
	if not Speed(more 0)
	{
		if TalentPoints(aspect_of_the_iron_hawk) and BuffExpires(aspect_of_the_iron_hawk) Spell(aspect_of_the_iron_hawk)
		if not TalentPoints(aspect_of_the_iron_hawk) and BuffExpires(aspect_of_the_hawk) Spell(aspect_of_the_hawk)
	}
	#aspect_of_the_fox,moving=1
	if Speed(more 0) and BuffExpires(aspect_of_the_fox) Spell(aspect_of_the_fox)
}

###
### Beast Mastery
###

AddFunction BeastMasteryFullRotation
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		if TimeUntilTargetIsDead() >21 and TargetDebuffExpires(ranged_vulnerability any=1) Spell(hunters_mark)
		#summon_pet
		SummonPet()
		if BuffExpires(trap_launcher) Spell(trap_launcher)
		#trueshot_aura
		#snapshot_stats
		#virmens_bite_potion
		if CheckBoxOn(potions) and TargetClassification(worldboss) Item(virmens_bite_potion usable=1)
	}

	SummonPet()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(burst_haste any=1) or TimeUntilTargetIsDead() <60}
	{
		Item(virmens_bite_potion usable=1)
	}
	UseItemActions()
	#auto_shot
	if TargetIsInterruptible() Interrupt()
	#explosive_trap,if=target.adds>0
	if CheckBoxOn(aoe) Spell(explosive_trap)
	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) ==5 Spell(focus_fire)
	#serpent_sting,if=!ticking
	if TargetDebuffExpires(serpent_sting_dot) Spell(serpent_sting)
	if CheckBoxOn(opt_widow_venom) and TargetDebuffExpires(healing_reduced 3) Spell(widow_venom)
	#blood_fury
	UseRacialActions()
	#fervor,if=enabled&!ticking&focus<=65
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus(less 65) Spell(fervor)
	#bestial_wrath,if=focus>60&!buff.beast_within.up
	if Focus(more 60) and BuffExpires(beast_within) Spell(bestial_wrath)
	#multi_shot,if=target.adds>5
	if CheckBoxOn(aoe) Spell(multi_shot)
	#cobra_shot,if=target.adds>5
	if CheckBoxOn(aoe) Spell(cobra_shot)
	#rapid_fire,if=!buff.rapid_fire.up
	if BuffExpires(rapid_fire) Spell(rapid_fire)
	#stampede
	Spell(stampede)
	#kill_shot
	if TargetHealthPercent(less 20) Spell(kill_shot)
	#kill_command
	Spell(kill_command)
	#a_murder_of_crows,if=enabled&!ticking
	if TalentPoints(a_murder_of_crows) and TargetDebuffExpires(a_murder_of_crows) Spell(a_murder_of_crows)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#lynx_rush,if=enabled&!ticking
	if TalentPoints(lynx_rush_talent) Spell(lynx_rush)
	#dire_beast,if=enabled&focus<=90
	if TalentPoints(dire_beast_talent) and Focus(less 90) Spell(dire_beast)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#blink_strike,if=enabled
	if TalentPoints(blink_strike_talent) Spell(blink_strike)
	#readiness,wait_for_rapid_fire=1
	if Spell(rapid_fire) or BuffPresent(rapid_fire) Spell(readiness)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt) Spell(arcane_shot)
	#focus_fire,five_stacks=1,if=!ticking&!buff.beast_within.up
	if BuffStacks(pet_frenzy any=1) ==5 and BuffExpires(focus_fire) and BuffExpires(beast_within) Spell(focus_fire)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if TargetDebuffExpires(serpent_sting_dot 6) Spell(cobra_shot)
	#arcane_shot,if=focus>=61|buff.beast_within.up
	if Focus(more 61) or BuffPresent(beast_within) Spell(arcane_shot)
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

# Focus generators used as filler attacks.
AddFunction BeastMasteryFillerActions
{
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

# Main rotation minus focus generators.
AddFunction BeastMasteryMainActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#summon_pet
		SummonPet()
		if BuffExpires(trap_launcher) Spell(trap_launcher)
		#trueshot_aura
		#snapshot_stats
	}

	SummonPet()
	#auto_shot
	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) ==5 Spell(focus_fire)
	#serpent_sting,if=!ticking
	if TargetDebuffExpires(serpent_sting_dot) Spell(serpent_sting)
	if CheckBoxOn(opt_widow_venom) and TargetDebuffExpires(healing_reduced 3) Spell(widow_venom)
	#fervor,if=enabled&!ticking&focus<=65
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus(less 65) Spell(fervor)
	#bestial_wrath,if=focus>60&!buff.beast_within.up
	if Focus(more 60) and BuffExpires(beast_within) Spell(bestial_wrath)
	#kill_shot
	if TargetHealthPercent(less 20) Spell(kill_shot)
	#kill_command
	Spell(kill_command)
	#a_murder_of_crows,if=enabled&!ticking
	if TalentPoints(a_murder_of_crows) and TargetDebuffExpires(a_murder_of_crows) Spell(a_murder_of_crows)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#dire_beast,if=enabled&focus<=90
	if TalentPoints(dire_beast_talent) and Focus(less 90) Spell(dire_beast)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#blink_strike,if=enabled
	if TalentPoints(blink_strike_talent) Spell(blink_strike)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt) Spell(arcane_shot)
	#focus_fire,five_stacks=1,if=!ticking&!buff.beast_within.up
	if BuffStacks(pet_frenzy any=1) ==5 and BuffExpires(focus_fire) and BuffExpires(beast_within) Spell(focus_fire)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if TargetDebuffExpires(serpent_sting_dot 6) Spell(cobra_shot)
	#arcane_shot,if=focus>=61|buff.beast_within.up
	if Focus(more 61) or BuffPresent(beast_within) Spell(arcane_shot)
}

AddFunction BeastMasteryAoEActions
{
	SummonPet()
	#explosive_trap,if=target.adds>0
	if CheckBoxOn(aoe) Spell(explosive_trap)
	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) ==5 Spell(focus_fire)
	#serpent_sting,if=!ticking
	if TargetDebuffExpires(serpent_sting_dot) Spell(serpent_sting)
	#fervor,if=enabled&!ticking&focus<=65
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus(less 65) Spell(fervor)
	#bestial_wrath,if=focus>60&!buff.beast_within.up
	if Focus(more 60) and BuffExpires(beast_within) Spell(bestial_wrath)
	#multi_shot,if=target.adds>5
	if CheckBoxOn(aoe) Spell(multi_shot)
	#cobra_shot,if=target.adds>5
	if CheckBoxOn(aoe) Spell(cobra_shot)
}

AddFunction BeastMasteryCooldownActions
{
	if InCombat(no)
	{
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		if TimeUntilTargetIsDead() >21 and TargetDebuffExpires(ranged_vulnerability any=1) Spell(hunters_mark)
		if pet.Present() and pet.Health(more 0)
		{
			#virmens_bite_potion
			if CheckBoxOn(potions) and TargetClassification(worldboss) Item(virmens_bite_potion usable=1)
		}
	}

	if pet.Present() and pet.Health(more 0)
	{
		#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
		if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(burst_haste any=1) or TimeUntilTargetIsDead() <60}
		{
			Item(virmens_bite_potion usable=1)
		}
		UseItemActions()
		if TargetIsInterruptible() Interrupt()

		unless BuffStacks(pet_frenzy any=1) ==5
			or TargetDebuffExpires(serpent_sting_dot)
			or {CheckBoxOn(opt_widow_venom) and TargetDebuffExpires(healing_reduced 3)}
		{
			#blood_fury
			UseRacialActions()

			unless {TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus(less 65) and Spell(fervor)}
				or {Focus(more 60) and BuffExpires(beast_within) and Spell(bestial_wrath)}
			{
				#rapid_fire,if=!buff.rapid_fire.up
				if BuffExpires(rapid_fire) Spell(rapid_fire)
				#stampede
				Spell(stampede)

				unless {TargetHealthPercent(less 20) and Spell(kill_shot)}
					or Spell(kill_command)
					or {TalentPoints(a_murder_of_crows) and TargetDebuffExpires(a_murder_of_crows) and Spell(a_murder_of_crows)}
					or {TalentPoints(glaive_toss_talent) and Spell(glaive_toss)}
				{
					#lynx_rush,if=enabled&!ticking
					if TalentPoints(lynx_rush_talent) Spell(lynx_rush)

					unless {TalentPoints(dire_beast_talent) and Focus(less 90) and Spell(dire_beast)}
						or {TalentPoints(barrage_talent) and Spell(barrage)}
						or {TalentPoints(powershot_talent) and Spell(powershot)}
						or {TalentPoints(blink_strike_talent) and Spell(blink_strike)}
					{
						#readiness,wait_for_rapid_fire=1
						if Spell(rapid_fire) or BuffPresent(rapid_fire) Spell(readiness)
					}
				}
			}
		}
	}
}

AddIcon mastery=1 help=main
{
	BeastMasteryMainActions()
}

AddIcon mastery=1 help=main
{
	BeastMasteryMainActions()
	BeastMasteryFillerActions()
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	BeastMasteryAoEActions()
}

AddIcon mastery=1 help=cd
{
	BeastMasteryCooldownActions()
}

###
### Survival
###

AddCheckBox(opt_black_arrow SpellName(black_arrow) default mastery=3)

AddFunction SurvivalFullRotation
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		if TimeUntilTargetIsDead() >21 and TargetDebuffExpires(ranged_vulnerability any=1) Spell(hunters_mark)
		#summon_pet
		SummonPet()
		if BuffExpires(trap_launcher) Spell(trap_launcher)
		#trueshot_aura
		#snapshot_stats
		#virmens_bite_potion
		if CheckBoxOn(potions) and TargetClassification(worldboss) Item(virmens_bite_potion usable=1)
	}

	SummonPet()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(burst_haste any=1) or TimeUntilTargetIsDead() <60}
	{
		Item(virmens_bite_potion usable=1)
	}
	#blood_fury
	UseRacialActions()
	UseItemActions()
	#auto_shot
	if TargetIsInterruptible() Interrupt()
	#explosive_trap,if=target.adds>0
	if CheckBoxOn(aoe) Spell(explosive_trap)
	#a_murder_of_crows,if=enabled&!ticking
	if TalentPoints(a_murder_of_crows) and TargetDebuffExpires(a_murder_of_crows) Spell(a_murder_of_crows)
	#blink_strike,if=enabled
	if TalentPoints(blink_strike_talent) Spell(blink_strike)
	#lynx_rush,if=enabled&!ticking
	if TalentPoints(lynx_rush_talent) Spell(lynx_rush)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load) Spell(explosive_shot)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#multi_shot,if=target.adds>2
	if CheckBoxOn(aoe) Spell(multi_shot)
	#cobra_shot,if=target.adds>2
	if CheckBoxOn(aoe) Spell(cobra_shot)
	#serpent_sting,if=!ticking&target.time_to_die>=10
	if TargetDebuffExpires(serpent_sting_dot) and TimeUntilTargetIsDead() >10 Spell(serpent_sting)
	if CheckBoxOn(opt_widow_venom) and TargetDebuffExpires(healing_reduced 3) Spell(widow_venom)
	#explosive_shot,if=cooldown_react
	Spell(explosive_shot)
	#kill_shot
	if TargetHealthPercent(less 20) Spell(kill_shot)
	#black_arrow,if=!ticking&target.time_to_die>=8
	if TimeUntilTargetIsDead() >8
	{
		if CheckBoxOn(opt_black_arrow) and TargetDebuffExpires(black_arrow) Spell(black_arrow)
		if CheckBoxOff(opt_black_arrow) Spell(explosive_trap)
	}
	if BuffPresent(thrill_of_the_hunt)
	{
		#multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
		if TargetDebuffExpires(serpent_sting_dot 2) Spell(multi_shot)
		#arcane_shot,if=buff.thrill_of_the_hunt.react
		Spell(arcane_shot)
	}
	#dire_beast,if=enabled
	if TalentPoints(dire_beast_talent) Spell(dire_beast)
	#rapid_fire,if=!buff.rapid_fire.up
	if BuffExpires(rapid_fire) Spell(rapid_fire)
	#stampede
	Spell(stampede)
	#readiness,wait_for_rapid_fire=1
	if Spell(rapid_fire) or BuffPresent(rapid_fire) Spell(readiness)
	#fervor,if=enabled&focus<=50
	if TalentPoints(fervor_talent) and Focus(less 50) Spell(fervor)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if TargetDebuffExpires(serpent_sting_dot 6) Spell(cobra_shot)
	#arcane_shot,if=focus>=67
	if Focus(more 67) Spell(arcane_shot)
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

# Focus generators used as filler attacks.
AddFunction SurvivalFillerActions
{
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

# Main rotation minus focus generators.
AddFunction SurvivalMainActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#summon_pet
		SummonPet()
		if BuffExpires(trap_launcher) Spell(trap_launcher)
		#trueshot_aura
		#snapshot_stats
	}

	SummonPet()
	#auto_shot
	#blink_strike,if=enabled
	if TalentPoints(blink_strike_talent) Spell(blink_strike)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load) Spell(explosive_shot)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#serpent_sting,if=!ticking&target.time_to_die>=10
	if TargetDebuffExpires(serpent_sting_dot) and TimeUntilTargetIsDead() >10 Spell(serpent_sting)
	if CheckBoxOn(opt_widow_venom) and TargetDebuffExpires(healing_reduced 3) Spell(widow_venom)
	#explosive_shot,if=cooldown_react
	Spell(explosive_shot)
	#kill_shot
	if TargetHealthPercent(less 20) Spell(kill_shot)
	#black_arrow,if=!ticking&target.time_to_die>=8
	if TimeUntilTargetIsDead() >8
	{
		if CheckBoxOn(opt_black_arrow) and TargetDebuffExpires(black_arrow) Spell(black_arrow)
		if CheckBoxOff(opt_black_arrow) Spell(explosive_trap)
	}
	if BuffPresent(thrill_of_the_hunt)
	{
		#multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
		if TargetDebuffExpires(serpent_sting_dot 2) Spell(multi_shot)
		#arcane_shot,if=buff.thrill_of_the_hunt.react
		Spell(arcane_shot)
	}
	#dire_beast,if=enabled
	if TalentPoints(dire_beast_talent) Spell(dire_beast)
	#fervor,if=enabled&focus<=50
	if TalentPoints(fervor_talent) and Focus(less 50) Spell(fervor)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if TargetDebuffExpires(serpent_sting_dot 6) Spell(cobra_shot)
	#arcane_shot,if=focus>=67
	if Focus(more 67) Spell(arcane_shot)
}

AddFunction SurvivalAoEActions
{
	SummonPet()
	#explosive_trap,if=target.adds>0
	if CheckBoxOn(aoe) Spell(explosive_trap)
	#lynx_rush,if=enabled&!ticking
	if TalentPoints(lynx_rush_talent) Spell(lynx_rush)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load) Spell(explosive_shot)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#multi_shot,if=target.adds>2
	if CheckBoxOn(aoe) Spell(multi_shot)
	#cobra_shot,if=target.adds>2
	if CheckBoxOn(aoe) Spell(cobra_shot)
}

AddFunction SurvivalCooldownActions
{
	if InCombat(no)
	{
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		if TimeUntilTargetIsDead() >21 and TargetDebuffExpires(ranged_vulnerability any=1) Spell(hunters_mark)
		if pet.Present() and pet.Health(more 0)
		{
			#virmens_bite_potion
			if CheckBoxOn(potions) and TargetClassification(worldboss) Item(virmens_bite_potion usable=1)
		}
	}

	if pet.Present() and pet.Health(more 0)
	{
		#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
		if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(burst_haste any=1) or TimeUntilTargetIsDead() <60}
		{
			Item(virmens_bite_potion usable=1)
		}
		#blood_fury
		UseRacialActions()
		UseItemActions()
		if TargetIsInterruptible() Interrupt()

		unless {TalentPoints(a_murder_of_crows) and TargetDebuffExpires(a_murder_of_crows) and Spell(a_murder_of_crows)}
			or {TalentPoints(blink_strike_talent) and Spell(blink_strike)}
		{
			#lynx_rush,if=enabled&!ticking
			if TalentPoints(lynx_rush_talent) Spell(lynx_rush)

			unless BuffPresent(lock_and_load)
				or {TalentPoints(glaive_toss_talent) and Spell(glaive_toss)}
				or {TalentPoints(powershot_talent) and Spell(powershot)}
				or {TalentPoints(barrage_talent) and Spell(barrage)}
				or {TargetDebuffExpires(serpent_sting_dot) and TimeUntilTargetIsDead() >10}
				or {CheckBoxOn(opt_widow_venom) and TargetDebuffExpires(healing_reduced 3)}
				or Spell(explosive_shot)
				or {TargetHealthPercent(less 20) and Spell(kill_shot)}
				or {TimeUntilTargetIsDead() >8
					and {{CheckBoxOn(opt_black_arrow) and TargetDebuffExpires(black_arrow) and Spell(black_arrow)}
						or {CheckBoxOff(opt_black_arrow) and Spell(explosive_trap)}}}
				or {BuffPresent(thrill_of_the_hunt)
					and {{TargetDebuffExpires(serpent_sting_dot 2) and Spell(multi_shot)} or Spell(arcane_shot)}}
				or {TalentPoints(dire_beast_talent) and Spell(dire_beast)}
			{
				#rapid_fire,if=!buff.rapid_fire.up
				if BuffExpires(rapid_fire) Spell(rapid_fire)
				#stampede
				Spell(stampede)
				#readiness,wait_for_rapid_fire=1
				if Spell(rapid_fire) or BuffPresent(rapid_fire) Spell(readiness)
			}
		}
	}
}

AddIcon mastery=3 help=main
{
	SurvivalMainActions()
}

AddIcon mastery=3 help=main
{
	SurvivalMainActions()
	SurvivalFillerActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	SurvivalAoEActions()
}

AddIcon mastery=3 help=cd
{
	SurvivalCooldownActions()
}

# Survival cooldowns.
AddIcon help=cd size=small
{
	Spell(deterrence)
	UseRacialSurvivalActions()
}

AddIcon help=cd size=small
{
	Spell(disengage)
}
]],
}