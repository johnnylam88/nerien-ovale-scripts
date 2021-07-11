local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_rogue_assassination"
	local desc = string.format("[9.0.2] %s: Rogue - Assassination", Private.name)
	local code = [[
# Adapted from Wowhead's "Assassination Rogue Rotation Guide - Shadowlands 9.0.2"
#	by Mystler
# https://www.wowhead.com/assassination-rogue-rotation-guide

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(blindside_talent 22339)
Define(crimson_tempest_talent 23174)
Define(exsanguinate_talent 22344)
Define(master_assassin_talent 23022)
Define(marked_for_death_talent 19241)
Define(nightstalker_talent 22331)
Define(subterfuge_talent 22332)

# Class Abilities
Define(ambush 8676)
	SpellInfo(ambush energy=50 combopoints=-2)
	SpellRequire(ambush unusable set=1 enabled=(not Stealthed() and not BuffPresent(blindside_buff)))
Define(blind 2094)
	SpellInfo(blind cd=120)
Define(blindside_buff 121153)
	SpellInfo(blindside_buff duration=10)
	SpellAddBuff(ambush blindside_buff set=0 enabled=(HasTalent(blindside_talent)))
Define(cheap_shot 1833)
	SpellInfo(cheap_shot energy=40 combopoints=-1)
	SpellRequire(cheap_shot unusable set=1 enabled=(not Stealthed()))
	SpellAddTargetDebuff(cheap_shot find_weakness add=1)
Define(cloak_of_shadows 31224)
	SpellInfo(cloak_of_shadows cd=120 duration=5)
	SpellAddBuff(cloak_of_shadows cloak_of_shadows add=1)
Define(crimson_vial 185311)
	SpellInfo(crimson_vial energy=20 cd=30 duration=4 tick=1)
	SpellAddBuff(crimson_vial crimson_vial add=1)
Define(crimson_tempest 121411)
	SpellInfo(crimson_tempest energy=35 combopoints=1 set_combopoints=0)
	SpellInfo(crimson_tempest duration=2 add_duration_combopoints=2 tick=2)
	SpellRequire(crimson_tempest unusable set=1 enabled=(not HasTalent(crimson_tempest_talent)))
	SpellAddTargetDebuff(crimson_tempest crimson_tempest add=1)
Define(deadly_poison 2823)
	SpellInfo(deadly_poison duration=3600 gcd=0 offgcd=1)
	SpellAddBuff(deadly_poison deadly_poison add=1)
Define(deadly_poison_debuff 2818)
	SpellInfo(deadly_poison_debuff duration=12 tick=2)
Define(envenom 32645)
	SpellInfo(envenom energy=35 combopoints=1 set_combopoints=0)
	SpellInfo(envenom duration=1 add_duration_combopoints=1 tick=1)
	SpellAddTargetDebuff(envenom envenom add=1)
Define(evasion 5277)
	SpellInfo(evasion cd=120 duration=10 gcd=0 offgcd=1)
	SpellAddBuff(evasion evasion add=1)
Define(exsanguinate 200806)
	SpellInfo(exsanguinate cd=45 energy=25)
	SpellRequire(exsanguinate unusable set=1 enabled=(not HasTalent(exsanguinate_talent)))
Define(fan_of_knives 51723)
	SpellInfo(fan_of_knives energy=35 combopoints=-1)
Define(feint 1966)
	SpellInfo(feint energy=35 cd=15 duration=5)
	SpellAddBuff(feint feint add=1)
Define(garrote 703)
	SpellInfo(garrote cd=6 energy=45 combopoints=-1)
	SpellRequire(garrote cd set=0 enabled=(BuffPresent(stealth_subterfuge_buff) or BuffPresent(subterfuge_buff)))
	SpellDamageBuff(garrote stealth_subterfuge_buff set=1.8 enabled=(HasTalent(subterfuge_talent)))
	SpellDamageBuff(garrote subterfuge_buff set=1.8 enabled=(HasTalent(subterfuge_talent)))
	SpellDamageBuff(garrote vanish_buff set=1.8 enabled=(HasTalent(subterfuge_talent)))
Define(internal_bleeding 154953)
	SpellInfo(internal_bleeding duration=1 add_duration_combopoints=1 tick=1)
	SpellAddTargetDebuff(kidney_shot internal_bleeding add=1 enabled=(HasTalent(internal_bleeding_talent)))
Define(kick 1766)
	SpellInfo(kick cd=15 gcd=0 offgcd=1 interrupt=1)
Define(kidney_shot 408)
	SpellInfo(kidney_shot energy=25 cd=20 combopoints=1 set_combopoints=0)
	SpellInfo(kidney_shot duration=1 add_duration_combopoints=1 tick=1)
	SpellAddTargetDebuff(kidney_shot kidney_shot add=1)
Define(marked_for_death 137619)
	SpellInfo(marked_for_death cd=60 duration=60 gcd=0 offgcd=1 combopoints=-5)
	SpellRequire(marked_for_death unusable set=1 enabled=(not HasTalent(marked_for_death_talent)))
	SpellAddTargetDebuff(marked_for_death marked_for_death add=1)
Define(master_assassin_buff 256735)
Define(mutilate 1329)
	SpellInfo(mutilate energy=50 combopoints=-2)
Define(numbing_poison 5761)
	SpellInfo(numbing_poison duration=3600 gcd=0 offgcd=1)
	SpellAddBuff(numbing_poison numbing_poison add=1)
Define(poisoned_knife 185565)
	SpellInfo(poisoned_knife energy=40 combopoints=-1)
Define(rupture 1943)
	SpellInfo(rupture energy=25 combopoints=1 set_combopoints=0)
	SpellInfo(rupture duration=4 add_duration_combopoints=4 tick=2)
	SpellAddTargetDebuff(rupture rupture add=1)
Define(shadowstep 36554)
	SpellInfo(shadowstep cd=1 charge_cd=30 gcd=0 offgcd=1)
Define(shiv 5938)
	SpellInfo(shiv energy=20 cd=25 combopoints=-1)
Define(shiv_debuff 319504)
	SpellInfo(shiv_debuff duration=9)
	SpellAddTargetDebuff(shiv shiv_debuff add=1 enabled=(Level() >= 58))
Define(slice_and_dice 315496)
	SpellInfo(slice_and_dice energy=25 combopoints=1 set_combopoints=0)
	SpellInfo(slice_and_dice duration=6 add_duration_combopoints=6 tick=2)
	SpellRequire(slice_and_dice unusable set=1 enabled=(BuffRemaining(slice_and_dice) > BaseDuration(slice_and_dice)))
	SpellAddBuff(slice_and_dice slice_and_dice add=1)
Define(stealth 1784)
	SpellInfo(stealth cd=2 gcd=0 offgcd=1)
	SpellRequire(stealth unusable set=1 enabled=(Stealthed() or InCombat()))
	SpellAddBuff(stealth stealth add=1 enabled=(not HasTalent(subterfuge_talent)))
Define(stealth_subterfuge_buff 115191)
	SpellAddBuff(stealth stealth_subterfuge_buff add=1 enabled=(HasTalent(subterfuge_talent)))
	SpellDamageBuff(garrote stealth_subterfuge_buff set=1.8)
Define(subterfuge_buff 115192)
	SpellInfo(subterfuge_buff duration=3)
Define(tricks_of_the_trade 57934)
	SpellInfo(tricks_of_the_trade cd=30)
Define(vanish 1856)
	SpellInfo(vanish cd=120 gcd=0 offgcd=1)
Define(vanish_buff 11327)
	SpellInfo(vanish_buff duration=3)
	SpellAddBuff(vanish vanish_buff add=1)
Define(vendetta 79140)
	SpellInfo(vendetta cd=120 duration=20)
	SpellAddTargetDebuff(vendetta vendetta add=1)

# Covenant Abilities
Define(flagellation 323654)
	SpellInfo(flagellation energy=20 cd=90 duration=20 max_stacks=30)
	SpellRequire(flagellation unusable set=1 enabled=(not IsCovenant("venthyr")))
	SpellAddTargetDebuff(flagellation flagellation add=1)
Define(serrated_bone_spike 328547)
	SpellInfo(serrated_bone_spike energy=15 cd=1 charge_cd=30 combopoints=-1)
	SpellRequire(serrated_bone_spike unusable set=1 enabled=(not IsCovenant("necrolord")))
Define(serrated_bone_spike_debuff 324073)
	SpellInfo(serrated_bone_spike_debuff tick=3)
	SpellAddTargetDebuff(serrated_bone_spike serrated_bone_spike_debuff add=1)
Define(sepsis 328305)
	SpellInfo(sepsis energy=25 cd=90 duration=10 combopoints=-1 tick=1)
	SpellRequire(sepsis unusable set=1 enabled=(not IsCovenant("night_fae")))
	SpellAddTargetDebuff(sepsis sepsis add=1)
Define(sepsis_stealth_buff 347037)
	SpellInfo(sepsis_stealth_buff duration=5)
Define(echoing_reprimand 323547)
	SpellInfo(echoing_reprimand energy=10 cd=45 combopoints=-2)
	SpellRequire(echoing_reprimand unusable set=1 enabled=(not IsCovenant("kyrian")))
Define(echoing_reprimand_2 323558)
	SpellInfo(echoing_reprimand_2 duration=45)
Define(echoing_reprimand_3 323559)
	SpellInfo(echoing_reprimand_3 duration=45)
Define(echoing_reprimand_4 323560)
	SpellInfo(echoing_reprimand_4 duration=45)

# Runeforge Legendary Effects
Define(deathly_shadows_runeforge 129)
Define(mark_of_the_master_assassin_runeforge 117)

Define(deathly_shadows 341202)
	SpellInfo(deathly_shadows duration=12)
	SpellRequire(vanish combopoints add=-5 enabled=(EquippedRuneforge(deathly_shadows_runeforge)))
	SpellAddBuff(vanish deathly_shadows add=1 enabled=(EquippedRuneforge(deathly_shadows_runeforge)))
Define(master_assassins_mark_buff 340094)

### Functions ###

AddFunction AssassinationInRange
{
	((Stealthed() and target.InRange(ambush)) or (not Stealthed() and target.InRange(mutilate)))
}

AddFunction AssassinationBuilderCondition
{
	(ComboPointsDeficit() > 1)
}

AddFunction AssassinationFinisherCondition
{
	(ComboPointsDeficit() <= 1)
}

AddFunction AssassinationPrecombatShortCdActions
{
	Spell(marked_for_death)
	Spell(stealth)
}

AddFunction AssassinationPrecombatMainActions
{
	if (BuffRemaining(lethal_poison_buff) < 1200) Spell(deadly_poison)
	Spell(slice_and_dice)
	if HasTalent(master_assassin_talent) Spell(mutilate)
	Spell(garrote)
}

AddFunction AssassinationPrecombatCdActions
{
	PrecombatCdActions()
}

AddFunction AssassinationDefensiveActions
{
	ItemHealActions()
	if (HealthPercent() < 70) Spell(crimson_vial)
	if (target.IsTargetingPlayer() and IncomingPhysicalDamage(1.5) > 0) Spell(evasion)
}

AddFunction AssassinationShortCdActions
{
	if (Spell(vendetta) or BuffPresent(vendetta))
	{
		if HasTalent(subterfuge_talent)
		{
			if (ComboPointsDeficit() > 3 and Spell(garrote)) Spell(vanish)
		}
		if HasTalent(nightstalker_talent)
		{
			if not ComboPointsDeficit() > 0
			{
				if (Enemies(tagged=1) > 2 and Spell(crimson_tempest)) Spell(vanish)
				if (not Enemies(tagged=1) > 2 and Spell(rupture)) Spell(vanish)
			}
		}
		if HasTalent(master_assassin_talent)
		{
			Spell(vanish)
		}
	}
	if ComboPointsDeficit() > 0
	{
		if SpellCooldown(vendetta) > 25 Spell(shiv)
		if Spell(sepsis) Spell(shadowmeld)
	}
	if (target.DebuffRemaining(rupture) > 24 and target.DebuffRemaining(garrote) > 6) Spell(exsanguinate)
}

AddFunction AssassinationCdActions
{
	# Use Flagellation (Venthyr) on cooldown to apply the debuff and start
	# the lashing. Use it again right before the debuff expires to convert
	# the stacks into the Haste buff.
	#Spell(flagellation)
	Spell(echoing_reprimand)
	Spell(sepsis)
	if (Charges(serrated_bone_spike count=0) > 2.9) Spell(serrated_bone_spike)
	if (not target.BuffPresent(serrated_bone_spike_debuff) and target.TimeToDie() > 21) Spell(serrated_bone_spike)
	if (not Stealthed() and ComboPoints() < 1 or target.TimeToDie() < 10) Spell(marked_for_death)
	if (EnergyDeficit() > 40 and target.TimeToDie() >= BaseDuration(vendetta)) Spell(vendetta)
}

AddFunction AssassinationMainActions
{
	if (Enemies(tagged=1) < 6 and BuffRefreshable(slice_and_dice)) Spell(slice_and_dice)
	if (Spell(exsanguinate) and not ComboPointsDeficit() > 0) Spell(rupture)
	if (ComboPointsDeficit() <= 1)
	{
		if (Enemies(tagged=1) > 1 and target.DebuffExpires(crimson_tempest) < 2) Spell(crimson_tempest)
		if ((Enemies(tagged=1) <= 4 and DebuffCountOnAny(rupture) < Enemies(tagged=1)) or (Enemies(tagged=1) > 4 and DebuffCountOnAny(rupture) < 4)) Spell(rupture text=missing)
		if (PersistentMultiplier(rupture) > target.DebuffPersistentMultiplier(rupture)) Spell(rupture text=overwrite)
		if (PersistentMultiplier(rupture) == target.DebuffPersistentMultiplier(rupture) and target.DebuffRefreshable(rupture)) Spell(rupture)
		Spell(envenom)
	}
	if (ComboPointsDeficit() > 1)
	{
		if (PersistentMultiplier(garrote) > target.DebuffPersistentMultiplier(garrote)) Spell(garrote text=overwrite)
		if (PersistentMultiplier(garrote) == target.DebuffPersistentMultiplier(garrote) and target.DebuffRefreshable(garrote)) Spell(garrote)
		if (DebuffCountOnAny(garrote) < Enemies(tagged=1)) Spell(garrote text=missing)
		if (Enemies(tagged=1) > 3) Spell(fan_of_knives)
		if (Enemies(tagged=1) == 3 and DebuffCountOnAny(deadly_poison_debuff) < Enemies(tagged=1)) Spell(fan_of_knives)
		if (BuffPresent(blindside_buff) or BuffPresent(sepsis_stealth_buff)) Spell(ambush)
		if (Enemies(tagged=1) == 2 and target.DebuffRemaining(deadly_poison_debuff) >= DebuffRemainingOnAny(deadly_poison_debuff)) Spell(mutilate text=other)
		Spell(mutilate)
	}
}

AddFunction AssassinationInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if focus.InRange(kick) and focus.IsInterruptible() Spell(kick text=focus)
		if not focus.Classification(worldboss)
		{
			if focus.InRange(cheap_shot) Spell(cheap_shot text=focus)
			if focus.InRange(kidney_shot) Spell(kidney_shot text=focus)
			if focus.InRange(blind) Spell(blind text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if target.InRange(kick) and target.IsInterruptible() Spell(kick)
		if not target.Classification(worldboss)
		{
			if target.InRange(cheap_shot) Spell(cheap_shot)
			if target.InRange(kidney_shot) Spell(kidney_shot)
			if target.InRange(blind) Spell(blind)
		}
	}
	InterruptActions()
}

AddFunction AssassinationDispelActions
{
	if (target.HasDebuffType(enrage) and BuffPresent(numbing_poison)) Spell(shiv)
	OffensiveDispelActions()
	if player.HasDebuffType(poison disease curse magic) Spell(cloak_of_shadows)
	DefensiveDispelActions()
}

### User Interface ###

AddIcon help=interrupt size=small
{
	AssassinationInterruptActions()
	AssassinationDispelActions()
	AssassinationDefensiveActions()
}

AddIcon help=shortcd
{
	if not InCombat() AssassinationPrecombatShortCdActions()
	if InCombat() AssassinationShortCdActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() AssassinationPrecombatMainActions()
	AssassinationMainActions()
}

AddIcon help=aoe
{
	if not InCombat() AssassinationPrecombatMainActions()
	AssassinationMainActions()
}

AddIcon help=cd
{
	if not InCombat() AssassinationPrecombatCdActions()
	if InCombat() AssassinationCdActions()
}

AddIcon help=trinkets size=small
{
	if not AssassinationInRange()
	{
		Spell(shadowstep)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("ROGUE", "assassination", name, desc, code, "script")
end