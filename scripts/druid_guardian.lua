local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_druid_guardian"
	local desc = string.format("[9.1] %s: Druid - Guardian", Private.name)
	local code = [[
# Adapted from Icy Vein's "Guardian Druid Tank Rotation, Cooldowns,
#   and Abilities — Shadowlands 9.1.0" by Pumpsw-Frostmourne
# https://www.icy-veins.com/wow/guardian-druid-pve-tank-rotation-cooldowns-abilities

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(balance_affinity_talent 22163)
Define(bristling_fur_talent 22420)
Define(feral_affinity_talent 22156)
Define(guardian_of_elune_talent 22390)
Define(heart_of_the_wild_talent 18577)
Define(incarnation_guardian_of_ursoc_talent 22388)
Define(mighty_bash_talent 21778)
Define(pulverize_talent 22425)
Define(renewal_talent 18570)
Define(restoration_affinity_talent 22159)
Define(soul_of_the_forest_talent 21709)
Define(tooth_and_claw_talent 22427)
Define(wild_charge_talent 18571)

# Class Abilities
Define(barkskin 22812)
	SpellInfo(barkskin cd=60 duration=8 gcd=0 offgcd=1 tick=1)
	SpellAddBuff(barkskin barkskin add=1)
Define(bear_form 5487)
	SpellInfo(bear_form to_stance=druid_bear_form)
	SpellRequire(bear_form unusable set=1 enabled=(Stance(druid_bear_form)))
	SpellAddBuff(bear_form bear_form add=1)
Define(berserk 50334)
	SpellInfo(berserk cd=180 duration=15 gcd=0 offgcd=1)
	SpellRequire(berserk replaced_by set=incarnation_guardian_of_ursoc enabled=(Talent(incarnation_guardian_of_ursoc_talent)))
	SpellAddBuff(berserk berserk add=1)
Define(bristling_fur 155835)
	SpellInfo(bristling_fur cd=40)
	SpellRequire(bristling_fur unusable set=1 enabled=(not Stance(druid_bear_form)))
	SpellRequire(bristling_fur unusable set=1 enabled=(not Talent(bristling_fur_talent)))
SpellList(bs_inc_buff berserk incarnation_guardian_of_ursoc)
Define(cat_form 768)
	SpellInfo(cat_form to_stance=druid_cat_form)
	SpellRequire(cat_form unusable set=1 enabled=(Stance(druid_cat_form)))
	SpellAddBuff(cat_form cat_form add=1)
Define(eclipse_lunar_buff 48518)
	SpellInfo(eclipse_lunar_buff duration=15)
Define(eclipse_solar_buff 48517)
	SpellInfo(eclipse_solar_buff duration=15)
Define(ferocious_bite 22568)
	SpellInfo(ferocious_bite energy=25 combopoints=1 max_combopoints=5 gcd=1)
	SpellRequire(ferocious_bite unusable set=1 enabled=(not Stance(druid_cat_form)))
Define(frenzied_regeneration 22842)
	SpellInfo(frenzied_regeneration rage=10 charge_cd=36 duration=3 tick=1)
	SpellRequire(frenzied_regeneration unusable set=1 enabled=(not Stance(druid_bear_form)))
	SpellAddBuff(frenzied_regeneration frenzied_regeneration add=1)
	SpellAddBuff(frenzied_regeneration guardian_of_elune_buff set=0 enabled=(Talent(guardian_of_elune_talent)))
Define(galactic_guardian_buff 213708)
	SpellInfo(galactic_guardian_buff duration=15 gcd=0 offgcd=1)
	SpellAddBuff(moonfire galactic_guardian_buff set=0)
Define(gore_buff 93622)
	SpellInfo(gore_buff duration=10)
	SpellAddBuff(mangle gore_buff set=0)
Define(guardian_of_elune_buff 213680)
	SpellInfo(guardian_of_elune_buff duration=15)
	SpellAddBuff(mangle guardian_of_elune_buff add=1 enabled=(Talent(guardian_of_elune_talent)))
Define(heart_of_the_wild 319454)
	SpellInfo(heart_of_the_wild cd=300 duration=45)
	SpellRequire(heart_of_the_wild unusable set=1 enabled=(not Talent(heart_of_the_wild_talent)))
	SpellAddBuff(heart_of_the_wild heart_of_the_wild add=1)
Define(incapacitating_roar 99)
	SpellInfo(incapacitating_roar cd=30 duration=3 to_stance=druid_bear_form)
	SpellAddTargetDebuff(incapacitating_roar incapacitating_roar add=1)
Define(incarnation_guardian_of_ursoc 102558)
	SpellInfo(incarnation_guardian_of_ursoc cd=180 duration=30 gcd=0 offgcd=1)
	SpellRequire(incarnation_guardian_of_ursoc unusable set=1 enabled=(not Talent(incarnation_guardian_of_ursoc_talent)))
	SpellAddBuff(incarnation_guardian_of_ursoc incarnation_guardian_of_ursoc add=1)
Define(ironfur 192081)
	SpellInfo(ironfur rage=40 cd=0.5 duration=7 gcd=0 offgcd=1)
	SpellRequire(ironfur unusable set=1 enabled=(not Stance(druid_bear_form)))
	SpellRequire(ironfur duration add=2 enabled=(BuffPresent(guardian_of_elune_buff)))
	SpellAddBuff(ironfur ironfur add=1)
	SpellAddBuff(ironfur guardian_of_elune_buff set=0 enabled=(Talent(guardian_of_elune_talent)))
Define(maim 22570)
	SpellInfo(maim energy=30 combopoints=1 max_combopoints=5 cd=20 gcd=1)
	SpellRequire(maim unusable set=1 enabled=(not (Talent(feral_affinity_talent) and Stance(druid_cat_form))))
	SpellAddBuff(maim maim add=1)
Define(mangle 33917)
	SpellInfo(mangle cd=6 rage=-10)
	SpellRequire(mangle unusable set=1 enabled=(not Stance(druid_bear_form)))
	# Mangle has no cooldown when Berserk/Incarnation is active.
	SpellRequire(mangle cd set=0 enabled=(BuffPresent(bs_inc_buff)))
	SpellRequire(mangle rage add=-4 enabled=(BuffPresent(gore_buff)))
	SpellRequire(mangle rage add=-5 enabled=(Talent(soul_of_the_forest_talent)))
Define(maul 6807)
	SpellInfo(maul rage=40)
	SpellRequire(maul unusable set=1 enabled=(not Stance(druid_bear_form)))
Define(mighty_bash 5211)
	SpellInfo(mighty_bash cd=60 duration=4)
	SpellRequire(mighty_bash unusable set=1 enabled=(not Talent(mighty_bash_talent)))
	SpellAddTargetDebuff(mighty_bash mighty_bash add=1)
Define(moonfire 8921)
	SpellInfo(moonfire rage=0)
	SpellRequire(moonfire rage add=-8 enabled=(BuffPresent(galactic_guardian_buff)))
Define(moonfire_debuff 164812)
	SpellInfo(moonfire_debuff duration=12 gcd=0 offgcd=1 tick=2)
	SpellAddTargetDebuff(moonfire moonfire_debuff add=1)
Define(moonkin_form 197625)
	SpellInfo(moonkin_form to_stance=druid_moonkin_form)
	SpellRequire(moonkin_form unusable set=1 enabled=(Stance(druid_moonkin_form)))
	SpellRequire(moonkin_form unusable set=1 enabled=(not Hastalent(balance_affinity_talent)))
	SpellAddBuff(moonkin_form moonkin_form add=1)
Define(prowl 5215)
	SpellInfo(prowl cd=6 gcd=0 offgcd=1 to_stance=druid_cat_form)
	SpellRequire(prowl unusable set=1 enabled=(InCombat() or BuffPresent(prowl)))
	SpellAddBuff(prowl prowl add=1)
Define(pulverize 80313)
	SpellInfo(pulverize cd=45 duration=10)
	SpellRequire(pulverize unusable set=1 enabled=(not (Talent(pulverize_talent) and Stance(druid_bear_form)) or target.DebuffStacks(thrash_bear_debuff) < 2))
	SpellAddTargetDebuff(pulverize pulverize add=1)
	SpellAddTargetDebuff(pulverize thrash_bear_debuff add=-2)
Define(rake 1822)
	SpellInfo(rake energy=35 gcd=1 combopoints=-1)
	SpellRequire(rake unusable set=1 enabled=(not (Talent(feral_affinity_talent) and Stance(druid_cat_form))))
	SpellAddTargetDebuff(rake rake_debuff add=1)
	SpellDamageBuff(rake prowl set=1.6)
	SpellDamageBuff(rake shadowmeld set=1.6)
Define(rake_debuff 155722)
	SpellInfo(rake_debuff duration=15 gcd=0 offgcd=1 tick=3)
Define(regrowth 8936)
	SpellAddBuff(regrowth regrowth add=1)
Define(rejuvenation 774)
	SpellInfo(rejuvenation duration=15 tick=3)
	SpellRequire(rejuvenation unusable set=1 enabled=(not Talent(restoration_affinity_talent)))
	SpellAddBuff(rejuvenation rejuvenation add=1)
Define(remove_corruption 2782)
	SpellInfo(remove_corruption cd=8)
Define(renewal 108238)
	SpellInfo(renewal cd=90)
	SpellRequire(renewal unusable set=1 enabled=(not Talent(renewal_talent)))
Define(rip 1079)
	SpellInfo(rip energy=20 combopoints=1 max_combopoints=5 duration=4 gcd=1 tick=2)
	SpellRequire(rip unusable set=1 enabled=(not (Talent(feral_affinity_talent) and Stance(druid_cat_form))))
	SpellAddTargetDebuff(rip rip add=1)
Define(shred 5221)
	SpellInfo(shred energy=40 gcd=1 combopoints=-1)
	SpellRequire(shred unusable set=1 enabled=(not Stance(druid_cat_form)))
Define(skull_bash 106839)
	SpellInfo(skull_bash cd=15 gcd=0 offgcd=1 interrupt=1)
	SpellRequire(skull_bash unusable set=1 enabled=(not (Stance(druid_bear_form) or Stance(druid_cat_form))))
Define(soothe 2908)
	SpellInfo(soothe cd=10)
Define(starfire 197628)
	SpellRequire(starfire unusable set=1 enabled=(not Stance(druid_moonkin_form)))
Define(starsurge 197626)
	SpellInfo(starsurge cd=10)
	SpellRequire(starsurge unusable set=1 enabled=(not Stance(druid_moonkin_form)))
Define(sunfire 197630)
	SpellRequire(sunfire unusable set=1 enabled=(not Stance(druid_moonkin_form)))
	SpellAddTargetDebuff(sunfire sunfire_debuff add=1)
Define(sunfire_debuff 164815)
	SpellInfo(sunfire_debuff duration=12 gcd=0 offgcd=1 tick=2)
Define(survival_instincts 61336)
	SpellInfo(survival_instincts charge_cd=180 duration=6 gcd=0 offgcd=1)
	SpellAddBuff(survival_instincts survival_instincts add=1)
Define(swiftmend 18562)
	SpellInfo(swiftmend cd=15)
	SpellRequire(swiftmend unusable set=1 enabled=(not Talent(restoration_affinity_talent)))
	SpellRequire(swiftmend unusable set=1 enabled=(not BuffPresent(regrowth) and not BuffPresent(wild_growth) and not BuffPresent(rejuvenation)))
	SpellAddBuff(swiftmend regrowth set=0 enabled=(BuffPresent(regrowth)))
	SpellAddBuff(swiftmend wild_growth set=0 enabled=(not BuffPresent(regrowth) and BuffPresent(wild_growth)))
	SpellAddBuff(swiftmend rejuvenation set=0 enabled=(not BuffPresent(regrowth) and not BuffPresent(wild_growth) and BuffPresent(rejuvenation)))
Define(swipe_bear 213771)
	SpellRequire(swipe_bear unusable set=1 enabled=(not Stance(druid_bear_form)))
Define(swipe_cat 106785)
	SpellInfo(swipe_cat energy=35 gcd=1 combopoints=-1)
	SpellRequire(swipe_cat unusable set=1 enabled=(not (Talent(feral_affinity_talent) and Stance(druid_cat_form))))
Define(thrash_bear 77758)
	SpellInfo(thrash_bear cd=6 rage=-5)
	SpellRequire(thrash_bear unusable set=1 enabled=(not Stance(druid_bear_form)))
	# Thrash has no cooldown when Berserk/Incarnation is active.
	SpellRequire(thrash_bear cd set=0 enabled=(BuffPresent(bs_inc_buff)))
	SpellAddBuff(thrash_bear earthwarden_buff add=1 enabled=(Talent(earthwarden_talent)))
	SpellAddTargetDebuff(thrash_bear thrash_bear_debuff add=1)
Define(thrash_bear_debuff 192090)
	SpellInfo(thrash_bear_debuff duration=15 max_stacks=3)
Define(tooth_and_claw_buff 135286)
	SpellInfo(tooth_and_claw_buff duration=15 max_stacks=2)
	SpellAddBuff(maul tooth_and_claw_buff add=-1 enabled=(Talent(tooth_and_claw_talent)))
Define(typhoon 132469)
	SpellInfo(typhoon cd=30)
	SpellRequire(typhoon unusable set=1 enabled=(not Talent(balance_affinity_talent)))
Define(ursols_fury_remembered 345048)
	SpellInfo(ursols_fury_remembered duration=15)
	SpellAddBuff(thrash_Bear ursols_fury_remembered set=1 enabled=(EquippedRuneforge(ursols_fury_remembered_runeforge)))
Define(ursols_vortex 102793)
	SpellInfo(ursols_vortex cd=60)
	SpellRequire(ursols_vortex unusable set=1 enabled=(not Talent(restoration_affinity_talent)))
Define(wild_charge_bear 16979)
	SpellInfo(wild_charge_bear cd=15 gcd=0 offgcd=1)
	SpellRequire(wild_charge_bear unusable set=1 enabled=(not (Talent(wild_charge_talent) and Stance(druid_bear_form))))
Define(wild_charge_cat 49376)
	SpellInfo(wild_charge_cat cd=15 gcd=0 offgcd=1)
	SpellRequire(wild_charge_cat unusable set=1 enabled=(not (Talent(wild_charge_talent) and Stance(druid_cat_form))))
Define(wild_growth 48438)
	SpellInfo(wild_growth cd=20 duration=7 tick=1)
	SpellRequire(wild_growth unusable set=1 enabled=(not Talent(restoration_affinity_talent)))
	SpellAddBuff(wild_growth wild_growth)
Define(wrath 5176)
SpellList(damage_reduction_cooldown_buff barkskin survival_instincts)

# Covenant Abilities
# XXX TODO: Kyrian abilities
Define(adaptive_swarm 325727)
	SpellInfo(adaptive_swarm cd=25)
	SpellAddTargetDebuff(adaptive_swarm adaptive_swarm_damage add=3)
Define(adaptive_swarm_damage 325733)
	SpellInfo(adaptive_swarm_damage duration=12 max_stacks=5 gcd=0 offgcd=1 tick=2)
	SpellAddTargetDebuff(adaptive_swarm_damage adaptive_swarm_damage add=1)
Define(adaptive_swarm_heal 325748)
	SpellInfo(adaptive_swarm_heal duration=12 max_stacks=5 gcd=0 offgcd=1 tick=2)
	SpellAddTargetDebuff(adaptive_swarm_heal adaptive_swarm_heal add=1)
Define(convoke_the_spirits 323764)
	SpellInfo(convoke_the_spirits cd=120 duration=4 channel=4 max_stacks=99 tick=0.25)
	SpellAddBuff(convoke_the_spirits convoke_the_spirits add=1)
Define(ravenous_frenzy 323546)
	SpellInfo(ravenous_frenzy cd=180 duration=20 max_stacks=99 gcd=0 offgcd=1 tick=0.1)
	SpellAddBuff(ravenous_frenzy ravenous_frenzy add=1)

# Runeforge Legendary Effects
Define(legacy_of_the_sleeper_runeforge 7095)
	SpellRequire(barkskin duration add=-30 enabled=(EquippedRuneforge(legacy_of_the_sleeper_runeforge)))
Define(luffainfused_embrace_runeforge 7092)
	SpellRequire(thrash_bear_debuff max_stacks add=1 enabled=(EquippedRuneforge(luffainfused_embrace_runeforge)))
Define(ursols_fury_remembered_runeforge 7094)

### Functions ###

AddFunction GuardianInRange
{
	(Stance(druid_bear_form) and target.InRange(mangle)) or
	(Stance(druid_cat_form)  and target.InRange(shred)) or
	(Stance(druid_moonkin_form) and target.InRange(moonfire))
}

AddFunction GuardianThrashMaxStacks
{
	if EquippedRuneforge(luffainfused_embrace_runeforge) (4)
	3
}

AddFunction GuardianMoonfireCycle
{
	# Suggest Moonfire on another target if already present on the current one.
	if target.DebuffPresent(moonfire_debuff) Spell(moonfire text=cycle)
	Spell(moonfire)
}

AddFunction GuardianUseRageForActiveMitigation
{
	# Condition for when Rage should be used for active mitigation.
	IncomingPhysicalDamage(5) > 0 or HealthPercent() < 50
}

AddFunction GuardianShapeshiftActions
{
	# Cast Bear Form if the player is being targeted for damage.
	if target.IsTargetingPlayer() Spell(bear_form)

	# Shapeshift for DPS when Mangle and Thrash are all on cooldown and
	# you have no Rage to spend.
	if Stance(druid_bear_form)
	{
		# Use Ravenous Frenzy with Berserk/Incarnation to boost the power of
		# both abilities, and the cooldown syncs up perfectly.
		if BuffPresent(bs_inc_buff) Spell(ravenous_frenzy)
		if not BuffPresent(bs_inc_buff) and SpellCooldown(mangle) > 0 and SpellCooldown(thrash_bear) > 0
		{
			# Begin a catweave cycle at full energy. Also check that empowered
			# Moonfire is used before entering catweave cycle.
			if Talent(feral_affinity_talent) and TimeToEnergy(100) < 1 and not BuffPresent(galactic_guardian_buff)
			{
				# [*] Dump Rage so it's not wasted.
				if BuffPresent(tooth_and_claw_buff) Spell(maul text=dump)
				if not BuffPresent(tooth_and_claw_buff) Spell(ironfur text=dump)
				# [*] Heart of the Wild will also shift to Cat Form.
				Spell(heart_of_the_wild)
				Spell(cat_form)
			}
			# Owlweave.
			if Talent(balance_affinity_talent)
			{
				# [*] Dump Rage so it's not wasted.
				if BuffPresent(tooth_and_claw_buff) Spell(maul text=dump)
				if not BuffPresent(tooth_and_claw_buff) Spell(ironfur text=dump)
				# [*] Heart of the Wild will also shift to Moonkin Form.
				Spell(heart_of_the_wild)
				Spell(moonkin_form)
			}
			# Save Convoke the Spirits for offense if using either Balance or Feral Affinity.
			if (not Talent(balance_affinity_talent) and not Talent(feral_affinity_talent)) Spell(convoke_the_spirits)
			Spell(incarnation_guardian_of_ursoc)
			Spell(berserk)
		}
	}
	if not Stance(druid_bear_form)
	{
		if not (SpellCooldown(mangle) > 0 and SpellCooldown(thrash_bear) > 0)
		{
			Spell(bear_form)
		}
	}
}

AddFunction GuardianBearActions
{
	# [*] Use Maul if Tooth and Claw is up.
	if BuffPresent(tooth_and_claw_buff) Spell(maul)
	# [*] Spam Thrash on more than 4 targets when Berserk is up and using Ursol's Fury Remembered.
	if (Enemies(tagged=1) >= 4 and BuffPresent(bs_inc_buff) and EquippedRuneforge(ursols_fury_remembered_runeforge)) Spell(thrash_bear)
	# Keep Moonfire ticking on up to 2 targets.
	if (Enemies(tagged=1) == 1 and target.DebuffRefreshable(moonfire_debuff)) Spell(moonfire)
	if (Enemies(tagged=1) >= 2 and DebuffCountOnAny(moonfire_debuff) < 2) GuardianMoonfireCycle()
	# Use Thrash on more than 1 target or if your target does not have 3 stacks of the bleed yet.
	if (Enemies(tagged=1) > 1 or target.DebuffStacks(thrash_bear_debuff) < GuardianThrashMaxStacks()) Spell(thrash_bear)
	# Use Mangle on up to 4 targets.
	if (Enemies(tagged=1) <= 4) Spell(mangle)
	# Use Thrash.
	Spell(thrash_bear)
	# Use Moonfire with a Galactic Guardian on up to 3 targets.
	if BuffPresent(galactic_guardian_buff)
	{
		if (Enemies(tagged=1) == 1) Spell(moonfire)
		if (Enemies(tagged=1) <  3 and DebuffCountOnAny(moonfire_debuff) < Enemies(tagged=1)) GuardianMoonfireCycle()
		if (Enemies(tagged=1) >= 3 and DebuffCountOnAny(moonfire_debuff) < 3) GuardianMoonfireCycle()
	}
	# Use Maul to dump Rage on up to 3 targets, if you do not need the
	# Rage for Ironfur or Frenzied Regeneration.
	if RageDeficit() < 40 and not GuardianUseRageForActiveMitigation()
	{
		if (Enemies(tagged=1) <= 3) Spell(maul)
	}
	# Use Swipe as filler.
	# [*] Only use Swipe as a filler when Berserk is down. Otherwise,
	# [*] Mangle and Thrash have no cooldown and are better options.
	if not BuffPresent(bs_inc_buff) Spell(swipe_bear)
}

AddFunction GuardianCatweaveActions
{
	# Actions to cast from Cat Form.
	# [*] Always apply Empowered Rake if available.
	if Stealthed() Spell(rake)
	if ComboPoints() >= 5
	{
		# Cast Rip if you are at 5 Combo Points and Rip is either not ticking,
		# or will fall off before you have another chance to re-apply it.
		if (target.DebuffExpires(rip) or target.DebuffRefreshable(rip)) Spell(rip)
		# Cast Ferocious Bite if you are at 5 Combo Points.
		Spell(ferocious_bite)
	}
	# Cast Rake if Rake is either not ticking, or will fall off before you
	# have another chance to re-apply it. If possible, allow Empowered Rake
	# to tick all the way to completion.
	if target.DebuffExpires(rake_debuff) Spell(rake)
	if (target.DebuffRefreshable(rake_debuff) and target.DebuffPersistentMultiplier(rake_debuff) < PersistentMultiplier(rake_debuff)) Spell(rake)
	# Generate Combo Points with fillers.
	if (Enemies(tagged=1) > 1) Spell(swipe_cat)
	Spell(shred)
}

AddFunction GuardianOwlweaveActions
{
	# Actions to cast from Moonkin Form.
	# Refresh DoTs.
	if target.DebuffRefreshable(sunfire_debuff) Spell(sunfire)
	if target.DebuffRefreshable(moonfire_debuff) Spell(moonfire)
	if BuffPresent(galactic_guardian_buff)
	{
		if (Enemies(tagged=1) == 1) Spell(moonfire)
		GuardianMoonfireCycle()
	}
	# Use Starsurge during Eclipse.
	if BuffPresent(eclipse_lunar_buff) or BuffPresent(eclipse_solar_buff) Spell(starsurge)
	# Use Starfire or Wrath depending on the Eclipse.
	if BuffPresent(eclipse_lunar_buff) Spell(starfire)
	if BuffPresent(eclipse_solar_buff) Spell(wrath)
	# Use Starfire or Wrath to move into the next Eclipse state.
	if EclipseAnyNext()
	{
		if IsCovenant(night_fae) Spell(starfire)
		Spell(wrath)
	}
	if EclipseLunarNext() Spell(wrath)
	if EclipseSolarNext() Spell(starfire)
}

AddFunction GuardianPrecombatShortCdActions
{
	PrecombatShortCdActions()
	# Use Bristling Fur to generate Rage when entering a new pull.
	Spell(bristling_fur)
	Spell(adaptive_swarm)
}

AddFunction GuardianShortCdActions
{
	Spell(adaptive_swarm)
	# Maintain at least one stack of Ironfur and don't cap on Rage.
	if (BuffRemaining(ironfur) < 1 or RageDeficit() < 40) Spell(ironfur)
	# Use Frenzied Regeneration between 50% and 20% health.
	if HealthPercent() < (50 - 20 * (2 - Charges(frenzied_regeneration count=0)))
	{
		if not BuffPresent(frenzied_regeneration) Spell(frenzied_regeneration)
	}
	Spell(bristling_fur)
}

AddFunction GuardianPrecombatMainActions
{
	if Stance(druid_moonkin_form)
	{
		if IsCovenant(night_fae) Spell(starfire)
		Spell(wrath)
	}
}

AddFunction GuardianMainActions
{
	if Stance(druid_bear_form)
	{
		GuardianBearActions()
	}
	if Stance(druid_cat_form)
	{
		if Talent(feral_affinity_talent) GuardianCatweaveActions()
		if not Talent(feral_affinity_talent) Spell(bear_form)
	}
	if Stance(druid_moonkin_form)
	{
		GuardianOwlweaveActions()
	}
	if not Stance(druid_bear_form) and not Stance(druid_cat_form) and not Stance(druid_moonkin_form)
	{
		Spell(wild_growth)
		Spell(swiftmend)
		if BuffRefreshable(rejuvenation) Spell(rejuvenation)
		Spell(regrowth)
	}
}

AddFunction GuardianPrecombatCdActions
{
	PrecombatCdActions()
}

AddFunction GuardianOffensiveCdActions
{
	if (Stance(druid_cat_form) and Talent(feral_affinity_talent)) or Stance(druid_moonkin_form)
	{
		Spell(heart_of_the_wild)
		Spell(convoke_the_spirits)
	}
}

AddFunction GuardianDefensiveCdActions
{
	if Stance(druid_bear_form)
	{
		Spell(pulverize)
		if not BuffPresent(damage_reduction_cooldown_buff)
		{
			Spell(barkskin)
			Spell(survival_instincts)
		}
	}
}

AddFunction GuardianCdActions
{
	GuardianDefensiveCdActions()
	GuardianOffensiveCdActions()
}

AddFunction GuardianInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if (focus.InRange(skull_bash) and focus.IsInterruptible()) Spell(skull_bash text=focus)
		if not focus.Classification(worldboss)
		{
			if focus.inRange(maim) Spell(maim text=focus)
			if (focus.Distance() < 10) Spell(incapacitating_roar text=focus)
			if (focus.Distance() < 15) Spell(typhoon text=focus)
			if focus.InRange(mighty_bash) Spell(mighty_bash text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if (target.InRange(skull_bash) and target.IsInterruptible()) Spell(skull_bash)
		if not target.Classification(worldboss)
		{
			if target.inRange(maim) Spell(maim text=focus)
			if (target.Distance() < 10) Spell(incapacitating_roar)
			if (target.Distance() < 15) Spell(typhoon)
			if target.InRange(mighty_bash) Spell(mighty_bash)
		}
	}
	InterruptActions()
}

AddFunction GuardianDispelActions
{
	OffensiveDispelActions()
	if target.HasDebuffType(enrage) Spell(soothe)
	if player.HasDebuffType(poison curse) Spell(remove_corruption)
	DefensiveDispelActions()
}

AddFunction GuardianHealActions
{
	ItemHealActions()
	if (HealthPercent() < 50) Spell(renewal)
}

### User Interface ###

AddIcon help=interrupt size=small
{
	GuardianInterruptActions()
	GuardianDispelActions()
	GuardianHealActions()
}

AddIcon help=shortcd
{
	if not InCombat() GuardianPrecombatShortCdActions()
	GuardianShortCdActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() GuardianPrecombatMainActions()
	GuardianMainActions()
}

AddIcon help=aoe
{
	if not InCombat() GuardianPrecombatMainActions()
	GuardianMainActions()
}

AddIcon help=cd
{
	if not InCombat() GuardianPrecombatCdActions()
	GuardianCdActions()
}

AddIcon help=offensive size=small
{
	if not InCombat()
	{
		Spell(moonkin_form)
		if Talent(feral_affinity_talent) Spell(prowl)
	}
	if InCombat()
	{
		GuardianShapeshiftActions()
	}
	if not GuardianInRange()
	{
		if (Stance(druid_bear_form) and target.InRange(wild_charge_bear)) Spell(wild_charge_bear)
		if (Stance(druid_cat_form) and target.InRange(wild_charge_cat)) Spell(wild_charge_cat)
		if (Stance(druid_bear_form) or Stance(druid_cat_form)) Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("DRUID", "guardian", name, desc, code, "script")
end