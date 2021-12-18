local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_mage_arcane"
	local desc = string.format("[9.1] %s: Mage - Arcane", Private.name)
	local code = [[
# Adapted from "Toegrinder Arcane Mage Compendium"
# https://tinyurl.com/arcane-mage-compendium

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(amplification_talent 22458)
Define(arcane_echo_talent 22467)
Define(arcane_familiar_talent 22464)
Define(arcane_orb_talent 22449)
Define(enlightened_talent 21145)
Define(focus_magic_talent 22445)
Define(ice_ward_talent 22448)
Define(master_of_time_talent 23072)
Define(nether_tempest_talent 22470)
Define(ring_of_frost_talent 22471)
Define(rule_of_threes_talent 22461)
Define(rune_of_power_talent 22447)
Define(shimmer_talent 22443)
Define(slipstream_talent 16025)
Define(supernova_talent 22474)

# Class Abilities
Define(alter_time 342245)
	SpellInfo(alter_time cd=60)
Define(alter_time_buff 342246)
	SpellInfo(alter_time_buff duration=10)
	SpellAddBuff(alter_time alter_time_buff add=1)
Define(arcane_barrage 44425)
	SpellInfo(arcane_barrage cd=3 cd_haste=1 arcanecharges=0 max_arcanecharges=4)
Define(arcane_blast 30451)
	SpellInfo(arcane_blast arcanecharges=-1)
Define(arcane_explosion 1449)
	SpellInfo(arcane_explosion arcanecharges=-1)
Define(arcane_familiar 205022)
	SpellInfo(arcane_familiar cd=10)
	SpellRequire(arcane_familiar unusable set=1 enabled=(not Talent(arcane_familiar_talent)))
Define(arcane_familiar_buff 210126)
	SpellInfo(arcane_familiar_buff duration=3600)
	SpellAddBuff(arcane_familiar arcane_familiar_buff add=1)
Define(arcane_intellect 1459)
	SpellInfo(arcane_intellect duration=3600)
	SpellAddBuff(arcane_intellect arcane_intellect add=1)
Define(arcane_missiles 5143)
	SpellInfo(arcane_missiles channel=3 cd_haste=1)
Define(arcane_orb 153626)
	SpellInfo(arcane_orb cd=20 arcanecharges=-1)
	SpellRequire(arcane_orb unusable set=1 enabled=(not Talent(arcane_orb_talent)))
Define(arcane_power 12042)
	SpellInfo(arcane_power cd=120 duration=10 gcd=0 offgcd=1)
	SpellRequire(arcane_power duration add=5 enabled=(Level() >= 56))
	SpellAddBuff(arcane_power arcane_power add=1)
Define(blink 1953)
	SpellInfo(blink cd=15 cd_haste=1)
Define(clearcasting_buff 263725)
	SpellInfo(clearcasting_buff duration=15)
	SpellAddBuff(arcane_explosion clearcasting_buff add=-1)
	SpellAddBuff(arcane_missiles clearcasting_buff add=-1)
Define(conjure_mana_gem 759)
Define(counterspell 2139)
	SpellInfo(counterspell cd=24 gcd=0 offgcd=1)
Define(evocation 12051)
	SpellInfo(evocation cd=90 channel=6 duration=6)
	SpellAddBuff(evocation evocation add=1)
Define(fire_blast 319836)
	SpellInfo(fire_blast cd=12 cd_haste=1)
Define(focus_magic 321358)
	SpellRequire(focus_magic unusable set=1 enabled=(not Talent(focus_magic_talent)))
	SpellAddTargetBuff(focus_magic focus_magic add=1)
Define(frost_nova 122)
	SpellRequire(frost_nova cd set=30 enabled=(not Talent(ice_ward_talent)))
	SpellRequire(frost_nova charge_cd set=30 enabled=(Talent(ice_ward_talent)))
Define(frostbolt 116)
Define(greater_invisibility 110959)
	SpellInfo(greater_invisibility cd=120)
Define(greater_invisibility_buff 110960)
	SpellInfo(greater_invisibility_buff duration=20)
	SpellAddBuff(greater_invisibility greater_invisibility_buff add=1)
Define(hypothermia_debuff 41425)
	SpellInfo(hypothermia_debuff duration=30)
	SpellAddDebuff(ice_block hypothermia_debuff add=1)
Define(ice_block 45438)
	SpellInfo(ice_block cd=240)
	SpellRequire(ice_block unusable set=1 enabled=(DebuffPresent(hypothermia_debuff)))
Define(mana_gem 36799)
	ItemInfo(mana_gem cd=120)
Define(mirror_image 55342)
	SpellInfo(mirror_image cd=120)
Define(nether_precision_buff 336889)
	SpellInfo(nether_precision_buff duration=10)
	SpellAddBuff(arcane_explosion nether_precision_buff add=2 enabled=(BuffPresent(clearcasting_buff) and Conduit(nether_precision_conduit)))
	SpellAddBuff(arcane_missiles nether_precision_buff add=2 enabled=(BuffPresent(clearcasting_buff) and Conduit(nether_precision_conduit)))
	SpellAddBuff(arcane_blast nether_precision_buff add=-1 enabled=(Conduit(nether_precision_conduit)))
Define(nether_tempest 114923)
	SpellInfo(nether_tempest duration=12 tick=1)
	SpellRequire(nether_tempest unusable set=1 enabled=(not Talent(nether_tempest_talent)))
	SpellAddTargetDebuff(nether_tempest nether_tempest add=1)
Define(polymorph 118)
Define(presence_of_mind 205025)
	SpellInfo(presence_of_mind cd=60)
	SpellAddBuff(arcane_blast presence_of_mind add=-1)
	SpellAddBuff(presence_of_mind presence_of_mind add=2 enabled=(Level() < 54))
	SpellAddBuff(presence_of_mind presence_of_mind add=3 enabled=(Level() >= 54))
Define(prismatic_barrier 235450)
	SpellInfo(prismatic_barrier cd=25 duration=60)
	SpellAddBuff(prismatic_barrier prismatic_barrier add=1)
Define(remove_curse 475)
	SpellInfo(remove_curse cd=8)
Define(ring_of_frost 113724)
	SpellInfo(ring_of_frost cd=45)
	SpellRequire(ring_of_frost unusable set=1 enabled=(not Talent(ring_of_frost_talent)))
Define(rule_of_threes_buff 264774)
	SpellInfo(rule_of_threes_buff duration=15)
	SpellAddBuff(arcane_blast rule_of_threes_buff add=1 enabled=(Talent(rule_of_threes_talent) and ArcaneCharges() == 2))
	SpellAddBuff(arcane_orb rule_of_threes_buff add=1 enabled=(Talent(rule_of_threes_talent) and ArcaneCharges() == 2))
	SpellAddBuff(arcane_orb rule_of_threes_buff add=1 enabled=(Talent(rule_of_threes_talent) and ArcaneCharges() == 2))
	SpellAddBuff(touch_of_the_magi rule_of_threes_buff add=1 enabled=(Talent(rule_of_threes_talent)))
Define(rune_of_power 116011)
	SpellInfo(rune_of_power cd=45)
	SpellRequire(rune_of_power unusable set=1 enabled=(not Talent(rune_of_power_talent)))
Define(rune_of_power_buff 116014)
	SpellInfo(rune_of_power_buff duration=12)
	SpellAddBuff(arcane_power rune_of_power_buff add=1 enabled=(Talent(rune_of_power_talent)))
	SpellAddBuff(rune_of_power rune_of_power_buff add=1)
Define(shimmer 212653)
	SpellInfo(shimmer charge_cd=25 cd_haste=1 gcd=0 offgcd=1)
	SpellRequire(shimmer unusable set=1 enabled=(not Talent(shimmer_talent)))
	SpellRequire(blink replaced_by set=shimmer enabled=(Talent(shimmer_talent)))
Define(slow 31589)
Define(spellsteal 30449)
Define(temporal_displacement_debuff 80354)
	SpellInfo(temporal_displacement_debuff duration=600)
	SpellAddDebuff(time_warp temporal_displacement_debuff add=1)
Define(time_warp 80353)
	SpellInfo(time_warp cd=300 duration=40)
	SpellAddBuff(time_warp time_warp add=1)
Define(touch_of_the_magi 321507)
	SpellInfo(touch_of_the_magi cd=45 arcanecharges=-4)
Define(touch_of_the_magi_debuff 210824)
	SpellInfo(touch_of_the_magi_debuff duration=8)
	SpellAddTargetDebuff(touch_of_the_magi touch_of_the_magi_debuff add=1)

# Covenant Abilities
Define(deathborne 324220)
	SpellInfo(deathborne cd=180 duration=25)
	SpellRequire(deathborne unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellAddBuff(deathborne deathborne add=1)
Define(mirrors_of_torment 314793)
	SpellInfo(mirrors_of_torment cd=90 duration=25)
	SpellRequire(mirrors_of_torment unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddTargetDebuff(mirrors_of_torment mirrors_of_torment add=3)

# Conduits
Define(nether_precision_conduit 336886)

# Runeforge Legendary Effects
Define(arcane_bombardment_runeforge 6927)
Define(arcane_harmony_buff 332777)
	SpellAddBuff(arcane_missiles arcane_harmony_buff add=1 enabled=(EquippedRuneforge(arcane_infinity_runeforge)))
	SpellAddBuff(arcane_barrage arcane_harmony_buff set=0 enabled=(EquippedRuneforge(arcane_infinity_runeforge)))
Define(arcane_infinity_runeforge 6926)
Define(temporal_warp_runeforge 6834)
Define(temporal_warp_buff 327355)
	SpellInfo(temporal_warp_buff duration=40)
	SpellAddBuff(time_warp temporal_warp_buff add=1 enabled=(EquippedRuneforge(temporal_warp_runeforge)))

### Functions ###

AddFunction ArcaneTimeToZeroMana
{
	# It takes approximately 30 seconds to deplete a full mana bar using
	# Arcane Blast.
	TimeWithHaste(30 haste=spell) * (ManaPercent() / 100)
}

AddFunction ArcaneShouldEnterEvocationBurn
{
	# If Evocation is off cooldown, we are free to completely burn our
	# mana bar and use Evocation to regenerate it.
	SpellCooldown(evocation) < ArcaneTimeToZeroMana()
}

AddFunction ArcaneEvocationBurnActions
{
	if (ArcaneCharges() == MaxArcaneCharges() or target.DebuffRemaining(nether_tempest) < 3) Spell(nether_tempest text=evo)
	if (ArcaneCharges() <= 2) Spell(arcane_orb text=evo)
	if BuffPresent(rule_of_threes_buff) Spell(arcane_blast text=free)
	if BuffPresent(clearcasting_buff) Spell(arcane_missiles text=evo)
	if (ManaPercent() < 5) Spell(evocation)
	Spell(arcane_blast text=evo)
}

AddFunction ArcaneShouldBeFishing
{
	# Fish for Clearcasting procs before entering Arcane Power burn phase.
	# Enter Arcane Power burn phase if we hit 0 mana and use Evocation, or
	# we hit 3 Clearcasting procs before dropping below 30% mana.
	#
	SpellCooldown(arcane_power) < ArcaneTimeToZeroMana() and
	ArcaneShouldEnterEvocationBurn() and
	not (BuffStacks(clearcasting_buff) >= 3 and ManaPercent() > 30)
}

AddFunction ArcaneFishingActions
{
	if (ArcaneCharges() <= 2) Spell(arcane_orb text=fish)
	if (ManaPercent() < 5) Spell(evocation text=fish)
	Spell(arcane_blast text=fish)
}

AddFunction ArcaneShouldEnterArcanePowerBurn
{
	# Enter the burn phase when Arcane Power and preferably Touch of the
	# Magi are off cooldown. If Touch of the Magi is more than 15 seconds
	# away then you should not bother to wait and just enter the burn
	# phase anyway. By this point you should have also ensured that you
	# are above 30% mana.
	#
	ManaPercent() > 30 and
	not SpellCooldown(arcane_power) > 0 and
	(not SpellCooldown(touch_of_the_magi) > 0 or SpellCooldown(touch_of_the_magi) > 15)
}

AddFunction ArcaneWithinArcanePowerBurn
{
	BuffPresent(arcane_power) or
	(
		# Check in case Arcane Power is shorter than Rune of Power.
		Talent(rune_of_power_talent) and BuffPresent(rune_of_power_buff) and
		SpellCooldown(arcane_power) > SpellCooldownDuration(arcane_power) - BaseDuration(rune_of_power_buff)
	)
}

AddFunction ArcaneArcanePowerBurnActions
{
	# Cast Mirrors of Torment about 8 seconds prior to TotM to get two activations inside the TotM window.
	if (SpellCooldown(touch_of_the_magi) < 8) Spell(mirrors_of_torment)

	# Fish for Clearcasting procs before entering Arcane Burn phase.
	if ArcaneShouldBeFishing() ArcaneFishingActions()

	if (ArcaneShouldEnterArcanePowerBurn() or ArcaneWithinArcanePowerBurn())
	{
		if (ArcaneCharges() > 0 and SpellCooldown(touch_of_the_magi) < GCD()) Spell(arcane_barrage text=totm)
		if (ArcaneCharges() == MaxArcaneCharges() or target.DebuffRemaining(nether_tempest) < 3) Spell(nether_tempest)
		Spell(touch_of_the_magi)
		if (SpellCooldown(touch_of_the_magi) > 0) Spell(arcane_power)
		if BuffPresent(arcane_power) Spell(deathborne)
		if (Talent(arcane_echo_talent) and target.DebuffPresent(touch_of_the_magi_debuff)) Spell(arcane_missiles text=echo)
		if (
			(Talent(rune_of_power_talent) and BuffPresent(rune_of_power_buff) and BuffRemaining(rune_of_power_buff) < 2) or
			(not Talent(rune_of_power_talent) and target.DebuffPresent(touch_of_the_magi_debuff) and target.DebuffRemaining(touch_of_the_magi_debuff) < 2) or
			(BuffPresent(arcane_power) and BuffRemaining(arcane_power) < 2)
		) {
			Spell(presence_of_mind)
			if BuffPresent(presence_of_mind) Spell(arcane_blast)
		}
		if BuffPresent(rule_of_threes_buff) Spell(arcane_blast text=free)
		if BuffPresent(clearcasting_buff) Spell(arcane_missiles)
		Spell(arcane_blast)
	}
	if not (ArcaneShouldEnterArcanePowerBurn() or ArcaneWithinArcanePowerBurn())
	{
		# Enter Evocation burn immediately after exiting Arcane Power burn
		# to utilize any buffs or cooldowns that may still be rolling.
		if SpellCooldown(arcane_power) > 60
		{
			if ArcaneShouldEnterEvocationBurn() ArcaneEvocationBurnActions()
		}
	}
}

AddFunction ArcaneShouldEnterMiniBurn
{
	# Enter the mini burn phase when Touch of the Magi and Rune of Power
	# are off cooldown. If Touch of the Magi is ready, Rune of Power is
	# not, and Arcane Power is roughly 45 seconds away; you should enter
	# Touch of the Magi without Rune of Power so that it’s ready in time
	# for Arcane Power.
	#
	# We make some adjustments to allow for entering the mini burn phase
	# if we decide to hold onto Arcane Power for a later time.
	#
	not SpellCooldown(touch_of_the_magi) > 0 and
	(
		(Talent(rune_of_power_talent) and not SpellCooldown(rune_of_power) > 0) or
		(
			(not SpellCooldown(arcane_power) > 0) or
			(40 < SpellCooldown(arcane_power) and SpellCooldown(arcane_power) < 50)
		)
	)
}

AddFunction ArcaneWithinMiniBurn
{
	target.DebuffPresent(touch_of_the_magi_debuff) or
	(
		Talent(rune_of_power_talent) and
		BuffPresent(rune_of_power_buff) and
		SpellCooldown(touch_of_the_magi) > SpellCooldownDuration(touch_of_the_magi) - BaseDuration(rune_of_power_buff)
	)
}

AddFunction ArcaneMiniBurnActions
{
	if not BuffPresent(arcane_power)
	{
		if (ArcaneShouldEnterMiniBurn() or ArcaneWithinMiniBurn())
		{
			if (ArcaneCharges() > 0 and SpellCooldown(touch_of_the_magi) < GCD()) Spell(arcane_barrage text=totm)
			if (ArcaneCharges() == MaxArcaneCharges() or target.DebuffRemaining(nether_tempest) < 3) Spell(nether_tempest)
			Spell(touch_of_the_magi)
			if not BuffPresent(rune_of_power_buff) Spell(rune_of_power)
			if (Talent(arcane_echo_talent) and target.DebuffPresent(touch_of_the_magi_debuff)) Spell(arcane_missiles text=echo)
			if (
				ArcaneCharges() == MaxArcaneCharges() or
				(
					Talent(rune_of_power_talent) and
					BuffPresent(rune_of_power_buff) and BuffRemaining(rune_of_power_buff) < 2
				)
			) {
				Spell(arcane_barrage)
			}
			if ArcaneShouldEnterEvocationBurn() ArcaneEvocationBurnActions()
			if BuffPresent(rule_of_threes_buff) Spell(arcane_blast text=free)
			if BuffPresent(clearcasting_buff) Spell(arcane_missiles)
			Spell(arcane_blast)
		}
		if not (ArcaneShouldEnterMiniBurn() or ArcaneWithinMiniBurn())
		{
			# Finish Evocation burn.
			if SpellCooldown(touch_of_the_magi) > 0
			{
				if ArcaneShouldEnterEvocationBurn() ArcaneEvocationBurnActions()
			}
		}
	}
}

AddFunction ArcaneConserveActions
{
	# Toegrinder recommends using Rune of Power unless you need to hold it
	# for a mini burn, but we will always use it with the mini burn.
	#if not BuffPresent(rune_of_power_buff) Spell(rune_of_power)
	if (ArcaneCharges() <= 2) Spell(arcane_orb)
	if BuffPresent(rule_of_threes_buff) Spell(arcane_blast text=free)
	if BuffPresent(nether_precision_buff) Spell(arcane_blast text=np)
	# When a mini-burn phase is approaching, start holding Clearcasting procs.
	if (SpellCooldown(touch_of_the_magi) > 10 and BuffPresent(clearcasting_buff)) Spell(arcane_missiles)
	if (SpellCooldown(touch_of_the_magi) < 10 and BuffStacks(clearcasting_buff) > 2) Spell(arcane_missiles text=cap)
	if (ArcaneCharges() < MaxArcaneCharges() or ManaPercent() > 90) Spell(arcane_blast)
	if (ArcaneCharges() == MaxArcaneCharges()) Spell(arcane_barrage)
}

AddFunction ArcaneAoEConserveActions
{
	if (ArcaneCharges() == MaxArcaneCharges() or target.DebuffRemaining(nether_tempest) < 3) Spell(nether_tempest)
	if BuffPresent(rule_of_threes_buff) Spell(arcane_blast text=free)
	if (ArcaneCharges() == MaxArcaneCharges()) Spell(arcane_barrage)
	if (ArcaneCharges() <= 2) Spell(arcane_orb)
	if ArcaneCharges() < MaxArcaneCharges()
	{
		if (ManaPercent() < 80 and ArcaneCharges() < 3) Spell(arcane_blast)
		Spell(arcane_explosion)
	}
}

AddFunction ArcaneAoEActions
{
	if (ArcaneShouldEnterMiniBurn() or ArcaneWithinMiniBurn())
	{
		# AoE burn phase
		if (ArcaneCharges() > 0 and SpellCooldown(touch_of_the_magi) < GCD()) Spell(arcane_barrage text=totm)
		if (ArcaneCharges() == MaxArcaneCharges() or target.DebuffRemaining(nether_tempest) < 3) Spell(nether_tempest text=burn)
		Spell(touch_of_the_magi text=burn)
		if not BuffPresent(rune_of_power_buff) Spell(rune_of_power text=burn)
		if (Talent(arcane_echo_talent) and target.DebuffPresent(touch_of_the_magi_debuff)) Spell(arcane_missiles text=echo)
		if (ArcaneCharges() <= 2) Spell(arcane_orb text=burn)
		if (ArcaneCharges() == MaxArcaneCharges()) Spell(arcane_barrage text=burn)
		if (BuffPresent(clearcasting_buff) and ManaPercent() < 95) Spell(arcane_missiles text=burn)
		Spell(arcane_explosion text=burn)
	}
	if not (ArcaneShouldEnterMiniBurn() or ArcaneWithinMiniBurn())
	{
		# AoE conserve phase
		ArcaneAoEConserveActions()
	}
}

AddFunction ArcanePrecombatActions
{
	PrecombatShortCdActions()
	PrecombatCdActions()
}

AddFunction ArcaneBuffActions
{
	if not BuffPresent(arcane_intellect mine=0) Spell(arcane_intellect)
}

AddFunction ArcaneDefensiveActions
{
	if not BuffPresent(prismatic_barrier) Spell(prismatic_barrier)
	ItemHealActions()
	Spell(ice_block)
	Spell(greater_invisibility)
}

AddFunction ArcaneInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if focus.InRange(counterspell) and focus.IsInterruptible() Spell(counterspell text=focus)
		if not focus.Classification(worldboss)
		{
			if focus.InRange(polymorph) Spell(polymorph text=focus)
			Spell(ring_of_frost text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if target.InRange(counterspell) and target.IsInterruptible() Spell(counterspell)
		if not target.Classification(worldboss)
		{
			if target.InRange(polymorph) Spell(polymorph)
			Spell(ring_of_frost)
		}
	}
	InterruptActions()
}

AddFunction ArcaneDispelActions
{
	OffensiveDispelActions()
	if player.HasDebuffType(curse) Spell(remove_curse)
	DefensiveDispelActions()
}

### User Interface ###

AddIcon help=interrupt size=small
{
	ArcaneInterruptActions()
	ArcaneDispelActions()
	ArcaneDefensiveActions()
}

AddIcon help=mage_arcane_ap_burn
{
	if not InCombat() ArcanePrecombatActions()
	ArcaneArcanePowerBurnActions()
}

AddIcon help=mage_arcane_mini_burn
{
	if not InCombat() ArcanePrecombatActions()
	ArcaneMiniBurnActions()
}

AddIcon help=mage_arcane_conserve
{
	if not InCombat() ArcanePrecombatActions()
	ArcaneConserveActions()
}

AddIcon help=aoe
{
	if not InCombat() ArcanePrecombatActions()
	ArcaneAoEActions()
}

AddIcon help=trinkets size=small
{
	if not InCombat() ArcaneBuffActions()
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("MAGE", "arcane", name, desc, code, "script")
end