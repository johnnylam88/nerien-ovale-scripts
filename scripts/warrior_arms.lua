local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_warrior_arms"
	local desc = string.format("[9.2] %s: Warrior - Arms", Private.name)
	local code = [[
# Adapted from Icy Veins' Arms Warrior DPS Guide - Shadowlands 9.2
#	by Archimtiros
# https://www.icy-veins.com/wow/arms-warrior-pve-dps-rotation-cooldowns-abilities

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(avatar_talent 22397)
Define(bounding_stride_talent 22627)
Define(cleave_talent 22362)
Define(collateral_damage_talent 22392)
Define(deadly_calm_talent 22399)
Define(defensive_stance_talent 22628)
Define(double_time_talent 19676)
Define(dreadnaught_talent 22407)
Define(fervor_of_battle_talent 22489)
Define(impending_victory_talent 22372)
Define(in_for_the_kill_talent 22394)
Define(massacre_talent 22380)
Define(ravager_talent 21667)
Define(rend_talent 19138)
Define(skullsplitter_talent 22371)
Define(storm_bolt_talent 22789)
Define(sudden_death_talent 22360)
Define(warbreaker_talent 22391)

# Class Abilities
Define(avatar 107574)
	SpellInfo(avatar cd=90 offgcd=1 rage=-20 duration=20)
	SpellRequire(avatar unusable set=1 enabled=(not HasTalent(avatar_talent)))
	SpellAddBuff(avatar avatar add=1)
Define(battle_shout 6673)
	SpellInfo(battle_shout cd=15 duration=3600)
	SpellAddBuff(battle_shout battle_shout add=1)
Define(berserker_rage 18499)
	SpellInfo(berserker_rage cd=60 duration=6)
	SpellAddBuff(berserker_rage berserker_rage add=1)
Define(bladestorm 227847)
	SpellInfo(bladestorm cd=90 duration=6)
	SpellAddBuff(bladestorm bladestorm add=1)
Define(challenging_shout 1161)
	SpellInfo(challenging_shout cd=240 duration=6)
	SpellAddTargetDebuff(challenging_shout challenging_shout add=1)
Define(charge 100)
	SpellInfo(charge cd=20 cd_haste=1 rage=-20 gcd=0 offgcd=1)
	SpellRequire(charge cd set=1.5 enabled=(HasTalent(double_time_talent)))
	SpellRequire(charge charge_cd set=17 enabled=(HasTalent(double_time_talent)))
Define(cleave 845)
	SpellInfo(cleave cd=6 cd_haste=1 rage=20)
	SpellRequire(cleave unusable set=1 enabled=(not HasTalent(cleave_talent)))
	SpellRequire(cleave rage set=0 enabled=(BuffPresent(deadly_calm)))
Define(colossus_smash 167105)
	SpellInfo(colossus_smash cd=45)
Define(colossus_smash_debuff 208086)
	SpellInfo(colossus_smash_debuff duration=10)
	SpellAddTargetDebuff(colossus_smash colossus_smash_debuff add=1)
	SpellAddTargetDebuff(warbreaker colossus_smash_debuff add=1)
Define(deadly_calm 262228)
	SpellInfo(deadly_calm cd=60 offgcd=1 duration=20)
	SpellRequire(deadly_calm unusable set=1 enabled=(not HasTalent(deadly_calm_talent)))
	SpellAddBuff(deadly_calm deadly_calm add=4)
	SpellAddBuff(cleave deadly_calm add=-1)
	SpellAddBuff(condemn deadly_calm add=-1)
	SpellAddBuff(execute deadly_calm add=-1)
	SpellAddBuff(ignore_pain deadly_calm add=-1)
	SpellAddBuff(impending_victory deadly_calm add=-1 enabled=(not BuffPresent(victorious_buff)))
	SpellAddBuff(mortal_strike deadly_calm add=-1)
	SpellAddBuff(rend deadly_calm add=-1)
	SpellAddBuff(slam deadly_calm add=-1)
	SpellAddBuff(whirlwind deadly_calm add=-1)
Define(deep_wounds_debuff 262114)
	SpellInfo(deep_wounds_debuff duration=12 tick=3)
	SpellAddTargetDebuff(bladestorm deep_wounds_debuff add=1)
	SpellAddTargetDebuff(cleave deep_wounds_debuff add=1)
	SpellAddTargetDebuff(colossus_smash deep_wounds_debuff add=1)
	SpellAddTargetDebuff(mortal_strike deep_wounds_debuff add=1)
	SpellAddTargetDebuff(ravager deep_wounds_debuff add=1)
	SpellAddTargetDebuff(warbreaker deep_wounds_debuff add=1)
Define(defensive_stance 197690)
	SpellInfo(defensive_stance cd=6 duration=3600)
	SpellAddBuff(defensive_stance defensive_stance)
Define(die_by_the_sword 118038)
	SpellInfo(die_by_the_sword cd=180 duration=8)
	SpellAddBuff(die_by_the_sword die_by_the_sword add=1)
Define(execute 163201)
	SpellInfo(execute rage=20 max_rage=40)
	SpellRequire(execute unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and target.HealthPercent() > 20))
	SpellRequire(execute rage set=0 enabled=(BuffPresent(deadly_calm)))
	SpellRequire(execute max_rage set=0 enabled=(BuffPresent(deadly_calm)))
Define(execute_massacre 281000)
	SpellInfo(execute_massacre rage=20 max_rage=40)
	SpellRequire(execute_massacre unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and target.HealthPercent() > 35))
	SpellRequire(execute replaced_by set=execute_massacre enabled=(HasTalent(massacre_talent) and not IsCovenant(venthyr)))
Define(heroic_leap 6544)
	SpellInfo(heroic_leap cd=45)
	SpellRequire(heroic_leap cd add=-15 enabled=(HasTalent(bounding_stride_talent)))
Define(heroic_throw 57755)
	SpellInfo(heroic_throw cd=6)
Define(ignore_pain 190456)
	SpellInfo(ignore_pain cd=12 gcd=0 offgcd=1 rage=40 duration=12)
	SpellRequire(ignore_pain rage set=0 enabled=(BuffPresent(deadly_calm)))
	SpellAddBuff(ignore_pain ignore_pain add=1)
Define(impending_victory 202168)
	SpellInfo(impending_victory cd=30 rage=10)
	SpellRequire(impending_victory rage set=0 enabled=(BuffPresent(victorious_buff)))
	SpellRequire(impending_victory rage set=0 enabled=(BuffPresent(deadly_calm)))
Define(intervene 3411)
	SpellInfo(intervene cd=30 rage=0 gcd=0 offgcd=1)
Define(intimidating_shout 5246)
	SpellInfo(intimidating_shout cd=90)
Define(mortal_strike 12294)
	SpellInfo(mortal_strike cd=6 cd_haste=1 rage=30)
	SpellRequire(mortal_strike rage set=0 enabled=(BuffPresent(deadly_calm)))
Define(mortal_wounds_debuff 115804)
	SpellInfo(mortal_wounds_debuff duration=10)
	SpellAddTargetDebuff(mortal_strike mortal_wounds_debuff add=1)
Define(overpower 7384)
	SpellInfo(overpower cd=12 duration=15)
	SpellRequire(overpower cd set=1.5 enabled=(HasTalent(dreadnaught_talent)))
	SpellRequire(overpower charge_cd set=12 enabled=(HasTalent(dreadnaught_talent)))
	SpellAddBuff(overpower overpower add=1)
	SpellAddBuff(cleave overpower set=0)
	SpellAddBuff(mortal_strike overpower set=0)
Define(pummel 6552)
	SpellInfo(pummel cd=15 gcd=0 offgcd=1)
Define(rallying_cry 97462)
	SpellInfo(rallying_cry cd=180 duration=10 gcd=0 offgcd=1)
	SpellAddBuff(rallying_cry rallying_cry add=1)
Define(ravager 152277)
	SpellInfo(ravager cd=45)
	SpellRequire(bladestorm replaced_by set=ravager enabled=(HasTalent(ravager_talent)))
Define(rend 772)
	SpellInfo(rend rage=30 duration=15 tick=3)
	SpellRequire(rend unusable set=1 enabled=(not HasTalent(rend_talent)))
	SpellRequire(rend rage set=0 enabled=(BuffPresent(deadly_calm)))
	SpellAddTargetDebuff(rend rend add=1)
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
Define(skullsplitter 260643)
	SpellInfo(skullsplitter cd=21 cd_haste=1 rage=-20)
	SpellRequire(skullsplitter unusable set=0 enabled=(not HasTalent(skullsplitter_talent)))
Define(slam 1464)
	SpellInfo(slam rage=20)
	SpellRequire(slam rage set=0 enabled=(BuffPresent(deadly_calm)))
Define(spell_reflection 23920)
	SpellInfo(spell_reflection cd=25 duration=5 gcd=0 offgcd=1)
	SpellAddBuff(spell_reflection spell_reflection add=1)
Define(storm_bolt 107570)
	SpellInfo(storm_bolt cd=30)
	SpellRequire(storm_bolt unusable set=1 enabled=(not HasTalent(storm_bolt_talent)))
Define(sudden_death_buff 52437)
	SpellInfo(sudden_death_buff duration=10)
	SpellAddBuff(condemn sudden_death_buff set=0 enabled=(IsCovenant(venthyr) and HasTalent(sudden_death_talent)))
	SpellAddBuff(execute sudden_death_buff set=0 enabled=(HasTalent(sudden_death_talent)))
Define(sweeping_strikes 260708)
	SpellInfo(sweeping_strikes cd=30 duration=15)
	SpellAddBuff(sweeping_strikes sweeping_strikes add=1)
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
Define(warbreaker 262161)
	SpellInfo(warbreaker cd=45)
	SpellRequire(warbreaker unusable set=1 enabled=(not HasTalent(warbreaker_talent)))
	SpellRequire(colossus_smash replaced_by set=warbreaker enabled=(HasTalent(warbreaker_talent)))
Define(whirlwind 1680)
	SpellInfo(whirlwind rage=30)
	SpellRequire(whirlwind rage set=0 enabled=(BuffPresent(deadly_calm)))

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
	SpellRequire(condemn unusable set=1 enabled=(not BuffPresent(sudden_death_buff) and target.HealthPercent() > 20 and target.HealthPercent() < 80))
	SpellRequire(execute replaced_by set=condemn enabled=(not Talent(massacre_talent) and IsCovenant(venthyr)))
	SpellAddBuff(condemn sudden_death_buff set=0 enabled=(Talent(sudden_death_talent)))
Define(condemn_massacre 330334)
	SpellInfo(condemn_massacre rage=20 max_rage=40)
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
Define(battlelord_runeforge 6960)
Define(battlelord_buff 346369)
	SpellInfo(battlelord_buff duration=10)
	SpellRequire(mortal_strike rage add=-15 enabled=(not BuffPresent(deadly_calm) and BuffPresent(battlelord_buff)))
	SpellAddBuff(mortal_strike battlelord_buff set=0 enabled=(not BuffPresent(deadly_calm)))
Define(elysian_might_runeforge 7730)
	SpellRequire(spear_of_bastion_debuff duration add=4
		enabled=(IsCovenant(kyrian) and (EquippedRuneforge(elysian_might_runeforge) or EquippedRuneforge(unity_runeforge) or HasEquippedItem(unity_belt))))
Define(elysian_might_buff 311193)
	SpellInfo(elysian_might_buff duration=8)
	SpellAddBuff(spear_of_bastion elysian_might_buff add=1
		enabled=(IsCovenant(kyrian) and (EquippedRuneforge(elysian_might_runeforge) or EquippedRuneforge(unity_runeforge) or HasEquippedItem(unity_belt))))
Define(enduring_blow_runeforge 0)
Define(signet_of_tormented_kings_runeforge 6959)
Define(unity_belt 190475)
Define(unity_runeforge 8130)

### Functions ###

AddFunction ArmsInRange {
	(InFlightToTarget(charge) or InFlightToTarget(intervene) or InFlightToTarget(heroic_leap) or target.InRange(pummel)) 
}

AddFunction ArmsInExecuteRange {
	HasTalent(massacre_talent) and target.HealthPercent() < 35 or target.HealthPercent() < 20
}

AddFunction ArmsSingleTargetActions {
	unless BuffPresent(bladestorm) {
		if (not ArmsInExecuteRange() and not target.DebuffPresent(colossus_smash_debuff) and target.DebuffRemaining(rend) < 4) Spell(rend)
		if (Charges(overpower count=0) > SpellMaxCharges(overpower) - 0.2) Spell(overpower)
		if (BuffStacks(overpower) == 2) Spell(mortal_strike text=plus)
		if (BuffPresent(battlelord_buff) or EquippedRuneforge(enduring_blow_runeforge)) Spell(mortal_strike text=lego)
		if (Rage() < 55 or (ArmsInExecuteRange() and Rage() < 60)) Spell(skullsplitter)
		if BuffPresent(sudden_death_buff) Spell(execute)
		Spell(overpower)
		if ArmsInExecuteRange() {
			Spell(execute)
		}
		unless ArmsInExecuteRange() {
			Spell(mortal_strike)
			Spell(condemn)
			if HasTalent(fervor_of_battle_talent) Spell(whirlwind)
			unless HasTalent(fervor_of_battle_talent) Spell(slam)
		}
	}
}

AddFunction ArmsSingleTargetShortCdActions {
	unless BuffPresent(bladestorm) {
		unless (not ArmsInExecuteRange() and not target.DebuffPresent(colossus_smash_debuff) and target.DebuffRemaining(rend) < 4 and Spell(rend)) {
			if EquippedRuneforge(signet_of_tormented_kings_runeforge) {
				if target.DebuffPresent(colossus_smash_debuff) Spell(avatar text=st)
			}
			unless EquippedRuneforge(signet_of_tormented_kings_runeforge) {
				if (SpellCooldown(colossus_smash) < 8) Spell(avatar text=st)
			}
			if ArmsInExecuteRange() Spell(deadly_calm text=st)
			if (
				not (IsCovenant(kyrian) or IsCovenant(night_fae)) or
				(IsCovenant(kyrian) and (SpellCooldown(spear_of_bastion) > 40 or SpellCooldown(spear_of_bastion) < GCD())) or
				(IsCovenant(night_fae) and (SpellCooldown(ancient_aftershock) > 40 or SpellCooldown(ancient_aftershock) < GCD()))
			) {
				if (SpellCooldown(colossus_smash) < GCD()) Spell(ravager text=st)
				Spell(colossus_smash text=st)
			}

			unless (
				(Charges(overpower count=0) > SpellMaxCharges(overpower) - 0.2 and Spell(overpower)) or
				((BuffStacks(overpower) == 2 or BuffPresent(battlelord_buff) or EquippedRuneforge(enduring_blow_runeforge)) and Spell(mortal_strike)) or
				((Rage() < 55 or (ArmsInExecuteRange() and Rage() < 60)) and Spell(skullsplitter)) or
				(BuffPresent(sudden_death_buff) and Spell(execute))
			) {
				Spell(deadly_calm text=st)
			}
		}
	}
}

AddFunction ArmsSingleTargetCdActions {
	unless BuffPresent(bladestorm) {
		Spell(conquerors_banner text=st)

		unless (
			(not ArmsInExecuteRange() and not target.DebuffPresent(colossus_smash_debuff) and target.DebuffRemaining(rend) < 4 and Spell(rend)) or
			((not (IsCovenant(kyrian) or IsCovenant(night_fae)) or
				(IsCovenant(kyrian) and (SpellCooldown(spear_of_bastion) > 40 or SpellCooldown(spear_of_bastion) < GCD())) or
				(IsCovenant(night_fae) and (SpellCooldown(ancient_aftershock) > 40 or SpellCooldown(ancient_aftershock) < GCD()))) and
				((SpellCooldown(colossus_smash) < GCD() and Spell(ravager)) or
					Spell(colossus_smash))) or
			(Charges(overpower count=0) > SpellMaxCharges(overpower) - 0.2 and Spell(overpower)) or
			((BuffStacks(overpower) == 2 or BuffPresent(battlelord_buff) or EquippedRuneforge(enduring_blow_runeforge)) and Spell(mortal_strike))
		) {
			if target.DebuffPresent(colossus_smash_debuff) {
				Spell(ancient_aftershock text=st)
				Spell(spear_of_bastion text=st)
			}
			if (not Talent(ravager_talent) and ArmsInExecuteRange() and Rage() < 30) Spell(bladestorm text=st)

			unless ((Rage() < 55 or (ArmsInExecuteRange() and Rage() < 60)) and Spell(skullsplitter)) {
				if (not Talent(ravager_talent) and not ArmsInExecuteRange() and Rage() < 50) Spell(bladestorm text=st)
			}
		}
	}
}

AddFunction ArmsMultiTargetActions {
	unless BuffPresent(bladestorm) {
		if (Enemies(tagged=1) < 4 and not target.DebuffPresent(colossus_smash_debuff) and target.DebuffRemaining(rend) < 4) Spell(rend)
		if (Rage() < 60 and (Talent(ravager_talent) or SpellCooldown(bladestorm) > 2 * GCD())) Spell(skullsplitter)
		Spell(cleave)
		if (Enemies(tagged=1) < 4 or BuffPresent(sweeping_strikes)) Spell(execute)
		if (Enemies(tagged=1) >= 4 and target.DebuffPresent(colossus_smash_debuff)) Spell(whirlwind)
		Spell(overpower)
		if (Enemies(tagged=1) < 4) {
			if (BuffStacks(overpower) == 2) Spell(mortal_strike text=plus)
			Spell(mortal_strike)
			if (not HasTalent(fervor_of_battle_talent) and BuffPresent(sweeping_strikes)) Spell(slam)
		}
		Spell(whirlwind)
	}
}

AddFunction ArmsMultiTargetShortCdActions {
	unless BuffPresent(bladestorm) {
		if (Talent(ravager_talent) or SpellCooldown(bladestorm) > BuffDuration(sweeping_strikes)) Spell(sweeping_strikes text=aoe)

		unless (
			(Enemies(tagged=1) < 4 and not target.DebuffPresent(colossus_smash_debuff) and target.DebuffRemaining(rend) < 4 and Spell(rend)) or
			(Rage() < 60 and (Talent(ravager_talent) or SpellCooldown(bladestorm) > 2 * GCD()) and Spell(skullsplitter))
		) {
			if EquippedRuneforge(signet_of_tormented_kings_runeforge) {
				if target.DebuffPresent(colossus_smash_debuff) Spell(avatar text=aoe)
			}
			unless EquippedRuneforge(signet_of_tormented_kings_runeforge) {
				if (SpellCooldown(colossus_smash) < 8) Spell(avatar text=aoe)
			}
			if (
				not (IsCovenant(kyrian) or IsCovenant(night_fae)) or
				(IsCovenant(kyrian) and (SpellCooldown(spear_of_bastion) > 40 or SpellCooldown(spear_of_bastion) < GCD())) or
				(IsCovenant(night_fae) and (SpellCooldown(ancient_aftershock) > 40 or SpellCooldown(ancient_aftershock) < GCD()))
			) {
				if (SpellCooldown(colossus_smash) < GCD()) Spell(ravager text=aoe)
				if Talent(ravager_talent) Spell(colossus_smash text=aoe)
				if (SpellCooldown(bladestorm) > 40 or SpellCooldown(bladestorm) < GCD()) Spell(colossus_smash text=aoe)
			}
			Spell(deadly_calm text=aoe)
		}
	}
}

AddFunction ArmsMultiTargetCdActions {
	unless BuffPresent(bladestorm) {
		Spell(conquerors_banner text=aoe)

		unless (
			((Talent(ravager_talent) or SpellCooldown(bladestorm) > BuffDuration(sweeping_strikes)) and Spell(sweeping_strikes)) or
			(Rage() < 60 and (Talent(ravager_talent) or SpellCooldown(bladestorm) > 2 * GCD()) and Spell(skullsplitter))
		) {
			if target.DebuffPresent(colossus_smash_debuff) {
				Spell(ancient_aftershock text=aoe)
				Spell(spear_of_bastion text=aoe)
				unless Talent(ravager_talent) Spell(bladestorm text=aoe)
			}
		}
	}
}

AddFunction ArmsPrecombatShortCdActions {
	PrecombatShortCdActions()
}

AddFunction ArmsPrecombatMainActions { }

AddFunction ArmsPrecombatCdActions {
	PrecombatCdActions()
}

AddFunction ArmsBuffActions {
	unless BuffPresent(battle_shout) Spell(battle_shout)
}

AddFunction ArmsDefensiveActions {
	Spell(die_by_the_sword)
	Spell(fleshcraft)
	Spell(rallying_cry)
	Spell(ignore_pain)
}

AddFunction ArmsInterruptActions {
	if (not focus.IsFriend() and focus.Casting()) {
		if focus.InRange(pummel) and focus.IsInterruptible() Spell(pummel text=focus)
		if focus.IsTargetingPlayer() Spell(spell_reflection text=focus)
		unless focus.Classification(worldboss) {
			if focus.InRange(storm_bolt) Spell(storm_bolt text=focus)
			if (focus.Distance() < 8) Spell(intimidating_shout text=focus)
		}
	}
	if (not target.IsFriend() and target.Casting()) {
		if target.InRange(pummel) and target.IsInterruptible() Spell(pummel)
		if target.IsTargetingPlayer() Spell(spell_reflection)
		unless target.Classification(worldboss) {
			if target.InRange(storm_bolt) Spell(storm_bolt)
			if (target.Distance() < 8) Spell(intimidating_shout)
		}
	}
	InterruptActions()
}

AddFunction ArmsDispelActions {
	OffensiveDispelActions()
	DefensiveDispelActions()
}

AddFunction ArmsHealActions {
	ItemHealActions()
	if (HealthPercent() < 70) Spell(victory_rush)
}

### User Interface ###

AddIcon help=interrupt size=small {
	ArmsInterruptActions()
	ArmsDispelActions()
	ArmsHealActions()
	ArmsDefensiveActions()
}

AddIcon help=shortcd {
	unless InCombat() ArmsPrecombatShortCdActions()
	if (Enemies(tagged=1) > 1) {
		ArmsMultiTargetShortCdActions()
	}
	unless (Enemies(tagged=1) > 1) {
		ArmsSingleTargetShortCdActions()
	}
}

AddIcon enemies=1 help=main {
	unless InCombat() ArmsPrecombatMainActions()
	ArmsSingleTargetActions()
}

AddIcon help=aoe {
	unless InCombat() ArmsPrecombatMainActions()
	ArmsMultiTargetActions()
}

AddIcon help=cd {
	unless InCombat() ArmsPrecombatCdActions()
	if (Enemies(tagged=1) > 1) {
		ArmsMultiTargetCdActions()
	}
	unless (Enemies(tagged=1) > 1) {
		ArmsSingleTargetCdActions()
	}
}

AddIcon help=trinkets size=small {
	unless InCombat() ArmsBuffActions()
	unless ArmsInRange() {
		if target.InRange(charge) Spell(charge)
		if (8 <= target.Distance() and target.Distance() <= 40) Spell(heroic_leap)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("WARRIOR", "arms", name, desc, code, "script")
end