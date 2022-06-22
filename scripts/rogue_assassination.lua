local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_rogue_assassination"
	local desc = string.format("[9.2 %s: Rogue - Assassination", Private.name)
	local code = [[
# Adapted from Icy Veins "Assassination Rogue DPS Rotation, Cooldowns, and Abilities"
#	by Seliathan
# https://www.icy-veins.com/wow/assassination-rogue-pve-dps-rotation-cooldowns-abilities

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(alacrity_talent 23015)
Define(blindside_talent 22339)
Define(crimson_tempest_talent 23174)
Define(elaborate_planning_talent 22338)
Define(exsanguinate_talent 22344)
Define(hidden_blades_talent 22133)
Define(internal_bleeding_talent 19245)
Define(iron_wire_talent 23037)
Define(master_assassin_talent 23022)
Define(marked_for_death_talent 19241)
Define(nightstalker_talent 22331)
Define(prey_on_the_weak_talent 22115)
Define(subterfuge_talent 22332)
Define(venom_rush_talent 22343)

# Class Abilities
Define(ambush 8676)
	SpellInfo(ambush energy=50 combopoints=-2)
	SpellRequire(ambush unusable set=1 enabled=(not Stealthed() and not BuffPresent(blindside) and not BuffPresent(sepsis_stealth_buff)))
Define(blind 2094)
	SpellInfo(blind cd=120)
Define(blindside 121153)
	SpellInfo(blindside duration=10)
	SpellRequire(ambush energy set=0 enabled=(BuffPresent(blindside)))
	SpellAddBuff(ambush blindside set=0 enabled=(Talent(blindside_talent)))
Define(cheap_shot 1833)
	SpellInfo(cheap_shot energy=40 combopoints=-1)
	SpellRequire(cheap_shot unusable set=1 enabled=(not Stealthed() and not BuffPresent(sepsis_stealth_buff)))
Define(cloak_of_shadows 31224)
	SpellInfo(cloak_of_shadows cd=120 duration=5)
	SpellAddBuff(cloak_of_shadows cloak_of_shadows add=1)
Define(crimson_vial 185311)
	SpellInfo(crimson_vial energy=20 cd=30 duration=4 tick=1)
	SpellAddBuff(crimson_vial crimson_vial add=1)
Define(crimson_tempest 121411)
	SpellInfo(crimson_tempest energy=35 combopoints=1 set_combopoints=0)
	SpellInfo(crimson_tempest duration=2 add_duration_combopoints=2 tick=2)
	SpellRequire(crimson_tempest unusable set=1 enabled=(not Talent(crimson_tempest_talent)))
	SpellAddTargetDebuff(crimson_tempest crimson_tempest add=1)
Define(cut_to_the_chase 51667)
Define(deadly_poison 2823)
	SpellInfo(deadly_poison duration=3600 gcd=0 offgcd=1)
	SpellAddBuff(deadly_poison deadly_poison add=1)
Define(deadly_poison_debuff 2818)
	SpellInfo(deadly_poison_debuff duration=12 tick=2)
Define(elaborate_planning 193641)
	SpellInfo(elaborate_planning duration=4)
	SpellAddBuff(crimson_tempest elaborate_planning add=1 enabled=(Talent(elaborate_planning_talent)))
	SpellAddBuff(envenom elaborate_planning add=1 enabled=(Talent(elaborate_planning_talent)))
	SpellAddBuff(kidney_shot elaborate_planning add=1 enabled=(Talent(elaborate_planning_talent)))
	SpellAddBuff(rupture elaborate_planning add=1 enabled=(Talent(elaborate_planning_talent)))
	SpellAddBuff(slice_and_dice elaborate_planning add=1 enabled=(Talent(elaborate_planning_talent)))
Define(envenom 32645)
	SpellInfo(envenom energy=35 combopoints=1 set_combopoints=0)
	SpellInfo(envenom duration=1 add_duration_combopoints=1 tick=1)
	SpellAddTargetDebuff(envenom envenom add=1)
	SpellAddBuff(envenom slice_and_dice add=1 enabled=(SpellKnown(cut_to_the_chase) and BuffPresent(slice_and_dice)))
Define(evasion 5277)
	SpellInfo(evasion cd=120 duration=10 gcd=0 offgcd=1)
	SpellAddBuff(evasion evasion add=1)
Define(exsanguinate 200806)
	SpellInfo(exsanguinate cd=45 energy=25)
	SpellRequire(exsanguinate unusable set=1 enabled=(not Talent(exsanguinate_talent)))
Define(fan_of_knives 51723)
	SpellInfo(fan_of_knives energy=35 combopoints=-1)
Define(feint 1966)
	SpellInfo(feint energy=35 cd=15 duration=6)
	SpellAddBuff(feint feint add=1)
Define(garrote 703)
	SpellInfo(garrote cd=6 energy=45 combopoints=-1 duration=18 tick=2)
	SpellAddTargetDebuff(garrote garrote add=1)
Define(grudge_match 364668)
	SpellInfo(grudge_match duration=9)
	SpellAddTargetDebuff(shiv grudge_match add=1)
Define(hidden_blades 270070)
	SpellAddBuff(fan_of_knives hidden_blades set=0 enabled=Talent(hidden_blades_talent))
Define(internal_bleeding 154953)
	SpellInfo(internal_bleeding duration=1 add_duration_combopoints=1 tick=1)
	SpellAddTargetDebuff(kidney_shot internal_bleeding add=1 enabled=(Talent(internal_bleeding_talent)))
Define(iron_wire 256148)
	SpellInfo(iron_wire duration=8)
	SpellAddTargetDebuff(garrote iron_wire add=1 enabled=(Talent(iron_wire_talent)))
Define(kick 1766)
	SpellInfo(kick cd=15 gcd=0 offgcd=1 interrupt=1)
Define(kidney_shot 408)
	SpellInfo(kidney_shot energy=25 cd=20 combopoints=1 set_combopoints=0)
	SpellInfo(kidney_shot duration=1 add_duration_combopoints=1 tick=1)
	SpellAddTargetDebuff(kidney_shot kidney_shot add=1)
Define(marked_for_death 137619)
	SpellInfo(marked_for_death cd=60 duration=60 gcd=0 offgcd=1 combopoints=-5)
	SpellRequire(marked_for_death unusable set=1 enabled=(not Talent(marked_for_death_talent)))
	SpellAddTargetDebuff(marked_for_death marked_for_death add=1)
Define(master_assassin 256735)
	SpellInfo(master_assassin duration=3)
	SpellAddBuff(stealth master_assassin add=1 enabled=(Talent(master_assassin_talent)))
Define(mutilate 1329)
	SpellInfo(mutilate energy=50 refund_energy=0 combopoints=-2)
	SpellRequire(mutilate refund_energy set=8 enabled=(Talent(venom_rush_talent) and target.DebuffPresent(poisoned_debuff)))
Define(numbing_poison 5761)
	SpellInfo(numbing_poison duration=3600 gcd=0 offgcd=1)
	SpellAddBuff(numbing_poison numbing_poison add=1)
Define(poisoned_knife 185565)
	SpellInfo(poisoned_knife energy=40 combopoints=-1)
	SpellAddTargetDebuff(poisoned_knife deadly_poison_debuff add=1 enabled=(BuffPresent(deadly_poison)))
Define(prey_on_the_weak 255909)
	SpellInfo(prey_on_the_weak duration=6)
	SpellAddTargetDebuff(cheap_shot prey_on_the_weak add=1 enabled=(Talent(prey_on_the_weak_talent)))
	SpellAddTargetDebuff(kidney_shot prey_on_the_weak add=1 enabled=(Talent(prey_on_the_weak_talent)))
Define(rupture 1943)
	SpellInfo(rupture energy=25 combopoints=1 set_combopoints=0)
	SpellInfo(rupture duration=4 add_duration_combopoints=4 tick=2)
	SpellAddTargetDebuff(rupture rupture add=1)
Define(shadowstep 36554)
	SpellInfo(shadowstep cd=30 gcd=0 offgcd=1 duration=2)
	SpellAddBuff(shadowstep shadowstep add=1)
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
	SpellDamageBuff(crimson_tempest stealth set=1.5 enabled=(Talent(nightstalker_talent)))
	SpellDamageBuff(garrote stealth set=1.5 enabled=(Talent(nightstalker_talent)))
	SpellDamageBuff(rupture stealth set=1.5 enabled=(Talent(nightstalker_talent)))
	SpellAddBuff(stealth stealth add=1 enabled=(not Talent(subterfuge_talent)))
Define(stealth_subterfuge 115191)
	SpellInfo(stealth_subterfuge cd=2 gcd=0 offgcd=1)
	SpellRequire(stealth_subterfuge unusable set=1 enabled=(Stealthed() or InCombat()))
	SpellRequire(stealth replaced_by set=stealth_subterfuge enabled=(Talent(subterfuge_talent)))
	SpellRequire(garrote cd set=0 enabled=(Talent(subterfuge_talent) and (BuffPresent(stealth_subterfuge) or BuffPresent(subterfuge))))
	SpellDamageBuff(garrote stealth_subterfuge set=1.8 enabled=(Talent(subterfuge_talent)))
	SpellAddBuff(stealth_subterfuge stealth_subterfuge add=1)
Define(subterfuge 115192)
	SpellInfo(subterfuge duration=3)
	SpellDamageBuff(garrote subterfuge set=1.8 enabled=(Talent(subterfuge_talent)))
	SpellAddBuff(stealth_subterfuge subterfuge add=1)
Define(tricks_of_the_trade 57934)
	SpellInfo(tricks_of_the_trade cd=30)
Define(vanish 1856)
	SpellInfo(vanish cd=120 gcd=0 offgcd=1)
	SpellRequire(vanish unusable set=1 enabled=(not InCombat() or Stealthed()))
Define(vanish_buff 11327)
	SpellInfo(vanish_buff duration=3)
	SpellAddBuff(vanish vanish_buff add=1)
Define(vendetta 79140)
	SpellInfo(vendetta cd=120 duration=20)
	SpellAddTargetDebuff(vendetta vendetta add=1)
Define(vendetta_buff 256495)
	SpellInfo(vendetta_buff duration=3)
	SpellAddBuff(vendetta vendetta_buff add=1)
Define(wound_poison 8679)
	SpellInfo(wound_poison duration=3600 gcd=0 offgcd=1)
	SpellAddBuff(wound_poison wound_poison add=1)
Define(wound_poison_debuff 8680)
	SpellInfo(wound_poison_debuff duration=12 tick=2)
SpellList(lethal_poison deadly_poison wound_poison)
SpellList(poisoned_debuff deadly_poison_debuff wound_poison_debuff)

# Covenant Abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(echoing_reprimand 323547)
	SpellInfo(echoing_reprimand energy=10 cd=45 combopoints=-2)
	SpellRequire(echoing_reprimand unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(echoing_reprimand unusable set=1 enabled=(not IsCovenant(kyrian)))
Define(echoing_reprimand_2 323558)
	SpellInfo(echoing_reprimand_2 duration=45)
	SpellAddBuff(crimson_tempest echoing_reprimand_2 set=0 enabled=(ComboPoints() == 2))
	SpellAddBuff(envenom echoing_reprimand_2 set=0 enabled=(ComboPoints() == 2))
	SpellAddBuff(kidney_shot echoing_reprimand_2 set=0 enabled=(Talent(internal_bleeding_talent) and ComboPoints() == 2))
	SpellAddBuff(rupture echoing_reprimand_2 set=0 enabled=(ComboPoints() == 2))
Define(echoing_reprimand_3 323559)
	SpellInfo(echoing_reprimand_3 duration=45)
	SpellAddBuff(crimson_tempest echoing_reprimand_3 set=0 enabled=(ComboPoints() == 3))
	SpellAddBuff(envenom echoing_reprimand_3 set=0 enabled=(ComboPoints() == 3))
	SpellAddBuff(kidney_shot echoing_reprimand_3 set=0 enabled=(Talent(internal_bleeding_talent) and ComboPoints() == 3))
	SpellAddBuff(rupture echoing_reprimand_3 set=0 enabled=(ComboPoints() == 3))
Define(echoing_reprimand_4 323560)
	SpellInfo(echoing_reprimand_4 duration=45)
	SpellAddBuff(crimson_tempest echoing_reprimand_4 set=0 enabled=(ComboPoints() == 4))
	SpellAddBuff(envenom echoing_reprimand_4 set=0 enabled=(ComboPoints() == 4))
	SpellAddBuff(kidney_shot echoing_reprimand_4 set=0 enabled=(Talent(internal_bleeding_talent) and ComboPoints() == 4))
	SpellAddBuff(rupture echoing_reprimand_4 set=0 enabled=(ComboPoints() == 4))
Define(echoing_reprimand_5 354838)
	SpellInfo(echoing_reprimand_5 duration=45)
	SpellAddBuff(crimson_tempest echoing_reprimand_5 set=0 enabled=(ComboPoints() == 5))
	SpellAddBuff(envenom echoing_reprimand_5 set=0 enabled=(ComboPoints() == 5))
	SpellAddBuff(kidney_shot echoing_reprimand_5 set=0 enabled=(Talent(internal_bleeding_talent) and ComboPoints() == 5))
	SpellAddBuff(rupture echoing_reprimand_5 set=0 enabled=(ComboPoints() == 5))
Define(flagellation 323654)
	SpellInfo(flagellation cd=90 duration=12 max_stacks=30)
	SpellRequire(flagellation unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(flagellation unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddTargetDebuff(flagellation flagellation add=1)
Define(sepsis 328305)
	SpellInfo(sepsis energy=25 cd=90 duration=10 combopoints=-1 tick=1)
	SpellRequire(sepsis unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(sepsis unusable set=1 enabled=(not IsCovenant(night_fae)))
	SpellAddTargetDebuff(sepsis sepsis add=1)
Define(sepsis_stealth_buff 347037)
	SpellInfo(sepsis_stealth_buff duration=5)
	SpellAddBuff(ambush sepsis_stealth_buff set=0 enabled=(IsCovenant(night_fae)))
	SpellAddBuff(cheap_shot sepsis_stealth_buff set=0 enabled=(IsCovenant(night_fae)))
Define(serrated_bone_spike 328547)
	SpellInfo(serrated_bone_spike energy=15 cd=1 charge_cd=30 combopoints=-1)
	SpellRequire(serrated_bone_spike unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(serrated_bone_spike unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellRequire(serrated_bone_spike combopoints add=-1 enabled=(DebuffCountOnAny(serrated_bone_spike_debuff) == 1))
	SpellRequire(serrated_bone_spike combopoints add=-2 enabled=(DebuffCountOnAny(serrated_bone_spike_debuff) == 2))
	SpellRequire(serrated_bone_spike combopoints add=-3 enabled=(DebuffCountOnAny(serrated_bone_spike_debuff) == 3))
	SpellRequire(serrated_bone_spike combopoints add=-4 enabled=(DebuffCountOnAny(serrated_bone_spike_debuff) == 4))
	SpellRequire(serrated_bone_spike combopoints add=-5 enabled=(DebuffCountOnAny(serrated_bone_spike_debuff) >= 5))
Define(serrated_bone_spike_debuff 324073)
	SpellInfo(serrated_bone_spike_debuff tick=3)
	SpellAddTargetDebuff(serrated_bone_spike serrated_bone_spike_debuff add=1)

# Runeforge Legendary Effects
Define(deathly_shadows_runeforge 7126)
Define(mark_of_the_master_assassin_runeforge 7111)

Define(deathly_shadows 341202)
	SpellInfo(deathly_shadows duration=12)
	SpellRequire(vanish combopoints add=-5 enabled=(EquippedRuneforge(deathly_shadows_runeforge)))
	SpellAddBuff(vanish deathly_shadows add=1 enabled=(EquippedRuneforge(deathly_shadows_runeforge)))
Define(master_assassins_mark 340094)
	SpellInfo(master_assassins_mark duration=4)
	SpellAddBuff(shadow_dance master_assassins_mark add=1 enabled=(EquippedRuneforge(mark_of_the_master_assassin_runeforge)))
	SpellAddBuff(stealth master_assassins_mark add=1 enabled=(EquippedRuneforge(mark_of_the_master_assassin_runeforge)))
	SpellAddBuff(stealth_subterfuge master_assassins_mark add=1 enabled=(EquippedRuneforge(mark_of_the_master_assassin_runeforge)))
	SpellAddBuff(vanish master_assassins_mark add=1 enabled=(EquippedRuneforge(mark_of_the_master_assassin_runeforge)))

### Functions ###

AddFunction AssassinationInCombat {
	InCombat() or BuffPresent(vanish_buff)
}

AddFunction AssassinationInRange {
	((Stealthed() and target.InRange(ambush)) or (not Stealthed() and target.InRange(mutilate)))
}

AddFunction AssassinationUpToThreeTargets {
	if (Enemies(tagged=1) > 3) 3
	Enemies(tagged=1)
}

AddFunction AssassinationUpToFourTargets {
	if (Enemies(tagged=1) > 4) 4
	Enemies(tagged=1)
}

AddFunction AssassinationOnAnimachargedComboPoint {
	IsCovenant(kyrian) and (
		(BuffPresent(echoing_reprimand_2) and ComboPoints() == 2) or
		(BuffPresent(echoing_reprimand_3) and ComboPoints() == 3) or
		(BuffPresent(echoing_reprimand_4) and ComboPoints() == 4) or
		(BuffPresent(echoing_reprimand_5) and ComboPoints() == 5)
	)
}

AddFunction AssassinationSliceAndDiceMaintenanceActions {
	if (BuffPresent(slice_and_dice) and BuffRefreshable(slice_and_dice)) {
		if (ComboPointsDeficit() <= 1 or AssassinationOnAnimachargedComboPoint()) {
			if SpellKnown(cut_to_the_chase) Spell(envenom text=snd)
			unless SpellKnown(cut_to_the_chase) Spell(slice_and_dice)
		}
	}
}

AddFunction AssassinationExsanguinateActions {
	if Talent(exsanguinate_talent) {
		#actions.cds+=/exsanguinate,if=!stealthed.rogue&(!dot.garrote.refreshable&dot.rupture.remains>4+4*cp_max_spend|dot.rupture.remains*0.5>target.time_to_die)&target.time_to_die>4
		if (target.DebuffPresent(rupture) and target.TimeToDie() > 4) {
			if (target.DebuffRemaining(rupture) > 24) Spell(exsanguinate)
			if (target.DebuffRemaining(rupture) * 0.5 > target.TimeToDie()) Spell(exsanguinate)
		}
	}
}

AddFunction AssassinationSingleTargetGarroteActions {
	if (ComboPointsDeficit() > 0) {
		if target.DebuffPresent(garrote) {
			if (PersistentMultiplier(garrote) > target.DebuffPersistentMultiplier(garrote)) {
				Spell(garrote text=plus)
			}
			unless (PersistentMultiplier(garrote) > target.DebuffPersistentMultiplier(garrote)) {
				if target.DebuffRefreshable(garrote) Spell(garrote)
			}
		}
		unless target.DebuffPresent(garrote) {
			Spell(garrote text=new)
		}
	}
}

AddFunction AssassinationSingleTargetRuptureActions {
	if (ComboPoints() >= 4 or AssassinationOnAnimachargedComboPoint()) {
		if (BaseDuration(rupture) >= target.TimeToDie()) {
			if target.DebuffPresent(rupture) {
				if (PersistentMultiplier(rupture) > target.DebuffPersistentMultiplier(rupture)) {
					Spell(rupture text=plus)
				}
				unless (PersistentMultiplier(rupture) > target.DebuffPersistentMultiplier(rupture)) {
					if target.DebuffRefreshable(rupture) Spell(rupture)
				}
			}
			unless target.DebuffPresent(rupture) {
				Spell(rupture text=new)
			}
		}
	}
}

AddFunction AssassinationSingleTargetSerratedBoneSpikeActions {
	if IsCovenant(necrolord) {
		if target.DebuffPresent(serrated_bone_spike_debuff) {
			if (ComboPointsDeficit() > 1) Spell(serrated_bone_spike)
		}
		unless target.DebuffPresent(serrated_bone_spike_debuff) {
			if (ComboPointsDeficit() > 0) Spell(serrated_bone_spike)
		}
	}
}

AddFunction AssassinationSingleTargetActions {
	unless BuffPresent(slice_and_dice) {
		if (SpellKnown(cut_to_the_chase) or ComboPoints() >= 3) Spell(slice_and_dice)
	}
	AssassinationSliceAndDiceMaintenanceActions()
	AssassinationSingleTargetRuptureActions()
	AssassinationSingleTargetGarroteActions()
	AssassinationSingleTargetSerratedBoneSpikeActions()
	if (ComboPointsDeficit() <= 1 or AssassinationOnAnimachargedComboPoint()) {
		# Pool to 80 energy if single-target before casting Envenom.
		Spell(envenom extra_energy=45 text=pool)
	}
	if (Talent(hidden_blades_talent) and BuffStacks(hidden_blades) >= 20) Spell(fan_of_knives)
	if BuffPresent(blindside) Spell(ambush)
	Spell(mutilate)
}

AddFunction AssassinationMarkedForDeathActions {
	if (ComboPoints() <= 1) Spell(marked_for_death)
	if (ComboPointsDeficit() >= 2 and target.TimeToDie() < 10) Spell(marked_for_death text=snipe)
}

AddFunction AssassinationSingleTargetShortCdActions {
	AssassinationMarkedForDeathActions()

	unless (
		not BuffPresent(slice_and_dice) or
		AssassinationSliceAndDiceMaintenanceActions() or
		AssassinationSingleTargetRuptureActions() or
		AssassinationSingleTargetGarroteActions()
	) {
		if (ComboPointsDeficit() > 1) Spell(echoing_reprimand text=st)
		# Pool combo points to spend during Flagellation.
		if (ComboPointsDeficit() <= 1 and BaseDuration(flagellation) <= target.TimeToDie()) Spell(flagellation text=st)
		if (ComboPointsDeficit() > 0) Spell(sepsis text=st)

		unless (Spell(echoing_reprimand) or Spell(flagellation) or Spell(serrated_bone_spike) or Spell(sepsis)) {
			if Talent(subterfuge_talent) {
				# Use Vanish on cooldown with Subterfuge to apply Empowered Garrote.
				if target.DebuffPresent(garrote) {
					if (target.DebuffPersistentMultiplier(garrote) < 1.8) {
						Spell(vanish text=st)
					}
					unless (target.DebuffPersistentMultiplier(garrote) < 1.8) {
						if target.DebuffRefreshable(garrote) Spell(vanish text=st)
					}
				}
				unless target.DebuffPresent(garrote) {
					Spell(vanish text=st)
				}
			}
			if Talent(nightstalker_talent) or Talent(master_assassin_talent) {
				# Use Vanish at full combo points with Nightstalker or Master Assassin.
				if (ComboPointsDeficit() <= 1 and Energy() >= 25) Spell(vanish text=st)
			}
			AssassinationExsanguinateActions()
		}
	}
}

AddFunction AssassinationSingleTargetCdActions {
	unless (
		not BuffPresent(slice_and_dice) or
		AssassinationSliceAndDiceMaintenanceActions() or
		AssassinationSingleTargetRuptureActions() or
		AssassinationSingleTargetGarroteActions()
	) {
		if (EnergyDeficit() > 40 and target.TimeToDie() >= BaseDuration(vendetta)) Spell(vendetta text=st)
	}
}

AddFunction AssassinationCrimsonTempestActions {
	if (ComboPoints() >= 4 or AssassinationOnAnimachargedComboPoint()) {
		if target.DebuffPresent(crimson_tempest) {
			if (PersistentMultiplier(crimson_tempest) > target.DebuffPersistentMultiplier(crimson_tempest)) {
				Spell(crimson_tempest text=plus)
			}
			unless (PersistentMultiplier(crimson_tempest) > target.DebuffPersistentMultiplier(crimson_tempest)) {
				# Only refresh Crimson Tempest in the final 2 seconds so combo points can
				# be spent instead on maintaining Slice and Dice and Rupture.
				if (target.DebuffRemaining(crimson_tempest) < 2) Spell(crimson_tempest)
			}
		}
		unless target.DebuffPresent(crimson_tempest) {
			Spell(crimson_tempest text=new)
		}
	}
}

AddFunction AssassinationMultiTargetGarroteActions {
	if (ComboPointsDeficit() > 0) {
		if (DebuffCountOnAny(garrote) < AssassinationUpToThreeTargets()) {
			unless target.DebuffPresent(garrote) Spell(garrote text=new)
			Spell(garrote text=other)
		}
		unless (DebuffCountOnAny(garrote) < AssassinationUpToThreeTargets()) {
			if target.DebuffPresent(garrote) {
				if (PersistentMultiplier(garrote) > target.DebuffPersistentMultiplier(garrote)) {
					Spell(garrote text=plus)
				}
				unless (PersistentMultiplier(garrote) > target.DebuffPersistentMultiplier(garrote)) {
					if target.DebuffRefreshable(garrote) Spell(garrote)
				}
			}
		}
	}
}

AddFunction AssassinationMultiTargetRuptureActions {
	if (ComboPoints() >= 3 or AssassinationOnAnimachargedComboPoint()) {
		if (DebuffCountOnAny(rupture) < AssassinationUpToFourTargets()) {
			unless target.DebuffPresent(rupture) Spell(rupture text=new)
			Spell(rupture text=other)
		}
		unless (DebuffCountOnAny(rupture) < AssassinationUpToFourTargets()) {
			if target.DebuffPresent(rupture) {
				if (PersistentMultiplier(rupture) > target.DebuffPersistentMultiplier(rupture)) {
					Spell(rupture text=plus)
				}
				unless (PersistentMultiplier(rupture) > target.DebuffPersistentMultiplier(rupture)) {
					if target.DebuffRefreshable(rupture) Spell(rupture)
				}
			}
		}
	}
}

AddFunction AssassinationMultiTargetSerratedBoneSpikeActions {
	if IsCovenant(necrolord) {
		if (
			(DebuffCountOnAny(serrated_bone_spike_debuff) < ComboPointsDeficit()) or
			(DebuffCountOnAny(serrated_bone_spike_debuff) - 1 >= MaxComboPoints() and ComboPoints() <= 1)
		) {
			if (DebuffCountOnAny(serrated_bone_spike_debuff) < Enemies(tagged=1)) {
				unless target.DebuffPresent(serrated_bone_spike_debuff) Spell(serrated_bone_spike text=new)
				Spell(serrated_bone_spike text=other)
			}
			if (SpellCharges(serrated_bone_spike count=0) < SpellMaxCharges(serrated_bone_spike) - 0.1) {
				Spell(serrated_bone_spike text=cap)
			}
		}
	}
}

AddFunction AssassinationMultiTargetActions {
	if (Talent(subterfuge_talent) and BuffPresent(stealth_subterfuge)) {
		# If Subterfuge is up, apply Empowered Garrote.
		AssassinationMultiTargetGarroteActions()
	}
	unless BuffPresent(slice_and_dice) {
		if (SpellKnown(cut_to_the_chase) or ComboPoints() >= 3) Spell(slice_and_dice)
	}
	AssassinationCrimsonTempestActions()
	AssassinationMultiTargetRuptureActions()
	AssassinationSliceAndDiceMaintenanceActions()
	AssassinationMultiTargetSerratedBoneSpikeActions()
	AssassinationMultiTargetGarroteActions()
	if (ComboPointsDeficit() <= 1 or AssassinationOnAnimachargedComboPoint()) Spell(envenom)
	if (Enemies(tagged=1) >= 4) {
		Spell(fan_of_knives)
	}
	unless (Enemies(tagged=1) >= 4) {
		if (BuffPresent(deadly_poison) and DebuffCountOnAny(deadly_poison_debuff) < Enemies(tagged=1) and not target.DebuffPresent(deadly_poison_debuff)) {
			if BuffPresent(blindside) Spell(ambush text=other)
			Spell(mutilate text=other)
		}
		unless (BuffPresent(deadly_poison) and DebuffCountOnAny(deadly_poison_debuff) < Enemies(tagged=1) and not target.DebuffPresent(deadly_poison_debuff)) {
			if BuffPresent(blindside) Spell(ambush)
			Spell(mutilate)
		}
	}
}

AddFunction AssassinationMultiTargetShortCdActions {
	AssassinationMarkedForDeathActions()

	unless (
		not BuffPresent(slice_and_dice) or
		AssassinationCrimsonTempestActions() or
		AssassinationMultiTargetRuptureActions() or
		AssassinationSliceAndDiceMaintenanceActions() or
		AssassinationMultiTargetSerratedBoneSpikeActions()
	) {
		if (ComboPointsDeficit() > 1) Spell(echoing_reprimand text=aoe)
		# Pool combo points to spend during Flagellation.
		if (ComboPointsDeficit() <= 1 and BaseDuration(flagellation) <= target.TimeToDie()) Spell(flagellation text=aoe)
		if (ComboPointsDeficit() > 0) Spell(sepsis text=aoe)

		unless (Spell(echoing_reprimand) or Spell(flagellation) or Spell(serrated_bone_spike) or Spell(sepsis)) {
			if Talent(subterfuge_talent) {
				# Use Vanish with Vendetta to have enough Energy to apply multiple Empowered Garrotes.
				if (not SpellCooldown(vendetta) > 0 or BuffPresent(vendetta_buff)) Spell(vanish text=aoe)
			}
			if (Talent(nightstalker_talent) or Talent(master_assassin_talent)) {
				# Use Vanish at full combo points with Nightstalker or Master Assassin.
				if (ComboPointsDeficit() <= 1 and Energy() >= 25) Spell(vanish text=aoe)
			}
			AssassinationExsanguinateActions()
		}
	}
}

AddFunction AssassinationMultiTargetCdActions {
	unless (
		not BuffPresent(slice_and_dice) or
		AssassinationCrimsonTempestActions() or
		AssassinationMultiTargetRuptureActions() or
		AssassinationSliceAndDiceMaintenanceActions()
	) {
		if Talent(subterfuge_talent) {
			# Delay Vendetta for up to 20 seconds to line up with Vanish to have
			# enough Energy to apply multiple Empowered Garrotes.

			if (SpellCooldown(vanish) < 20) {
				unless (SpellCooldown(vanish) > 0) Spell(vendetta text=aoe)
			}
			unless (SpellCooldown(vanish) < 20) {
				if (BuffPresent(stealth_subterfuge) or BuffPresent(subterfuge)) Spell(vendetta text=aoe)
				if (EnergyDeficit() > 40 and target.TimeToDie() >= BaseDuration(vendetta)) Spell(vendetta text=aoe)
			}
		}
		unless Talent(subterfuge_talent) {
			if (EnergyDeficit() > 40 and target.TimeToDie() >= BaseDuration(vendetta)) Spell(vendetta text=aoe)
		}
	}
}

AddFunction AssassinationShivActions {
	if (Enemies(tagged=1) > 1) {
		unless (
			not BuffPresent(slice_and_dice) or
			AssassinationCrimsonTempestActions() or
			AssassinationMultiTargetRuptureActions() or
			AssassinationSliceAndDiceMaintenanceActions() or
			(Spell(echoing_reprimand) or Spell(flagellation) or Spell(serrated_bone_spike) or Spell(sepsis))
		) {
			Spell(shiv text=aoe)
		}
	}
	unless (Enemies(tagged=1) > 1) {
		unless (ComboPointsDeficit() == 0 or AssassinationSingleTargetShortCdActions())
		{
			if (target.DebuffRemaining(rupture) > 16 and target.DebuffRemaining(slice_and_dice) > 18) Spell(shiv text=st)
		}
	}
}

AddFunction AssassinationPrecombatShortCdActions {
	Spell(stealth)
	if (ComboPoints() <= 1) Spell(marked_for_death text=open)
	if SpellKnown(cut_to_the_chase) {
		if (BuffRemaining(slice_and_dice) < 12) Spell(slice_and_dice text=open)
	}
	unless SpellKnown(cut_to_the_chase) {
		# Try to have at least a 3-CP Slice and Dice already active.
		if (BuffRemaining(slice_and_dice) < 24) Spell(slice_and_dice text=open)
	}
}

AddFunction AssassinationPrecombatMainActions {
	if (Talent(nightstalker_talent) or Talent(subterfuge_talent)) {
		AssassinationSingleTargetGarroteActions()
	}
	if Talent(master_assassin_talent) {
		if (ComboPointsDeficit() <= 1 and BuffPresent(slice_and_dice)) {
			AssassinationSingleTargetRuptureActions()
		}
		Spell(serrated_bone_spike text=open)
		Spell(mutilate text=open)
	}
}

AddFunction AssassinationPrecombatAoEActions {
	if (Talent(nightstalker_talent) or Talent(subterfuge_talent)) {
		AssassinationMultiTargetGarroteActions()
	}
	if Talent(master_assassin_talent) {
		if (ComboPointsDeficit() <= 1 and BuffPresent(slice_and_dice)) {
			AssassinationSingleTargetRuptureActions()
		}
		Spell(serrated_bone_spike text=open)
		Spell(fan_of_knives text=open)
	}
}

AddFunction AssassinationPrecombatCdActions {
	PrecombatCdActions()
}

AddFunction AssassinationCdActions {
	if (EnergyDeficit() > 40 and target.TimeToDie() >= BaseDuration(vendetta)) Spell(vendetta)
}

AddFunction AssassinationInterruptActions {
	if (not focus.IsFriend() and focus.Casting()) {
		if focus.InRange(kick) and focus.IsInterruptible() Spell(kick text=focus)
		unless focus.Classification(worldboss) {
			if focus.InRange(cheap_shot) Spell(cheap_shot text=focus)
			if focus.InRange(kidney_shot) Spell(kidney_shot text=focus)
			if focus.InRange(blind) Spell(blind text=focus)
		}
	}
	if (not target.IsFriend() and target.Casting()) {
		if target.InRange(kick) and target.IsInterruptible() Spell(kick)
		unless target.Classification(worldboss) {
			if target.InRange(cheap_shot) Spell(cheap_shot)
			if target.InRange(kidney_shot) Spell(kidney_shot)
			if target.InRange(blind) Spell(blind)
		}
	}
	InterruptActions()
}

AddFunction AssassinationDispelActions {
	if target.HasDebuffType(enrage) Spell(shiv)
	OffensiveDispelActions()
	if player.HasDebuffType(poison disease curse magic) Spell(cloak_of_shadows)
	DefensiveDispelActions()
}

AddFunction AssassinationHealActions {
	ItemHealActions()
	if (HealthPercent() < 70) Spell(crimson_vial)
}

AddFunction AssassinationDefensiveActions {
	unless BuffPresent(feint) Spell(feint)
	Spell(fleshcraft)
	if target.IsTargetingPlayer() Spell(evasion)
}

### User Interface ###

AddIcon help=interrupt size=small {
	AssassinationInterruptActions()
	AssassinationDispelActions()
	AssassinationHealActions()
	AssassinationDefensiveActions()
}

AddIcon help=shortcd {
	unless AssassinationInCombat() {
		AssassinationPrecombatShortCdActions()
	}
	if AssassinationInCombat() {
		if (Enemies(tagged=1) > 1) {
			AssassinationMultiTargetShortCdActions()
		}
		unless (Enemies(tagged=1) > 1) {
			AssassinationSingleTargetShortCdActions()
		}
	}
}

AddIcon enemies=1 help=main {
	unless AssassinationInCombat() AssassinationPrecombatMainActions()
	AssassinationSingleTargetActions()
}

AddIcon help=aoe {
	unless AssassinationInCombat() AssassinationPrecombatAoEActions()
	AssassinationMultiTargetActions()
}

AddIcon help=cd {
	unless AssassinationInCombat() {
		AssassinationPrecombatCdActions()
	}
	if AssassinationInCombat() {
		if (Enemies(tagged=1) > 1) {
			AssassinationMultiTargetCdActions()
		}
		unless (Enemies(tagged=1) > 1) {
			AssassinationSingleTargetCdActions()
		}
	}
}

AddIcon help=trinkets size=small {
	if (BuffRemaining(lethal_poison) < 900) Spell(deadly_poison)
	unless AssassinationInRange() {
		Spell(shadowstep)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	AssassinationShivActions()
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("ROGUE", "assassination", name, desc, code, "script")
end