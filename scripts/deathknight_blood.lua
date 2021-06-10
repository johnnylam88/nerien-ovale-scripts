local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_deathknight_blood"
	local desc = string.format("[9.0.5] %s: Death Knight - Blood", Private.name)
	local code = [[
# Adapted from "[9.0.5] Advanced Blood Death Knight Guide for M+"
#	by Kyrasis-Stormreaver.
# https://docs.google.com/document/d/1FJlB1T8ijaQLjY_cihyoyhLoi6lYRnT-N-ipVFCLidE

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(antimagic_barrier_talent 22014)
Define(blood_tap_talent 22135)
Define(heartbreaker_talent 19165)
Define(relish_in_blood_talent 22134)
Define(tightening_grasp_talent 19226)
Define(voracious_talent 19230)

# Class Abilities
Define(antimagic_shell 48707)
	SpellInfo(antimagic_shell cd=60 offgcd=1)
	SpellRequire(antimagic_shell cd add=-20 enabled=(HasTalent(antimagic_barrier_talent)))
Define(antimagic_zone 51052)
	SpellInfo(antimagic_zone cd=120)
Define(asphyxiate 221562)
	SpellInfo(asphyxiate cd=45)
Define(blooddrinker 206931)
	SpellInfo(blooddrinker runes=1 runicpower=-10 cd=30 channel=3 tick=1)
	SpellRequire(blooddrinker unusable set=1 enabled=(not HasTalent(blooddrinker_talent)))
Define(blooddrinker_talent 19166)
Define(blood_boil 50842)
	SpellInfo(blood_boil cd=7.5)
Define(blood_plague_debuff 55078)
	SpellInfo(blood_plague_debuff duration=24)
	SpellAddTargetDebuff(blood_boil blood_plague_debuff add=1)
Define(blood_tap 221699)
	SpellInfo(blood_tap cd=0.5 charge_cd=60 runes=-1)
	SpellRequire(blood_tap unusable set=1 enabled=(not HasTalent(blood_tap_talent)))
Define(bone_shield 195181)
	SpellInfo(bone_shield duration=30 max_stacks=10)
	SpellAddBuff(dancing_rune_weapon bone_shield add=5 enabled=(EquippedRuneforge(crimson_rune_weapon_runeforge)))
	SpellAddBuff(marrowrend bone_shield add=3)
	SpellAddBuff(tombstone bone_shield add=-5)
Define(bonestorm 194844)
	SpellInfo(bonestorm runicpower=10 cd=60)
	SpellRequire(bonestorm unusable set=1 enabled=(not HasTalent(bonestorm_talent)))
Define(bonestorm_talent 21209)
Define(consumption 274156)
	SpellInfo(consumption cd=30)
	SpellRequire(consumption unusable set=1 enabled=(not HasTalent(consumption_talent)))
Define(consumption_talent 19220)
Define(crimson_scourge_buff 81141)
	SpellInfo(crimson_scourge_buff duration=15)
	SpellAddBuff(death_and_decay crimson_scourge_buff set=0)
	SpellRequire(death_and_decay runes set=0 enabled=(BuffPresent(crimson_scourge_buff)))
	SpellRequire(death_and_decay runicpower set=0 enabled=(BuffPresent(crimson_scourge_buff) and not HasTalent(relish_in_blood_talent)))
	SpellRequire(death_and_decay runicpower add=-10 enabled=(BuffPresent(crimson_scourge_buff) and HasTalent(relish_in_blood_talent)))
	SpellAddBuff(deaths_due crimson_scourge_buff set=0)
	SpellRequire(deaths_due runes set=0 enabled=(BuffPresent(crimson_scourge_buff)))
	SpellRequire(deaths_due runicpower set=0 enabled=(BuffPresent(crimson_scourge_buff) and not HasTalent(relish_in_blood_talent)))
	SpellRequire(deaths_due runicpower add=-10 enabled=(BuffPresent(crimson_scourge_buff) and HasTalent(relish_in_blood_talent)))
Define(dancing_rune_weapon 49028)
	SpellInfo(dancing_rune_weapon cd=120)
Define(dancing_rune_weapon_buff 81256)
	SpellInfo(dancing_rune_weapon_buff duration=8)
	SpellAddBuff(dancing_rune_weapon dancing_rune_weapon_buff add=1)
Define(death_and_decay 43265)
	SpellInfo(death_and_decay runes=1 runicpower=-10 cd=30)
Define(death_coil 47541)
Define(death_and_decay_buff 188290)
	SpellInfo(death_and_decay_buff duration=10 tick=1)
	SpellAddBuff(death_and_decay death_and_decay_buff add=1)
Define(deaths_due_buff 324165)
	SpellInfo(deaths_due_buff duration=12 tick=1)
Define(deaths_due_debuff 324164)
	SpellInfo(deaths_due_debuff duration=12)
	SpellAddTargetDebuff(deaths_due deaths_due_debuff add=1)
Define(death_grip 49576)
	SpellInfo(death_grip cd=25)
Define(death_strike 49998)
	SpellInfo(death_strike runicpower=45)
	SpellRequire(death_strike runicpower add=-5 enabled=(SpellKnown(ossuary) and BuffStacks(bone_shield) >= 5))
Define(gorefiends_grasp 108199)
	SpellInfo(gorefiends_grasp cd=120)
	SpellRequire(gorefiends_grasp cd add=-30 enabled=(HasTalent(tightening_grasp_talent)))
Define(heart_strike 206930)
	SpellInfo(heart_strike runes=1 runicpower=-10)
	SpellRequire(heart_strike runicpower add=-5 enabled=(Level() >= 23))
	SpellRequire(heart_strike runicpower add=-2 enabled=(HasTalent(heartbreaker_talent)))
Define(hemostasis_buff 273947)
	SpellInfo(hemostasis_buff duration=15 max_stacks=5)
	SpellAddBuff(death_strike hemostasis_buff set=0)
Define(icebound_fortitude 48792)
	SpellInfo(icebound_fortitude cd=180 offgcd=1)
Define(mark_of_blood 206940)
	SpellInfo(mark_of_blood cd=6 duration=15)
	SpellAddTargetDebuff(mark_of_blood mark_of_blood add=1)
Define(marrowrend 195182)
	SpellInfo(marrowrend runes=2 runicpower=-20)
Define(mind_freeze 47528)
	SpellInfo(mind_freeze cd=15 gcd=0 offgcd=1 interrupt=1)
Define(ossuary 219786)
Define(raise_dead 46585)
	SpellInfo(raise_dead cd=120 duration=60 totem=1 gcd=0 offgcd=1)
	SpellRequire(raise_dead unusable set=1 enabled=(pet.Present()))
Define(rune_tap 194679)
	SpellInfo(rune_tap cd=25 offgcd=1 runes=1 runicpower=-10 duration=4)
Define(sacrificial_pact 327574)
	SpellInfo(sacrificial_pact runicpower=20 cd=120)
    SpellRequire(sacrificial_pact unusable set=1 enabled=(TotemExpires(raise_dead)))
Define(tombstone 219809)
	SpellInfo(tombstone cd=60)
	SpellRequire(tombstone unusable set=1 enabled=(not HasTalent(tombstone_talent)))
Define(tombstone_talent 23454)
Define(vampiric_blood 55233)
	SpellInfo(vampiric_blood cd=90 gcd=0 offgcd=1)

# Covenant Abilities
Define(abomination_limb 315443)
	SpellInfo(abomination_limb cd=120 duration=12 tick=1)
	SpellAddBuff(abomination_limb abomination_limb add=1)
	SpellAddBuff(abomination_limb bone_shield add=3)
	SpellRequire(abomination_limb unusable set=1 enabled=(not IsCovenant(necrolord)))
Define(deaths_due 324128)
	SpellInfo(deaths_due cd=30 runes=1 runicpower=-10)
	SpellRequire(deaths_due unusable set=1 enabled=(not IsCovenant(night_fae)))
	SpellRequire(death_and_decay replaced_by set=deaths_due enabled=(IsCovenant(night_fae) and SpellKnown(deaths_due)))
Define(shackle_the_unworthy 312202)
	SpellInfo(shackle_the_unworthy cd=60)
	SpellRequire(shackle_the_unworthy unusable set=1 enabled=(not IsCovenant(kyrian)))
Define(swarming_mist 311648)
	SpellInfo(swarming_mist cd=60 runes=1 runicpower=-10 duration=8 tick=1)
	SpellRequire(swarming_mist unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddBuff(swarming_mist swarming_mist add=1)

# Runeforge Legendary Effects
Define(bryndaors_might_runeforge 6940)
Define(crimson_rune_weapon_runeforge 6941)

### Functions ###

AddFunction BloodInRange
{
	target.InRange(death_strike)
}

AddFunction BloodHasPooledForBonestorm
{
	# Bonestorm only with 3+ targets and Runic Power is above 90 for full healing ticks.
	HasTalent(bonestorm_talent) and not SpellCooldown(bonestorm) > 0 and Enemies(tagged=1) >= 3 and RunicPower() > 90
}

AddFunction BloodIsPoolingForBonestorm
{
	# Begin pooling for Bonestorm when it is down to 3 seconds left on the cooldown.
	HasTalent(bonestorm_talent) and SpellCooldown(bonestorm) < 3 and Enemies(tagged=1) >= 3 and not RunicPower() > 90
}

AddFunction BloodDeathStrikeMinHealing
{
	MaxHealth() * (7 + 3 * HasTalent(voracious_talent)) / 100
}

AddFunction BloodDeathStrikeBaseHealing
{
	if (IncomingDamage(5) / 4 > BloodDeathStrikeMinHealing()) (IncomingDamage(5) / 4)
	BloodDeathStrikeMinHealing()
}

AddFunction BloodDeathStrikeHealing
{
	# Death Strike healing is increased by both Voracious and Hemostatis talents.
	BloodDeathStrikeBaseHealing() * ((100 + 20 * HasTalent(voracious_talent)) / 100) * ((100 + 8 * BuffStacks(hemostasis_buff)) / 100)
}

AddFunction BloodHeartStrikeMaxTargets
{
	# Heart Strike hits 2 targets, but up to 5 targets if player is standing in Death and Decay.
	2 + 3 * BuffPresent(death_and_decay_buff)
}

AddFunction BloodHeartStrikeTargets
{
	# Return the number of targets that Heart Strike can hit.
	if (Enemies(tagged=1) <= BloodHeartStrikeMaxTargets()) Enemies(tagged=1)
	BloodHeartStrikeMaxTargets()
}

AddFunction BloodHeartStrikeRunicPower
{
	# Return the amount of runic power generated by Heart Strike.
	if (Level() < 23) (10 + HasTalent(heartbreaker_talent) * 2 * BloodHeartStrikeTargets())
	15 + HasTalent(heartbreaker_talent) * 2 * BloodHeartStrikeTargets()
}

AddFunction BloodOssuaryThreshold
{
	# Return the number of Bone Shield charges at which we should Marrowrend to maintain Ossuary.
	# Marrowrend if below 8 stacks of Bone Shield (7 stacks with Crimson Rune Weapon).
	# Bone Shield loses 1 stack every 2.5 seconds with incoming physical damage.
	# Keep Bone Shield stacks low when Dancing Rune Weapon (with Crimson Rune Weapon) or Abomination Limb is coming off cooldown.
	if (BuffPresent(dancing_rune_weapon_buff) or BuffRemaining(abomination_limb) > 6) (5)
	if (EquippedRuneforge(crimson_rune_weapon_runeforge) and SpellCooldown(dancing_rune_weapon) / 2.5 < 3) (4 + SpellCooldown(dancing_rune_weapon) / 2.5)
	if (IsCovenant(necrolord) and SpellCooldown(abomination_limb) / 2.5 < 3) (4 + SpellCooldown(abomination_limb) / 2.5)
	if EquippedRuneforge(crimson_rune_weapon_runeforge) (7)
	8
}

AddFunction BloodPrecombatShortCdActions
{
	PrecombatShortCdActions()
	# Only Rune Tap if Bone Shield is down or about to expire.
	if (BuffExpires(rune_tap) and BuffRemaining(bone_shield) < BaseDuration(rune_tap)) Spell(rune_tap)
}

AddFunction BloodShortCdActions
{
	if Rune() < 3
	{
		# Blood Tap if you have 2 charges, or are less than 5 seconds away from 2 charges of Blood Tap, and you have less than 3 Runes.
		if (Charges(blood_tap count=0) > 1.9) Spell(blood_tap)
		# Bank 2nd charge of Blood Tap unless healing is needed.
		if (HealthPercent() <= 60)
		{
			# Blood Tap if you have less than 3 Runes and less than 63 RP (57 RP with Bryndaor’s Might equipped).
			if (not EquippedRuneforge(bryndaors_might_runeforge) and RunicPower() < 63) Spell(blood_tap)
			if (    EquippedRuneforge(bryndaors_might_runeforge) and RunicPower() < 57) Spell(blood_tap)
		}
	}
	# (Venthyr) Swarming Mist with less than 67 RP (61 RP with Bryndaor’s Might equipped).
	if (not EquippedRuneforge(bryndaors_might_runeforge) and RunicPower() < 67) Spell(swarming_mist)
	if (EquippedRuneforge(bryndaors_might_runeforge) and RunicPower() < 61) Spell(swarming_mist)
	# (Kyrian) Shackle the Unworthy (with Combat Meditation enabled).
	Spell(shackle_the_unworthy)

	unless
		((BuffRemaining(bone_shield) < GCD() + 2) and Spell(marrowrend)) or
		((DebuffCountOnAny(blood_plague_debuff) < Enemies(tagged=1) or target.DebuffRefreshable(blood_plague_debuff)) and
			((BuffExpires(swarming_mist) and BuffExpires(abomination_limb)) and Spell(blood_boil))) or
		((3 < BuffRemaining(deaths_due_buff) and BuffRemaining(deaths_due_buff) < 5) and Spell(deaths_due)) or
		((3 < target.DebuffRemaining(deaths_due_debuff) and target.DebuffRemaining(deaths_due_debuff) < 5) and Spell(deaths_due)) or
		(BuffPresent(death_and_decay_buff) and
			(((BuffRemaining(deaths_due_buff) < 3 or target.DebuffRemaining(deaths_due_debuff) < 3) and Spell(heart_strike)) or
			 (BuffRemaining(death_and_decay_buff) < 3 and
				(((BuffRemaining(deaths_due_buff) - BuffRemaining(death_and_decay_buff) < 9) and Spell(heart_strike)) or
				 ((target.DebuffRemaining(deaths_due_debuff) - BuffRemaining(death_and_decay_buff) < 9) and Spell(heart_strike)))))) or
		(BloodHasPooledForBonestorm() and Spell(bonestorm)) or
		((not BloodIsPoolingForBonestorm() and RunicPowerDeficit() < 20) and Spell(death_strike)) or
		((BuffStacks(bone_shield) < BloodOssuaryThreshold()) and Spell(marrowrend))
	{
		# (Night Fae) Death and Decay
		Spell(deaths_due)

		unless ((TimeToRunes(3) < GCD()) and Spell(heart_strike))
		{
			# Death and Decay when Crimson Scourge procs with 3+ targets.
			if (BuffExpires(dancing_rune_weapon_buff) and BuffPresent(crimson_scourge_buff) and Enemies(tagged=1) >= 3) Spell(death_and_decay)

			unless
				((Charges(blood_boil) >= 1.8 and BuffStacks(hemostasis_buff) < 5) and Spell(blood_boil)) or
				((EquippedRuneforge(crimson_rune_weapon_runeforge) and BuffPresent(dancing_rune_weapon_buff)) and Spell(heart_strike)) or
				((Rune() >= 3) and Spell(heart_strike)) or
				((BuffStacks(bone_shield) >= 8 and BuffRemaining(bone_shield) >= 7.5) and
				 ((not IsCovenant(night_fae) and Rune() >= 2) or
				  ((BuffPresent(dancing_rune_weapon_buff) and RunicPowerDeficit() > 50) and Spell(heart_strike)) or
				  ((BuffExpires(dancing_rune_weapon_buff) and BuffPresent(death_and_decay_buff) and Enemies(tagged=1) >= 3 and RunicPowerDeficit() > 40) and Spell(heart_strike)))) or
				((BuffStacks(hemostasis_buff) < 5) and Spell(blood_boil))
			{
				# Death and Decay when Crimson Scourge procs.
				if (BuffExpires(dancing_rune_weapon_buff) and BuffPresent(crimson_scourge_buff))
				{
					Spell(deaths_due)
					Spell(death_and_decay)
				}
			}
		}
	}
	# [*] (Necrolord) Fleshcraft.
	Spell(fleshcraft)
}

AddFunction BloodPrecombatMainActions
{
	# [*] Blooddrinker when closing with the boss on the opener.
	if BuffExpires(dancing_rune_weapon_buff) Spell(blooddrinker)
	if (BuffRemaining(bone_shield) < GCD() + 2)
	{
		if not EquippedRuneforge(crimson_rune_weapon_runeforge) Spell(marrowrend)
		# [*] Skip Marrowrend with Crimson Rune Weapon if Dancing Rune Weapon is available out of combat.
		if (EquippedRuneforge(crimson_rune_weapon_runeforge) and SpellCooldown(dancing_rune_weapon) > 0) Spell(marrowrend)
	}
}

AddFunction BloodMainActions
{
	if (HealthPercent() <= 60)
	{
		if (Enemies(tagged=1) >= 3)
		{
			# [*] Bonestorm if you are below 60% health.
			if BloodHasPooledForBonestorm() Spell(bonestorm)
			# [*] Consumption with 3+ targets.
			Spell(consumption)
		}
		# Death Strike if you are below 60% Health.
		if (not BloodIsPoolingForBonestorm() and BloodDeathStrikeHealing() <= HealthMissing()) Spell(death_strike)
	}
	# Marrowrend if Bone Shield is not active or about to expire.
	if (BuffRemaining(bone_shield) < GCD() + 2) Spell(marrowrend)
	# Blood Boil if a target does not have Blood Plague and (Venthyr) Swarming Mist or (Necrolord) Abomination Limb is not active.
	if DebuffCountOnAny(blood_plague_debuff) < Enemies(tagged=1) or target.DebuffRefreshable(blood_plague_debuff)
	{
		if (BuffExpires(swarming_mist) and BuffExpires(abomination_limb)) Spell(blood_boil)
	}
	# (Night Fae) Death and Decay when the duration of the Death’s Due buff/debuff is about to expire, but with enough remaining time to Heart Strike.
	if (3 < BuffRemaining(deaths_due_buff) and BuffRemaining(deaths_due_buff) < 5) Spell(deaths_due)
	if (3 < target.DebuffRemaining(deaths_due_debuff) and target.DebuffRemaining(deaths_due_debuff) < 5) Spell(deaths_due)
	# (Night Fae) Heart Strike:
	#   while in Death and Decay when the duration of the Death’s Due buff/debuff is about to expire or
	#   (the duration of our Death and Decay ground effect is about to expire and
	#       the Death’s Due buff/debuff won’t outlast the Death and Decay by at least ~9 seconds).
	if BuffPresent(death_and_decay_buff)
	{
		if (BuffRemaining(deaths_due_buff) < 3 or target.DebuffRemaining(deaths_due_debuff) < 3) Spell(heart_strike)
		if BuffRemaining(death_and_decay_buff) < 3
		{
			if (BuffRemaining(deaths_due_buff) - BuffRemaining(death_and_decay_buff) < 9) Spell(heart_strike)
			if (target.DebuffRemaining(deaths_due_debuff) - BuffRemaining(death_and_decay_buff) < 9) Spell(heart_strike)
		}
	}
	# [*] Use Bonestorm if we have pooled enough Runic Power.
	if BloodHasPooledForBonestorm() Spell(bonestorm)
	# Death Strike when Runic Power is above 105 (121 with Rune of Hysteria).
	if (not BloodIsPoolingForBonestorm() and RunicPowerDeficit() < 20) Spell(death_strike)
	# Marrowrend if below 8 stacks of Bone Shield (7 stacks with Crimson Rune Weapon).
	if (BuffStacks(bone_shield) < BloodOssuaryThreshold()) Spell(marrowrend)
	# Heart Strike with, or when 1.5 second away from, having more than 3 Runes.
	if (TimeToRunes(3) < GCD()) Spell(heart_strike)
	# Blood Boil with 2 charges and less than 5 stacks of Hemostasis.
	if (Charges(blood_boil) >= 1.8 and BuffStacks(hemostasis_buff) < 5) Spell(blood_boil)
	# [*] Heart Strike with Crimson Rune Weapon and Dancing Rune Weapon is active.
	# [*] This depletes runes ahead of gaining 40% increased rune regeneration for 10s after Dancing Rune Weapon expires.
	if (EquippedRuneforge(crimson_rune_weapon_runeforge) and BuffPresent(dancing_rune_weapon_buff)) Spell(heart_strike)
	# Heart Strike with 3 Runes.
	if (Rune() >= 3) Spell(heart_strike)
	# Heart Strike with:
	#   ((not Night Fae and with 2 runes) or
	#    ([Dancing Rune Weapon] and less than 76 RP (86 RP with [Rune of Hysteria])) or
	#    ([Death and Decay] with 3+ targets without [Dancing Rune Weapon] and less than 81 RP (92 RP with [Rune of Hysteria])))
	#   and 8+ stacks of Bone Shield and 7.5+ seconds left of Bone Shield duration.
	if (BuffStacks(bone_shield) >= 8 and BuffRemaining(bone_shield) >= 7.5)
	{
		if (not IsCovenant(night_fae) and Rune() >= 2) Spell(heart_strike)
		if (BuffPresent(dancing_rune_weapon_buff) and RunicPowerDeficit() > 50) Spell(heart_strike)
		if (BuffExpires(dancing_rune_weapon_buff) and BuffPresent(death_and_decay_buff) and Enemies(tagged=1) >= 3 and RunicPowerDeficit() > 40) Spell(heart_strike)
	}
	# Blood Boil with 1 charge and less than 5 stacks of Hemostasis.
	if (BuffStacks(hemostasis_buff) < 5) Spell(blood_boil)
	# [*] Fillers that don't consume Runes or Runic Power.
	if (target.DebuffExpires(mark_of_blood) and target.IsTargetingPlayer()) Spell(mark_of_blood)
	if BuffExpires(dancing_rune_weapon_buff) Spell(blooddrinker)
	Spell(consumption)
}

AddFunction BloodPrecombatCdActions
{
	PrecombatCdActions()
	Spell(abomination_limb)
	Spell(dancing_rune_weapon)
	Spell(raise_dead)
}

AddFunction BloodOffensiveCdActions
{
	if BuffExpires(dancing_rune_weapon_buff)
	{
		Spell(abomination_limb)
		Spell(dancing_rune_weapon)
		Spell(raise_dead)
		# Sacrifice ghoul with at least 5 enemies or 15 seconds left.
		if (Enemies(tagged=1) >= 5 or TotemRemaining(raise_dead) < 15) Spell(sacrificial_pact)
	}
}

AddFunction BloodDefensiveCdActions
{
	if (IncomingMagicDamage(1.5) > 0) Spell(antimagic_shell)
	if (BuffStacks(bone_shield) >= 6) Spell(tombstone)

	Spell(dancing_rune_weapon)
	# (Necrolord) Abomination Limb if below 6 stacks of Bone Shield or for threat generation.
	if (BuffExpires(dancing_rune_weapon_buff) and BuffStacks(bone_shield) < 6) Spell(abomination_limb)
	Spell(vampiric_blood)
	Spell(icebound_fortitude)
	if (IncomingMagicDamage(1.5) > 0) Spell(antimagic_zone)
	# Only suggest Rune Tap if Heart Strike won't grant enough Runic Power
	# for a Death Strike heal.
	if (BuffExpires(rune_tap) and RunicPower() < RunicPowerCost(death_strike) - BloodHeartStrikeRunicPower()) Spell(rune_tap)
}

AddFunction BloodCdActions
{
	BloodDefensiveCdActions()
}

AddFunction BloodInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if (focus.InRange(mind_freeze) and focus.IsInterruptible()) Spell(mind_freeze text=focus)
		if not focus.Classification(worldboss)
		{
			if focus.InRange(asphyxiate) Spell(asphyxiate text=focus)
			if focus.InRange(death_grip) Spell(death_grip text=focus)
			if (focus.Distance() < 15) Spell(gorefiends_grasp text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if (target.InRange(mind_freeze) and target.IsInterruptible()) Spell(mind_freeze)
		if not target.Classification(worldboss)
		{
			if target.InRange(asphyxiate) Spell(asphyxiate)
			if target.InRange(death_grip) Spell(death_grip)
			if (target.Distance() < 15) Spell(gorefiends_grasp)
		}
	}
	InterruptActions()
}

AddFunction BloodDispelActions
{
	OffensiveDispelActions()
	DefensiveDispelActions()
}

AddFunction BloodHealActions
{
	ItemHealActions()
}

### User Interface ###

AddIcon help=interrupt size=small
{
	BloodInterruptActions()
	BloodDispelActions()
	BloodHealActions()
}

AddIcon help=shortcd
{
	if not InCombat() BloodPrecombatShortCdActions()
	BloodShortCdActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() BloodPrecombatMainActions()
	BloodMainActions()
}

AddIcon help=aoe
{
	if not InCombat() BloodPrecombatMainActions()
	BloodMainActions()
}

AddIcon help=cd
{
	if not InCombat() BloodPrecombatCdActions()
	BloodCdActions()
}

AddIcon help=trinkets size=small
{
	BloodOffensiveCdActions()
	if not BloodInRange() Texture(misc_arrowlup help=L(not_in_melee_range))
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("DEATHKNIGHT", "blood", name, desc, code, "script")
end