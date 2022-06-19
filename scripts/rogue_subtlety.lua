local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_rogue_subtlety"
	local desc = string.format("[9.0.2] %s: Rogue - Subtlety", Private.name)
	local code = [[
# Adapted from Wowhead's "Subtlety Rogue Rotation Guide - Shadowlands 9.0.2"
#	by Mystler
# https://www.wowhead.com/subtlety-rogue-rotation-guide

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(alacrity_talent 19249)
Define(deeper_strategem_talent 19240)
Define(gloomblade_talent 19235)
Define(marked_for_death_talent 19241)
Define(master_of_shadows_talent 22132)
Define(nightstalker_talent 22331)
Define(premeditation_talent 19234)
Define(secret_technique_talent 23183)
Define(shadow_focus_talent 22333)
Define(shuriken_tornado_talent 21188)
Define(subterfuge_talent 22332)
Define(vigor_talent 19239)
Define(weaponmaster_talent 19233)

# Class Abilities
Define(backstab 53)
	SpellInfo(backstab energy=35 combopoints=-1)
	SpellRequire(backstab replaced_by set=gloomblade enabled=(Talent(gloomblade_talent)))
	SpellRequire(backstab combopoints add=-1 enabled=(BuffPresent(shadow_blades)))
Define(black_powder 319175)
	SpellInfo(black_powder energy=35 combopoints=1 set_combopoints=0)
Define(blind 2094)
	SpellInfo(blind cd=120)
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
Define(deathly_shadows 341202)
	SpellInfo(deathly_shadows duration=12)
Define(evasion 5277)
	SpellInfo(evasion cd=120 duration=10 gcd=0 offgcd=1)
Define(eviscerate 196819)
	SpellInfo(eviscerate energy=35 combopoints=1 set_combopoints=0)
Define(feint 1966)
	SpellInfo(feint energy=35 cd=15 duration=5)
Define(find_weakness 316220)
	SpellInfo(find_weakness duration=18)
Define(gloomblade 200758)
	SpellInfo(gloomblade energy=35 combopoints=-1)
	SpellRequire(gloomblade unusable set=1 enabled=(not Talent(gloomblade_talent)))
	SpellRequire(gloomblade combopoints add=-1 enabled=(BuffPresent(shadow_blades)))
Define(instant_poison 315584)
	SpellInfo(instant_poison duration=3600 gcd=0 offgcd=1)
	SpellAddBuff(instant_poison instant_poison add=1)
Define(kick 1766)
	SpellInfo(kick cd=15 gcd=0 offgcd=1 interrupt=1)
Define(kidney_shot 408)
	SpellInfo(kidney_shot energy=25 cd=20 combopoints=1 set_combopoints=0)
Define(marked_for_death 137619)
	SpellInfo(marked_for_death cd=60 duration=60 gcd=0 offgcd=1 combopoints=-5)
	SpellRequire(marked_for_death unusable set=1 enabled=(not Talent(marked_for_death_talent)))
	SpellAddTargetDebuff(marked_for_death marked_for_death add=1)
Define(master_assassins_mark 340094)
Define(numbing_poison 5761)
	SpellInfo(numbing_poison duration=3600 gcd=0 offgcd=1)
Define(premeditation 343173)
Define(rupture 1943)
	SpellInfo(rupture energy=25 combopoints=1 set_combopoints=0 duration=4 add_duration_combopoints=4 tick=2)
	SpellAddTargetDebuff(rupture rupture add=1)
Define(secret_technique 280719)
	SpellInfo(secret_technique energy=30 combopoints=1 cd=45 gcd=1)
	SpellRequire(secret_technique unusable set=1 enabled=(not Talent(secret_technique_talent)))
Define(shadow_blades 121471)
	SpellInfo(shadow_blades cd=180 duration=20 gcd=0 offgcd=1)
	SpellAddBuff(shadow_blades shadow_blades add=1)
Define(shadow_dance 185313)
	SpellInfo(shadow_dance cd=8 charge_cd=60 gcd=0 offgcd=1)
Define(shadow_dance_buff 185422)
	SpellInfo(shadow_dance_buff duration=8)
	SpellRequire(shadow_dance_buff duration add=1 enabled=(Talent(subterfuge_talent)))
	SpellAddBuff(shadow_dance shadow_dance_buff add=1)
Define(shadowstep 36554)
	SpellInfo(shadowstep cd=1 charge_cd=30 gcd=0 offgcd=1)
Define(shadowstrike 185438)
	SpellInfo(shadowstrike energy=40 combopoints=-2)
	SpellRequire(shadowstrike unusable set=1 enabled=(not Stealthed()))
	SpellRequire(shadowstrike combopoints add=-1 enabled=(BuffPresent(shadow_blades)))
	SpellRequire(shadowstrike combopoints add=-2 enabled=(BuffPresent(premeditation)))
	SpellAddTargetDebuff(shadowstrike find_weakness add=1)
Define(shiv 5938)
	SpellInfo(shiv energy=20 cd=25 combopoints=-1)
	SpellRequire(shiv combopoints add=-1 enabled=(BuffPresent(shadow_blades)))
Define(shuriken_storm 197835)
	SpellInfo(shuriken_storm energy=35)
Define(shuriken_tornado 277925)
	SpellInfo(shuriken_tornado energy=60 cd=60 duration=4 tick=1)
	SpellRequire(shuriken_tornado unusable set=1 enabled=(not Talent(shuriken_tornado_talent)))
	SpellAddBuff(shuriken_tornado shuriken_tornado add=1)
Define(shuriken_toss 185565)
	SpellInfo(shuriken_toss energy=40 combopoints=-1)
	SpellRequire(shuriken_toss energy add=-8 enabled=(Talent(shadow_focus_talent) and Stealthed()))
Define(slice_and_dice 315496)
	SpellInfo(slice_and_dice energy=25 combopoints=1 set_combopoints=0 duration=6 add_duration_combopoints=6 tick=2)
	SpellRequire(slice_and_dice unusable set=1 enabled=(BuffRemaining(slice_and_dice) > BaseDuration(slice_and_dice)))
	SpellAddBuff(slice_and_dice slice_and_dice add=1)
	SpellAddBuff(shadowstrike slice_and_dice add=1 enabled=(BuffPresent(premeditation)))
Define(stealth 1784)
	SpellInfo(stealth cd=2 gcd=0 offgcd=1)
	SpellRequire(stealth unusable set=1 enabled=(Stealthed() or InCombat()))
	SpellAddBuff(stealth stealth add=1)
Define(symbols_of_death 212283)
	SpellInfo(symbols_of_death cd=30 duration=10 gcd=0 offgcd=1 energy=-40)
	SpellAddBuff(symbols_of_death symbols_of_death add=1)
Define(vanish 1856)
	SpellInfo(vanish cd=120 gcd=0 offgcd=1)
	SpellRequire(vanish combopoints add=-5 enabled=(EquippedRuneforge(deathly_shadows_runeforge)))
	SpellAddBuff(vanish deathly_shadows add=1 enabled=(EquippedRuneforge(deathly_shadows_runeforge)))

# Covenant Abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(flagellation 323654)
	SpellInfo(flagellation energy=20 cd=90 duration=20 max_stacks=30)
	SpellRequire(flagellation unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(flagellation unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddTargetDebuff(flagellation flagellation add=1)
Define(serrated_bone_spike 328547)
	SpellInfo(serrated_bone_spike energy=15 cd=1 charge_cd=30 combopoints=-1)
	SpellRequire(serrated_bone_spike unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(serrated_bone_spike unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellRequire(serrated_bone_spike combopoints add=-1 enabled=(BuffPresent(shadow_blades)))
Define(serrated_bone_spike_debuff 324073)
	SpellInfo(serrated_bone_spike_debuff tick=3)
	SpellAddTargetDebuff(serrated_bone_spike serrated_bone_spike_debuff add=1)
Define(sepsis 328305)
	SpellInfo(sepsis energy=25 cd=90 duration=10 combopoints=-1 tick=1)
	SpellRequire(sepsis unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(sepsis unusable set=1 enabled=(not IsCovenant(night_fae)))
	SpellAddTargetDebuff(sepsis sepsis add=1)
	SpellRequire(sepsis combopoints add=-1 enabled=(BuffPresent(shadow_blades)))
Define(sepsis_stealth_buff 347037)
	SpellInfo(sepsis_stealth_buff duration=5)
Define(echoing_reprimand 323547)
	SpellInfo(echoing_reprimand energy=10 cd=45 combopoints=-2)
	SpellRequire(echoing_reprimand unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(echoing_reprimand unusable set=1 enabled=(not IsCovenant(kyrian)))
	SpellRequire(echoing_reprimand combopoints add=-1 enabled=(BuffPresent(shadow_blades)))
Define(echoing_reprimand_2 323558)
	SpellInfo(echoing_reprimand_2 duration=45)
Define(echoing_reprimand_3 323559)
	SpellInfo(echoing_reprimand_3 duration=45)
Define(echoing_reprimand_4 323560)
	SpellInfo(echoing_reprimand_4 duration=45)

# Runeforge Legendary Effects
Define(deathly_shadows_runeforge 7126)
Define(mark_of_the_master_assassin_runeforge 7111)
Define(tiny_toxic_blade_runeforge 7112)

### Functions ###

AddFunction SubtletyInRange {
	((Stealthed() and target.InRange(shadowstrike)) or (not Stealthed() and target.InRange(backstab)))
}

AddFunction SubtletyBuilderCondition {
	(ComboPointsDeficit() > 1)
}

AddFunction SubtletyFinisherCondition {
	(ComboPointsDeficit() <= 1)
}

AddFunction SubtletySymbolsOfDeathIsReady {
	Spell(symbols_of_death) or BuffPresent(symbols_of_death)
}

AddFunction SubtletyShadowDanceWindowCondition {
	(SubtletySymbolsOfDeathIsReady() and not BuffPresent(shadow_dance_buff) and Spell(shadow_dance))
}

AddFunction SubtletyEnergyPoolingBaseThreshold {
	(MaxEnergy() - 25 - Talent(vigor_talent) * 20 - Talent(master_of_shadows_talent) * 20 - Talent(shadow_focus_talent) * 25 - Talent(alacrity_talent) * 20)
}

AddFunction SubtletyEnergyPoolingThreshold {
	if (Enemies(tagged=1) > 3) (SubtletyEnergyPoolingBaseThreshold() - 25)
	SubtletyEnergyPoolingBaseThreshold()
}

AddFunction SubtletySliceAndDiceNeedsEarlyRefresh {
	(BuffRemaining(slice_and_dice) < BaseDuration(symbols_of_death))
}

AddFunction SubtletyRuptureNeedsEarlyRefresh {
	(target.DebuffRemaining(rupture) < BaseDuration(symbols_of_death))
}

AddFunction SubtletyPrecombatShortCdActions {
	Spell(stealth)
}

AddFunction SubtletyPrecombatMainActions {
	if (BuffRemaining(lethal_poison_buff) < 1200) Spell(instant_poison)
	Spell(marked_for_death)
	Spell(slice_and_dice)
	Spell(shadowstrike)
}

AddFunction SubtletyPrecombatCdActions {
	PrecombatCdActions()
	if EquippedRuneforge(mark_of_the_master_assassin_runeforge) Spell(shadow_blades)
}

AddFunction SubtletyDefensiveActions {
	ItemHealActions()
	if (HealthPercent() < 70) Spell(crimson_vial)
	if (target.IsTargetingPlayer() and IncomingPhysicalDamage(1.5) > 0) Spell(evasion)
}

AddFunction SubtletyShortCdActions {
	if (SpellMaxCharges(shadow_dance) > 1 and Charges(shadow_dance count=0) > SpellMaxCharges(shadow_dance) - 0.1) Spell(shadow_dance)
	if (EquippedRuneforge(deathly_shadows_runeforge) or EquippedRuneforge(mark_of_the_master_assassin_runeforge)) {
		if SubtletyShadowDanceWindowCondition() {
			if (EquippedRuneforge(deathly_shadows_runeforge) and ComboPoints() < 1) Spell(vanish)
			if (EquippedRuneforge(mark_of_the_master_assassin_runeforge) and not BuffPresent(master_assassins_mark)) Spell(vanish)
		}
	}
	if (ComboPoints() < 3 and not SubtletySliceAndDiceNeedsEarlyRefresh() and not SubtletyRuptureNeedsEarlyRefresh()) {
		if SubtletyShadowDanceWindowCondition() Spell(shadow_dance)
		Spell(symbols_of_death)
	}
	unless (EquippedRuneforge(deathly_shadows_runeforge) or EquippedRuneforge(mark_of_the_master_assassin_runeforge)) {
		if (SubtletyBuilderCondition() and target.DebuffRemaining(find_weakness) < 1) Spell(vanish)
	}
	if (SubtletyBuilderCondition() and not Spell(sepsis)) Spell(shadowmeld)
}

AddFunction SubtletyCdActions {
	# Use Flagellation (Venthyr) on cooldown to apply the debuff and start
	# the lashing. Use it again right before the debuff expires to convert
	# the stacks into the Haste buff.
	#Spell(flagellation)
	if (Charges(serrated_bone_spike count=0) > 2.9) Spell(serrated_bone_spike)
	if (not target.BuffPresent(serrated_bone_spike_debuff) and target.TimeToDie() > 21) Spell(serrated_bone_spike)
	if ((Spell(symbols_of_death) or SpellCooldown(symbols_of_death) > 10) and SubtletyBuilderCondition()) Spell(sepsis)
	if (ComboPoints() < 1 or target.TimeToDie() < 10) Spell(marked_for_death)
	if (SubtletySymbolsOfDeathIsReady() and SubtletyBuilderCondition()) Spell(shadow_blades)
	if EquippedRuneforge(tiny_toxic_blade_runeforge) {
		if (Talent(nightstalker_talent) and BuffPresent(shadow_dance_buff)) Spell(shiv)
		if (not Talent(nightstalker_talent) and not BuffPresent(shadow_dance_buff)) Spell(shiv)
	}
	if (Enemies(tagged=1) < 5) Spell(echoing_reprimand)
	if (BuffPresent(shadow_dance_buff) and BuffPresent(symbols_of_death)) Spell(shuriken_tornado)
}

AddFunction SubtletySliceAndDiceActions {
	if (Enemies(tagged=1) < 6) {
		# Refresh early to avoid needing to refresh within a Shadow Dance window.
		if (SubtletyShadowDanceWindowCondition() and SubtletySliceAndDiceNeedsEarlyRefresh()) {
			unless Talent(premeditation_talent) Spell(slice_and_dice)
		}
		if (not BuffPresent(shadow_dance_buff) and BuffRefreshable(slice_and_dice)) Spell(slice_and_dice)
	}
}

AddFunction SubtletyPriorityRuptureActions {
	if (Enemies(tagged=1) < 5 and not BuffPresent(master_assassins_mark)) {
		# Refresh early to avoid needing to refresh within a Shadow Dance window.
		if (SubtletyShadowDanceWindowCondition() and SubtletyRuptureNeedsEarlyRefresh()) {
			Spell(rupture)
		}
		if target.DebuffRefreshable(rupture) Spell(rupture)
	}
}

AddFunction SubtletyPriorityFinisherActions {
	SubtletySliceAndDiceActions()
	SubtletyPriorityRuptureActions()
	Spell(secret_technique)
	Spell(eviscerate)
}

AddFunction SubtletyFinisherActions {
	SubtletySliceAndDiceActions()
	SubtletyPriorityRuptureActions()
	Spell(secret_technique)
	if (Enemies(tagged=1) > 2) Spell(black_powder)
	Spell(eviscerate)
}

AddFunction SubtletyFillerBuilderActions {
	Spell(gloomblade)
	Spell(backstab)
	if (not target.InRange(backstab) and EnergyDeficit() < 20) Spell(shuriken_toss)
}

AddFunction SubtletyPriorityBuilderActions {
	if (BuffPresent(premeditation) or Talent(weaponmaster_talent)) {
		if (Enemies(tagged=1) < 5 and DebuffCountOnAny(find_weakness) < Enemies(tagged=1)) Spell(shadowstrike text=cycle)
		if (Enemies(tagged=1) >= 5 and DebuffCountOnAny(find_weakness) < 5) Spell(shadowstrike text=cycle)
	}
	Spell(shadowstrike)
	if (Enemies(tagged=1) > 1) Spell(shuriken_storm)
	SubtletyFillerBuilderActions()
}

AddFunction SubtletyBuilderActions {
	if BuffPresent(premeditation) {
		if (Enemies(tagged=1) < 5 and DebuffCountOnAny(find_weakness) < Enemies(tagged=1)) Spell(shadowstrike text=cycle)
		if (Enemies(tagged=1) >= 5 and DebuffCountOnAny(find_weakness) < 5) Spell(shadowstrike text=cycle)
	}
	if (Enemies(tagged=1) > 2) Spell(shuriken_storm)
	Spell(shadowstrike)
	if (Enemies(tagged=1) > 1) Spell(shuriken_storm)
	SubtletyFillerBuilderActions()
}

AddFunction SubtletyMainActions {
	unless BuffPresent(slice_and_dice) Spell(slice_and_dice)
	if target.DebuffExpires(rupture) Spell(rupture)
	if (Stealthed() or Energy() > SubtletyEnergyPoolingThreshold()) {
		if SubtletyFinisherCondition() SubtletyPriorityFinisherActions()
		if SubtletyBuilderCondition() SubtletyPriorityBuilderActions()
	}
}

AddFunction SubtletyAoEActions {
	unless BuffPresent(slice_and_dice) Spell(slice_and_dice)
	if target.DebuffExpires(rupture) Spell(rupture)
	if (Stealthed() or Energy() > SubtletyEnergyPoolingThreshold()) {
		if SubtletyFinisherCondition() SubtletyFinisherActions()
		if SubtletyBuilderCondition() SubtletyBuilderActions()
	}
}

AddFunction SubtletyInterruptActions {
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

AddFunction SubtletyDispelActions {
	if (target.HasDebuffType(enrage) and BuffPresent(numbing_poison)) Spell(shiv)
	OffensiveDispelActions()
	if player.HasDebuffType(poison disease curse magic) Spell(cloak_of_shadows)
	DefensiveDispelActions()
}

### User Interface ###

AddIcon help=interrupt size=small {
	SubtletyInterruptActions()
	SubtletyDispelActions()
	SubtletyDefensiveActions()
}

AddIcon help=shortcd {
	unless InCombat() SubtletyPrecombatShortCdActions()
	if InCombat() SubtletyShortCdActions()
}

AddIcon help=main {
	unless InCombat() SubtletyPrecombatMainActions()
	SubtletyMainActions()
}

AddIcon help=aoe {
	unless InCombat() SubtletyPrecombatMainActions()
	SubtletyAoEActions()
}

AddIcon help=cd {
	unless InCombat() SubtletyPrecombatCdActions()
	if InCombat() SubtletyCdActions()
}

AddIcon help=trinkets size=small {
	unless SubtletyInRange() {
		Spell(shadowstep)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	if SubtletySymbolsOfDeathIsReady() {
		Item(Trinket0Slot usable=1 text=13)
		Item(Trinket1Slot usable=1 text=14)
	}
}
]]
	Private.scripts:registerScript("ROGUE", "subtlety", name, desc, code, "script")
end