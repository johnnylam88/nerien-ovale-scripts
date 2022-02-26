local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_druid_balance"
	local desc = string.format("[9.2] %s: Druid - Balance", Private.name)
	local code = [[
# Adapted from Icy Vein's "Balance Druid DPS Rotation, Cooldowns,
#   and Abilities — Shadowlands 9.2" by Bora
# https://www.icy-veins.com/wow/balance-druid-pve-dps-rotation-cooldowns-abilities

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(feral_affinity_talent 22155)
Define(force_of_nature_talent 22387)
Define(fury_of_elune_talent 21193)
Define(guardian_affinity_talent 22157)
Define(heart_of_the_wild_talent 18577)
Define(incarnation_chosen_of_elune_talent 21702)
Define(mighty_bash_talent 21778)
Define(new_moon_talent 21655)
Define(renewal_talent 18570)
Define(restoration_affinity_talent 22159)
Define(soul_of_the_forest_talent 18580)
Define(starlord_talent 21706)
Define(stellar_drift_talent 21712)
Define(stellar_flare_talent 22165)
Define(warrior_of_elune_talent 22386)
Define(wild_charge_talent 18571)

# Class Abilities
Define(barkskin 22812)
	SpellInfo(barkskin cd=60 duration=8 gcd=0 offgcd=1)
	SpellAddBuff(barkskin barkskin add=1)
Define(bear_form 5487)
	SpellInfo(bear_form to_stance=druid_bear_form)
	SpellRequire(bear_form unusable set=1 enabled=(Stance(druid_bear_form)))
	SpellAddBuff(bear_form bear_form add=1)
Define(cat_form 768)
	SpellInfo(cat_form to_stance=druid_cat_form)
	SpellRequire(cat_form unusable set=1 enabled=(Stance(druid_cat_form)))
	SpellAddBuff(cat_form cat_form add=1)
Define(celestial_alignment 194223)
	SpellInfo(celestial_alignment cd=180 duration=20)
	SpellRequire(celestial_alignment replaced_by set=incarnation_chosen_of_elune enabled=(Talent(incarnation_chosen_of_elune_talent)))
	SpellAddBuff(celestial_alignment eclipse_lunar_buff add=1)
	SpellAddBuff(celestial_alignment eclipse_solar_buff add=1)
	SpellAddBuff(celestial_alignment celestial_alignment add=1)
Define(eclipse_lunar_buff 48518)
	SpellInfo(eclipse_lunar_buff duration=15)
Define(eclipse_solar_buff 48517)
	SpellInfo(eclipse_solar_buff duration=15)
Define(ferocious_bite 22568)
	SpellInfo(ferocious_bite energy=25 combopoints=1 max_combopoints=5 gcd=1)
	SpellRequire(ferocious_bite unusable set=1 enabled=(not Stance(druid_cat_form)))
Define(force_of_nature 205636)
	SpellInfo(force_of_nature cd=60 lunarpower=-20)
	SpellRequire(force_of_nature unusable set=1 enabled=(not Talent(force_of_nature_talent)))
Define(frenzied_regeneration 22842)
	SpellInfo(frenzied_regeneration rage=10 charge_cd=36 cd_haste=1 duration=3 tick=1)
	SpellRequire(frenzied_regeneration unusable set=1 enabled=(not (Talent(guardian_affinity_talent) and Stance(druid_bear_form))))
	SpellAddBuff(frenzied_regeneration frenzied_regeneration add=1)
Define(full_moon 274283)
	SpellInfo(full_moon lunarpower=-40 charge_cd=20)
	SpellRequire(full_moon unusable set=1 enabled=(not Talent(new_moon_talent)))
Define(fury_of_elune 202770)
	SpellInfo(fury_of_elune cd=60 duration=8 lunarpower=-5)
	SpellRequire(fury_of_elune unusable set=1 enabled=(not Talent(fury_of_elune_talent)))
Define(half_moon 274282)
	SpellInfo(half_moon lunarpower=-20 charge_cd=20)
	SpellRequire(half_moon unusable set=1 enabled=(not Talent(new_moon_talent)))
Define(heart_of_the_wild 319454)
	SpellInfo(heart_of_the_wild cd=300 duration=45)
	SpellRequire(heart_of_the_wild unusable set=1 enabled=(not Talent(heart_of_the_wild_talent)))
	SpellAddBuff(heart_of_the_wild heart_of_the_wild add=1)
Define(incapacitating_roar 99)
	SpellInfo(incapacitating_roar cd=30 duration=3 to_stance=druid_bear_form)
	SpellRequire(incapacitating_roar unusable set=1 enabled=(not Talent(guardian_affinity_talent)))
	SpellAddTargetDebuff(incapacitating_roar incapacitating_roar add=1)
Define(incarnation_chosen_of_elune 102560)
	SpellInfo(incarnation_chosen_of_elune cd=180 duration=30)
	SpellRequire(incarnation_chosen_of_elune unusable set=1 enabled=(not Talent(incarnation_chosen_of_elune_talent)))
	SpellAddBuff(incarnation_chosen_of_elune eclipse_lunar_buff add=1)
	SpellAddBuff(incarnation_chosen_of_elune eclipse_solar_buff add=1)
	SpellAddBuff(incarnation_chosen_of_elune incarnation_chosen_of_elune add=1)
Define(ironfur 192081)
	SpellInfo(ironfur rage=40 cd=0.5 duration=7 gcd=0 offgcd=1)
	SpellRequire(ironfur unusable set=1 enabled=(not Stance(druid_bear_form)))
	SpellAddBuff(ironfur ironfur add=1)
Define(maim 22570)
	SpellInfo(maim energy=30 combopoints=1 max_combopoints=5 cd=20 gcd=1)
	SpellRequire(maim unusable set=1 enabled=(not (Talent(feral_affinity_talent) and Stance(druid_cat_form))))
Define(mangle 33917)
	SpellInfo(mangle cd=6 cd_haste=1 rage=-10)
	SpellRequire(mangle unusable set=1 enabled=(not Stance(druid_bear_form)))
Define(mighty_bash 5211)
	SpellInfo(mighty_bash cd=60 duration=4)
	SpellRequire(mighty_bash unusable set=1 enabled=(not Talent(mighty_bash_talent)))
	SpellAddTargetDebuff(mighty_bash mighty_bash add=1)
Define(moonfire 8921)
	SpellInfo(moonfire lunarpower=-2)
	SpellAddTargetDebuff(moonfire moonfire_debuff add=1)
Define(moonfire_debuff 164812)
	SpellInfo(moonfire_debuff duration=12 gcd=0 offgcd=1 tick=2)
	SpellAddTargetDebuff(moonfire moonfire_debuff add=1)
Define(moonkin_form 197625)
	SpellInfo(moonkin_form to_stance=druid_moonkin_form)
	SpellRequire(moonkin_form unusable set=1 enabled=(Stance(druid_moonkin_form)))
	SpellAddBuff(moonkin_form moonkin_form add=1)
Define(new_moon 274281)
	SpellInfo(new_moon lunarpower=-10 charge_cd=20)
	SpellRequire(new_moon unusable set=1 enabled=(not Talent(new_moon_talent)))
Define(prowl 5215)
	SpellInfo(prowl cd=6 gcd=0 offgcd=1 to_stance=druid_cat_form)
	SpellRequire(prowl unusable set=1 enabled=(InCombat() or BuffPresent(prowl)))
	SpellAddBuff(prowl prowl add=1)
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
Define(solar_beam 78675)
	SpellInfo(solar_beam cd=60 gcd=0 offgcd=1 interrupt=1)
Define(soothe 2908)
	SpellInfo(soothe cd=10)
Define(starfall 191034)
	SpellInfo(starfall duration=8 lunarpower=50)
	SpellRequire(starfall cd set=12 enabled=(Talent(stellar_drift_talent)))
	SpellAddBuff(starfall starfall add=1)
Define(starfire 194153)
	SpellInfo(starfire lunarpower=-8)
	SpellRequire(starfire lunarpower add=-3 enabled=(BuffPresent(warrior_of_elune)))
	SpellAddBuff(starfire eclipse_solar_buff add=1 enabled=(EclipseSolarIn() == 1))
Define(starlord_buff 279709)
	SpellInfo(starlord_buff duration=15)
	SpellAddBuff(starfall starlord add=1 enabled=(Talent(starlord_talent)))
	SpellAddBuff(starsurge starlord add=1 enabled=(Talent(starlord_talent)))
Define(starsurge 78674)
	SpellInfo(starsurge lunarpower=30)
Define(stellar_flare 202347)
	SpellInfo(stellar_flare duration=24 lunarpower=-8)
	SpellRequire(stellar_flare unusable set=1 enabled=(not Talent(stellar_flare_talent)))
	SpellAddTargetDebuff(stellar_flare stellar_flare add=1)
Define(sunfire 93402)
	SpellInfo(sunfire lunarpower=-2)
	SpellAddTargetDebuff(sunfire sunfire_debuff add=1)
Define(sunfire_debuff 164815)
	SpellInfo(sunfire_debuff duration=18 gcd=0 offgcd=1 tick=2)
Define(swiftmend 18562)
	SpellInfo(swiftmend cd=15)
	SpellRequire(swiftmend unusable set=1 enabled=(not Talent(restoration_affinity_talent)))
	SpellRequire(swiftmend unusable set=1 enabled=(not BuffPresent(regrowth) and not BuffPresent(wild_growth) and not BuffPresent(rejuvenation)))
	SpellAddBuff(swiftmend regrowth set=0 enabled=(BuffPresent(regrowth)))
	SpellAddBuff(swiftmend wild_growth set=0 enabled=(not BuffPresent(regrowth) and BuffPresent(wild_growth)))
	SpellAddBuff(swiftmend rejuvenation set=0 enabled=(not BuffPresent(regrowth) and not BuffPresent(wild_growth) and BuffPresent(rejuvenation)))
Define(swipe_bear 213771)
	SpellRequire(swipe_bear unusable set=1 enabled=(not (Talent(feral_affinity_talent) and Stance(druid_bear_form))))
Define(swipe_cat 106785)
	SpellInfo(swipe_cat energy=35 gcd=1 combopoints=-1)
	SpellRequire(swipe_cat unusable set=1 enabled=(not (Talent(feral_affinity_talent) and Stance(druid_cat_form))))
Define(thrash_bear 77758)
	SpellInfo(thrash_bear cd=6 cd_haste=1 rage=-5)
	SpellRequire(thrash_bear unusable set=1 enabled=(not (Talent(guardian_affinity_talent) and Stance(druid_bear_form))))
	SpellAddTargetDebuff(thrash_bear thrash_bear_debuff add=1)
Define(thrash_bear_debuff 192090)
	SpellInfo(thrash_bear_debuff duration=15 max_stacks=3)
Define(thrash_cat 106830)
	SpellInfo(thrash_cat energy=40 gcd=1 combopoints=-1 duration=15)
	SpellRequire(thrash_cat unusable set=1 enabled=(not (Talent(guardian_affinity_talent) and Stance(druid_cat_form))))
	SpellAddTargetDebuff(thrash_cat thrash_cat add=1)
Define(typhoon 132469)
	SpellInfo(typhoon cd=30)
Define(ursols_vortex 102793)
	SpellInfo(ursols_vortex cd=60)
	SpellRequire(ursols_vortex unusable set=1 enabled=(not Talent(restoration_affinity_talent)))
Define(warrior_of_elune 202425)
	SpellInfo(warrior_of_elune cd=4 duration=4)
	SpellRequire(warrior_of_elune unusable set=1 enabled=(not Talent(warrior_of_elune_talent)))
	SpellAddBuff(starfire warrior_of_elune add=-1)
	SpellAddBuff(warrior_of_elune warrior_of_elune add=3)
Define(wild_charge_bear 16979)
	SpellInfo(wild_charge_bear cd=15 gcd=0 offgcd=1)
	SpellRequire(wild_charge_bear unusable set=1 enabled=(not (Talent(wild_charge_talent) and Stance(druid_bear_form))))
Define(wild_charge_cat 49376)
	SpellInfo(wild_charge_cat cd=15 gcd=0 offgcd=1)
	SpellRequire(wild_charge_cat unusable set=1 enabled=(not (Talent(wild_charge_talent) and Stance(druid_cat_form))))
Define(wild_growth 48438)
	SpellInfo(wild_growth cd=20 duration=7 tick=1)
	SpellRequire(wild_growth unusable set=1 enabled=(not Talent(restoration_affinity_talent)))
	SpellAddBuff(wild_growth wild_growth add=1)
Define(wrath 190984)
	SpellInfo(wrath lunarpower=-6)
	SpellRequire(wrath lunarpower add=-3 enabled=(Talent(soul_of_the_forest_talent) and BuffPresent(eclipse_solar_buff)))
	SpellAddBuff(wrath eclipse_lunar_buff add=1 enabled=(EclipseLunarIn() == 1))

# Covenant Abilities
# XXX TODO: Kyrian abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(adaptive_swarm 325727)
	SpellInfo(adaptive_swarm cd=25)
	SpellRequire(adaptive_swarm unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(adaptive_swarm unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellAddTargetDebuff(adaptive_swarm adaptive_swarm_damage add=3)
Define(adaptive_swarm_damage 325733)
	SpellInfo(adaptive_swarm_damage duration=12 max_stacks=5 gcd=0 offgcd=1 tick=2)
	SpellRequire(adaptive_swarm_damage unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(adaptive_swarm_damage unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellAddTargetDebuff(adaptive_swarm_damage adaptive_swarm_damage add=1)
Define(adaptive_swarm_heal 325748)
	SpellInfo(adaptive_swarm_heal duration=12 max_stacks=5 gcd=0 offgcd=1 tick=2)
	SpellRequire(adaptive_swarm_heal unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(adaptive_swarm_heal unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellAddTargetDebuff(adaptive_swarm_heal adaptive_swarm_heal add=1)
Define(convoke_the_spirits 323764)
	SpellInfo(convoke_the_spirits cd=120 duration=4 channel=4 max_stacks=99 tick=0.25)
	SpellRequire(convoke_the_spirits unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(convoke_the_spirits unusable set=1 enabled=(not IsCovenant(night_fae)))
	SpellAddBuff(convoke_the_spirits convoke_the_spirits add=1)
Define(ravenous_frenzy 323546)
	SpellInfo(ravenous_frenzy cd=180 duration=20 max_stacks=99 gcd=0 offgcd=1 tick=0.1)
	SpellRequire(ravenous_frenzy unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(ravenous_frenzy unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddBuff(ravenous_frenzy ravenous_frenzy add=1)

# Runeforge Legendary Effects
Define(balance_of_all_things_runeforge 7107)
Define(balance_of_all_things_buff 339943)
	SpellInfo(balance_of_all_things_buff duration=8)
Define(celestial_spirits_runeforge 7571)
	SpellRequire(convoke_the_spirits cd add=-60 enabled=(EquippedRuneforge(celestial_spirits_runeforge)))
	SpellRequire(convoke_the_spirits duration add=-1 enabled=(EquippedRuneforge(celestial_spirits_runeforge)))
Define(sinful_hysteria_runeforge 7474)
Define(sinful_hysteria_buff 355315)
	SpellInfo(sinful_hysteria_buff duration=3)

### Functions ###

AddFunction BalanceCelestialAlignmentPresent
{
	BuffPresent(celestial_alignment) or
	(Talent(incarnation_chosen_of_elune_talent) and BuffPresent(incarnation_chosen_of_elune))
}

AddFunction BalanceCelestialAlignmentRemaining
{
	if Talent(incarnation_chosen_of_elune_talent) BuffRemaining(incarnation_chosen_of_elune)
	if not Talent(incarnation_chosen_of_elune_talent) BuffRemaining(celestial_alignment)
}

AddFunction BalanceEclipseRemaining
{
	if BuffPresent(eclipse_lunar_buff) BuffRemaining(eclipse_lunar_buff)
	if BuffPresent(eclipse_solar_buff) BuffRemaining(eclipse_solar_buff)
	0
}

AddFunction BalanceDotsAreOnTarget
{
	# For multi-target situations, only maintain the Sunfire DoT.
	(target.DebuffPresent(sunfire_debuff) and not target.DebuffRefreshable(sunfire_debuff)) and
	(Enemies(tagged=1) > 1 or
		(target.DebuffPresent(moonfire_debuff) and not target.DebuffRefreshable(moonfire_debuff)) and
		(not Talent(stellar_flare) or (target.DebuffPresent(stellar_flare) and not target.DebuffRefreshable(stellar_flare))))
}

AddFunction BalanceIsInEclipse
{
	BuffPresent(eclipse_lunar_buff) or BuffPresent(eclipse_solar_buff)
}

AddFunction BalanceTimeToNextEclipse
{
	if BuffPresent(eclipse_lunar_buff) { BuffRemaining(eclipse_lunar_buff) + 2 * CastTime(starfire) }
	if BuffPresent(eclipse_solar_buff) { BuffRemaining(eclipse_solar_buff) + 2 * CastTime(wrath) }
	if not BalanceIsInEclipse()
	{
		if (EclipseAnyNext() or EclipseLunarNext()) { EclipseLunarIn() * CastTime(wrath) }
		if (EclipseSolarNext()) { EclipseSolarIn() * CastTime(starfire) }
	}
}

AddFunction BalancePrecombatShortCdActions
{
	PrecombatShortCdActions()
}

AddFunction BalanceShortCdActions
{
	if BalanceIsInEclipse()
	{
		Spell(adaptive_swarm)
		Spell(force_of_nature)
		Spell(warrior_of_elune)
		Spell(fury_of_elune)
	}
}

AddFunction BalanceFillerActions
{
	if BalanceIsInEclipse()
	{
		# Prefer Starfire during Celestial Alignment for multi-target.
		if (Enemies(tagged=1) > 1 and BuffPresent(eclipse_lunar_buff)) Spell(starfire)
		if BuffPresent(eclipse_solar_buff) Spell(wrath)
		if BuffPresent(eclipse_lunar_buff) Spell(starfire)
	}
	if (EclipseAnyNext() or EclipseLunarNext())
	{
		if (EclipseLunarIn() == 2) Spell(wrath text=2)
		if (EclipseLunarIn() == 1) Spell(wrath text=1)
	}
	if EclipseSolarNext()
	{
		if (EclipseSolarIn() == 2) Spell(starfire text=2)
		if (EclipseSolarIn() == 1) Spell(starfire text=1)
	}
}

AddFunction BalanceMaintainDoTActions
{
	if not target.DebuffPresent(sunfire_debuff) Spell(sunfire)
	if target.DebuffRefreshable(sunfire_debuff) Spell(sunfire text=refresh)
	if not target.DebuffPresent(moonfire_debuff) Spell(moonfire)
	if target.DebuffRefreshable(moonfire_debuff) Spell(moonfire text=refresh)
	if not target.DebuffPresent(stellar_flare) Spell(stellar_flare)
	if target.DebuffRefreshable(stellar_flare) Spell(stellar_flare text=refresh)
	if (BalanceEclipseRemaining() < 6)
	{
		if (target.DebuffRemaining(sunfire_debuff) < BalanceTimeToNextEclipse()) Spell(sunfire text=early)
		if (target.DebuffRemaining(moonfire_debuff) < BalanceTimeToNextEclipse()) Spell(moonfire text=early)
		if (target.DebuffRemaining(stellar_flare) < BalanceTimeToNextEclipse()) Spell(stellar_flare text=early)
	}
}

AddFunction BalanceNewMoonActions
{
	# Don't cap on charges of New/Half/Full Moon.
	if (Talent(new_moon_talent) and SpellCharges(new_moon) >= 2.8)
	{
		Spell(full_moon)
		Spell(half_moon)
		Spell(new_moon)
	}
}

AddFunction BalancePrecombatMainActions { }

AddFunction BalanceMainActions
{
	if BalanceIsInEclipse()
	{
		if BuffPresent(sinful_hysteria_buff) Spell(starsurge text=burn)
		if BuffPresent(ravenous_frenzy)
		{
			# Keep astral power between 60 and 90.
			if (AstralPowerDeficit() <= 10) Spell(starsurge text=cap)
			# Depending on if Sinful Hysteria is equipped, spam Starsurge when the stacks of Ravenous Frenzy are highest.
			if EquippedRuneforge(sinful_hysteria_runeforge)
			{
				if (BuffRemaining(ravenous_frenzy) < 1) Spell(starsurge text=burn)
			}
			if not EquippedRuneforge(sinful_hysteria_runeforge)
			{
				if (BuffRemaining(ravenous_frenzy) < 1 + BuffDuration(sinful_hysteria_buff)) Spell(starsurge text=burn)
			}
		}
		if not BuffPresent(ravenous_frenzy)
		{
			BalanceMaintainDoTActions()
			if (IsCovenant(night_fae) and BalanceCelestialAlignmentPresent())
			{
				if (Spell(convoke_the_spirits) and AstralPowerDeficit() < 50) Spell(starsurge text=dump)
			}
			if (BuffPresent(eclipse_lunar_buff) and AstralPowerDeficit() <= 16) Spell(starsurge)
			if (BuffPresent(eclipse_solar_buff) and AstralPowerDeficit() <= 12) Spell(starsurge)
			if BalanceEclipseRemaining() > 10 Spell(starsurge)
			if Talent(new_moon_talent) and BuffPresent(eclipse_lunar_buff)
			{
				Spell(full_moon)
				Spell(half_moon)
			}
			BalanceNewMoonActions()
		}
	}
	BalanceFillerActions()
}

AddFunction BalancePrecombatAoEActions { }

AddFunction BalanceAoEActions
{
	if (not target.DebuffPresent(sunfire_debuff) or target.DebuffRefreshable(sunfire_debuff)) Spell(sunfire)
	if not BuffPresent(starfall) or BuffRefreshable(starfall) Spell(starfall)
	if BalanceIsInEclipse()
	{
		if (AstralPower() >= AstralPowerCost(starfall) + AstralPowerCost(starsurge)) Spell(starsurge)
		if BuffPresent(eclipse_solar_buff) and not BuffPresent(eclipse_lunar_buff)
		{
			if (not target.DebuffPresent(moonfire_debuff) or target.DebuffRefreshable(moonfire_debuff)) Spell(moonfire text=cycle)
		}
	}
	BalanceFillerActions()
}

AddFunction BalancePrecombatCdActions
{
	PrecombatCdActions()
}

AddFunction BalanceCdActions
{
	if (BalanceIsInEclipse() and not BalanceMaintainDoTActions())
	{
		if IsCovenant(venthyr)
		{
			# Always use Ravenous Frenzy with Celestial Alignment.
			if (Spell(ravenous_frenzy) and Spell(celestial_alignment))
			{
				Spell(ravenous_frenzy)
			}
			if BuffPresent(ravenous_frenzy) Spell(celestial_alignment)
		}
		if not IsCovenant(venthyr)
		{
			Spell(celestial_alignment)
			if (AstralPowerDeficit() > 50) Spell(convoke_the_spirits)
		}
	}
}

AddFunction BalanceDefensiveActions
{
	if not BuffPresent(barkskin) Spell(barkskin)
	ItemHealActions()
	if not Stance(druid_bear_form) Spell(bear_form)
	Spell(frenzied_regeneration)
}

AddFunction BalanceInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if focus.IsInterruptible()
		{
			if focus.InRange(solar_beam) Spell(solar_beam text=focus)
		}
		if not focus.Classification(worldboss)
		{
			if focus.InRange(maim) Spell(maim text=focus)
			if (focus.Distance() < 10) Spell(incapacitating_roar text=focus)
			if (focus.Distance() < 15) Spell(typhoon text=focus)
			if focus.InRange(mighty_bash) Spell(mighty_bash text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if target.IsInterruptible()
		{
			if target.InRange(solar_beam) Spell(solar_beam)
		}
		if not target.Classification(worldboss)
		{
			if target.InRange(maim) Spell(maim)
			if (target.Distance() < 10) Spell(incapacitating_roar)
			if (target.Distance() < 15) Spell(typhoon)
			if target.InRange(mighty_bash) Spell(mighty_bash)
		}
	}
}

AddFunction BalanceDispelActions
{
	OffensiveDispelActions()
	if target.HasDebuffType(enrage) Spell(soothe)
	if player.HasDebuffType(curse poison) Spell(remove_corruption)
	DefensiveDispelActions()
}

### User Interface ###

AddIcon help=interrupt size=small
{
	BalanceInterruptActions()
	BalanceDispelActions()
	BalanceDefensiveActions()
}

AddIcon help=shortcd
{
	if not InCombat() BalancePrecombatShortCdActions()
	BalanceShortCdActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() BalancePrecombatMainActions()
	BalanceMainActions()
}

AddIcon help=aoe
{
	if not InCombat() BalancePrecombatAoEActions()
	BalanceAoEActions()
}

AddIcon help=cd
{
	if not Stance(druid_moonkin_form) Spell(moonkin_form)
	if not InCombat() BalancePrecombatCdActions()
	BalanceCdActions()
}

AddIcon help=trinkets size=small
{
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket0Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("DRUID", "balance", name, desc, code, "script")
end