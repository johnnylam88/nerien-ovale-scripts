NerienOvaleScripts.script["MAGE"] =
[[
# Nerien's Mage Ovale script based on SimulationCraft.
#
# Arcane:
#	talents=http://www.wowhead.com/talent#mage-3033220212301002121212300200000000000000000300000000000000000
#	glyphs=arcane_blast/arcane_missiles/mage_armor/arcane_power/evocation/slow/arcane_brilliance/conjuring/mirror_image
#
# Fire:
#	talents=http://www.wowhead.com/talent#mage-3030100000000000000002313302201201210130310300000000000000000
#	glyphs=fireball/pyroblast/molten_armor/evocation/dragons_breath/mana_shield/conjuring/arcane_brilliance/slow_fall
#
# Frost:
#	talents=http://www.wowhead.com/talent#mage-0020000000000000000002303000000000000000002323021013331301021
#	glyphs=frostbolt/frostfire/deep_freeze/evocation/ice_barrier/blink/arcane_brilliance/conjuring/slow_fall

# Buffs
Define(ARCANEBLASTDEBUFF 36032)
Define(ARCANEMISSILEBUFF 79683)
Define(BRAINFREEZE 57761)
Define(CLEARCASTING 12536)
Define(FINGERSOFFROST 44544)
	SpellInfo(FINGERSOFFROST duration=14)
Define(HOTSTREAK 48108)
Define(IMPROVEDMANAGEM 83098)
SpellList(MAGEBUFF 79038 79058) # Dalaran Brilliance, Arcane Brilliance
Define(PRESENCEOFMIND 12043)
Define(STOLENTIME 105785) # 2pT13 buff stacks up to 10 times

# Intellect buffs (short-term)
SpellList(INTELLECTBUFF 74241 75170 79476 89091 95875 97007)

# Debuffs
Define(COMBUSTIONDEBUFF 83853)
Define(CRITICALMASS 22959)
Define(IGNITE 12654)

# Glyphs
Define(GLYPHOFFROSTBOLT 56370)
Define(GLYPHOFFROSTFIRE 61205)

# Talents
Define(ARCANEPOWERTALENT 9186)
Define(COLDSNAPTALENT 9870)
Define(CRITICALMASSTALENT 10541)
Define(DEEPFREEZETALENT 9898)
Define(FIRESTARTERTALENT 11431)
Define(ICEFLOESTALENT 9846)
Define(ICYVEINSTALENT 9858)
Define(IMPROVEDSCORCHTALENT 10547)
Define(PRESENCEOFMINDTALENT 9174)

# Spells
Define(ARCANEBARRAGE 44425)
	SpellInfo(ARCANEBARRAGE cd=4)
	SpellAddDebuff(ARCANEBARRAGE ARCANEBLASTDEBUFF=0)
Define(ARCANEBLAST 30451)
	SpellAddDebuff(ARCANEBLAST ARCANEBLASTDEBUFF=10)
Define(ARCANEBRILLIANCE 1459)
Define(ARCANEMISSILES 5143)
	SpellAddDebuff(ARCANEMISSILES ARCANEBLASTDEBUFF=0 ARCANEMISSILEBUFF=0)
Define(ARCANEPOWER 12042)
	SpellInfo(ARCANEPOWER cd=84)
	SpellAddBuff(ARCANEPOWER ARCANEPOWER=15)
Define(BLINK 1953)
	SpellInfo(BLINK cd=15)
Define(COLDSNAP 11958)
	SpellInfo(COLDSNAP cd=384)
Define(COMBUSTION 11129)
	SpellInfo(COMBUSTION cd=120 duration=10 tick=1)
	SpellAddDebuff(COMBUSTION COMBUSTIONDEBUFF=10)
Define(CONJUREMANAGEM 759)
	SpellInfo(CONJUREMANAGEM cd=10) #fake
Define(COUNTERSPELL 2139)
	SpellInfo(COUNTERSPELL cd=24)
Define(DEEPFREEZE 44572)
	SpellInfo(DEEPFREEZE cd=30)
	SpellAddBuff(DEEPFREEZE FINGERSOFFROST=-1)
Define(EVOCATION 12051)
	SpellInfo(EVOCATION cd=240)
Define(FIREBALL 133)
Define(FIREBLAST 2136)
	SpellInfo(FIREBLAST cd=8)
Define(FLAMEORB 82731)
	SpellInfo(FLAMEORB cd=60)
Define(FROSTARMOR 7302)
	SpellAddBuff(FROSTARMOR FROSTARMOR=1800)
Define(FROSTBOLT 116)
Define(FROSTFIREBOLT 44614)
	SpellAddTargetDebuff(FROSTFIREBOLT FROSTFIREBOLT=9)
	SpellAddBuff(FROSTFIREBOLT BRAINFREEZE=-1 FINGERSOFFROST=-1)
Define(ICELANCE 30455)
	SpellAddBuff(ICELANCE FINGERSOFFROST=-1)
Define(ICYVEINS 12472)
	SpellInfo(ICYVEINS cd=144)
Define(LIVINGBOMB 44457)
	SpellInfo(LIVINGBOMB duration=12 tick=3)
	SpellAddTargetDebuff(LIVINGBOMB LIVINGBOMB=12)
Define(MAGEARMOR 6117)
	SpellAddBuff(MAGEARMOR MAGEARMOR=1800)
Define(MIRRORIMAGE 55342)
	SpellInfo(MIRRORIMAGE cd=180)
Define(MOLTENARMOR 30482)
	SpellAddBuff(MOLTENARMOR MOLTENARMOR=1800)
Define(PYROBLAST 11366)
	SpellInfo(PYROBLAST duration=12 tick=3)
	SpellAddTargetDebuff(PYROBLAST PYROBLAST=12)
	SpellAddBuff(PYROBLAST HOTSTREAK=0)
Define(PYROBLASTBANG 92315)
	SpellInfo(PYROBLASTBANG duration=12 tick=3)
	SpellAddTargetDebuff(PYROBLASTBANG PYROBLASTBANG=12)
	SpellAddBuff(PYROBLASTBANG HOTSTREAK=0)
Define(SCORCH 2948)
	SpellInfo(SCORCH duration=30 talent=CRITICALMASSTALENT)
Define(SPELLSTEAL 30449)
Define(SUMMONWATERELEMENTAL 31687)
	SpellInfo(SUMMONWATERELEMENTAL cd=180)

Define(PETFREEZE 33395)
	SpellInfo(PETFREEZE cd=25)
	SpellAddBuff(PETFREEZE FINGERSOFFROST=2)

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
Define(MANAGEMITEM 36799)
Define(VOLCANICPOTION 58091)
	Define(VOLCANICPOTIONSPELL 80481)

AddCheckBox(potions SpellName(VOLCANICPOTIONSPELL) default)
AddCheckBox(mirrorimage SpellName(MIRRORIMAGE) default)
AddCheckBox(stolentime SpellName(STOLENTIME) mastery=2)

# Arcane Burn Time is the time it takes to go from 100% mana to 35% mana by casting Arcane Blasts.
AddListItem(arcaneburntime 15s "Arcane Burn Time: 15s" mastery=1)
AddListItem(arcaneburntime 20s "Arcane Burn Time: 20s" default mastery=1)
AddListItem(arcaneburntime 25s "Arcane Burn Time: 25s" mastery=1)
AddListItem(arcaneburntime 30s "Arcane Burn Time: 30s" mastery=1)
AddListItem(arcaneburntime 35s "Arcane Burn Time: 35s" mastery=1)
AddListItem(arcaneburntime 40s "Arcane Burn Time: 40s" mastery=1)

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

###
### Arcane
###

AddFunction ManaGemReady
{
	#/mana_gem,if=buff.arcane_blast.stack=4&buff.tier13_2pc.stack>=7&(cooldown.arcane_power.remains<=0|target.time_to_die<=50)
	ItemCount(MANAGEMITEM more 0 charges=1) and 0s before Item(MANAGEMITEM)
		and DebuffPresent(ARCANEBLASTDEBUFF stacks=4)
		and {ArmorSetParts(T13 less 4)
			or {BuffPresent(STOLENTIME stacks=7) and {0s before Spell(ARCANEPOWER) or TargetDeadIn(less 50)}}}
}

# Flame Orb for use during DPM rotation.
AddIcon help=cd size=small mastery=1
{
	#/flame_orb,if=target.time_to_die>=10
	if TargetDeadIn(more 10) Spell(FLAMEORB)
	Spell(BLINK)
}

# Arcane DPM rotation for mana-efficient damage by keeping mana level high to make use of mastery.
AddIcon help=main mastery=1
{
	unless InCombat()
	{
		if ItemCount(MANAGEMITEM less 3 charges=1) Spell(CONJUREMANAGEM)
		if BuffExpires(MAGEBUFF 400) Spell(ARCANEBRILLIANCE)
		if BuffExpires(MAGEARMOR 400) Spell(MAGEARMOR)
	}

	#/arcane_brilliance
	if BuffExpires(MAGEBUFF) Spell(ARCANEBRILLIANCE)
	#/mage_armor
	if BuffExpires(MAGEARMOR) Spell(MAGEARMOR)
	if Speed(more 0)
	{
		#/arcane_barrage,moving=1
		Spell(ARCANEBARRAGE)
		#/fire_blast,moving=1
		Spell(FIREBLAST)
		#/ice_lance,moving=1
		Spell(ICELANCE)
	}
	if TalentPoints(PRESENCEOFMINDTALENT more 0)
	{
		#/arcane_blast,if=buff.presence_of_mind.up
		unless BuffPresent(ARCANEPOWER)
			if 0s before Spell(PRESENCEOFMIND) or BuffPresent(PRESENCEOFMIND) Spell(ARCANEBLAST)
	}
	#/arcane_blast,if=buff.arcane_blast.remains<0.8&buff.arcane_blast.stack=4
	if DebuffExpires(ARCANEBLASTDEBUFF 0.8 stacks=4) Spell(ARCANEBLAST)
	#/arcane_missiles,if=mana_pct_nonproc<92&buff.arcane_missiles.react&mage_armor_timer<=2
	#/arcane_missiles,if=mana_pct_nonproc<93&buff.arcane_missiles.react&mage_armor_timer>2
	if {BuffPresent(INTELLECTBUFF) and ManaPercent(less 88)} or ManaPercent(less 93)
		if BuffPresent(ARCANEMISSILEBUFF) Spell(ARCANEMISSILES)
	#/arcane_barrage,if=mana_pct_nonproc<87&buff.arcane_blast.stack=2
	if {BuffPresent(INTELLECTBUFF) and ManaPercent(less 82)} or ManaPercent(less 87)
	{
		if DebuffPresent(ARCANEBLASTDEBUFF stacks=2)
			unless DebuffPresent(ARCANEBLASTDEBUFF stacks=3) Spell(ARCANEBARRAGE)
	}
	#/arcane_barrage,if=mana_pct_nonproc<90&buff.arcane_blast.stack=3
	if {BuffPresent(INTELLECTBUFF) and ManaPercent(less 85)} or ManaPercent(less 90)
	{
		if DebuffPresent(ARCANEBLASTDEBUFF stacks=3)
			unless DebuffPresent(ARCANEBLASTDEBUFF stacks=4) Spell(ARCANEBARRAGE)
	}
	#/arcane_barrage,if=mana_pct_nonproc<92&buff.arcane_blast.stack=4
	if {BuffPresent(INTELLECTBUFF) and ManaPercent(less 87)} or ManaPercent(less 92)
		if DebuffPresent(ARCANEBLASTDEBUFF stacks=4) Spell(ARCANEBARRAGE)
	#/arcane_blast
	Spell(ARCANEBLAST)
}

AddFunction arcaneBurnMPS
{
	# Implements "burn_mps" from the SimulationCraft profile, which is
	# the rate at which mana is consumed during a burn phase.
	#
	if List(arcaneburntime 15s) { 65 / timeWithHaste(15) }
	if List(arcaneburntime 20s) { 65 / timeWithHaste(20) }
	if List(arcaneburntime 25s) { 65 / timeWithHaste(25) }
	if List(arcaneburntime 30s) { 65 / timeWithHaste(30) }
	if List(arcaneburntime 35s) { 65 / timeWithHaste(35) }
	if List(arcaneburntime 40s) { 65 / timeWithHaste(40) }
}

AddFunction ArcaneBurnPeriodBeforeEvocation
{
	# Returns true if we are "Arcane Burn Time" seconds away before
	# Evocation comes off of cooldown.
	#
	   {List(arcaneburntime 15s) and 15s before Spell(EVOCATION)}
	or {List(arcaneburntime 20s) and 20s before Spell(EVOCATION)}
	or {List(arcaneburntime 25s) and 25s before Spell(EVOCATION)}
	or {List(arcaneburntime 30s) and 30s before Spell(EVOCATION)}
	or {List(arcaneburntime 35s) and 35s before Spell(EVOCATION)}
	or {List(arcaneburntime 40s) and 40s before Spell(EVOCATION)}
}

# Arcane DPS rotation for maximum burst damage.
AddIcon help=main mastery=1
{
	unless BuffExpires(MAGEBUFF) or BuffExpires(MAGEARMOR)
		or Speed(more 0)
	{
		#/choose_rotation,cooldown=1,evocation_pct=35,if=cooldown.evocation.remains+15>target.time_to_die,final_burn_offset=15
		#
		# This condition represents the target dying shortly after (within 15s) or before Evocation can be cast.
		# Implement the guts of sc_mage.cpp:choose_rotation_t::execute().
		#
		if spell(EVOCATION) + 15 > target.timeToDie()
		{
			if ArcaneBurnPeriodBeforeEvocation()
			{
				if spell(EVOCATION) < target.timeToDie()
				{
					# We're going until target percentage.
					if ManaPercent(more 35) Spell(ARCANEBLAST)
				}
				unless spell(EVOCATION) < target.timeToDie()
				{
					# We're going until OOM, stop when we can no longer cast full stack AB (approximately, 4 stack with AP can be 6177)
					if Mana(more 6200) Spell(ARCANEBLAST)
				}
			}
			unless ArcaneBurnPeriodBeforeEvocation()
			{
				# We wish to burn if the target will die before we go OOM.
				if {manaPercent() / arcaneBurnMPS() > target.timeToDie()} Spell(ARCANEBLAST)
			}
		}

		#/choose_rotation,cooldown=1,force_dps=1,if=buff.improved_mana_gem.up&dpm=1&\
		#    cooldown.evocation.remains+15<target.time_to_die
		#/choose_rotation,cooldown=1,force_dpm=1,if=cooldown.evocation.remains<=20&dps=1&mana_pct<22&\
		#    (target.time_to_die>60|burn_mps*((target.time_to_die-5)-cooldown.evocation.remains)>max_mana_nonproc)&\
		#    cooldown.evocation.remains+15<target.time_to_die
		#
		# These conditions represent being able to cast Evocation again before the target is dead.
		# Implement by checking that we're not in conditions that would force choosing the DPM
		# rotation, followed by matching the conditions that would force choosing the DPS rotation.
		#
		unless spell(EVOCATION) + 15 > target.timeToDie()
		{
			unless ArcaneBurnPeriodBeforeEvocation() and ManaPercent(less 22)
				and {TargetDeadIn(more 60) or {arcaneBurnMPS() * {target.timeToDie() - 5 - spell(EVOCATION)} > manaPercent()}}
			{
				if BuffPresent(IMPROVEDMANAGEM) or ManaGemReady() Spell(ARCANEBLAST)
			}
		}

		#/arcane_blast,if=dps=1|target.time_to_die<20|\
		#	((cooldown.evocation.remains<=20|buff.improved_mana_gem.up|cooldown.mana_gem.remains<5)&mana_pct>=22)|\
		#	(buff.arcane_power.up&mana_pct_nonproc>88)
		if TargetDeadIn(less 20) Spell(ARCANEBLAST)
		if ManaPercent(more 22)
		{
			if ArcaneBurnPeriodBeforeEvocation() or BuffPresent(IMPROVEDMANAGEM) or ManaGemReady() or 5s before Item(MANAGEMITEM)
			{
				Spell(ARCANEBLAST)
			}
		}
		if BuffPresent(ARCANEPOWER) and {{BuffPresent(INTELLECTBUFF) and ManaPercent(more 83)} or ManaPercent(more 88)}
		{
			Spell(ARCANEBLAST)
		}
	}
}

AddIcon help=cd mastery=1
{
	#/volcanic_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(VOLCANICPOTION)
	if TargetBuffStealable() Spell(SPELLSTEAL)
	#/counterspell
	if TargetIsInterruptible() Spell(COUNTERSPELL)
	unless BuffExpires(MAGEBUFF) or BuffExpires(MAGEARMOR)
	{
		#/use_item,if=buff.improved_mana_gem.up|cooldown.evocation.remains>90|target.time_to_die<=50
		if {BuffPresent(IMPROVEDMANAGEM) or ManaGemReady()} or TargetDeadIn(less 50) UseItemActions()
		unless 90s before Spell(EVOCATION) UseItemActions()
		#init_use_profession_actions()
		UseProfessionActions()
		#/volcanic_potion,if=buff.improved_mana_gem.up|target.time_to_die<=50
		if CheckBoxOn(potions) and TargetClassification(worldboss)
			and {BuffPresent(IMPROVEDMANAGEM) or ManaGemReady() or TargetDeadIn(less 50)}
		{
			Item(VOLCANICPOTION)
		}
		#/use_item,name=shard_of_woe,if=buff.improved_mana_gem.up|cooldown.evocation.remains>90|target.time_to_die<=50
		#if BuffPresent(IMPROVEDMANAGEM) or ManaGemReady() or {spell(EVOCATION) > 90} or TargetDeadIn(less 50) Item(SHARDOFWOE)
		#/blood_fury,if=buff.improved_mana_gem.up|target.time_to_die<=50
		if BuffPresent(IMPROVEDMANAGEM) or ManaGemReady() or TargetDeadIn(less 50) Spell(BLOODFURY)
		#/berserking,if=buff.arcane_power.up|cooldown.arcane_power.remains>20
		if BuffPresent(ARCANEPOWER) Spell(BERSERKING)
		unless 20s before Spell(ARCANEPOWER) Spell(BERSERKING)
		unless {TalentPoints(PRESENCEOFMINDTALENT less 1)
			and {ArcaneBurnPeriodBeforeEvocation() and TargetDeadIn(more 105) and ItemCount(MANAGEMITEM less 1 charges=1)}}
		{
			#/arcane_torrent,if=mana_pct<91&(buff.arcane_power.up|target.time_to_die<120)
			if ManaPercent(less 91) and {BuffPresent(ARCANEPOWER) or TargetDeadIn(less 120)} Spell(ARCANETORRENTMANA)
			if TalentPoints(ARCANEPOWERTALENT more 0)
			{
				if ArmorSetParts(T13 more 3)
				{
					#/arcane_power,if=(buff.improved_mana_gem.up&buff.tier13_2pc.stack>=9)|\
					#	(buff.tier13_2pc.stack>=10&cooldown.mana_gem.remains>30&cooldown.evocation.remains>10)|\
					#	target.time_to_die<=50
					if {BuffPresent(IMPROVEDMANAGEM) or ManaGemReady()} and BuffPresent(STOLENTIME stacks=9) Spell(ARCANEPOWER)
					if BuffPresent(STOLENTIME stacks=10)
						unless 30s before Item(MANAGEMITEM) or 10s before Spell(EVOCATION) Spell(ARCANEPOWER)
					if TargetDeadIn(less 50) Spell(ARCANEPOWER)
				}
				unless ArmorSetParts(T13 more 3)
				{
					#/arcane_power,if=buff.improved_mana_gem.up|target.time_to_die<=50
					if BuffPresent(IMPROVEDMANAGEM) or ManaGemReady() or TargetDeadIn(less 50) Spell(ARCANEPOWER)
				}
				#/mirror_image,if=buff.arcane_power.up|(cooldown.arcane_power.remains>20&target.time_to_die>15)
				if CheckBoxOn(mirrorimage)
				{
					if BuffPresent(ARCANEPOWER) Spell(MIRRORIMAGE)
					unless 20s before Spell(ARCANEPOWER) or TargetDeadIn(less 15) Spell(MIRRORIMAGE)
				}
			}
			unless TalentPoints(ARCANEPOWERTALENT more 0)
			{
				#/mirror_image
				if CheckBoxOn(mirrorimage) Spell(MIRRORIMAGE)
			}
			#/presence_of_mind
			unless BuffPresent(ARCANEPOWER) Spell(PRESENCEOFMIND)
		}
	}
}

# Mana and Mana Gem management.
AddIcon help=mana mastery=1
{
	unless BuffExpires(MAGEBUFF) or BuffExpires(MAGEARMOR)
	{
		#/conjure_mana_gem,invulnerable=1,if=mana_gem_charges<3
		#if ItemCount(MANAGEMITEM less 3 charges=1) Spell(CONJUREMANAGEM)
		#/evocation,if=((max_mana>max_mana_nonproc&mana_pct_nonproc<=40)|(max_mana=max_mana_nonproc&mana_pct<=35))&target.time_to_die>10
		if ManaPercent(less 35) Spell(EVOCATION)
		if TalentPoints(PRESENCEOFMINDTALENT less 1)
		{
			#/conjure_mana_gem,if=cooldown.evocation.remains<20&target.time_to_die>105&mana_gem_charges=0
			if ArcaneBurnPeriodBeforeEvocation() and TargetDeadIn(more 105) and ItemCount(MANAGEMITEM less 1 charges=1) Spell(CONJUREMANAGEM)
		}
		#/mana_gem,if=buff.arcane_blast.stack=4&buff.tier13_2pc.stack>=7&(cooldown.arcane_power.remains<=0|target.time_to_die<=50)
		if ManaGemReady() Texture(inv_misc_gem_emerald_01)
		if TalentPoints(PRESENCEOFMINDTALENT more 0)
		{
			#/conjure_mana_gem,if=buff.presence_of_mind.up&target.time_to_die>cooldown.mana_gem.remains&mana_gem_charges=0
			if {0s before Spell(PRESENCEOFMIND) or BuffPresent(PRESENCEOFMIND)} and ItemCount(MANAGEMITEM less 1 charges=1)
			{
				Spell(CONJUREMANAGEM)
			}
		}
	}
}

###
### Fire
###

# Blink.
AddIcon help=cd size=small mastery=2
{
	Spell(BLINK)
}

# Main rotation.
AddIcon help=main mastery=2
{
	unless InCombat() if BuffExpires(MAGEBUFF 400) Spell(ARCANEBRILLIANCE)

	#/arcane_brilliance
	unless BuffPresent(MAGEBUFF) Spell(ARCANEBRILLIANCE)
	#/scorch,debuff=1
	if TalentPoints(CRITICALMASSTALENT more 0) and TargetDebuffExpires(magicalcrittaken 6)
	{
		unless InCombat() Spell(PYROBLAST)
		if BuffPresent(HOTSTREAK) Spell(PYROBLAST)
		Spell(SCORCH)
	}
	#/living_bomb,if=!ticking
	if TargetDebuffExpires(LIVINGBOMB 0 mine=1) and TargetDeadIn(more 12) Spell(LIVINGBOMB)
	#/pyroblast_hs,if=buff.hot_streak.react
	if BuffPresent(HOTSTREAK) Spell(PYROBLAST)
	if TalentPoints(FIRESTARTERTALENT more 0) and Speed(more 0) Spell(SCORCH)
	if Glyph(GLYPHOFFROSTFIRE)
	{
		#/frostfire_bolt
		Spell(FROSTFIREBOLT usable=1)
	}
	#/fireball
	Spell(FIREBALL usable=1)
	#/scorch
	Spell(SCORCH)
}

# Long CDs.
AddIcon help=cd mastery=2
{
	#/volcanic_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(VOLCANICPOTION)
	if TargetBuffStealable() Spell(SPELLSTEAL)
	#/counterspell
	if TargetIsInterruptible() Spell(COUNTERSPELL)
	#/volcanic_potion,if=buff.bloodlust.react|target.time_to_die<=40
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(heroism) or TargetDeadIn(less 40)} Item(VOLCANICPOTION)
	#/use_item
	UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
	#/berserking
	Spell(BERSERKING)
	#/blood_fury
	Spell(BLOODFURY)
	#/combustion,if=dot.living_bomb.ticking&dot.ignite.ticking&dot.pyroblast.ticking&dot.ignite.tick_dmg>10000
	if TargetDebuffPresent(LIVINGBOMB mine=1) and TargetDebuffPresent(IGNITE mine=1)
		and {TargetDebuffPresent(PYROBLAST mine=1) or TargetDebuffPresent(PYROBLASTBANG mine=1)}
		and LastSpellDamage(IGNITE more 10000)
	{
		if CheckBoxOff(stolentime) or ArmorSetParts(T13 less 4) Spell(COMBUSTION)
		if CheckBoxOn(stolentime) and ArmorSetParts(T13 more 3) and BuffPresent(STOLENTIME stacks=8) Spell(COMBUSTION)
	}
	#/mirror_image,if=target.time_to_die>=25
	if CheckBoxOn(mirrorimage) and TargetDeadIn(more 25) Spell(MIRRORIMAGE)
	#/flame_orb,if=target.time_to_die>=12
	if TargetDeadIn(more 12) Spell(FLAMEORB)
}

# Mana management.
AddIcon help=mana size=small mastery=2
{
	unless InCombat() if BuffExpires(MAGEARMOR 400) and BuffExpires(MOLTENARMOR 400) and BuffExpires(FROSTARMOR 400) Spell(MOLTENARMOR)

	#/molten_armor,if=buff.mage_armor.down&buff.molten_armor.down
	unless BuffPresent(MAGEARMOR) or BuffPresent(MOLTENARMOR) or BuffPresent(FROSTARMOR) Spell(MOLTENARMOR)
	#/molten_armor,if=mana_pct>45&buff.mage_armor.up
	if BuffPresent(MAGEARMOR) and ManaPercent(more 45) Spell(MOLTENARMOR)
	#/conjure_mana_gem,invulnerable=1,if=mana_gem_charges<3
	unless InCombat() if ItemCount(MANAGEMITEM less 3 charges=1) Spell(CONJUREMANAGEM)

	# If we can't use Scorch as a filler, then use Evocation like other mage specs.
	# /evocation,if=mana_pct<40&buff.bloodlust.react
	if TalentPoints(FIRESTARTERTALENT less 1) and ManaPercent(less 40) and BuffExpires(heroism 1.5) Spell(EVOCATION)

	#/arcane_torrent,if=mana_pct<91
	if ManaPercent(less 91) Spell(ARCANETORRENTMANA)
	#/mana_gem,if=mana_deficit>12500
	if {player.maxMana() - player.mana() > 12500} Item(MANAGEMITEM)
	#/mage_armor,if=mana_pct<5&buff.mage_armor.down
	if BuffExpires(MAGEARMOR 0) and ManaPercent(less 5) Spell(MAGEARMOR)
}

###
### Frost
###

# Blink.
AddIcon help=cd size=small mastery=3
{
	Spell(BLINK)
}

# Main rotation.
AddIcon help=main mastery=3
{
	unless InCombat() if BuffExpires(MAGEBUFF 400) Spell(ARCANEBRILLIANCE)

	#/arcane_brilliance
	unless BuffPresent(MAGEBUFF) Spell(ARCANEBRILLIANCE)
	#/water_elemental
	if PetPresent(no) Spell(SUMMONWATERELEMENTAL)
	if TalentPoints(DEEPFREEZETALENT more 0) and 1s before Spell(DEEPFREEZE)
		unless BuffPresent(FINGERSOFFROST) Spell(PETFREEZE)

	#/deep_freeze,if=buff.fingers_of_frost.react
	Spell(DEEPFREEZE usable=1)
	#/frostfire_bolt,if=buff.brain_freeze.react&buff.fingers_of_frost.react
	if BuffPresent(BRAINFREEZE) and BuffPresent(FINGERSOFFROST)
	{
		Spell(FROSTFIREBOLT)
		Spell(FIREBALL)
	}
	#/ice_lance,if=buff.fingers_of_frost.stack>1
	if BuffPresent(FINGERSOFFROST stacks=2) Spell(ICELANCE)
	#/ice_lance,if=buff.fingers_of_frost.react&pet.water_elemental.cooldown.freeze.remains<gcd
	if BuffPresent(FINGERSOFFROST) and {spell(PETFREEZE) < timeWithHaste(1.5)} Spell(ICELANCE)
	if Speed(more 0)
	{
		#/ice_lance,moving=1
		Spell(ICELANCE)
		#/fire_blast,moving=1
		Spell(FIREBLAST)
	}
	#/frostbolt
	unless CastTime(FROSTFIREBOLT more 1.25) Spell(FROSTFIREBOLT)
	Spell(FROSTBOLT)
}

# Long CDs.
AddIcon help=cd mastery=3
{
	#/volcanic_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(VOLCANICPOTION)
	if TargetBuffStealable() Spell(SPELLSTEAL)
	#/counterspell
	if TargetIsInterruptible() Spell(COUNTERSPELL)
	#/use_item
	UseItemActions()
	#init_use_profession_actions()
	UseProfessionActions()
	#/volcanic_potion,if=buff.bloodlust.react|buff.icy_veins.react|target.time_to_die<=40
	if CheckBoxOn(potions) and TargetClassification(worldboss)
		if BuffPresent(heroism) or BuffPresent(ICYVEINS) or TargetDeadIn(less 40) Item(VOLCANICPOTION)
	#/blood_fury
	Spell(BLOODFURY)
	#/cold_snap,if=cooldown.deep_freeze.remains>15&cooldown.frostfire_orb.remains>30&cooldown.icy_veins.remains>30
	unless {TalentPoints(DEEPFREEZETALENT more 0) and 15s before Spell(DEEPFREEZE)} or 30s before Spell(FLAMEORB)
		or {TalentPoints(ICYVEINSTALENT more 0) and 30s before Spell(ICYVEINS)}
	{
		Spell(COLDSNAP)
	}
	#/frostfire_orb,if=target.time_to_die>=12&!ticking
	if TargetDeadIn(more 12)
	{
		if TalentPoints(COLDSNAPTALENT more 0)
		{
			if TalentPoints(ICEFLOESTALENT equal 3) and 369s before Spell(COLDSNAP) Spell(FLAMEORB)
			if TalentPoints(ICEFLOESTALENT equal 2) and 398s before Spell(COLDSNAP) Spell(FLAMEORB)
			if TalentPoints(ICEFLOESTALENT equal 1) and 432s before Spell(COLDSNAP) Spell(FLAMEORB)
			if TalentPoints(ICEFLOESTALENT equal 0) and 465s before Spell(COLDSNAP) Spell(FLAMEORB)
		}
		unless TalentPoints(COLDSNAPTALENT more 0) Spell(FLAMEORB)
	}
	#/mirror_image,if=target.time_to_die>=25
	if CheckBoxOn(mirrorimage) and TargetDeadIn(more 25) Spell(MIRRORIMAGE)
	unless BuffPresent(ICYVEINS) or BuffPresent(heroism)
	{
		#/berserking,if=buff.icy_veins.down&buff.bloodlust.down
		Spell(BERSERKING)
		unless ArmorSetParts(T13 more 3)
		{
			#/icy_veins,if=buff.icy_veins.down&buff.bloodlust.down
			Spell(ICYVEINS)
		}
		if ArmorSetParts(T13 more 3)
		{
			#/icy_veins,if=buff.icy_veins.down&buff.bloodlust.down&(buff.tier13_2pc.stack>7|cooldown.cold_snap.remains<22)
			if BuffPresent(STOLENTIME stacks=8) or 22s before Spell(COLDSNAP) Spell(ICYVEINS)
		}
	}
}

# Mana management.
AddIcon help=mana mastery=3
{
	unless InCombat() if BuffExpires(MAGEARMOR 400) and BuffExpires(MOLTENARMOR 400) and BuffExpires(FROSTARMOR 400) Spell(MOLTENARMOR)

	#/conjure_mana_gem,invulnerable=1,if=mana_gem_charges<3
	unless InCombat() if ItemCount(MANAGEMITEM less 3 charges=1) Spell(CONJUREMANAGEM)
	#/molten_armor
	unless BuffPresent(MAGEARMOR) or BuffPresent(MOLTENARMOR) or BuffPresent(FROSTARMOR) Spell(MOLTENARMOR)
	#/arcane_torrent,if=mana_pct<91
	if ManaPercent(less 91) Spell(ARCANETORRENTMANA)
	#/evocation,if=mana_pct<40&(buff.icy_veins.react|buff.bloodlust.react)
	if BuffExpires(heroism 1.5) or BuffExpires(ICYVEINS 1.5)
	{
		if ManaPercent(less 40) Spell(EVOCATION)
		unless ItemCount(MANAGEMITEM more 0 charges=1) Spell(CONJUREMANAGEM)
	}
	#/mana_gem,if=mana_deficit>12500
	if {player.maxMana() - player.mana() > 12500} Item(MANAGEMITEM)
}
]]