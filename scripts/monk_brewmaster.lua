local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_monk_brewmaster"
	local desc = string.format("[9.0.5] %s: Monk - Brewmaster", Private.name)
	local code = [[
# Adapted from Wowhead's "Brewmaster Monk Rotation Guide - Shadowlands 9.0.5"
#	by Llarold-Area52
# https://www.wowhead.com/brewmaster-monk-rotation-guide

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
Define(rushing_jade_wind_talent 20184)
Define(tiger_tail_sweep_talent 19993)

# Class Abilities
Define(black_ox_brew 115399)
	SpellInfo(black_ox_brew cd=120 gcd=0 offgcd=1 energy=-200)
	SpellRequire(black_ox_brew unusable set=1 enabled=(not HasTalent(black_ox_brew_talent)))
Define(blackout_combo_buff 228563)
	SpellInfo(blackout_combo_buff duration=15)
	SpellAddBuff(blackout_kick blackout_combo_buff add=1 enabled=(HasTalent(blackout_combo_talent)))
	SpellAddBuff(breath_of_fire blackout_combo_buff set=0 enabled=(HasTalent(blackout_combo_talent)))
	SpellAddBuff(celestial_brew blackout_combo_buff set=0 enabled=(HasTalent(blackout_combo_talent)))
	SpellAddBuff(keg_smash blackout_combo_buff set=0 enabled=(HasTalent(blackout_combo_talent)))
	SpellAddBuff(tiger_palm blackout_combo_buff set=0 enabled=(HasTalent(blackout_combo_talent)))
Define(blackout_kick 205523)
	SpellInfo(blackout_kick cd=4)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire cd=15)
Define(celestial_brew 322507)
	SpellInfo(celestial_brew cd=60)
Define(charred_passions_buff 338140)
	SpellInfo(charred_passions_buff duration=8)
	SpellAddBuff(breath_of_fire charred_passions_buff add=1 enabled=(EquippedRuneforge(charred_passions_runeforge)))
Define(chi_burst 123986)
	SpellInfo(chi_burst cd=30)
	SpellRequire(chi_burst unusable set=1 enabled=(not HasTalent(chi_burst_talent)))
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=15)
	SpellRequire(chi_wave unusable set=1 enabled=(not HasTalent(chi_wave_talent)))
Define(dampen_harm 122278)
	SpellInfo(dampen_harm cd=120 duration=10 gcd=0 offgcd=1)
	SpellRequire(dampen_harm unusable set=1 enabled=(not HasTalent(dampen_harm_talent)))
	SpellAddBuff(dampen_harm dampen_harm add=1)
Define(detox 218164)
	SpellInfo(detox cd=8)
Define(exploding_keg 325153)
	SpellInfo(exploding_keg cd=60)
	SpellAddTargetDebuff(exploding_keg exploding_keg add=1)
	SpellRequire(exploding_keg unusable set=1 enabled=(not HasTalent(exploding_keg_talent)))
Define(expel_harm 322101)
	SpellInfo(expel_harm energy=15 cd=15)
	SpellRequire(expel_harm cd add=-10 enabled=(Level() >= 43))
Define(eye_of_the_tiger_buff 196608)
	SpellInfo(eye_of_the_tiger_buff duration=8 tick=2)
	SpellAddBuff(tiger_palm eye_of_the_tiger_buff add=1 enabled=(HasTalent(eye_of_the_tiger_talent)))
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=360 gcd=0 offgcd=1)
Define(fortifying_brew_buff 120954)
	SpellInfo(fortifying_brew_buff duration=15)
	SpellAddBuff(fortifying_brew fortifying_brew_buff add=1)
Define(healing_elixir 122281)
	SpellInfo(healing_elixir charge_cd=30 gcd=0 offgcd=1)
	SpellRequire(healing_elixir unusable set=1 enabled=(not HasTalent(healing_elixir_talent)))
Define(invoke_niuzao_the_black_ox 132578)
	SpellInfo(invoke_niuzao_the_black_ox cd=180)
Define(keg_smash 121253)
	SpellInfo(keg_smash energy=40 charge_cd=8)
Define(leg_sweep 119381)
	SpellInfo(leg_sweep cd=60)
	SpellRequire(leg_sweep cd add=-10 enabled=(HasTalent(tiger_tail_sweep_talent)))
Define(paralysis 115078)
	SpellInfo(paralysis energy=20 cd=45)
	SpellRequire(paralysis cd add=-15 enabled=(Level() >= 56))
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=1 charge_cd=20 gcd=0 offgcd=1)
	SpellRequire(purifying_brew unusable set=1 enabled=(not DebuffPresent(any_stagger_debuff)))
Define(rushing_jade_wind 116847)
	SpellInfo(rushing_jade_wind cd=6)
	SpellRequire(rushing_jade_wind unusable set=1 enabled=(not HasTalent(rushing_jade_wind_talent)))
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
SpellList(brewmaster_defensive_buff dampen_harm fortifying_brew_buff)

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
Define(bonedust_brew 325216)
	SpellInfo(bonedust_brew cd=60)
	SpellRequire(bonedust_brew unusable set=1 enabled=(not IsCovenant(necrolord)))
Define(faeline_stomp 327104)
	SpellInfo(faeline_stomp cd=30)
	SpellRequire(faeline_stomp unusable set=1 enabled=(not IsCovenant(night_fae)))
Define(fallen_order 326860)
	SpellInfo(fallen_order cd=180)
	SpellRequire(fallen_order unusable set=1 enabled=(not IsCovenant(venthyr)))
Define(weapons_of_order 310454)
	SpellInfo(weapons_of_order cd=120)
	SpellRequire(weapons_of_order unusable set=1 enabled=(not IsCovenant(kyrian)))

# Runeforge Legendary Effects
Define(charred_passions_runeforge 86)

### Functions ###

AddFunction BrewmasterInRange
{
	(not SpellCooldown(keg_smash) > 0 and target.InRange(keg_smash)) or (SpellCooldown(keg_smash) > 0 and target.InRange(tiger_palm))
}

AddFunction BrewmasterEnergyUntilKegSmashPlusFiller
{
	if (SpellCooldown(keg_smash) >  GCDRemaining()) (Energy() + EnergyRegenRate() * (GCD() + SpellCooldown(keg_smash)))
	if (SpellCooldown(keg_smash) <= GCDRemaining()) (Energy() + EnergyRegenRate() * (GCD() + GCDRemaining()))
}

AddFunction BrewmasterUseExpelHarm
{
	# Use Expel Harm if it won't push back Keg Smash.
	if (BrewmasterEnergyUntilKegSmashPlusFiller() >= PowerCost(keg_smash) + PowerCost(expel_harm)) Spell(expel_harm)
}

AddFunction BrewmasterUseTigerPalm
{
	# Use Tiger Palm if it won't push back Keg Smash.
	if (BrewmasterEnergyUntilKegSmashPlusFiller() >= PowerCost(keg_smash) + PowerCost(tiger_palm)) Spell(tiger_palm)
}

AddFunction BrewmasterUseSpinningCraneKick
{
	# Use Spinning Crane Kick if it won't push back Keg Smash.
	if (BrewmasterEnergyUntilKegSmashPlusFiller() >= PowerCost(keg_smash) + PowerCost(spinning_crane_kick)) Spell(spinning_crane_kick)
}

AddFunction BrewmasterPrecombatShortCdActions
{
	PrecombatShortCdActions()
}

AddFunction BrewmasterShortCdActions
{
	# Use Black Ox Brew when Celestial Brew is on cooldown and Purifying Brew has no charges.
	if (SpellCooldown(celestial_brew) > GCD() and SpellCharges(purifying_brew count=0) < 0.75) Spell(black_ox_brew)
	# Never let Celestial Brew or Purifying Brew sit on cooldown while tanking.
	if (SpellCharges(purifying_brew count=0) > 1.8) Spell(purifying_brew)
	# Use up Purifying Brew charges if Black Ox Brew is coming off cooldown.
	if (HasTalent(black_ox_brew_talent) and SpellCooldown(black_ox_brew) < GCD()) Spell(purifying_brew)
	if BuffExpires(blackout_combo_buff) Spell(celestial_brew)
	# Use Healing Elixir between 60% and 30% health.
	if (HealthPercent() < 60 - 30 * (2 - Charges(healing_elixir count=0))) Spell(healing_elixir)
	Spell(bonedust_brew)
	Spell(exploding_keg)
	# Faeline Stomp has higher priority than Keg Smash for AoE.
	if (Enemies(tagged=1) >= 3) Spell(faeline_stomp)
	unless (Spell(keg_smash) or Spell(blackout_kick))
	{
		Spell(faeline_stomp)
	}
	Spell(fleshcraft)
}

AddFunction BrewmasterPrecombatMainActions
{
	# Opener.
	Spell(rushing_jade_wind)
}

AddFunction BrewmasterMainActions
{
	Spell(keg_smash)
	# Ensure Shuffle is up.
	if BuffExpires(shuffle)
	{
		Spell(blackout_kick)
		BrewmasterUseSpinningCraneKick()
	}
	if (Enemies(tagged=1) >= 3) Spell(breath_of_fire)
	# Consume Blackout Combo buff for damage if it won't push back Keg Smash.
	if (BuffPresent(blackout_combo_buff) and Enemies(tagged=1) < 3) BrewmasterUseTigerPalm()
	Spell(blackout_kick)
	Spell(breath_of_fire)
	if BuffPresent(charred_passions_buff) BrewmasterUseSpinningCraneKick()
	Spell(rushing_jade_wind)
	if (Enemies(tagged=1) < 2) Spell(chi_wave)
	Spell(chi_burst)
	# Maintain the Eye of the Tiger buff with Tiger Palm if it won't push back Keg Smash.
	if (HasTalent(eye_of_the_tiger_talent) and BuffRefreshable(eye_of_the_tiger_buff)) BrewmasterUseTigerPalm()
	# Use Expel Harm with Gift of the Ox orbs to heal if needed.
	if (SpellCount(expel_harm) > 0 and HealthPercent() + 10 * SpellCount(expel_harm) < 70) BrewmasterUseExpelHarm()
	# Use fillers for multi-target if they won't push back Keg Smash.
	if Enemies(tagged=1) > 1
	{
		# Avoid using Spinning Crane Kick if you will need to use a stronger Expel Harm.
		if (Enemies(tagged=1) >= 3 and (HealthPercent() > 60 or SpellCount(expel_harm) < 3)) BrewmasterUseSpinningCraneKick()
		if (Enemies(tagged=1) <  3) BrewmasterUseTigerPalm()
	}
	# Tiger Palm is a terrible offensive skill, so only use it as a filler to prevent capping energy.
	if (TimeToMaxEnergy() < 2 * GCD()) Spell(tiger_palm)
	# Use fillers that cost no energy.
	Spell(chi_wave)
}

AddFunction BrewmasterPrecombatCdActions
{
	PrecombatCdActions()
}

AddFunction BrewmasterOffensiveCdActions
{
	Spell(touch_of_death)
	if (target.TimeToDie() > 25) Spell(invoke_niuzao_the_black_ox)
	# Weapons of Order resets the cooldown of Keg Smash.
	if (not Spell(keg_smash) and SpellCooldown(keg_smash) > 4) Spell(weapons_of_order)
	Spell(fallen_order)
}

AddFunction BrewmasterDefensiveCdActions
{
	if not BuffPresent(brewmaster_defensive_buff)
	{
		Spell(dampen_harm)
		Spell(fortifying_brew)
		Spell(zen_meditation)
	}
}

AddFunction BrewmasterCdActions
{
	BrewmasterDefensiveCdActions()
}

AddFunction BrewmasterInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if focus.InRange(spear_hand_strike) and focus.IsInterruptible() Spell(spear_hand_strike text=focus)
		if not focus.Classification(worldboss)
		{
			if focus.InRange(paralysis) Spell(paralysis text=focus)
			if (focus.Distance() < 6) Spell(leg_sweep text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if target.InRange(spear_hand_strike) and target.IsInterruptible() Spell(spear_hand_strike)
		if not target.Classification(worldboss)
		{
			if target.InRange(paralysis) Spell(paralysis)
			if (target.Distance() < 6) Spell(leg_sweep)
		}
	}
	InterruptActions()
}

AddFunction BrewmasterDispelActions
{
	OffensiveDispelActions()
	if player.HasDebuffType(poison disease) Spell(detox)
	DefensiveDispelActions()
	ItemHealActions()
}

### User Interface ###

AddIcon help=interrupt size=small
{
	BrewmasterInterruptActions()
	BrewmasterDispelActions()
}

AddIcon help=shortcd
{
	if not InCombat() BrewmasterPrecombatShortCdActions()
	BrewmasterShortCdActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() BrewmasterPrecombatMainActions()
	BrewmasterMainActions()
}

AddIcon help=aoe
{
	if not InCombat() BrewmasterPrecombatMainActions()
	BrewmasterMainActions()
}

AddIcon help=cd
{
	if not InCombat() BrewmasterPrecombatCdActions()
	BrewmasterCdActions()
}

AddIcon help=trinkets size=small
{
	if not BrewmasterInRange() Texture(misc_arrowlup help=L(not_in_melee_range))
	BrewmasterOffensiveCdActions()
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("MONK", "brewmaster", name, desc, code, "script")
end