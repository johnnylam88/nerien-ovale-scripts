local _, Private = ...

if Private.initialized then
	local name = "nerien_ovale_demonhunter_vengeance"
	local desc = string.format("[9.2] %s: Demon Hunter - Vengeance", Private.name)
	local code = [[
# Adapted from Wowhead's "Vengeance Demon Hunter Rotation Guide - Shadowlands 9.2.5"
#	by Itamae.
# https://www.wowhead.com/vengeance-demon-hunter-rotation-guide

Include(nerien_ovale_library)

### Definitions ###

# Talents
Define(abyssal_strike_talent 22502)
Define(agonizing_flames_talent 22503)
Define(bulk_extraction_talent 21902)
Define(burning_alive_talent 22507)
Define(concentrated_sigils_talent 22546)
Define(demonic_talent 22513)
Define(fallout_talent 22766)
Define(feast_of_souls_talent 22505)
Define(felblade_talent 22504)
Define(fracture_talent 22770)
Define(quickened_sigils_talent 22510)
Define(ruinous_bulwark_talent 23464)
Define(sigil_of_chains_talent 22511)
Define(spirit_bomb_talent 22540)
Define(soul_barrier_talent 22768)
Define(void_reaver_talent 22512)

# Class Abilities
Define(bulk_extraction 320341)
	SpellInfo(bulk_extraction cd=90)
	SpellRequire(bulk_extraction unusable set=1 enabled=(not Talent(bulk_extraction_talent)))
Define(consume_magic 278326)
	SpellInfo(consume_magic cd=10)
Define(demon_spikes 203720)
	SpellInfo(demon_spikes charge_cd=20 cd=1.5 cd_haste=1)
Define(demon_spikes_buff 203819)
	SpellInfo(demon_spikes_buff duration=6)
	SpellAddBuff(demon_spikes demon_spikes_buff add=1)
Define(disrupt 183752)
	SpellInfo(disrupt cd=15 interrupt=1)
Define(feast_of_souls_buff 207693)
	SpellInfo(feast_of_souls_buff duration=6)
	SpellAddBuff(soul_cleave feast_of_souls_buff add=1 enabled=(Talent(feast_of_souls_talent)))
Define(felblade 232893)
	SpellInfo(felblade cd=15 cd_haste=1 fury=-40)
	SpellRequire(felblade unusable set=1 enabled=(not Talent(felblade_talent)))
Define(fel_devastation 212084)
	SpellInfo(fel_devastation cd=60 channel=2 fury=50)
Define(fiery_brand 204021)
	SpellInfo(fiery_brand cd=60 duration=8)
	SpellRequire(fiery_brand duration add=2 enabled=(Level() >= 54))
	SpellAddTargetDebuff(fiery_brand fiery_brand add=1)
Define(fracture 263642)
	SpellInfo(fracture charge_cd=4.5 cd_haste=1 fury=-25)
	SpellRequire(fracture unusable set=1 enabled=(not Talent(fracture_talent)))
	SpellRequire(fracture fury add=-20 enabled=(Level() >= 48 and BuffPresent(metamorphosis)))
Define(frailty_debuff 224509)
	SpellInfo(frailty_debuff duration=20)
	SpellAddTargetDebuff(spirit_bomb frailty_debuff add=1)
Define(immolation_aura 258920)
	SpellInfo(immolation_aura cd=30 cd_haste=1 duration=6)
	SpellRequire(immolation_aura cd add=-15 enabled=(Level() >= 27))
	SpellRequire(immolation_aura duration add=3 enabled=(agonizing_flames_talent))
	SpellAddBuff(immolation_aura immolation_aura add=1)
Define(imprison 217832)
	SpellInfo(imprison cd=45)
Define(infernal_strike 189110)
	SpellInfo(infernal_strike charge_cd=20 cd=0.8)
	SpellRequire(infernal_strike charge_cd add=-8 enabled=(Talent(abyssal_strike_talent)))
Define(metamorphosis 187827)
	SpellInfo(metamorphosis cd=300 duration=15)
	SpellRequire(metamorphosis cd add=-60 enabled=(Level() >= 20))
	SpellRequire(metamorphosis cd add=-60 enabled=(Level() >= 48))
	SpellAddBuff(metamorphosis metamorphosis add=1)
Define(ruinous_bulwark_buff 326863)
	SpellInfo(ruinous_bulwark_buff duration=10)
	SpellAddBuff(fel_devastation ruinous_bulwark_buff add=1 enabled=(Talent(ruinous_bulwark_talent)))
Define(shear 203783)
	SpellInfo(shear fury=-10)
	SpellRequire(shear fury add=-20 enabled=(Level() >= 48 and BuffPresent(metamorphosis)))
	SpellRequire(shear replaced_by set=fracture enabled=(Talent(fracture_talent)))
Define(sigil_of_chains 202138)
	SpellInfo(sigil_of_chains cd=90)
	SpellRequire(sigil_of_misery cd add=-18 enabled=(Talent(quickened_sigils_talent)))
Define(sigil_of_flame 204596)
	SpellInfo(sigil_of_flame cd=30)
	SpellRequire(sigil_of_flame cd add=-6 enabled=(Talent(quickened_sigils_talent)))
Define(sigil_of_misery 207684)
	SpellInfo(sigil_of_misery cd=90)
	SpellRequire(sigil_of_misery cd add=-18 enabled=(Talent(quickened_sigils_talent)))
Define(sigil_of_silence 202137)
	SpellInfo(sigil_of_silence cd=60)
	SpellRequire(sigil_of_silence cd add=-12 enabled=(Talent(quickened_sigils_talent)))
Define(soul_barrier 263648)
	SpellInfo(soul_barrier cd=30 duration=12)
	SpellRequire(soul_barrier unusable set=1 enabled=(not Talent(soul_barrier_talent)))
	SpellAddBuff(soul_barrier soul_barrier add=1)
Define(soul_cleave 228477)
	SpellInfo(soul_cleave fury=30)
Define(spirit_bomb 247454)
	SpellInfo(spirit_bomb fury=30)
	SpellRequire(spirit_bomb unusable set=1 enabled=(not Talent(spirit_bomb_talent)))
Define(throw_glaive 204157)
	SpellInfo(throw_glaive cd=9 cd_haste=1)
	SpellRequire(throw_glaive cd add=-6 enabled=(Level() >= 32))
Define(torment 185245)
	SpellInfo(torment cd=8)
Define(uncontained_fel_debuff 209261)
	SpellInfo(uncontained_fel_debuff duration=480)
Define(void_reaver_debuff 268178)
	SpellInfo(void_reaver_debuff duration=12)
	SpellAddTargetDebuff(soul_cleave void_reaver_debuff add=1)

# Covenant Abilities
AddCheckBox(opt_suggest_covenant_ability L(opt_suggest_covenant_ability) default)
Define(elysian_decree 306830)
	SpellInfo(elysian_decree cd=60)
	SpellRequire(elysian_decree unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(elysian_decree unusable set=1 enabled=(not IsCovenant(kyrian)))
	SpellRequire(elysian_decree cd add=-12 enabled=(Talent(quickened_sigils_talent)))
Define(sinful_brand 317009)
	SpellInfo(sinful_brand cd=60 duration=8)
	SpellRequire(sinful_brand unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(sinful_brand unusable set=1 enabled=(not IsCovenant(venthyr)))
	SpellAddTargetDebuff(sinful_brand sinful_brand add=1)
Define(fodder_to_the_flame 329554)
	SpellInfo(fodder_to_the_flame cd=120 duration=25)
	SpellRequire(fodder_to_the_flame unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(fodder_to_the_flame unusable set=1 enabled=(not IsCovenant(necrolord)))
	SpellAddTargetDebuff(fodder_to_the_flame fodder_to_the_flame add=1)
Define(the_hunt 323639)
	SpellInfo(the_hunt cd=90)
	SpellRequire(the_hunt unusable set=1 enabled=(CheckBoxOff(opt_suggest_covenant_ability)))
	SpellRequire(the_hunt unusable set=1 enabled=(not IsCovenant(night_fae)))

# Runeforge Legendary Effects
Define(blind_faith_runeforge 7699)
Define(blind_faith_buff 355894)
	SpellInfo(blind_faith_buff duration=20)
	SpellAddBuff(elysian_decree blind_faith_buff add=1 enabled=(IsCovenant(kyrian) and (EquippedRuneforge(blind_faith_runeforge) or EquippedRuneforge(unity_runeforge))))
Define(fiery_soul_runeforge 7048)
Define(razelikhs_defilement_runeforge 7046)
Define(unity_runeforge 8120)

### Functions ###

AddFunction VengeanceInRange {
	target.InRange(soul_cleave)
}

AddFunction VengeanceIsTanking {
	# Return true if AoE-tanking or if the target is targeting you.
	Enemies(tagged=1) > 1 or target.IsTargetingPlayer()
}

AddFunction VengeanceFuryDeficit {
	# Account for Fury gains from Immolation Aura and Metamorphosis.
	MaxFury() - Fury() - GCDRemaining() * (20 * BuffPresent(immolation_aura) / 6 + 7 * BuffPresent(metamorphosis))
}

AddFunction VengeanceSigilDuration {
	2 - Talent(quickened_sigil_talent)
}

AddFunction VengeanceSoulFragmentHealing {
	if (IncomingDamage(5) * 6 > MaxHealth()) (IncomingDamage(5) * 6 / 100)
	MaxHealth() / 100
}

AddFunction VengeanceSoulCleaveHealing {
	if (SoulFragments() >= 2) (2 * VengeanceSoulFragmentHealing())
	SoulFragments() * VengeanceSoulFragmentHealing()
}

AddFunction VengeanceBulkExtractionHealing {
	if (Enemies(tagged=1) > 5) (5 * VengeanceSoulFragmentHealing())
	Enemies(tagged=1) * VengeanceSoulFragmentHealing()
}

AddFunction VengeanceImmolationAuraSoulFragments {
	if Talent(fallout_talent) {
		if (SoulFragments() + 0.7 * Enemies(tagged=1) > 5) 5
		SoulFragments() + 0.7 * Enemies(tagged=1)
	}
	0
}

AddFunction VengeanceShearSoulFragments {
	SoulFragments() + 2 + BuffPresent(metamorphosis)
}

AddFunction VengeanceEquippedBlindFaithRuneforge {
	EquippedRuneforge(blind_faith_runeforge) or EquippedRuneforge(unity_runeforge)
}

AddFunction VengeancePrecombatActiveMitigationActions {
	PrecombatShortCdActions()
	# Use Demon Spikes heading into a pull if not already up.
	unless BuffPresent(demon_spikes_buff) Spell(demon_spikes)
}

AddFunction VengeanceActiveMitigationActions {
	if (not BuffPresent(metamorphosis) and VengeanceIsTanking()) {
		# Don't cap on charges of Demon Spikes.
		if (Charges(demon_spikes count=0) > 1.9) Spell(demon_spikes text=cap)
	}
}

AddFunction VengeancePrecombatMainActions {}

AddFunction VengeanceMainActions {
	unless (
		(VengeanceEquippedBlindFaithRuneforge() and
			(SpellCooldown(elysian_decree) < 5 or TimeSincePreviousSpell(elysian_decree) < VengeanceSigilDuration()))
	) {
		if (SoulFragments() >= 4) Spell(spirit_bomb)
	}
	if target.InRange(soul_cleave) {
		if (
			not Talent(spirit_bomb_talent) and
			HealthPercent() <= 70 and
			Fury() >= PowerCost(soul_cleave) and
			SoulFragments() >= 2 and
			VengeanceSoulCleaveHealing() <= HealthMissing()
		) {
			Spell(soul_cleave)
		}
		if (VengeanceFuryDeficit() < 20) Spell(soul_cleave)
	}
	unless target.InRange(soul_cleave) Spell(throw_glaive text=range)
	if (VengeanceFuryDeficit() > 40) Spell(felblade)
	if (Talent(fracture_talent) and VengeanceFuryDeficit() > 25 and VengeanceShearSoulFragments() <= 5) Spell(fracture)
	if (VengeanceFuryDeficit() > 10 and VengeanceImmolationAuraSoulFragments() <= 5) {
		unless BuffPresent(immolation_aura) Spell(immolation_aura)
	}
	if (not Talent(fracture_talent) and VengeanceFuryDeficit() > 10 and VengeanceShearSoulFragments() <= 5) Spell(shear)
	Spell(throw_glaive)
}

AddFunction VengeancePrecombatShortCdActions {
	Spell(elysian_decree)
	unless EquippedRuneforge(razelikhs_defilement_runeforge) Spell(sigil_of_flame)
}

AddFunction VengeanceShortCdActions {
	if VengeanceEquippedBlindFaithRuneforge() {
		# Be close to capping on Soul Fragments before casting Elysian Decree to instantly gain
		# stacks of Blind Faith.
		if (SoulFragments() >= 4) Spell(elysian_decree)
	}
	unless VengeanceEquippedBlindFaithRuneforge() {
		Spell(elysian_decree)
	}
	if EquippedRuneforge(fiery_soul_runeforge) and Talent(burning_alive_talent) {
		if (VengeanceIsTanking() and not target.DebuffPresent(fiery_brand) and target.TimeToDie() > 12) Spell(fiery_brand)
	}
	unless (SoulFragments() >= 4 and Spell(spirit_bomb)) {
		Spell(fel_devastation)

		unless (
			(VengeanceFuryDeficit() < 20 and Spell(soul_cleave)) or
			(VengeanceFuryDeficit() > 25 and VengeanceShearSoulFragments() <= 5 and Spell(fracture)) or
			(VengeanceFuryDeficit() > 10 and VengeanceImmolationAuraSoulFragments() <= 5 and not BuffPresent(immolation_aura) and Spell(immolation_aura))
		) {
			unless EquippedRuneforge(razelikhs_defilement_runeforge) Spell(sigil_of_flame)
		}
	}
}

AddFunction VengeancePrecombatCdActions {
	PrecombatCdActions()
}

AddFunction VengeanceOffensiveCdActions {
	if (Charges(infernal_strike count=0) >= 1.8) Spell(infernal_strike)
	Spell(sinful_brand)
	Spell(fodder_to_the_flame)
	Spell(the_hunt)
	Spell(bulk_extraction)
}

AddFunction VengeanceDefensiveCdActions {
	unless (EquippedRuneforge(fiery_soul_runeforge) and Talent(burning_alive_talent)) {
		if (not BuffPresent(metamorphosis) and VengeanceIsTanking() and not target.DebuffPresent(fiery_brand)) Spell(fiery_brand)
	}
	if (SoulFragments() >= 4) Spell(soul_barrier)
	if (SpellCooldown(fiery_brand) > 0 and (Talent(soul_barrier_talent) and SpellCooldown(soul_barrier) > 0)) Spell(metamorphosis)
}

AddFunction VengeanceCdActions {
	VengeanceDefensiveCdActions()
}

AddFunction VengeanceInterruptActions {
	if (not focus.IsFriend() and focus.Casting()) {
		if (focus.InRange(disrupt) and focus.IsInterruptible()) Spell(disrupt text=focus)
		unless focus.Classification(worldboss) {
			if (
				focus.Distance() < 30 and
				focus.RemainingCastTime() >= VengeanceSigilDuration() + GCDRemaining()
			) {
				Spell(sigil_of_silence text=focus)
				Spell(sigil_of_misery text=focus)
				Spell(sigil_of_chains text=focus)
			}
			if focus.CreatureType(Beast Demon Humanoid) Spell(imprison text=focus)
		}
	}
	if (not target.IsFriend() and target.Casting()) {
		if (target.InRange(disrupt) and target.IsInterruptible()) Spell(disrupt)
		unless target.Classification(worldboss) {
			if (
				target.Distance() < 30 and
				target.RemainingCastTime() >= VengeanceSigilDuration() + GCDRemaining()
			) {
				Spell(sigil_of_silence)
				Spell(sigil_of_misery)
				Spell(sigil_of_chains)
			}
			if target.CreatureType(Beast Demon Humanoid) Spell(imprison)
		}
	}
	InterruptActions()
}

AddFunction VengeanceDispelActions {
	if target.HasDebuffType(magic) Spell(consume_magic)
	OffensiveDispelActions()
	DefensiveDispelActions()
}

AddFunction VengeanceHealActions {
	ItemHealActions()
	if (VengeanceBulkExtractionHealing() > HealthMissing()) Spell(bulk_extraction)
}

### User Interface ###

AddIcon help=interrupt size=small {
	VengeanceInterruptActions()
	VengeanceDispelActions()
	VengeanceHealActions()
}

AddIcon help=active_mitigation {
	unless InCombat() VengeancePrecombatActiveMitigationActions()
	VengeanceActiveMitigationActions()
}

AddIcon help=main {
	unless InCombat() VengeancePrecombatMainActions()
	VengeanceMainActions()
}

AddIcon help=shortcd {
	unless InCombat() VengeancePrecombatShortCdActions()
	VengeanceShortCdActions()
}

AddIcon help=cd {
	unless InCombat() VengeancePrecombatCdActions()
	VengeanceCdActions()
}

AddIcon help=offensive size=small {
	VengeanceOffensiveCdActions()
	unless VengeanceInRange() {
		Spell(infernal_strike)
		Texture(misc_arrowlup help=L(not_in_melee_range))
	}
	Item(Trinket0Slot usable=1 text=13)
	Item(Trinket1Slot usable=1 text=14)
}
]]
	Private.scripts:registerScript("DEMONHUNTER", "vengeance", name, desc, code, "script")
end