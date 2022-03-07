local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_warrior_fury"
	local desc = string.format("[9.2] %s: Warrior - Fury", Private.name)
	local code = [[
# Adapted from Wowhead's "Fury Warrior Rotation Guide - Shadowlands 9.2"
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
	SpellRequire(bladestorm unusable set=1 enabled=(Talent(bladestorm_talent)))
	SpellAddBuff(bladestorm bladestorm add=1)
Define(bloodbath 335096)
	SpellInfo(bloodbath cd=3 cd_haste=1 rage=-16)
	SpellRequire(bloodbath rage add=-4 enabled=(Talent(seethe_talent)))
	SpellRequire(bloodthirst replaced_by set=bloodbath enabled=(Talent(reckless_abandon_talent) and BuffPresent(recklessness)))
Define(bloodthirst 23881)
	SpellInfo(bloodthirst cd=4.5 cd_haste=1 rage=-8)
	SpellRequire(bloodthirst rage add=-2 enabled=(Talent(seethe_talent)))
	SpellRequire(bloodthirst rage add=-8 enabled=(BuffPresent(recklessness)))
	SpellRequire(bloodthirst rage add=-2 enabled=(Talent(seethe_talent) and BuffPresent(recklessness)))
	SpellAddBuff(bloodthirst enraged_buff add=1 enabled=(not InCombat() and Talent(fresh_meat_talent)))
Define(challenging_shout 1161)
	SpellInfo(challenging_shout cd=240 duration=6)
	SpellAddTargetDebuff(challenging_shout challenging_shout add=1)
Define(charge 100)
	SpellInfo(charge cd=20 cd_haste=1 rage=-20 gcd=0 offgcd=1)
	SpellRequire(charge cd set=1.5 enabled=(Talent(double_time_talent)))
	SpellRequire(charge charge_cd set=20 enabled=(Talent(double_time_talent)))
	SpellRequire(charge rage add=-20 enabled=(BuffPresent(recklessness)))
Define(crushing_blow 335097)
	SpellInfo(crushing_blow cd=1.5 charge_cd=8 cd_haste=1 rage=-24)
	SpellRequire(raging_blow replaced_by set=crushing_blow enabled=(Talent(reckless_abandon_talent) and BuffPresent(recklessness)))
Define(dragon_roar 118000)
	SpellInfo(dragon_roar cd=30 rage=-10)
	SpellRequire(dragon_roar rage add=-10 enabled=(BuffPresent(recklessness)))
	SpellRequire(dragon_roar unusable set=1 enabled=(not Talent(dragon_roar_talent)))
Define(enrage_buff 184362)
	SpellInfo(enrage_buff duration=4)
Define(enraged_regeneration 184364)
	SpellInfo(enraged_regeneration cd=180 duration=8 gcd=0 offgcd=1)
	SpellAddBuff(enraged_regeneration enraged_regeneration add=1)
Define(execute 5308)
	SpellInfo(execute cd=6 cd_haste=1 rage=-20)
	SpellRequire(execute replaced_by set=execute_massacre enabled=(Talent(massacre_talent) and not IsCovenant(venthyr)))
	SpellRequire(execute rage add=-20 enabled=(BuffPresent(recklessness)))
	SpellRequire(execute unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and target.HealthPercent() > 20))
Define(execute_massacre 280735)
	SpellInfo(execute_massacre cd=4.5 cd_haste=1 rage=-20)
	SpellRequire(execute_massacre rage add=-20 enabled=(BuffPresent(recklessness)))
	SpellRequire(execute_massacre unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and target.HealthPercent() > 35))
Define(heroic_leap 6544)
	SpellInfo(heroic_leap cd=45)
	SpellRequire(heroic_leap cd add=-15 enabled=(Talent(bounding_stride_talent)))
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
Define(merciless_bonegrinder_buff 346574)
	SpellInfo(merciless_bonegrinder_buff duration=9)
Define(onslaught 315720)
	SpellInfo(onslaught cd=12 rage=-15)
	SpellRequire(onslaught rage add=-15 enabled=(BuffPresent(recklessness)))
	SpellRequire(onslaught unusable set=1 enabled=(not (Talent(onslaught_talent) and IsEnraged())))
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
	SpellRequire(recklessness rage add=-50 enabled=(Talent(reckless_abandon_talent)))
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
	SpellRequire(siegebreaker unusable set=1 enabled=(not Talent(siegebreaker_talent)))
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
	SpellRequire(storm_bolt unusable set=1 enabled=(not Talent(storm_bolt_talent)))
Define(sudden_death_buff 280776)
	SpellInfo(sudden_death_buff duration=10)
	SpellAddBuff(condemn sudden_death_buff set=0 enabled=(IsCovenant(venthyr) and Talent(sudden_death_talent)))
	SpellAddBuff(execute sudden_death_buff set=0 enabled=(Talent(sudden_death_talent)))
	SpellAddBuff(execute_massacre sudden_death_buff set=0 enabled=(Talent(sudden_death_talent)))
Define(taunt 355)
	SpellInfo(taunt cd=8 duration=3)
	SpellAddTargetDebuff(taunt taunt add=1)
Define(victorious_buff 32216)
	SpellInfo(victorious_buff duration=20)
	SpellAddBuff(impending_victory victorious_buff set=0)
	SpellAddBuff(victory_rush victorious_buff set=0)
Define(victory_rush 34428)
	SpellRequire(victory_rush unusable set=1 enabled=(not BuffPresent(victorious_buff)))
	SpellRequire(victory_rush replaced_by set=impending_victory enabled=(Talent(impending_victory_talent)))
Define(whirlwind 190411)
	SpellInfo(whirlwind rage=-3)
	SpellRequire(whirlwind rage add=-3 enabled=(BuffPresent(recklessness)))
Define(whirlwind_buff 85739)
	SpellInfo(whirlwind_buff duration=20)
	SpellAddBuff(whirlwind whirlwind_buff add=2 enabled=(not Talent(meat_cleaver_talent)))
	SpellAddBuff(whirlwind whirlwind_buff add=4 enabled=(Talent(meat_cleaver_talent)))

# Covenant Abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(ancient_aftershock 325886)
	SpellInfo(ancient_aftershock cd=90 rage=-4)
	SpellRequire(ancient_aftershock unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(ancient_aftershock rage add=-4 enabled=(BuffPresent(recklessness)))
	SpellRequire(ancient_aftershock unusable set=1 enabled=(not IsCovenant(night_fae)))
Define(condemn 317485)
	SpellInfo(condemn cd=6 cd_haste=1 rage=-20)
	SpellRequire(condemn rage add=-20 enabled=(BuffPresent(recklessness)))
	SpellRequire(condemn unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(condemn unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellRequire(condemn unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and target.HealthPercent() > 20 and target.HealthPercent() < 80))
	SpellRequire(execute replaced_by set=condemn enabled=(not Talent(massacre_talent) and IsCovenant(venthyr)))
	SpellAddBuff(condemn sudden_death_buff set=0 enabled=(Talent(sudden_death_talent)))
Define(condemn_massacre 330325)
	SpellInfo(condemn cd=4.5 cd_haste=1 rage=-20)
	SpellRequire(condemn_massacre rage add=-20 enabled=(BuffPresent(recklessness)))
	SpellRequire(condemn_massacre unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(condemn_massacre unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellRequire(condemn_massacre unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and target.HealthPercent() > 35 and target.HealthPercent() < 80))
	SpellRequire(execute replaced_by set=condemn_massacre enabled=(Talent(massacre_talent) and IsCovenant(venthyr)))
	SpellAddBuff(condemn_massacre sudden_death_buff set=0 enabled=(Talent(sudden_death_talent)))
Define(condemned_debuff 317491)
	SpellInfo(condemned_debuff duration=10)
	SpellAddTargetDebuff(condemn condemned_debuff add=1)
	SpellAddTargetDebuff(condemn_massacre condemned_debuff add=1)
Define(conquerors_banner 324143)
	SpellInfo(conquerors_banner cd=120 rage=-4)
	SpellRequire(conquerors_banner unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(conquerors_banner rage add=-4 enabled=(BuffPresent(recklessness)))
	SpellRequire(conquerors_banner unusable set=1 enabled=(not IsCovenant(necrolord)))
Define(conquerors_banner_buff 324143)
	SpellInfo(conquerors_banner_buff duration=15)
	SpellAddBuff(conquerors_banner conquerors_banner_buff add=1)
Define(spear_of_bastion 307865)
	SpellInfo(spear_of_bastion cd=60 rage=-25)
	SpellRequire(spear_of_bastion rage add=-25 enabled=(BuffPresent(recklessness)))
	SpellRequire(spear_of_bastion unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(spear_of_bastion unusable set=1 enabled=(not IsCovenant(kyrian)))
Define(spear_of_bastion_debuff 307871)
	SpellInfo(spear_of_bastion_debuff duration=4)
	SpellAddTargetDebuff(spear_of_bastion spear_of_bastion_debuff add=1)

# Runeforge Legendary Effects
Define(elysian_might_runeforge 7730)
	SpellRequire(spear_of_bastion_debuff duration add=4 enabled=(EquippedRuneforge(elysian_might_runeforge)))
Define(elysian_might_buff 311193)
	SpellInfo(elysian_might_buff duration=8)
	SpellAddBuff(spear_of_bastion elysian_might_buff add=1 enabled=(EquippedRuneforge(elysian_might_runeforge)))
Define(signet_of_tormented_kings_runeforge 6959)

### Functions ###

AddFunction FuryInRange
{
	(InFlightToTarget(charge) or InFlightToTarget(intervene) or InFlightToTarget(heroic_leap) or target.InRange(pummel)) 
}

AddFunction FuryPrecombatShortCdActions
{
	PrecombatShortCdActions()
	Spell(charge)
}

AddFunction FuryShortCdActions
{
	unless (IsCovenant(venthyr) and Spell(condemn))
	{
		Spell(siegebreaker)

		unless (not IsEnraged() or Rage() > 90 or Spell(execute))
		{
			Spell(ancient_aftershock)
			Spell(spear_of_bastion)
			Spell(bladestorm)
			Spell(dragon_roar)
		}
	}
}

AddFunction FuryPrecombatMainActions
{
	if Talent(fresh_meat_talent) Spell(bloodthirst)
}

AddFunction FuryMainActions
{
	if (Enemies(tagged=1) > 1 and not BuffPresent(whirlwind_buff)) Spell(whirlwind)
	if IsCovenant(venthyr) Spell(condemn)
	if (not IsEnraged() or Rage() > 90) Spell(rampage)
	Spell(execute)
	if IsEnraged()
	{
		Spell(onslaught)
		if (Charges(raging_blow count=0) >= 1.8) Spell(raging_blow)
	}
	if (Enemies(tagged=1) > 1 and BuffPresent(merciless_bonegrinder_buff)) Spell(whirlwind)
	Spell(bloodthirst)
	Spell(raging_blow)
	Spell(whirlwind)
}

AddFunction FuryPrecombatCdActions
{
	PrecombatCdActions()
	if not EquippedRuneforge(signet_of_tormented_kings_runeforge) Spell(recklessness)
}

AddFunction FuryCdActions
{
	if (Rage() > 70) Spell(conquerors_banner)
	# With Signet of Tormented Kings, Recklessness may activate Bladestorm,
	# so ensure Enrage is active first.
	if not EquippedRuneforge(signet_of_tormented_kings_runeforge) or IsEnraged() Spell(recklessness)
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