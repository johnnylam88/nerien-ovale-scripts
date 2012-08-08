NerienOvaleScripts.script["WARLOCK"] =
[[
# Nerien's Warlock Ovale script based on SimulationCraft.
#
# Affliction:
#	talents=http://www.wowhead.com/talent#warlock-22322200301332132103000000000000000003300000000000000000
#	glyphs=haunt/corruption/unstable_affliction/life_tap/shadow_bolt
#
# Demonology:
#	talents=http://www.wowhead.com/talent#warlock-00300000000000000033212223003102122110320200000000000000
#	glyphs=metamorphosis/immolate/incinerate/life_tap/shadow_bolt
#
# Destruction:
#	talents=http://www.wowhead.com/talent#warlock-00300000000000000003202000000000000003320202312201312211
#	glyphs=immolate/imp/conflagrate/life_tap
#
# All specs:
#	- Potions, Demon Soul, and on-use trinkets should be macroed into Summon Doomguard/Infernal.

# Localization
#	Replace the following definitions with the corresponding localized name for warlock pet families.
#	The names can be found by running the following in a chat window in-game with the pet summoned:
#		/script print(UnitCreatureFamily("pet"))
#
Define(PETFELGUARD Felguard)
Define(PETFELHUNTER Felhunter)
Define(PETIMP Imp)
Define(PETSUCCUBUS Succubus)

# Buffs
Define(DARKINTENTBUFF 85768)
Define(DARKINTENTTARGETBUFF 85767)
Define(DECIMATION 63167)
Define(DEMONSOULFELGUARD 79462)
Define(DEMONSOULFELHUNTER 79460)
Define(DEMONSOULIMP 79459)
Define(DEMONSOULSUCCUBUS 79463)
Define(DEMONSOULVOIDWALKER 79464)
Define(EMPOWEREDIMP 47283)
Define(FELSPARK 89937) # 4pT11 proc
Define(IMPROVEDSOULFIREBUFF 85383)
Define(MOLTENCORE 71165)
Define(SHADOWTRANCE 17941)
Define(SHADOWANDFLAMEDEBUFF 17800)

# Buff Procs
SpellList(COMBATMIND 107970 109793 109795) # Will of Unbinding stacking int buff
Define(FOULGIFT 102662) # Foul Gift of the Demon Lord +1149 mastery proc
Define(LIGHTWEAVE 75170) # +580 int tailoring proc
Define(POWERTORRENT 74241) # +500 int weapon enchant proc
SpellList(VELOCITY 107982 109787 109789) # Insignia of the Corrupted Mind haste proc
Define(VOLCANICDESTRUCTION 89091) # DMC: Volcano +1600 int proc

# On-use trinket buffs for some commonly available 300+ trinkets.
SpellList(SPELLPOWERTRINKETBUFF 73551 84968 90889 91019 91135 91136 92225 95875 97007 97008 99712 99741 102437 105134 107948)
SpellList(HASTETRINKETBUFF 91041 92328)
SpellList(MASTERYTRINKETBUFF 100403)

# Debuffs
SpellList(CORRUPTIONDEBUFF 172 87389) # Corruption, Soulburn: Seed of Corruption
Define(JINXELEMENTSDEBUFF 86105) # Curse of Elements totem debuff spread by Jinx talent

# Talents
Define(BANETALENT 10938)
Define(EMBERSTORMTALENT 11181)
Define(IMPROVEDSOULFIRETALENT 10940)
Define(METAMORPHOSISTALENT 11044)
Define(SHADOWANDFLAMETALENT 10936)
	Define(SHADOWANDFLAMESPELL 17801)
Define(SOULSIPHONTALENT 11112)

# Glyphs
Define(GLYPHOFLASHOFPAIN 70947)
Define(GLYPHOFIMP 56248)
Define(GLYPHOFMETAMORPHOSIS 64318)

# Spells
Define(BANEOFAGONY 980)
	Spellinfo(BANEOFAGONY duration=24)
	SpellAddTargetDebuff(BANEOFAGONY BANEOFAGONY=24)
Define(BANEOFDOOM 603)
	SpellInfo(BANEOFDOOM duration=60)
	SpellAddTargetDebuff(BANEOFDOOM BANEOFDOOM=60)
Define(BANEOFHAVOC 80240)
	SpellAddTargetDebuff(BANEOFHAVOC BANEOFHAVOC=300)
Define(CHAOSBOLT 50796)
	SpellInfo(CHAOSBOLT cd=12)
Define(CONFLAGRATE 17962)
	SpellInfo(CONFLAGRATE cd=10)
Define(CORRUPTION 172)
	SpellAddTargetDebuff(CORRUPTION CORRUPTION=18)
Define(CREATEHEALTHSTONE 6201)
Define(CREATESOULSTONE 693)
Define(CURSEOFTHEELEMENTS 1490)
	SpellAddTargetDebuff(CURSEOFTHEELEMENTS CURSEOFTHEELEMENTS=300)
Define(CURSEOFTONGUES 1714)
	SpellAddTargetDebuff(CURSEOFTONGUES CURSEOFTONGUES=30)
Define(CURSEOFWEAKNESS 702)
	SpellAddTargetDebuff(CURSEOFWEAKNESS CURSEOFWEAKNESS=120)
Define(DARKINTENT 80398)
	SpellAddBuff(DARKINTENT DARKINTENTBUFF=1800)
Define(DEATHCOIL 6789)
	SpellInfo(DEATHCOIL cd=120)
Define(DEMONARMOR 687)
	SpellAddBuff(DEMONARMOR DEMONARMOR=1000)
Define(DEMONICEMPOWERMENT 47193)
	SpellInfo(DEMONICEMPOWERMENT cd=60)
Define(DEMONSOUL 77801)
	SpellInfo(DEMONSOUL cd=120)
Define(DRAINLIFE 689)
	SpellInfo(DRAINLIFE canStopChannelling=3)
	SpellAddTargetDebuff(DRAINLIFE DRAINLIFE=3)
	SpellAddBuff(DRAINLIFE SOULBURN=0)
Define(DRAINSOUL 1120)
	SpellInfo(DRAINSOUL canStopChannelling=5)
	SpellAddTargetDebuff(DRAINSOUL DRAINSOUL=15)
Define(FELARMOR 28176)
	SpellAddBuff(FELARMOR FELARMOR=1000)
Define(FELFLAME 77799)
	SpellAddTargetDebuff(FELFLAME IMMOLATE=refresh UNSTABLEAFFLICTION=refresh)
Define(HANDOFGULDAN 71521)
	SpellInfo(HANDOFGULDAN cd=12)
	SpellAddTargetDebuff(HANDOFGULDAN IMMOLATE=refresh)
Define(HAUNT 48181)
	SpellInfo(HAUNT cd=8)
	SpellAddTargetDebuff(HAUNT HAUNT=12)
Define(IMMOLATE 348)
	SpellInfo(IMMOLATE duration=15)
	SpellAddTargetDebuff(IMMOLATE IMMOLATE=15)
	SpellAddBuff(IMMOLATE MOLTENCORE=-1)
Define(IMMOLATIONAURA 50589)
	SpellInfo(IMMOLATIONAURA cd=30)
	SpellAddBuff(IMMOLATIONAURA IMMOLATIONAURA=15)
Define(INCINERATE 29722)
	SpellAddBuff(INCINERATE SHADOWANDFLAMEDEBUFF=30 MOLTENCORE=-1)
Define(LIFETAP 1454)
	SpellInfo(LIFETAP cd=10) #fake
Define(METAMORPHOSIS 47241)
	SpellInfo(METAMORPHOSIS cd=180)
	SpellAddBuff(METAMORPHOSIS METAMORPHOSIS=30)
Define(NETHERWARD 91711)
Define(RITUALOFSOULS 29893)
	SpellInfo(RITUALOFSOULS cd=360)
Define(SEARINGPAIN 5676)
Define(SEEDOFCORRUPTION 27243)
	SpellAddTargetDebuff(SEEDOFCORRUPTION SEEDOFCORRUPTION=18)
Define(SHADOWBOLT 686)
	SpellAddTargetDebuff(SHADOWBOLT SHADOWEMBRACE=12 SHADOWANDFLAMEDEBUFF=30)
Define(SHADOWBURN 17877)
	SpellInfo(SHADOWBURN cd=15)
Define(SHADOWFLAME 47897)
	SpellInfo(SHADOWFLAME cd=12 range=10)
Define(SOULFIRE 6353)
	SpellAddBuff(SOULFIRE IMPROVEDSOULFIREBUFF=15 SOULBURN=0)
Define(SOULBURN 74434)
	SpellInfo(SOULBURN cd=45)
	SpellAddBuff(SOULBURN SOULBURN=15)
Define(SOULHARVEST 79268)
	SpellInfo(SOULHARVEST cd=30 duration=9)
Define(SUMMONINFERNAL 1122)
	SpellInfo(SUMMONINFERNAL cd=600)
Define(SUMMONDOOMGUARD 18540)
	SpellInfo(SUMMONDOOMGUARD cd=600)
Define(SUMMONFELGUARD 30146)
	SpellInfo(SUMMONFELGUARD cd=600) #fake
	SpellAddBuff(SUMMONFELGUARD SOULBURN=0)
Define(SUMMONFELHUNTER 691)
	SpellInfo(SUMMONFELHUNTER cd=600) #fake
	SpellAddBuff(SUMMONFELHUNTER SOULBURN=0)
Define(SUMMONIMP 688)
	SpellInfo(SUMMONIMP cd=600) #fake
	SpellAddBuff(SUMMONIMP SOULBURN=0)
Define(SUMMONSUCCUBUS 712)
	SpellInfo(SUMMONSUCCUBUS cd=600) #fake
	SpellAddBuff(SUMMONSUCCUBUS SOULBURN=0)
Define(UNSTABLEAFFLICTION 30108)
	SpellInfo(UNSTABLEAFFLICTION duration=15)
	SpellAddTargetDebuff(UNSTABLEAFFLICTION UNSTABLEAFFLICTION=15)

# Pet Spells
Define(PETAXETOSS 89766)
	SpellInfo(PETAXETOSS cd=30)
Define(PETFELSTORM 89751)
	SpellInfo(PETFELSTORM cd=45) #lasts 6s
Define(PETLEGIONSTRIKE 30213)
Define(PETPURSUIT 30151)
	SpellInfo(PETPURSUIT cd=15)
Define(PETSINGEMAGIC 89808)
	SpellInfo(PETSINGEMAGIC cd=6)

# Racials & Professions
Define(ARCANETORRENTMANA 28730) # blood elf
	SpellInfo(ARCANETORRENTMANA sharedcd=racial cd=120)
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
Define(HEALTHSTONE 5512)
Define(SOULSTONE 5232)
Define(VOLCANICPOTION 58091)
	Define(VOLCANICPOTIONSPELL 80481)
	Define(VOLCANICPOWER 79476) # +1200 int

AddCheckBox(shadowandflame SpellName(SHADOWANDFLAMESPELL) default)
AddListItem(curse none L(None))
AddListItem(curse elements SpellName(CURSEOFTHEELEMENTS) default)
AddListItem(curse tongues SpellName(CURSEOFTONGUES))
AddListItem(curse weakness SpellName(CURSEOFWEAKNESS))
AddListItem(bane none L(None))
AddListItem(bane agony SpellName(BANEOFAGONY))
AddListItem(bane doom SpellName(BANEOFDOOM) default)
AddListItem(bane havoc SpellName(BANEOFHAVOC) mastery=3)

AddCheckBox(potions SpellName(VOLCANICPOTIONSPELL) default)
AddCheckBox(lightweave SpellName(LIGHTWEAVE))
AddCheckBox(powertorrent SpellName(POWERTORRENT))

# Commonly available trinkets with proc effects.
AddCheckBox(trinketdmcv "DMC: Volcano")
AddCheckBox(trinketfoul "Foul Gift of the Demon Lord" mastery=2)
AddCheckBox(trinketiotcm "Insignia of the Corrupted Mind")
AddCheckBox(trinketwou "Will of Unbinding")

# Special mastery trinket for Demonology.
AddCheckBox(trinketmwc "Moonwell Chalice")

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
	Spell(BERSERKING)
	Spell(BLOODFURY)
}

AddFunction EnoughBuffsForDoomguard
{
	# "enough buffs" means:
	#	- at least 2 stacks from Will of Unbinding at the start of the fight, or 8 stacks later.
	#	- at least two proc effects
	#	- potion
	#	- at least one on-use trinket effect (either ready to use, or buff already present)
	#
	{CheckBoxOff(trinketwou) or {TimeInCombat(less 10) and BuffPresent(COMBATMIND stacks=2)} or BuffPresent(COMBATMIND stacks=8)}
	and {{{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}}
		or {{CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)} and {CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)}}
		or {{CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)} and {CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}}
		or {{CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)} and {CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)}
			and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)}
			and CheckBoxOff(lightweave) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)}
			and CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(trinketfoul) and BuffPresent(FOULGIFT)}
			and CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}
			and CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul)}
		or {CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}}
	and {CheckBoxOff(potions) or {ItemCount(VOLCANICPOTION more 0) and Item(VOLCANICPOTION)} or BuffPresent(VOLCANICPOWER)}
	and {{List(trinketcd0 000s) and List(trinketcd1 000s)}
		or {{List(trinketcd0 060s) or List(trinketcd0 090s) or List(trinketcd0 120s)}
			and {Item(Trinket0Slot)	or {BuffPresent(SPELLPOWERTRINKETBUFF) or BuffPresent(HASTETRINKETBUFF)}}}
		or {{List(trinketcd1 060s) or List(trinketcd1 090s) or List(trinketcd1 120s)}
			and {Item(Trinket1Slot)	or {BuffPresent(SPELLPOWERTRINKETBUFF) or BuffPresent(HASTETRINKETBUFF)}}}}
}

# Soulstones, Healthstones & Dark Intent.
AddIcon help=buff size=small
{
	if InCombat(no)
	{
		if ItemCount(SOULSTONE less 1) and SoulShards(more 0) Spell(CREATESOULSTONE)
		if ItemCount(HEALTHSTONE less 1) Spell(CREATEHEALTHSTONE)
		if BuffExpires(DARKINTENTBUFF 400) and TargetBuffExpires(DARKINTENTTARGETBUFF) Spell(DARKINTENT)
		if ManaPercent(less 90) Spell(LIFETAP)
		if SoulShards(less 3) Spell(SOULHARVEST)
	}

	#/dark_intent
	if BuffExpires(DARKINTENTBUFF) and TargetBuffExpires(DARKINTENTTARGETBUFF) Spell(DARKINTENT)
}

###
### Affliction
###

# Pet & one-target-only debuffs.
AddIcon help=buff size=small mastery=1
{
	if PetPresent(no)
	{
		#/summon_felhunter
		if Glyph(GLYPHOFLASHOFPAIN) Spell(SUMMONSUCCUBUS)
		if Glyph(GLYPHOFIMP) Spell(SUMMONIMP)
		Spell(SUMMONFELHUNTER)
		if Level(less 30) Spell(SUMMONIMP)
	}

	# Maintain raid buffs and debuffs.
	if TargetDeadIn(more 8)
	{
		if List(curse elements)	and TargetDebuffExpires(magicaldamagetaken 2) and TargetDebuffExpires(JINXELEMENTSDEBUFF) Spell(CURSEOFTHEELEMENTS)
		if List(curse tongues) and TargetDebuffExpires(castslow 2) Spell(CURSEOFTONGUES)
		if List(curse weakness) and TargetDebuffExpires(lowerphysicaldamage 2) Spell(CURSEOFWEAKNESS)
	}

	unless {TargetDeadIn(more 8) and CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5)}
		or {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		unless {TargetDebuffExpires(CORRUPTIONDEBUFF 3 mine=1 haste=spell) and TargetDebuffExpires(SEEDOFCORRUPTION mine=1)}
			or {TargetDebuffExpires(UNSTABLEAFFLICTION 4.5 mine=1 haste=spell) and TargetDeadIn(more 5)}
		{
			#/bane_of_doom,if=target.time_to_die>15&!ticking&miss_react
			unless TargetDebuffPresent(BANEOFDOOM mine=1) or TargetDebuffPresent(BANEOFAGONY mine=1)
			{
				if List(bane doom) and TargetDeadIn(more 15) Spell(BANEOFDOOM)
				if List(bane agony) and TargetDeadIn(more 10) Spell(BANEOFAGONY)
			}
		}
	}
}

# Main rotation.
AddIcon help=main mastery=1
{
	if InCombat(no)
	{
		if BuffExpires(DEMONARMOR 400) and BuffExpires(FELARMOR 400)
		{
			Spell(FELARMOR)
			Spell(DEMONARMOR)
		}
	}

	# Maintain raid buffs and debuffs.
	if TargetDeadIn(more 8) and CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5) Spell(SHADOWBOLT)

	#/fel_armor
	unless BuffPresent(DEMONARMOR) or BuffPresent(FELARMOR)
	{
		Spell(FELARMOR)
		Spell(DEMONARMOR)
	}
	#/corruption,if=(!ticking|remains<tick_time)&miss_react
	if TargetDebuffExpires(CORRUPTIONDEBUFF 3 mine=1 haste=spell)
		unless TargetDebuffPresent(SEEDOFCORRUPTION mine=1) Spell(CORRUPTION)
	#/unstable_affliction,if=(!ticking|remains<(cast_time+tick_time))&target.time_to_die>=5&miss_react
	if TargetDebuffExpires(UNSTABLEAFFLICTION 4.5 mine=1 haste=spell) and TargetDeadIn(more 5) Spell(UNSTABLEAFFLICTION)
	#/haunt
	Spell(HAUNT)
	#/fel_flame,if=buff.tier11_4pc_caster.react&dot.unstable_affliction.remains<8
	if BuffPresent(FELSPARK) and TargetDebuffExpires(UNSTABLEAFFLICTION 8 mine=1) Spell(FELFLAME)
	if TalentPoints(SOULSIPHONTALENT more 0)
	{
		#/drain_soul,interrupt=1,if=target.health_pct<=25,\
		#	interrupt_if=buff.will_of_unbinding.up&cooldown.haunt.remains<tick_time&\
		#		buff.will_of_unbinding.remains<action.haunt.cast_time+tick_time+0.5
		if TargetLifePercent(less 25)
		{
			if Casting(DRAINSOUL) and BuffPresent(COMBATMIND) and BuffExpires(COMBATMIND 5 haste=spell)
			{
				# Display a stopwatch texture to indicate we should stop channeling Drain Soul
				# so that stacks of the Will of Unbinding buff don't fall off.
				Texture(Spell_nature_timestop)
			}
			Spell(DRAINSOUL)
		}
	}
	#/shadowflame
	if TargetDistance(less 8) Spell(SHADOWFLAME)
	#/soul_fire,if=buff.soulburn.up
	if ArmorSetParts(T13 more 3) and BuffPresent(SOULBURN) Spell(SOULFIRE)
	if TalentPoints(BANETALENT more 2)
	{
		#/life_tap,mana_percentage<=35
		if ManaPercent(less 35) Spell(LIFETAP)
		if ArmorSetParts(T13 less 4)
		{
			#/soul_fire,if=buff.soulburn.up
			if BuffPresent(SOULBURN) Spell(SOULFIRE)
		}
		#/shadow_bolt
		Spell(SHADOWBOLT)
	}
	if TalentPoints(BANETALENT less 3)
	{
		#/shadow_bolt,if=buff.shadow_trance.react
		if BuffPresent(SHADOWTRANCE) Spell(SHADOWBOLT)
		#/life_tap,mana_percentage<=5
		if ManaPercent(less 5) Spell(LIFETAP)
		#/drain_life
		Spell(DRAINLIFE)
	}
	#/life_tap,if=mana_pct_nonproc<100
	if ManaPercent(less 95) Spell(LIFETAP)
}

# Soulburn Actions.
AddIcon help=offgcd mastery=1
{
	unless {TargetDeadIn(more 8)
		and {{List(curse elements) and TargetDebuffExpires(magicaldamagetaken 2) and TargetDebuffExpires(JINXELEMENTSDEBUFF)}
			or {List(curse tongues) and TargetDebuffExpires(castslow 2)}
			or {List(curse weakness) and TargetDebuffExpires(lowerphysicaldamage 2)}
			or {CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5)}}}
		or {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		#/soulburn
		if ArmorSetParts(T13 more 3) and SoulShards(more 0) Spell(SOULBURN)
		unless {TargetDebuffExpires(CORRUPTIONDEBUFF 3 mine=1 haste=spell) and TargetDebuffExpires(SEEDOFCORRUPTION mine=1)}
			or {TargetDebuffExpires(UNSTABLEAFFLICTION 4.5 mine=1 haste=spell) and TargetDeadIn(more 5)}
			or {TargetDebuffExpires(BANEOFDOOM mine=1) and TargetDebuffExpires(BANEOFAGONY mine=1)
				and {{List(bane doom) and TargetDeadIn(more 15)} or {List(bane agony) and TargetDeadIn(more 10)}}}
			or 0s before Spell(HAUNT)
			or {BuffPresent(FELSPARK) and TargetDebuffExpires(UNSTABLEAFFLICTION 8 mine=1)}
			or {TalentPoints(SOULSIPHONTALENT more 0) and TargetLifePercent(less 25)}
			or {TargetDistance(less 8) and Spell(SHADOWFLAME)}
		{
			#/soul_fire,if=buff.soulburn.up
			if ArmorSetParts(T13 more 3) and SoulShards(more 0) and 0s before Spell(SOULBURN) Spell(SOULFIRE)
			if TalentPoints(BANETALENT more 2)
			{
				unless ManaPercent(less 35)
				{
					if ArmorSetParts(T13 less 4)
					{
						#/soulburn,if=buff.demon_soul_succubus.down
						#/soulburn,if=buff.demon_soul_felhunter.down
						#/soul_fire,if=buff.soulburn.up
						unless BuffPresent(DEMONSOULSUCCUBUS) or BuffPresent(DEMONSOULFELHUNTER)
							if SoulShards(more 0) and 0s before Spell(SOULBURN) Spell(SOULFIRE)
					}
				}
			}
			if TalentPoints(BANETALENT less 3)
			{
				unless BuffPresent(SHADOWTRANCE) or ManaPercent(less 5)
				{
					#/soulburn
					if SoulShards(more 0) Spell(SOULBURN)
				}
			}
		}
	}
}

# Long CDs.
AddIcon help=cd mastery=1
{
	unless {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		#/volcanic_potion,if=!in_combat
		if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(VOLCANICPOTION)
		#/use_item
		UseItemActions()
		#init_use_profession_actions()
		UseProfessionActions()
		#init_use_racial_actions()
		UseRacialActions()
		#/volcanic_potion,if=buff.bloodlust.react|target.health_pct<=20
		if CheckBoxOn(potions) and TargetClassification(worldboss)
			if BuffPresent(heroism) or TargetLifePercent(less 20) Item(VOLCANICPOTION)
		#/demon_soul
		unless PetPresent(no) or pet.CreatureFamily(PETSUCCUBUS) Spell(DEMONSOUL)
		unless {TargetDebuffExpires(CORRUPTIONDEBUFF 3 mine=1 haste=spell) and TargetDebuffExpires(SEEDOFCORRUPTION mine=1)}
			or {TargetDebuffExpires(UNSTABLEAFFLICTION 4.5 mine=1 haste=spell) and TargetDeadIn(more 5)}
			or {TargetDebuffExpires(BANEOFDOOM mine=1) and TargetDebuffExpires(BANEOFAGONY mine=1)
				and {{List(bane doom) and TargetDeadIn(more 15)} or {List(bane agony) and TargetDeadIn(more 10)}}}
			or 0s before Spell(HAUNT)
			or {BuffPresent(FELSPARK) and TargetDebuffExpires(UNSTABLEAFFLICTION 8 mine=1)}
			or {TalentPoints(SOULSIPHONTALENT more 0) and TargetLifePercent(less 25)}
		{
			if TalentPoints(BANETALENT more 2)
			{
				unless ManaPercent(less 35)
				{
					#/demon_soul
					if PetPresent() and pet.CreatureFamily(PETSUCCUBUS) Spell(DEMONSOUL)
				}
			}
			if TalentPoints(BANETALENT less 3)
			{
				#/demon_soul,if=buff.shadow_trance.react
				if PetPresent() and pet.CreatureFamily(PETSUCCUBUS) and BuffPresent(SHADOWTRANCE) Spell(DEMONSOUL)
			}
		}
	}
}

# Summon Doomguard.
AddIcon help=cd mastery=1
{
	#/summon_doomguard,if=time>10
	if EnoughBuffsForDoomguard() Spell(SUMMONDOOMGUARD)
}

###
### Demonology
###

# Demonology tries to line up trinket usage with Metamorphosis.
AddFunction UseItemActionsDemonology
{
	if TalentPoints(METAMORPHOSISTALENT less 1) or Spell(METAMORPHOSIS)
	{
		Item(HandsSlot usable=1)
		unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
		unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
	}
	if TalentPoints(METAMORPHOSISTALENT more 0)
	{
		unless 60s before Spell(METAMORPHOSIS)
		{
			Item(HandsSlot usable=1)
			if List(trinketcd0 060s) Item(Trinket0Slot usable=1)
			if List(trinketcd1 060s) Item(Trinket1Slot usable=1)
		}
		unless 90s before Spell(METAMORPHOSIS)
		{
			if List(trinketcd0 090s) Item(Trinket0Slot usable=1)
			if List(trinketcd1 090s) Item(Trinket1Slot usable=1)
		}
		unless 120s before Spell(METAMORPHOSIS)
		{
			if List(trinketcd0 120s) Item(Trinket0Slot usable=1)
			if List(trinketcd1 120s) Item(Trinket1Slot usable=1)
		}
	}
}

AddFunction EnoughBuffsForDoomguardDemonology
{
	# "enough buffs" means:
	#	- at least 2 stacks from Will of Unbinding at the start of the fight, or 8 stacks later.
	#	- at least two proc effects
	#	- potion
	#	- at least one on-use trinket effect (either ready to use, or buff already present)
	#
	{CheckBoxOff(trinketwou) or {TimeInCombat(less 10) and BuffPresent(COMBATMIND stacks=2)} or BuffPresent(COMBATMIND stacks=8)}
	and {{{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(trinketfoul) and BuffPresent(FOULGIFT)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}}
		or {{CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)} and {CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)}}
		or {{CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)} and {CheckBoxOn(trinketfoul) and BuffPresent(FOULGIFT)}}
		or {{CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)} and {CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}}
		or {{CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)} and {CheckBoxOn(trinketfoul) and BuffPresent(FOULGIFT)}}
		or {{CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)} and {CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}}
		or {{CheckBoxOn(trinketfoul) and BuffPresent(FOULGIFT)} and {CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)}
			and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)}
			and CheckBoxOff(lightweave) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(trinketdmcv) and BuffPresent(VOLCANICDESTRUCTION)}
			and CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(trinketfoul) and BuffPresent(FOULGIFT)}
			and CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketiotcm)}
		or {{CheckBoxOn(trinketiotcm) and BuffPresent(VELOCITY)}
			and CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul)}
		or {CheckBoxOff(lightweave) and CheckBoxOff(powertorrent) and CheckBoxOff(trinketdmcv) and CheckBoxOff(trinketfoul) and CheckBoxOff(trinketiotcm)}}
	and {CheckBoxOff(potions) or {ItemCount(VOLCANICPOTION more 0) and Item(VOLCANICPOTION)} or BuffPresent(VOLCANICPOWER)}
	and {{List(trinketcd0 000s) and List(trinketcd1 000s)}
		or {{List(trinketcd0 060s) or List(trinketcd0 090s) or List(trinketcd0 120s)}
			and {Item(Trinket0Slot)	or {BuffPresent(SPELLPOWERTRINKETBUFF) or BuffPresent(HASTETRINKETBUFF) or BuffPresent(MASTERYTRINKETBUFF)}}}
		or {{List(trinketcd1 060s) or List(trinketcd1 090s) or List(trinketcd1 120s)}
			and {Item(Trinket1Slot)	or {BuffPresent(SPELLPOWERTRINKETBUFF) or BuffPresent(HASTETRINKETBUFF) or BuffPresent(MASTERYTRINKETBUFF)}}}}
}

# Pet & one-target-only debuffs.
AddIcon help=buff size=small mastery=2
{
	if InCombat(no)
		unless pet.CreatureFamily(PETFELGUARD) Spell(SUMMONFELGUARD)

	if CheckBoxOn(trinketmwc)
	{
		#/summon_felguard,if=cooldown.demon_soul.remains<5&cooldown.metamorphosis.remains<5&!pet.felguard.active
		unless pet.CreatureFamily(PETFELGUARD)
		{
			if 5s before Spell(DEMONSOUL)
				and {TalentPoints(METAMORPHOSISTALENT less 1) or 5s before Spell(METAMORPHOSIS)}
			{
				Spell(SUMMONFELGUARD)
			}
		}
	}

	# Maintain raid buffs and debuffs.
	if TargetDeadIn(more 8)
	{
		if List(curse elements)	and TargetDebuffExpires(magicaldamagetaken 2) and TargetDebuffExpires(JINXELEMENTSDEBUFF) Spell(CURSEOFTHEELEMENTS)
		if List(curse tongues) and TargetDebuffExpires(castslow 2) Spell(CURSEOFTONGUES)
		if List(curse weakness) and TargetDebuffExpires(lowerphysicaldamage 2) Spell(CURSEOFWEAKNESS)
	}

	unless {TargetDeadIn(more 8) and CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5)}
		or {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		#/bane_of_doom,if=!ticking&time<10
		if TimeInCombat(less 10) and TargetDebuffExpires(BANEOFDOOM mine=1) and TargetDebuffExpires(BANEOFAGONY mine=1)
		{
			if List(bane doom) and TargetDeadIn(more 15) Spell(BANEOFDOOM)
			if List(bane agony) and TargetDeadIn(more 10) Spell(BANEOFAGONY)
		}
		#/felguard:felstorm
		if pet.CreatureFamily(PETFELGUARD) and TargetInRange(PETLEGIONSTRIKE yes) Spell(PETFELSTORM)
		#/soulburn,if=pet.felguard.active&!pet.felguard.dot.felstorm.ticking
		#/summon_felhunter,if=!pet.felguard.dot.felstorm.ticking&pet.felguard.active
		if pet.CreatureFamily(PETFELGUARD) and 39s before Spell(PETFELSTORM) Spell(SUMMONFELHUNTER)
		#/bane_of_doom,if=(!ticking|(buff.metamorphosis.up&remains<45))&target.time_to_die>=15&miss_react
		if TargetDebuffExpires(BANEOFDOOM mine=1) and TargetDebuffExpires(BANEOFAGONY mine=1)
		{
			if List(bane doom) and TargetDeadIn(more 15) Spell(BANEOFDOOM)
			if List(bane agony) and TargetDeadIn(more 10) Spell(BANEOFAGONY)
		}
		if TargetDebuffExpires(BANEOFDOOM 44 mine=1) and BuffPresent(METAMORPHOSIS)
		{
			if List(bane doom) and TargetDeadIn(more 15) Spell(BANEOFDOOM)
		}
	}
}

# Main rotation.
AddIcon help=main mastery=2
{
	if InCombat(no)
	{
		if BuffExpires(DEMONARMOR 400) and BuffExpires(FELARMOR 400)
		{
			Spell(FELARMOR)
			Spell(DEMONARMOR)
		}
	}

	# Maintain raid buffs and debuffs.
	if TargetDeadIn(more 8) and CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5)
	{
		if TalentPoints(BANETALENT more 0) Spell(SHADOWBOLT)
		if TalentPoints(BANETALENT less 1) Spell(INCINERATE)
	}

	#/fel_armor
	unless BuffPresent(DEMONARMOR) or BuffPresent(FELARMOR)
	{
		Spell(FELARMOR)
		Spell(DEMONARMOR)
	}
	if ArmorSetParts(T13 more 3) and pet.CreatureFamily(PETFELHUNTER)
	{
		if CheckBoxOn(trinketmwc)
		{
			#/soul_fire,if=pet.felhunter.active&buff.soulburn.up&cooldown.metamorphosis.remains>60
			unless TalentPoints(METAMORPHOSISTALENT more 0) and 60s before Spell(METAMORPHOSIS)
				if BuffPresent(SOULBURN) Spell(SOULFIRE)
		}
		if CheckBoxOff(trinketmwc)
		{
			#/soul_fire,if=pet.felhunter.active&buff.soulburn.up
			if BuffPresent(SOULBURN) Spell(SOULFIRE)
		}
	}
	#/immolate,if=!ticking&target.time_to_die>=4&miss_react
	if TargetDebuffExpires(IMMOLATE mine=1) and TargetDeadIn(more 5) Spell(IMMOLATE)
	#/corruption,if=(remains<tick_time|!ticking)&target.time_to_die>=6&miss_react
	if TargetDebuffExpires(CORRUPTIONDEBUFF 3 mine=1 haste=spell) and TargetDeadIn(more 6)
		unless TargetDebuffPresent(SEEDOFCORRUPTION mine=1) Spell(CORRUPTION)
	#/fel_flame,if=buff.tier11_4pc_caster.react
	if BuffPresent(FELSPARK) Spell(FELFLAME)
	#/shadowflame
	if TargetDistance(less 8) Spell(SHADOWFLAME)
	#/hand_of_guldan
	Spell(HANDOFGULDAN)
	#/immolation_aura,if=buff.metamorphosis.remains>10
    if TargetDistance(less 8) and BuffPresent(METAMORPHOSIS 10) Spell(IMMOLATIONAURA)
	#/shadow_bolt,if=buff.shadow_trance.react
	if BuffPresent(SHADOWTRANCE) Spell(SHADOWBOLT)
	#/incinerate,if=buff.molten_core.react
	if BuffPresent(MOLTENCORE) Spell(INCINERATE)
	#/soul_fire,if=buff.decimation.up
	if BuffPresent(DECIMATION) Spell(SOULFIRE)
	#/life_tap,if=mana_pct<=30&buff.bloodlust.down&buff.metamorphosis.down&buff.demon_soul_felguard.down
	if ManaPercent(less 30) and BuffExpires(heroism) and BuffExpires(METAMORPHOSIS) and BuffExpires(DEMONSOULFELGUARD) Spell(LIFETAP)
	if TalentPoints(BANETALENT more 0)
	{
		#/shadow_bolt
		Spell(SHADOWBOLT)
	}
	if TalentPoints(BANETALENT less 1)
	{
		#/incinerate
		Spell(INCINERATE)
	}
	#/life_tap,if=mana_pct_nonproc<100
	if ManaPercent(less 95) Spell(LIFETAP)
}

# Soulburn Actions.
AddIcon help=main mastery=2
{
	unless {TargetDeadIn(more 8)
		and {{List(curse elements) and TargetDebuffExpires(magicaldamagetaken 2) and TargetDebuffExpires(JINXELEMENTSDEBUFF)}
			or {List(curse tongues) and TargetDebuffExpires(castslow 2)}
			or {List(curse weakness) and TargetDebuffExpires(lowerphysicaldamage 2)}
			or {CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5)}}}
		or {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
		or {TimeInCombat(less 10) and TargetDebuffExpires(BANEOFDOOM mine=1) and TargetDebuffExpires(BANEOFAGONY mine=1)
			and {{List(bane doom) and TargetDeadIn(more 15)} or {List(bane agony) and TargetDeadIn(more 10)}}}
	{
		#/soulburn,if=pet.felguard.active&!pet.felguard.dot.felstorm.ticking
		#/summon_felhunter,if=!pet.felguard.dot.felstorm.ticking&pet.felguard.active
		if pet.CreatureFamily(PETFELGUARD) and 39s before Spell(PETFELSTORM)
			if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SUMMONFELHUNTER)
		if ArmorSetParts(T13 more 3) and pet.CreatureFamily(PETFELHUNTER)
		{
			if CheckBoxOn(trinketmwc)
			{
				#/soulburn,if=pet.felhunter.active&cooldown.metamorphosis.remains>60
				#/soul_fire,if=pet.felhunter.active&buff.soulburn.up&cooldown.metamorphosis.remains>60
				unless TalentPoints(METAMORPHOSISTALENT more 0) and 60s before Spell(METAMORPHOSIS)
					if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SOULFIRE)
			}
			if CheckBoxOff(trinketmwc)
			{
				#/soulburn,if=pet.felhunter.active
				#/soul_fire,if=pet.felhunter.active&buff.soulburn.up
				if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SOULFIRE)
			}
		}
	}
}

# Long CDs.
AddIcon help=cd mastery=2
{
	unless {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		#/volcanic_potion,if=!in_combat
		if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(VOLCANICPOTION)
		#/use_item
		UseItemActionsDemonology()
		#init_use_profession_actions()
		UseProfessionActions()
		#init_use_racial_actions()
		UseRacialActions()
		#/volcanic_potion,if=buff.metamorphosis.up
		if CheckBoxOn(potions) and TargetClassification(worldboss) and BuffPresent(METAMORPHOSIS) Spell(VOLCANICPOTION)
		if CheckBoxOn(trinketmwc)
		{
			#/metamorphosis,if=buff.moonwell_chalice.up&pet.felguard.active
			if BuffPresent(MASTERYTRINKETBUFF) and pet.CreatureFamily(PETFELGUARD) Spell(METAMORPHOSIS)
			#/demon_soul,if=buff.metamorphosis.up
			if PetPresent() and BuffPresent(METAMORPHOSIS) Spell(DEMONSOUL)
		}
		if CheckBoxOff(trinketmwc)
		{
			#/metamorphosis
			Spell(METAMORPHOSIS)
			#/demon_soul
			if PetPresent() Spell(DEMONSOUL)
		}
	}
}

# Summon Doomguard.
AddIcon help=cd mastery=2
{
	#/summon_doomguard,if=time>10
	if EnoughBuffsForDoomguardDemonology() Spell(SUMMONDOOMGUARD)
}

###
### Destruction
###

# Pet & one-target-only debuffs.
AddIcon help=buff size=small mastery=3
{
	#/summon_imp
	if PetPresent(no) Spell(SUMMONIMP)

	# Maintain raid buffs and debuffs.
	if TargetDeadIn(more 8)
	{
		if List(curse elements)	and TargetDebuffExpires(magicaldamagetaken 2) and TargetDebuffExpires(JINXELEMENTSDEBUFF) Spell(CURSEOFTHEELEMENTS)
		if List(curse tongues) and TargetDebuffExpires(castslow 2) Spell(CURSEOFTONGUES)
		if List(curse weakness) and TargetDebuffExpires(lowerphysicaldamage 2) Spell(CURSEOFWEAKNESS)
	}

	unless {TargetDeadIn(more 8) and CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5)}
		or {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		unless {BuffPresent(FELSPARK) and TargetDebuffExpires(IMMOLATE 8 mine=1)}
			or {TargetDebuffExpires(IMMOLATE 3 mine=1 haste=spell) and TargetDeadIn(more 4)}
			or {TargetDebuffPresent(IMMOLATE mine=1) and Spell(CONFLAGRATE)}
			or {BuffPresent(heroism 32) and 3s before Spell(CONFLAGRATE) and TargetDebuffExpires(IMMOLATE 12 mine=1)}
		{
			#/bane_of_doom,if=!ticking&target.time_to_die>=15&miss_react
			unless TargetDebuffPresent(BANEOFDOOM mine=1) or TargetDebuffPresent(BANEOFAGONY mine=1)
			{
				if List(bane doom) and TargetDeadIn(more 15) Spell(BANEOFDOOM)
				if List(bane agony) and TargetDeadIn(more 10) Spell(BANEOFAGONY)
			}
		}
	}
}

# Main rotation.
AddIcon help=main mastery=3
{
	if InCombat(no)
	{
		if BuffExpires(DEMONARMOR 400) and BuffExpires(FELARMOR 400)
		{
			Spell(FELARMOR)
			Spell(DEMONARMOR)
		}
		if TalentPoints(IMPROVEDSOULFIRETALENT more 0) and BuffExpires(IMPROVEDSOULFIREBUFF 4 haste=spell)
		{
			if ArmorSetParts(T13 more 3)
			{
				#/soul_fire,if=buff.soulburn.up&!in_combat
				if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SOULFIRE)
			}
			Spell(SOULFIRE)
		}
	}

	# Maintain raid buffs and debuffs.
	if TargetDeadIn(more 8) and CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5) Spell(INCINERATE)

	#/fel_armor
	unless BuffPresent(DEMONARMOR) or BuffPresent(FELARMOR)
	{
		Spell(FELARMOR)
		Spell(DEMONARMOR)
	}
	# If combat started without us pre-casting Soul Fire to gain the Improved Soul Fire buff, then cast it now.
	if TalentPoints(IMPROVEDSOULFIRETALENT more 0) and BuffExpires(IMPROVEDSOULFIREBUFF) Spell(SOULFIRE)
	#/fel_flame,if=buff.tier11_4pc_caster.react&dot.immolate.remains<8
	if BuffPresent(FELSPARK) and TargetDebuffExpires(IMMOLATE 8 mine=1) Spell(FELFLAME)
	#/immolate,if=(remains<cast_time+gcd|!ticking)&target.time_to_die>=4&miss_react
    if TargetDebuffExpires(IMMOLATE 3 mine=1 haste=spell) and TargetDeadIn(more 4) Spell(IMMOLATE)
	#/conflagrate
	if TargetDebuffPresent(IMMOLATE mine=1) Spell(CONFLAGRATE)
	#/immolate,if=buff.bloodlust.react&buff.bloodlust.remains>32&cooldown.conflagrate.remains<=3&remains<12
	if BuffPresent(heroism 32) and 3s before Spell(CONFLAGRATE) and TargetDebuffExpires(IMMOLATE 12 mine=1) Spell(IMMOLATE)
	#/corruption,if=(!ticking|dot.corruption.remains<tick_time)&miss_react
	if TargetDebuffExpires(CORRUPTIONDEBUFF 3 mine=1 haste=spell)
		unless TargetDebuffPresent(SEEDOFCORRUPTION mine=1) Spell(CORRUPTION)
	#/shadowflame
	if TargetDistance(less 8) Spell(SHADOWFLAME)
	#/chaos_bolt,if=cast_time>0.9
	if CastTime(CHAOSBOLT more 0.9) Spell(CHAOSBOLT)
	if TalentPoints(IMPROVEDSOULFIRETALENT more 0)
	{
		#/soul_fire,if=((buff.empowered_imp.react&buff.empowered_imp.remains<(buff.improved_soul_fire.remains+action.soul_fire.travel_time))|\
		#	buff.improved_soul_fire.remains<(cast_time+travel_time+action.incinerate.cast_time+gcd))&!in_flight
		# Assume the travel time of Soul Fire is 1s.
		if BuffPresent(EMPOWEREDIMP) and {buffExpires(EMPOWEREDIMP) < buffExpires(IMPROVEDSOULFIREBUFF) + 1} Spell(SOULFIRE)
		if BuffExpires(IMPROVEDSOULFIREBUFF 7.5 haste=spell) Spell(SOULFIRE)
	}
	#/shadowburn
	if TargetLifePercent(less 20) Spell(SHADOWBURN)
	#/incinerate
	Spell(INCINERATE)
	#/shadow_bolt
	Spell(SHADOWBOLT)
	#/life_tap,if=mana_pct_nonproc<100
	if ManaPercent(less 95) Spell(LIFETAP)
}

# Soulburn Actions.
AddIcon help=offgcd mastery=3
{
	if InCombat(no)
	{
		unless BuffExpires(DEMONARMOR 400) and BuffExpires(FELARMOR 400)
		{
			if ArmorSetParts(T13 more 3)
			{
				#/soulburn
				#/soul_fire,if=buff.soulburn.up&!in_combat
				if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SOULFIRE)
			}
			unless ArmorSetParts(T13 more 3)
			{
				#/soulburn,if=buff.bloodlust.down
				#/soul_fire,if=buff.soulburn.up&!in_combat
				unless BuffPresent(heroism)
					if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SOULFIRE)
			}
		}
	}
	unless {TargetDeadIn(more 8)
		and {{List(curse elements) and TargetDebuffExpires(magicaldamagetaken 2) and TargetDebuffExpires(JINXELEMENTSDEBUFF)}
			or {List(curse tongues) and TargetDebuffExpires(castslow 2)}
			or {List(curse weakness) and TargetDebuffExpires(lowerphysicaldamage 2)}
			or {CheckBoxOn(shadowandflame) and TargetDebuffExpires(magicalcrittaken 5)}}}
		or {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		# If combat started without us pre-casting Soul Fire to gain the Improved Soul Fire buff, then cast it now.
		if TalentPoints(IMPROVEDSOULFIRETALENT more 0) and BuffExpires(IMPROVEDSOULFIREBUFF)
			if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SOULFIRE)
		if ArmorSetParts(T13 more 3)
		{
			#/soulburn
			if SoulShards(more 0) Spell(SOULBURN)
		}
		unless {BuffPresent(FELSPARK) and TargetDebuffExpires(IMMOLATE 8 mine=1)}
			or {TargetDebuffExpires(IMMOLATE 3 mine=1 haste=spell) and TargetDeadIn(more 4)}
			or {TargetDebuffPresent(IMMOLATE mine=1) and Spell(CONFLAGRATE)}
			or {BuffPresent(heroism 32) and 3s before Spell(CONFLAGRATE) and TargetDebuffExpires(IMMOLATE 12 mine=1)}
			or {TargetDebuffExpires(BANEOFDOOM mine=1) and TargetDebuffExpires(BANEOFAGONY mine=1)
				and {{List(bane doom) and TargetDeadIn(more 15)} or {List(bane agony) and TargetDeadIn(more 10)}}}
			or {TargetDebuffExpires(CORRUPTIONDEBUFF 3 mine=1 haste=spell) and TargetDebuffExpires(SEEDOFCORRUPTION mine=1)}
			or {TargetDistance(less 8) and Spell(SHADOWFLAME)}
			or {CastTime(CHAOSBOLT more 0.9) and Spell(CHAOSBOLT)}
		{
			if ArmorSetParts(T13 more 3)
			{
				#/soul_fire,if=buff.soulburn.up
				if {SoulShards(more 0) and 0s before Spell(SOULBURN)} or BuffPresent(SOULBURN) Spell(SOULFIRE)
			}
		}
	}
}

# Long CDs.
AddIcon help=main mastery=3
{
	unless {BuffExpires(DEMONARMOR) and BuffExpires(FELARMOR)}
	{
		#/volcanic_potion,if=!in_combat
		if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(VOLCANICPOTION)
		#/use_item
		UseItemActions()
		#init_use_profession_actions()
		UseProfessionActions()
		#init_use_racial_actions()
		UseRacialActions()
		#/volcanic_potion,if=buff.bloodlust.react|target.health_pct<=20
		if CheckBoxOn(potions) and TargetClassification(worldboss)
			if BuffPresent(heroism) or TargetLifePercent(less 20) Item(VOLCANICPOTION)
		#/demon_soul
		unless PetPresent(no) or pet.CreatureFamily(PETSUCCUBUS) Spell(DEMONSOUL)
	}
}

# Summon Doomguard.
AddIcon help=cd mastery=3
{
	#/summon_doomguard,if=time>10
	if EnoughBuffsForDoomguard() Spell(SUMMONDOOMGUARD)
}
]]