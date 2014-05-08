local _, NerienOvaleScripts = ...
local Ovale = NerienOvaleScripts.Ovale
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "Nerien"
	local desc = "[5.4] Nerien: Brewmaster, Mistweaver, Windwalker"
	local code = [[
# Nerien's monk script based on SimulationCraft
#
# Windwalker
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#fb!002221

Define(ascension_talent 8)
Define(blackout_kick 100784)
	SpellInfo(blackout_kick chi=2)
	SpellInfo(blackout_kick buffnocost=combo_breaker_bok_buff mastery=windwalker)
	SpellInfo(blackout_kick buff_chi=focus_of_xuen_buff buff_chi_amount=-1 mastery=windwalker)
	SpellAddBuff(blackout_kick combo_breaker_bok_buff=0 muscle_memory_buff=0 serpents_zeal=1 shuffle=1)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire chi=2)
Define(brewmaster_training 117967)
Define(charging_ox_wave 119392)
	SpellInfo(charging_ox_wave cd=30)
Define(charging_ox_wave_talent 11)
Define(chi_brew 115399)
	SpellInfo(chi_brew cd=45 chi=-2)
	SpellAddBuff(chi_brew healing_elixirs=0)
Define(chi_brew_talent 9)
Define(chi_burst 123986)
	SpellInfo(chi_burst cd=30)
Define(chi_burst_talent 6)
Define(chi_sphere 121286)
	SpellInfo(chi_sphere duration=120)
Define(chi_torpedo 115008)
	SpellAddBuff(chi_torpedo rapid_rolling=0)
Define(chi_torpedo_talent 18)
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=15)
Define(chi_wave_talent 4)
Define(combo_breaker_bok_buff 116768)
	SpellInfo(combo_breaker_bok_buff duration=15)
Define(combo_breaker_tp_buff 118864)
	SpellInfo(combo_breaker_tp_buff duration=15)
Define(crackling_jade_lightning 117952)
	SpellInfo(crackling_jade_lightning canStopChannelling=6 duration=6 tick=1)
	SpellAddBuff(crackling_jade_lightning power_strikes=0)
Define(dampen_harm 122278)
	SpellInfo(dampen_harm cd=90 duration=45)
	SpellAddBuff(dampen_harm dampen_harm=1)
Define(dampen_harm_talent 14)
Define(death_note 121125)
Define(diffuse_magic 122783)
	SpellInfo(diffuse_magic cd=90 duration=6)
	SpellAddBuff(diffuse_magic diffuse_magic=1)
Define(diffuse_magic_talent 15)
Define(disable 116095)
	SpellInfo(disable duration=15)
	SpellAddTargetDebuff(disable disable=1)
Define(dizzying_haze 115180)
Define(dizzying_haze_aura 116330)
	SpellInfo(dizzying_haze_aura duration=15)
Define(elusive_brew 128939)
	SpellInfo(elusive_brew duration=30)
Define(elusive_brew_use 115308)
	SpellInfo(elusive_brew_use cd=9 duration=1)
	SpellAddBuff(elusive_brew_use elusive_brew=0 elusive_brew_use=1 healing_elixirs=0)
Define(energizing_brew 115288)
Define(energizing_brew_buff 115288)
	SpellInfo(energizing_brew cd=60 duration=6 tick=1)
	SpellInfo(energizing_brew addduration=5 itemset=T14_melee itemcount=4)
	SpellAddBuff(energizing_brew energizing_brew=1 healing_elixirs=0)
Define(enveloping_mist 124682)
	SpellInfo(enveloping_mist chi=3)
	SpellAddTargetBuff(enveloping_mist enveloping_mist_aura=1)
Define(enveloping_mist_aura 132120)
	SpellInfo(enveloping_mist_aura duration=6 haste=spell tick=1)
Define(expel_harm 115072)
	SpellInfo(expel_harm cd=15 chi=-1)
	SpellInfo(expel_harm chi=-2 if_stance=monk_stance_of_the_fierce_tiger)
	SpellAddBuff(expel_harm power_strikes=0)
Define(expel_harm_glyphed 147489)
	SpellInfo(expel_harm_glyphed cd=15 chi=-1)
	SpellInfo(expel_harm_glyphed chi=-2 if_stance=monk_stance_of_the_fierce_tiger)
	SpellAddBuff(expel_harm_glyphed power_strikes=0)
Define(fists_of_fury 113656)
	SpellInfo(fists_of_fury canStopChannelling=4 cd=25 chi=3 tick=1)
	SpellInfo(fists_of_fury addcd=-5 itemset=T14_melee itemcount=2)
	SpellInfo(fists_of_fury buff_chi=focus_of_xuen_buff buff_chi_amount=-1 mastery=windwalker)
	SpellAddBuff(fists_of_fury fists_of_fury=1)
Define(flying_serpent_kick 101545)
	SpellInfo(flying_serpent_kick cd=25)
Define(focus_of_xuen_buff 145024)
	SpellInfo(focus_of_xuen_buff duration=10)
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=180)
	SpellAddBuff(fortifying_brew healing_elixirs=0)
#Define(fortifying_brew_glyphed 120954)
#	SpellInfo(fortifying_brew_glyphed duration=20)
Define(glyph_of_guard 123401)
Define(glyph_of_mana_tea 123763)
Define(glyph_of_surging_mist 120483)
Define(glyph_of_targeted_expulsion 146950)
Define(glyph_of_transcendence 123023)
Define(glyph_of_uplift 125669)
Define(guard 115295)
	SpellInfo(guard cd=30 chi=2 duration=30)
	SpellAddBuff(guard guard=1 power_guard=0)
Define(guard_glyphed 123402)
	SpellInfo(guard_glyphed cd=30 chi=2 duration=30)
	SpellAddBuff(guard_glyphed guard_glyphed=1 power_guard=0)
Define(heavy_stagger 124273)
	SpellInfo(heavy_stagger duration=10 tick=1)
Define(invoke_xuen 123904)
	SpellInfo(invoke_xuen cd=180 duration=45)
Define(invoke_xuen_talent 17)
Define(jab 100780)
	SpellInfo(jab buff_chi=power_strikes chi=-2 texture=ability_monk_jab)
	SpellInfo(jab chi=-1 if_stance=monk_stance_of_the_sturdy_ox)
	SpellInfo(jab chi=-1 if_stance=monk_stance_of_the_wise_serpent)
	SpellAddBuff(jab power_strikes=0)
Define(keg_smash 121253)
	SpellInfo(keg_smash cd=8 chi=-2)
	SpellAddTargetDebuff(keg_smash dizzying_haze_aura=1 weakened_blows=1)
Define(healing_elixirs 134563)
Define(healing_elixirs_talent 13)
Define(legacy_of_the_emperor 115921)
	SpellAddBuff(legacy_of_the_emperor legacy_of_the_emperor_aura=1)
Define(legacy_of_the_emperor_aura 117666)
	SpellInfo(legacy_of_the_emperor_aura duration=3600)
Define(legacy_of_the_white_tiger 116781)
	SpellInfo(legacy_of_the_white_tiger duration=3600)
	SpellAddBuff(legacy_of_the_white_tiger legacy_of_the_white_tiger=1)
Define(life_cocoon 116849)
	SpellInfo(life_cocoon cd=120 duration=12)
	SpellAddTargetBuff(life_cocoon life_cocoon=1)
Define(light_stagger 124275)
	SpellInfo(light_stagger duration=10 tick=1)
Define(lucidity 137331)
	SpellInfo(lucidity duration=4)
Define(mana_tea 115294)
	SpellInfo(mana_tea canStopChannelling=6 duration=3 tick=0.5 texture=inv_misc_herb_jadetealeaf)
Define(mana_tea_aura 115867)
	SpellInfo(mana_tea_aura duration=120)
Define(mana_tea_glyphed 123761)
	SpellInfo(mana_tea_glyphed cd=10 texture=inv_misc_herb_jadetealeaf)
	SpellAddBuff(mana_tea_glyphed mana_tea_aura=-2)
Define(moderate_stagger 124274)
	SpellInfo(moderate_stagger duration=10 tick=1)
Define(muscle_memory 139598)
Define(muscle_memory_buff 139597)
	SpellInfo(muscle_memory_buff duration=15)
Define(nimble_brew 137562)
	SpellInfo(nimble_brew cd=120 duration=6)
	SpellAddBuff(nimble_brew healing_elixirs=0 nimble_brew=1)
Define(paralysis 115078)
	SpellInfo(paralysis cd=15 duration=40)
	SpellAddTargetDebuff(paralysis paraylsis=1)
Define(power_guard 118636)
	SpellInfo(power_guard duration=30)
Define(power_strikes 129914)
Define(power_strikes_talent 7)
Define(purifier 138237) # 4pT15 tank bonus
	SpellInfo(purifier duration=15)
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=1 chi=1)
	SpellAddDebuff(purifying_brew healing_elixirs=0 heavy_stagger=0 light_stagger=0 moderate_stagger=0)
Define(rapid_rolling 147364)
	SpellInfo(rapid_rolling duration=5)
Define(renewing_mist 115151)
	SpellInfo(renewing_mist cd=8 chi=-1)
	SpellAddTargetBuff(renewing_mist renewing_mist_aura=1)
Define(renewing_mist_aura 119611)
	SpellInfo(renewing_mist_aura duration=18 haste=spell tick=2)
Define(renewing_mist_spread_aura 119607)
Define(retreat 124968)
	SpellInfo(retreat duration=10)
Define(revival 115310)
	SpellInfo(revival cd=180)
Define(ring_of_peace 116844)
	SpellInfo(ring_of_peace cd=45 duration=8)
Define(ring_of_peace_talent 10)
Define(rising_sun_kick 107428)
	SpellInfo(rising_sun_kick cd=8 chi=2)
	SpellInfo(rising_sun_kick buff_chi=focus_of_xuen_buff buff_chi_amount=-1 mastery=windwalker)
	SpellAddTargetDebuff(rising_sun_kick rising_sun_kick_debuff=1)
Define(rising_sun_kick_debuff 130320)
	SpellInfo(rising_sun_kick_debuff duration=15)
Define(roll 109132)
	SpellInfo(roll cd=0.8)
	SpellAddBuff(roll rapid_rolling=0)
Define(rushing_jade_wind 116847)
	SpellInfo(rushing_jade_wind cd=6 cd_haste=melee duration=6 haste=melee tick=0.75)
	SpellAddBuff(rushing_jade_wind rushing_jade_wind=1)
Define(rushing_jade_wind_talent 16)
Define(sanctuary_of_the_ox 126119)
Define(serpents_zeal 127722)
	SpellInfo(serpents_zeal duration=30 tick=3)
Define(shuffle 115307)
	SpellInfo(shuffle duration=6)
Define(soothing_mist 115175)
	SpellInfo(soothing_mist canStopChannelling=8 duration=8 haste=spell tick=1)
	SpellAddBuff(soothing_mist power_strikes=0 soothing_mist=1)
Define(spear_hand_strike 116705)
	SpellInfo(spear_hand_strike cd=10)
Define(spinning_crane_kick 101546)
	SpellInfo(spinning_crane_kick duration=2 haste=melee tick=0.75)
	SpellAddBuff(spinning_crane_kick spinning_crane_kick=1)
Define(spinning_fire_blossom 115073)
	SpellInfo(spinning_fire_blossom chi=1)
SpellList(stagger heavy_stagger light_stagger moderate_stagger)
Define(staggering 138233) # 2pT15 tank bonus
Define(stance_of_the_fierce_tiger 103985)
Define(stance_of_the_sturdy_ox 115069)
Define(stance_of_the_wise_serpent 115070)
Define(storm_earth_and_fire 137639)
	SpellAddBuff(storm_earth_and_fire storm_earth_and_fire=1)
Define(summon_black_ox_statue 115315)
	SpellInfo(summon_black_ox_statue cd=30)
Define(summon_jade_serpent_statue 115313)
	SpellInfo(summon_jade_serpent_statue cd=30)
Define(surging_mist 116694)
	SpellInfo(surging_mist chi=-1)
	SpellAddBuff(surging_mist thunder_focus_tea=0 vital_mists=0)
Define(surging_mist_glyphed 123273)
	SpellInfo(surging_mist_glyphed chi=-1)
	SpellAddBuff(surging_mist_glyphed thunder_focus_tea=0 vital_mists=0)
Define(symbiosis_bear_hug 127361)
	SpellInfo(symbiosis_bear_hug cd=60 duration=3)
	SpellAddTargetDebuff(symbiosis_bear_hug symbiosis_bear_hug=1)
Define(symbiosis_survival_instincts 113306)
	SpellInfo(symbiosis_survival_instincts cd=180 duration=6)
	SpellAddBuff(symbiosis_survival_instincts symbiosis_survival_instincts=1)
Define(teachings_of_the_monastery 116645)
Define(thunder_focus_tea 116680)
	SpellInfo(thunder_focus_tea cd=45 chi=1 duration=30)
	SpellInfo(thunder_focus_tea addcd=-5 itemset=T15_heal itemcount=4)
Define(tiger_palm 100787)
	SpellInfo(tiger_palm chi=1)
	SpellInfo(tiger_palm buffnocost=combo_break_tp mastery=windwalker)
	SpellInfo(tiger_palm chi=0 if_spell=brewmaster_training)
	SpellAddBuff(tiger_palm combo_break_tp=0 muscle_memory_buff=0 power_guard=1 tiger_power_buff=1 vital_mists=1)
Define(tiger_power_buff 125359)
	SpellInfo(tiger_power_buff duration=20)
Define(tiger_strikes 120273)
	SpellInfo(tiger_strikes duration=15)
Define(tigereye_brew 116740)
	SpellInfo(tigereye_brew cd=5)
	SpellAddBuff(tigereye_brew healing_elixirs=0 tigereye_brew_buff=-10 tigereye_brew_use_buff=1)
Define(tigereye_brew_buff 125195)
	SpellInfo(tigereye_brew_buff duration=120)
Define(tigereye_brew_use_buff 116740)
	SpellInfo(tigereye_brew_use_buff duration=15)
Define(tigers_lust 116841)
	SpellInfo(tigers_lust cd=30 duration=6)
	SpellAddBuff(tigers_lust tigers_lust=1)
Define(tigers_lust_talent 2)
Define(touch_of_death 115080)
	SpellInfo(touch_of_death cd=90 chi=3)
Define(touch_of_karma 122470)
	SpellInfo(touch_of_karma cd=90 duration=10)
	SpellAddTargetDebuff(touch_of_karma touch_of_karma=1)
Define(transcendence 101643)
	SpellInfo(transcendence cd=45)
Define(transcendence_transfer 119996)
	SpellInfo(transcendence_transfer cd=25)
	SpellInfo(transcendence_transfer addcd=-5 glyph=glyph_of_transcendence)
Define(uplift 116670)
	SpellInfo(uplift chi=2)
	SpellAddBuff(uplift thunder_focus_tea=0)
Define(uplift_glyphed 130316)
	SpellAddBuff(uplift_glyphed thunder_focus_tea=0)
Define(vital_mists 118674)
	SpellInfo(vital_mists duration=30)
Define(weakened_blows 115798)
	SpellInfo(weakened_blows duration=30)
Define(zen_sphere 124081)
Define(zen_sphere_buff 124081)
	SpellInfo(zen_sphere cd=10 duration=16 haste=spell tick=2)
Define(zen_sphere_talent 5)

# MoP trinket buffs (agility, strength)
SpellList(trinket_proc_agility_buff 126489 126554 126690 126707 128897 128984 138699 138756 138938 146308 146310 148896 148903)
SpellList(trinket_proc_strength_buff 126519 126582 126679 126700 128986 138702 138759 138870 138960 146245 146250 148899)

# Items
Define(virmens_bite_potion 76089)
Define(virmens_bite_potion_buff 105697)
	SpellInfo(virmens_bite_potion_buff duration=25)
Define(jade_serpent_potion 76093)
Define(jade_serpent_potion_buff 105702)
	SpellInfo(jade_serpent_potion_buff duration=25)

# Racials
Define(arcane_torrent_chi 129597)
	SpellInfo(arcane_torrent_chi cd=120 chi=1)
Define(berserking 26297)
	SpellInfo(berserking cd=180 duration=10)
	SpellAddBuff(berserking berserking=1)
Define(blood_fury 20572)
	SpellInfo(blood_fury cd=120 duration=15)
	SpellAddBuff(blood_fury blood_fury=1)
Define(quaking_palm 107079)
	SpellInfo(quaking_palm cd=120 duration=4)
	SpellAddTargetDebuff(quaking_palm quaking_palm=1)
Define(stoneform 20594)
	SpellInfo(stoneform cd=120 duration=8)
	SpellAddBuff(stoneform stoneform=1)

AddFunction UseRacialActions
{
	Spell(berserking)
	Spell(blood_fury)
}

AddFunction UseRacialInterruptActions
{
	if target.Classification(worldboss no)
	{
		Spell(arcane_torrent_chi)
		if target.InRange(quaking_palm) Spell(quaking_palm)
	}
}

AddFunction UseRacialSurvivalActions
{
	Spell(stoneform)
}

AddCheckBox(aoe L(AOE))
AddCheckBox(potions "Use potions" default)

AddCheckBox(opt_icons_left "Left icons")
AddCheckBox(opt_icons_right "Right icons")

# Trinket CDs
AddListItem(trinketcd0 000s "Trinket 0 CD - none" default)
AddListItem(trinketcd0 060s "Trinket 0 CD - 1 min")
AddListItem(trinketcd0 090s "Trinket 0 CD - 1 min 30s")
AddListItem(trinketcd0 120s "Trinket 0 CD - 2 min")
AddListItem(trinketcd1 000s "Trinket 1 CD - none" default)
AddListItem(trinketcd1 060s "Trinket 1 CD - 1 min")
AddListItem(trinketcd1 090s "Trinket 1 CD - 1 min 30s")
AddListItem(trinketcd1 120s "Trinket 1 CD - 2 min")

AddFunction UseItemActions
{
	Item(HandsSlot usable=1)
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Monk (all specializations)
###

# Player health threshold to trigger casting Expel Harm instead of Jab.
AddListItem(opt_expel_harm_threshold 90percent "Expel Harm at 90% health")
AddListItem(opt_expel_harm_threshold 80percent "Expel Harm at 80% health" default)
AddListItem(opt_expel_harm_threshold 70percent "Expel Harm at 70% health")
AddListItem(opt_expel_harm_threshold 60percent "Expel Harm at 60% health")

AddFunction ExpelHarm
{
	if Glyph(glyph_of_targeted_expulsion)
	{
		Spell(expel_harm_glyphed)
	}
	if Glyph(glyph_of_targeted_expulsion no)
	{
		if List(opt_expel_harm_threshold 90percent) and HealthPercent() <90 Spell(expel_harm)
		if List(opt_expel_harm_threshold 80percent) and HealthPercent() <80 Spell(expel_harm)
		if List(opt_expel_harm_threshold 70percent) and HealthPercent() <70 Spell(expel_harm)
		if List(opt_expel_harm_threshold 60percent) and HealthPercent() <60 Spell(expel_harm)
	}
}

AddFunction Interrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		if target.InRange(spear_hand_strike) Spell(spear_hand_strike)
		if target.Classification(worldboss no) and target.InRange(paralysis) Spell(paralysis)
		UseRacialInterruptActions()
	}
}

AddFunction Jab
{
	if Energy() >40 Spell(jab)
}

AddFunction NumberToMaxChi
{
	MaxChi() - Chi()
}

AddFunction Tier2TalentActions
{
	if TalentPoints(chi_burst_talent) Spell(chi_burst)
	if TalentPoints(chi_wave_talent) Spell(chi_wave)
	if TalentPoints(zen_sphere_talent) and BuffExpires(zen_sphere_buff) Spell(zen_sphere)
}

AddFunction Tier5TalentActions
{
	if TalentPoints(dampen_harm_talent) Spell(dampen_harm)
	if TalentPoints(diffuse_magic_talent) Spell(diffuse_magic)
}

# Generic filler actions for non-Windwalker monks in Stance of the Fierce Tiger.
AddFunction FillerActions
{
	# Filler heal/DPS Tier 2 talent.
	if TalentPoints(chi_wave_talent) Spell(chi_wave)

	# Use Tiger Palm as a filler only if it costs no Chi.
	if SpellData(tiger_palm chi) ==0 Spell(tiger_palm)

	# Jab otherwise.
	Jab()
}

# Generic single-target DPS actions for non-Windwalker monks in Stance of the Fierce Tiger.
AddFunction SingleTargetDPSActions
{
	Spell(blackout_kick)
	if Energy() >40
	{
		ExpelHarm()
		Jab()
	}
	FillerActions()
}

# Generic AoE DPS actions for non-Windwalker monks in Stance of the Fierce Tiger.
AddFunction AoEDPSActions
{
	Spell(blackout_kick)
	if Energy() >40
	{
		if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
		if not TalentPoints(rushing_jade_wind_talent) Spell(spinning_crane_kick)
	}
	FillerActions()
}

###
### Brewmaster
###
# Rotations from Elitist Jerks, "Like Water - The Brewmaster's Resource [1-26-13]"
#	http://elitistjerks.com/f99/t131791-like_water_brewmasters_resource_1_26_13_a/

AddFunction BrewmasterPreCombatActions
{
	if InCombat(no)
	{
		# Clear Stagger debuff if there is enough Chi to do so.
		if DebuffPresent(light_stagger) or DebuffPresent(moderate_stagger) or DebuffPresent(heavy_stagger) Spell(purifying_brew)
		unless BuffPresent(str_agi_int 400 any=1) Spell(legacy_of_the_emperor)
	}
}

AddFunction BrewmasterBuffActions
{
	unless BuffPresent(str_agi_int any=1) Spell(legacy_of_the_emperor)
}

AddFunction BrewmasterMaintenanceActions
{
	# Use Tiger Palm to maintain buffs only if costs no Chi.
	if SpellData(tiger_palm chi) ==0
	{
		if BuffExpires(power_guard)
		{
			if Glyph(glyph_of_guard) and BuffExpires(guard_glyphed 2) and SpellCooldown(guard_glyphed) < GCD() Spell(tiger_palm)
			if Glyph(glyph_of_guard no) and BuffExpires(guard 2) and SpellCooldown(guard) < GCD() Spell(tiger_palm)
		}
		if BuffExpires(tiger_power_buff) Spell(tiger_palm)
	}
}

AddFunction BrewmasterFillerActions
{
	# Filler heal/DPS Tier 2 talent.
	if TalentPoints(chi_wave_talent) Spell(chi_wave)
	if TalentPoints(zen_sphere_talent) and BuffExpires(zen_sphere_buff) Spell(zen_sphere)

	# Use Tiger Palm as a filler only if it costs no Chi.
	if SpellData(tiger_palm chi) ==0 Spell(tiger_palm)
	Jab()
}

AddFunction StaggerDamageRemaining
{
	if DebuffPresent(light_stagger)		{ TicksRemain(light_stagger)    * TickValue(light_stagger) }
	if DebuffPresent(moderate_stagger)	{ TicksRemain(moderate_stagger) * TickValue(moderate_stagger) }
	if DebuffPresent(heavy_stagger)		{ TicksRemain(heavy_stagger)    * TickValue(heavy_stagger) }
}

AddFunction StaggerTickDamage
{
	if DebuffPresent(light_stagger)		TickValue(light_stagger)
	if DebuffPresent(moderate_stagger)	TickValue(moderate_stagger)
	if DebuffPresent(heavy_stagger)		TickValue(heavy_stagger)
}

AddFunction BrewmasterPurifyingBrew
{
	# Purify Stagger if it ticks for more than half of my remaining health (urgent!).
	if StaggerTickDamage() / Health() >0.5 Spell(purifying_brew)
	# Purify Stagger > 40% of my health.
	if StaggerDamageRemaining() / MaxHealth() >0.40 Spell(purifying_brew)
	# Purify Medium Stagger if below 70% health.
	if DebuffPresent(moderate_stagger) and HealthPercent() <70 Spell(purifying_brew)
}

# Aggressive Jab for maximizing DPS/TPS.
AddCheckBox(opt_aggressive_jab SpellName(jab) mastery=brewmaster)

AddFunction BrewmasterEnergyPoolingCondition
{
	if CheckBoxOff(opt_aggressive_jab)
	{
		# Pool energy for possible Expel Harm or Healing Sphere.
		TimeToMaxEnergy() <2
	}
	if CheckBoxOn(opt_aggressive_jab)
	{
		# Maximize DPS/TPS by using Jab/SCK as long as there is enough energy.
		Energy() >40
	}
}

AddFunction BrewmasterSingleTargetActions
{
	if BuffExpires(shuffle 2) Spell(blackout_kick)
	if NumberToMaxChi() >=2 Spell(keg_smash)
	if NumberToMaxChi() >=1 and HealthPercent() <35
	{
		if Glyph(glyph_of_targeted_expulsion) Spell(expel_harm_glyphed)
		if Glyph(glyph_of_targeted_expulsion no) Spell(expel_harm)
	}
	BrewmasterMaintenanceActions()
	if NumberToMaxChi() ==0
	{
		Spell(blackout_kick)
	}
	if BrewmasterEnergyPoolingCondition()
		and {SpellCooldown(keg_smash) > GCD()}
		and {Energy() - 40 + SpellCooldown(keg_smash) * EnergyRegen() >40}
	{
		# Only Jab or Expel Harm if we'll have enough energy to Keg Smash when it comes off cooldown.
		ExpelHarm()
		Jab()
	}
	if NumberToMaxChi() <2
	{
		Spell(blackout_kick)
	}
	BrewmasterFillerActions()
}

AddFunction BrewmasterAoEActions
{
	if BuffExpires(shuffle 2) Spell(blackout_kick)
	if NumberToMaxChi() >=2 Spell(keg_smash)
	BrewmasterMaintenanceActions()
	if NumberToMaxChi() ==0
	{
		if BuffPresent(shuffle 6) Spell(breath_of_fire)
		Spell(blackout_kick)
	}
	if BrewmasterEnergyPoolingCondition()
		and {Energy() - 40 + SpellCooldown(keg_smash) * EnergyRegen() >40}
	{
		# Only SCK/RJW if we'll have enough energy to Keg Smash when it comes off cooldown.
		if TalentPoints(rushing_jade_wind_talent) and SpellCooldown(keg_smash) >GCD()
		{
			Spell(rushing_jade_wind)
		}
		if not TalentPoints(rushing_jade_wind_talent) and SpellCooldown(keg_smash) >2
		{
			# The channel time of SCK is 2s, so only SCK if Keg Smash is on CD for at least 2s.
			Spell(spinning_crane_kick)
		}
	}
	if NumberToMaxChi() <2
	{
		if BuffPresent(shuffle 6) Spell(breath_of_fire)
		Spell(blackout_kick)
	}
	BrewmasterFillerActions()
}

# Tier 5 damage reduction cooldown
AddIcon mastery=brewmaster help=cd size=small checkboxon=opt_icons_left
{
	Tier5TalentActions()
}

# Damage reduction cooldowns
AddIcon mastery=brewmaster help=cd size=small checkboxon=opt_icons_left
{
	Spell(fortifying_brew)
	Spell(symbiosis_survival_instincts)
	UseRacialSurvivalActions()
}

# Defensive abilities
AddIcon mastery=brewmaster help=cd
{
	unless Stance(monk_stance_of_the_sturdy_ox) Spell(stance_of_the_sturdy_ox)

	# Cast Purifying Brew only if Heavy Stagger (urgent!) or if Shuffle uptime won't suffer.
	# Avoid Purifying while Elusive Brew is up unless under Heavy Stagger.
	if DebuffPresent(heavy_stagger)
		or {BuffExpires(elusive_brew) and {BuffPresent(shuffle 6) or Chi() >=2}}
	{
		BrewmasterPurifyingBrew()
	}
	if BuffPresent(purifier) and DebuffPresent(stagger) Spell(purifying_brew)
	if ArmorSetParts(T15_tank) <2 and BuffStacks(elusive_brew) >10 Spell(elusive_brew_use)
	if ArmorSetParts(T15_tank) >=2 and BuffStacks(elusive_brew) >5
	{
		if BuffRemains(staggering) < BuffStacks(elusive_brew) Spell(elusive_brew_use)
	}
	if BuffPresent(power_guard)
	{
		if Glyph(glyph_of_guard) and BuffExpires(guard_glyphed) Spell(guard_glyphed)
		if Glyph(glyph_of_guard no) and BuffExpires(guard) Spell(guard)
	}
}

AddIcon mastery=brewmaster help=main
{
	BrewmasterPreCombatActions()
	BrewmasterBuffActions()
	if Stance(monk_stance_of_the_sturdy_ox) BrewmasterSingleTargetActions()
	if Stance(monk_stance_of_the_fierce_tiger) SingleTargetDPSActions()
}

AddIcon mastery=brewmaster help=aoe checkboxon=aoe
{
	BrewmasterPreCombatActions()
	BrewmasterBuffActions()
	if Stance(monk_stance_of_the_sturdy_ox) BrewmasterAoEActions()
	if Stance(monk_stance_of_the_fierce_tiger) AoEDPSActions()
}

AddIcon mastery=brewmaster help=cd
{
	if IsFeared() or IsRooted() or IsStunned() Spell(nimble_brew)
	if target.Health() < Health() and BuffPresent(death_note) Spell(touch_of_death)
	Interrupt()
	if TalentPoints(chi_burst_talent) Spell(chi_burst)
	unless {target.Health() < Health() and BuffPresent(death_note) Spell(touch_of_death)}
		or {TalentPoints(chi_burst_talent) and Spell(chi_burst)}
	{
		if TalentPoints(invoke_xuen_talent) Spell(invoke_xuen)
	}
}

AddIcon mastery=brewmaster help=cd size=small checkboxon=opt_icons_right
{
	if BuffExpires(sanctuary_of_the_ox) Spell(summon_black_ox_statue)
}

AddIcon mastery=brewmaster help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Mistweaver
###

# Toggle for legendary healer meta-gem.
AddCheckBox(opt_legendary_metagem "Courageous Primal Diamond")

AddCheckBox(opt_mistweaver_pool_chi "Pool Chi" mastery=mistweaver)
AddFunction MistweaverChiPool
{
	if CheckBoxOn(opt_mistweaver_pool_chi) 2
	0
}

AddFunction MistweaverExpelHarm
{
	if Glyph(glyph_of_targeted_expulsion) Spell(expel_harm_glyphed)
	if Glyph(glyph_of_targeted_expulsion no) Spell(expel_harm)
}

AddFunction MistweaverPreCombatActions
{
	if InCombat(no)
	{
		if BuffExpires(str_agi_int 400 any=1) Spell(legacy_of_the_emperor)
	}
}

AddFunction MistweaverBuffActions
{
	unless BuffPresent(str_agi_int any=1) Spell(legacy_of_the_emperor)
}

AddFunction ManaTea
{
	if Glyph(glyph_of_mana_tea) Spell(mana_tea_glyphed)
	if not Glyph(glyph_of_mana_tea) Spell(mana_tea)
}

AddFunction SurgingMist
{
	if Glyph(glyph_of_surging_mist) Spell(surging_mist_glyphed)
	if Glyph(glyph_of_surging_mist no) Spell(surging_mist)
}

AddFunction MistweaverAoeActions
{
	#spinning_crane_kick,if=!talent.rushing_jade_wind.enabled
	#rushing_jade_wind,if=talent.rushing_jade_wind.enabled
	if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
	#zen_sphere,cycle_targets=1,if=talent.zen_sphere.enabled&!dot.zen_sphere.ticking
	if TalentPoints(zen_sphere_talent) and BuffCount(zen_sphere_buff) < 1 Spell(zen_sphere)
	#chi_burst,if=talent.chi_burst.enabled
	if TalentPoints(chi_burst_enabled) Spell(chi_burst)
	#tiger_palm,if=buff.muscle_memory.up&!buff.tiger_power.up
	if BuffPresent(muscle_memory_buff) and BuffExpires(tiger_power_buff) Spell(tiger_palm)
	#blackout_kick,if=buff.muscle_memory.up&buff.tiger_power.up&chi>1
	if BuffPresent(muscle_memory_buff) and BuffPresent(tiger_power_buff) and Chi() > {MistweaverChiPool() + 1} Spell(blackout_kick)
	#jab,if=talent.rushing_jade_wind.enabled
	if not TalentPoints(rushing_jade_wind_talent) Spell(spinning_crane_kick)
	MistweaverExpelHarm()
	if TalentPoints(rushing_jade_wind_talent) Spell(jab)
}

AddFunction MistweaverSingleTargetActions
{
	#crackling_jade_lightning,if=buff.bloodlust.up&buff.lucidity.up
	if BuffPresent(burst_haste any=1) and BuffPresent(lucidity) Spell(crackling_jade_lightning)
	#tiger_palm,if=buff.muscle_memory.up&buff.lucidity.up
	if BuffPresent(lucidity) and BuffPresent(muscle_memory_buff) Spell(tiger_palm)
	#jab,if=buff.lucidity.up
	if BuffPresent(lucidity) Spell(jab)
	#tiger_palm,if=buff.muscle_memory.up&!buff.tiger_power.up
	if BuffPresent(muscle_memory_buff) and BuffExpires(tiger_power_buff) Spell(tiger_palm)
	#blackout_kick,if=buff.muscle_memory.up&buff.tiger_power.up&chi>1
	if BuffPresent(muscle_memory_buff) and BuffPresent(tiger_power_buff) and Chi() > {MistweaverChiPool() + 1} Spell(blackout_kick)
	#tiger_palm,if=buff.muscle_memory.up&buff.tiger_power.up
	if BuffPresent(muscle_memory_buff) and BuffPresent(tiger_power_buff) and Chi() > MistweaverChiPool() Spell(tiger_palm)
	#chi_wave,if=talent.chi_wave.enabled
	if TalentPoints(chi_wave_talent) Spell(chi_wave)
	#zen_sphere,cycle_targets=1,if=talent.zen_sphere.enabled&!dot.zen_sphere.ticking
	if TalentPoints(zen_sphere_talent) and BuffCount(zen_sphere_buff) < 1 Spell(zen_sphere)
	#jab
	MistweaverExpelHarm()
	Spell(jab)
}

AddFunction MistweaverDefaultActions
{
	#auto_attack
	#chi_brew,if=talent.chi_brew.enabled&chi=0
	if TalentPoints(chi_brew_talent) and Chi() == 0 Spell(chi_brew)
	#mana_tea,if=buff.mana_tea.react>=2&mana.pct<=25
	if BuffStacks(mana_tea_aura) >= 2 and ManaPercent() <= 25 ManaTea()
	#jade_serpent_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) and target.TimeToDie() <= 60 Item(jade_serpent_potion)
	#use_item
	Item(HandsSlot usable=1)
	#invoke_xuen,if=talent.invoke_xuen.enabled
	if TalentPoints(invoke_xuen_talent) Spell(invoke_xuen)
	#run_action_list,name=aoe,if=active_enemies>=3
	if Enemies() >= 3 MistweaverAoeActions()
	#run_action_list,name=single_target,if=active_enemies<3
	if Enemies() < 3 MistweaverSingleTargetActions()
}

AddFunction MistweaverDefaultCdActions
{
	#chi_brew,if=talent.chi_brew.enabled&chi=0
	if TalentPoints(chi_brew_talent) and Chi() == 0 Spell(chi_brew)
	#mana_tea,if=buff.mana_tea.react>=2&mana.pct<=25
	if BuffStacks(mana_tea_aura) >= 2 and ManaPercent() <= 25 ManaTea()
	#jade_serpent_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) and target.TimeToDie() <= 60 Item(jade_serpent_potion)
	#use_item
	Item(HandsSlot usable=1)
	#invoke_xuen,if=talent.invoke_xuen.enabled
	if TalentPoints(invoke_xuen_talent) Spell(invoke_xuen)
}

AddIcon mastery=mistweaver help=cd size=small checkboxon=opt_icons_right
{
	if TotemExpires(statue) Spell(summon_jade_serpent_statue)
}

# Raid cooldowns
AddIcon mastery=mistweaver help=cd size=small checkboxon=opt_icons_left
{
	Spell(thunder_focus_tea)
	Spell(revival)
}

AddIcon mastery=mistweaver help=shortcd
{
	unless Stance(monk_stance_of_the_wise_serpent) Spell(stance_of_the_wise_serpent)

	if BuffStacks(vital_mists) ==5 SurgingMist()
	Spell(renewing_mist)
	if TalentPoints(chi_burst_talent) Spell(chi_burst)
	if TalentPoints(zen_sphere_talent) Spell(zen_sphere)
}

AddIcon mastery=mistweaver help=main
{
	MistweaverPreCombatActions()
	MistweaverBuffActions()
	if Stance(monk_stance_of_the_wise_serpent) MistweaverSingleTargetActions()
	if Stance(monk_stance_of_the_fierce_tiger) SingleTargetDPSActions()
}

AddIcon mastery=mistweaver help=aoe checkboxon=aoe
{
	MistweaverPreCombatActions()
	MistweaverBuffActions()
	if Stance(monk_stance_of_the_wise_serpent) MistweaverAoeActions()
	if Stance(monk_stance_of_the_fierce_tiger) AoEDPSActions()
}

AddIcon mastery=mistweaver help=cd
{
	if IsFeared() or IsRooted() or IsStunned() Spell(nimble_brew)
	if target.Health() < Health() and BuffPresent(death_note) Spell(touch_of_death)
	Interrupt()
	if Spell(thunder_focus_tea) and Chi() >=3 Spell(uplift)
	if not Spell(thunder_focus_tea) and Chi() >=2 Spell(uplift)

	MistweaverDefaultCdActions()
}

# Mana cooldown
AddIcon mastery=mistweaver help=mana size=small checkboxon=opt_icons_left
{
	if BuffStacks(mana_tea_aura) == 20 ManaTea()
	if ManaPercent() < 75 ManaTea()
	if ManaPercent() < 100 and ManaPercent() < 100 - {BuffStacks(mana_tea_aura) * 4} ManaTea()
}

AddIcon mastery=mistweaver help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Windwalker
###

# Based on SimulationCraft profile "Monk_Windwalker_1h_T16H".
#	class=monk
#	spec=windwalker
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#fb!002221

AddFunction WindwalkerUsePotion
{
	#virmens_bite_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion usable=1)
}

AddFunction WindwalkerGenerateChi
{
	ExpelHarm()
	Jab()
}

AddFunction WindwalkerAoeActions
{
	#rushing_jade_wind,if=talent.rushing_jade_wind.enabled
	if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
	#zen_sphere,cycle_targets=1,if=talent.zen_sphere.enabled&!dot.zen_sphere.ticking
	if TalentPoints(zen_sphere_talent) and not BuffPresent(zen_sphere_buff) Spell(zen_sphere)
	#chi_wave,if=talent.chi_wave.enabled
	if TalentPoints(chi_wave_talent) Spell(chi_wave)
	#chi_burst,if=talent.chi_burst.enabled
	if TalentPoints(chi_burst_talent) Spell(chi_burst)
	#rising_sun_kick,if=chi=chi.max
	if Chi() == MaxChi() Spell(rising_sun_kick)
	#spinning_crane_kick,if=!talent.rushing_jade_wind.enabled
	if not TalentPoints(rushing_jade_wind_talent) Spell(spinning_crane_kick)
}

AddFunction WindwalkerSingleTargetActions
{
	#rising_sun_kick
	Spell(rising_sun_kick)
	#fists_of_fury,if=buff.energizing_brew.down&energy.time_to_max>4&buff.tiger_power.remains>4
	if BuffExpires(energizing_brew_buff) and TimeToMaxEnergy() > 4 and BuffRemains(tiger_power_buff) > 4 Spell(fists_of_fury)
	#chi_wave,if=talent.chi_wave.enabled&energy.time_to_max>2
	if TalentPoints(chi_wave_talent) and TimeToMaxEnergy() > 2 Spell(chi_wave)
	#blackout_kick,if=buff.combo_breaker_bok.react
	if BuffPresent(combo_breaker_bok_buff) Spell(blackout_kick)
	#tiger_palm,if=buff.combo_breaker_tp.react&(buff.combo_breaker_tp.remains<=2|energy.time_to_max>=2)
	if BuffPresent(combo_breaker_tp_buff) and { BuffRemains(combo_breaker_tp_buff) <= 2 or TimeToMaxEnergy() >= 2 } Spell(tiger_palm)
	#jab,if=chi.max-chi>=2
	if MaxChi() - Chi() >= 2 WindwalkerGenerateChi()
	#blackout_kick,if=energy+energy.regen*cooldown.rising_sun_kick.remains>=40
	if Energy() + EnergyRegen() * SpellCooldown(rising_sun_kick) >= 40 Spell(blackout_kick)
}

AddFunction WindwalkerSingleTargetShortCdActions
{
	unless Spell(rising_sun_kick)
	{
		#fists_of_fury,if=buff.energizing_brew.down&energy.time_to_max>4&buff.tiger_power.remains>4
		if BuffExpires(energizing_brew_buff) and TimeToMaxEnergy() > 4 and BuffRemains(tiger_power_buff) > 4 Spell(fists_of_fury)
		#chi_burst,if=talent.chi_burst.enabled&energy.time_to_max>2
		if TalentPoints(chi_burst_talent) and TimeToMaxEnergy() > 2 Spell(chi_burst)
	}
}

AddFunction WindwalkerDefaultActions
{
	#auto_attack
	#chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
	#tiger_palm,if=buff.tiger_power.remains<=3
	if BuffRemains(tiger_power_buff) <= 3 Spell(tiger_palm)
	#rising_sun_kick,if=debuff.rising_sun_kick.down
	if target.DebuffExpires(rising_sun_kick_debuff) Spell(rising_sun_kick)
	#tiger_palm,if=buff.tiger_power.down&debuff.rising_sun_kick.remains>1&energy.time_to_max>1
	if BuffExpires(tiger_power_buff) and target.DebuffRemains(rising_sun_kick_debuff) > 1 and TimeToMaxEnergy() > 1 Spell(tiger_palm)
}

AddFunction WindwalkerDefaultShortCdActions
{
	#chi_brew,if=talent.chi_brew.enabled&chi<=2&(trinket.proc.agility.react|(charges=1&recharge_time<=10)|charges=2|target.time_to_die<charges*10)
	if TalentPoints(chi_brew_talent) and Chi() <= 2 and { BuffPresent(trinket_proc_agility_buff) or { Charges(chi_brew) == 1 and SpellChargeCooldown(chi_brew) <= 10 } or Charges(chi_brew) == 2 or target.TimeToDie() < Charges(chi_brew) * 10 } Spell(chi_brew)
	unless BuffRemains(tiger_power_buff) <= 3 and Spell(tiger_palm)
	{
		#tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack=20
		if BuffExpires(tigereye_brew_use_buff) and BuffStacks(tigereye_brew_buff) == 20 Spell(tigereye_brew)
		#tigereye_brew,if=buff.tigereye_brew_use.down&trinket.proc.agility.react
		if BuffExpires(tigereye_brew_use_buff) and BuffPresent(trinket_proc_agility_buff) Spell(tigereye_brew)
		#tigereye_brew,if=buff.tigereye_brew_use.down&chi>=2&(trinket.proc.agility.react|trinket.proc.strength.react|buff.tigereye_brew.stack>=15|target.time_to_die<40)&debuff.rising_sun_kick.up&buff.tiger_power.up
		if BuffExpires(tigereye_brew_use_buff) and Chi() >= 2 and { BuffPresent(trinket_proc_agility_buff) or BuffPresent(trinket_proc_strength_buff) or BuffStacks(tigereye_brew_buff) >= 15 or target.TimeToDie() < 40 } and target.DebuffPresent(rising_sun_kick_debuff) and BuffPresent(tiger_power_buff) Spell(tigereye_brew)
		#energizing_brew,if=energy.time_to_max>5
		if TimeToMaxEnergy() > 5 Spell(energizing_brew)
	}
}

AddFunction WindwalkerDefaultCdActions
{
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <= 60 WindwalkerUsePotion()
	#use_item,name=gloves_of_the_golden_protector
	Item(HandsSlot usable=1)
	#berserking
	Spell(berserking)
	unless {TalentPoints(chi_brew_talent) and Chi() <= 2 and { BuffPresent(trinket_proc_agility_buff) or { Charges(chi_brew) == 1 and SpellChargeCooldown(chi_brew) <= 10 } or Charges(chi_brew) == 2 or target.TimeToDie() < Charges(chi_brew) * 10 } Spell(chi_brew)}
		or {BuffRemains(tiger_power_buff) <= 3 and Spell(tiger_palm)}
		or {BuffExpires(tigereye_brew_use_buff) and BuffStacks(tigereye_brew_buff) == 20 and Spell(tigereye_brew)}
		or {BuffExpires(tigereye_brew_use_buff) and BuffPresent(trinket_proc_agility_buff) and Spell(tigereye_brew)}
		or {BuffExpires(tigereye_brew_use_buff) and Chi() >= 2 and { BuffPresent(trinket_proc_agility_buff) or BuffPresent(trinket_proc_strength_buff) or BuffStacks(tigereye_brew_buff) >= 15 or target.TimeToDie() < 40 } and target.DebuffPresent(rising_sun_kick_debuff) and BuffPresent(tiger_power_buff) and Spell(tigereye_brew)}
		or {TimeToMaxEnergy() > 5 and Spell(energizing_brew)}
		or {target.DebuffExpires(rising_sun_kick_debuff) and Spell(rising_sun_kick)}
		or {BuffExpires(tiger_power_buff) and target.DebuffRemains(rising_sun_kick_debuff) > 1 and TimeToMaxEnergy() > 1 and Spell(tiger_palm)}
	{
		#invoke_xuen,if=talent.invoke_xuen.enabled
		if TalentPoints(invoke_xuen_talent) Spell(invoke_xuen)
	}
}

AddFunction WindwalkerPrecombatActions
{
	if InCombat(no)
	{
		if BuffExpires(str_agi_int 400 any=1) Spell(legacy_of_the_emperor)
		if BuffExpires(critical_strike any=1) Spell(legacy_of_the_white_tiger)

		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#stance,choose=fierce_tiger
		if not Stance(monk_stance_of_the_fierce_tiger) Spell(stance_of_the_fierce_tiger)
		#snapshot_stats
	}
}

AddFunction WindwalkerReactCdActions
{
	#virmens_bite_potion
	if not InCombat() WindwalkerUsePotion()
	if IsFeared() or IsRooted() or IsStunned() Spell(nimble_brew)
	if target.Health() < Health() and BuffPresent(death_note) Spell(touch_of_death)
	Interrupt()
}

### Windwalker icons.

# Tier 5 damage reduction cooldown
AddIcon mastery=windwalker help=cd size=small checkboxon=opt_icons_left
{
	Tier5TalentActions()
}

# Tier 2 healing cooldown
AddIcon mastery=windwalker help=cd size=small checkboxon=opt_icons_left
{
	Tier2TalentActions()
}

AddIcon mastery=windwalker help=shortcd
{
	WindwalkerDefaultShortCdActions()
	WindwalkerSingleTargetShortCdActions()
}

AddIcon mastery=windwalker help=main
{
	WindwalkerPrecombatActions()
	WindwalkerDefaultActions()
	WindwalkerSingleTargetActions()
}

AddIcon mastery=windwalker help=aoe checkboxon=aoe
{
	WindwalkerPrecombatActions()
	WindwalkerDefaultActions()
	WindwalkerAoeActions()
}

AddIcon mastery=windwalker help=cd
{
	WindwalkerReactCdActions()
	WindwalkerDefaultCdActions()
}

AddIcon mastery=windwalker help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]]

	OvaleScripts:RegisterScript("MONK", name, desc, code)
end
