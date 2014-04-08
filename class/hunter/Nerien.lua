local _, NerienOvaleScripts = ...
local Ovale = NerienOvaleScripts.Ovale
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "Nerien"
	local desc = "[5.4] Nerien: Beast Mastery, Survival"
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
Define(a_murder_of_crows_debuff 131894)
	SpellInfo(a_murder_of_crows cd=120 duration=30 focus=60)
	SpellInfo(a_murder_of_crows buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(a_murder_of_crows if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(a_murder_of_crows a_murder_of_crows_debuff=1)
Define(a_murder_of_crows_talent 13)
Define(aimed_shot 19434)
	SpellInfo(aimed_shot focus=50)
	SpellInfo(aimed_shot buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(aimed_shot if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(aimed_shot master_marksman_fire=0)
Define(arcane_shot 3044)
	SpellInfo(arcane_shot focus=30)
	SpellInfo(arcane_shot buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(arcane_shot buff_focus=thrill_of_the_hunt_buff buff_focus_amount=-20 talent=thrill_of_the_hunt_talent)
	SpellInfo(arcane_shot if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(arcane_shot thrill_of_the_hunt_buff=-1)
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
	SpellInfo(barrage cd=30 focus=30)
	SpellInfo(barrage buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(barrage if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(barrage barrage_buff=1)
Define(barrage_buff 120361)
	SpellInfo(barrage_buff duration=3 tick=0.2)
Define(barrage_talent 18)
Define(beast_cleave_buff 118455)
	SpellInfo(beast_cleave_buff duration=4)
Define(beast_within_buff 34471)
	SpellInfo(beast_within_buff duration=10)
	SpellInfo(beast_within_buff addduration=6 itemset=T14 itemcount=4)
Define(bestial_wrath 19574)
	SpellInfo(bestial_wrath cd=60)
	SpellAddBuff(bestial_wrath beast_within_buff=1)
Define(binding_shot 109248)
	SpellInfo(binding_shot cd=45)
	SpellInfo(binding_shot if_spell=steady_focus resetcounter=ss)
Define(binding_shot_talent 4)
Define(black_arrow 3674)
	SpellInfo(black_arrow cd=30 focus=35)
	SpellInfo(black_arrow addcd=-6 if_spell=trap_mastery)
	SpellInfo(black_arrow buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellAddTargetDebuff(black_arrow black_arrow_debuff=1)
Define(black_arrow_debuff 3674)
	SpellInfo(black_arrow_debuff duration=20 tick=2)
Define(blink_strikes_talent 14)
Define(bombardment_buff 82921)
	SpellInfo(bombardment_buff duration=5)
Define(call_pet_1 883)
Define(call_pet_2 83242)
Define(call_pet_3 83243)
Define(call_pet_4 83244)
Define(call_pet_5 83245)
Define(camouflage 51753)
	SpellInfo(camouflage cd=60 focus=20)
	SpellInfo(camouflage buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellAddBuff(camouflage camouflage_buff=1)
Define(camouflage_buff 51755)
	SpellInfo(camouflage_buff duration=6)
Define(chimera_shot 53209)
	SpellInfo(chimera_shot cd=9 focus=45)
	SpellInfo(chimera_shot buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(chimera_shot if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(chimera_shot serpent_sting_debuff=refresh)
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
	SpellInfo(explosive_shot buffnocd=lock_and_load_buff buffnocost=lock_and_load_buff cd=6 focus=25)
	SpellAddTargetDebuff(explosive_shot explosive_shot_buff=1)
	SpellAddTargetDebuff(explosive_shot hunters_mark=1)
Define(explosive_shot_buff 53301)
	SpellInfo(explosive_shot_buff duration=2 tick=1)
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
	SpellInfo(fervor cd=30 focus=-50)
	SpellAddBuff(fervor fervor_buff=1)
Define(fervor_buff 82726)
	SpellInfo(fervor_buff duration=10)
Define(fervor_talent 10)
Define(focus_fire 82692)
Define(focus_fire_buff 82692)
	SpellInfo(focus_fire duration=20)
	SpellAddBuff(focus_fire focus_fire_buff=1 pet_frenzy=0)
Define(freezing_trap 1499)
	SpellInfo(freezing_trap cd=30 sharedcd=frosttrap)
	SpellInfo(freezing_trap addcd=-6 if_spell=trap_mastery)
Define(glaive_toss 117050)
	SpellInfo(glaive_toss cd=15 focus=15)
	SpellInfo(glaive_toss buffhalfcost=beast_within_buff mastery=beast_mastery)
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
	SpellInfo(kill_command cd=6 focus=40)
	SpellInfo(kill_command buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellAddTargetDebuff(kill_command hunters_mark=1)
Define(kill_shot 53351)
	SpellInfo(kill_shot cd=10)
	SpellInfo(kill_shot if_spell=steady_focus resetcounter=ss)
Define(lock_and_load_buff 56453)
	SpellInfo(lock_and_load_buff duration=12)
Define(lynx_rush 120697)
	SpellInfo(lynx_rush cd=90)
	SpellAddTargetDebuff(lynx_rush lynx_rush_debuff=1)
Define(lynx_rush_debuff 120699)
	SpellInfo(lynx_rush_debuff duration=15 tick=3)
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
	SpellInfo(multi_shot focus=40)
	SpellInfo(multi_shot buff_focus=thrill_of_the_hunt_buff buff_focus_amount=-20 talent=thrill_of_the_hunt_talent)
	SpellInfo(multi_shot buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(multi_shot if_spell=steady_focus resetcounter=ss)
	SpellInfo(multi_shot buff_focus=bombardment_buff buff_focus_amount=-20 mastery=marksmanship)
	SpellAddBuff(multi_shot thrill_of_the_hunt_buff=-1)
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
	SpellInfo(powershot cd=60 focus=15)
	SpellInfo(powershot buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(powershot if_spell=steady_focus resetcounter=ss)
	SpellAddBuff(powershot camouflage_buff=0)
Define(powershot_talent 17)
Define(rapid_fire 3045)
Define(rapid_fire_buff 3045)
	SpellInfo(rapid_fire duration=15 cd=180)
	SpellAddBuff(rapid_fire rapid_fire_buff=1)
Define(rapid_recuperation 54227)
	SpellInfo(rapid_recuperation duration=15 tick=3)
Define(revive_pet 982)
	SpellInfo(revive_pet focus=35)
	SpellInfo(revive_pet buffhalfcost=beast_within_buff mastery=beast_mastery)
Define(scare_beast_buff 1513)
	SpellInfo(scare_beast focus=25)
	SpellInfo(scare_beast buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellAddTargetDebuff(scare_beast scare_beast_buff=1)
Define(scare_beast_buff 1513)
	SpellInfo(scare_beast_buff duration=20)
Define(scatter_shot 19503)
	SpellInfo(scatter_shot cd=30 duration=4)
	SpellAddTargetDebuff(scatter_shot scatter_shot=1)
Define(serpent_sting 1978)
	SpellInfo(serpent_sting focus=15)
	SpellInfo(serpent_sting buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(serpent_sting if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(serpent_sting serpent_sting_debuff=1 wyvern_sting=0)
Define(serpent_sting_debuff 118253)
	SpellInfo(serpent_sting_debuff duration=15 tick=3)
Define(silencing_shot 34490)
	SpellInfo(silencing_shot cd=24)
	SpellInfo(silencing_shot if_spell=steady_focus resetcounter=ss)
Define(stampede 121818)
Define(stampede_buff 121818)	# XXX
	SpellInfo(stampede cd=300)
Define(steady_focus 53224)
Define(steady_focus_buff 53220)
	SpellInfo(steady_focus_buff duration=20)
Define(steady_shot 56641)
	SpellInfo(steady_shot focus=-14)
	SpellInfo(steady_shot focus=-28 itemset=T13 itemcount=2)
	SpellInfo(steady_shot buff_focus=steady_focus_buff buff_focus_amount=-3 if_spell=steady_focus inccounter=ss)
Define(thrill_of_the_hunt_buff 34720)
	SpellInfo(thrill_of_the_hunt_buff duration=15)
Define(thrill_of_the_hunt_talent 12)
Define(tranquilizing_shot 19801)
	SpellInfo(tranquilizing_shot focus=20)
	SpellInfo(tranquilizing_shot buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(tranquilizing_shot cd=10 glyph=glyph_of_tranquilizing_shot)
	SpellInfo(tranquilizing_shot if_spell=steady_focus resetcounter=ss)
Define(trap_launcher 77769)
	SpellInfo(trap_launcher cd=1.5)
Define(trap_mastery 63458)
Define(widow_venom 82654)
	SpellInfo(widow_venom focus=15)
	SpellInfo(widow_venom buffhalfcost=beast_within_buff mastery=beast_mastery)
	SpellInfo(widow_venom if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(widow_venom widow_venom_debuff=1)
Define(widow_venom_debuff 82654)
	SpellInfo(widow_venom_debuff duration=30)
Define(wyvern_sting 19386)
	SpellInfo(wyvern_sting cd=45 duration=30)
	SpellInfo(wyvern_sting if_spell=steady_focus resetcounter=ss)
	SpellAddTargetDebuff(wyvern_sting serpent_sting_debuff=0 wyvern_sting=1)
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

# Trinkets
SpellList(trinket_stat_agility_buff 126554 126690 126707 128984 138699 138938 146308 146310 148896 148903)
SpellList(trinket_stacking_stat_agility_buff 138756)

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
		if not Stance(hunter_aspect_of_the_iron_hawk) Spell(aspect_of_the_iron_hawk)
	}
	if not TalentPoints(aspect_of_the_iron_hawk_talent)
	{
		if not Stance(hunter_aspect_of_the_hawk) Spell(aspect_of_the_hawk)
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

###
### Beast Mastery
###

# Based on SimulationCraft profile "Hunter_BM_T16H".
#	class=hunter
#	spec=beast_mastery
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Ya!...100

AddFunction BeastMasteryFillerActions
{
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

AddFunction BeastMasteryDefaultActions
{
	#auto_shot
	#Spell(auto_shot)
	#serpent_sting,if=!ticking
	if not target.DebuffPresent(serpent_sting_debuff) Spell(serpent_sting)
	#kill_shot
	Spell(kill_shot usable=1)
	#kill_command
	Spell(kill_command)
	#arcane_shot,if=buff.thrill_of_the_hunt.react|buff.beast_within.up
	if BuffPresent(thrill_of_the_hunt_buff) or BuffPresent(beast_within_buff) Spell(arcane_shot)
	#focus_fire,five_stacks=1
	if BuffStacks(pet_frenzy any=1) == 5 Spell(focus_fire)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffRemains(serpent_sting_debuff) < 6 Spell(cobra_shot)
	#arcane_shot,if=focus>=61
	if Focus() >= 61 Spell(arcane_shot)
}

AddFunction BeastMasteryDefaultShortCdActions
{
	if InCombat(no)
	{
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		if target.TimeToDie() >= 21 and not target.DebuffPresent(ranged_vulnerability any=1) Spell(hunters_mark)
	}

	unless not target.DebuffPresent(serpent_sting_debuff)
	{
		#dire_beast,if=enabled
		if TalentPoints(dire_beast_talent) Spell(dire_beast)
		#fervor,if=enabled&focus<=65
		if TalentPoints(fervor_talent) and Focus() <= 65 Spell(fervor)
		#bestial_wrath,if=focus>60&!buff.beast_within.up
		if Focus() > 60 and not BuffPresent(beast_within_buff) Spell(bestial_wrath)

		unless Spell(kill_shot usable=1)
			or Spell(kill_command)
		{
			#a_murder_of_crows,if=enabled&!ticking
			if TalentPoints(a_murder_of_crows_talent) and not target.DebuffPresent(a_murder_of_crows_debuff) Spell(a_murder_of_crows)
			#glaive_toss,if=enabled
			if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
			#lynx_rush,if=enabled&!dot.lynx_rush.ticking
			if TalentPoints(lynx_rush_talent) and not target.DebuffPresent(lynx_rush_debuff) Spell(lynx_rush)
			#barrage,if=enabled
			if TalentPoints(barrage_talent) Spell(barrage)
			#powershot,if=enabled
			if TalentPoints(powershot_talent) Spell(powershot)
			#arcane_shot,if=buff.thrill_of_the_hunt.react|buff.beast_within.up

			unless BuffPresent(thrill_of_the_hunt_buff) or BuffPresent(beast_within_buff)
			{
				#focus_fire,five_stacks=1
				if BuffStacks(pet_frenzy any=1) == 5 Spell(focus_fire)
			}
		}
	}
}

AddFunction BeastMasteryDefaultCdActions
{
	#virmens_bite_potion,if=target.time_to_die<=25|buff.stampede.up
	if target.TimeToDie() <= 25 or BuffPresent(stampede_buff) UsePotion()
	#use_item,slot=hands
	UseItemActions()

	unless not target.DebuffPresent(serpent_sting_debuff)
	{
		#blood_fury
		UseRacialActions()

		unless { TalentPoints(dire_beast_talent) and Spell(dire_beast) }
			or { TalentPoints(fervor_talent) and Focus() <= 65 and Spell(fervor) }
			or { Focus() > 60 and not BuffPresent(beast_within_buff) and Spell(bestial_wrath) }
		{
			#rapid_fire,if=!buff.rapid_fire.up
			if not BuffPresent(rapid_fire_buff) Spell(rapid_fire)
			#stampede,if=trinket.stat.agility.up|target.time_to_die<=20|(trinket.stacking_stat.agility.stack>10&trinket.stat.agility.cooldown_remains<=3)
			if BuffPresent(trinket_stat_agility_buff) or target.TimeToDie() <= 20 or { BuffStacks(trinket_stacking_stat_agility_buff) > 10 and { ItemCooldown(Trinket0Slot) <= 3 or ItemCooldown(Trinket0Slot) <= 3 } } Spell(stampede)
		}
	}
}

AddFunction BeastMasteryAoeActions
{
	#auto_shot
	#Spell(auto_shot)
	#explosive_trap,if=active_enemies>1
	Spell(explosive_trap)
	#serpent_sting,if=!ticking
	if not target.DebuffPresent(serpent_sting_debuff) Spell(serpent_sting)
	#multi_shot,if=active_enemies>5|(active_enemies>1&buff.beast_cleave.down)
	if Enemies() > 5 or BuffExpires(beast_cleave_buff) Spell(multi_shot)
}

AddFunction BeastMasteryPrecombatActions
{
	#flask,type=spring_blossoms
	#food,type=sea_mist_rice_noodles
	#aspect_of_the_hawk
	AspectOfTheHawk()
	#summon_pet
	SummonPet()
	#snapshot_stats
}

AddFunction BeastMasteryPrecombatCdActions
{
	#virmens_bite_potion
	UsePotion()
}

### Beast Mastery icons

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
	BeastMasteryDefaultShortCdActions()
}

AddIcon mastery=1 help=main
{
	if InCombat(no) BeastMasteryPrecombatActions()
	BeastMasteryDefaultActions()
	BeastMasteryFillerActions()
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	if InCombat(no) BeastMasteryPrecombatActions()
	BeastMasteryAoeActions()
	BeastMasteryFillerActions()
}

AddIcon mastery=1 help=cd
{
	if InCombat(no) BeastMasteryPrecombatCdActions()
	Interrupt()
	BeastMasteryDefaultCdActions()
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

# Based on SimulationCraft profile "Hunter_SV_T16H".
#	class=hunter
#	spec=survival
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Yb!...200

AddFunction SurvivalFillerActions
{
	#cobra_shot
	Spell(cobra_shot)
	#steady_shot
	Spell(steady_shot)
}

AddFunction SurvivalDefaultActions
{
	#auto_shot
	#Spell(auto_shot)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load_buff) Spell(explosive_shot)
	#serpent_sting,if=!ticking&target.time_to_die>=10
	if not target.DebuffPresent(serpent_sting_debuff) and target.TimeToDie() >= 10 Spell(serpent_sting)
	#explosive_shot,if=cooldown_react
	Spell(explosive_shot)
	#kill_shot
	Spell(kill_shot usable=1)
	#multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
	if BuffPresent(thrill_of_the_hunt_buff) and target.DebuffRemains(serpent_sting_debuff) < 2 Spell(multi_shot)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt_buff) Spell(arcane_shot)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffRemains(serpent_sting_debuff) < 6 Spell(cobra_shot)
	#arcane_shot,if=focus>=67&active_enemies<2
	if Focus() >= 67 Spell(arcane_shot)
}

AddFunction SurvivalAoeActions
{
	#auto_shot
	#Spell(auto_shot)
	#explosive_trap,if=active_enemies>1
	Spell(explosive_trap)
	#serpent_sting,if=!ticking&target.time_to_die>=10
	if not target.DebuffPresent(serpent_sting_debuff) and target.TimeToDie() >= 10 Spell(serpent_sting)
	#explosive_shot,if=cooldown_react
	Spell(explosive_shot)
	#kill_shot
	Spell(kill_shot usable=1)
	#black_arrow,if=!ticking&target.time_to_die>=8
	if not target.DebuffPresent(black_arrow_debuff) and target.TimeToDie() >= 8 Spell(black_arrow)
	#multi_shot,if=active_enemies>3
	Spell(multi_shot)
	#multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
	if BuffPresent(thrill_of_the_hunt_buff) and target.DebuffRemains(serpent_sting_debuff) < 2 Spell(multi_shot)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt_buff) Spell(arcane_shot)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffRemains(serpent_sting_debuff) < 6 Spell(cobra_shot)
	#multi_shot,if=focus>=67&active_enemies>1
	if Focus() >= 67 Spell(multi_shot)
}

AddFunction SurvivalDefaultShortCdActions
{
	#fervor,if=enabled&focus<=50
	if TalentPoints(fervor_talent) and Focus() <= 50 Spell(fervor)
	#a_murder_of_crows,if=enabled&!ticking
	if TalentPoints(a_murder_of_crows_talent) and not target.DebuffPresent(a_murder_of_crows_debuff) Spell(a_murder_of_crows)
	#lynx_rush,if=enabled&!dot.lynx_rush.ticking
	if TalentPoints(lynx_rush_talent) and not target.DebuffPresent(lynx_rush_debuff) Spell(lynx_rush)

	unless {BuffPresent(lock_and_load_buff) and Spell(explosive_shot)}
	{
		#glaive_toss,if=enabled
		if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
		#powershot,if=enabled
		if TalentPoints(powershot_talent) Spell(powershot)
		#barrage,if=enabled
		if TalentPoints(barrage_talent) Spell(barrage)

		unless not target.DebuffPresent(serpent_sting_debuff) and target.TimeToDie() >= 10
			or Spell(explosive_shot)
			or Spell(kill_shot usable=1)
		{
			#black_arrow,if=!ticking&target.time_to_die>=8
			if not target.DebuffPresent(black_arrow_debuff) and target.TimeToDie() >= 8 Spell(black_arrow)

			unless {BuffPresent(thrill_of_the_hunt_buff) and target.DebuffRemains(serpent_sting_debuff) < 2}
				or BuffPresent(thrill_of_the_hunt_buff)
			{
				#dire_beast,if=enabled
				if TalentPoints(dire_beast_talent) Spell(dire_beast)
			}
		}
	}
}

AddFunction SurvivalDefaultCdActions
{
	if InCombat(no)
	{
		#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
		if target.TimeToDie() >= 21 and not target.DebuffPresent(ranged_vulnerability any=1) Spell(hunters_mark)
	}

	#virmens_bite_potion,if=target.time_to_die<=25|buff.stampede.up
	if target.TimeToDie() <= 25 or BuffPresent(stampede_buff) UsePotion()
	#use_item,slot=hands
	UseItemActions()
	#blood_fury
	UseRacialActions()

	#fervor,if=enabled&focus<=50
	unless {TalentPoints(fervor_talent) and Focus() <= 50 and Spell(fervor)}
		or {TalentPoints(a_murder_of_crows_talent) and not target.DebuffPresent(a_murder_of_crows_debuff) and Spell(a_murder_of_crows)}
		or {TalentPoints(lynx_rush_talent) and not target.DebuffPresent(lynx_rush_debuff) and Spell(lynx_rush)}
		or {BuffPresent(lock_and_load_buff) and Spell(explosive_shot)}
		or {TalentPoints(glaive_toss_talent) and Spell(glaive_toss)}
		or {TalentPoints(powershot_talent) and Spell(powershot)}
		or {TalentPoints(barrage_talent) and Spell(barrage)}
		or {not target.DebuffPresent(serpent_sting_debuff) and target.TimeToDie() >= 10}
		or Spell(explosive_shot)
		or Spell(kill_shot usable=1)
		or {not target.DebuffPresent(black_arrow_debuff) and target.TimeToDie() >= 8 and Spell(black_arrow)}
		or {BuffPresent(thrill_of_the_hunt_buff) and target.DebuffRemains(serpent_sting_debuff) < 2}
		or BuffPresent(thrill_of_the_hunt_buff)
	{
		#rapid_fire,if=!buff.rapid_fire.up
		if not BuffPresent(rapid_fire_buff) Spell(rapid_fire)

		unless TalentPoints(dire_beast_talent) and Spell(dire_beast)
		{
			#stampede,if=trinket.stat.agility.up|target.time_to_die<=20|(trinket.stacking_stat.agility.stack>10&trinket.stat.agility.cooldown_remains<=3)
			if BuffPresent(trinket_stat_agility_buff) or target.TimeToDie() <= 20 or { BuffStacks(trinket_stacking_stat_agility_buff) > 10 and { ItemCooldown(Trinket0Slot) <= 3 or ItemCooldown(Trinket0Slot) <= 3 } } Spell(stampede)
		}
	}
}

AddFunction SurvivalPrecombatActions
{
	#flask,type=spring_blossoms
	#food,type=sea_mist_rice_noodles
	#aspect_of_the_hawk
	AspectOfTheHawk()
	#summon_pet
	SummonPet()
	#snapshot_stats
	#virmens_bite_potion
	UsePotion()
}

AddFunction SurvivalPrecombatCdActions
{
	#virmens_bite_potion
	UsePotion()
}

### Survival icons

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
	SurvivalDefaultShortCdActions()
}

AddIcon mastery=3 help=main
{
	if InCombat(no) SurvivalPrecombatActions()
	SurvivalDefaultActions()
	SurvivalFillerActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	if InCombat(no) SurvivalPrecombatActions()
	SurvivalAoeActions()
	SurvivalFillerActions()
}

AddIcon mastery=3 help=cd
{
	if InCombat(no) SurvivalPrecombatCdActions()
	Interrupt()
	SurvivalDefaultCdActions()
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
