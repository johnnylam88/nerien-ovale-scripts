local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_warrior_fury"
	local desc = string.format("[9.1] %s: Warrior - Fury", Private.name)
	local code = [[
# Adapted from Wowhead's "Fury Warrior Rotation Guide - Shadowlands 9.1"
#	by Archimtiros
# https://www.wowhead.com/fury-warrior-rotation-guide

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(bladestorm_talent 22400)
Define(bounding_stride_talent 22627)
Define(double_time_talent 19676)
Define(dragon_roar_talent 22398)
Define(fresh_meat_talent 22491)
Define(impending_victory_talent 22625)
Define(massacre_talent 22379)
Define(meat_cleaver_talent 22396)
Define(onslaught_talent 23372)
Define(reckless_abandon_talent 22402)
Define(seethe_talent 22383)
Define(siegebreaker_talent 16037)
Define(storm_bolt_talent 23093)
Define(sudden_death_talent 22633)

# Class Abilities
Define(battle_shout 6673)
	SpellInfo(battle_shout cd=15 duration=3600)
	SpellAddBuff(battle_shout battle_shout add=1)
Define(berserker_rage 18499)
	SpellInfo(berserker_rage cd=60 duration=6)
	SpellAddBuff(berserker_rage berserker_rage add=1)
Define(bladestorm 46924)
	SpellInfo(bladestorm cd=60 duration=4)
	SpellRequire(bladestorm unusable set=1 enabled=(HasTalent(bladestorm_talent)))
	SpellAddBuff(bladestorm bladestorm add=1)
Define(bloodbath 335096)
	SpellInfo(bloodbath cd=3 cd_haste=1 rage=-16)
	SpellRequire(bloodbath rage add=-4 enabled=(HasTalent(seethe_talent)))
	SpellRequire(bloodthirst replaced_by set=bloodbath enabled=(HasTalent(reckless_abandon_talent) and BuffPresent(recklessness)))
Define(bloodthirst 23881)
	SpellInfo(bloodthirst cd=4.5 cd_haste=1 rage=-8)
	SpellRequire(bloodthirst rage add=-2 enabled=(HasTalent(seethe_talent)))
	SpellRequire(bloodthirst rage add=-8 enabled=(BuffPresent(recklessness)))
	SpellRequire(bloodthirst rage add=-2 enabled=(HasTalent(seethe_talent) and BuffPresent(recklessness)))
	SpellAddBuff(bloodthirst enraged_buff add=1 enabled=(not InCombat() and HasTalent(fresh_meat_talent)))
Define(challenging_shout 1161)
	SpellInfo(challenging_shout cd=240 duration=6)
	SpellAddTargetDebuff(challenging_shout challenging_shout add=1)
Define(charge 100)
	SpellInfo(charge cd=20 cd_haste=1 rage=-20 gcd=0 offgcd=1)
	SpellRequire(charge cd set=1.5 enabled=(HasTalent(double_time_talent)))
	SpellRequire(charge charge_cd set=20 enabled=(HasTalent(double_time_talent)))
	SpellRequire(charge rage add=-20 enabled=(BuffPresent(recklessness)))
Define(crushing_blow 335097)
	SpellInfo(crushing_blow cd=1.5 charge_cd=8 cd_haste=1 rage=-24)
	SpellRequire(raging_blow replaced_by set=crushing_blow enabled=(HasTalent(reckless_abandon_talent) and BuffPresent(recklessness)))
Define(dragon_roar 118000)
	SpellInfo(dragon_roar cd=30 rage=-10)
	SpellRequire(dragon_roar rage add=-10 enabled=(BuffPresent(recklessness)))
	SpellRequire(dragon_roar unusable set=1 enabled=(not HasTalent(dragon_roar_talent)))
Define(enrage_buff 184362)
	SpellInfo(enrage_buff duration=4)
Define(enraged_regeneration 184364)
	SpellInfo(enraged_regeneration cd=180 duration=8 gcd=0 offgcd=1)
	SpellAddBuff(enraged_regeneration enraged_regeneration add=1)
Define(execute 163201)
	SpellInfo(execute cd=6 cd_haste=1 rage=-20)
	SpellRequire(execute cd add=-1.5 enabled=(HasTalent(massacre_talent)))
	SpellRequire(execute rage add=-20 enabled=(BuffPresent(recklessness)))
	SpellRequire(execute unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and (HasTalent(massacre_talent) and target.HealthPercent() > 35 or target.HealthPercent() > 20)))
Define(heroic_leap 6544)
	SpellInfo(heroic_leap cd=45)
	SpellRequire(heroic_leap cd add=-15 enabled=(HasTalent(bounding_stride_talent)))
Define(heroic_throw 57755)
	SpellInfo(heroic_throw cd=6)
Define(ignore_pain 190456)
	SpellInfo(ignore_pain cd=12 gcd=0 offgcd=1 rage=40 duration=12)
	SpellAddBuff(ignore_pain ignore_pain add=1)
Define(impending_victory 202168)
	SpellInfo(impending_victory cd=30 rage=10)
	SpellRequire(impending_victory rage set=0 enabled=(BuffPresent(victorious_buff)))
Define(intervene 3411)
	SpellInfo(intervene cd=30 rage=0 gcd=0 offgcd=1)
Define(intimidating_shout 5246)
	SpellInfo(intimidating_shout cd=90)
Define(onslaught 315720)
	SpellInfo(onslaught cd=12 rage=-15)
	SpellRequire(onslaught rage add=-15 enabled=(BuffPresent(recklessness)))
	SpellRequire(onslaught unusable set=1 enabled=(not (HasTalent(onslaught_talent) and IsEnraged())))
Define(pummel 6552)
	SpellInfo(pummel cd=15 gcd=0 offgcd=1)
Define(rampage 184367)
	SpellInfo(rampage rage=80)
	SpellAddBuff(rampage enrage_buff add=1 enabled=(Level() >= 28))
Define(raging_blow 85288)
	SpellInfo(raging_blow cd=1.5 charge_cd=8 cd_haste=1 rage=-12)
	SpellRequire(raging_blow rage add=-12 enabled=(BuffPresent(recklessness)))
Define(rallying_cry 97462)
	SpellInfo(rallying_cry cd=180 duration=10 gcd=0 offgcd=1)
	SpellAddBuff(rallying_cry rallying_cry add=1)
Define(recklessness 1719)
	SpellInfo(recklessness cd=90 rage=0 duration=10)
	SpellRequire(recklessness rage add=-50 enabled=(HasTalent(reckless_abandon_talent)))
	SpellAddBuff(recklessness recklessness add=1)
Define(shattering_throw 64382)
	SpellInfo(shattering_throw cd=180)
Define(shield_block 2565)
	SpellInfo(shield_block rage=30 cd=16 cd_haste=1 gcd=0 offgcd=1)
	SpellRequire(shield_block unusable set=1 enabled=(not HasShield()))
Define(shield_block_buff 132404)
	SpellInfo(shield_block_buff duration=6)
	SpellAddBuff(shield_block shield_block_buff add=1)
Define(shield_slam 23922)
	SpellInfo(shield_slam cd=9 cd_haste=1)
	SpellRequire(shield_slam unusable set=1 enabled=(not HasShield()))
Define(siegebreaker 280772)
	SpellInfo(siegebreaker cd=30 rage=-10)
	SpellRequire(siegebreaker rage add=-10 enabled=(BuffPresent(recklessness)))
	SpellRequire(siegebreaker unusable set=1 enabled=(not HasTalent(siegebreaker_talent)))
Define(siegebreaker_debuff 280773)
	SpellInfo(siegebreaker_debuff duration=10)
	SpellAddTargetDebuff(siegebreaker siegebreaker_debuff add=1)
Define(slam 1464)
	SpellInfo(slam rage=20)
Define(spell_reflection 23920)
	SpellInfo(spell_reflection cd=25 duration=5 gcd=0 offgcd=1)
	SpellAddBuff(spell_reflection spell_reflection add=1)
Define(storm_bolt 107570)
	SpellInfo(storm_bolt cd=30)
	SpellRequire(storm_bolt unusable set=1 enabled=(not HasTalent(storm_bolt_talent)))
Define(sudden_death_buff 280776)
	SpellInfo(sudden_death_buff duration=10)
	SpellAddBuff(condemn sudden_death_buff set=0 enabled=(IsCovenant(venthyr) and HasTalent(sudden_death_talent)))
	SpellAddBuff(execute sudden_death_buff set=0 enabled=(HasTalent(sudden_death_talent)))
Define(taunt 355)
	SpellInfo(taunt cd=8 duration=3)
	SpellAddTargetDebuff(taunt taunt add=1)
Define(victorious_buff 32216)
	SpellInfo(victorious_buff duration=20)
	SpellAddBuff(impending_victory victorious_buff set=0)
	SpellAddBuff(victory_rush victorious_buff set=0)
Define(victory_rush 34428)
	SpellRequire(victory_rush unusable set=1 enabled=(not BuffPresent(victorious_buff)))
	SpellRequire(victory_rush replaced_by set=impending_victory enabled=(HasTalent(impending_victory_talent)))
Define(whirlwind 190411)
	SpellInfo(whirlwind rage=-3)
	SpellRequire(whirlwind rage add=-3 enabled=(BuffPresent(recklessness)))
Define(whirlwind_buff 85739)
	SpellInfo(whirlwind_buff duration=20)
	SpellAddBuff(whirlwind whirlwind_buff add=2 enabled=(not HasTalent(meat_cleaver_talent)))
	SpellAddBuff(whirlwind whirlwind_buff add=4 enabled=(HasTalent(meat_cleaver_talent)))

# Covenant Abilities
Define(ancient_aftershock 325886)
	SpellInfo(ancient_aftershock cd=90 rage=-4)
	SpellRequire(ancient_aftershock rage add=-4 enabled=(BuffPresent(recklessness)))
	SpellRequire(ancient_aftershock unusable set=1 enabled=(not IsCovenant(night_fae)))
Define(condemn 317349)
	SpellInfo(condemn cd=6 cd_haste=1 rage=-20)
	SpellRequire(condemn cd add=-1.5 enabled=(HasTalent(massacre_talent)))
	SpellRequire(condemn rage add=-20 enabled=(BuffPresent(recklessness)))
	SpellRequire(condemn unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellRequire(condemn unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and (HasTalent(massacre_talent) and target.HealthPercent() > 35 or target.HealthPercent() > 20) and target.HealthPercent() < 80))
	SpellRequire(execute replaced_by set=condemn enabled=(IsCovenant(venthyr)))
Define(condemned_debuff 317491)
	SpellInfo(condemned_debuff duration=10)
	SpellAddTargetDebuff(condemn condemned_debuff add=1)
Define(conquerors_banner 324143)
	SpellInfo(conquerors_banner cd=120 rage=-4)
	SpellRequire(conquerors_banner rage add=-4 enabled=(BuffPresent(recklessness)))
	SpellRequire(conquerors_banner unusable set=1 enabled=(not IsCovenant(necrolord)))
Define(conquerors_banner_buff 324143)
	SpellInfo(conquerors_banner_buff duration=15)
	SpellAddBuff(conquerors_banner conquerors_banner_buff add=1)
Define(spear_of_bastion 307865)
	SpellInfo(spear_of_bastion cd=60 rage=-25)
	SpellRequire(spear_of_bastion rage add=-25 enabled=(BuffPresent(recklessness)))
	SpellRequire(spear_of_bastion unusable set=1 enabled=(not IsCovenant(kyrian)))
Define(spear_of_bastion_debuff 307871)
	SpellInfo(spear_of_bastion_debuff duration=4)
	SpellAddTargetDebuff(spear_of_bastion spear_of_bastion_debuff add=1)

# Runeforge Legendary Effects
Define(elysian_might_runeforge 263)
	SpellRequire(spear_of_bastion_debuff duration add=4 enabled=(EquippedRuneforge(elysian_might_runeforge)))
Define(elysian_might_buff 311193)
	SpellInfo(elysian_might_buff duration=8)
	SpellAddBuff(spear_of_bastion elysian_might_buff add=1 enabled=(EquippedRuneforge(elysian_might_runeforge)))

### Functions ###

AddFunction FuryInRange
{
	(InFlightToTarget(charge) or InFlightToTarget(intervene) or InFlightToTarget(heroic_leap) or target.InRange(pummel)) 
}

AddFunction FuryPrecombatShortCdActions
{
	PrecombatShortCdActions()
}

AddFunction FuryShortCdActions
{
	Spell(siegebreaker)

	unless (
		Spell(execute) or
		Spell(onslaught) or
		(IsEnraged() and Charges(raging_blow count=0) >= 1.8) or
		Spell(bloodthirst)
	) {
		if IsEnraged()
		{
			Spell(dragon_roar)
			Spell(spear_of_bastion)
			Spell(ancient_aftershock)
			Spell(bladestorm)
		}
	}
}

AddFunction FuryPrecombatMainActions
{
	if HasTalent(fresh_meat_talent) Spell(bloodthirst)
}

AddFunction FuryMainActions
{
	if (Enemies(tagged=1) > 1 and not BuffPresent(whirlwind_buff)) Spell(whirlwind)
	if (not IsEnraged() or Rage() > 90) Spell(rampage)
	Spell(execute)
	Spell(onslaught)
	if (IsEnraged() and Charges(raging_blow count=0) >= 1.8) Spell(raging_blow)
	Spell(bloodthirst)
	Spell(raging_blow)
	Spell(whirlwind)
}

AddFunction FuryPrecombatCdActions
{
	PrecombatCdActions()
}

AddFunction FuryCdActions
{
	Spell(conquerors_banner)
	Spell(recklessness)
}

AddFunction FuryBuffActions
{
	if not BuffPresent(battle_shout mine=0) Spell(battle_shout)
}

AddFunction FuryDefensiveActions
{
	Spell(ignore_pain)
	Spell(enraged_regeneration)
	Spell(fleshcraft)
}

AddFunction FuryInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if focus.InRange(pummel) and focus.IsInterruptible() Spell(pummel text=focus)
		if focus.IsTargetingPlayer() Spell(spell_reflection text=focus)
		if not focus.Classification(worldboss)
		{
			if focus.InRange(storm_bolt) Spell(storm_bolt text=focus)
			if (focus.Distance() < 8) Spell(intimidating_shout text=focus)
		}
	}
	if not target.IsFriend() and target.Casting()
	{
		if target.InRange(pummel) and target.IsInterruptible() Spell(pummel)
		if target.IsTargetingPlayer() Spell(spell_reflection)
		if not target.Classification(worldboss)
		{
			if target.InRange(storm_bolt) Spell(storm_bolt)
			if (target.Distance() < 8) Spell(intimidating_shout)
		}
	}
	InterruptActions()
}

AddFunction FuryDispelActions
{
	OffensiveDispelActions()
	DefensiveDispelActions()
}

AddFunction FuryHealActions
{
	ItemHealActions()
	if (HealthPercent() < 70) Spell(victory_rush)
}

### User Interface ###

AddIcon help=interrupt size=small
{
	FuryInterruptActions()
	FuryDispelActions()
	FuryHealActions()
	FuryDefensiveActions()
}

AddIcon help=shortcd
{
	if not InCombat() FuryPrecombatShortCdActions()
	FuryShortCdActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() FuryPrecombatMainActions()
	FuryMainActions()
}

AddIcon help=aoe
{
	if not InCombat() FuryPrecombatMainActions()
	FuryMainActions()
}

AddIcon help=cd
{
	if not InCombat() FuryPrecombatCdActions()
	FuryCdActions()
}

AddIcon help=trinkets size=small
{
	if not InCombat() FuryBuffActions()
	if not FuryInRange()
	{
		if target.InRange(charge) Spell(charge)
		if (8 <= target.Distance() and target.Distance() <= 40) Spell(heroic_leap)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("WARRIOR", "fury", name, desc, code, "script")
end