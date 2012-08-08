NerienOvaleScripts.script["HUNTER"] =
[[
# Nerien's Hunter Ovale script based on SimulationCraft.
#
# BM:
#	talents=http://www.wowhead.com/talent#hunter-2330230311320112121230200000000000000003000000000000000000
#	glyphs=kill_command/arcane_shot/kill_shot/bestial_wrath
#
# MM:
#	talents=http://www.wowhead.com/talent#hunter-0230020000000000000230232003212023122103000000000000000000
#	glyphs=steady_shot/aimed_shot/rapid_fire
#
# SV:
#	talents=http://www.wowhead.com/talent#hunter-0300000000000000000230200000000000000023203003023022121311
#	glyphs=arcane_shot/kill_shot/explosive_shot

# Buffs
Define(CHRONOHUNTER 105919) # 4pT13 buff; 105s ICD(?)
Define(FIRE 82926) # proc from Master Marksman talent
Define(FRENZYEFFECT 19615)
Define(IMPROVEDSTEADYSHOT 53220)
Define(LOCKANDLOAD 56453)
Define(RABIDPOWER 53403) # Rabid (pet talent)
Define(THEBEASTWITHIN 34692)

# Debuffs
Define(MARKEDFORDEATH 88691)
Define(SERPENTSTINGSPREADRANKONE 88453)
Define(SERPENTSTINGSPREADRANKTWO 88466)
SpellList(SERPENTSTINGDEBUFF 1978 88453 88466)
Define(PETDUSTCLOUDDEBUFF 54404)
Define(PETTAILSPINDEBUFF 90315)

# Glyphs
Define(GLYPHOFARCANESHOT 56995)
Define(GLYPHOFTRAPLAUNCHER 56996)

# Talents
Define(BLACKARROWTALENT 9480)
Define(IMPROVEDSTEADYSHOTTALENT 9402) # Improved Steady Shot (Rank 3)

# Spells
Define(AIMEDSHOT 19434)
	SpellInfo(AIMEDSHOT mana=50 resetcounter=iss)
Define(AIMEDSHOTBANG 82928)
	SpellInfo(AIMEDSHOTBANG resetcounter=iss)
	SpellAddBuff(AIMEDSHOTBANG FIRE=0)
Define(ARCANESHOT 3044)
	SpellInfo(ARCANESHOT mana=22 resetcounter=iss) # assume Efficiency (Rank 3) (normally 25)
Define(ASPECTOFTHEFOX 82661)
	SpellAddBuff(ASPECTOFTHEFOX ASPECTOFTHEFOX=1000)
Define(ASPECTOFTHEHAWK 13165)
	SpellAddBuff(ASPECTOFTHEHAWK ASPECTOFTHEHAWK=1000)
Define(BESTIALWRATH 19574)
	SpellInfo(BESTIALWRATH cd=120)
	SpellAddBuff(BESTIALWRATH BESTIALWRATH=10)
Define(BLACKARROW 3674)
	SpellInfo(BLACKARROW cd=30 sharedcd=firetrap mana=35)
	SpellAddTargetDebuff(BLACKARROW BLACKARROW=15)
Define(CALLPETONE 883)
Define(CALLPETTWO 83242)
Define(CALLPETTHREE 83243)
Define(CALLPETFOUR 83244)
Define(CALLPETFIVE 83245)
Define(CHIMERASHOT 53209)
	SpellInfo(CHIMERASHOT cd=10 mana=44 resetcounter=iss) # assume Efficiency (Rank 3) (normally 50)
	SpellAddTargetDebuff(CHIMERASHOT SERPENTSTING=refresh SERPENTSTINGSPREADRANKONE=refresh SERPENTSTINGSPREADRANKTWO=refresh)
Define(COBRASHOT 77767)
	SpellInfo(COBRASHOT mana=-9 resetcounter=iss)
	SpellInfo(COBRASHOT mana=-18 itemset=T13 itemcount=2)
	SpellAddTargetDebuff(COBRASHOT SERPENTSTING=refresh SERPENTSTINGSPREADRANKONE=refresh SERPENTSTINGSPREADRANKTWO=refresh)
Define(EXPLOSIVESHOT 53301)
	SpellInfo(EXPLOSIVESHOT cd=6 mana=44 resetcounter=iss buffnocd=LOCKANDLOAD) # assume Efficiency (Rank 3) (normally 50)
	SpellAddTargetDebuff(EXPLOSIVESHOT EXPLOSIVESHOT=2)
	SpellAddBuff(EXPLOSIVESHOT LOCKANDLOAD=-1)
Define(EXPLOSIVETRAPLAUNCHER 82939)
	SpellInfo(EXPLOSIVETRAPLAUNCHER cd=30 sharedcd=firetrap)
Define(FERVOR 82726)
	SpellInfo(FERVOR mana=-50 cd=120)
Define(FOCUSFIRE 82692)
	SpellInfo(FOCUSFIRE cd=15)
	SpellAddBuff(FOCUSFIRE FOCUSFIRE=15)
Define(HUNTERSMARK 1130)
	SpellAddTargetDebuff(HUNTERSMARK HUNTERSMARK=300)
Define(KILLCOMMAND 34026)
	SpellInfo(KILLCOMMAND cd=6 mana=40 resetcounter=iss)
Define(KILLSHOT 53351)
	SpellInfo(KILLSHOT cd=10 resetcounter=iss)
Define(MISDIRECTION 34477)
	SpellInfo(MISDIRECTION cd=30)
Define(MULTISHOT 2643)
	SpellInfo(MULTISHOT mana=40 resetcounter=iss)
Define(RAPIDFIRE 3045)
	SpellInfo(RAPIDFIRE cd=300 resetcounter=iss)
	SpellAddBuff(RAPIDFIRE RAPIDFIRE=15)
Define(READINESS 23989)
	SpellInfo(READINESS cd=180 resetcounter=iss)
Define(REVIVEPET 982)
	SpellInfo(REVIVEPET mana=35 resetcounter=iss)
Define(SERPENTSTING 1978)
	SpellInfo(SERPENTSTING duration=15 mana=25 resetcounter=iss)
	SpellAddTargetDebuff(SERPENTSTING SERPENTSTING=15)
Define(SILENCINGSHOT 34490)
	SpellInfo(SILENCINGSHOT cd=20 resetcounter=iss)
Define(STEADYSHOT 56641)
	SpellInfo(STEADYSHOT mana=-9 inccounter=iss)
	SpellInfo(STEADYSHOT mana=-18 itemset=T13 itemcount=2)
Define(TRAPLAUNCHER 77769)
	SpellInfo(TRAPLAUNCHER cd=1.5 mana=20)
	SpellInfo(TRAPLAUNCHER mana=10 glyph=GLYPHOFTRAPLAUNCHER)
	SpellAddBuff(TRAPLAUNCHER TRAPLAUNCHER=15)

# Pet spells
Define(PETACIDSPIT 55749) # Worm
	SpellInfo(PETACIDSPIT cd=25)
	SpellAddDebuff(PETACIDSPIT PETACIDSPIT=25) # physicaldamagetaken
Define(PETBITE 17253)
Define(PETCALLOFTHEWILD 53434)
	SpellInfo(PETCALLOFTHEWILD cd=300)
	SpellAddBuff(PETCALLOFTHEWILD PETCALLOFTHEWILD=20)
Define(PETCLAW 16827)
Define(PETCORROSIVESPIT 35387) # Serpent
	SpellInfo(PETCORROSIVESPIT cd=6)
	SpellAddDebuff(PETCORROSIVESPIT PETCORROSIVESPIT=30) # lowerarmor
Define(PETDEMOROAR 50256) # Bear
	SpellInfo(PETDEMOROAR cd=10)
	SpellAddDebuff(PETDEMOROAR PETDEMOROAR=15) # lowerphysicaldamage
Define(PETDEMOSCREECH 24423) # Carrion Bird
	SpellInfo(PETDEMOSCREECH cd=10)
	SpellAddDebuff(PETDEMOSCREECH PETDEMOSCREEH=10) # lowerphysicaldamage
Define(PETDUSTCLOUD 50285) # Tallstrider
	SpellInfo(PETDUSTCLOUD cd=25)
	SpellAddDebuff(PETDUSTCLOUD PETDUSTCLOUDDEBUFF=30) # meleeslow
Define(PETFIREBREATH 34889) # Dragonhawk
	SpellInfo(PETFIREBREATH cd=30)
	SpellAddDebuff(PETFIREBREATH PETFIREBREATH=45) # magicaldamagetaken
Define(PETFROSTSTORMBREATH 92380) # Chimaera
Define(PETFURIOUSHOWL 24604) # Wolf
	SpellInfo(PETFURIOUSHOWL cd=45)
	SpellAddBuff(PETFURIOUSHOWL PETFURIOUSHOWL=60) # criticalstrike
Define(PETGORE 35290) # Boar
	SpellInfo(PETGORE cd=10)
	SpellAddDebuff(PETGORE PETGORE=15) # bleed
Define(PETGROWL 2649)
Define(PETHEARTOFTHEPHOENIX 55709)
	SpellInfo(PETHEARTOFTHEPHOENIX cd=480)
Define(PETLAVABREATH 58604) # Core Hound
	SpellInfo(PETLAVABREATH cd=8)
	SpellAddDebuff(PETLAVABREATH PETLAVABREATH=10) # castslow
Define(PETLIGHTNINGBREATH 24844) # Wind Serpent
	SpellInfo(PETLIGHTNINGBREATH cd=30)
	SpellAddDebuff(PETLIGHTNINGBREATH PETLIGHTNINGBREATH=45) # magicaldamagetaken
Define(PETMONSTROUSBITE 54680) # Devilsaur
	SpellInfo(PETMONSTROUSBITE cd=8)
	SpellAddDebuff(PETMONSTROUSBITE PETMONSTROUSBITE=8)
Define(PETNETHERSHOCK 50479) # Nether Ray
	SpellInfo(PETNETHERSHOCK cd=40) # interrupt
Define(PETPUMMEL 26090) # Gorilla
	SpellInfo(PETPUMMEL cd=30) # interrupt
Define(PETQIRAJIFORTITUDE 90364) # Silithid
	SpellAddBuff(PETQIRAJIFORTITUDE PETQIRAJIFORTITUDE=1000) # stamina
Define(PETRABID 53401)
	SpellInfo(PETRABID cd=45)
	SpellAddBuff(PETRABID PETRABID=20)
Define(PETRAVAGE 50518) # Ravager
	SpellInfo(PETRAVAGE cd=15)
	SpellAddDebuff(PETRAVAGE PETRAVAGE=25) # physicaldamagetaken
Define(PETROAROFCOURAGE 93435) # Cat
	SpellInfo(PETROAROFCOURAGE cd=45)
	SpellAddBuff(PETROAROFCOURAGE PETROAROFCOURAGE=60) # strengthagility
Define(PETROAROFRECOVERY 53517)
	SpellInfo(PETROAROFRECOVERY cd=180)
	SpellAddBuff(PETROAROFRECOVERY PETROAROFRECOVERY=9)
Define(PETSERENITYDUST 50318) # Moth
	SpellInfo(PETSERENITYDUST cd=60) # interrupt
Define(PETSMACK 49966)
Define(PETSPORECLOUD 50274) # Sporebat
	SpellInfo(PETSPORECLOUD cd=8)
	SpellAddDebuff(PETSPORECLOUD PETSPORECLOUD=10) # castslow
Define(PETSTAMPEDE 57386) # Rhino
	SpellInfo(PETSTAMPEDE cd=15)
	SpellAddDebuff(PETSTAMPEDE PETSTAMPEDE=30) # bleed
Define(PETTAILSPIN 90314) # Fox
	SpellInfo(PETTAILSPIN cd=25)
	SpellAddDebuff(PETTAILSPIN PETTAILSPINDEBUFF=30) # meleeslow
Define(PETTEARARMOR 50498) # Raptor
	SpellInfo(PETTEARARMOR cd=6)
	SpellAddDebuff(PETTEARARMOR PETTEARARMOR=30) # lowerarmor
Define(PETTENDONRIP 50271) # Hyena
	SpellInfo(PETTENDONRIP cd=10)
	SpellAddDebuff(PETTENDONRIP PETTENDONRIP=15) # bleed
Define(PETTERRIFYINGROAR 90309) # Devilsaur
	SpellInfo(PETTERRIFYINGROAR cd=45)
	SpellAddBuff(PETTERRIFYINGROAR PETTERRIFYINGROAR=60) # criticalstrike
Define(PETWOLVERINEBITE 53508)
	SpellInfo(PETWOLVERINEBITE cd=10)

# Racials & Professions
Define(ARCANETORRENTFOCUS 80483) # blood elf
	SpellInfo(ARCANETORRENTFOCUS cd=120)
Define(BERSERKING 26297) # troll
	SpellInfo(BERSERKING duration=10 cd=180)
	SpellAddBuff(BERSERKING BERSERKING=10)
Define(BLOODFURY 33697) # orc
	SpellInfo(BLOODFURY duration=15 cd=120)
	SpellAddBuff(BLOODFURY BLOODFURY=15)
Define(LIFEBLOOD 55503) # herbalism
	SpellInfo(LIFEBLOOD duration=20 cd=120)
Define(STONEFORM 20594) # dwarf
	SpellInfo(STONEFORM duration=8 cd=120)
	SpellAddBuff(STONEFORM STONEFORM=8)

# Items
Define(POTIONOFTHETOLVIR 58145)
	Define(POTIONOFTHETOLVIRSPELL 80495)

AddCheckBox(aoe L(AOE))
AddCheckBox(potions SpellName(POTIONOFTHETOLVIRSPELL) default)
AddCheckBox(petbuff "Pet raid buffs & debuffs")
AddCheckBox(petattack "Show pet attacks")
AddCheckBox(blackarrow SpellName(BLACKARROW) default mastery=3)

# Trinket CDs
AddListItem(trinketcd0 000s "Trinket 0 CD - none" default)
AddListItem(trinketcd0 060s "Trinket 0 CD - 1 min")
AddListItem(trinketcd0 090s "Trinket 0 CD - 1 min 30s")
AddListItem(trinketcd0 120s "Trinket 0 CD - 2 min")
AddListItem(trinketcd1 000s "Trinket 1 CD - none" default)
AddListItem(trinketcd1 060s "Trinket 1 CD - 1 min")
AddListItem(trinketcd1 090s "Trinket 1 CD - 1 min 30s")
AddListItem(trinketcd1 120s "Trinket 1 CD - 2 min")

AddFunction SummonPet
{
	if PetPresent(no) Texture(ability_hunter_beastcall)
	if pet.Life(equal 0)
	{
		Spell(PETHEARTOFTHEPHOENIX)
		Spell(REVIVEPET)
	}
}

AddFunction PetMaintainBuffDebuff
{
	# Maintain raid buffs and debuffs.
	if BuffExpires(criticalstrike 2)
	{
		Spell(PETFURIOUSHOWL)
		Spell(PETTERRIFYINGROAR)
	}
	if BuffExpires(stamina 3) Spell(PETQIRAJIFORTITUDE)
	if BuffExpires(strengthagility 3) Spell(PETROAROFCOURAGE)
	if TargetDebuffExpires(bleed 2)
	{
		Spell(PETGORE)
		Spell(PETSTAMPEDE)
		Spell(PETTENDONRIP)
	}
	if TargetDebuffExpires(castslow 2)
	{
		Spell(PETLAVABREATH)
		Spell(PETSPORECLOUD)
	}
	if TargetDebuffExpires(lowerarmor 2)
	{
		Spell(PETTEARARMOR)
		Spell(PETCORROSIVESPIT)
	}
	if TargetDebuffExpires(lowerphysicaldamage 0) or TargetDebuffExpires(PETDEMOSCREECH 0)
	{
		Spell(PETDEMOROAR)
		Spell(PETDEMOSCREECH)
	}
	if TargetDebuffExpires(magicaldamagetaken 2)
	{
		Spell(PETFIREBREATH)
		Spell(PETLIGHTNINGBREATH)
	}
	if TargetDebuffExpires(meleeslow 2) or TargetDebuffExpires(PETTAILSPIN 2)
	{
		Spell(PETDUSTCLOUD)
		Spell(PETTAILSPIN)
	}
	if TargetDebuffExpires(physicaldamagetaken 2)
	{
		Spell(PETACIDSPIT)
		Spell(PETRAVAGE)
	}
}

AddFunction PetActions
{
	#/call_of_the_wild
	Spell(PETCALLOFTHEWILD)
	#/roar_of_recovery,if=!buff.bloodlust.up
	unless BuffPresent(heroism) Spell(PETROAROFRECOVERY)
	#/rabid
	Spell(PETRABID)
	#/wolverine_bite
	if CheckBoxOn(petattack) Spell(PETWOLVERINEBITE usable=1)
	if CheckBoxOn(petattack) and pet.Mana(more 25)
	{
		Spell(PETBITE)
		Spell(PETCLAW)
		Spell(PETSMACK)
	}
}

AddFunction PetInterrupt
{
	if TargetInRange(PETNETHERSHOCK) Spell(PETNETHERSHOCK)
	if TargetInRange(PETPUMMEL) Spell(PETPUMMEL)
	if TargetInRange(PETSERENITYDUST) Spell(PETSERENITYDUST)
}

AddFunction UseItemActions
{
	Item(HandsSlot usable=1)
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

AddFunction UseProfessionActions
{
	Spell(LIFEBLOOD)
}

AddFunction UseRacialActions
{
	if Mana(less 81) Spell(ARCANETORRENTFOCUS)
	Spell(BERSERKING)
	Spell(BLOODFURY)
}

###
### Common off-gcd hunter and pet actions.
###
AddIcon help=offgcd size=small
{
	unless InCombat() unless BuffPresent(ASPECTOFTHEHAWK) or BuffPresent(ASPECTOFTHEFOX) Spell(ASPECTOFTHEHAWK)
	#/aspect_of_the_hawk,moving=0
	unless Speed(more 0) unless BuffPresent(ASPECTOFTHEHAWK) Spell(ASPECTOFTHEHAWK)
	#/aspect_of_the_fox,moving=1
	if Speed(more 0) unless BuffPresent(ASPECTOFTHEFOX) Spell(ASPECTOFTHEFOX)
	if PetPresent(yes)
	{
		if CheckBoxOn(petbuff) PetMaintainBuffDebuff()
		PetActions()
	}
}

###
### Beast Mastery
###
AddIcon help=main mastery=1
{
	#/serpent_sting,if=!ticking
	unless TargetDebuffPresent(SERPENTSTINGDEBUFF mine=1)
		if Mana(more 24) or {BuffPresent(THEBEASTWITHIN) and Mana(more 12)} Spell(SERPENTSTING)
	#/kill_shot
	if TargetLifePercent(less 20) Spell(KILLSHOT)
	#/kill_command
	if TargetInRange(PETGROWL) and PetPresent(yes) Spell(KILLCOMMAND)
	#/arcane_shot,if=focus>=59|buff.beast_within.up
	if Mana(more 58) or {BuffPresent(THEBEASTWITHIN) and Mana(more 10)} Spell(ARCANESHOT)
	if Speed(equal 0) or BuffPresent(ASPECTOFTHEFOX)
	{
		#/cobra_shot
		Spell(COBRASHOT)
		#/steady_shot
		Spell(STEADYSHOT)
	}
}

AddIcon help=aoe mastery=1 checkboxon=aoe
{
	#/explosive_trap,if=target.adds>0
	if BuffPresent(TRAPLAUNCHER) Spell(EXPLOSIVETRAPLAUNCHER)
	if Spell(EXPLOSIVETRAPLAUNCHER) Spell(TRAPLAUNCHER usable=1)
	#/serpent_sting,if=!ticking
	unless TargetDebuffPresent(SERPENTSTINGDEBUFF mine=1)
		if Mana(more 24) or {BuffPresent(THEBEASTWITHIN) and Mana(more 12)} Spell(SERPENTSTING)
	#/multi_shot,if=target.adds>5
	if Mana(more 39) or {BuffPresent(THEBEASTWITHIN) and Mana(more 19)} Spell(MULTISHOT)
	if Speed(equal 0) or BuffPresent(ASPECTOFTHEFOX)
	{
		#/cobra_shot,if=target.adds>5
		Spell(COBRASHOT)
		#/steady_shot
		Spell(STEADYSHOT)
	}
}

AddIcon help=cd mastery=1
{
	unless InCombat() SummonPet()
	if PetPresent(yes) and TargetIsInterruptible() PetInterrupt()

	#/hunters_mark,if=target.time_to_die>=21
	unless TargetDebuffPresent(HUNTERSMARK) or TargetDebuffPresent(MARKEDFORDEATH) if TargetDeadIn(more 21) Spell(HUNTERSMARK nored=1)
	#/tolvir_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(POTIONOFTHETOLVIR)
	#/summon_pet
	SummonPet()
	#/tolvir_potion,if=!in_combat|buff.bloodlust.react|target.time_to_die<=60
	#if ( glyphs.rapid_fire -> ok() ) { |buff.rapid_fire.react }
	if CheckBoxOn(potions) and TargetClassification(worldboss)
	{
		if BuffPresent(heroism) or TargetDeadIn(less 60) Item(POTIONOFTHETOLVIR)
		if Glyph(GLYPHOFRAPIDFIRE) and BuffPresent(RAPIDFIRE) Item(POTIONOFTHETOLVIR)
	}
	#init_use_item_actions()
	UseItemActions()
	#init_use_profession_actions()
	#/focus_fire,five_stacks=1
	if pet.BuffPresent(FRENZYEFFECT stacks=5) Spell(FOCUSFIRE)
	UseProfessionActions()
	#init_use_racial_actions()
	UseRacialActions()
	#/bestial_wrath,if=focus>60
	if Mana(more 60) Spell(BESTIALWRATH)
	#/rapid_fire,if=!buff.bloodlust.up&!buff.beast_within.up
	unless BuffPresent(heroism) or BuffPresent(THEBEASTWITHIN) Spell(RAPIDFIRE)
	#/fervor,if=focus<=37
	if Mana(less 38) Spell(FERVOR)
}

###
### Marksmanship
###
AddIcon help=main mastery=2
{
	#/serpent_sting,if=!ticking&target.health_pct<=90
	unless TargetDebuffPresent(SERPENTSTINGDEBUFF) if TargetLifePercent(less 90) and Mana(more 24) Spell(SERPENTSTING)
	#/chimera_shot,if=target.health_pct<=90
	if TargetLifePercent(less 90) and Mana(more 43) Spell(CHIMERASHOT)
	#/steady_shot,if=buff.pre_improved_steady_shot.up&buff.improved_steady_shot.remains<3
	if TalentPoints(IMPROVEDSTEADYSHOTTALENT more 0) and BuffExpires(IMPROVEDSTEADYSHOT 3)
	{
		if Counter(iss more 0) and Counter(iss less 2) Spell(STEADYSHOT)
		if Counter(iss more 2) and Counter(iss less 4) Spell(STEADYSHOT)
		unless ArmorSetParts(T13 more 1)
			if Counter(iss more 4) and Counter(iss less 6) Spell(STEADYSHOT)
		# if you're shooting more than 5 Steady Shots in a row, you're capping your focus and doing it wrong
	}
	#/kill_shot
	if TargetLifePercent(less 20) Spell(KILLSHOT)
	#/aimed_shot,if=buff.master_marksman_fire.react
	if BuffPresent(FIRE) Spell(AIMEDSHOTBANG)
	if ArmorSetParts(T13 more 3)
	{
		#/arcane_shot,if=(focus>=66|cooldown.chimera_shot.remains>=4)&\
		#	(target.health_pct<90&!buff.rapid_fire.up&!buff.bloodlust.react&!buff.berserking.up&\
		#		!buff.tier13_4pc.react&cooldown.buff_tier13_4pc.remains<=0)
		unless Mana(less 66) and 4s before Spell(CHIMERASHOT)
			if TargetLifePercent(less 90)
				unless BuffPresent(RAPIDFIRE) or BuffPresent(heroism) or BuffPresent(BERSERKING) or BuffPresent(CHRONOHUNTER)
					if BuffGain(CHRONOHUNTER 105) Spell(ARCANESHOT)
		#/aimed_shot,if=(cooldown.chimera_shot.remains>5|focus>=80)&(buff.bloodlust.react|buff.tier13_4pc.react|cooldown.buff_tier13_4pc.remains>0)|\
		#	buff.rapid_fire.up|target.health_pct>90
		if Mana(more 49)
		{
			unless 5s before Spell(CHIMERASHOT) and Mana(less 80)
			{
				if BuffPresent(heroism) or BuffPresent(CHRONOHUNTER) Spell(AIMEDSHOT)
				unless BuffGain(CHRONOHUNTER 105) Spell(AIMEDSHOT)
			}
			if BuffPresent(RAPIDFIRE) or TargetLifePercent(more 90) Spell(AIMEDSHOT)
		}
	}
	unless ArmorSetParts(T13 more 3)
	{
		#if ( ! glyphs.arcane_shot -> ok() )
		unless Glyph(GLYPHOFARCANESHOT)
		{
			if Mana(more 49)
			{
				#/aimed_shot,if=cooldown.chimera_shot.remains>5|focus>=80|buff.rapid_fire.up|buff.bloodlust.react|target.health_pct>90
				unless 5s before Spell(CHIMERASHOT) Spell(AIMEDSHOT)
				if Mana(more 79) Spell(AIMEDSHOT)
				if BuffPresent(RAPIDFIRE) or BuffPresent(heroism) or TargetLifePercent(more 90) Spell(AIMEDSHOT)
			}
		}
		#else
		if Glyph(GLYPHOFARCANESHOT)
		{
			#/aimed_shot,if=target.health_pct>90|buff.rapid_fire.up|buff.bloodlust.react|buff.berserking.up
			if BuffPresent(RAPIDFIRE) or BuffPresent(heroism) or TargetLifePercent(more 90) and Mana(more 49) Spell(AIMEDSHOT)
			#/arcane_shot,if=(focus>=66|cooldown.chimera_shot.remains>=5)&\
			#	(target.health_pct<90&!buff.rapid_fire.up&!buff.bloodlust.react&!buff.berserking.up)
			unless Mana(less 66) and 5s before Spell(CHIMERASHOT)
				if TargetLifePercent(less 90)
					unless BuffPresent(RAPIDFIRE) or BuffPresent(heroism) or BuffPresent(BERSERKING)
						Spell(ARCANESHOT)
		}
	}
	#/steady_shot
	if Speed(equal 0) or BuffPresent(ASPECTOFTHEFOX) Spell(STEADYSHOT)
}

AddIcon help=aoe mastery=2 checkboxon=aoe
{
	#/explosive_trap,if=target.adds>0
	if BuffPresent(TRAPLAUNCHER) Spell(EXPLOSIVETRAPLAUNCHER)
	if Spell(EXPLOSIVETRAPLAUNCHER) Spell(TRAPLAUNCHER usable=1)
	#/multi_shot,if=target.adds>5
	if Mana(more 39) Spell(MULTISHOT)
	#/steady_shot,if=target.adds>5
	if Speed(equal 0) or BuffPresent(ASPECTOFTHEFOX) Spell(STEADYSHOT)
}

AddIcon help=cd mastery=2
{
	unless InCombat() SummonPet()
	if PetPresent(yes) and TargetIsInterruptible() PetInterrupt()

	#/hunters_mark,if=target.time_to_die>=21
	unless TargetDebuffPresent(HUNTERSMARK) or TargetDebuffPresent(MARKEDFORDEATH) if TargetDeadIn(more 21) Spell(HUNTERSMARK nored=1)
	#/tolvir_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(POTIONOFTHETOLVIR)
	if TargetIsInterruptible() and TargetInRange(SILENCINGSHOT) Spell(SILENCINGSHOT)
	#/summon_pet
	SummonPet()
	#/tolvir_potion,if=!in_combat|buff.bloodlust.react|target.time_to_die<=60|buff.rapid_fire.react
	#if ( glyphs.rapid_fire -> ok() ) { |buff.rapid_fire.react }
	if CheckBoxOn(potions) and TargetClassification(worldboss)
	{
		if BuffPresent(heroism) or TargetDeadIn(less 60) Item(POTIONOFTHETOLVIR)
		if Glyph(GLYPHOFRAPIDFIRE) and BuffPresent(RAPIDFIRE) Item(POTIONOFTHETOLVIR)
	}
	#init_use_item_actions()
	UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
	#init_use_racial_actions()
	UseRacialActions()
	#/rapid_fire,if=!buff.bloodlust.up|target.time_to_die<=30
	unless BuffPresent(heroism) and TargetDeadIn(more 30) Spell(RAPIDFIRE)
	#/readiness,wait_for_rapid_fire=1
	if BuffPresent(RAPIDFIRE) Spell(READINESS)
}

###
### Survival
###
AddIcon help=main mastery=3
{
	#/serpent_sting,if=!ticking&target.time_to_die>=10
	unless TargetDebuffPresent(SERPENTSTINGDEBUFF mine=1) if TargetDeadIn(more 10) and Mana(more 24) Spell(SERPENTSTING)
	#/explosive_shot,if=(remains<2.0)
	if TargetDebuffExpires(EXPLOSIVESHOT 2 mine=1)
		if Mana(more 43) or BuffPresent(LOCKANDLOAD) Spell(EXPLOSIVESHOT)
	#if ( ! talents.black_arrow -> rank() ) { /explosive_trap,not_flying=1,if=target.time_to_die>=11 }
	unless CheckBoxOn(blackarrow) and TalentPoints(BLACKARROWTALENT more 0)
	{
		if TargetDeadIn(more 11)
		{
			if BuffPresent(TRAPLAUNCHER) Spell(EXPLOSIVETRAPLAUNCHER)
			if Spell(EXPLOSIVETRAPLAUNCHER) Spell(TRAPLAUNCHER usable=1)
		}
	}
	#/kill_shot
	if TargetLifePercent(less 20) Spell(KILLSHOT)
	#/black_arrow,if=target.time_to_die>=8
	if CheckBoxOn(blackarrow) and TargetDeadIn(more 8) and Mana(more 34) Spell(BLACKARROW)
	#/arcane_shot,if=focus>=67
	if Mana(more 66) Spell(ARCANESHOT)
	if Speed(equal 0) or BuffPresent(ASPECTOFTHEFOX)
	{
		#/cobra_shot
		Spell(COBRASHOT)
		#/steady_shot
		Spell(STEADYSHOT)
	}
}

AddIcon help=aoe mastery=3 checkboxon=aoe
{
	#/explosive_trap,if=target.adds>0
	if BuffPresent(TRAPLAUNCHER) Spell(EXPLOSIVETRAPLAUNCHER)
	if Spell(EXPLOSIVETRAPLAUNCHER) Spell(TRAPLAUNCHER usable=1)
	#/multi_shot,if=target.adds>2
	if Mana(more 39) Spell(MULTISHOT)
	if Speed(equal 0) or BuffPresent(ASPECTOFTHEFOX)
	{
		#/cobra_shot,if=target.adds>2
		Spell(COBRASHOT)
		#/steady_shot
		Spell(STEADYSHOT)
	}
}

AddIcon help=cd mastery=3
{
	unless InCombat() SummonPet()
	if PetPresent(yes) and TargetIsInterruptible() PetInterrupt()

	#/hunters_mark,if=target.time_to_die>=21
	unless TargetDebuffPresent(HUNTERSMARK) or TargetDebuffPresent(MARKEDFORDEATH) if TargetDeadIn(more 21) Spell(HUNTERSMARK nored=1)
	#/tolvir_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(POTIONOFTHETOLVIR)
	#/summon_pet
	SummonPet()
	#/tolvir_potion,if=!in_combat|buff.bloodlust.react|target.time_to_die<=60
	#if ( glyphs.rapid_fire -> ok() ) { |buff.rapid_fire.react }
	if CheckBoxOn(potions) and TargetClassification(worldboss)
	{
		if BuffPresent(heroism) or TargetDeadIn(less 60) Item(POTIONOFTHETOLVIR)
		if Glyph(GLYPHOFRAPIDFIRE) and BuffPresent(RAPIDFIRE) Item(POTIONOFTHETOLVIR)
	}
	#init_use_racial_actions()
	UseRacialActions()
	#init_use_item_actions()
	UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
	#/rapid_fire
	Spell(RAPIDFIRE)
}

AddIcon size=small
{
	Spell(MISDIRECTION)
}
]]