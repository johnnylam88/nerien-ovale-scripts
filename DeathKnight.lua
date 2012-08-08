NerienOvaleScripts.script["DEATHKNIGHT"] =
[[
### Death Knight Ovale script based on SimulationCraft profiles
### https://sites.google.com/site/wownerien/ovale/deathknight/script
### Version: 4.3.9
#
# Blood:
#	talents=http://www.wowhead.com/talent#deathknight-133212031302223113210000000000000000000003200000000000000000
#	glyphs=heart_strike/death_strike/rune_strike/antimagic_shell/vampiric_blood/rune_tap/blood_tap/resilient_grip/horn_of_winter
#
# Frost-1H:
#	talents=http://www.wowhead.com/talent#deathknight-203200000000000000003133000223311201230103000000000000000000
#	glyphs=horn_of_winter/blood_tap/obliterate/frost_strike/howling_blast
#
# Frost-1H, Masterfrost:
#	talents=http://www.wowhead.com/talent#deathknight-203200000000000000003133000223311201230103000000000000000000
#	glyphs=horn_of_winter/blood_tap/obliterate/frost_strike/howling_blast
#
# Unholy-2H:
#	talents=http://www.wowhead.com/talent#deathknight-203200000000000000002000000000000000000013300321230131021231
#	glyphs=antimagic_shell/blood_boil/pestilence/blood_tap/deaths_embrace/horn_of_winter/death_coil/scourge_strike/raise_dead

## defines ##

# Buffs and debuffs
Define(BLOODSHIELD 77535)
Define(CRIMSONSCOURGE 81141)
Define(SCARLETFEVER 81130)
Define(BLOODPLAGUE 55078)
	SpellInfo(BLOODPLAGUE duration=15)
Define(FREEZINGFOG 59052)
Define(FROSTFEVER 55095)
	SpellInfo(FROSTFEVER duration=15)
Define(KILLINGMACHINE 51124)
Define(SHADOWINFUSION 91342)
Define(SUDDENDOOM 81340)
Define(RUNICCORRUPTION 51459)
Define(UNHOLYSTRENGTHBUFF 53365)

# Glyphs
Define(GLYPHOFFROSTSTRIKE 58647)
Define(GLYPHOFHOWLINGBLAST 63335)

# Talents
Define(ENDLESSWINTERTALENT 1971)
Define(EPIDEMICTALENT 1963)
Define(HEARTSTRIKETALENT 1957)
Define(IMPROVEDBLOODTAPTALENT 12223)
Define(SCARLETFEVERTALENT 7462)
Define(UNHOLYFRENZYTALENT 7574)

# Abilities
Define(ARMYOFTHEDEAD 42650)
	SpellInfo(ARMYOFTHEDEAD cd=600 mana=-15)
Define(BLOODBOIL 48721)
	SpellInfo(BLOODBOIL blood=-1 mana=-10)
	SpellAddTargetDebuff(BLOODBOIL SCARLETFEVER=30)
Define(BLOODPRESENCE 48263)
Define(BLOODSTRIKE 45902)
	SpellInfo(BLOODSTRIKE blood=-1 mana=-10)
Define(BLOODTAP 45529)
	SpellInfo(BLOODTAP cd=60 mana=-10)
Define(BONESHIELD 49222) #blood
	SpellInfo(BONESHIELD unholy=-1 mana=-10)
	SpellAddBuff(BONESHIELD BONESHIELD=300)
Define(DANCINGRUNEWEAPON 49028) #blood
	SpellInfo(DANCINGRUNEWEAPON cd=90)
Define(DARKTRANSFORMATION 63560) #unholy
	SpellInfo(DARKTRANSFORMATION unholy=-1 cd=30 mana=-10) #fake cd
Define(DEATHANDDECAY 43265)
	SpellInfo(DEATHANDDECAY unholy=-1 cd=30 mana=-10)
Define(DEATHCOIL 47541)
	SpellInfo(DEATHCOIL mana=40)
Define(DEATHPACT 48743)
	SpellInfo(DEATHPACT cd=120 mana=40)
Define(DEATHSTRIKE 49998)
	SpellInfo(DEATHSTRIKE unholy=-1 frost=-1 mana=-15)
Define(EMPOWERRUNEWEAPON 47568)
	SpellInfo(EMPOWERRUNEWEAPON cd=300 unholy=1 frost=1 blood=1 mana=-25)
Define(FESTERINGSTRIKE 85948) #1 frost 1 blood
	SpellInfo(FESTERINGSTRIKE blood=-1 frost=-1 mana=-15)
	SpellAddTargetDebuff(FESTERINGSTRIKE BLOODPLAGUE=refresh FROSTFEVER=refresh)
Define(FROSTPRESENCE 48266)
Define(FROSTSTRIKE 49143) #frost
	SpellInfo(FROSTSTRIKE mana=40)
Define(HEARTSTRIKE 55050) #blood
	SpellInfo(HEARTSTRIKE blood=-1 mana=-10)
Define(HORNOFWINTER 57330)
	SpellInfo(HORNOFWINTER cd=20 mana=-10)
Define(HOWLINGBLAST 49184) #frost
	SpellInfo(HOWLINGBLAST frost=-1 mana=-10)
	SpellAddBuff(HOWLINGBLAST FREEZINGFOG=0)
	SpellAddTargetDebuff(HOWLINGBLAST FROSTFEVER=15 glyph=GLYPHOFHOWLINGBLAST)
Define(ICEBOUNDFORTITUDE 48792)
	SpellInfo(ICEBOUNDFORTITUDE cd=180)
	SpellAddBuff(ICEBOUNDFORTITUDE ICEBOUNDFORTITUDE=18)
Define(ICYTOUCH 45477)
	SpellInfo(ICYTOUCH frost=-1 mana=-10)
	SpellAddTargetDebuff(ICYTOUCH FROSTFEVER=15)
	SpellAddBuff(ICYTOUCH FREEZINGFOG=0)
Define(MINDFREEZE 47528)
	SpellInfo(MINDFREEZE cd=10)
Define(OBLITERATE 49020)
	SpellInfo(OBLITERATE unholy=-1 frost=-1 mana=-15)
Define(OUTBREAK 77575)
	SpellInfo(OUTBREAK cd=60)
	SpellAddTargetDebuff(OUTBREAK FROSTFEVER=15 BLOODPLAGUE=15)
Define(PESTILENCE 50842)
	SpellInfo(PESTILENCE blood=-1 mana=-10)
Define(PILLAROFFROST 51271) #frost
	SpellInfo(PILLAROFFROST frost=-1 mana=-10)
	SpellAddBuff(PILLAROFFROST PILLAROFFROST=20)
Define(PLAGUESTRIKE 45462)
	SpellInfo(PLAGUESTRIKE unholy=-1 mana=-10)
	SpellAddTargetDebuff(PLAGUESTRIKE BLOODPLAGUE=15)
Define(RAISEDEAD 46584)
	SpellInfo(RAISEDEAD cd=180)
Define(RUNESTRIKE 56815)
	SpellInfo(RUNESTRIKE mana=30 cd=6) #fake cd, not usable two times in a row
Define(RUNETAP 48982) #blood
	SpellInfo(RUNETAP blood=-1 cd=30 mana=-10)
Define(SCOURGESTRIKE 55090) #unholy
	SpellInfo(SCOURGESTRIKE unholy=-1 mana=-10)
Define(SUMMONGARGOYLE 49206) #unholy
	SpellInfo(SUMMONGARGOYLE cd=180 mana=60)
Define(UNHOLYBLIGHT 49194)
Define(UNHOLYFRENZY 49016)
	SpellInfo(UNHOLYFRENZY cd=300)
	SpellAddBuff(UNHOLYFRENZY UNHOLYFRENZY=30)
Define(UNHOLYPRESENCE 48265)
Define(VAMPIRICBLOOD 55233) #blood
	SpellInfo(VAMPIRICBLOOD cd=60)
	SpellAddBuff(VAMPIRICBLOOD VAMPIRICBLOOD=10)

# Racials & Professions
Define(ARCANETORRENTRUNICPOWER 50613) # blood elf
	SpellInfo(ARCANETORRENTRUNICPOWER cd=120)
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
Define(GOLEMBLOODPOTION 58146)
	Define(GOLEMBLOODPOTIONSPELL 80496)

## end defines ##

ScoreSpells(HOWLINGBLAST HEARTSTRIKE BLOODSTRIKE DEATHSTRIKE SCOURGESTRIKE OBLITERATE HEARTSTRIKE 
			PESTILENCE ICYTOUCH PLAGUESTRIKE FROSTSTRIKE DEATHCOIL)

AddCheckBox(aoe L(AOE) default)
AddCheckBox(horn SpellName(HORNOFWINTER))
AddCheckBox(scarlet SpellName(SCARLETFEVER) mastery=1 default)
AddCheckBox(dnd SpellName(DEATHANDDECAY) mastery=3 default)
AddCheckBox(deathstrike SpellName(DEATHSTRIKE) mastery=2)
AddCheckBox(deathstrike SpellName(DEATHSTRIKE) mastery=3)
AddCheckBox(masterfrost "Masterfrost" mastery=2)
AddCheckBox(mindfreeze SpellName(MINDFREEZE))
AddCheckBox(potions SpellName(GOLEMBLOODPOTIONSPELL) mastery=2 default)
AddCheckBox(potions SpellName(GOLEMBLOODPOTIONSPELL) mastery=3 default)

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

AddFunction UseProfessionActions
{
	Spell(LIFEBLOOD)
}

AddFunction UseRacialActions
{
	if Mana(less 81) Spell(ARCANETORRENTRUNICPOWER)
	Spell(BERSERKING)
	Spell(BLOODFURY)
}

###
### Blood
###
AddIcon help=main mastery=1
{
	unless BuffPresent(BLOODPRESENCE) Spell(BLOODPRESENCE)
	if CheckBoxOn(horn) and BuffExpires(strengthagility 2) Spell(HORNOFWINTER)

	#/outbreak,if=(dot.frost_fever.remains<=2|dot.blood_plague.remains<=2)|\
	#	(!dot.blood_plague.ticking&!dot.frost_fever.ticking)
	if TargetDebuffExpires(FROSTFEVER 2 mine=1) or TargetDebuffExpires(BLOODPLAGUE 2 mine=1) Spell(OUTBREAK)
	#/plague_strike,if=!dot.blood_plague.ticking
	if TalentPoints(SCARLETFEVERTALENT more 0)
	{
		if TargetDebuffExpires(lowerphysicaldamage 0) and TargetClassification(worldboss)
			if Runes(unholy 1) Spell(PLAGUESTRIKE)
	}
	#/icy_touch,if=!dot.frost_fever.ticking
	unless TargetDebuffPresent(FROSTFEVER mine=1) Spell(ICYTOUCH)
	#/death_strike
	if Runes(frost 1 unholy 1) Spell(DEATHSTRIKE)
	#/blood_boil,if=buff.crimson_scourge.up
	if BuffPresent(CRIMSONSCOURGE) Spell(BLOODBOIL)
	#/heart_strike,if=(blood=1&blood.cooldown_remains<1)|blood=2
	unless Runes(blood 2) if Runes(blood 1) and 1s before Runes(blood 2) Spell(HEARTSTRIKE)
	if Runes(blood 2) Spell(HEARTSTRIKE)
	#/rune_strike,if=runic_power>=40
	if CheckBoxOff(mindfreeze) and Mana(more 39) Spell(RUNESTRIKE usable=1)
	if CheckBoxOn(mindfreeze)
	{
		if TalentPoints(ENDLESSWINTERTALENT equal 2) and Mana(more 39) Spell(RUNESTRIKE usable=1)
		if TalentPoints(ENDLESSWINTERTALENT equal 1) and Mana(more 49) Spell(RUNESTRIKE usable=1)
		if TalentPoints(ENDLESSWINTERTALENT equal 0) and Mana(more 59) Spell(RUNESTRIKE usable=1)
	}
	#/horn_of_winter
	Spell(HORNOFWINTER)
}

AddIcon help=offgcd mastery=1
{
	if TargetIsInterruptible() Spell(MINDFREEZE)
	#/blood_tap,if=(unholy=0&frost>=1)|(unholy>=1&frost=0)|(death=1)
	unless Runes(unholy 1 nodeath=1) if Runes(frost 1 nodeath=1) Spell(BLOODTAP)
	if Runes(unholy 1 nodeath=1) unless Runes(frost 1 nodeath=1) Spell(BLOODTAP)
	if Runes(death 1) unless Runes(death 2) Spell(BLOODTAP)
	if Runes(blood 1 frost 1 unholy 1) Spell(ARMYOFTHEDEAD)
}

AddFunction RuneStrike
{
	if CheckBoxOff(mindfreeze) and Mana(more 29) Spell(RUNESTRIKE usable=1)
	if CheckBoxOn(mindfreeze)
	{
		if TalentPoints(ENDLESSWINTERTALENT equal 2) and Mana(more 29) Spell(RUNESTRIKE usable=1)
		if TalentPoints(ENDLESSWINTERTALENT equal 1) and Mana(more 39) Spell(RUNESTRIKE usable=1)
		if TalentPoints(ENDLESSWINTERTALENT equal 0) and Mana(more 49) Spell(RUNESTRIKE usable=1)
	}
}

AddIcon help=aoe mastery=1 checkboxon=aoe
{
	unless BuffPresent(BLOODPRESENCE) Spell(BLOODPRESENCE)
	if CheckBoxOn(horn) and BuffExpires(strengthagility 2) Spell(HORNOFWINTER)

	if Runes(unholy 1) Spell(DEATHANDDECAY)

	if TargetDebuffExpires(BLOODPLAGUE 0 mine=1) and TargetDebuffExpires(FROSTFEVER 0 mine=1) Spell(OUTBREAK)
	if TargetDebuffExpires(FROSTFEVER 0 mine=1) and Runes(frost 1) Spell(ICYTOUCH)
	if TargetDebuffExpires(BLOODPLAGUE 0 mine=1) and Runes(unholy 1) Spell(PLAGUESTRIKE)

	if {OtherDebuffPresent(BLOODPLAGUE) or OtherDebuffPresent(FROSTFEVER)}
		and {TargetDebuffPresent(BLOODPLAGUE) or TargetDebuffPresent(FROSTFEVER)}
		if Runes(blood 1) or BuffPresent(CRIMSONSCOURGE) Spell(BLOODBOIL)
	if TargetDebuffPresent(BLOODPLAGUE) and TargetDebuffPresent(FROSTFEVER) 
	{
		unless OtherDebuffPresent(BLOODPLAGUE) and OtherDebuffPresent(FROSTFEVER)
			if Runes(blood 1) Spell(PESTILENCE)
		RuneStrike()
		if Runes(frost 1 unholy 1) Spell(DEATHSTRIKE)
		if Runes(blood 1) Spell(HEARTSTRIKE)
	}
	RuneStrike()
	if Mana(more 69) Spell(DEATHCOIL)
}

AddIcon help=cd size=small mastery=1
{
	#/bone_shield,if=!buff.bone_shield.up
	unless BuffPresent(BONESHIELD) if Runes(unholy 1) Spell(BONESHIELD)
	Spell(STONEFORM)
	#/raise_dead,time>=10
	if TimeInCombat(more 10) unless TotemPresent(ghoul) Spell(RAISEDEAD)
	if TotemPresent(ghoul) and LifePercent(less 61) and Mana(more 39) Spell(DEATHPACT) 
	#/dancing_rune_weapon
	if Mana(more 59) Spell(DANCINGRUNEWEAPON)
	#/empower_rune_weapon,if=blood=0&unholy=0&frost=0
	unless Runes(blood 1) or Runes(unholy 1) or Runes(frost 1) Spell(EMPOWERRUNEWEAPON)
	Spell(VAMPIRICBLOOD)
	if Runes(blood 1) Spell(RUNETAP)
	Spell(ICEBOUNDFORTITUDE)
}

AddIcon help=cd size=small mastery=1
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Frost
###

#// optimal timing for diseases depends on points in epidemic, and if using improved blood tap
#// players with only 2 points in epidemic want a 0 second refresh to avoid two PS in one minute instead of 1
#// IBT players use 2 PS every minute
AddFunction diseasesRefresh
{
	0
	if TalentPoints(IMPROVEDBLOODTAPTALENT more 0) 2
	if TalentPoints(EPIDEMICTALENT equal 3) 1
	if TalentPoints(EPIDEMICTALENT equal 2) 0
}

AddFunction FrostStrike
{
	if CheckBoxOff(mindfreeze) Spell(FROSTSTRIKE)
	if CheckBoxOn(mindfreeze)
	{
		if TalentPoints(ENDLESSWINTERTALENT equal 2)
		{
			if Glyph(GLYPHOFFROSTSTRIKE) and Mana(more 31) Spell(FROSTSTRIKE)
			unless Glyph(GLYPHOFFROSTSTRIKE) and Mana(more 39) Spell(FROSTSTRIKE)
		}
		if TalentPoints(ENDLESSWINTERTALENT equal 1)
		{
			if Glyph(GLYPHOFFROSTSTRIKE) and Mana(more 41) Spell(FROSTSTRIKE)
			unless Glyph(GLYPHOFFROSTSTRIKE) and Mana(more 49) Spell(FROSTSTRIKE)
		}
		if TalentPoints(ENDLESSWINTERTALENT equal 0)
		{
			if Glyph(GLYPHOFFROSTSTRIKE) and Mana(more 51) Spell(FROSTSTRIKE)
			unless Glyph(GLYPHOFFROSTSTRIKE) and Mana(more 59) Spell(FROSTSTRIKE)
		}
	}
}

AddIcon help=main mastery=2
{
	#/presence,choose=unholy
	unless BuffPresent(UNHOLYPRESENCE) Spell(UNHOLYPRESENCE)
	if CheckBoxOn(horn) and BuffExpires(strengthagility 2) Spell(HORNOFWINTER)

	#/outbreak,if=dot.frost_fever.remains<=drefresh|dot.blood_plague.remains<=drefresh
	if target.debuffExpires(FROSTFEVER mine=1) < diseasesRefresh()
		or target.debuffExpires(BLOODPLAGUE mine=1) < diseasesRefresh()
		Spell(OUTBREAK)
	#/howling_blast,if=dot.frost_fever.remains<=drefresh
	if target.debuffExpires(FROSTFEVER mine=1) < diseasesRefresh()
	{
		if Glyph(GLYPHOFHOWLINGBLAST) and {Runes(frost 1) or BuffPresent(FREEZINGFOG)} Spell(HOWLINGBLAST)
		if Glyph(GLYPHOFHOWLINGBLAST no) and Runes(frost 1) Spell(ICYTOUCH)
	}
	#/plague_strike,if=dot.blood_plague.remains<=drefresh
	if target.debuffExpires(BLOODPLAGUE mine=1) < diseasesRefresh() and Runes(unholy 1) Spell(PLAGUESTRIKE)
	#/obliterate,if=death>=1&frost>=1&unholy>=1
	if Runes(death 1 frost 1 unholy 1 nodeath=1) Spell(OBLITERATE)
	if CheckBoxOn(masterfrost) and Mana(more 120) Spell(FROSTSTRIKE)
	#/obliterate,if=(death=2&frost=2)|(death=2&unholy=2)|(frost=2&unholy=2)
	if Runes(death 2 frost 2 nodeath=1) or Runes(death 2 unholy 2 nodeath=1) or Runes(frost 2 unholy 2 nodeath=1)
		Spell(OBLITERATE)
	#/frost_strike,if=runic_power>=110
	if Mana(more 109) Spell(FROSTSTRIKE)
	#/howling_blast,if=buff.rime.react
	if BuffPresent(FREEZINGFOG) Spell(HOWLINGBLAST)
	unless CheckBoxOn(masterfrost)
	{
		#/obliterate,if=(death=2|unholy=2|frost=2)
		if Runes(death 2) or Runes(unholy 2 nodeath=1) or Runes(frost 2 nodeath=1)
			if Runes(frost 1 unholy 1) Spell(OBLITERATE)
		#/frost_strike,if=runic_power>=100
		if Mana(more 99) Spell(FROSTSTRIKE)
		#/obliterate
		if Runes(frost 1 unholy 1) Spell(OBLITERATE)
		#/frost_strike
		FrostStrike()
		#/howling_blast
		if Runes(frost 1) Spell(HOWLINGBLAST)
	}
	if CheckBoxOn(masterfrost)
	{
		#/frost_strike,if=runic_power>=100
		if Mana(more 100) Spell(FROSTSTRIKE)
		#/obliterate,if=buff.killing_machine.react
		if BuffPresent(KILLINGMACHINE) and Runes(frost 1 unholy 1) Spell(OBLITERATE)
		#/obliterate,if=unholy=2
		if Runes(frost 1 unholy 2) Spell(OBLITERATE)
		#/obliterate,if=unholy=1&rune.UNHOLY.cooldown_remains_all<=1
		unless Runes(unholy 2) if Runes(frost 1 unholy 1) and 1s before Runes(unholy 2 nodeath=1) Spell(OBLITERATE)
		#/obliterate,if=unholy=1&rune.UNHOLY.cooldown_remains_all<4&(death+frost=1)
		unless Runes(unholy 2) if Runes(frost 1 unholy 1) and 4s before Runes(unholy 2 nodeath=1)
		{
			unless Runes(frost 2) or Runes(death 1) if Runes(frost 1 death 0) Spell(OBLITERATE)
			unless Runes(frost 1) or Runes(death 2) if Runes(frost 0 death 1) Spell(OBLITERATE)
		}
		#/howling_blast,if=runic_power<90
		if Mana(less 90) and Runes(frost 1) Spell(HOWLINGBLAST)
		#/obliterate,if=runic_power>=90
		unless Mana(less 90) if Runes(frost 1 unholy 1) Spell(OBLITERATE)
		if BuffPresent(heroism)
		{
			#/howling_blast,if=runic_power<60,if=buff.bloodlust.react
			if Mana(less 60) and Runes(frost 1) Spell(HOWLINGBLAST)
			#/obliterate,if=runic_power>=60,if=buff.bloodlust.react
			unless Mana(less 60) if Runes(frost 1 unholy 1) Spell(OBLITERATE)
		}
		#/frost_strike
		FrostStrike()
	}
	#/horn_of_winter
	Spell(HORNOFWINTER)
}

AddIcon help=offgcd mastery=2
{
	if TargetIsInterruptible() Spell(MINDFREEZE)
	#/blood_tap,if=death.cooldown_remains>2.0
	if runes(death 1) > 2 Spell(BLOODTAP)
	#/empower_rune_weapon,if=target.time_to_die<=45
	if TargetDeadIn(less 45) Spell(EMPOWERRUNEWEAPON)
	#/empower_rune_weapon,if=(blood.cooldown_remains+frost.cooldown_remains+unholy.cooldown_remains)>8
	if runes(blood 1) + runes(frost 1) + runes(unholy 1) > 8
		Spell(EMPOWERRUNEWEAPON)
}

AddIcon help=aoe mastery=2 checkboxon=aoe
{
	unless BuffPresent(UNHOLYPRESENCE) Spell(UNHOLYPRESENCE)
	if CheckBoxOn(horn) and BuffExpires(strengthagility 2) Spell(HORNOFWINTER)
	if Runes(frost 1) or BuffPresent(FREEZINGFOG) Spell(HOWLINGBLAST)
	if Runes(unholy 1) Spell(DEATHANDDECAY)
	if TargetDebuffPresent(BLOODPLAGUE) and TargetDebuffPresent(FROSTFEVER)
		unless OtherDebuffPresent(BLOODPLAGUE) and OtherDebuffPresent(FROSTFEVER)
			if Runes(blood 1) Spell(PESTILENCE)
	if {TargetDebuffPresent(BLOODPLAGUE) or TargetDebuffPresent(FROSTFEVER)} 
		and {OtherDebuffPresent(BLOODPLAGUE) or OtherDebuffPresent(FROSTFEVER)}
		if Runes(blood 1) Spell(BLOODBOIL)
}

AddIcon help=cd mastery=2
{
	#/golemblood_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(GOLEMBLOODPOTION)
	#init_use_item_actions( ",time>=10" )
	if TimeInCombat(more 10) UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
	#init_use_racial_actions( ",time>=10" )
	if TimeInCombat(more 10) UseRacialActions()
	#/golemblood_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(heroism) or TargetDeadIn(less 60)} Item(GOLEMBLOODPOTION)
	if Runes(frost 1) Spell(PILLAROFFROST)
	#/raise_dead,time>=15
	unless TotemPresent(ghoul) if TimeInCombat(more 15) Spell(RAISEDEAD)
	#/army_of_the_dead
	if Runes(blood 1 frost 1 unholy 1) Spell(ARMYOFTHEDEAD)
}

###
### Unholy
###
AddIcon help=main mastery=3
{
	#/presence,choose=unholy
	unless BuffPresent(UNHOLYPRESENCE) Spell(UNHOLYPRESENCE)
	if CheckBoxOn(horn) and BuffExpires(strengthagility 2) Spell(HORNOFWINTER)

	#/outbreak,if=dot.frost_fever.remains<=2|dot.blood_plague.remains<=2
	if TargetDebuffExpires(FROSTFEVER 2 mine=1) or TargetDebuffExpires(BLOODPLAGUE 2 mine=1) Spell(OUTBREAK)
	unless 2s before Spell(OUTBREAK)
	{
		#/icy_touch,if=dot.frost_fever.remains<2&cooldown.outbreak.remains>2
		if TargetDebuffExpires(FROSTFEVER 2 mine=1) and Runes(frost 1) Spell(ICYTOUCH)
		#/plague_strike,if=dot.blood_plague.remains<2&cooldown.outbreak.remains>2
		if TargetDebuffExpires(BLOODPLAGUE 2 mine=1) and Runes(unholy 1) Spell(PLAGUESTRIKE)
	}
	#/dark_transformation
	if Runes(unholy 1) and pet.BuffPresent(SHADOWINFUSION stacks=5) Spell(DARKTRANSFORMATION)
	#/death_and_decay,if=unholy=2&runic_power<110
	if CheckBoxOn(dnd) and Runes(unholy 2) and Mana(less 110) Spell(DEATHANDDECAY)
	#/scourge_strike,if=unholy=2&runic_power<110
	if Runes(unholy 2) and Mana(less 110) Spell(SCOURGESTRIKE)
	#/festering_strike,if=blood=2&frost=2&runic_power<110
	if Runes(blood 2 frost 2) and Mana(less 110) Spell(FESTERINGSTRIKE)
	#/death_coil,if=runic_power>90
	if Mana(more 90) Spell(DEATHCOIL)
	#/death_coil,if=buff.sudden_doom.react
	if BuffPresent(SUDDENDOOM) Spell(DEATHCOIL)
	#option to heal with deathstrike
	if CheckBoxOn(deathstrike) and LifePercent(less 90) and Runes(frost 1 unholy 1) Spell(DEATHSTRIKE)
	#/death_and_decay
	if CheckBoxOn(dnd) and Runes(unholy 1) Spell(DEATHANDDECAY)
	#/scourge_strike
	if Runes(unholy 1) Spell(SCOURGESTRIKE)
	#/festering_strike
	if Runes(blood 1 frost 1) Spell(FESTERINGSTRIKE)
	#/death_coil
	if CheckBoxOff(mindfreeze) and Mana(more 39) Spell(DEATHCOIL)
	if CheckBoxOn(mindfreeze)
	{
		if TalentPoints(ENDLESSWINTERTALENT equal 2) and Mana(more 39) Spell(DEATHCOIL)
		if TalentPoints(ENDLESSWINTERTALENT equal 1) and Mana(more 49) Spell(DEATHCOIL)
		if TalentPoints(ENDLESSWINTERTALENT equal 0) and Mana(more 59) Spell(DEATHCOIL)
	}
	#/horn_of_winter
	Spell(HORNOFWINTER)
}

AddIcon help=offgcd mastery=3
{
	if TargetIsInterruptible() Spell(MINDFREEZE)
	#/blood_tap
	unless Runes(blood 2 frost 2 unholy 2) if Runes(blood 1) Spell(BLOODTAP)
	#/empower_rune_weapon
	Spell(EMPOWERRUNEWEAPON)
}

AddIcon help=aoe mastery=3 checkboxon=aoe
{
	unless BuffPresent(UNHOLYPRESENCE) Spell(UNHOLYPRESENCE)
	if CheckBoxOn(horn) and BuffExpires(strengthagility 2) Spell(HORNOFWINTER)
	if Runes(unholy 1) Spell(DEATHANDDECAY)
	if TargetDebuffPresent(BLOODPLAGUE) and TargetDebuffPresent(FROSTFEVER)
		unless OtherDebuffPresent(BLOODPLAGUE) and OtherDebuffPresent(FROSTFEVER)
			if Runes(blood 1) Spell(PESTILENCE)
	if {TargetDebuffPresent(BLOODPLAGUE) or TargetDebuffPresent(FROSTFEVER)} 
		and {OtherDebuffPresent(BLOODPLAGUE) or OtherDebuffPresent(FROSTFEVER)}
		if Runes(blood 1) Spell(BLOODBOIL)
}

AddIcon help=cd mastery=3
{
	#/golemblood_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(GOLEMBLOODPOTION)
	#/raise_dead
	if PetPresent(no) Spell(RAISEDEAD)
	#init_use_item_actions( ",time>=2" )
	if TimeInCombat(more 2) UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
	#if ( talents.unholy_frenzy -> rank() && race == RACE_TROLL ) { init_use_racial_actions( ",sync=unholy_frenzy" ) }
	if TalentPoints(UNHOLYFRENZYTALENT more 0) and Spell(BERSERKING)
		if Spell(UNHOLYFRENZY) UseRacialActions()
	#else { init_use_racial_actions( ",time>=2" ) }
	unless TalentPoints(UNHOLYFRENZYTALENT more 0) and Spell(BERSERKING)
		if TimeInCombat(more 2) UseRacialActions()
	#/golemblood_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(heroism) or TargetDeadIn(less 60)} Item(GOLEMBLOODPOTION)
	#/summon_gargoyle,time<=60
	if TimeInCombat(less 60) Spell(SUMMONGARGOYLE)
	#/summon_gargoyle,if=buff.bloodlust.react|buff.unholy_frenzy.react
	if BuffPresent(heroism) or BuffPresent(UNHOLYFRENZY) Spell(SUMMONGARGOYLE)
	#/army_of_the_dead
	if Runes(blood 1 frost 1 unholy 1) Spell(ARMYOFTHEDEAD)
	#/unholy_frenzy,if=!buff.bloodlust.react|target.time_to_die<=45
	unless BuffPresent(heroism) and TargetDeadIn(more 45) Spell(UNHOLYFRENZY)
}
]]