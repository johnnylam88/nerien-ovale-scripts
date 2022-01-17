local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_paladin_protection"
	local desc = string.format("[9.1.5] %s: Paladin - Protection", Private.name)
	local code = [[
# Adapted from Wowhead's "Protection Paladin Rotation Guide - Shadowlands 9.1.5"
#	by Lincoln
# https://www.wowhead.com/protection-paladin-rotation-guide

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(blessed_hammer_talent 23469)
Define(blessing_of_spellwarding_talent 22435)
Define(blinding_light_talent 21811)
Define(cavalier_talent 22434)
Define(crusaders_judgment_talent 22604)
Define(final_stand_talent 22645)
Define(fist_of_justice_talent 22179)
Define(holy_avenger_talent 17599)
Define(moment_of_glory_talent 23468)
Define(redoubt_talent 22558)
Define(repentance_talent 22180)
Define(sanctified_wrath_talent 23457)
Define(seraphim_talent 17599)
Define(unbreakable_spirit_talent 22433)

# Class Abilities
Define(ardent_defender 31850)
	SpellInfo(ardent_defender cd=120 duration=8)
	SpellRequire(ardent_defender cd add=-36 enabled=(Talent(unbreakable_spirit_talent)))
	SpellAddBuff(ardent_defender ardent_defender add=1)
Define(avengers_shield 31935)
	SpellInfo(avengers_shield cd=15 cd_haste=1 holypower=-1 interrupt=1)
	SpellRequire(avengers_shield holypower add=-2 enabled=(BuffPresent(holy_avenger)))
	SpellRequire(avengers_shield cd set=0 enabled=(BuffPresent(moment_of_glory)))
Define(avenging_wrath 31884)
	SpellInfo(avenging_wrath cd=120 duration=20 gcd=0 offgcd=1)
	SpellRequire(avenging_wrath duration add=5 enabled=(Talent(sanctified_wrath_talent)))
	SpellAddBuff(avenging_wrath avenging_wrath add=1)
Define(blessed_hammer 204019)
	SpellInfo(blessed_hammer charge_cd=7.5 cd_haste=1 holypower=-1)
	SpellRequire(blessed_hammer holypower add=-2 enabled=(BuffPresent(holy_avenger)))
Define(blessing_of_protection 642)
	SpellInfo(blessing_of_protection cd=300 duration=10)
	SpellRequire(blessing_of_protection replaced_by set=blessing_of_spellwarding enabled=(Talent(blessing_of_spellwarding_talent)))
	SpellRequire(blessing_of_protection unusable set=1 enabled=(DebuffPresent(forbearance_debuff)))
	SpellAddBuff(blessing_of_protection blessing_of_protection add=1)
	SpellAddDebuff(blessing_of_protection forbearance_debuff add=1)
Define(blessing_of_spellwarding 204018)
	SpellInfo(blessing_of_spellwarding cd=180 duration=10)
	SpellRequire(blessing_of_spellwarding unusable set=1 enabled=(DebuffPresent(forbearance_debuff)))
	SpellAddBuff(blessing_of_spellwarding blessing_of_spellwarding add=1)
	SpellAddDebuff(blessing_of_spellwarding forbearance_debuff add=1)
Define(blinding_light 115750)
	SpellInfo(blinding_light cd=90)
	SpellRequire(blinding_light unusable set=1 enabled=(not Talent(blinding_light_talent)))
Define(cleanse_toxins 213644)
	SpellInfo(cleanse_toxins cd=8)
Define(consecration 26573)
	SpellInfo(consecration cd=4.5 cd_haste=1 duration=12)
	SpellAddBuff(consecration consecration_buff add=1)
Define(consecration_buff 188370)
	SpellInfo(consecration_buff duration=12 tick=1)
Define(devotion_aura 465)
	SpellInfo(devotion_aura duration=86400)
	SpellAddBuff(devotion_aura devotion_aura add=1)
Define(divine_shield 642)
	SpellInfo(divine_shield cd=300 duration=8)
	SpellRequire(divine_shield cd add=-90 enabled=(Talent(unbreakable_spirit_talent)))
	SpellRequire(divine_shield unusable set=1 enabled=(DebuffPresent(forbearance_debuff)))
	SpellAddBuff(divine_shield divine_shield add=1)
	SpellAddDebuff(divine_shield forbearance_debuff add=1)
Define(forbearance_debuff 25771)
	SpellInfo(forbearance_debuff duration=30)
Define(guardian_of_ancient_kings 86659)
	SpellInfo(guardian_of_ancient_kings cd=300 duration=8)
	SpellAddBuff(guardian_of_ancient_kings guardian_of_ancient_kings add=1)
Define(hammer_of_justice 853)
	SpellInfo(hammer_of_justice cd=60 duration=6)
	SpellAddTargetDebuff(hammer_of_justice hammer_of_justice add=1)
Define(hammer_of_the_righteous 53595)
	SpellInfo(hammer_of_the_righteous cd=6 cd_haste=1 holypower=-1)
	SpellRequire(hammer_of_the_righteous holypower add=-2 enabled=(BuffPresent(holy_avenger)))
	SpellRequire(hammer_of_the_righteous replaced_by set=blessed_hammer enabled=(Talent(blessed_hammer_talent)))
Define(hammer_of_wrath 24275)
	SpellInfo(hammer_of_wrath charge_cd=7.5 cd_haste=1 holypower=-1)
	SpellRequire(hammer_of_wrath holypower add=-2 enabled=(BuffPresent(holy_avenger)))
	SpellRequire(hammer_of_wrath unusable set=1 enabled=(target.HealthPercent() > 20 and (Level() < 58 or not BuffPresent(avenging_wrath))))
Define(hand_of_reckoning 62124)
	SpellInfo(hand_of_reckoning cd=8 duration=3)
	SpellAddTargetDebuff(hand_of_reckoning hand_of_reckoning add=1)
Define(holy_avenger 105809)
	SpellInfo(holy_avenger cd=180 duration=20 gcd=0 offgcd=1)
	SpellRequire(holy_avenger unusable set=1 enabled=(not Talent(holy_avenger_talent)))
	SpellAddBuff(holy_avenger holy_avenger add=1)
Define(judgment 275779)
	SpellInfo(judgment cd=6 cd_haste=1 holypower=-1)
	SpellRequire(judgment cd set=1.5 enabled=(Talent(crusaders_judgment_talent)))
	SpellRequire(judgment charge_cd set=6 enabled=(Talent(crusaders_judgment_talent)))
	SpellRequire(judgment holypower set=-2 enabled=(Talent(sanctified_wrath_talent) and not BuffPresent(holy_avenger)))
	SpellRequire(judgment holypower set=-3 enabled=(BuffPresent(holy_avenger)))
	SpellAddTargetDebuff(judgment judgment_debuff add=1)
Define(judgment_debuff 197277)
	SpellInfo(judgment_debuff duration=15)
Define(lay_on_hands 633)
	SpellInfo(lay_on_hands cd=600)
	SpellRequire(lay_on_hands cd add=-180 enabled=(Talent(unbreakable_spirit_talent)))
	SpellRequire(lay_on_hands unusable set=1 enabled=(DebuffPresent(forbearance_debuff)))
	SpellAddDebuff(lay_on_hands forbearance_debuff add=1)
Define(moment_of_glory 327193)
	SpellInfo(moment_of_glory cd=90 duration=15)
	SpellRequire(moment_of_glory unusable set=1 enabled=(not Talent(moment_of_glory_talent)))
	SpellAddBuff(moment_of_glory moment_of_glory add=3)
	SpellAddBuff(avengers_shield moment_of_glory add=-1)
Define(rebuke 96231)
	SpellInfo(rebuke cd=15 duration=4 gcd=0 offgcd=1 interrupt=1)
Define(redoubt_buff 280375)
	SpellInfo(redoubt_buff duration=10)
	SpellAddBuff(shield_of_the_righteous redoubt_buff add=1 enabled=(Talent(redoubt_talent)))
Define(repentance 327193)
	SpellInfo(repentance cd=15)
	SpellRequire(repentance unusable set=1 enabled=(not Talent(repentance_talent)))
Define(seraphim 152262)
	SpellInfo(seraphim cd=45 duration=15 holypower=3)
	SpellRequire(seraphim unusable set=1 enabled=(not Talent(seraphim_talent)))
	SpellAddBuff(seraphim seraphim add=1)
Define(shield_of_the_righteous 53600)
	SpellInfo(shield_of_the_righteous holypower=3 cd=1 gcd=0 offgcd=1)
	SpellAddBuff(shield_of_the_righteous shield_of_the_righteous_buff add=1)
	SpellAddTargetDebuff(shield_of_the_righteous judgment_debuff set=0)
Define(shield_of_the_righteous_buff 132403)
	SpellInfo(shield_of_the_righteous_buff duration=4.5)
Define(shining_light_buff 182104)
	SpellInfo(shining_light_buff duration=30)
	SpellAddBuff(shield_of_the_righteous shining_light_buff add=1 enabled=(BuffStacks(shining_light_buff) < 4))
	SpellAddBuff(shield_of_the_righteous shining_light_buff set=0 enabled=(BuffStacks(shining_light_buff) == 4))
Define(shining_light_free_buff 327510)
	SpellInfo(shining_light_free_buff duration=30)
	SpellAddBuff(word_of_glory shining_light_free_buff set=0)
Define(turn_evil 10326)
	SpellInfo(turn_evil cd=15)
Define(word_of_glory 85673)
	SpellInfo(word_of_glory holypower=3)
	SpellRequire(word_of_glory holypower set=0 enabled=(BuffPresent(shining_light_free_buff)))
SpellList(protection_defensive_buff ardent_defender blessing_of_protection blessing_of_spellwarding divine_shield guardian_of_ancient_kings)

# Covenant Abilities
# TODO Check Venthyr and add Night Fae abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(ashen_hallow 316958)
	SpellInfo(ashen_hallow cd=240 duration=30 tick=2)
	SpellRequire(ashen_hallow unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(ashen_hallow unusable set=1 enabled=(not IsCovenant(venthyr)))
Define(divine_toll 304971)
	SpellInfo(divine_toll cd=60 holypower=-1 interrupt=1)
	SpellRequire(divine_toll holypower add=-2 enabled=(BuffPresent(holy_avenger)))
	SpellRequire(divine_toll unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(divine_toll unusable set=1 enabled=(not IsCovenant(kyrian)))
Define(vanquishers_hammer 328204)
	SpellInfo(vanquishers_hammer cd=30 duration=20 holypower=-1)
	SpellRequire(vanquishers_hammer holypower add=-2 enabled=(BuffPresent(holy_avenger)))
	SpellRequire(vanquishers_hammer unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(vanquishers_hammer unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellAddBuff(vanquishers_hammer vanquishers_hammer add=1)
	SpellAddBuff(word_of_glory shield_of_the_righteous_buff add=1 enabled=(BuffPresent(vanquishers_hammer)))
	SpellAddBuff(word_of_glory vanquishers_hammer set=0)

### Functions ###

AddFunction ProtectionInRange
{
	target.InRange(rebuke)
}

AddFunction ProtectionUseJudgment
{
	# Don't cap on Judgment charges.
	if (SpellCharges(judgment count=0) > SpellMaxCharges(judgment) - 0.2)
	{
		if (Enemies(tagged=1) == 1) Spell(judgment)
		if (Enemies(tagged=1) > 1 and DebuffCountOnAny(judgment_debuff) < Enemies(tagged=1))
		{
			if target.DebuffPresent(judgment_debuff) Spell(judgment text=cycle)
			Spell(judgment)
		}
	}
}

AddFunction ProtectionPrecombatShortCdActions
{
	PrecombatShortCdActions()
}

AddFunction ProtectionShortCdActions
{
	if (BuffPresent(shining_light_free_buff) and HealthPercent() < 50) Spell(word_of_glory)
	if (HolyPowerDeficit() <= 2)
	{
		if target.DebuffPresent(judgment_debuff) Spell(shield_of_the_righteous)
		if (BuffRemaining(shield_of_the_righteous_buff) < 9) Spell(shield_of_the_righteous)
	}
}

AddFunction ProtectionPrecombatMainActions
{
	# Opener
	Spell(avengers_shield)
}

AddFunction ProtectionMainActions
{
	# Bump Avenger's Shield in priority if the target is casting.
	if target.IsInterruptible() Spell(avengers_shield)

	if not BuffPresent(consecration_buff) Spell(consecration)
	if (Enemies(tagged=1) > 2) Spell(avengers_shield)
	Spell(vanquishers_hammer)
	ProtectionUseJudgment()
	Spell(hammer_of_wrath)
	Spell(avengers_shield)
	Spell(hammer_of_the_righteous)
	Spell(consecration)
}

AddFunction ProtectionPrecombatCdActions
{
	PrecombatCdActions()
}

AddFunction ProtectionOffensiveCdActions
{
	if (not Talent(seraphim_talent) and not BuffPresent(avenging_wrath)) Spell(avenging_wrath)
	if (Talent(seraphim_talent) and not SpellCooldown(seraphim) > 0) Spell(avenging_wrath)
	Spell(seraphim)
	Spell(holy_avenger)
	if (SpellCooldown(avengers_shield) > GCD()) Spell(moment_of_glory)
	Spell(divine_toll)
	Spell(ashen_hallow)
}

AddFunction ProtectionDefensiveCdActions
{
	if not BuffPresent(protection_defensive_buff)
	{
		Spell(ardent_defender)
		Spell(guardian_of_ancient_kings)
		if Talent(final_stand_talent) Spell(divine_shield)
		if (not Talent(blessing_of_spellwarding_talent) and IncomingPhysicalDamage(5) > 0) Spell(blessing_of_protection)
		if (Talent(blessing_of_spellwarding_talent) and IncomingMagicDamage(5) > 0) Spell(blessing_of_spellwarding)
	}
}

AddFunction ProtectionCdActions
{
	ProtectionDefensiveCdActions()
}

AddFunction ProtectionInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if focus.IsInterruptible() {
			if focus.InRange(rebuke) Spell(rebuke text=focus)
			if focus.InRange(avengers_shield) Spell(avengers_shield text=focus)
			if focus.InRange(divine_toll) Spell(divine_toll text=focus)
		}
		if not focus.Classification(worldboss)
		{
			if focus.InRange(hammer_of_justice) Spell(hammer_of_justice text=focus)
			if (focus.Distance() < 10) Spell(blinding_light text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if target.IsInterruptible() {
			if target.InRange(rebuke) Spell(rebuke)
			if target.InRange(avengers_shield) Spell(avengers_shield)
			if target.InRange(divine_toll) Spell(divine_toll)
		}
		if not target.Classification(worldboss)
		{
			if target.InRange(hammer_of_justice) Spell(hammer_of_justice)
			if (target.Distance() < 10) Spell(blinding_light)
		}
	}
	InterruptActions()
}

AddFunction ProtectionDispelActions
{
	OffensiveDispelActions()
	if player.HasDebuffType(poison disease) Spell(cleanse_toxins)
	DefensiveDispelActions()
}

AddFunction ProtectionHealActions
{
	ItemHealActions()
	# Use Lay on Hands below 25% health.
	if (HealthPercent() < 25) Spell(lay_on_hands)
}

### User Interface ###

AddIcon help=interrupt size=small
{
	ProtectionInterruptActions()
	ProtectionDispelActions()
	ProtectionHealActions()
}

AddIcon help=shortcd
{
	if not InCombat() ProtectionPrecombatShortCdActions()
	ProtectionShortCdActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() ProtectionPrecombatMainActions()
	ProtectionMainActions()
}

AddIcon help=aoe
{
	if not InCombat() ProtectionPrecombatMainActions()
	ProtectionMainActions()
}

AddIcon help=cd
{
	if not InCombat() ProtectionPrecombatCdActions()
	ProtectionCdActions()
}

AddIcon help=trinkets size=small
{
	if not ProtectionInRange() Texture(misc_arrowlup help=L(not_in_melee_range))
	ProtectionOffensiveCdActions()
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("PALADIN", "protection", name, desc, code, "script")
end