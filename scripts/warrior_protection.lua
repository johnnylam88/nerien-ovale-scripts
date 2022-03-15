local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_warrior_protection"
	local desc = string.format("[9.2] %s: Warrior - Protection", Private.name)
	local code = [[
# Adapted from the following resources:
#
# - Mwahi:
#   - Protection Warrior Tank Rotation, Cooldowns, and Abilities — Shadowlands 9.2
#	  https://www.icy-veins.com/wow/protection-warrior-pve-tank-rotation-cooldowns-abilities
#
# - Plkatv:
#   - Protection Warrior In-Depth Guide | Shadowlands 9.0.5
#     https://www.youtube.com/watch?v=yR2Vy52kpEQ
#   - Protection Warrior Guide PART 2 | Shadowlands 9.0.5
#     https://www.youtube.com/watch?v=5zsKpcEnPdw

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(anger_management_talent 23455)
Define(bolster_talent 23099)
Define(booming_voice_talent 22626)
Define(bounding_stride_talent 22627)
Define(devastator_talent 15774)
Define(double_time_talent 19676)
Define(dragon_roar_talent 23260)
Define(heavy_repercussions_talent 22406)
Define(impending_victory_talent 22800)
Define(menace_talent 22488)
Define(never_surrender_talent 22384)
Define(punish_talent 15759)
Define(ravager_talent 22401)
Define(storm_bolt_talent 22409)
Define(unstoppable_force_talent 22544)

# Class Abilities
Define(avatar 107574)
	SpellInfo(avatar cd=90 duration=20 rage=-20)
	SpellRequire(avatar rage add=-10 enabled=(Level() >= 52))
	SpellAddBuff(avatar avatar add=1)
Define(battle_shout 6673)
	SpellInfo(battle_shout cd=15 duration=3600)
	SpellAddBuff(battle_shout battle_shout add=1)
Define(berserker_rage 18499)
	SpellInfo(berserker_rage cd=60 duration=6)
	SpellAddBuff(berserker_rage berserker_rage add=1)
Define(challenging_shout 1161)
	SpellInfo(challenging_shout cd=240 duration=6)
	SpellAddTargetDebuff(challenging_shout challenging_shout add=1)
Define(charge 100)
	SpellInfo(charge cd=20 cd_haste=1 rage=-10 gcd=0 offgcd=1)
	SpellRequire(charge rage add=-10 enabled=(Level() >= 14))
	SpellRequire(charge cd set=1.5 enabled=(Talent(double_time_talent)))
	SpellRequire(charge charge_cd set=20 enabled=(Talent(double_time_talent)))
Define(deep_wounds_debuff 115767)
	SpellInfo(deep_wounds_debuff duration=15)
	SpellAddTargetDebuff(devastate deep_wounds_debuff add=1)
	SpellAddTargetDebuff(revenge deep_wounds_debuff add=1)
Define(demoralizing_shout 1160)
	SpellInfo(demoralizing_shout cd=45 duration=8 rage=0)
	SpellRequire(demoralizing_shout rage add=-40 enabled=(Talent(booming_voice_talent)))
	SpellAddTargetDebuff(demoralizing_shout demoralizing_shout add=1)
Define(devastate 20243)
	SpellRequire(devastate unusable set=1 enabled=(Talent(devastator_talent)))
Define(dragon_roar 118000)
	SpellInfo(dragon_roar cd=30 rage=-20)
	SpellRequire(dragon_roar unusable set=1 enabled=(not Talent(dragon_roar_talent)))
Define(execute 163201)
	SpellInfo(execute rage=20 max_rage=40)
	SpellRequire(execute unusable set=1 enabled=(target.HealthPercent() > 20))
Define(heroic_leap 6544)
	SpellInfo(heroic_leap cd=45)
	SpellRequire(heroic_leap cd add=-15 enabled=(Talent(bounding_stride_talent)))
Define(heroic_throw 57755)
Define(ignore_pain 190456)
	SpellInfo(ignore_pain cd=12 gcd=0 offgcd=1 rage=40 duration=12)
	SpellRequire(ignore_pain cd add=-11 enabled=(Level() >= 29))
	SpellAddBuff(ignore_pain ignore_pain add=1)
Define(impending_victory 202168)
	SpellInfo(impending_victory cd=30 rage=10)
	SpellRequire(impending_victory rage set=0 enabled=(BuffPresent(victorious_buff)))
Define(intervene 3411)
	SpellInfo(intervene cd=30 rage=0 gcd=0 offgcd=1)
Define(intimidating_shout 5246)
	SpellInfo(intimidating_shout cd=90)
	SpellRequire(intimidating_shout replaced_by set=intimidating_shout_menace enabled=(Talent(menace_talent)))
Define(intimidating_shout_menace 316593)
	SpellInfo(intimidating_shout_menace cd=90)
Define(last_stand 12975)
	SpellInfo(last_stand cd=180 duration=15 gcd=0 offgcd=1)
	SpellRequire(last_stand cd add=-60 enabled=(Talent(bolster_talent)))
	SpellAddBuff(last_stand last_stand add=1)
Define(pummel 6552)
	SpellInfo(pummel cd=15 gcd=0 offgcd=1)
Define(punish 275335)
	SpellInfo(punish duration=9)
	SpellAddTargetDebuff(shield_slam punish add=1 enabled=(Talent(punish_talent)))
Define(rallying_cry 97462)
	SpellInfo(rallying_cry cd=180 duration=10 gcd=0 offgcd=1)
	SpellAddBuff(rallying_cry rallying_cry add=1)
Define(ravager 228920)
	SpellInfo(ravager cd=45 rage=-10)
	SpellRequire(ravager unusable set=1 enabled=(not Talent(ravager_talent)))
Define(revenge 6572)
	SpellInfo(revenge rage=20)
	SpellRequire(revenge rage set=0 enabled=(BuffPresent(revenge_buff)))
Define(revenge_buff 5302)
	SpellInfo(revenge_buff duration=6)
	SpellAddBuff(revenge revenge_buff set=0)
Define(shattering_throw 64382)
	SpellInfo(shattering_throw cd=180)
Define(shield_block 2565)
	SpellInfo(shield_block rage=30 cd=16 cd_haste=1 gcd=0 offgcd=1)
	SpellRequire(shield_block cd set=1 enabled=(Level() >= 22))
	SpellRequire(shield_block charge_cd set=16 enabled=(Level() >= 22))
Define(shield_block_buff 132404)
	SpellInfo(shield_block_buff duration=6)
	SpellAddBuff(shield_block shield_block_buff add=1)
	SpellAddBuff(last_stand shield_block add=1 enabled=(Talent(bolster_talent)))
Define(shield_slam 23922)
	SpellInfo(shield_slam cd=9 cd_haste=1 rage=-15)
	SpellRequire(shield_slam rage add=-3 enabled=(Talent(heavy_repurcussions_talent)))
Define(shield_wall 871)
	SpellInfo(shield_wall cd=240 duration=8 gcd=0 offgcd=1)
	SpellAddBuff(shield_wall shield_wall add=1)
Define(shockwave 46968)
	SpellInfo(shockwave cd=40)
Define(spell_reflection 23920)
	SpellInfo(spell_reflection cd=25 duration=5 gcd=0 offgcd=1)
	SpellAddBuff(spell_reflection spell_reflection add=1)
Define(storm_bolt 107570)
	SpellInfo(storm_bolt cd=30)
	SpellRequire(storm_bolt unusable set=1 enabled=(not Talent(storm_bolt_talent)))
Define(taunt 355)
	SpellInfo(taunt cd=8 duration=3)
	SpellAddTargetDebuff(taunt taunt add=1)
Define(thunder_clap 6343)
	SpellInfo(thunder_clap cd=6 cd_haste=1 rage=-5)
Define(victorious_buff 32216)
	SpellInfo(victorious_buff duration=20)
	SpellAddBuff(impending_victory victorious_buff set=0)
	SpellAddBuff(victory_rush victorious_buff set=0)
Define(victory_rush 34428)
	SpellRequire(victory_rush unusable set=1 enabled=(not BuffPresent(victorious_buff)))
	SpellRequire(victory_rush replaced_by set=impending_victory enabled=(Talent(impending_victory_talent)))

# Covenant Abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(ancient_aftershock 325886)
	SpellInfo(ancient_aftershock cd=90 rage=-4)
	SpellRequire(ancient_aftershock unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(ancient_aftershock unusable set=1 enabled=(not IsCovenant(night_fae)))
Define(condemn 317349)
	SpellInfo(condemn rage=20 max_rage=40)
	SpellRequire(condemn unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(condemn unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellRequire(condemn unusable set=1 enabled=(20 < target.HealthPercent() and target.HealthPercent() < 80))
	SpellRequire(execute replaced_by set=condemn enabled=(IsCovenant(venthyr)))
Define(condemned_debuff 317491)
	SpellInfo(condemned_debuff duration=10)
	SpellAddTargetDebuff(condemn condemned_debuff add=1)
Define(conquerors_banner 324143)
	SpellInfo(conquerors_banner cd=120 rage=-4)
	SpellRequire(conquerors_banner unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(conquerors_banner unusable set=1 enabled=(not IsCovenant(necrolord)))
Define(conquerors_banner_buff 324143)
	SpellInfo(conquerors_banner_buff duration=15)
	SpellAddBuff(conquerors_banner conquerors_banner_buff add=1)
Define(spear_of_bastion 307865)
	SpellInfo(spear_of_bastion cd=60 rage=-25)
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
Define(reprisal_runeforge 6969)
	SpellRequire(charge rage add=-20 enabled=(EquippedRuneforge(reprisal_runeforge)))
	SpellAddBuff(charge shield_block add=1 enabled=(EquippedRuneforge(reprisal_runeforge)))
	SpellAddBuff(charge revenge_buff add=1 enabled=(EquippedRuneforge(reprisal_runeforge)))
	SpellRequire(intervene rage add=-20 enabled=(EquippedRuneforge(reprisal_runeforge)))
	SpellAddBuff(intervene shield_block add=1 enabled=(EquippedRuneforge(reprisal_runeforge)))
	SpellAddBuff(intervene revenge_buff add=1 enabled=(EquippedRuneforge(reprisal_runeforge)))
Define(the_wall_runeforge 6957)
	SpellRequire(shield_slam rage add=-5 enabled=(EquippedRuneforge(the_wall_runeforge)))

# Tier Bonus Effects
Define(seeing_red_buff 364006)
	SpellInfo(seeing_red_buff duration=30)
Define(outburst_buff 364010)
	SpellInfo(outburst_buff duration=30)
	SpellRequire(shield_slam rage add=-30 enabled=(BuffPresent(outburst_buff)))
	SpellAddBuff(shield_slam outburst_buff set=0)
	SpellAddBuff(shield_slam ignore_pain set=1 enabled=(BuffPresent(outburst_buff)))
	SpellRequire(thunder_clap rage add=-10 enabled=(BuffPresent(outburst_buff)))
	SpellAddBuff(thunder_clap outburst_buff set=0)
	SpellAddBuff(thunder_clap ignore_pain set=1 enabled=(BuffPresent(outburst_buff)))

### Functions ###

AddFunction ProtectionInRange
{
	(InFlightToTarget(charge) or InFlightToTarget(intervene) or InFlightToTarget(heroic_leap) or target.InRange(pummel))
}

AddFunction ProtectionHasCharged
{
	PreviousOffGCDSpell(charge)
}

AddFunction ProtectionRavagerRemaining
{
	# Ravager lasts 12 seconds but there is no buff to track its remaining duration.
	if (Talent(ravager_talent) and SpellCooldownDuration(ravager) - SpellCooldown(ravager) < TimeWithHaste(12))
	{
		TimeWithHaste(12) - (SpellCooldownDuration(ravager) - SpellCooldown(ravager))
	}
	0
}

AddFunction ProtectionRagePerSecondRavager
{
	# Ravager generates 10 rage every 2 seconds over 12 seconds.
	if (ProtectionRavagerRemaining() > 0) 5
	0
}

AddFunction ProtectionRagePerSecondShieldSlam
{
	-1 * RageCost(shield_slam) / SpellCooldownDuration(shield_slam)
}

AddFunction ProtectionRagePerSecond
{
	# In N seconds, autoattacks will generate ~N Rage.
	# In N seconds, damage taken will generate 3 rage per hit with a 1-second ICD.
	1 + 3 + ProtectionRagePerSecondRavager() + ProtectionRagePerSecondShieldSlam()
}

AddFunction ProtectionRageGeneratedBeforeShieldBlock
{
	SpellCooldown(shield_block) * ProtectionRagePerSecond()
}

AddFunction ProtectionShouldShieldBlock
{
	# Shield Block should be used when AoE-tanking or if the target is targeting you.
	CheckBoxOn(opt_nerien_shield_block) or Enemies(tagged=1) > 1 or target.IsTargetingPlayer()
}

AddFunction ProtectionNeverSurrenderCoefficient
{
	# Never Surrender makes Ignore Pain prevent 40% to 100% more damage,
	# based on missing health.
	if Talent(never_surrender_talent)     (1.4 + 0.6 * (1 - HealthPercent() / 100))
	if not Talent(never_surrender_talent) (1)
}

AddFunction ProtectionIgnorePainCurrentAbsorb
{
	BuffAmount(ignore_pain value=3)
}

AddFunction ProtectionIgnorePainOnCastAbsorb
{
	# Formula determined through experimentation.
	(7 * WeaponDPS() + AttackPower()) * 3.5 * ((100 + Versatility()) / 100) * ProtectionNeverSurrenderCoefficient()
}

AddFunction ProtectionIgnorePainCap
{
	# The Ignore Pain cap dynamically changes and is always twice the size
	# of the on-cast absorb.
	2 * ProtectionIgnorePainOnCastAbsorb()
}

AddFunction ProtectionCanIgnorePain
{
	# Only use Ignore Pain if it won't reduce the current absorb,
	# and it won't exceed the Ignore Pain cap by more than 30%.
	(ProtectionIgnorePainCurrentAbsorb() < ProtectionIgnorePainCap()) and
	(ProtectionIgnorePainCurrentAbsorb() + ProtectionIgnorePainOnCastAbsorb() < 1.3 * ProtectionIgnorePainCap())
}

AddFunction ProtectionRagePoolSize
{
	# 100 - 30 - 40 - 10 = 20
	MaxRage() - RageCost(shield_block) - RageCost(ignore_pain) - 10
}

AddFunction ProtectionRageCapThreshold
{
	ProtectionRagePoolSize() + RageCost(shield_block) + RageCost(ignore_pain)
}

AddFunction ProtectionHasRageForIgnorePain
{
	# There is enough rage for Ignore Pain only if it won't push back Shield Block.
	(Rage() + ProtectionRageGeneratedBeforeShieldBlock() >= ProtectionRageCapThreshold()) and
	(Rage() - RageCost(ignore_pain) >= ProtectionRagePoolSize())
}

AddFunction ProtectionHasRageForExecute
{
	# There is enough rage for Execute only if it won't push back Shield Block.
	(Rage() + ProtectionRageGeneratedBeforeShieldBlock() >= ProtectionRagePoolSize() + RageCost(shield_block) + RageCost(execute max=1)) and
	(Rage() - RageCost(execute max=1) >= ProtectionRagePoolSize())
}

AddFunction ProtectionHasRageForRevenge
{
	# There is enough rage for Revenge only if it won't push back Shield Block.
	(Rage() + ProtectionRageGeneratedBeforeShieldBlock() >= ProtectionRagePoolSize() + RageCost(shield_block) + RageCost(revenge))
	(Rage() - RageCost(revenge) >= ProtectionRagePoolSize())
}

AddFunction ProtectionRageWillOverCap
{
		(                            Rage()                              > ProtectionRageCapThreshold()) or
		(Spell(avatar)           and Rage() - RageCost(avatar)           > ProtectionRageCapThreshold()) or
		(Spell(dragon_roar)      and Rage() - RageCost(dragon_roar)      > ProtectionRageCapThreshold()) or
		(Spell(shield_slam)      and Rage() - RageCost(shield_slam)      > ProtectionRageCapThreshold()) or
		(Spell(spear_of_bastion) and Rage() - RageCost(spear_of_bastion) > ProtectionRageCapThreshold()) or
		(Spell(thunder_clap)     and Rage() - RageCost(thunder_clap)     > ProtectionRageCapThreshold())
}

AddFunction ProtectionOutburstActions
{
	# Consume Outburst as quickly as possible.
	if BuffPresent(outburst_buff)
	{
		Spell(shield_slam text=tier)
		# Consume Outburst with Thunder Clap if Shield Slam is more than a few seconds away.
		if (SpellCooldown(shield_slam) > 2) Spell(thunder_clap text=tier)
	}
}

AddFunction ProtectionReprisalActions
{
	# Suggest Charge and Intervene with Reprisal to apply/extend Shield Block.
	if (EquippedRuneforge(reprisal_runeforge) and ProtectionShouldShieldBlock())
	{
		if (BuffRemaining(shield_block_buff) < 14)
		{
			Spell(intervene text=block)
			if (target.Distance() < 8) Spell(charge text=block)
		}
	}
}

AddFunction ProtectionRavagerActions
{
	if (ProtectionRavagerRemaining() > 0 and BuffPresent(shield_block_buff))
	{
		# Apply Deep Wounds to targets in melee range.
		if not target.DebuffPresent(deep_wounds_debuff) Spell(revenge text=dot)
		if Talent(heavy_repercussions_talent) Spell(shield_slam text=heavy)
		if (BuffRemaining(shield_block_buff) >= ProtectionRavagerRemaining()) Spell(revenge text=spam)
	}
}

AddFunction ProtectionRevengeActions
{
	# Use Revenge when it's free.
	if BuffPresent(revenge_buff) Spell(revenge text=free)
	if not ProtectionCanIgnorePain()
	{
		# Use Execute to dump Rage.
		if (Enemies(tagged=1) == 1 and ProtectionHasRageForExecute()) Spell(execute text=dump)
		# Use Revenge to dump Rage outside of Execute phase.
		if ProtectionHasRageForRevenge() Spell(revenge text=dump)
	}
}

AddFunction ProtectionPrecombatActiveMitigationActions
{
	PrecombatShortCdActions()
	# Apply Shield Block using Charge with Reprisal.
	if EquippedRuneforge(reprisal_runeforge)
	{
		if target.InRange(charge) Spell(charge text=block)
	}
}

AddFunction ProtectionActiveMitigationActions
{
	if ProtectionShouldShieldBlock()
	{
		# Use Shield Block immediately after Charge if at 2 charges.
		if (ProtectionHasCharged() and Charges(shield_block count=0) > 1.9) Spell(shield_block text=cap)
		if (EquippedRuneforge(reprisal_runeforge) and BuffRemaining(shield_block_buff) < 14)
		{
			# Reprisal Charge extends Shield Block by 4 seconds.
			if target.InRange(charge) Spell(charge text=block)
		}
		if (BuffRemaining(shield_block_buff) < 6)
		{
			# Shield Block extends its duration by 12 seconds.
			if (Charges(shield_block count=0) > 1.9) Spell(shield_block text=cap)
			if (Charges(shield_block count=0) >= 1)  Spell(shield_block text=1)
		}
		if (Talent(bolster_talent) and BuffRemaining(shield_block_buff) < 1)
		{
			# Last Stand applies Shield Block for 15 seconds.
			if (Charges(shield_block) == 0) Spell(last_stand text=block)
		}
	}
	# Ignore Pain if we've been taking damage.
	if (IncomingDamage(5) > 0 and ProtectionCanIgnorePain())
	{
		if ProtectionHasRageForIgnorePain() Spell(ignore_pain)
	}
	# Use Ignore Pain to avoid capping on Rage with the next builder.
	if ProtectionRageWillOverCap() Spell(ignore_pain text=cap)
}

AddFunction ProtectionPrecombatMainActions
{
	Spell(shield_slam text=open)
}

AddFunction ProtectionMainActions
{
	# Use Shield Slam after Charge to apply single-target threat.
	if ProtectionHasCharged() Spell(shield_slam text=open)
	if Talent(unstoppable_force_talent) and BuffPresent(avatar) Spell(thunder_clap)
	ProtectionOutburstActions()
	# Use Victory Rush when it's free.
	if (BuffPresent(victorious_buff) and HealthPercent() < 90) Spell(victory_rush)
	ProtectionRavagerActions()
	# Apply Deep Wounds to targets in melee range.
	if not target.DebuffPresent(deep_wounds_debuff) Spell(revenge text=dot)
	if Always()
	{
		# The single-target priority is SS > Revenge > TC.
		Spell(shield_slam)
		ProtectionRevengeActions()
		Spell(thunder_clap)
	}
	# Use Devastate as filler.
	Spell(devastate)
}

AddFunction ProtectionPrecombatAoEActions
{
	Spell(revenge text=dot)
	Spell(thunder_clap text=open)
}

AddFunction ProtectionAoEActions
{
	# Use Thunder Clap after Charge to apply AoE threat.
	if ProtectionHasCharged() Spell(thunder_clap text=open)
	if Talent(unstoppable_force_talent) and BuffPresent(avatar) Spell(thunder_clap)
	ProtectionOutburstActions()
	# Use Victory Rush when it's free.
	if (BuffPresent(victorious_buff) and HealthPercent() < 90) Spell(victory_rush)
	ProtectionRavagerActions()
	# Use Booming Voice on cooldown.
	if Talent(booming_voice_talent) Spell(demoralizing_shout)
	# Use Dragon Roar on cooldown.
	Spell(dragon_roar)
	# Apply Deep Wounds to targets in melee range.
	if not target.DebuffPresent(deep_wounds_debuff) Spell(revenge text=dot)
	if Talent(anger_management_talent)
	{
		# With Anger Management, the AoE priority is Revenge > SS > TC.
		ProtectionRevengeActions()
		Spell(shield_slam)
		Spell(thunder_clap)
	}
	if not Talent(anger_management_talent)
	{
		# Without Anger Management, the AoE priority is SS > Revenge > TC.
		Spell(shield_slam)
		ProtectionRevengeActions()
		Spell(thunder_clap)
	}
	# Use Devastate as filler.
	Spell(devastate)
}


AddFunction ProtectionPrecombatCdActions
{
	PrecombatCdActions()
}

AddFunction ProtectionOffensiveCdActions
{
	Spell(ravager)
	Spell(avatar)
	Spell(spear_of_bastion)
	Spell(conquerors_banner)
	Spell(ancient_aftershock)
}

AddFunction ProtectionMaxDamageActions
{
	if (Rage() >= RageCost(execute max=1)) Spell(execute)
	Spell(revenge)
}

AddFunction ProtectionDefensiveCdActions
{
	if not Talent(booming_voice_talent) Spell(demoralizing_shout)
	if (Talent(booming_voice_talent) or SpellCooldown(demoralizing_shout) > 0)
	{
		if EquippedRuneforge(the_wall_runeforge) Spell(shield_wall)
		if not Talent(bolster_talent) Spell(last_stand)
		if not EquippedRuneforge(the_wall_runeforge) Spell(shield_wall)
	}
	Spell(fleshcraft)
}

AddFunction ProtectionCdActions
{
	ProtectionDefensiveCdActions()
}

AddFunction ProtectionBuffActions
{
	if not BuffPresent(battle_shout mine=0) Spell(battle_shout)
}

AddFunction ProtectionInterruptActions
{
	if not focus.IsFriend() and focus.Casting()
	{
		if focus.InRange(pummel) and focus.IsInterruptible() Spell(pummel text=focus)
		if focus.IsTargetingPlayer() Spell(spell_reflection text=focus)
		if not focus.Classification(worldboss)
		{
			if focus.InRange(storm_bolt) Spell(storm_bolt text=focus)
			if (focus.Distance() < 10) Spell(shockwave text=focus)
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
			if (target.Distance() < 10) Spell(shockwave)
			if (target.Distance() < 8) Spell(intimidating_shout)
		}
	}
	InterruptActions()
}

AddFunction ProtectionDispelActions
{
	OffensiveDispelActions()
	DefensiveDispelActions()
}

AddFunction ProtectionHealActions
{
	ItemHealActions()
}

### User Interface ###

AddCheckBox(opt_nerien_shield_block L(opt_nerien_shield_block))

AddIcon help=interrupt size=small
{
	ProtectionInterruptActions()
	if EquippedRuneforge(reprisal_runeforge) ProtectionReprisalActions()
	ProtectionDispelActions()
	ProtectionHealActions()
}

AddIcon help=active_mitigation
{
	if not InCombat() ProtectionPrecombatActiveMitigationActions()
	ProtectionActiveMitigationActions()
}

AddIcon enemies=1 help=main
{
	if not InCombat() ProtectionPrecombatMainActions()
	ProtectionMainActions()
}

AddIcon help=aoe
{
	if not InCombat() ProtectionPrecombatAoEActions()
	ProtectionAoEActions()
}

AddIcon help=cd
{
	if not InCombat() ProtectionPrecombatCdActions()
	ProtectionCdActions()
}

AddIcon help=offensive size=small
{
	if not InCombat() ProtectionBuffActions()
	ProtectionOffensiveCdActions()
	if not ProtectionInRange()
	{
		if (not EquippedRuneforge(reprisal_runeforge) and target.InRange(charge)) Spell(charge)
		if (8 <= target.Distance() and target.Distance() <= 40) Spell(heroic_leap)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
	ProtectionMaxDamageActions()
}
]]
	Private.scripts:registerScript("WARRIOR", "protection", name, desc, code, "script")
end