local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_monk_brewmaster"
	local desc = string.format("[9.2] %s: Monk - Brewmaster", Private.name)
	local code = [[
# Adapted from the following resources:
#
# - Sinzhu:
#   - Brewmaster Monk Tank Guide for Shadowlands 9.2
#     https://www.icy-veins.com/wow/brewmaster-monk-pve-tank-rotation-cooldowns-abilities
#
# - Equinox:
#   - Brewmaster Guide
#     https://docs.google.com/document/d/14tE2ELDN64xaDwEGG8t82ZpDbJ1485ax5uSUCNulRLQ

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(blackout_combo_talent 22108)
Define(black_ox_brew_talent 19992)
Define(chi_burst_talent 20185)
Define(chi_wave_talent 19820)
Define(dampen_harm_talent 20175)
Define(exploding_keg_talent 22103)
Define(eye_of_the_tiger_talent 23106)
Define(healing_elixir_talent 23363)
Define(light_brewing_talent 22099)
Define(rushing_jade_wind_talent 20184)
Define(tiger_tail_sweep_talent 19993)

# Class Abilities
Define(black_ox_brew 115399)
	SpellInfo(black_ox_brew cd=120 gcd=0 offgcd=1 energy=-200)
	SpellRequire(black_ox_brew unusable set=1 enabled=(not Talent(black_ox_brew_talent)))
Define(blackout_combo_buff 228563)
	SpellInfo(blackout_combo_buff duration=15)
	SpellAddBuff(blackout_kick blackout_combo_buff add=1 enabled=(Talent(blackout_combo_talent)))
	SpellAddBuff(breath_of_fire blackout_combo_buff set=0 enabled=(Talent(blackout_combo_talent)))
	SpellAddBuff(celestial_brew blackout_combo_buff set=0 enabled=(Talent(blackout_combo_talent)))
	SpellAddBuff(keg_smash blackout_combo_buff set=0 enabled=(Talent(blackout_combo_talent)))
	SpellAddBuff(tiger_palm blackout_combo_buff set=0 enabled=(Talent(blackout_combo_talent)))
Define(blackout_kick 205523)
	SpellInfo(blackout_kick cd=4)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire cd=15)
Define(celestial_brew 322507)
	SpellInfo(celestial_brew cd=60)
	SpellRequire(celestial_brew cd add=-12 enabled=(Talent(light_brewing_talent)))
Define(charred_passions_buff 338140)
	SpellInfo(charred_passions_buff duration=8)
	SpellAddBuff(breath_of_fire charred_passions_buff add=1 enabled=(EquippedRuneforge(charred_passions_runeforge)))
Define(chi_burst 123986)
	SpellInfo(chi_burst cd=30)
	SpellRequire(chi_burst unusable set=1 enabled=(not Talent(chi_burst_talent)))
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=15)
	SpellRequire(chi_wave unusable set=1 enabled=(not Talent(chi_wave_talent)))
Define(dampen_harm 122278)
	SpellInfo(dampen_harm cd=120 duration=10 gcd=0 offgcd=1)
	SpellRequire(dampen_harm unusable set=1 enabled=(not Talent(dampen_harm_talent)))
	SpellAddBuff(dampen_harm dampen_harm add=1)
Define(detox 218164)
	SpellInfo(detox cd=8)
Define(exploding_keg 325153)
	SpellInfo(exploding_keg cd=60)
	SpellAddTargetDebuff(exploding_keg exploding_keg add=1)
	SpellRequire(exploding_keg unusable set=1 enabled=(not Talent(exploding_keg_talent)))
Define(expel_harm 322101)
	SpellInfo(expel_harm energy=15 cd=15)
	SpellRequire(expel_harm cd add=-10 enabled=(Level() >= 43))
Define(eye_of_the_tiger_buff 196608)
	SpellInfo(eye_of_the_tiger_buff duration=8 tick=2)
	SpellAddBuff(tiger_palm eye_of_the_tiger_buff add=1 enabled=(Talent(eye_of_the_tiger_talent)))
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=360 gcd=0 offgcd=1)
Define(fortifying_brew_buff 120954)
	SpellInfo(fortifying_brew_buff duration=15)
	SpellAddBuff(fortifying_brew fortifying_brew_buff add=1)
Define(healing_elixir 122281)
	SpellInfo(healing_elixir charge_cd=30 gcd=0 offgcd=1)
	SpellRequire(healing_elixir unusable set=1 enabled=(not Talent(healing_elixir_talent)))
Define(invoke_niuzao_the_black_ox 132578)
	SpellInfo(invoke_niuzao_the_black_ox cd=180)
Define(keg_smash 121253)
	SpellInfo(keg_smash energy=40 charge_cd=8)
Define(leg_sweep 119381)
	SpellInfo(leg_sweep cd=60)
	SpellRequire(leg_sweep cd add=-10 enabled=(Talent(tiger_tail_sweep_talent)))
Define(paralysis 115078)
	SpellInfo(paralysis energy=20 cd=45)
	SpellRequire(paralysis cd add=-15 enabled=(Level() >= 56))
Define(purified_chi_buff 325092)
	SpellInfo(purified_chi_buff duration=15)
	SpellAddBuff(celestial_brew purified_chi_buff set=0)
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=1 charge_cd=20 cd_haste=1 gcd=0 offgcd=1)
	SpellRequire(purifying_brew charge_cd add=-4 enabled=(Talent(light_brewing_talent)))
	SpellRequire(purifying_brew unusable set=1 enabled=(not DebuffPresent(any_stagger_debuff)))
	SpellAddBuff(purifying_brew purified_chi_buff add=1 enabled=(BuffPresent(light_stagger_debuff)))
	SpellAddBuff(purifying_brew purified_chi_buff add=2 enabled=(BuffPresent(medium_stagger_debuff)))
	SpellAddBuff(purifying_brew purified_chi_buff add=3 enabled=(BuffPresent(heavy_stagger_debuff)))
Define(rushing_jade_wind 116847)
	SpellInfo(rushing_jade_wind cd=6)
	SpellRequire(rushing_jade_wind unusable set=1 enabled=(not Talent(rushing_jade_wind_talent)))
	SpellAddBuff(rushing_jade_wind rushing_jade_wind add=1)
Define(shuffle 215479)
	SpellAddBuff(blackout_kick shuffle add=3)
	SpellAddBuff(keg_smash shuffle add=5)
	SpellAddBuff(spinning_crane_kick shuffle add=1)
Define(spear_hand_strike 116705)
	SpellInfo(spear_hand_strike cd=15 gcd=0 offgcd=1 interrupt=1)
Define(spinning_crane_kick 322729)
	SpellInfo(spinning_crane_kick energy=25 channel=1.5)
Define(tiger_palm 100780)
	SpellInfo(tiger_palm energy=25)
Define(touch_of_death 322109)
	SpellInfo(touch_of_death cd=180 unusable=1)
	SpellRequire(touch_of_death unusable set=0 enabled=(target.Health() < player.Health() or (Level() >= 44 and target.HealthPercent() < 15)))
Define(zen_meditation 115176)
	SpellInfo(zen_meditation cd=300 gcd=0 offgcd=1)
SpellList(brewmaster_defensive_buff dampen_harm fortifying_brew_buff fleshcraft)

# Stagger
Define(heavy_stagger_debuff 124273)
	SpellInfo(heavy_stagger_debuff duration=10 tick=1)
	SpellRequire(heavy_stagger_debuff duration add=3 enabled=(talent(bob_and_weave_talent)))
Define(light_stagger_debuff 124275)
	SpellInfo(light_stagger_debuff duration=10 tick=1)
	SpellRequire(light_stagger_debuff duration add=3 enabled=(talent(bob_and_weave_talent)))
Define(moderate_stagger_debuff 124274)
	SpellInfo(moderate_stagger_debuff duration=10 tick=1)
	SpellRequire(moderate_stagger_debuff duration add=3 enabled=(talent(bob_and_weave_talent)))
SpellList(any_stagger_debuff light_stagger_debuff moderate_stagger_debuff heavy_stagger_debuff)

# Covenant Abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(bonedust_brew 325216)
	SpellInfo(bonedust_brew cd=60 duration=10)
	SpellRequire(bonedust_brew unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(bonedust_brew unusable set=1 enabled=(not IsCovenant(necrolord)))
Define(faeline_stomp 327104)
	SpellInfo(faeline_stomp cd=30 duration=30)
	SpellRequire(faeline_stomp unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(faeline_stomp unusable set=1 enabled=(not IsCovenant(night_fae)))
	SpellAddBuff(faeline_stomp faeline_stomp add=1)
Define(fallen_order 326860)
	SpellInfo(fallen_order cd=180)
	SpellRequire(fallen_order unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(fallen_order unusable set=1 enabled=(not IsCovenant(venthyr)))
Define(weapons_of_order 310454)
	SpellInfo(weapons_of_order cd=120 duration=30)
	SpellRequire(weapons_of_order unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(weapons_of_order unusable set=1 enabled=(not IsCovenant(kyrian)))
	SpellAddBuff(weapons_of_order weapons_of_order add=1)

# Runeforge Legendary Effects
Define(charred_passions_runeforge 7076)

### Functions ###

AddFunction BrewmasterInRange {
	(not SpellCooldown(keg_smash) > 0 and target.InRange(keg_smash)) or (SpellCooldown(keg_smash) > 0 and target.InRange(tiger_palm))
}

AddFunction BrewmasterKegSmashCost {
	# Slowly scale up the perceived cost of Keg Smash so that when
	# Weapons of Order is off cooldown, it will equal the cost of two
	# Keg Smashes.
	unless (IsCovenant(kyrian) and SpellKnown(weapons_of_order)) PowerCost(keg_smash)
	if     (IsCovenant(kyrian) and SpellKnown(weapons_of_order)) PowerCost(keg_smash) * (1 + (1 - SpellCooldown(weapons_of_order) / SpellCooldownDuration(weapons_of_order)))
}

AddFunction BrewmasterEnergyUntilKegSmashPlusFiller {
	if (SpellCooldown(keg_smash) >  GCDRemaining()) (Energy() + EnergyRegenRate() * (GCD() + SpellCooldown(keg_smash)))
	if (SpellCooldown(keg_smash) <= GCDRemaining()) (Energy() + EnergyRegenRate() * (GCD() + GCDRemaining()))
}

AddFunction BrewmasterHasEnergyForExpelHarm {
	# Use Expel Harm if it won't push back Keg Smash.
	BrewmasterEnergyUntilKegSmashPlusFiller() >= BrewmasterKegSmashCost() + PowerCost(expel_harm)
}

AddFunction BrewmasterHasEnergyForTigerPalm {
	# Use Tiger Palm if it won't push back Keg Smash.
	BrewmasterEnergyUntilKegSmashPlusFiller() >= BrewmasterKegSmashCost() + PowerCost(tiger_palm)
}

AddFunction BrewmasterHasEnergyForSpinningCraneKick {
	# Use Spinning Crane Kick if it won't push back Keg Smash.
	BrewmasterEnergyUntilKegSmashPlusFiller() >= BrewmasterKegSmashCost() + PowerCost(spinning_crane_kick)
}

AddFunction BrewmasterShouldCelestialBrew {
	Enemies(tagged=1) > 1 or target.IsTargetingPlayer() or IncomingDamage(5) > 0
}

AddListItem(opt_monk_purified_chi_threshold purified_chi_00 "Purified Chi >= 0")
AddListItem(opt_monk_purified_chi_threshold purified_chi_01 "Purified Chi >= 1")
AddListItem(opt_monk_purified_chi_threshold purified_chi_02 "Purified Chi >= 2")
AddListItem(opt_monk_purified_chi_threshold purified_chi_03 "Purified Chi >= 3")
AddListItem(opt_monk_purified_chi_threshold purified_chi_04 "Purified Chi >= 4")
AddListItem(opt_monk_purified_chi_threshold purified_chi_05 "Purified Chi >= 5" default)
AddListItem(opt_monk_purified_chi_threshold purified_chi_06 "Purified Chi >= 6")
AddListItem(opt_monk_purified_chi_threshold purified_chi_07 "Purified Chi >= 7")
AddListItem(opt_monk_purified_chi_threshold purified_chi_08 "Purified Chi >= 8")
AddListItem(opt_monk_purified_chi_threshold purified_chi_09 "Purified Chi >= 9")
AddListItem(opt_monk_purified_chi_threshold purified_chi_10 "Purified Chi >= 10")

AddFunction BrewmasterPurifiedChiThreshold {
	if List(opt_monk_purified_chi_threshold purified_chi_00) 0
	if List(opt_monk_purified_chi_threshold purified_chi_01) 1
	if List(opt_monk_purified_chi_threshold purified_chi_02) 2
	if List(opt_monk_purified_chi_threshold purified_chi_03) 3
	if List(opt_monk_purified_chi_threshold purified_chi_04) 4
	if List(opt_monk_purified_chi_threshold purified_chi_05) 5
	if List(opt_monk_purified_chi_threshold purified_chi_06) 6
	if List(opt_monk_purified_chi_threshold purified_chi_07) 7
	if List(opt_monk_purified_chi_threshold purified_chi_08) 8
	if List(opt_monk_purified_chi_threshold purified_chi_09) 9
	if List(opt_monk_purified_chi_threshold purified_chi_10) 10
	# Default value
	5
}

AddFunction BrewmasterPrecombatActiveMitigationActions {
	PrecombatShortCdActions()
	Spell(exploding_keg)
}

AddFunction BrewmasterActiveMitigationActions {
	# Use Black Ox Brew when Celestial Brew is on cooldown and Purifying Brew has no charges.
	if (SpellCooldown(celestial_brew) > GCD() and SpellCharges(purifying_brew count=0) < 0.75) Spell(black_ox_brew)
	# Never let Purifying Brew sit on cooldown while tanking.
	if (SpellCharges(purifying_brew count=0) > SpellMaxCharges(purifying_brew) - 0.1) Spell(purifying_brew text=cap)
	# Use up Purifying Brew charges if Black Ox Brew is coming off cooldown.
	if (Talent(black_ox_brew_talent) and SpellCooldown(black_ox_brew) < GCD()) Spell(purifying_brew text=dump)
	# Try to refresh Purified Chi with Purifying Brew.
	if (BuffPresent(purified_chi_buff) and BuffRemaining(purified_chi_buff) < 2 * GCD()) Spell(purifying_brew text=buff)
	# Put up a max absorb Celestial Brew if it's available.
	if (not BuffPresent(blackout_combo_buff) and not BuffPresent(brewmaster_defensive_buff)) {
		if (BuffStacks(purified_chi_buff) >= 10 and BrewmasterShouldCelestialBrew()) Spell(celestial_brew text=max)
	}
	if (target.DebuffRemaining(bonedust_brew) < 1) Spell(bonedust_brew)
	unless (
		Spell(keg_smash) or Spell(faeline_stomp) or
		Spell(blackout_kick) or Spell(breath_of_fire) or
		Spell(chi_burst) or Spell(chi_wave)
	) {
		Spell(exploding_keg)
	}
	# Use Celestial Brew if it won't overlap other defensive buffs.
	if (not BuffPresent(blackout_combo_buff) and not BuffPresent(brewmaster_defensive_buff)) {
		# Only suggest Celestial Brew with at least 5 stacks of Purified Chi for an extra 100% absorption.
		if (BuffStacks(purified_chi_buff) >= BrewmasterPurifiedChiThreshold() and BrewmasterShouldCelestialBrew()) {
			if (BuffStacks(purified_chi_buff) == 9) Spell(celestial_brew text=9)
			if (BuffStacks(purified_chi_buff) == 8) Spell(celestial_brew text=8)
			if (BuffStacks(purified_chi_buff) == 7) Spell(celestial_brew text=7)
			if (BuffStacks(purified_chi_buff) == 6) Spell(celestial_brew text=6)
			if (BuffStacks(purified_chi_buff) == 5) Spell(celestial_brew text=5)
			if (BuffStacks(purified_chi_buff) == 4) Spell(celestial_brew text=4)
			if (BuffStacks(purified_chi_buff) == 3) Spell(celestial_brew text=3)
			if (BuffStacks(purified_chi_buff) == 2) Spell(celestial_brew text=2)
			if (BuffStacks(purified_chi_buff) == 1) Spell(celestial_brew text=1)
			if (BuffStacks(purified_chi_buff) == 1) Spell(celestial_brew text=0)
		}
	}
}

AddFunction BrewmasterPrecombatMainActions {
	# Ensure Shuffle is up when entering combat.
	unless BuffPresent(shuffle) {
		Spell(keg_smash text=open)
		Spell(blackout_kick text=open)
		Spell(spinning_crane_kick text=open)
	}
}

AddFunction BrewmasterMainActions {
	if BuffPresent(charred_passions_buff) Spell(blackout_kick text=plus)
	# Faeline Stomp has higher priority than Keg Smash for AoE.
	if (Enemies(tagged=1) >= 3) Spell(faeline_stomp)
	if (SpellMaxCharges(keg_smash) > 1) {
		# Don't cap on Keg Smash charges.
		if (SpellCharges(keg_smash count=0) >= SpellMaxCharges(keg_smash) - 0.2) Spell(keg_smash text=cap)
		# Build back up to banking one charge of Keg Smash.
		# Hardcode the 8 second recharge time for Keg Smash.
		if (TimeSincePreviousSpell(keg_smash) > TimeWithHaste(8) + 1) Spell(keg_smash)
	}
	unless (SpellMaxCharges(keg_smash) > 1) {
		Spell(keg_smash)
	}
	if BuffPresent(faeline_stomp) Spell(chi_burst)
	Spell(faeline_stomp)
	if (BuffPresent(blackout_combo_buff) and Enemies(tagged=1) < 3) {
		if BrewmasterHasEnergyForTigerPalm() Spell(tiger_palm text=combo)
	}
	unless EquippedRuneforge(charred_passions_runeforge) Spell(blackout_kick)
	Spell(breath_of_fire)
	if EquippedRuneforge(charred_passions_runeforge) Spell(blackout_kick)
	Spell(rushing_jade_wind)
	Spell(chi_wave)
	if BuffPresent(charred_passions_buff) {
		if BrewmasterHasEnergyForSpinningCraneKick() Spell(spinning_crane_kick text=plus)
	}
	unless IsCovenant(night_fae) Spell(chi_burst)
	if (Talent(eye_of_the_tiger_talent) and BuffRefreshable(eye_of_the_tiger_buff)) {
		if BrewmasterHasEnergyForTigerPalm() Spell(tiger_palm text=buff)
	}
	if BuffPresent(rushing_jade_wind) Spell(rushing_jade_wind)
}

AddFunction BrewmasterSingleTargetActions {
	BrewmasterMainActions()
	if BrewmasterHasEnergyForTigerPalm() Spell(tiger_palm)
}

AddFunction BrewmasterAoEActions {
	BrewmasterMainActions()
	if (Enemies(tagged=1) >= 3) {
		if BrewmasterHasEnergyForSpinningCraneKick() Spell(spinning_crane_kick)
	}
	unless (Enemies(tagged=1) >= 3) {
		if BrewmasterHasEnergyForTigerPalm() Spell(tiger_palm)
	}
}

AddFunction BrewmasterPrecombatCdActions {
	PrecombatCdActions()
	Spell(invoke_niuzao_the_black_ox)
}

AddFunction BrewmasterOffensiveCdActions {
	if (target.Health() <= player.Health()) Spell(touch_of_death text=kill)
	if (target.TimeToDie() > 25 or Enemies(tagged=1) > 1) Spell(invoke_niuzao_the_black_ox)
	# Weapons of Order resets the cooldown for one charge of Keg Smash.
	if (SpellChargeCooldown(keg_smash) > 3 * GCD()) Spell(weapons_of_order)
	Spell(fallen_order)
	Spell(touch_of_death)
}

AddFunction BrewmasterDefensiveCdActions {
	unless BuffPresent(brewmaster_defensive_buff) {
		Spell(dampen_harm)
		Spell(fortifying_brew)
		if InCombat() Spell(fleshcraft)
		Spell(zen_meditation)
	}
}

AddFunction BrewmasterCdActions {
	BrewmasterDefensiveCdActions()
}

AddFunction BrewmasterInterruptActions {
	if (not focus.IsFriend() and focus.Casting()) {
		if focus.InRange(spear_hand_strike) and focus.IsInterruptible() Spell(spear_hand_strike text=focus)
		unless focus.Classification(worldboss) {
			if focus.InRange(paralysis) Spell(paralysis text=focus)
			if (focus.Distance() < 6) Spell(leg_sweep text=focus)
		}
	}
	if (not target.IsFriend() and target.Casting()) {
		if target.InRange(spear_hand_strike) and target.IsInterruptible() Spell(spear_hand_strike)
		unless target.Classification(worldboss) {
			if target.InRange(paralysis) Spell(paralysis)
			if (target.Distance() < 6) Spell(leg_sweep)
		}
	}
	InterruptActions()
}

AddFunction BrewmasterDispelActions {
	OffensiveDispelActions()
	if player.HasDebuffType(poison disease) Spell(detox)
	DefensiveDispelActions()
}

AddFunction BrewmasterHealActions {
	# Expel Harm if we have at least 3 Gift of the Ox orbs and won't overheal.
	if (HealthPercent() < 70 and SpellCount(expel_harm) > 2) {
		# Assume each Gift of the Ox orb heals for 10% health.
		if (HealthPercent() + 10 * SpellCount(expel_harm) < 90) {
			if BrewmasterHasEnergyForExpelHarm() Spell(expel_harm)
		}
	}
	ItemHealActions()
	# Use Healing Elixir between 60% and 30% health.
	if (HealthPercent() < 60 - 30 * (SpellMaxCharges(healing_elixir) - Charges(healing_elixir count=0))) Spell(healing_elixir)
}

### User Interface ###

AddIcon help=interrupt size=small {
	BrewmasterInterruptActions()
	BrewmasterDispelActions()
	BrewmasterHealActions()
}

AddIcon help=active_mitigation {
	unless InCombat() BrewmasterPrecombatActiveMitigationActions()
	BrewmasterActiveMitigationActions()
}

AddIcon enemies=1 help=main {
	unless InCombat() BrewmasterPrecombatMainActions()
	BrewmasterSingleTargetActions()
}

AddIcon help=aoe {
	unless InCombat() BrewmasterPrecombatMainActions()
	BrewmasterAoEActions()
}

AddIcon help=cd {
	unless InCombat() BrewmasterPrecombatCdActions()
	BrewmasterCdActions()
}

AddIcon help=offensive size=small {
	unless BrewmasterInRange() Texture(misc_arrowlup help=L(not_in_melee_range))
	BrewmasterOffensiveCdActions()
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("MONK", "brewmaster", name, desc, code, "script")
end