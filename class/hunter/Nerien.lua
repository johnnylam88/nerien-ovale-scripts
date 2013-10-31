local _, NerienOvaleScripts = ...
local Ovale = NerienOvaleScripts.Ovale
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "Nerien"
	local desc = "[5.3] Nerien: Beast Mastery, Survival"
	local code = [[
# Nerien's hunter script based on SimulationCraft
#
# Beast Mastery:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Ya!...100
#
# Survival:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Yb!...120

# Spells
Define(a_murder_of_crows 131894)
	SpellInfo(a_murder_of_crows cd=120 duration=30)
	SpellInfo(a_murder_of_crows if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(a_murder_of_crows a_murder_of_crows=1)
Define(a_murder_of_crows_talent 13)
Define(aimed_shot 19434)
	SpellInfo(aimed_shot if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(aimed_shot master_marksman_fire=0)
Define(arcane_shot 3044)
	SpellInfo(arcane_shot if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(arcane_shot thrill_of_the_hunt=-1)
	SpellAddTargetDebuff(arcane_shot hunters_mark=1)
Define(aspect_of_the_cheetah 5118)
	SpellInfo(aspect_of_the_cheetah cd=1)
Define(aspect_of_the_hawk 13165)
	SpellInfo(aspect_of_the_hawk cd=1)
Define(aspect_of_the_iron_hawk 109260)
	SpellInfo(aspect_of_the_iron_hawk cd=1)
Define(aspect_of_the_iron_hawk_talent 8)
Define(aspect_of_the_pack 13159)
	SpellInfo(aspect_of_the_pack cd=1)
Define(barrage 120360)
	SpellInfo(barrage cd=30)
	SpellInfo(barrage if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(barrage barrage_buff=1)
Define(barrage_buff 120361)
	SpellInfo(barrage_buff duration=3 tick=0.2)
Define(barrage_talent 18)
Define(beast_within 34471)
	SpellInfo(beast_within duration=10)
	SpellInfo(beast_within addduration=6 itemset=T14 itemcount=4)
Define(bestial_wrath 19574)
	SpellInfo(bestial_wrath cd=60)
	SpellAddBuff(bestial_wrath beast_within=1)
Define(binding_shot 109248)
	SpellInfo(binding_shot cd=45)
	SpellInfo(binding_shot if_spell=steady_focus resetcounter=ss)
Define(binding_shot_talent 4)
Define(black_arrow 3674)
	SpellInfo(black_arrow cd=30 duration=20 tick=2)
	SpellInfo(black_arrow addcd=-6 if_spell=trap_mastery)
	SpellAddTargetDebuff(black_arrow black_arrow=1)
Define(blink_strikes_talent 14)
Define(bombardment 82921)
	SpellInfo(bombardment duration=5)
Define(call_pet_1 883)
Define(call_pet_2 83242)
Define(call_pet_3 83243)
Define(call_pet_4 83244)
Define(call_pet_5 83245)
Define(camouflage 51753)
	SpellInfo(camouflage cd=60)
	SpellAddBuff(camouflage camouflage_buff=1)
Define(camouflage_buff 51755)
	SpellInfo(camouflage_buff duration=6)
Define(chimera_shot 53209)
	SpellInfo(chimera_shot cd=9)
	SpellInfo(chimera_shot if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(chimera_shot serpent_sting_dot=refresh)
	SpellAddTargetDebuff(chimera_shot hunters_mark=1)
Define(cobra_shot 77767)
	SpellInfo(cobra_shot focus=-14)
	SpellInfo(cobra_shot focus=-28 itemset=T13 itemcount=2)
Define(concussive_shot 5116)
	SpellInfo(concussive_shot cd=5 duration=6)
	SpellAddTargetDebuff(concussive_shot concussive_shot=1)
Define(counter_shot 147362)
	SpellInfo(counter_shot cd=24)
Define(crouching_tiger_hidden_chimera_talent 3)
Define(deterrence 19263)
	SpellInfo(deterrence cd=180 duration=5)
	SpellInfo(deterrence addcd=-60 talent=crouching_tiger_hidden_chimera_talent)
	SpellAddBuff(deterrence deterrence=1)
Define(dire_beast 120679)
	SpellInfo(dire_beast cd=30)
Define(dire_beast_talent 11)
Define(disengage 781)
	SpellInfo(disengage cd=20)
	SpellInfo(disengage addcd=-10 talent=crouching_tiger_hidden_chimera_talent)
Define(dismiss_pet 2641)
Define(distracting_shot 20736)
	SpellInfo(distracting_shot cd=8 duration=6)
Define(exhilaration 109304)
	SpellInfo(exhilaration cd=120)
Define(exhilaration_talent 7)
Define(explosive_shot 53301)
	SpellInfo(explosive_shot buffnocd=lock_and_load cd=6 duration=2 tick=1)
	SpellAddTargetDebuff(explosive_shot explosive_shot=1)
	SpellAddTargetDebuff(explosive_shot hunters_mark=1)
Define(explosive_trap 13813)
	SpellInfo(explosive_trap cd=30)
	SpellInfo(explosive_trap if_spell=steady_focus resetcounter=ss)
	SpellInfo(explosive_trap addcd=-6 if_spell=trap_mastery)
Define(explosive_trap_dot 13812)
	SpellInfo(explosive_trap_dot duration=20 tick=2)
Define(feed_pet 6991)
	SpellInfo(feed_pet cd=10)
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
Define(freezing_trap 1499)
	SpellInfo(freezing_trap cd=30 sharedcd=frosttrap)
	SpellInfo(freezing_trap addcd=-6 if_spell=trap_mastery)
Define(glaive_toss 117050)
	SpellInfo(glaive_toss cd=15)
	SpellInfo(glaive_toss if_spell=steady_focus resetcounter=ss)
Define(glaive_toss_talent 16)
Define(glyph_of_aimed_shot 126095)
Define(glyph_of_marked_for_death 132106)
Define(glyph_of_masters_call 63068)
Define(glyph_of_tranquilizing_shot 119384)
Define(hunters_mark 1130)
	SpellInfo(hunters_mark duration=300)
	SpellAddTargetDebuff(hunters_mark hunters_mark=1)
Define(ice_trap 1499)
	SpellInfo(ice_trap cd=30 sharedcd=frosttrap)
	SpellInfo(ice_trap addcd=-6 if_spell=trap_mastery)
Define(intimidation 19577)
	SpellInfo(intimidation cd=60)
Define(intimidation_debuff 24394)
	SpellInfo(intimidation_debuff duration=3)
Define(intimidation_talent 6)
Define(kill_command 34026)
	SpellInfo(kill_command cd=6)
	SpellAddTargetDebuff(kill_command hunters_mark=1)
Define(kill_shot 53351)
	SpellInfo(kill_shot cd=10)
	SpellInfo(kill_shot if_spell=steady_focus resetcounter=ss)
Define(lock_and_load 56453)
Define(lynx_rush 120697)
	SpellInfo(lynx_rush cd=90)
	SpellAddTargetDebuff(lynx_rush lynx_rush_dot=1)
Define(lynx_rush_dot 120699)
	SpellInfo(lynx_rush_dot duration=15 tick=3)
Define(lynx_rush_talent 15)
Define(master_marksman_fire 82926)
	SpellInfo(master_marksman_fire duration=10)
Define(masters_call 53271)
	SpellInfo(masters_call cd=45)
Define(mend_pet 136)
	SpellInfo(mend_pet canStopChannelling=5 tick=2)
Define(misdirection 34477)
	SpellInfo(misdirection cd=30 duration=20)
	SpellAddBuff(misdirection misdirection=1)
Define(multi_shot 2643)
	SpellInfo(multi_shot if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(multi_shot thrill_of_the_hunt=-1)
Define(pet_beast_cleave 118455)
	SpellInfo(pet_beast_cleave duration=4)
Define(pet_frenzy 19615)
	SpellInfo(pet_frenzy duration=30)
Define(pet_nether_shock 50479)
	SpellInfo(pet_nether_shock cd=40)
Define(pet_pummel 26090)
	SpellInfo(pet_pummel cd=30)
Define(pet_serenity_dust 50318)
	SpellInfo(pet_serenity_dust cd=60)
Define(powershot 109259)
	SpellInfo(powershot cd=60)
	SpellInfo(powershot if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(powershot camouflage_buff=0)
Define(powershot_talent 17)
Define(rapid_fire 3045)
	SpellInfo(rapid_fire duration=15 cd=180)
	SpellAddBuff(rapid_fire rapid_fire=1)
Define(rapid_recuperation 54227)
	SpellInfo(rapid_recuperation duration=15 tick=3)
Define(revive_pet 982)
Define(scare_beast 1513)
	SpellInfo(scare_beast duration=20)
	SpellAddTargetDebuff(scare_beast scare_beast=1)
Define(scatter_shot 19503)
	SpellInfo(scatter_shot cd=30 duration=4)
	SpellAddTargetDebuff(scatter_shot scatter_shot=1)
Define(serpent_sting 1978)
	SpellInfo(serpent_sting cd=1) # fake cd to allow for travel time
	SpellInfo(serpent_sting if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(serpent_sting serpent_sting_dot=1 wyvern_sting=0)
Define(serpent_sting_dot 118253)
	SpellInfo(serpent_sting_dot duration=15 tick=3)
Define(silencing_shot 34490)
	SpellInfo(silencing_shot cd=24)
	SpellInfo(silencing_shot if_spell=steady_focus resetcounter=ss)
Define(stampede 121818)
	SpellInfo(stampede cd=300)
Define(steady_focus 53224)
Define(steady_focus_buff 53220)
	SpellInfo(steady_focus_buff duration=20)
Define(steady_shot 56641)
	SpellInfo(steady_shot focus=-14)
	SpellInfo(steady_shot focus=-28 itemset=T13 itemcount=2)
	SpellInfo(steady_shot if_spell=steady_focus inccounter=ss)
Define(thrill_of_the_hunt 34720)
	SpellInfo(thrill_of_the_hunt duration=15)
Define(thrill_of_the_hunt_talent 12)
Define(tranquilizing_shot 19801)
	SpellInfo(tranquilizing_shot cd=10 glyph=glyph_of_tranquilizing_shot)
	SpellInfo(tranquilizing_shot if_spell=steady_focus resetcounter=ss)
Define(trap_launcher 77769)
	SpellInfo(trap_launcher cd=1.5)
Define(trap_mastery 63458)
Define(widow_venom 82654)
	SpellInfo(widow_venom duration=30)
	SpellInfo(widow_venom if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(widow_venom widow_venom=1)
Define(wyvern_sting 19386)
	SpellInfo(wyvern_sting cd=45 duration=30)
	SpellInfo(wyvern_sting if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(wyvern_sting serpent_sting_dot=0 wyvern_sting=1)
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
### Hunter (all specializations)
###

AddFunction AspectOfTheHawk
{
	if TalentPoints(aspect_of_the_iron_hawk_talent)
	{
		if BuffExpires(aspect_of_the_iron_hawk) Spell(aspect_of_the_iron_hawk)
	}
	if not TalentPoints(aspect_of_the_iron_hawk_talent)
	{
		if BuffExpires(aspect_of_the_hawk) Spell(aspect_of_the_hawk)
	}
}

AddFunction Interrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		Spell(silencing_shot)
		Spell(counter_shot)
		if pet.Present()
		{
			Spell(pet_nether_shock usable=1)
			Spell(pet_pummel usable=1)
			Spell(pet_serenity_dust usable=1)
		}
	}
}

AddFunction SummonPet
{
	if pet.Present(no) Texture(ability_hunter_beastcall)
	if pet.Health() ==0 Spell(revive_pet)
}

AddFunction UsePotion
{
	#virmens_bite_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
}

AddFunction HuntersMark
{
	if InCombat(no)
	{
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		if target.DebuffExpires(ranged_vulnerability any=1) Spell(hunters_mark)
	}
}

AddFunction PreCombatActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#aspect_of_the_hawk
		AspectOfTheHawk()
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		#summon_pet
		SummonPet()
		#snapshot_stats
		#virmens_bite_potion
		UsePotion()
	}
}

###
### Beast Mastery
###

AddFunction BeastMasteryFillerActions
{
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

AddFunction BeastMasteryFullRotation
{
	PreCombatActions()

	SummonPet()
	Interrupt()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <=60 UsePotion()
	#use_item_actions()
	UseItemActions()
	#use_profession_actions()
	#auto_shot
	#explosive_trap,if=active_enemies>1
	if Enemies() >1 Spell(explosive_trap)
	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) ==5 Spell(focus_fire)
	#serpent_sting,if=!ticking
	if target.DebuffExpires(serpent_sting_dot) Spell(serpent_sting)
	#blood_fury
	UseRacialActions()
	#fervor,if=enabled&!ticking&focus<=65
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=65 Spell(fervor)
	#bestial_wrath,if=focus>60&!buff.beast_within.up
	if Focus() >60 and BuffExpires(beast_within) Spell(bestial_wrath)
	#multi_shot,if=active_enemies>5|(active_enemies>2&buff.beast_cleave.down)
	if Enemies() >5 or {Enemies() >2 and pet.BuffExpires(pet_beast_cleave any=1)} Spell(multi_shot)
	#cobra_shot,if=active_enemies>5
	if Enemies() >5 Spell(cobra_shot)
	#rapid_fire,if=!buff.rapid_fire.up
	if BuffExpires(rapid_fire) Spell(rapid_fire)
	#stampede,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
	if BuffPresent(rapid_fire) or BuffPresent(burst_haste any=1) or target.TimeToDie() <=25 Spell(stampede)
	#kill_shot
	if target.HealthPercent() <20 Spell(kill_shot)
	#kill_command
	Spell(kill_command)
	#a_murder_of_crows,if=enabled&!ticking
	if TalentPoints(a_murder_of_crows_talent) and target.DebuffExpires(a_murder_of_crows) Spell(a_murder_of_crows)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#lynx_rush,if=enabled&!dot.lynx_rush.ticking
	if TalentPoints(lynx_rush_talent) Spell(lynx_rush)
	#dire_beast,if=enabled&focus<=90
	if TalentPoints(dire_beast_talent) and Focus() <=90 Spell(dire_beast)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt) Spell(arcane_shot)
	#focus_fire,five_stacks=1,if=!ticking&!buff.beast_within.up
	if BuffStacks(pet_frenzy any=1) ==5 and BuffExpires(focus_fire) and BuffExpires(beast_within) Spell(focus_fire)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffPresent(serpent_sting_dot) and target.DebuffRemains(serpent_sting_dot) <6 Spell(cobra_shot)
	#arcane_shot,if=focus>=61|buff.beast_within.up
	if Focus() >=61 or BuffPresent(beast_within) Spell(arcane_shot)
	BeastMasteryFillerActions()
}

AddFunction BeastMasteryFillerActions
{
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

AddFunction BeastMasteryMainActions
{
	#auto_shot
	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) ==5 Spell(focus_fire)
	#serpent_sting,if=!ticking
	if target.DebuffExpires(serpent_sting_dot) Spell(serpent_sting)
	#fervor,if=enabled&!ticking&focus<=65
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=65 Spell(fervor)
	#kill_shot
	if target.HealthPercent() <20 Spell(kill_shot)
	#kill_command
	Spell(kill_command)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt) Spell(arcane_shot)
	#focus_fire,five_stacks=1,if=!ticking&!buff.beast_within.up
	if BuffStacks(pet_frenzy any=1) ==5 and BuffExpires(focus_fire) and BuffExpires(beast_within) Spell(focus_fire)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffPresent(serpent_sting_dot) and target.DebuffRemains(serpent_sting_dot) <6 Spell(cobra_shot)
	#arcane_shot,if=focus>=61|buff.beast_within.up
	if Focus() >=61 or BuffPresent(beast_within) Spell(arcane_shot)
}

AddFunction BeastMasteryAoEActions
{
	#auto_shot
	#explosive_trap,if=active_enemies>1
	Spell(explosive_trap)
	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) ==5 Spell(focus_fire)
	#serpent_sting,if=!ticking
	if target.DebuffExpires(serpent_sting_dot) Spell(serpent_sting)
	#fervor,if=enabled&!ticking&focus<=65
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=65 Spell(fervor)
	#multi_shot,if=active_enemies>5|(active_enemies>2&buff.beast_cleave.down)
	#if Enemies() >5 or {Enemies() >2 and pet.BuffExpires(pet_beast_cleave any=1)} Spell(multi_shot)
	Spell(multi_shot)
	#cobra_shot,if=active_enemies>5
	#if Enemies() >5 Spell(cobra_shot)
}

AddFunction BeastMasteryShortCooldownActions
{
	HuntersMark()

	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) ==5 Spell(focus_fire)

	unless target.DebuffExpires(serpent_sting_dot)
		or {TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=65 and Spell(fervor)}
	{
		#bestial_wrath,if=focus>60&!buff.beast_within.up
		if Focus() >60 and BuffExpires(beast_within) Spell(bestial_wrath)
		#barrage,if=enabled
		if TalentPoints(barrage_talent) Spell(barrage)
		#powershot,if=enabled
		if TalentPoints(powershot_talent) Spell(powershot)
	}
}

AddFunction BeastMasteryCooldownActions
{
	if InCombat(no)
	{
		#virmens_bite_potion
		UsePotion()
	}

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <=60 UsePotion()
	#use_item_actions()
	UseItemActions()
	#use_profession_actions()

	unless target.DebuffExpires(serpent_sting_dot)
	{
		#blood_fury
		UseRacialActions()
		#rapid_fire,if=!buff.rapid_fire.up
		if BuffExpires(rapid_fire) Spell(rapid_fire)
		#stampede,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
		if BuffPresent(rapid_fire) or BuffPresent(burst_haste any=1) or target.TimeToDie() <=25 Spell(stampede)
		#a_murder_of_crows,if=enabled&!ticking
		if TalentPoints(a_murder_of_crows_talent) and target.DebuffExpires(a_murder_of_crows)
		{
			if target.HealthPercent() >=20 Spell(a_murder_of_crows)
		}
		#lynx_rush,if=enabled&!dot.lynx_rush.ticking
		if TalentPoints(lynx_rush_talent) Spell(lynx_rush)
		#dire_beast,if=enabled&focus<=90
		if TalentPoints(dire_beast_talent) and Focus() <=90 Spell(dire_beast)
	}
}

AddIcon mastery=1 size=small checkboxon=opt_icons_left
{
	Spell(misdirection)
}

AddIcon mastery=1 size=small checkboxon=opt_icons_left
{
	Spell(disengage)
}

AddIcon mastery=1 help=shortcd
{
	BeastMasteryShortCooldownActions()
}

AddIcon mastery=1 help=main
{
	PreCombatActions()
	BeastMasteryMainActions()
	BeastMasteryFillerActions()
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	PreCombatActions()
	BeastMasteryAoEActions()
	BeastMasteryFillerActions()
}

AddIcon mastery=1 help=cd
{
	BeastMasteryCooldownActions()
}

AddIcon mastery=1 size=small checkboxon=opt_icons_right
{
	Spell(deterrence)
}

AddIcon mastery=1 size=small checkboxon=opt_icons_right
{
	UseItemActions()
}

###
### Survival
###

AddFunction SurvivalFillerActions
{
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

AddFunction SurvivalFullRotation
{
	PreCombatActions()

	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <=60 UsePotion()
	#blood_fury
	UseRacialActions()
	UseItemActions()
	#auto_shot
	#explosive_trap,if=active_enemies>1
	if CheckBoxOn(aoe) Spell(explosive_trap)
	#fervor,if=enabled&focus<=50
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=50 Spell(fervor)
	#a_murder_of_crows,if=enabled&!ticking
	if TalentPoints(a_murder_of_crows_talent) and target.DebuffExpires(a_murder_of_crows) Spell(a_murder_of_crows)
	#lynx_rush,if=enabled&!dot.lynx_rush.ticking
	if TalentPoints(lynx_rush_talent) Spell(lynx_rush)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load) Spell(explosive_shot)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#multi_shot,if=active_enemies>3
	if Enemies() >3 Spell(multi_shot)
	#cobra_shot,if=active_enemies>3
	if Enemies() >3 Spell(cobra_shot)
	#serpent_sting,if=!ticking&target.time_to_die>=10
	if target.DebuffExpires(serpent_sting_dot) and target.TimeToDie() >=10 Spell(serpent_sting)
	#explosive_shot,if=cooldown_react
	Spell(explosive_shot)
	#kill_shot
	if target.HealthPercent() <20 Spell(kill_shot)
	#black_arrow,if=!ticking&target.time_to_die>=8
	if target.DebuffExpires(black_arrow) and target.TimeToDie() >=8 Spell(black_arrow)
	#multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
	if BuffPresent(thrill_of_the_hunt) and target.DebuffExpires(serpent_sting_dot) <2 Spell(multi_shot)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt) Spell(arcane_shot)
	#rapid_fire,if=!buff.rapid_fire.up
	if BuffExpires(rapid_fire) Spell(rapid_fire)
	#dire_beast,if=enabled
	if TalentPoints(dire_beast_talent) Spell(dire_beast)
	#stampede,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
	if BuffPresent(rapid_fire) or BuffPresent(burst_haste any=1) or target.TimeToDie() <=25 Spell(stampede)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffPresent(serpent_sting_dot) and target.DebuffRemains(serpent_sting_dot) <6 Spell(cobra_shot)
	#arcane_shot,if=focus>=67
	if Focus() >=67 Spell(arcane_shot)
	SurvivalFillerActions()
}

AddFunction SurvivalMainActions
{
	SummonPet()
	#auto_shot
	#fervor,if=enabled&focus<=50
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=50 Spell(fervor)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load) Spell(explosive_shot)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#serpent_sting,if=!ticking&target.time_to_die>=10
	if target.DebuffExpires(serpent_sting_dot) and target.TimeToDie() >=10 Spell(serpent_sting)
	#explosive_shot,if=cooldown_react
	Spell(explosive_shot)
	#kill_shot
	if target.HealthPercent() <20 Spell(kill_shot)
	#black_arrow,if=!ticking&target.time_to_die>=8
	if target.DebuffExpires(black_arrow) and target.TimeToDie() >=8 Spell(black_arrow)
	#multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
	if BuffPresent(thrill_of_the_hunt) and target.DebuffExpires(serpent_sting_dot) <2 Spell(multi_shot)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt) Spell(arcane_shot)
	#dire_beast,if=enabled
	if TalentPoints(dire_beast_talent) Spell(dire_beast)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffPresent(serpent_sting_dot) and target.DebuffRemains(serpent_sting_dot) <6 Spell(cobra_shot)
	#arcane_shot,if=focus>=67
	if Focus() >=67 Spell(arcane_shot)
}

AddFunction SurvivalAoEActions
{
	SummonPet()
	#auto_shot
	#explosive_trap,if=active_enemies>1
	Spell(explosive_trap)
	#fervor,if=enabled&focus<=50
	if TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=50 Spell(fervor)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load) Spell(explosive_shot)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#multi_shot,if=active_enemies>3
	#if Enemies() >3 Spell(multi_shot)
	Spell(multi_shot)
	#cobra_shot,if=active_enemies>3
	#if Enemies() >3 Spell(cobra_shot)
}

AddFunction SurvivalShortCooldownActions
{
	HuntersMark()

	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load) Spell(explosive_shot)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
}

AddFunction SurvivalCooldownActions
{
	if InCombat(no)
	{
		#virmens_bite_potion
		UsePotion()
	}

	Interrupt()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <=60 UsePotion()
	#blood_fury
	UseRacialActions()
	UseItemActions()
	unless TalentPoints(fervor_talent) and BuffExpires(fervor) and Focus() <=50 and Spell(fervor)
	{
		#a_murder_of_crows,if=enabled&!ticking
		if TalentPoints(a_murder_of_crows_talent) and target.DebuffExpires(a_murder_of_crows) Spell(a_murder_of_crows)
		#lynx_rush,if=enabled&!dot.lynx_rush.ticking
		if TalentPoints(lynx_rush_talent) Spell(lynx_rush)

		unless target.DebuffExpires(serpent_sting_dot)
			or {target.DebuffExpires(black_arrow) and Spell(black_arrow)}
		{
			#rapid_fire,if=!buff.rapid_fire.up
			if BuffExpires(rapid_fire) Spell(rapid_fire)
			#stampede,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
			if BuffPresent(rapid_fire) or BuffPresent(burst_haste any=1) or target.TimeToDie() <=25 Spell(stampede)
		}
	}
}

AddIcon mastery=3 size=small checkboxon=opt_icons_left
{
	Spell(misdirection)
}

AddIcon mastery=3 size=small checkboxon=opt_icons_left
{
	Spell(disengage)
}

AddIcon mastery=3 help=shortcd
{
	SurvivalShortCooldownActions()
}

AddIcon mastery=3 help=main
{
	PreCombatActions()
	SurvivalMainActions()
	SurvivalFillerActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	PreCombatActions()
	SurvivalAoEActions()
	SurvivalFillerActions()
}

AddIcon mastery=3 help=cd
{
	SurvivalCooldownActions()
}

AddIcon mastery=3 size=small checkboxon=opt_icons_right
{
	Spell(deterrence)
}

AddIcon mastery=3 size=small checkboxon=opt_icons_right
{
	UseItemActions()
}
]]

	OvaleScripts:RegisterScript("HUNTER", name, desc, code)
end
