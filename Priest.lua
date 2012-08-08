NerienOvaleScripts.script["PRIEST"] =
[[
# Nerien's Priest Ovale script based on SimulationCraft.
#
# Shadow:
#	talents=http://www.wowhead.com/talent#priest-032212000000000000000000000000000000000000322032210201222100231
#	glyphs=mind_flay/shadow_word_pain/shadow_word_death/spirit_tap

## defines ##

# Buffs
Define(BORROWEDTIME 59888)
Define(CHAKRACHASTISE 81209)
Define(CHAKRASANCTUARY 81206)
Define(CHAKRASERENITY 81208)
Define(DARKARCHANGEL 87153)
Define(DARKEVANGELISM 87118)
Define(EMPOWEREDSHADOW 95799)
Define(HOLYARCHANGEL 81700)
Define(HOLYEVANGELISM 81661)
SpellList(MINDMELTBUFF 81292 87160)
Define(MINDSPIKEBUFF 87178)
Define(POWERWORDFORTITUDEBUFF 79105)
Define(SHADOWORB 77487)
Define(SHADOWPROTECTIONBUFF 79107)
SpellList(STAMINABUFF 469 6309 79105 90364) # Commanding Shout, Blood Pact, Power Word: Fortitude, Qiraji Fortitude
Define(SURGEOFLIGHT 88688)

# Buff Procs
Define(LIGHTWEAVE 75170) # +580 int tailoring proc
Define(POWERTORRENT 74241) # +500 int weapon enchant proc

# On-use trinket buffs for some commonly available 300+ trinkets.
SpellList(INTELLECTTRINKETBUFF 95875 97007 97008)

# Debuffs
Define(WEAKENEDSOUL 6788)

# Glyphs
Define(GLYPHOFDISPERSION 63229)
Define(GLYPHOFPENANCE 63235)
Define(GLYPHOFSHADOWWORDDEATH 55682)
Define(GLYPHOFSMITE 55692)
Define(GLYPHOFSPIRITTAP 63237)

# Talents
Define(ARCHANGELTALENT 11608)
Define(ATONEMENTTALENT 11812)
Define(BORROWEDTIMETALENT 11523)
Define(GRACETALENT 8625)
Define(HEAVENLYVOICETALENT 11668)
Define(IMPROVEDDEVOURINGPLAGUETALENT 9062)
Define(IMPROVEDMINDBASTTALENT 9042)
Define(MASOCHISMTALENT 11778)
Define(MINDMELTTALENT 9060)
Define(RAPTURETALENT 8617)
Define(REVELATIONSTALENT 11755)
Define(SHADOWFORMTALENT 9064)
Define(SHADOWYAPPARITIONTALENT 9070)
Define(VAMPIRICEMBRACETALENT 9054)
Define(VAMPIRICTOUCHTALENT 9074)

# Spells
Define(ARCHANGEL 87151)
	SpellInfo(ARCHANGEL cd=30 mastery=1)
	SpellInfo(ARCHANGEL cd=30 mastery=2)
	SpellInfo(ARCHANGEL cd=90 mastery=3)
	SpellAddBuff(ARCHANGEL DARKARCHANGEL=18 HOLYARCHANGEL=18)
Define(BINDINGHEAL 32546)
	SpellAddBuff(BINDINGHEAL CHAKRA=0)
Define(CHAKRA 14751)
	SpellInfo(CHAKRA cd=30)
	SpellAddBuff(CHAKRA CHAKRA=86400) # fake duration
Define(CIRCLEOFHEALING 34861)
	SpellInfo(CIRCLEOFHEALING cd=10)
Define(DEVOURINGPLAGUE 2944)
	SpellInfo(DEVOURINGPLAGUE duration=24 tick=3)
	SpellAddTargetDebuff(DEVOURINGPLAGUE DEVOURINGPLAGUE=24)
Define(DISPERSION 47585)
	SpellInfo(DISPERSION cd=120)
	SpellInfo(DISPERSION addcd=-45 glyph=GLYPHOFDISPERSION)
Define(DIVINEHYMN 64843)
	SpellInfo(DIVINEHYMN cd=480)
	SpellInfo(DIVINEHYMN addcd=-300 talent=HEAVENLYVOICETALENT)
Define(FLASHHEAL 2061)
	SpellAddBuff(FLASHHEAL CHAKRA=0)
Define(GREATERHEAL 2060)
	SpellAddBuff(GREATERHEAL CHAKRA=0)
Define(GUARDIANSPIRIT 47788)
	SpellInfo(GUARDIANSPIRIT cd=180)
	SpellAddBuff(GUARDIANSPIRIT GUARDIANSPIRIT=10)
Define(HEAL 2050)
	SpellAddBuff(HEAL CHAKRA=0)
Define(HOLYFIRE 14914)
	SpellInfo(HOLYFIRE cd=10 duration=7 tick=7)
	SpellAddDebuff(HOLYFIRE HOLYFIRE=7)
Define(HOLYWORDCHASTISE 88625)
	SpellInfo(HOLYWORDCHASTISE cd=30)
Define(HOLYWORDSANCTUARY 88685)
	SpellInfo(HOLYWORDSANCTUARY cd=40)
Define(HOLYWORDSERENITY 88684)
	SpellInfo(HOLYWORDSERENITY cd=10)
Define(INNERFIRE 588)
	SpellAddBuff(INNERFIRE INNERFIRE=86400)	# fake duration
Define(INNERFOCUS 89485)
	SpellInfo(INNERFOCUS cd=45)
	SpellAddBuff(INNERFOCUS INNERFOCUS=86400) # fake duration
Define(INNERWILL 73413)
	SpellAddBuff(INNERWILL INNERWILL=86400)	# fake duration
Define(MINDBLAST 8092)
	SpellInfo(MINDBLAST cd=8)
	SpellInfo(MINDBLAST addcd=-2 talent=IMPROVEDMINDBASTTALENT)
	SpellAddBuff(MINDBLAST EMPOWEREDSHADOW=15 SHADOWORB=0)
Define(MINDFLAY 15407)
	SpellInfo(MINDFLAY canStopChannelling=3)
Define(MINDSPIKE 73510)
	SpellAddBuff(MINDSPIKE CHAKRA=0 MINDSPIKEBUFF=12 SHADOWORB=0)
Define(PENANCE 47540)
	SpellInfo(PENANCE cd=12 canStopChannelling=2)
	SpellInfo(PENANCE addcd=-2 glyph=GLYPHOFPENANCE)
Define(POWERINFUSION 10060)
	SpellInfo(POWERINFUSION cd=120)
	SpellAddBuff(POWERINFUSION POWERINFUSION=15)
Define(POWERWORDBARRIER 62618)
	SpellInfo(POWERWORDBARRIER cd=180)
Define(POWERWORDFORTITUDE 21562)
	SpellAddBuff(POWERWORDFORTITUDE POWERWORDFORTITUDEBUFF=3600)
Define(POWERWORDSHIELD 17)
	SpellAddBuff(POWERWORDSHIELD POWERWORDSHIELD=15 BORROWEDTIME=6)
	SpellAddDebuff(POWERWORDSHIELD WEAKENEDSOUL=15)
Define(PRAYEROFHEALING 596)
	SpellAddBuff(PRAYEROFHEALING CHAKRA=0)
Define(PRAYEROFMENDING 33076)
	SpellInfo(PRAYEROFMENDING cd=10)
	SpellAddBuff(PRAYEROFMENDING CHAKRA=0)
Define(RAPTURE 47755)
	SpellInfo(RAPTURE cd=12)
Define(RENEW 139)
	SpellInfo(RENEW duration=12 tick=4)
	SpellAddBuff(RENEW RENEW=12)
Define(SHADOWFIEND 34433)
	SpellInfo(SHADOWFIEND cd=300)
Define(SHADOWFORM 15473)
Define(SHADOWPROTECTION 27683)
	SpellAddBuff(SHADOWPROTECTION SHADOWPROTECTIONBUFF=3600)
Define(SHADOWWORDDEATH 32379)
	SpellInfo(SHADOWWORDDEATH cd=10)
Define(SHADOWWORDPAIN 589)
	SpellInfo(SHADOWWORDPAIN duration=18 tick=3)
	SpellAddTargetDebuff(SHADOWWORDPAIN SHADOWWORDPAIN=18)
Define(SILENCE 15487)
	SpellInfo(SILENCE cd=45)
Define(SMITE 585)
	SpellAddBuff(SMITE CHAKRA=0)
Define(VAMPIRICEMBRACE 15286)
	SpellAddBuff(VAMPIRICEMBRACE VAMPIRICEMBRACE=86400)	# fake duration
Define(VAMPIRICTOUCH 34914)
	SpellInfo(VAMPIRICTOUCH duration=15 tick=3)
	SpellAddTargetDebuff(VAMPIRICTOUCH VAMPIRICTOUCH=15)

# Racials & Professions
Define(ARCANETORRENTMANA 28730) # blood elf
	SpellInfo(ARCANETORRENTMANA sharedcd=racial cd=120)
Define(BERSERKING 26297) # troll
	SpellInfo(BERSERKING duration=10 cd=180)
	SpellAddBuff(BERSERKING BERSERKING=10)
Define(LIFEBLOOD 55503) # herbalism
	SpellInfo(LIFEBLOOD duration=20 cd=120)
Define(STONEFORM 20594) # dwarf
	SpellInfo(STONEFORM duration=8 cd=120)
	SpellAddBuff(STONEFORM STONEFORM=8)

# Items
Define(VOLCANICPOTION 58091)
	Define(VOLCANICPOTIONSPELL 80481)
Define(MYTHICALMANAPOTION 57192)

### end defines ###

ScoreSpells(MINDBLAST SHADOWWORDPAIN VAMPIRICTOUCH DEVOURINGPLAGUE MINDFLAY SHADOWWORDDEATH MINDSPIKE)

AddCheckBox(potions SpellName(VOLCANICPOTIONSPELL) default mastery=3)
AddCheckBox(pws SpellName(POWERWORDSHIELD) mastery=1)
AddCheckBox(lightweave SpellName(LIGHTWEAVE) mastery=1)
AddCheckBox(lightweave SpellName(LIGHTWEAVE) mastery=2)
AddCheckBox(powertorrent SpellName(POWERTORRENT) mastery=1)
AddCheckBox(powertorrent SpellName(POWERTORRENT) mastery=2)

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
}

AddFunction EnoughBuffsForHealingShadowFiend
{
	# "enough buffs" means:
	#	- at least two proc effects
	#	- at least one on-use trinket effect (either ready to use, or buff already present)
	#
	{{{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and {CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)}}
		or {{CheckBoxOn(lightweave) and BuffPresent(LIGHTWEAVE)} and CheckBoxOff(powertorrent)}
		or {CheckBoxOff(lightweave) and {CheckBoxOn(powertorrent) and BuffPresent(POWERTORRENT)}}
		or {CheckBoxOff(lightweave) and CheckBoxOff(powertorrent)}}
	and {{List(trinketcd0 000s) and List(trinketcd1 000s)}
		or {{List(trinketcd0 060s) or List(trinketcd0 090s) or List(trinketcd0 120s)}
			and {Item(Trinket0Slot)	or BuffPresent(INTELLECTTRINKETBUFF)}}
		or {{List(trinketcd1 060s) or List(trinketcd1 090s) or List(trinketcd1 120s)}
			and {Item(Trinket1Slot)	or BuffPresent(INTELLECTTRINKETBUFF)}}}
}

###
### Discipline
###

AddIcon size=small mastery=1 { }

# Archangel.
AddIcon size=small mastery=1
{
	#/archangel,if=buff.holy_evangelism.stack>=5
	if BuffPresent(HOLYEVANGELISM stacks=5) Spell(ARCHANGEL)
}

# Main Rotation.
AddIcon help=main mastery=1
{
	#/fortitude
	if BuffExpires(STAMINABUFF) or {InCombat(no) and BuffExpires(STAMINABUFF 400)} Spell(POWERWORDFORTITUDE)
	if BuffExpires(SHADOWPROTECTIONBUFF) or {InCombat(no) and BuffExpires(SHADOWPROTECTIONBUFF 400)} Spell(SHADOWPROTECTION)
	#/inner_fire
	if BuffExpires(INNERFIRE) and BuffExpires(INNERWILL) Spell(INNERFIRE)
	if CheckBoxOn(pws)
	{
		#/power_word_shield,ignore_debuff=1
		if TargetDebuffExpires(WEAKENEDSOUL) Spell(POWERWORDSHIELD)
		Spell(PRAYEROFMENDING)
	}
	if CheckBoxOff(pws)
	{
		#/power_word_shield,if=!cooldown.rapture.remains
		#	47755 spell ID?  Need to test with GetSpellCooldown().
		if 0s before Spell(RAPTURE) and TargetDebuffExpires(WEAKENEDSOUL) Spell(POWERWORDSHIELD)
		if TalentPoints(BORROWEDTIMETALENT more 0)
		{
			#/penance_heal,if=buff.borrowed_time.up|buff.grace.down
			if BuffPresent(BORROWEDTIME) or {TalentPoints(GRACETALENT more 0) and BuffExpires(GRACE)} Spell(PENANCE)
		}
		#/greater_heal,if=buff.inner_focus.up
		if BuffPresent(INNERFOCUS) Spell(GREATERHEAL)
		Spell(PRAYEROFMENDING)
		if TalentPoints(ARCHANGELTALENT more 0)
		{
			#/holy_fire
			Spell(HOLYFIRE)
			if TalentPoints(ATONEMENTTALENT more 0)
			{
				#/smite,if=dot.holy_fire.remains>cast_time&buff.holy_evangelism.stack<5&buff.holy_archangel.down
				if {Glyph(GLYPHOFSMITE no) or {target.debuffExpires(HOLYFIRE mine=1) > castTime(SMITE)}}
					and BuffExpires(HOLYARCHANGEL)
				{
					unless BuffPresent(HOLYEVANGELISM stacks=5) Spell(SMITE)
				}
			}
		}
		#/penance_heal
		Spell(PENANCE)
		#/greater_heal
		Spell(GREATERHEAL)
	}
}

# AoE.
AddIcon help=cd mastery=1
{
	Spell(POWERWORDBARRIER)
	Spell(DIVINEHYMN)
	Spell(PRAYEROFHEALING)
}

# Long CDs.
AddIcon help=cd mastery=1
{
	#/inner_focus
	Spell(INNERFOCUS)
	#/power_infusion
	Spell(POWERINFUSION)
}

# Mana management.
AddIcon help=mana size=small mastery=1
{
	#/mana_potion,if=mana_pct<=75
	#if ManaPercent(less 75) and ItemCount(MYTHICALMANAPOTION more 0) Item(MYTHICALMANAPOTION)
	#/arcane_torrent,if=mana_pct<=90
	if ManaPercent(less 90) Spell(ARCANETORRENTMANA)
	#/shadow_fiend,if=mana_pct<=20
	if ManaPercent(less 20) and EnoughBuffsForHealingShadowfiend() Spell(SHADOWFIEND)
	#/hymn_of_hope,if=pet.shadow_fiend.active
	if PetPresent() Spell(HYMNOFHOPE)
}

###
### Holy
###

# Chakra.
AddIcon size=small mastery=2
{
	if BuffPresent(CHAKRACHASTISE) Texture(Priest_icon_chakra_red)
	if BuffPresent(CHAKRASANCTUARY) Texture(Priest_icon_chakra_blue)
	if BuffPresent(CHAKRASERENITY) Texture(Priest_icon_chakra)
	if BuffExpires(CHAKRACHASTISE) and BuffExpires(CHAKRASANCTUARY) and BuffExpires(CHAKRASERENITY) Spell(CHAKRA)
}

# Holy Words.
AddIcon size=small mastery=2
{
	if BuffPresent(CHAKRACHASTISE) Spell(HOLYWORDCHASTISE)
	if TalentPoints(REVELATIONSTALENT more 0)
	{
		if BuffPresent(CHAKRASANCTUARY) Spell(HOLYWORDSANCTUARY)
		if BuffPresent(CHAKRASERENITY) Spell(HOLYWORDSERENITY)
	}
}

# Main Rotation.
AddIcon help=main mastery=2
{
	#/fortitude
	if BuffExpires(STAMINABUFF) or {InCombat(no) and BuffExpires(STAMINABUFF 400)} Spell(POWERWORDFORTITUDE)
	if BuffExpires(SHADOWPROTECTIONBUFF) or {InCombat(no) and BuffExpires(SHADOWPROTECTIONBUFF 400)} Spell(SHADOWPROTECTION)
	#/inner_fire
	if BuffExpires(INNERFIRE) and BuffExpires(INNERWILL) Spell(INNERFIRE)
	if BuffPresent(SURGEOFLIGHT) Spell(FLASHHEAL)
	Spell(PRAYEROFMENDING)
	if TargetBuffExpires(RENEW 3 mine=1 haste=spell) Spell(RENEW)
	if BuffPresent(CHAKRASERENITY) and TargetBuffPresent(RENEW 3 mine=1 haste=spell) Spell(HEAL)
}

# AoE.
AddIcon help=aoe mastery=2
{
	Spell(CIRCLEOFHEALING)
	Spell(PRAYEROFHEALING)
}

# Long CDs.
AddIcon help=cd mastery=2
{
	Spell(GUARDIANSPIRIT)
	Spell(DIVINEHYMN)
}

# Mana management.
AddIcon help=mana size=small mastery=2
{
	#/mana_potion,if=mana_pct<=75
	#if ManaPercent(less 75) and ItemCount(MYTHICALMANAPOTION more 0) Item(MYTHICALMANAPOTION)
	#/arcane_torrent,if=mana_pct<=90
	if ManaPercent(less 90) Spell(ARCANETORRENTMANA)
	#/shadow_fiend,if=mana_pct<=20
	if ManaPercent(less 20) and EnoughBuffsForHealingShadowfiend() Spell(SHADOWFIEND)
	#/hymn_of_hope,if=pet.shadow_fiend.active
	if PetPresent() Spell(HYMNOFHOPE)
}

###
### Shadow
###

# Movement.
AddIcon size=small mastery=3
{
	if TalentPoints(SHADOWYAPPARITIONTALENT more 0) and TargetDebuffPresent(SHADOWWORDPAIN mine=1)
	{
		#/stop_moving,health_percentage<=25,if=cooldown.shadow_word_death.remains>=0.2|dot.vampiric_touch.remains<cast_time+2.5
		#/start_moving,health_percentage<=25,if=cooldown.shadow_word_death.remains<=0.1
		if TargetLifePercent(less 25)
			and 0.2s before Spell(SHADOWWORDDEATH)
			and TalentPoints(VAMPIRICTOUCHTALENT more 0) and TargetDebuffPresent(VAMPIRICTOUCH 4.5 mine=1 haste=spell)
		{
			Texture(ability_druid_dash)
		}
	}
}

# Devouring Plague (can only be placed on a single target at a time).
AddIcon help=buff size=small mastery=3
{
	unless BuffExpires(STAMINABUFF) or {InCombat(no) and BuffExpires(STAMINABUFF 400)}
		or BuffExpires(INNERFIRE) and BuffExpires(INNERWILL)
		or {TalentPoints(SHADOWFORMTALENT more 0) and BuffExpires(SHADOWFORM)}
		or {TalentPoints(VAMPIRICEMBRACETALENT more 0) and BuffExpires(VAMPIRICEMBRACE)}
		or 0s before Spell(MINDBLAST)
		or TargetDebuffExpires(SHADOWWORDPAIN 2.5 mine=1 haste=spell)
	{
		#/devouring_plague,if=(!ticking|dot.devouring_plague.remains<gcd+1.0)&miss_react
		if TargetDebuffExpires(DEVOURINGPLAGUE 3 mine=1 haste=spell) Spell(DEVOURINGPLAGUE)
	}
}

# Main rotation.
AddIcon help=main mastery=3
{
	#/fortitude
	if BuffExpires(STAMINABUFF) or {InCombat(no) and BuffExpires(STAMINABUFF 400)} Spell(POWERWORDFORTITUDE)
	if BuffExpires(SHADOWPROTECTIONBUFF) or {InCombat(no) and BuffExpires(SHADOWPROTECTIONBUFF 400)} Spell(SHADOWPROTECTION)
	#/inner_fire
	if BuffExpires(INNERFIRE) and BuffExpires(INNERWILL) Spell(INNERFIRE)
	#/shadow_form
	if BuffExpires(SHADOWFORM) Spell(SHADOWFORM)
	#/vampiric_embrace
	if BuffExpires(VAMPIRICEMBRACE) Spell(VAMPIRICEMBRACE)
	#/mind_blast
	Spell(MINDBLAST)
	#/shadow_word_pain,if=(!ticking|dot.shadow_word_pain.remains<gcd+0.5)&miss_react
	if TargetDebuffExpires(SHADOWWORDPAIN 2.5 mine=1 haste=spell) Spell(SHADOWWORDPAIN)
	#/vampiric_touch,if=(!ticking|dot.vampiric_touch.remains<cast_time+2.5)&miss_react
	if TargetDebuffExpires(VAMPIRICTOUCH 4.5 mine=1 haste=spell) Spell(VAMPIRICTOUCH)
	#/shadow_word_death,health_percentage<=25
	if {TalentPoints(MINDMELTTALENT more 0) or Glyph(GLYPHOFSHADOWWORDDEATH)} and TargetLifePercent(less 25) Spell(SHADOWWORDDEATH)
	#/shadow_word_death,if=mana_pct<10
	if TalentPoints(MASOCHISMTALENT more 0) and ManaPercent(less 10) Spell(SHADOWWORDDEATH)
	#/mind_flay
	Spell(MINDFLAY)
}

# Movement & Mind Spike rotation.
AddIcon help=main mastery=3
{
	# Movement.
	if Speed(more 0)
	{
		#/shadow_word_pain,if=(!ticking|dot.shadow_word_pain.remains<gcd+0.5)&miss_react
		if TargetDebuffExpires(SHADOWWORDPAIN 2.5 mine=1 haste=spell) Spell(SHADOWWORDPAIN)
		#/shadow_word_death,moving=1
		Spell(SHADOWWORDDEATH)
		#/devouring_plague,moving=1,if=mana_pct>10
		if TalentPoints(IMPROVEDDEVOURINGPLAGUETALENT more 0) and ManaPercent(more 10) Spell(DEVOURINGPLAGUE)
	}

	# Mind Spike rotation on short-lived mobs.
	if TargetDeadIn(less 15)
	{
		if {TalentPoints(MINDMELTTALENT more 0) or Glyph(GLYPHOFSHADOWWORDDEATH) or Glyph(GLYPHOFSPIRITTAP)}
			and TargetLifePercent(less 25)
		{
			Spell(SHADOWWORDDEATH)
		}
		if BuffPresent(MINDSPIKEBUFF stacks=3) Spell(MINDBLAST) # guaranteed MB crit
		if BuffPresent(MINDMELTBUFF stacks=2) Spell(MINDBLAST) # instant-cast MB
		Spell(MINDSPIKE)
		Spell(MINDFLAY)
	}
}

# Long CDs.
AddIcon help=cd mastery=3
{
	#/volcanic_potion,if=!in_combat
	if InCombat(no) and CheckBoxOn(potions) and TargetClassification(worldboss) Item(VOLCANICPOTION)
	if TargetIsInterruptible(yes) Spell(SILENCE)

	unless BuffExpires(STAMINABUFF) or {InCombat(no) and BuffExpires(STAMINABUFF 400)}
		or BuffExpires(INNERFIRE) and BuffExpires(INNERWILL)
		or {TalentPoints(SHADOWFORMTALENT more 0) and BuffExpires(SHADOWFORM)}
		or {TalentPoints(VAMPIRICEMBRACETALENT more 0) and BuffExpires(VAMPIRICEMBRACE)}
	{
		UseItemActions()
		UseProfessionActions()
		#/volcanic_potion,if=buff.bloodlust.react|target.time_to_die<=40
		if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(heroism) or TargetDeadIn(less 40)} Item(VOLCANICPOTION)
		unless 0s before Spell(MINDBLAST)
		{
			#/berserking
			UseRacialActions()
			unless TargetDebuffExpires(SHADOWWORDPAIN 2.5 mine=1 haste=spell)
				or {TalentPoints(VAMPIRICTOUCHTALENT more 0) and TargetDebuffExpires(VAMPIRICTOUCH 4.5 mine=1 haste=spell)}
			{
				#/archangel,if=buff.dark_evangelism.stack>=5&dot.vampiric_touch.remains>5&dot.devouring_plague.remains>5
				if BuffPresent(DARKEVANGELISM stacks=5)
					and TargetDebuffPresent(VAMPIRICTOUCH 5 mine=1) and TargetDebuffPresent(DEVOURINGPLAGUE 5 mine=1)
				{
					Spell(ARCHANGEL)
				}
				unless TalentPoints(MINDMELTTALENT more 0) and TargetLifePercent(less 25) and 0s before Spell(SHADOWWORDDEATH)
				{
					#/shadow_fiend
					Spell(SHADOWFIEND)
				}
			}
		}
	}
}

# Dispersion.
AddIcon help=cd size=small mastery=3
{
	#/dispersion
	Spell(DISPERSION)
}
]]