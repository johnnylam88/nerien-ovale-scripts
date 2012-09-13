NerienOvaleScripts.script["PALADIN"] =
[[
# Nerien's Paladin Ovale script based on SimulationCraft.
#
# Retribution:
#	talents=http://www.wowhead.com/talent#paladin-203002000000000000000200000000000000000023203213211113012301
#	glyphs=the_ascetic_crusader/hammer_of_wrath/rebuke/templars_verdict/exorcism/seal_of_truth

# Buffs
Define(DIVINEPURPOSE 90174)
Define(GRANDCRUSADER 85416)
SpellList(INFUSIONOFLIGHT 53672 54149) # 2 ranks of the talent give different buffs
SpellList(JUDGEMENTSOFTHEPURE 53655 53656 53657) # 3 ranks of the talent give different buffs
Define(SACREDDUTY 85433)
Define(THEARTOFWAR 59578)

# Glyphs
Define(GLYPHOFCONSECRATION 54928)

# Talents
Define(JUDGEMENTSOFTHEPURETALENT 10127)
Define(SANCTIFIEDWRATHTALENT ???)

# Abilities
Define(AVENGERSSHIELD 31935)
	SpellInfo(AVENGERSSHIELD cd=15)
Define(AVENGINGWRATH 31884)
	SpellInfo(AVENGINGWRATH cd=180)
	SpellAddBuff(AVENGINGWRATH AVENGINGWRATH=20)
Define(CONSECRATION 26573)
	SpellInfo(CONSECRATION cd=30)
	SpellInfo(CONSECRATION addcd=36 glyph=GLYPHOFCONSECRATION)
Define(CRUSADERSTRIKE 35395)
	SpellInfo(CRUSADERSTRIKE cd=4 holy=1)
Define(DIVINEFAVOR 31842)
	SpellInfo(DIVINEFAVOR cd=180)
	SpellAddBuff(DIVINEFAVOR DIVINEFAVOR=20)
Define(DIVINELIGHT 82326)
Define(DIVINEPLEA 54428)
	SpellInfo(DIVINEPLEA cd=120)
	SpellAddBuff(DIVINEPLEA DIVINEPLEA=9)
Define(DIVINEPROTECTION 498)
	SpellInfo(DIVINEPROTECTION cd=60)
	SpellAddBuff(DIVINEPROTECTION DIVINEPROTECTION=10)
Define(DIVINESTORM 53385)
	SpellInfo(DIVINESTORM cd=4.5)
Define(EXORCISM 879)
	SpellAddBuff(EXORCISM THEARTOFWAR=0)
Define(FLASHOFLIGHT 19750)
Define(GUARDIANOFANCIENTKINGS 86150)
	SpellInfo(GUARDIANOFANCIENTKINGS cd=300)
Define(HAMMEROFWRATH 24275)
	SpellInfo(HAMMEROFWRATH cd=6)
Define(HAMMEROFTHERIGHTEOUS 53595)
	SpellInfo(HAMMEROFTHERIGHTEOUS cd=4.5 holy=1)
Define(HOLYLIGHT 635)
Define(HOLYRADIANCE 82327)
	SpellInfo(HOLYRADIANCE holy=1)
Define(HOLYSHIELD 20925)
	SpellInfo(HOLYSHIELD  cd=30)
	SpellAddBuff(HOLYSHIELD HOLYSHIELD=10)
Define(HOLYSHOCK 20473)
	SpellInfo(HOLYSHOCK cd=6)
Define(HOLYWRATH 2812)
	SpellInfo(HOLYWRATH cd=15)
Define(INQUISITION 84963)
	SpellInfo(INQUISITION holy=-3)
	SpellAddBuff(INQUISITION INQUISITION=12 DIVINEPURPOSE=0)
Define(JUDGEMENT 20271)
	SpellInfo(JUDGEMENT cd=8)
	SpellInfo(JUDGEMENT holy=1 itemset=T13 itemcount=2)
	SpellAddBuff(JUDGEMENT 53657 talent=JUDGEMENTSOFTHEPURETALENT)
Define(LIGHTOFDAWN 85222)
	SpellInfo(LIGHTOFDAWN holy=-3)
Define(REBUKE 96231)
	SpellInfo(REBUKE cd=10)
Define(RIGHTEOUSFURY 25780)
Define(SEALOFINSIGHT 20165)
	SpellAddBuff(SEALOFINSIGHT SEALOFINSIGHT=1800)
Define(SEALOFJUSTICE 20164)
	SpellAddBuff(SEALOFJUSTICE SEALOFJUSTICE=1800)
Define(SEALOFRIGHTEOUSNESS 20154)
	SpellAddBuff(SEALOFRIGHTEOUSNESS SEALOFRIGHTEOUSNESS=1800)
Define(SEALOFTRUTH 31801)
	SpellAddBuff(SEALOFTRUTH SEALOFTRUTH=1800)
Define(SHIELDOFTHERIGHTEOUS 53600)
	SpellInfo(SHIELDOFTHERIGHTEOUS cd=6 holy=-3)
	SpellAddBuff(SHIELDOFTHERIGHTEOUS DIVINEPURPOSE=0)
Define(TEMPLARSVERDICT 85256)
	SpellInfo(TEMPLARSVERDICT holy=-3)
	SpellAddBuff(TEMPLARSVERDICT DIVINEPURPOSE=0)
Define(WORDOFGLORY 85673)
	SpellInfo(WORDOFGLORY holy=-3)
Define(ZEALOTRY 85696)
	SpellInfo(ZEALOTRY cd=120)
	SpellAddBuff(ZEALOTRY ZEALOTRY=20)

# Racials & Professions
Define(ARCANETORRENTMANA 28730) # blood elf
	SpellInfo(ARCANETORRENTMANA sharedcd=racial cd=120)
Define(LIFEBLOOD 55503) # herbalism
	SpellInfo(LIFEBLOOD duration=20 cd=120)
Define(STONEFORM 20594) # dwarf
	SpellInfo(STONEFORM duration=8 cd=120)
	SpellAddBuff(STONEFORM STONEFORM=8)

# Items
Define(GOLEMBLOODPOTION 58146)
	Define(GOLEMBLOODPOTIONSPELL 80496)

AddCheckBox(aoe L(AOE) default)
AddListItem(hpability inquisition SpellName(INQUISITION) mastery=2 default)
AddListItem(hpability shieldoftherighteous SpellName(SHIELDOFTHERIGHTEOUS) mastery=2)
AddListItem(hpability wordofglory SpellName(WORDOFGLORY) mastery=2)
AddCheckBox(potions SpellName(GOLEMBLOODPOTIONSPELL) mastery=3 default)
AddCheckBox(consecration SpellName(CONSECRATION) default)

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
	if ManaPercent(less 91) Spell(ARCANETORRENTMANA)
}

###
### Holy
###
AddIcon help=main mastery=1
{
	unless InCombat() if BuffExpires(SEALOFINSIGHT 400) Spell(SEALOFINSIGHT)
	unless BuffPresent(SEALOFINSIGHT) Spell(SEALOFINSIGHT)
	if BuffExpires(JUDGEMENTSOFTHEPURE 10) Spell(JUDGEMENT)
	if HolyPower(more 2) Spell(WORDOFGLORY)
	Spell(HOLYSHOCK)
	if BuffPresent(INFUSIONOFLIGHT) Spell(DIVINELIGHT)
}

AddIcon help=aoe mastery=1 checkboxon=aoe
{
	unless InCombat() if BuffExpires(SEALOFINSIGHT 400) Spell(SEALOFINSIGHT)
	unless BuffPresent(SEALOFINSIGHT) Spell(SEALOFINSIGHT)
	if BuffExpires(JUDGEMENTSOFTHEPURE 10) Spell(JUDGEMENT)
    if HolyPower(more 2) Spell(LIGHTOFDAWN)
    Spell(HOLYRADIANCE)
}

AddIcon help=cd mastery=1
{
	if TargetIsInterruptible() and TargetInRange(REBUKE) Spell(REBUKE)
	Spell(AVENGINGWRATH)
	Spell(DIVINEFAVOR)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
	Spell(GUARDIANOFANCIENTKINGS)
}

AddIcon help=mana size=small mastery=1
{
	if ManaPercent(less 91) Spell(ARCANETORRENTMANA)
	if ManaPercent(less 88) Spell(DIVINEPLEA)
}

###
### Protection
###
AddIcon help=main mastery=2
{
	# From the Maintankadin thread "Theck's MATLAB thread - Cataclysm/4.x":
	#     http://maintankadin.failsafedesign.com/forum/viewtopic.php?f=6&t=29317
	# Single Target Queue (default):
	#     SotR > CS > AS+ > J > AS > HoW(if active) > Cons* > HW* 
	# "Inquisition" Single Target Queue (max DPS):
	#     SotR (if Sacred Duty or Inquisition active) > Inq > CS > AS+ > J > AS > HoW(if active) > Cons* > HW* 
	# (*=mana permitting, boss stationary for Cons to be fully effective)

	unless InCombat()
	{
		unless BuffPresent(RIGHTEOUSFURY) Spell(RIGHTEOUSFURY)
		if BuffExpires(SEALOFINSIGHT 400) and BuffExpires(SEALOFJUSTICE 400) and BuffExpires(SEALOFRIGHTEOUSNESS 400) and BuffExpires(SEALOFTRUTH 400)
			Spell(SEALOFTRUTH)
	}

	unless BuffPresent(RIGHTEOUSFURY) if TargetTargetIsPlayer() Spell(RIGHTEOUSFURY)
	unless BuffPresent(SEALOFINSIGHT) or BuffPresent(SEALOFJUSTICE) or BuffPresent(SEALOFRIGHTEOUSNESS) or BuffPresent(SEALOFTRUTH) Spell(SEALOFTRUTH)
	if HolyPower(more 2)
	{
		if List(hpability inquisition)
		{
			if BuffPresent(INQUISITION) or BuffPresent(SACREDDUTY) Spell(SHIELDOFTHERIGHTEOUS)
			Spell(INQUISITION)
		}
		if List(hpability wordofglory)
		{
			unless 4s before Spell(WORDOFGLORY) Spell(SHIELDOFTHERIGHTEOUS)
			Spell(WORDOFGLORY priority=4)
		}
		if List(hpability shieldoftherighteous) Spell(SHIELDOFTHERIGHTEOUS)
	}
	Spell(CRUSADERSTRIKE)
	if BuffPresent(GRANDCRUSADER) Spell(AVENGERSSHIELD)
	Spell(JUDGEMENT)
	Spell(AVENGERSSHIELD)
	if TargetLifePercent(less 20) Spell(HAMMEROFWRATH)
	if CheckBoxOn(consecration) Spell(CONSECRATION)
	Spell(HOLYWRATH)
	Spell(DIVINEPLEA priority=2)
}

AddIcon help=aoe mastery=2 checkboxon=aoe
{
	# From the Maintankadin thread "Theck's MATLAB thread - Cataclysm/4.x":
	#     http://maintankadin.failsafedesign.com/forum/viewtopic.php?f=6&t=29317
	# AoE Queue:
	#     Inq(if not active) > HotR > AS > Cons > HW > J

	unless InCombat()
	{
		unless BuffPresent(RIGHTEOUSFURY) Spell(RIGHTEOUSFURY)
		if BuffExpires(SEALOFINSIGHT 400) and BuffExpires(SEALOFJUSTICE 400) and BuffExpires(SEALOFRIGHTEOUSNESS 400) and BuffExpires(SEALOFTRUTH 400)
			Spell(SEALOFTRUTH)
	}

	unless BuffPresent(RIGHTEOUSFURY) if TargetTargetIsPlayer() Spell(RIGHTEOUSFURY)
	unless BuffPresent(SEALOFINSIGHT) or BuffPresent(SEALOFJUSTICE) or BuffPresent(SEALOFRIGHTEOUSNESS) or BuffPresent(SEALOFTRUTH) Spell(SEALOFTRUTH)
	unless BuffPresent(INQUISITION) if HolyPower(more 2) Spell(INQUISITION)
	Spell(HAMMEROFTHERIGHTEOUS)
	Spell(AVENGERSSHIELD)
	Spell(CONSECRATION)
	Spell(HOLYWRATH)
	Spell(JUDGEMENT)
}

AddIcon help=cd size=small mastery=2
{
	if TargetIsInterruptible() and TargetInRange(REBUKE) Spell(REBUKE)
	unless List(hpability wordofglory) if HolyPower(more 2) Spell(WORDOFGLORY)
	Spell(HOLYSHIELD)
	Spell(STONEFORM)
	Spell(GUARDIANOFANCIENTKINGS)
	Spell(AVENGINGWRATH)
	Spell(DIVINEPROTECTION)
}

AddIcon help=cd size=small mastery=2
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Retribution
###
AddIcon help=main mastery=3
{
	unless InCombat()
	{
		if BuffExpires(SEALOFINSIGHT 400) and BuffExpires(SEALOFJUSTICE 400) and BuffExpires(SEALOFRIGHTEOUSNESS 400) and BuffExpires(SEALOFTRUTH 400)
			Spell(SEALOFTRUTH)
	}

	#/seal_of_truth
	unless BuffPresent(SEALOFINSIGHT) or BuffPresent(SEALOFJUSTICE) or BuffPresent(SEALOFRIGHTEOUSNESS) or BuffPresent(SEALOFTRUTH) Spell(SEALOFTRUTH)
	#/judgement,if=buff.judgements_of_the_pure.down
	unless BuffPresent(JUDGEMENTSOFTHEPURE) Spell(JUDGEMENT)
	#/crusader_strike,if=holy_power<3
	if HolyPower(less 3) Spell(CRUSADERSTRIKE)
	#/judgement,if=buff.zealotry.down&holy_power<3
	unless BuffPresent(ZEALOTRY)
	{
		if ArmorSetParts(T13 more 1) and HolyPower(less 3) Spell(JUDGEMENT)
		if ArmorSetParts(T13 less 2) Spell(JUDGEMENT)
	}
	#/inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|buff.divine_purpose.react)
	if BuffExpires(INQUISITION 2) and {HolyPower(more 2) or BuffPresent(DIVINEPURPOSE)} Spell(INQUISITION)
	#/templars_verdict,if=buff.divine_purpose.react
	if BuffPresent(DIVINEPURPOSE) Spell(TEMPLARSVERDICT)
	#/templars_verdict,if=holy_power=3
	if HolyPower(more 2) Spell(TEMPLARSVERDICT)
	#/exorcism,if=buff.the_art_of_war.react
	if BuffPresent(THEARTOFWAR) Spell(EXORCISM)
	#/hammer_of_wrath
	if TargetLifePercent(less 20) or {TalentPoints(SANCTIFIEDWRATHTALENT more 0) and BuffPresent(AVENGINGWRATH)} Spell(HAMMEROFWRATH)
	#/judgement,if=set_bonus.tier13_2pc_melee&buff.zealotry.up&holy_power<3
	if BuffPresent(ZEALOTRY)
	{
		if ArmorSetParts(T13 more 1) and HolyPower(less 3) Spell(JUDGEMENT)
		if ArmorSetParts(T13 less 2) Spell(JUDGEMENT)
	}
	#/wait,sec=0.1,if=cooldown.crusader_strike.remains<0.2&cooldown.crusader_strike.remains>0
	unless Spell(CRUSADERSTRIKE)
	{
		unless 0.2s before Spell(CRUSADERSTRIKE)
		{
			#/holy_wrath
			Spell(HOLYWRATH)
			#/consecration,if=mana>16000
			if CheckBoxOn(consecration) and Mana(more 16000) Spell(CONSECRATION)
		}
	}
}

AddIcon help=aoe mastery=3 checkboxon=aoe
{
	if HolyPower(less 3) Spell(DIVINESTORM)
	#/consecration,if=mana>16000
	if Mana(more 16000) Spell(CONSECRATION)
}

AddIcon help=cd mastery=3
{
	#/golemblood_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(GOLEMBLOODPOTION)
	if TargetIsInterruptible() and TargetInRange(REBUKE) Spell(REBUKE)
	#/golemblood_potion,if=buff.bloodlust.react
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(heroism) or TargetDeadIn(less 40)} Item(GOLEMBLOODPOTION)
	#/use_item
	UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
	#init_use_racial_actions()
	UseRacialActions()
	#/guardian_of_ancient_kings,if=cooldown.zealotry.remains<10
	if 10s before Spell(ZEALOTRY) Spell(GUARDIANOFANCIENTKINGS)
	#/zealotry,if=cooldown.guardian_of_ancient_kings.remains>0&cooldown.guardian_of_ancient_kings.remains<292
	if HolyPower(more 2)
	{
		unless Spell(GUARDIANOFANCIENTKINGS) if 292s before Spell(GUARDIANOFANCIENTKINGS) Spell(ZEALOTRY)
		if Level(less 85) Spell(ZEALOTRY)
	}
	#/avenging_wrath,if=buff.zealotry.up
	if BuffPresent(ZEALOTRY) Spell(AVENGINGWRATH)
	#/divine_plea
	Spell(DIVINEPLEA)
}
]]