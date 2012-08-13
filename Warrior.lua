NerienOvaleScripts.script["WARRIOR"] =
[[
# Nerien's Warrior Ovale script based on SimulationCraft.
#
# Arms:
#	talents=http://www.wowhead.com/talent#warrior-3212030312021231220103220000000000000000030000000000000000000
#	glyphs=colossus_smash/sweeping_strikes/rapid_charge/enduring_victory/battle/berserker_rage/mortal_strike/slam/overpower
#
# Fury-1H:
#	talents=http://www.wowhead.com/talent#warrior-3200030000000000000003222103130111122320120000000000000000000
#	glyphs=colossus_smash/death_wish/victory_rush/bloody_healing/berserker_rage/furious_sundering/bloodthirst/slam/raging_blow
#
# Fury-2H:
#	talents=http://www.wowhead.com/talent#warrior-3200030000000000000003222203130111022321020000000000000000000
#	glyphs=death_wish/cleaving/heroic_throw/bloody_healing/battle/berserker_rage/bloodthirst/raging_blow/slam

# Buffs
Define(BATTLETRANCE 12964)
Define(BLOODSURGE 46916)
Define(EXECUTIONER 90806)
Define(INCITE 86627)
Define(RENDDEBUFF 94009)
Define(SLAUGHTER 84584)
Define(SUNDERARMORDEBUFF 58567)
Define(TASTEFORBLOOD 60503)
Define(THUNDERSTRUCK 87096)
Define(VICTORIOUS 32216)
Define(WRECKINGCREW 57519) # Enrage effect from Wrecking Crew (Rank 2)

# Glyphs
Define(GLYPHOFBERSERKERRAGE 58096)
Define(GLYPHOFSPELLREFLECTION 63328)

# Talents
Define(BLOODANDTHUNDERTALENT 10480)
Define(DEEPWOUNDSTALENT 8176)
Define(EXECUTIONERTALENT 9644)
Define(IMPROVEDREVENGETALENT 10470)
Define(IMPROVEDSLAMTALENT 2233)
Define(RAGINGBLOWTALENT 11208)
Define(SUDDENDEATHTALENT 52437)
Define(SWORDANDBOARDTALENT 10496)
Define(TACTICALMASTERYTALENT 11416)
Define(TITANSGRIPTALENT 9658)

# Spells
Define(BATTLESHOUT 6673)
	SpellInfo(BATTLESHOUT cd=30)
	SpellAddBuff(BATTLESHOUT BATTLESHOUT=120)
Define(BATTLESTANCE 2457)
Define(BERSERKERRAGE 18499)
	SpellInfo(BERSERKERRAGE cd=30)
Define(BERSERKERSTANCE 2458)
Define(BLADESTORM 46924)
	SpellInfo(BLADESTORM cd=90)
Define(BLOODTHIRST 23881)
	SpellInfo(BLOODTHIRST cd=3)
Define(CHARGE 100)
	SpellInfo(CHARGE cd=15)
Define(CLEAVE 845)
	SpellInfo(CLEAVE cd=3)
Define(COLOSSUSSMASH 86346)
	SpellInfo(COLOSSUSSMASH cd=20)
	SpellAddTargetDebuff(COLOSSUSSMASH COLOSSUSSMASH=6 SUNDERARMORDEBUFF=30)
Define(COMMANDINGSHOUT 469)
	SpellInfo(COMMANDINGSHOUT cd=30)
	SpellAddBuff(COMMANDINGSHOUT COMMANDINGSHOUT=120)
Define(CONCUSSIONBLOW 12809)
	SpellInfo(CONCUSSIONBLOW cd=30)
Define(DEADLYCALM 85730)
	SpellInfo(DEADLYCALM cd=120)
	SpellAddBuff(DEADLYCALM DEADLYCALM=10)
Define(DEATHWISH 12292)
	SpellInfo(DEATHWISH cd=180)
	SpellAddBuff(DEATHWISH DEATHWISH=30)
Define(DEFENSIVESTANCE 71)
Define(DEMORALIZINGSHOUT 1160)
	SpellAddTargetDebuff(DEMORALIZINGSHOUT DEMORALIZINGSHOUT=45)
Define(DEVASTATE 20243)
	SpellAddTargetDebuff(DEVASTATE SUNDERARMORDEBUFF=30)
Define(EXECUTE 5308)
	SpellAddBuff(EXECUTE EXECUTIONER=9)
Define(HEROICLEAP 6544)
	SpellInfo(HEROICLEAP cd=60)
Define(HEROICSTRIKE 78)
	SpellInfo(HEROICSTRIKE cd=3)
Define(HEROICTHROW 57755)
	SpellInfo(HEROICTHROW cd=60)
Define(HEROICFURY 60970)
	SpellInfo(HEROICFURY cd=60)
Define(INNERRAGE 1134)
	SpellInfo(INNERRAGE cd=30)
	SpellAddBuff(INNERRAGE INNERRAGE=15)
Define(INTERCEPT 20252)
	SpellInfo(INTERCEPT cd=30)
Define(INTERVENE 3411)
	SpellInfo(INTERVENE cd=30)
Define(LASTSTAND 12975)
	SpellInfo(LASTSTAND cd=180)
Define(MORTALSTRIKE 12294)
	SpellInfo(MORTALSTRIKE cd=4.5)
Define(OVERPOWER 7384)
	SpellInfo(OVERPOWER cd=1)
	SpellAddBuff(OVERPOWER TASTEFORBLOOD=0)
Define(PUMMEL 6552)
	SpellInfo(PUMMEL cd=10)
Define(RAGINGBLOW 85288)
	SpellInfo(RAGINGBLOW cd=6)
Define(RECKLESSNESS 1719)
	SpellInfo(RECKLESSNESS cd=300)
	SpellAddBuff(RECKLESSNESS RECKLESSNESS=12)
Define(REND 772)
	SpellAddTargetDebuff(REND RENDDEBUFF=15)
Define(RETALIATION 20230)
	SpellInfo(RETALIATION cd=300)
	SpellAddBuff(RETALIATION RETALIATION=12)
Define(REVENGE 6572)
	SpellInfo(REVENGE cd=5)
Define(SHATTERINGTHROW 64382)
	SpellInfo(SHATTERINGTHROW cd=300)
	SpellAddTargetDebuff(SHATTERINGTHROW SHATTERINGTHROW=10)
Define(SHIELDBLOCK 2565)
	SpellInfo(SHIELDBLOCK cd=60)
	SpellAddBuff(SHIELDBLOCK SHIELDBLOCK=10)
Define(SHIELDWALL 871)
	SpellInfo(SHIELDWALL cd=300)
	SpellAddBuff(SHIELDWALL SHIELDWALL=12)
Define(SHIELDSLAM 23922)
	SpellInfo(SHIELDSLAM cd=6)
Define(SHOCKWAVE 46968)
	SpellInfo(SHOCKWAVE cd=20)
	SpellAddBuff(SHOCKWAVE THUNDERSTRUCK=0)
Define(SLAM 1464)
	SpellAddBuff(SLAM BLOODSURGE=-1)
Define(SPELLREFLECTION 23920)
	SpellInfo(SPELLREFLECTION cd=25)
	SpellInfo(SPELLREFLECTION addcd=-5 glyph=GLYPHOFSPELLREFLECTION)
	SpellAddBuff(SPELLREFLECTION SPELLREFLECTION=5)
Define(STRIKE 88161)
	SpellInfo(STRIKE cd=3)
Define(SUNDERARMOR 7386)
	SpellAddTargetDebuff(SUNDERARMOR SUNDERARMORDEBUFF=30)
Define(SWEEPINGSTRIKES 12328)
	SpellInfo(SWEEPINGSTRIKES cd=60)
Define(THUNDERCLAP 6343)
	SpellInfo(THUNDERCLAP cd=6)
	SpellAddTargetDebuff(THUNDERCLAP THUNDERCLAP=30)
Define(VICTORYRUSH 34428)
	SpellAddBuff(VICTORYRUSH VICTORIOUS=0)
Define(WHIRLWIND 1680)
	SpellInfo(WHIRLWIND cd=10)

# Racials & Professions
Define(ARCANETORRENTRAGE 69179) # blood elf
	SpellInfo(ARCANETORRENTRAGE cd=120)
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

AddCheckBox(aoe L(AOE) default)
AddCheckBox(demo SpellName(DEMORALIZINGSHOUT))
AddCheckBox(sunder SpellName(SUNDERARMOR) default)
AddCheckBox(dancing SpellName(BERSERKERSTANCE) default mastery=1)
AddCheckBox(potions SpellName(GOLEMBLOODPOTIONSPELL) mastery=1 default)
AddCheckBox(potions SpellName(GOLEMBLOODPOTIONSPELL) mastery=2 default)
AddCheckBox(revenge SpellName(REVENGE) mastery=3)
AddCheckBox(reflect SpellName(SPELLREFLECTION) mastery=3)
AddListItem(shout none L(None))
AddListItem(shout battle SpellName(BATTLESHOUT) default)
AddListItem(shout command SpellName(COMMANDINGSHOUT))

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
	if Mana(less 81) Spell(ARCANETORRENTRAGE)
	Spell(BERSERKING)
	Spell(BLOODFURY)
}

###
### Arms
###

AddIcon help=offgcd size=small mastery=1 checkboxon=dancing
{
	if HasShield()
		unless Stance(2) Spell(DEFENSIVESTANCE)
	unless HasShield()
	{
		#/stance,choose=berserker,if=buff.taste_for_blood.down&dot.rend.remains>0&rage<=75,use_off_gcd=1
		unless Stance(3)
		{
			if TargetDebuffPresent(RENDDEBUFF mine=1) and Mana(less 76)
				unless BuffPresent(TASTEFORBLOOD) Spell(BERSERKERSTANCE)
		}
		#/stance,choose=battle,use_off_gcd=1,if=!dot.rend.ticking
		unless Stance(1)
			unless TargetDebuffPresent(RENDDEBUFF mine=1) Spell(BATTLESTANCE)
		#/stance,choose=battle,use_off_gcd=1,if=(buff.taste_for_blood.up|buff.overpower.up)&rage<=75&\
		#	cooldown.mortal_strike.remains>=1.5,use_off_gcd=1
		unless Stance(1)
		{
			if {BuffPresent(TASTEFORBLOOD) or Spell(OVERPOWER)} and Mana(less 76)
				unless 1.5s before Spell(MORTALSTRIKE) Spell(BATTLESTANCE)
		}
	}
}

AddIcon help=main mastery=1
{
	if HasShield()
		unless Stance(2) Spell(DEFENSIVESTANCE)
	unless HasShield() or Stance(2)
		if CheckBoxOff(dancing) Spell(BATTLESTANCE)

	# Maintain raid buffs and debuffs.
	if List(shout command) and BuffExpires(stamina 3) Spell(COMMANDINGSHOUT nored=1)
	if List(shout battle) and BuffExpires(strengthagility 3) Spell(BATTLESHOUT nored=1)
	if TargetClassification(worldboss) and CheckBoxOn(demo) and TargetDebuffExpires(lowerphysicaldamage 2) Spell(DEMORALIZINGSHOUT nored=1)
	if CheckBoxOn(sunder) and TargetDebuffExpires(lowerarmor 0 mine=0)
		unless TargetDebuffPresent(SUNDERARMORDEBUFF 3 mine=1 stacks=3) Spell(SUNDERARMOR nored=1)

	#/rend,if=!ticking
	unless TargetDebuffPresent(RENDDEBUFF mine=1)
		if TargetDeadIn(more 10) Spell(REND)
	#/mortal_strike,if=target.health_pct>20
	if TargetLifePercent(more 20) Spell(MORTALSTRIKE)
	#/colossus_smash,if=buff.colossus_smash.down
	unless TargetDebuffPresent(COLOSSUSSMASH mine=1) Spell(COLOSSUSSMASH)
	#/execute,if=buff.executioner_talent.remains<1.5
	if TalentPoints(EXECUTIONERTALENT more 0)
		if BuffExpires(EXECUTIONER 1.5) and TargetLifePercent(less 20) Spell(EXECUTE)
	#/mortal_strike,if=target.health_pct<=20&(dot.rend.remains<3|buff.wrecking_crew.down|rage<=25|rage>=35)
	unless TargetLifePercent(more 20)
	{
		if TargetDebuffExpires(RENDDEBUFF 3 mine=1) Spell(MORTALSTRIKE)
		unless BuffPresent(WRECKINGCREW) Spell(MORTALSTRIKE)
		if Mana(less 26) or Mana(more 34) Spell(MORTALSTRIKE)
	}
	#/execute,if=rage>90
	if Mana(more 90) and TargetLifePercent(less 20) Spell(EXECUTE)
	#/overpower,if=buff.taste_for_blood.up|buff.overpower.up
	if BuffPresent(TASTEFORBLOOD) or Spell(OVERPOWER)
	{
		if Stance(1) Spell(OVERPOWER)
		#
		# If not in Battle Stance, then only Overpower if conditions to switch to Battle Stance are met,
		# i.e., won't waste rage and Mortal Strike not about to come off cooldown.
		#
		unless Stance(1)
		{
			unless Mana(more 75) or 1.5s before Spell(MORTALSTRIKE)
				Spell(OVERPOWER)
		}
	}
	#/execute
	if TargetLifePercent(less 20) Spell(EXECUTE)
	#/colossus_smash,if=buff.colossus_smash.remains<=1.5
	if TargetDebuffExpires(COLOSSUSSMASH 1.5 mine=1) Spell(COLOSSUSSMASH)
	#/slam,if=(rage>=35|buff.battle_trance.up|buff.deadly_calm.up)
	if Mana(more 34) or BuffPresent(BATTLETRANCE) or BuffPresent(DEADLYCALM) Spell(SLAM)
	#/battle_shout,if=rage<60
	if Mana(less 60)
	{
		if List(shout command) Spell(COMMANDINGSHOUT)
		if List(shout battle) or List(shout none) Spell(BATTLESHOUT)
	}
}

AddIcon help=offgcd mastery=1
{

	#/heroic_leap,use_off_gcd=1,if=buff.colossus_smash.up
	#if TargetDebuffPresent(COLOSSUSSMASH mine=1) Spell(HEROICLEAP)
	#if ( glyphs.berserker_rage -> ok() ) { /berserker_rage,if=buff.deadly_calm.down&cooldown.deadly_calm.remains>1.5&rage<=95,use_off_gcd=1 }
	if Glyph(GLYPHOFBERSERKERRAGE) and Mana(less 96)
		unless BuffPresent(DEADLYCALM) or 1.5s before Spell(DEADLYCALM)
			Spell(BERSERKERRAGE)
	#/inner_rage,if=buff.deadly_calm.down&cooldown.deadly_calm.remains>15,use_off_gcd=1
	unless BuffPresent(DEADLYCALM) Spell(INNERRAGE)
	#/heroic_strike,use_off_gcd=1,if=buff.deadly_calm.up
	if BuffPresent(DEADLYCALM) Spell(HEROICSTRIKE)
	#/heroic_strike,use_off_gcd=1,if=rage>85
	if Mana(more 85) Spell(HEROICSTRIKE)
	#/heroic_strike,use_off_gcd=1,if=buff.inner_rage.up&target.health_pct>20&(rage>=60|(set_bonus.tier13_2pc_melee&rage>=50))
	#/heroic_strike,use_off_gcd=1,if=buff.inner_rage.up&target.health_pct<=20&((rage>=60|(set_bonus.tier13_2pc_melee&rage>=50))|buff.battle_trance.up)
	if BuffPresent(INNERRAGE)
	{
		if Mana(more 59) Spell(HEROICSTRIKE)
		if ArmorSetParts(T13 more 1) and Mana(more 49) Spell(HEROICSTRIKE)
		unless TargetLifePercent(more 20)
			if BuffPresent(BATTLETRANCE) Spell(HEROICSTRIKE)
	}
}

# Arms AoE rotation from Icy Veins:
# http://www.icy-veins.com/arms-warrior-pve-rotation-cooldowns-abilities#sec-2
#
AddIcon help=aoe mastery=1 checkboxon=aoe
{
	# Apply Rend and spread to the rest of the mobs.
	if TalentPoints(BLOODANDTHUNDERTALENT more 0)
	{
		unless TargetDebuffPresent(RENDDEBUFF mine=1) Spell(REND)
		unless BuffPresent(SWEEPINGSTRIKES) Spell(THUNDERCLAP)
	}

	# Bladestorm followed by Sweeping Strikes.
	unless BuffPresent(DEADLYCALM) or BuffPresent(SWEEPINGSTRIKES) Spell(BLADESTORM)
	unless BuffPresent(BLADESTORM) Spell(SWEEPINGSTRIKES)

	# Execute single-target rotation on one mob, but replace Colossus Smash with Whirlwind.
	if CheckBoxOn(dancing) and TargetDebuffPresent(RENDDEBUFF mine=1)
		unless Spell(MORTALSTRIKE) Spell(WHIRLWIND)

	# Use Cleave in place of Heroic Strike.
	if BuffPresent(DEADLYCALM) Spell(CLEAVE)
	if Mana(more 85) Spell(CLEAVE)
	if BuffPresent(INNERRAGE) and {Mana(more 59) or BuffPresent(BATTLETRANCE)} Spell(CLEAVE)
}

AddIcon help=cd mastery=1
{
	#/golemblood_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(GOLEMBLOODPOTION)
	if Stance(2)
	{
		Spell(SHIELDBLOCK usable=1)
		Spell(STONEFORM)
		Spell(SHIELDWALL usable=1)
	}
	if IsFeared() or IsIncapacitated() Spell(BERSERKERRAGE)
	if TargetIsInterruptible() and TargetInRange(PUMMEL) Spell(PUMMEL)
	#/golemblood_potion,if=buff.recklessness.up|target.time_to_die<26
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(RECKLESSNESS) or TargetDeadIn(less 26)} Item(GOLEMBLOODPOTION)
	#/use_item
	UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
    #init_use_racial_actions()
	UseRacialActions()
	#/deadly_calm,use_off_gcd=1
	Spell(DEADLYCLAM)
	#/recklessness,if=target.health_pct>90|target.health_pct<=20,use_off_gcd=1
	if TargetLifePercent(more 90) or TargetLifePercent(less 20) Spell(RECKLESSNESS)
}

###
### Fury
###

AddIcon help=main mastery=2
{
	# Maintain raid buffs and debuffs.
	if List(shout command) and BuffExpires(stamina 3) Spell(COMMANDINGSHOUT nored=1)
	if List(shout battle) and BuffExpires(strengthagility 3) Spell(BATTLESHOUT nored=1)
	if TargetClassification(worldboss) and CheckBoxOn(demo) and TargetDebuffExpires(lowerphysicaldamage 2) Spell(DEMORALIZINGSHOUT nored=1)
	if CheckBoxOn(sunder) and TargetDebuffExpires(lowerarmor 0 mine=0)
		unless TargetDebuffPresent(SUNDERARMORDEBUFF 3 mine=1 stacks=3) Spell(SUNDERARMOR nored=1)

	#/stance,choose=berserker
	if HasShield()
		unless Stance(2) Spell(DEFENSIVESTANCE)
	unless Stance(3) or HasShield() Spell(BERSERKERSTANCE)
	if TalentPoints(TITANSGRIPTALENT more 0)
	{
		#/execute,if=buff.executioner_talent.remains<1.5
		if TalentPoints(EXECUTIONERTALENT more 0)
			if BuffExpires(EXECUTIONER 1.5) and TargetLifePercent(less 20) Spell(EXECUTE)
		#/colossus_smash
		Spell(COLOSSUSSMASH)
		#/execute,if=buff.executioner_talent.stack<5
		if TalentPoints(EXECUTIONERTALENT more 0)
		{
			unless BuffPresent(EXECUTIONER stacks=5)
				if TargetLifePercent(less 20) Spell(EXECUTE)
		}
		#/bloodthirst
		Spell(BLOODTHIRST)
		#/raging_blow
		if BuffPresent(enrage) Spell(RAGINGBLOW)
		#/slam,if=buff.bloodsurge.react
		if BuffPresent(BLOODSURGE) Spell(SLAM)
		#/execute,if=rage>=50
		if Mana(more 49) and TargetLifePercent(less 20) Spell(EXECUTE)
		#/battle_shout,if=rage<70
		if Mana(less 70)
		{
			if List(shout command) Spell(COMMANDINGSHOUT)
			if List(shout battle) or List(shout none) Spell(BATTLESHOUT)
		}
	}
	unless TalentPoints(TITANSGRIPTALENT more 0)
	{
		#/execute,if=buff.executioner_talent.remains<1.5
		if TalentPoints(EXECUTIONERTALENT more 0)
			if BuffExpires(EXECUTIONER 1.5) and TargetLifePercent(less 20) Spell(EXECUTE)
		#/execute,if=buff.executioner_talent.stack<5&rage>=30&cooldown.bloodthirst.remains>0.2
		if TalentPoints(EXECUTIONERTALENT more 0)
		{
			unless BuffPresent(EXECUTIONER stacks=5) or 0.2s before Spell(BLOODTHIRST)
				if Mana(more 29) and TargetLifePercent(less 20) Spell(EXECUTE)
		}
		#/bloodthirst
		Spell(BLOODTHIRST)
		#/colossus_smash,if=buff.colossus_smash.down
		unless TargetDebuffPresent(COLOSSUSSMASH mine=1) Spell(COLOSSUSSMASH)
		#/slam,if=buff.bloodsurge.react
		if BuffPresent(BLOODSURGE) Spell(SLAM)
		#/execute,if=rage>=50&cooldown.bloodthirst.remains>0.2
		unless 0.2s before Spell(BLOODTHIRST)
			if Mana(more 49) and TargetLifePercent(less 20) Spell(EXECUTE)
		#/raging_blow,if=rage>60&cooldown.inner_rage.remains>2&buff.inner_rage.down
		unless BuffPresent(INNERRAGE) or 2s before Spell(INNERRAGE)
			if Mana(more 60) and BuffPresent(enrage) Spell(RAGINGBLOW)
		#/raging_blow,if=rage>90&buff.inner_rage.up&cooldown.bloodthirst.remains>0.2
		unless 0.2s before Spell(BLOODTHIRST)
			if Mana(more 90) and BuffPresent(enrage) and BuffPresent(INNERRAGE) Spell(RAGINGBLOW)
		#/raging_blow,if=buff.colossus_smash.up&rage>50
		if TargetDebuffPresent(COLOSSUSSMASH mine=1) and Mana(more 50) Spell(RAGINGBLOW)
		#/battle_shout,if=rage<70&cooldown.bloodthirst.remains>0.2
		unless 0.2s before Spell(BLOODTHIRST) or Mana(more 69)
		{
			if List(shout command) Spell(COMMANDINGSHOUT)
			if List(shout battle) or List(shout none) Spell(BATTLESHOUT)
		}
	}
}

AddIcon help=offgcd mastery=2
{
	#/heroic_leap,use_off_gcd=1,if=buff.colossus_smash.up
	#if TargetDebuffPresent(COLOSSUSSMASH mine=1) Spell(HEROICLEAP)
	if TalentPoints(TITANSGRIPTALENT more 0)
	{
		#if ( set_bonus.tier13_2pc_melee() )
		#	/inner_rage,use_off_gcd=1,if=target.adds=0&((rage>=75&target.health_pct>=20)|\
		#		((buff.incite.up|buff.colossus_smash.up)&\
		#			((rage>=40&target.health_pct>=20)|\
		#			 (rage>=65&target.health_pct<20))
		#		))
		if ArmorSetParts(T13 more 1)
		{
			if TargetLifePercent(more 20) and Mana(more 74) Spell(INNERRAGE)
			if BuffPresent(INCITE) or TargetDebuffPresent(COLOSSUSSMASH mine=1)
			{
				if TargetLifePercent(more 20) and Mana(more 39) Spell(INNERRAGE)
				unless TargetLifePercent(more 20) if Mana(more 64) Spell(INNERRAGE)
			}
		}
		#/heroic_strike,use_off_gcd=1,if=(rage>=85|(set_bonus.tier13_2pc_melee&buff.inner_rage.up&rage>=75))&target.health_pct>=20
		if TargetLifePercent(more 20)
		{
			if Mana(more 84) Spell(HEROICSTRIKE)
			if Mana(more 74) and ArmorSetParts(T13 more 1) and BuffPresent(INNERRAGE) Spell(HEROICSTRIKE)
		}
		#/heroic_strike,use_off_gcd=1,if=buff.battle_trance.up
		if BuffPresent(BATTLETRANCE) Spell(HEROICSTRIKE)
		#/heroic_strike,use_off_gcd=1,if=(buff.incite.up|buff.colossus_smash.up)&\
		#	(((rage>=50|(rage>=40&set_bonus.tier13_2pc_melee&buff.inner_rage.up))&target.health_pct>=20)|\
		#	 ((rage>=75|(rage>=65&set_bonus.tier13_2pc_melee&buff.inner_rage.up))&target.health_pct<20))
		if BuffPresent(INCITE) or TargetDebuffPresent(COLOSSUSSMASH mine=1)
		{
			if TargetLifePercent(more 20)
			{
				if Mana(more 49) Spell(HEROICSTRIKE)
				if Mana(more 39) and ArmorSetParts(T13 more 1) and BuffPresent(INNERRAGE) Spell(HEROICSTRIKE)
			}
			unless TargetLifePercent(more 20)
			{
				if Mana(more 74) Spell(HEROICSTRIKE)
				if Mana(more 64) and ArmorSetParts(T13 more 1) and BuffPresent(INNERRAGE) Spell(HEROICSTRIKE)
			}
		}
		#/berserker_rage,if=!(buff.death_wish.up|buff.enrage.up|buff.unholy_frenzy.up)&rage>15&cooldown.raging_blow.remains<1,use_off_gcd=1
		if TalentPoints(RAGINGBLOWTALENT more 0) and BuffExpires(enrage 0) and Mana(more 15) and 1s before Spell(RAGINGBLOW)
			Spell(BERSERKERRAGE)
	}
	unless TalentPoints(TITANSGRIPTALENT more 0)
	{
		#/berserker_rage,use_off_gcd=1,if=rage<95
		if Glyph(GLYPHOFBERSERKERRAGE) and Mana(less 95) Spell(BERSERKERRAGE)
		#/heroic_strike,use_off_gcd=1,if=set_bonus.tier13_2pc_melee&buff.inner_rage.up&rage>=60&target.health_pct>=20
		if TargetLifePercent(more 20)
			if Mana(more 59) and ArmorSetParts(T13 more 1) and BuffPresent(INNERRAGE) Spell(HEROICSTRIKE)
		#/heroic_strike,use_off_gcd=1,if=buff.battle_trance.up
		if BuffPresent(BATTLETRANCE) Spell(HEROICSTRIKE)
		#/heroic_strike,use_off_gcd=1,if=buff.colossus_smash.up&rage>50
		if TargetDebuffPresent(COLOSSUSSMASH mine=1) and Mana(more 50) Spell(HEROICSTRIKE)
		#/inner_rage,use_off_gcd=1,if=buff.colossus_smash.up|cooldown.colossus_smash.remains<9
		if TargetDebuffPresent(COLOSSUSSMASH mine=1) or 9s before Spell(COLOSSUSSMASH) Spell(INNERRAGE)
		#/heroic_strike,use_off_gcd=1,if=(buff.incite.up|buff.colossus_smash.up)&\
		#	((rage>=50|(rage>=40&set_bonus.tier13_2pc_melee&buff.inner_rage.up))&target.health_pct>=20)
		if BuffPresent(INCITE) or TargetDebuffPresent(COLOSSUSSMASH mine=1)
		{
			if TargetLifePercent(more 20)
			{
				if Mana(more 49) Spell(HEROICSTRIKE)
				if Mana(more 39) and ArmorSetParts(T13 more 1) and BuffPresent(INNERRAGE) Spell(HEROICSTRIKE)
			}
		}
		#/heroic_strike,use_off_gcd=1,if=(buff.incite.up|buff.colossus_smash.up)&\
		#	((rage>=75|(rage>=65&set_bonus.tier13_2pc_melee&buff.inner_rage.up))&target.health_pct<20)
		if BuffPresent(INCITE) or TargetDebuffPresent(COLOSSUSSMASH mine=1)
		{
			if TargetLifePercent(more 20)
			{
				if Mana(more 74) Spell(HEROICSTRIKE)
				if Mana(more 64) and ArmorSetParts(T13 more 1) and BuffPresent(INNERRAGE) Spell(HEROICSTRIKE)
			}
		}
		#/heroic_strike,use_off_gcd=1,if=rage>=85
		if Mana(more 84) Spell(HEROICSTRIKE)
	}
}

AddIcon help=aoe mastery=2 checkboxon=aoe
{
	#/cleave,if=target.adds>0,use_off_gcd=1
	Spell(CLEAVE) 
	#/whirlwind,if=target.adds>0
	Spell(WHIRLWIND)
}

AddIcon help=cd mastery=2
{
	#/golemblood_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(GOLEMBLOODPOTION)
	if Stance(2)
	{
		Spell(SHIELDBLOCK usable=1)
		Spell(STONEFORM)
		Spell(SHIELDWALL usable=1)
	}
	if IsFeared() or IsIncapacitated() Spell(BERSERKERRAGE)
	if TargetIsInterruptible() and TargetInRange(PUMMEL) Spell(PUMMEL)
	#/golemblood_potion,if=buff.bloodlust.react
	if CheckBoxOn(potions) and TargetClassification(worldboss) and BuffPresent(heroism) Item(GOLEMBLOODPOTION)
	#/use_item
	UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
    #init_use_racial_actions()
	UseRacialActions()
	if TalentPoints(TITANSGRIPTALENT more 0)
	{
		#/recklessness,use_off_gcd=1
		Spell(RECKLESSNESS)
		#/death_wish,use_off_gcd=1
		Spell(DEATHWISH)
		#if ( ! talents.raging_blow -> ok() && glyphs.berserker_rage -> ok() ) { /berserker_rage }
		unless TalentPoints(RAGINGBLOWTALENT more 0) if Glyph(GLYPHOFBERSERKERRAGE) Spell(BERSERKERRAGE)
	}
	unless TalentPoints(TITANSGRIPTALENT more 0)
	{
		#/death_wish,use_off_gcd=1,if=target.time_to_die>174|target.health_pct<20|target.time_to_die<31
		if TargetDeadIn(more 174) or TargetLifePercent(less 20) or TargetDeadIn(less 31) Spell(DEATHWISH)
		#/recklessness,use_off_gcd=1,if=buff.death_wish.up|target.time_to_die<13
		if BuffPresent(DEATHWISH) or TargetDeadIn(less 13) Spell(RECKLESSNESS)
	}
}

###
### Protection
###

# Cataclysm protection warrior rotation from Tengenstein at TankSpot:
# http://www.tankspot.com/showthread.php?78294-Warrior-Tanking-Questions-(Problems-)&p=535355#post535355
#
# SnB cycling rotation, or "SS fish fish truck":
#   Use Revenge/Devastate to fish for SnB procs for Shield Slam, or a heavy dmg/threat spell (that hits like
#   a truck) right before Shield Slam is off cooldown. Revenge is only worthwhile in low-rage situations or
#   with 2pT13, otherwise it's both lower threat and damage than Devastate.
#
# Elitist Jerks advice on when to Rend:
# http://elitistjerks.com/f81/t110315-cataclysm_protection_warrior/#post1813079
#
#   A single Rend application is only worth using on a 30%-bleed debuffed single target if it ticks at least
#   four times. Unbuffed, it must tick all six times.
#
# Off-tank protection warrior DPS rotation from Tengenstein at TankSpot:
# http://www.tankspot.com/showthread.php?71824-The-Cataclystic-Protection-Warrior-Spreadsheet&p=535809#post535809
#
AddIcon help=main mastery=3
{
	if Stance(1) Spell(DEFENSIVESTANCE)
	unless Stance(2) if TargetTargetIsPlayer() Spell(DEFENSIVESTANCE)

	# Maintain raid buffs.
	if List(shout command) and BuffExpires(stamina 3) Spell(COMMANDINGSHOUT nored=1)
	if List(shout battle) and BuffExpires(strengthagility 3) Spell(BATTLESHOUT nored=1)

	if LifePercent(less 75) and BuffPresent(VICTORIOUS) Spell(VICTORYRUSH usable=1)

	# Maintain tanking debuffs.
	if CheckBoxOn(demo) and TargetDebuffExpires(lowerphysicaldamage 4) Spell(DEMORALIZINGSHOUT)
	unless Stance(3) if TargetDebuffExpires(meleeslow 2) Spell(THUNDERCLAP)

	# Keep Shield Slam on CD.
	if HasShield() Spell(SHIELDSLAM)

	# Maintain Rend.
	unless Stance(3)
	{
		if TargetDebuffPresent(RENDDEBUFF mine=1) and TargetDebuffExpires(RENDDEBUFF 3 mine=1)
		{
			if {TargetDebuffPresent(bleed) and TargetDeadIn(more 9)} or TargetDeadIn(more 15)
			{
				if TalentPoints(BLOODANDTHUNDERTALENT more 0) Spell(THUNDERCLAP)
				unless TalentPoints(BLOODANDTHUNDERTALENT more 0) Spell(REND)
			}
		}
	}

	# Shorten the CD of Shield Slam via SnB proc; "fish".
	unless TalentPoints(SWORDANDBOARDTALENT equal 0) or spell(SHIELDSLAM) < timeWithHaste(2)
	{
		# Revenge has lower DPE than Devastate because prot warriors have glyphs and talents that tie into
		# crit chance of Devastate, e.g., Deep Wounds, Glyph of Devastate, etc. Only use Revenge in low-rage
		# situations or if Deep Wounds hasn't been taken.
		#
		if Stance(2)
		{
			if Mana(less 20) or CheckBoxOn(revenge) or TalentPoints(DEEPWOUNDSTALENT equal 0) Spell(REVENGE usable=1)
		}
		Spell(DEVASTATE)
	}

	# Put up Rend.
	unless Stance(3) or TargetDebuffPresent(RENDDEBUFF mine=1)
		if {TargetDebuffPresent(bleed) and TargetDeadIn(more 9)} or TargetDeadIn(more 15) Spell(REND)

	# "Truck".
	unless Stance(2) Spell(COLOSSUSSMASH)
	if Stance(2) Spell(CONCUSSIONBLOW)
	if Stance(3) and Mana(more 90) and TargetLifePercent(less 20) Spell(EXECUTE)
	Spell(SHOCKWAVE)

	if Mana(less 20)
	{
		if List(shout command) Spell(COMMANDINGSHOUT)
		if List(shout battle) or List(shout none) Spell(BATTLESHOUT)
	}
}

AddIcon help=offgcd mastery=3
{
	if Stance(2)
	{
		if Mana(more 84) Spell(INNERRAGE)
		if Mana(more 50) Spell(HEROICSTRIKE)
	}
	unless Stance(2)
		if Mana(more 96) Spell(HEROICSTRIKE)
	if Glyph(GLYPHOFBERSERKERRAGE no) or Mana(less 96) Spell(BERSERKERRAGE)
}

AddIcon help=aoe mastery=3 checkboxon=aoe
{
	unless TargetDebuffPresent(RENDDEBUFF mine=1) Spell(REND)
	Spell(THUNDERCLAP)
	Spell(SHOCKWAVE)
	if TalentPoints(IMPROVEDREVENGETALENT more 0) Spell(REVENGE usable=1)
	Spell(CLEAVE)
}

AddIcon help=cd size=small mastery=3
{
	if IsFeared() or IsIncapacitated() Spell(BERSERKERRAGE)
	if CheckBoxOn(reflect) and HasShield() and TargetIsInterruptible() and TargetTargetIsPlayer() Spell(SPELLREFLECTION)
	if TargetIsInterruptible() and TargetInRange(PUMMEL) Spell(PUMMEL)
	if Stance(2)
	{
		Spell(SHIELDBLOCK usable=1)
		Spell(STONEFORM)
		Spell(SHIELDWALL usable=1)
		Spell(LASTSTAND)
	}
	unless Stance(2) Spell(RECKLESSNESS)
}

AddIcon help=cd size=small mastery=3
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]]