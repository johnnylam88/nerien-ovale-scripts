local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_deathknight_blood"
	local desc = string.format("[9.2] %s: Death Knight - Blood", Private.name)
	local code = [[
# Adapted from "[9.2] Advanced Blood Death Knight Guide for M+"
#	by Kyrasis-Stormreaver.
# https://docs.google.com/document/d/1FJlB1T8ijaQLjY_cihyoyhLoi6lYRnT-N-ipVFCLidE

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(antimagic_barrier_talent 22014)
Define(blooddrinker_talent 19166)
Define(blood_tap_talent 22135)
Define(bonestorm_talent 21209)
Define(consumption_talent 19220)
Define(heartbreaker_talent 19165)
Define(hemostasis_talent 19219)
Define(red_thirst_talent 21208)
Define(relish_in_blood_talent 22134)
Define(tightening_grasp_talent 19226)
Define(tombstone_talent 23454)
Define(voracious_talent 19230)

# Class Abilities
Define(antimagic_shell 48707)
	SpellInfo(antimagic_shell cd=60 offgcd=1)
	SpellRequire(antimagic_shell cd add=-20 enabled=(Talent(antimagic_barrier_talent)))
Define(antimagic_zone 51052)
	SpellInfo(antimagic_zone cd=120)
Define(asphyxiate 221562)
	SpellInfo(asphyxiate cd=45)
Define(blooddrinker 206931)
	SpellInfo(blooddrinker runes=1 runicpower=-10 cd=30 channel=3 tick=1)
	SpellRequire(blooddrinker unusable set=1 enabled=(not Talent(blooddrinker_talent)))
Define(blood_boil 50842)
	SpellInfo(blood_boil cd=7.5)
Define(blood_plague_debuff 55078)
	SpellInfo(blood_plague_debuff duration=24)
	SpellAddTargetDebuff(blood_boil blood_plague_debuff add=1)
Define(blood_tap 221699)
	SpellInfo(blood_tap cd=0.5 charge_cd=60 runes=-1)
	SpellRequire(blood_tap unusable set=1 enabled=(not Talent(blood_tap_talent)))
Define(bone_shield 195181)
	SpellInfo(bone_shield duration=30 max_stacks=10)
	SpellAddBuff(dancing_rune_weapon bone_shield add=5 enabled=(EquippedRuneforge(crimson_rune_weapon_runeforge)))
	SpellAddBuff(marrowrend bone_shield add=3)
	SpellAddBuff(tombstone bone_shield add=-5)
Define(bonestorm 194844)
	SpellInfo(bonestorm runicpower=10 cd=60)
	SpellRequire(bonestorm unusable set=1 enabled=(not Talent(bonestorm_talent)))
Define(consumption 274156)
	SpellInfo(consumption cd=30)
	SpellRequire(consumption unusable set=1 enabled=(not Talent(consumption_talent)))
Define(crimson_scourge_buff 81141)
	SpellInfo(crimson_scourge_buff duration=15)
Define(dancing_rune_weapon 49028)
	SpellInfo(dancing_rune_weapon cd=120)
Define(dancing_rune_weapon_buff 81256)
	SpellInfo(dancing_rune_weapon_buff duration=8)
	SpellAddBuff(dancing_rune_weapon dancing_rune_weapon_buff add=1)
Define(death_and_decay 43265)
	SpellInfo(death_and_decay runes=1 runicpower=-10 cd=30)
	SpellRequire(death_and_decay runes set=0 enabled=(BuffPresent(crimson_scourge_buff)))
	SpellRequire(death_and_decay runicpower set=0 enabled=(BuffPresent(crimson_scourge_buff) and not Talent(relish_in_blood_talent)))
	SpellRequire(death_and_decay runicpower add=-10 enabled=(BuffPresent(crimson_scourge_buff) and Talent(relish_in_blood_talent)))
	SpellAddBuff(death_and_decay crimson_scourge_buff set=0)
Define(death_coil 47541)
Define(death_and_decay_buff 188290)
	SpellInfo(death_and_decay_buff duration=10 tick=1)
	SpellAddBuff(death_and_decay death_and_decay_buff add=1)
Define(death_grip 49576)
	SpellInfo(death_grip cd=25)
Define(death_strike 49998)
	SpellInfo(death_strike runicpower=45)
	SpellRequire(death_strike runicpower add=-5 enabled=(SpellKnown(ossuary) and BuffStacks(bone_shield) >= 5))
Define(gorefiends_grasp 108199)
	SpellInfo(gorefiends_grasp cd=120)
	SpellRequire(gorefiends_grasp cd add=-30 enabled=(Talent(tightening_grasp_talent)))
Define(heart_strike 206930)
	SpellInfo(heart_strike runes=1 runicpower=-10)
	SpellRequire(heart_strike runicpower add=-5 enabled=(Level() >= 23))
	SpellRequire(heart_strike runicpower add=-2 enabled=(Talent(heartbreaker_talent)))
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
	SpellRequire(tombstone unusable set=1 enabled=(not Talent(tombstone_talent)))
Define(vampiric_blood 55233)
	SpellInfo(vampiric_blood cd=90 gcd=0 offgcd=1)
SpellList(blood_defensive_buff icebound_fortitude rune_tap fleshcraft)

# Covenant Abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(abomination_limb 315443)
	SpellInfo(abomination_limb cd=120 duration=12 tick=1)
	SpellAddBuff(abomination_limb abomination_limb add=1)
	SpellAddBuff(abomination_limb bone_shield add=3)
	SpellRequire(abomination_limb unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(abomination_limb unusable set=1 enabled=(not IsCovenant(necrolord)))
Define(deaths_due 324128)
	SpellInfo(deaths_due cd=30 runes=1 runicpower=-10)
	SpellRequire(deaths_due unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(deaths_due unusable set=1 enabled=(not IsCovenant(night_fae)))
	SpellRequire(death_and_decay replaced_by set=deaths_due enabled=(IsCovenant(night_fae) and SpellKnown(deaths_due)))
	SpellRequire(deaths_due runes set=0 enabled=(BuffPresent(crimson_scourge_buff)))
	SpellRequire(deaths_due runicpower set=0 enabled=(BuffPresent(crimson_scourge_buff) and not Talent(relish_in_blood_talent)))
	SpellRequire(deaths_due runicpower add=-10 enabled=(BuffPresent(crimson_scourge_buff) and Talent(relish_in_blood_talent)))
	SpellAddBuff(deaths_due crimson_scourge_buff set=0)
Define(deaths_due_buff 324165)
	SpellInfo(deaths_due_buff duration=12 tick=1)
	SpellAddBuff(heart_strike deaths_due_buff add=1 enabled=(IsCovenant(night_fae) and BuffPresent(death_and_decay_buff)))
Define(deaths_due_debuff 324164)
	SpellInfo(deaths_due_debuff duration=12)
	SpellAddTargetDebuff(deaths_due deaths_due_debuff add=1)
	SpellAddTargetDebuff(heart_strike deaths_due_debuff add=1 enabled=(IsCovenant(night_fae) and BuffPresent(death_and_decay_buff)))
Define(shackle_the_unworthy 312202)
	SpellInfo(shackle_the_unworthy cd=60)
	SpellRequire(shackle_the_unworthy unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(shackle_the_unworthy unusable set=1 enabled=(not IsCovenant(kyrian)))
Define(swarming_mist 311648)
	SpellInfo(swarming_mist cd=60 runes=1 runicpower=-10 duration=8 tick=1)
	SpellRequire(swarming_mist unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(swarming_mist unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddBuff(swarming_mist swarming_mist add=1)

# Runeforge Legendary Effects
Define(bryndaors_might_runeforge 6940)
Define(crimson_rune_weapon_runeforge 6941)

### Functions ###

AddFunction BloodInRange {
	target.InRange(death_strike)
}

AddFunction BloodHasPooledForBonestorm {
	# Bonestorm only with 3+ targets and Runic Power is above 90 for full healing ticks.
	Talent(bonestorm_talent) and not SpellCooldown(bonestorm) > 0 and Enemies(tagged=1) >= 3 and RunicPower() > 90
}

AddFunction BloodIsPoolingForBonestorm {
	# Begin pooling for Bonestorm when it is down to 3 seconds left on the cooldown.
	Talent(bonestorm_talent) and SpellCooldown(bonestorm) < 3 and Enemies(tagged=1) >= 3 and not RunicPower() > 90
}

AddFunction BloodDeathStrikeMinHealing {
	MaxHealth() * (7 + 3 * Talent(voracious_talent)) / 100
}

AddFunction BloodDeathStrikeBaseHealing {
	if (IncomingDamage(5) / 4 > BloodDeathStrikeMinHealing()) (IncomingDamage(5) / 4)
	BloodDeathStrikeMinHealing()
}

AddFunction BloodDeathStrikeHealing {
	# Death Strike healing is increased by both Voracious and Hemostatis talents.
	BloodDeathStrikeBaseHealing() * ((100 + 20 * Talent(voracious_talent)) / 100) * ((100 + 8 * BuffStacks(hemostasis_buff)) / 100)
}

AddFunction BloodHeartStrikeMaxTargets {
	# Heart Strike hits 2 targets, but up to 5 targets if player is standing in Death and Decay.
	2 + 3 * BuffPresent(death_and_decay_buff)
}

AddFunction BloodHeartStrikeTargets {
	# Return the number of targets that Heart Strike can hit.
	if (Enemies(tagged=1) <= BloodHeartStrikeMaxTargets()) Enemies(tagged=1)
	BloodHeartStrikeMaxTargets()
}

AddFunction BloodHeartStrikeRunicPower {
	# Return the amount of runic power generated by Heart Strike.
	-1 * RunicPowerCost(heart_strike) + Talent(heartbreaker_talent) * 2 * BloodHeartStrikeTargets()
}

AddFunction BloodPriorityHealActions {
	if (HealthPercent() < 70) {
		if (Enemies(tagged=1) >= 3) {
			if BloodHasPooledForBonestorm() Spell(bonestorm)
			Spell(consumption text=heal)
		}
		if (not BloodIsPoolingForBonestorm() and BloodDeathStrikeHealing() <= HealthMissing()) Spell(death_strike text=heal)
	}
}

AddFunction BloodCoreMainActions {
	if (BuffRemaining(bone_shield) < 5 or BuffStacks(bone_shield) < 3) Spell(marrowrend)
	if (Enemies(tagged=1) == 1 and BuffRemaining(bone_shield) < 25 and target.TimeToDie() < 5) Spell(marrowrend text=next)
	Spell(blooddrinker)
	if (DebuffCountOnAny(blood_plague_debuff) < Enemies(tagged=1) or target.DebuffRefreshable(blood_plague_debuff)) Spell(blood_boil text=dot)
	if (IsCovenant(night_fae) and BuffPresent(death_and_decay_buff)) {
		if (BuffRemaining(deaths_due_buff) < 2 * GCD()) Spell(heart_strike text=buff)
		if (BuffRemaining(death_and_decay_buff) < 4) Spell(heart_strike text=buff)
	}
	if (Enemies(tagged=1) == 1) {
		if (RunicPowerDeficit() < 20) Spell(death_strike text=dmg)
	}
	unless BuffPresent(abomination_limb) {
		if (IsCovenant(necrolord) and SpellCooldown(abomination_limb) > 3) {
			if (BuffStacks(bone_shield) < 6) Spell(marrowrend)
		}
		if EquippedRuneforge(crimson_rune_weapon_runeforge) {
			if (BuffStacks(bone_shield) < 6 and SpellCooldown(dancing_rune_weapon) < 60) Spell(marrowrend)
		}
		unless EquippedRuneforge(crimson_rune_weapon_runeforge) {
			if (BuffStacks(bone_shield) < 8) Spell(marrowrend)
		}
	}
	if EquippedRuneforge(crimson_rune_weapon_runeforge) {
		if (BuffStacks(bone_shield) > 6 and SpellCooldown(dancing_rune_weapon) > 25 + GCD()) {
			if (Rune() > 1) Spell(tombstone)
		}
	}
	if (TimeToRunes(4) < GCD()) Spell(heart_strike text=rune)
	if (Talent(hemostasis_talent) and BuffStacks(hemostasis_buff) < 5 and Charges(blood_boil count=0) > SpellMaxCharges(blood_boil) - 0.2) Spell(blood_boil text=cap)
	if (Rune() >= 3) Spell(heart_strike text=rune)
	if (BuffStacks(bone_shield) >= 6 and BuffRemaining(bone_shield) > 4.5 and SpellCooldown(dancing_rune_weapon) > 10) {
		if IsCovenant(night_fae) {
			if BuffPresent(death_and_decay_buff) Spell(heart_strike)
		}
		unless IsCovenant(night_fae) {
			Spell(heart_strike)
		}
	}
	if (Talent(hemostasis_talent) and BuffStacks(hemostasis) < 5) Spell(blood_boil)
	if (Charges(blood_boil count=0) > SpellMaxCharges(blood_boil) - 0.2) Spell(blood_boil text=cap)
	if (RunicPowerDeficit() < 20) Spell(death_strike text=cap)
}

AddFunction BloodCoreShortCdActions {
	unless (
		(BuffRemaining(bone_shield) < 5 or BuffStacks(bone_shield) < 3 and Spell(marrowrend)) or
		(Enemies(tagged=1) == 1 and BuffRemaining(bone_shield) < 25 and target.TimeToDie() < 5 and Spell(marrowrend)) or
		Spell(blooddrinker)
	) {
		if EquippedRuneforge(bryndaors_might_runeforge) {
			if (RunicPowerDeficit() > 63) Spell(swarming_mist)
		}
		unless EquippedRuneforge(bryndaors_might_runeforge) {
			if (RunicPowerDeficit() > 57) Spell(swarming_mist)
		}

		unless (
			(DebuffCountOnAny(blood_plague_debuff) < Enemies(tagged=1) or target.DebuffRefreshable(blood_plague_debuff)) and Spell(blood_boil)
		) {
			if (Rune() < 3) Spell(shackle_the_unworthy)
			if IsCovenant(night_fae) {
				if (2 * GCD() < BuffRemaining(deaths_due_buff) and BuffRemaining(deaths_due_buff) < 3 * GCD()) Spell(deaths_due text=buff)
				if (2 * GCD() < target.DebuffRemaining(deaths_due_debuff) and target.DebuffRemaining(deaths_due_debuff) < 3 * GCD()) Spell(deaths_due text=buff)
			}

			unless (
				((IsCovenant(night_fae) and BuffPresent(death_and_decay_buff)) and
					(BuffRemaining(deaths_due_buff) < 2 * GCD() or (BuffRemaining(death_and_decay_buff) < 4 and BuffRemaining(deaths_due_buff) < 8)) and
					Spell(heart_strike)) or
				(Enemies(tagged=1) == 1 and RunicPowerDeficit() < 20 and Spell(death_strike)) or
				(not BuffPresent(abomination_limb) and Spell(marrowrend) and
					((IsCovenant(necrolord) and SpellCooldown(abomination_limb) > 3 and BuffStacks(bone_shield) < 6) or
					 (EquippedRuneforge(crimson_rune_weapon_runeforge) and SpellCooldown(dancing_rune_weapon) < 60 and BuffStacks(bone_shield) < 6) or
					 (not EquippedRuneforge(crimson_rune_weapon_runeforge) and BuffStacks(bone_shield) < 8))) or
				(EquippedRuneforge(crimson_rune_weapon_runeforge) and Spell(tombstone) and
					BuffStacks(bone_shield) > 6 and SpellCooldown(dancing_rune_weapon) > 25 + GCD() and Rune() > 1)
			) {
				Spell(deaths_due)
				if (Enemies(tagged=1) >= 3) Spell(death_and_decay)

				unless (
					(TimeToRunes(4) < GCD() and Spell(heart_strike)) or
					(Talent(hemostasis_talent) and BuffStacks(hemostasis_buff) < 5 and Charges(blood_boil count=0) > SpellMaxCharges(blood_boil) - 0.2 and Spell(blood_boil)) or
					(Rune() >= 3 and Spell(heart_strike)) or
					(BuffStacks(bone_shield) >= 6 and BuffRemaining(bone_shield) > 4.5 and SpellCooldown(dancing_rune_weapon) > 10 and Spell(heart_strike) and
						((IsCovenant(night_fae) and BuffPresent(death_and_decay_buff)) or not IsCovenant(night_fae))) or
					(Talent(hemostasis_talent) and BuffStacks(hemostasis) < 5 and Spell(blood_boil)) or
					(Charges(blood_boil count=0) > SpellMaxCharges(blood_boil) - 0.2 and Spell(blood_boil)) or
					(RunicPowerDeficit() < 20 and Spell(death_strike))
				) {
					if BuffPresent(crimson_scourge_buff) Spell(death_and_decay text=free)
				}
			}
		}
	}
}

AddFunction BloodDancingRuneWeaponMainActions {
	if (BuffRemaining(bone_shield) < 5 or BuffStacks(bone_shield) < 3) Spell(marrowrend)
	if (Enemies(tagged=1) == 1 and BuffRemaining(bone_shield) < 25 and target.TimeToDie() < 5) Spell(marrowrend text=next)
	if (DebuffCountOnAny(blood_plague_debuff) < Enemies(tagged=1) or target.DebuffRefreshable(blood_plague_debuff)) Spell(blood_boil text=dot)
	if (IsCovenant(night_fae) and BuffPresent(death_and_decay_buff)) {
		if (BuffRemaining(deaths_due_buff) < 2 * GCD()) Spell(heart_strike text=buff)
		if (BuffRemaining(death_and_decay_buff) < 4) Spell(heart_strike text=buff)
	}
	if (Enemies(tagged=1) == 1) {
		if (RunicPowerDeficit() < 40 and Rune() < 3) Spell(death_strike text=dmg)
	}
	if EquippedRuneforge(crimson_rune_weapon_runeforge) {
		if (BuffStacks(bone_shield) > 6 and SpellCooldown(dancing_rune_weapon) > 25 + GCD()) {
			if (Rune() > 1 or BuffStacks(bone_shield) > 7) Spell(tombstone)
		}
	}
	if (TimeToRunes(4) < GCD()) Spell(heart_strike text=rune)
	if (Rune() >= 3) Spell(heart_strike text=rune)
	if (BuffStacks(bone_shield) >= 2 and BuffRemaining(bone_shield) > 4.5) {
		Spell(heart_strike)
	}
	if (Talent(hemostasis_talent) and BuffStacks(hemostasis) < 5) Spell(blood_boil)
	if (Charges(blood_boil count=0) > SpellMaxCharges(blood_boil) - 0.2) Spell(blood_boil text=cap)
	if (RunicPowerDeficit() < 40) Spell(death_strike text=cap)
}

AddFunction BloodDancingRuneWeaponShortCdActions {
	if (Charges(blood_tap count=0) > SpellMaxCharges(blood_tap) - 0.1 and Rune() < 3) Spell(blood_tap text=cap)
	if (Rune() < 2) Spell(blood_tap)

	unless (
		(BuffRemaining(bone_shield) < 5 or BuffStacks(bone_shield) < 3 and Spell(marrowrend)) or
		(Enemies(tagged=1) == 1 and BuffRemaining(bone_shield) < 25 and target.TimeToDie() < 5 and Spell(marrowrend)) or
		(DebuffCountOnAny(blood_plague_debuff) < Enemies(tagged=1) or target.DebuffRefreshable(blood_plague_debuff) and Spell(blood_boil))
	) {
		if (Rune() < 3) Spell(shackle_the_unworthy)
		if IsCovenant(night_fae) {
			if (2 * GCD() < BuffRemaining(deaths_due_buff) and BuffRemaining(deaths_due_buff) < 3 * GCD()) Spell(deaths_due text=buff)
			if (2 * GCD() < target.DebuffRemaining(deaths_due_debuff) and target.DebuffRemaining(deaths_due_debuff) < 3 * GCD()) Spell(deaths_due text=buff)
		}

		unless (
			((IsCovenant(night_fae) and BuffPresent(death_and_decay_buff)) and
				(BuffRemaining(deaths_due_buff) < 2 * GCD() or (BuffRemaining(death_and_decay_buff) < 4 and BuffRemaining(deaths_due_buff) < 8)) and
				Spell(heart_strike)) or
			(Enemies(tagged=1) == 1 and RunicPowerDeficit() < 40 and Rune() < 3 and Spell(death_strike)) or
			(EquippedRuneforge(crimson_rune_weapon_runeforge) and Spell(tombstone) and
				BuffStacks(bone_shield) > 6 and SpellCooldown(dancing_rune_weapon) > 25 + GCD() and
				(Rune() > 1 or BuffStacks(bone_shield) > 7))
		) {
			if BuffPresent(crimson_scourge_buff) {
				Spell(deaths_due text=free)
				if (Enemies(tagged=1) >= 3) Spell(death_and_decay)
			}

			unless (
				(TimeToRunes(4) < GCD() and Spell(heart_strike)) or
				(Rune() >= 3 and Spell(heart_strike)) or
				(BuffStacks(bone_shield) >= 2 and BuffRemaining(bone_shield) > 4.5 and Spell(heart_strike)) or
				(Talent(hemostasis_talent) and BuffStacks(hemostasis) < 5 and Spell(blood_boil)) or
				(Charges(blood_boil count=0) > SpellMaxCharges(blood_boil) - 0.2 and Spell(blood_boil)) or
				(RunicPowerDeficit() < 40 and Spell(death_strike))
			) {
				if BuffPresent(crimson_scourge_buff) Spell(death_and_decay text=free)
			}
		}
	}
}

AddFunction BloodPrecombatMainActions {
	unless BuffPresent(dancing_rune_weapon_buff) Spell(blooddrinker text=open)
	if (BuffRemaining(bone_shield) < 5 or BuffStacks(bone_shield) < 3) {
		if EquippedRuneforge(crimson_rune_weapon_runeforge) {
			if (SpellCooldown(dancing_rune_weapon) > 0) Spell(marrowrend text=open)
		}
		unless EquippedRuneforge(crimson_rune_weapon_runeforge) {
			Spell(marrowrend text=open)
		}
	}
}

AddFunction BloodMainActions {
	BloodPriorityHealActions()
	if BuffPresent(dancing_rune_weapon_buff) BloodDancingRuneWeaponMainActions()
	unless BuffPresent(dancing_rune_weapon_buff) BloodCoreMainActions()
	# Fillers that don't consume Runes or Runic Power.
	if (not target.DebuffPresent(mark_of_blood) and target.IsTargetingPlayer()) Spell(mark_of_blood)
	Spell(consumption)
}

AddFunction BloodPrecombatShortCdActions {
	PrecombatShortCdActions()
	Spell(deaths_due text=open)
	# Only Rune Tap if Bone Shield is down or about to expire.
	if (not BuffPresent(rune_tap) and BuffRemaining(bone_shield) < BaseDuration(rune_tap)) Spell(rune_tap text=open)
}

AddFunction BloodPrecombatCdActions {
	PrecombatCdActions()
}

AddFunction BloodShortCdActions {
	if BuffPresent(dancing_rune_weapon_buff) BloodDancingRuneWeaponShortCdActions()
	unless BuffPresent(dancing_rune_weapon_buff) BloodCoreShortCdActions()
}

AddFunction BloodOffensiveCdActions {
	unless InCombat() {
		Spell(abomination_limb text=open)
		unless BuffPresent(dancing_rune_weapon) Spell(dancing_rune_weapon text=open)
		Spell(raise_dead text=open)
	}
	unless BuffPresent(dancing_rune_weapon_buff) {
		Spell(abomination_limb)
		if (not Talent(blooddrinker_talent) or SpellCooldown(blooddrinker) > 0) Spell(dancing_rune_weapon)
		Spell(swarming_mist)
		Spell(raise_dead)
		# Sacrifice ghoul with at least 5 enemies or 15 seconds left.
		if (Enemies(tagged=1) >= 5 or TotemRemaining(raise_dead) < 15) Spell(sacrificial_pact)
	}
}

AddFunction BloodCdActions {
	if IsCovenant(necrolord) {
		if BuffPresent(dancing_rune_weapon_buff) {
			if (BuffStacks(bone_shield) < 3) Spell(abomination_limb)
			if (BuffRemaining(dancing_rune_weapon_buff) < 5) Spell(abomination_limb)
		}
		unless BuffPresent(dancing_rune_weapon_buff) {
			if (BuffStacks(bone_shield) < 6) Spell(abomination_limb)
		}
	}
	if (not IsCovenant(necrolord) or SpellCooldown(abomination_limb) > 0) {
		if (not EquippedRuneforge(crimson_rune_weapon_runeforge) and BuffStacks(bone_shield) >= 6) Spell(tombstone)
		unless (not EquippedRuneforge(crimson_rune_weapon_runeforge) and BuffStacks(bone_shield) >= 6 and not SpellCooldown(tombstone) > 0) {
			unless BuffPresent(blood_defensive_buff) {
				Spell(icebound_fortitude)
				if InCombat() Spell(fleshcraft)
				if (not IsCovenant(necrolord) or SpellCooldown(fleshcraft) > 0) {
					# Suggest Rune Tap if Heart Strike won't grant enough Runic Power for a DS heal.
					if (RunicPower() + BloodHeartStrikeRunicPower() < RunicPowerCost(death_strike)) {
						unless BuffPresent(rune_tap) Spell(rune_tap)
					}
					if (IncomingMagicDamage(1.5) > 0) Spell(antimagic_zone)
				}
			}
		}
	}
}

AddFunction BloodInterruptActions {
	if (not focus.IsFriend() and focus.Casting()) {
		if (focus.InRange(mind_freeze) and focus.IsInterruptible()) Spell(mind_freeze text=focus)
		unless focus.Classification(worldboss) {
			if focus.InRange(asphyxiate) Spell(asphyxiate text=focus)
			if focus.InRange(death_grip) Spell(death_grip text=focus)
			if (focus.Distance() < 15) Spell(gorefiends_grasp text=focus)
		}
	}
	if (not target.IsFriend() and target.Casting()) {
		if (target.InRange(mind_freeze) and target.IsInterruptible()) Spell(mind_freeze)
		unless target.Classification(worldboss) {
			if target.InRange(asphyxiate) Spell(asphyxiate)
			if target.InRange(death_grip) Spell(death_grip)
			if (target.Distance() < 15) Spell(gorefiends_grasp)
		}
	}
	InterruptActions()
}

AddFunction BloodDispelActions {
	OffensiveDispelActions()
	DefensiveDispelActions()
}

AddFunction BloodHealActions {
	if Talent(red_thirst_talent) {
		if (HealthPercent() < 90) Spell(vampiric_blood)
	}
	unless Talent(red_thirst_talent) {
		if (HealthPercent() < 70) Spell(vampiric_blood)
	}
	if (IncomingMagicDamage(1.5) > 0) Spell(antimagic_shell)
	ItemHealActions()
}

### User Interface ###

AddIcon help=interrupt size=small {
	BloodInterruptActions()
	BloodDispelActions()
	BloodHealActions()
}

AddIcon help=shortcd {
	unless InCombat() BloodPrecombatShortCdActions()
	BloodShortCdActions()
}

AddIcon enemies=1 help=main {
	unless InCombat() BloodPrecombatMainActions()
	BloodMainActions()
}

AddIcon help=aoe {
	unless InCombat() BloodPrecombatMainActions()
	BloodMainActions()
}

AddIcon help=cd {
	unless InCombat() BloodPrecombatCdActions()
	BloodCdActions()
}

AddIcon help=offensive size=small {
	BloodOffensiveCdActions()
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
	unless BloodInRange() Texture(misc_arrowlup help=L(not_in_melee_range))
}
]]
	Private.scripts:registerScript("DEATHKNIGHT", "blood", name, desc, code, "script")
end