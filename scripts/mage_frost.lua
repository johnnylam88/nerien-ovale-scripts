local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_mage_frost"
	local desc = string.format("[9.1] %s: Mage - Frost", Private.name)
	local code = [[
# Adapted from Wowhead's "Frost Mage Rotation Guide"
#	by Preheat.
# https://www.wowhead.com/frost-mage-rotation-guide

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(bone_chilling_talent 22457)
Define(chain_reaction_talent 22466)
Define(comet_storm_talent 22473)
Define(ebonbolt_talent 22469)
Define(focus_magic_talent 22445)
Define(freezing_rain_talent 22454)
Define(glacial_spike_talent 21634)
Define(ice_floes_talent 23073)
Define(ice_nova_talent 22463)
Define(ice_ward_talent 22448)
Define(lonely_winter_talent 22460)
Define(ring_of_frost_talent 22471)
Define(rune_of_power_talent 22447)
Define(ray_of_frost_talent 22309)
Define(shimmer_talent 22443)
Define(splitting_ice_talent 23176)
Define(thermal_void_talent 21632)

# Class Abilities
Define(alter_time 108978)
	SpellInfo(alter_time cd=60)
Define(alter_time_buff 110909)
	SpellInfo(alter_time_buff duration=10)
	SpellAddBuff(alter_time alter_time_buff add=1)
Define(arcane_explosion 1449)
Define(arcane_intellect 1459)
	SpellInfo(arcane_intellect duration=3600)
	SpellAddBuff(arcane_intellect arcane_intellect add=1)
Define(blink 1953)
	SpellInfo(blink cd=15 cd_haste=1)
Define(blizzard 190356)
	SpellInfo(blizzard cd=8 cd_haste=1)
Define(brain_freeze_buff 190446)
	SpellInfo(brain_freeze_buff duration=15)
	SpellAddBuff(flurry brain_freeze_buff set=0)
Define(chain_reaction_buff 278310)
	SpellInfo(chain_reaction_buff duration=10)
	SpellAddBuff(ice_lance chain_reaction_buff add=1 enabled=(HasTalent(chain_reaction_buff) and BuffPresent(fingers_of_frost_buff)))
Define(cold_snap 235219)
	SpellInfo(cold_snap cd=270)
Define(comet_storm 153595)
	SpellInfo(comet_storm cd=30)
	SpellRequire(comet_storm unusable set=1 enabled=(not HasTalent(comet_storm_talent)))
Define(cone_of_cold 120)
	SpellInfo(cone_of_cold cd=12)
Define(counterspell 2139)
	SpellInfo(counterspell cd=24 gcd=0 offgcd=1)
Define(ebonbolt 257537)
	SpellInfo(ebonbolt cd=45 travel_time=1)
	SpellRequire(ebonbolt unusable set=1 enabled=(not HasTalent(ebonbolt_talent)))
	SpellAddBuff(ebonbolt brain_freeze_buff add=1)
Define(fingers_of_frost_buff 44544)
	SpellInfo(fingers_of_frost_buff duration=15)
	SpellAddBuff(ice_lance fingers_of_frost_buff add=-1)
Define(fire_blast 319836)
	SpellInfo(fire_blast cd=12 cd_haste=1)
Define(flurry 44614)
Define(focus_magic 321358)
	SpellRequire(focus_magic unusable set=1 enabled=(not HasTalent(focus_magic_talent)))
	SpellAddTargetBuff(focus_magic focus_magic add=1)
Define(freeze 33395)
	SpellInfo(freeze cd=25)
	SpellRequire(freeze unusable set=1 enabled=(not pet.Present()))
	SpellAddTargetDebuff(freeze freeze add=1)
Define(freezing_rain_buff 270232)
	SpellInfo(freezing_rain_buff duration=12)
	SpellAddBuff(frozen_orb freezing_rain_buff add=1 enabled=(HasTalent(freezing_rain_talent)))
Define(frost_nova 122)
	SpellRequire(frost_nova cd set=30 enabled=(not HasTalent(ice_ward_talent)))
	SpellRequire(frost_nova charge_cd set=30 enabled=(HasTalent(ice_ward_talent)))
	SpellAddTargetDebuff(frost_nova frost_nova add=1)
Define(frostbolt 116)
	SpellInfo(frostbolt travel_time=0.5)
Define(frozen_orb 84714)
	SpellInfo(frozen_orb cd=60)
Define(glacial_spike 199786)
	SpellInfo(glacial_spike travel_time=0.75)
	SpellRequire(glacial_spike unusable set=1 enabled=(not (HasTalent(glacial_spike_talent) and BuffStacks(icicles_buff) == 5)))
Define(hypothermia_debuff 41425)
	SpellInfo(hypothermia_debuff duration=30)
	SpellAddDebuff(ice_block hypothermia_debuff add=1)
Define(ice_barrier 11426)
	SpellInfo(ice_barrier cd=25 duration=60)
	SpellAddBuff(ice_barrier ice_barrier add=1)
Define(ice_block 45438)
	SpellInfo(ice_block cd=240)
	SpellRequire(ice_block unusable set=1 enabled=(DebuffPresent(hypothermia_debuff)))
Define(ice_floes 108839)
	SpellInfo(ice_floes charge_cd=20 gcd=0 offgcd=1)
	SpellRequire(ice_floes unusable set=1 enabled=(not HasTalent(ice_floes_talent)))
Define(ice_lance 30455)
	SpellInfo(ice_lance travel_time=0.5)
Define(ice_nova 157997)
	SpellInfo(ice_nova cd=25)
	SpellRequire(ice_nova unusable set=1 enabled=(not HasTalent(ice_nova_talent)))
	SpellAddTargetDebuff(ice_nova ice_nova add=1)
Define(icicles 76613)
Define(icicles_buff 205473)
	SpellInfo(icicles_buff duration=60)
	SpellAddBuff(frostbolt icicles_buff add=1 enabled=(SpellKnown(icicles)))
	SpellAddBuff(flurry icicles_buff add=1 enabled=(SpellKnown(icicles)))
	SpellAddBuff(ice_lance icicles_buff set=0 enabled=(SpellKnown(icicles) and not HasTalent(glacial_spike_talent)))
Define(icy_veins 12472)
	SpellInfo(icy_veins cd=180 duration=20 gcd=0 offgcd=1)
	SpellRequire(icy_veins duration add=3 enabled=(Level() >= 56))
	SpellRequire(icy_veins duration add=10 enabled=(HasTalent(thermal_void_talent)))
Define(invisibility 66)
	SpellInfo(invisibility cd=120)
Define(invisibility_buff 32612)
	SpellInfo(invisibility_buff duration=20)
	SpellAddBuff(invisibility invisibility_buff add=1)
Define(mirror_image 55342)
	SpellInfo(mirror_image cd=120)
Define(polymorph 118)
Define(ray_of_frost 205021)
	SpellInfo(ray_of_frost cd=75 channel=5 duration=5 haste=1 tick=1)
	SpellRequire(ray_of_frost unusable set=1 enabled=(not HasTalent(ray_of_frost_talent)))
	SpellAddTargetDebuff(ray_of_frost ray_of_frost add=1)
Define(remove_curse 475)
	SpellInfo(remove_curse cd=8)
Define(ring_of_frost 113724)
	SpellInfo(ring_of_frost cd=45)
	SpellRequire(ring_of_frost unusable set=1 enabled=(not HasTalent(ring_of_frost_talent)))
Define(rune_of_power 116011)
	SpellInfo(rune_of_power cd=45)
	SpellRequire(rune_of_power unusable set=1 enabled=(not HasTalent(rune_of_power_talent)))
Define(rune_of_power_buff 116014)
	SpellInfo(rune_of_power_buff duration=12)
	SpellAddBuff(icy_veins rune_of_power_buff add=1 enabled=(HasTalent(rune_of_power_talent)))
	SpellAddBuff(rune_of_power rune_of_power_buff add=1)
Define(shimmer 212653)
	SpellInfo(shimmer charge_cd=25 gcd=0 offgcd=1)
	SpellRequire(shimmer unusable set=1 enabled=(not HasTalent(shimmer_talent)))
	SpellRequire(blink replaced_by set=shimmer enabled=(HasTalent(shimmer_talent)))
Define(spellsteal 30449)
Define(summon_water_elemental 31687)
	SpellInfo(summon_water_elemental cd=30)
	SpellRequire(summon_water_elemental unusable set=1 enabled=(HasTalent(lonely_winter_talent)))
Define(temporal_displacement_debuff 80354)
	SpellInfo(temporal_displacement_debuff duration=600)
	SpellAddDebuff(time_warp temporal_displacement_debuff add=1)
Define(time_warp 80353)
	SpellInfo(time_warp cd=300 duration=40)
	SpellAddBuff(time_warp time_warp add=1)
Define(winters_chill_debuff 228358)
	SpellInfo(winters_chill_debuff duration=6)
	SpellAddTargetDebuff(flurry winters_chill_debuff add=2 enabled=(BuffPresent(brain_freeze_buff) and Level() >= 37))
	SpellAddTargetDebuff(ebonbolt winters_chill_debuff add=-1)
	SpellAddTargetDebuff(frostbolt winters_chill_debuff add=-1)
	SpellAddTargetDebuff(glacial_spike winters_chill_debuff add=-1)
	SpellAddTargetDebuff(ice_lance winters_chill_debuff add=-1)
	SpellAddTargetDebuff(ray_of_frost winters_chill_debuff add=-1)
SpellList(frozen_debuff freeze frost_nova ice_nova winters_chill_debuff)

# Covenant Abilities
Define(deathborne 324220)
	SpellInfo(deathborne cd=180 duration=25)
	SpellRequire(deathborne unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellAddBuff(deathborne deathborne add=1)
Define(mirrors_of_torment 314793)
	SpellInfo(mirrors_of_torment cd=90 duration=25)
	SpellRequire(mirrors_of_torment unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddTargetDebuff(mirrors_of_torment mirrors_of_torment add=3)

# Runeforge Legendary Effects
Define(glacial_fragments_runeforge 5)
Define(temporal_warp_runeforge 9)
Define(temporal_warp_buff 327355)
	SpellInfo(temporal_warp_buff duration=40)
	SpellAddBuff(time_warp temporal_warp_buff add=1 enabled=(HasTalent(temporal_warp_runeforge)))

### Functions ###

AddFunction FrostWintersChillLeft
{
	if target.DebuffPresent(winters_chill_debuff) target.DebuffRemaining(winters_chill_debuff)
	0
}

AddFunction FrostCanShatterIceLance
{
	BuffPresent(fingers_of_frost_buff) or target.DebuffPresent(frozen_debuff)
}

AddFunction FrostPrecombatShortCdActions { }

AddFunction FrostShortCdActions
{
	if not pet.Present() Spell(summon_water_elemental)
	if (HasTalent(freezing_rain_talent) or Enemies(tagged=1) > 2) Spell(frozen_orb)
	if not BuffPresent(rune_of_power_buff) Spell(rune_of_power)
	unless BuffPresent(brain_freeze_buff)
	{
		Spell(frozen_orb)
	}
}

AddFunction FrostPrecombatMainActions
{
	Spell(ebonbolt)
	Spell(frostbolt)
}

AddFunction FrostMainActions
{
	# Shatter combo: Frostbolt/Ebonbolt > Flurry > Ice Lance x 2
	if (
		(PreviousSpell(ebonbolt) or PreviousSpell(frostbolt)) and
		(BuffPresent(brain_freeze_buff) and not FrostWintersChillLeft() > 0)
	) {
		Spell(flurry)
	}
	# AoE Shatter for Comet Storm
	if PreviousSpell(comet_storm) and not target.DebuffPresent(frozen_debuff) and not target.Classification(worldboss)
	{
		Spell(freeze)
		if (target.Distance() < 12) Spell(frost_nova)
	}
	if (BuffPresent(freezing_rain_buff) or Enemies(tagged=1) > 2) Spell(blizzard)
	if (Enemies(tagged=1) > 1) Spell(glacial_spike)
	if target.DebuffPresent(winters_chill_debuff)
	{
		if (FrostWintersChillLeft() > 0 and target.DebuffStacks(winters_chill_debuff) < 2) Spell(ray_of_frost)
		if (FrostWintersChillLeft() > CastTime(glacial_spike) + TravelTime(glacial_spike)) Spell(glacial_spike)
		if EquippedRuneforge(glacial_fragments_runeforge) and target.DebuffStacks(winters_chill_debuff) < 2
		{
			if (FrostWintersChillLeft() > CastTime(blizzard)) Spell(blizzard)
		}
		if (FrostWintersChillLeft() > CastTime(ice_lance) + TravelTime(ice_lance)) Spell(ice_lance)
	}
	Spell(comet_storm)
	Spell(ice_nova)
	if FrostCanShatterIceLance() Spell(ice_lance)
	Spell(ebonbolt)
	Spell(frostbolt)
}

AddFunction FrostPrecombatAoEActions
{
	Spell(blizzard)
}

AddFunction FrostAoEActions
{
	# When using Glacial Fragments, maintain Blizzard and spam Ice Lance
	# at 3+ targets.
	if EquippedRuneforge(glacial_fragments_runeforge) and Enemies(tagged=1) > 2
	{
		Spell(blizzard)
		Spell(ice_lance)
	}
	# AoE Shatter for Comet Storm
	if PreviousSpell(comet_storm) and not target.DebuffPresent(frozen_debuff) and not target.Classification(worldboss)
	{
		Spell(freeze)
		if (target.Distance() < 12) Spell(frost_nova)
	}
	if (BuffPresent(freezing_rain_buff) or Enemies(tagged=1) > 2) Spell(blizzard)
	if (Enemies(tagged=1) > 5 and target.Distance() < 10) Spell(arcane_explosion)
	if (BuffPresent(brain_freeze_buff) and not FrostWintersChillLeft() > 0) Spell(flurry)
	Spell(ice_nova)
	Spell(comet_storm)
	if (FrostWintersChillLeft() > CastTime(ice_lance) + TravelTime(ice_lance)) Spell(ice_lance)
	if FrostCanShatterIceLance() Spell(ice_lance)
	if (ManaPercent() > 30 and target.Distance() < 10) Spell(arcane_explosion)
	Spell(ebonbolt)
	Spell(frostbolt)
}

AddFunction FrostPrecombatCdActions { }

AddFunction FrostCdActions
{
	Spell(deathborne)
	if (not BuffPresent(rune_of_power_buff) and not BuffPresent(icy_veins)) Spell(icy_veins)
	unless (
		BuffPresent(brain_freeze_buff) or
		(BuffPresent(freezing_rain_buff) and Spell(blizzard)) or
		(BuffStacks(icicles_buff) >= 5) or
		target.DebuffPresent(winters_chill_debuff) or
		Spell(comet_storm) or
		Spell(ice_nova) or
		BuffPresent(fingers_of_frost_buff) or
		Spell(ebonbolt)
	) {
		Spell(mirrors_of_torment)
	}
}

AddFunction FrostBuffActions
{
	if not BuffPresent(arcane_intellect mine=0) Spell(arcane_intellect)
}

AddFunction FrostDefensiveActions
{
	if not BuffPresent(ice_barrier) Spell(ice_barrier)
	ItemHealActions()
	Spell(ice_block)
	Spell(invisibility)
}

AddFunction FrostInterruptActions
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

AddFunction FrostDispelActions
{
	OffensiveDispelActions()
	if player.HasDebuffType(curse) Spell(remove_curse)
	DefensiveDispelActions()
}

### User Interface ###

AddIcon help=interrupt size=small
{
	FrostInterruptActions()
	FrostDispelActions()
	FrostDefensiveActions()
}

AddIcon help=shortcd
{
	if not InCombat() FrostPrecombatShortCdActions()
	FrostShortCdActions()
}

AddIcon help=main
{
	if not InCombat() FrostPrecombatMainActions()
	FrostMainActions()
}

AddIcon help=aoe
{
	if not InCombat() FrostPrecombatAoEActions()
	FrostAoEActions()
}

AddIcon help=cd
{
	if not InCombat() FrostPrecombatCdActions()
	FrostCdActions()
}

AddIcon help=trinkets size=small
{
	if not InCombat() FrostBuffActions()
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("MAGE", "frost", name, desc, code, "script")
end