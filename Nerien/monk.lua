local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.MONK.Nerien = {
	desc = "[5.2] Nerien: Brewmaster, Windwalker",
	code =
[[
# Nerien's monk script based on SimulationCraft
#
# Windwalker
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#fb!021221

Define(ascension_talent 8)
Define(blackout_kick 100784)
	SpellInfo(blackout_kick chi=2)
	SpellAddBuff(blackout_kick combo_breaker_bok=0 muscle_memory=0 shuffle=1)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire chi=2)
Define(brewmaster_training 117967)
Define(charging_ox_wave 119392)
	SpellInfo(charging_ox_wave cd=30)
Define(charging_ox_wave_talent 11)
Define(chi_brew 115399)
	SpellInfo(chi_brew cd=90 chi=-4)
	SpellInfo(chi_brew chi=-5 talent=ascension_talent)
	SpellAddBuff(chi_brew healing_elixirs=0)
Define(chi_brew_talent 9)
Define(chi_burst 123986)
	SpellInfo(chi_burst cd=30)
Define(chi_burst_talent 6)
Define(chi_sphere 121286)
	SpellInfo(chi_sphere duration=120)
Define(chi_torpedo 115008)
Define(chi_torpedo_talent 18)
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=15)
Define(chi_wave_talent 4)
Define(combo_breaker_bok 116768)
	SpellInfo(combo_breaker_bok duration=15)
Define(combo_breaker_tp 118864)
	SpellInfo(combo_breaker_tp duration=15)
#Define(crackling_jade_lightning 117952)
#	SpellAddBuff(crackling_jade_lightning power_strikes=0)
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
	SpellInfo(disable duration=15 energy=15)
	SpellAddTargetDebuff(disable disable=1)
Define(dizzying_haze 115180)
	SpellInfo(dizzying_haze energy=20)
Define(dizzying_haze_aura 116330)
	SpellInfo(dizzying_haze_aura duration=15)
Define(elusive_brew 128939)
	SpellInfo(elusive_brew duration=30)
Define(elusive_brew_use 115308)
	SpellInfo(elusive_brew_use cd=9 duration=1)
	SpellAddBuff(elusive_brew_use elusive_brew=0 elusive_brew_use=1 healing_elixirs=0)
Define(energizing_brew 115288)
	SpellInfo(energizing_brew cd=60 duration=6 tick=1)
	SpellInfo(energizing_brew addduration=5 itemset=T14_melee itemcount=4)
	SpellAddBuff(energizing_brew energizing_brew=1 healing_elixirs=0)
Define(expel_harm 115072)
	SpellInfo(expel_harm cd=15 chi=-2 energy=40)
	SpellInfo(expel_harm chi=-1 if_stance=monk_stance_of_the_sturdy_ox)
	SpellInfo(expel_harm chi=-1 if_stance=monk_stance_of_the_wise_serpent)
Define(fists_of_fury 113656)
	SpellInfo(fists_of_fury canStopChannelling=4 cd=25 chi=3 tick=1)
	SpellInfo(fists_of_fury addcd=-5 itemset=T14_melee itemcount=2)
	SpellAddBuff(fists_of_fury fists_of_fury=1)
Define(flying_serpent_kick 101545)
	SpellInfo(flying_serpent_kick cd=25)
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=180)
	SpellAddBuff(fortifying_brew healing_elixirs=0)
#Define(fortifying_brew_glyphed 120954)
#	SpellInfo(fortifying_brew_glyphed duration=20)
Define(glyph_of_guard 123401)
Define(glyph_of_retreat 124969)
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
Define(invoke_xuen_the_white_tiger_talent 17)
Define(jab 100780)
	SpellInfo(jab buff_chi=power_strikes chi=-2 energy=40)
	SpellInfo(jab chi=-1 if_stance=monk_stance_of_the_sturdy_ox)
	SpellInfo(jab chi=-1 if_stance=monk_stance_of_the_wise_serpent)
	SpellAddBuff(jab power_strikes=0)
Define(keg_smash 121253)
	SpellInfo(keg_smash cd=8 chi=-2 energy=40)
	SpellAddTargetDebuff(keg_smash dizzying_haze_aura=1 weakened_blows=1)
Define(healing_elixirs 134563)
Define(healing_elixirs_talent 13)
Define(legacy_of_the_emperor 115921)
	SpellInfo(legacy_of_the_emperor energy=20)
	SpellAddBuff(legacy_of_the_emperor legacy_of_the_emperor_aura=1)
Define(legacy_of_the_emperor_aura 117666)
	SpellInfo(legacy_of_the_emperor_aura duration=3600)
Define(legacy_of_the_white_tiger 116781)
	SpellInfo(legacy_of_the_white_tiger duration=3600 energy=20)
	SpellAddBuff(legacy_of_the_white_tiger legacy_of_the_white_tiger=1)
Define(light_stagger 124275)
	SpellInfo(light_stagger duration=10 tick=1)
Define(moderate_stagger 124274)
	SpellInfo(moderate_stagger duration=10 tick=1)
Define(muscle_memory 139597)
	SpellInfo(muscle_memory duration=15)
Define(nimble_brew 137562)
	SpellInfo(nimble_brew cd=120 duration=6)
	SpellAddBuff(nimble_brew healing_elixirs=0 nimble_brew=1)
Define(paralysis 115078)
	SpellInfo(paralysis cd=15 duration=40 energy=20)
	SpellAddTargetDebuff(paralysis paraylsis=1)
Define(power_guard 118636)
	SpellInfo(power_guard duration=30)
Define(power_strikes 129914)
Define(power_strikes_talent 7)
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=1 chi=1)
	SpellAddDebuff(purifying_brew healing_elixirs=0 heavy_stagger=0 light_stagger=0 moderate_stagger=0)
Define(retreat 124968)
	SpellInfo(retreat duration=10)
Define(ring_of_peace 116844)
	SpellInfo(ring_of_peace cd=45 duration=8)
Define(ring_of_peace_talent 10)
Define(rising_sun_kick 107428)
	SpellInfo(rising_sun_kick cd=8 chi=2)
	SpellAddTargetDebuff(rising_sun_kick rising_sun_kick_aura=1)
Define(rising_sun_kick_aura 130320)
	SpellInfo(rising_sun_kick_aura duration=15)
Define(rushing_jade_wind 116847)
	SpellInfo(rushing_jade_wind cd=30 chi=2 duration=8)
	SpellAddBuff(rushing_jade_wind shuffle=1)
	SpellAddTargetDebuff(rushing_jade_wind rushing_jade_wind=1)
Define(rushing_jade_wind_talent 16)
Define(sanctuary_of_the_ox 126119)
Define(shuffle 115307)
	SpellInfo(shuffle duration=6)
Define(spear_hand_strike 116705)
	SpellInfo(spear_hand_strike cd=10 energy=10)
	SpellInfo(spear_hand_strike energy=0 if_stance=monk_stance_of_the_sturdy_ox)
Define(spinning_crane_kick 101546)
	SpellInfo(spinning_crane_kick energy=40)
	SpellAddBuff(spinning_crane_kick spinning_crane_kick=1)
Define(spinning_fire_blossom 115073)
	SpellInfo(spinning_fire_blossom chi=1)
Define(stance_of_the_fierce_tiger 103985)
Define(stance_of_the_sturdy_ox 115069)
Define(storm_earth_and_fire 137639)
	SpellInfo(storm_earth_and_fire energy=10)
	SpellAddBuff(storm_earth_and_fire storm_earth_and_fire=1)
Define(summon_black_ox_statue 115315)
	SpellInfo(summon_black_ox_statue cd=30)
Define(symbiosis_bear_hug 127361)
	SpellInfo(symbiosis_bear_hug cd=60 duration=3)
	SpellAddTargetDebuff(symbiosis_bear_hug symbiosis_bear_hug=1)
Define(symbiosis_survival_instincts 113306)
	SpellInfo(symbiosis_survival_instincts cd=180 duration=6)
	SpellAddBuff(symbiosis_survival_instincts symbiosis_survival_instincts=1)
Define(teachings_of_the_monastery 116645)
Define(tiger_palm 100787)
	SpellInfo(tiger_palm chi=1)
	SpellInfo(tiger_palm chi=0 if_spell=brewmaster_training)
	SpellAddBuff(tiger_palm combo_break_tp=0 muscle_memory=0 power_guard=1 tiger_power=1)
Define(tiger_power 125359)
	SpellInfo(tiger_power duration=20)
Define(tigereye_brew 125195)
	SpellInfo(tigereye_brew duration=120)
Define(tigereye_brew_use 116740)
	SpellInfo(tigereye_brew_use cd=1 duration=15)
	SpellAddBuff(tigereye_brew_use healing_elixirs=0 tigereye_brew=-10 tigereye_brew_use=1)
Define(tigers_lust 116841)
	SpellInfo(tigers_lust cd=30 duration=6)
	SpellAddBuff(tigers_lust tigers_lust=1)
Define(tigers_lust_talent 2)
Define(touch_of_death 115080)
	SpellInfo(touch_of_death cd=90 chi=3)
Define(touch_of_karma 122470)
	SpellInfo(touch_of_karma cd=90 duration=10)
	SpellAddTargetDebuff(touch_of_karma touch_of_karma=1)
Define(weakened_blows 115798)
	SpellInfo(weakened_blows duration=30)
Define(zen_sphere 124081)
	SpellInfo(zen_sphere cd=10 duration=16 tick=2)
Define(zen_sphere_talent 5)

# Items
Define(virmens_bite_potion 76089)
Define(virmens_bite_potion_buff 105697)
	SpellInfo(virmens_bite_potion_buff duration=25)
Define(jade_serpent_potion 76093)
Define(jade_serpent_potion_buff 105702)
	SpellInfo(jade_serpent_potion_buff duration=25)

# Rune of Re-Origination
ItemList(rune_of_reorigination 94532 95802 96546)
Define(rune_of_reorigination_crit_buff 139117)
	SpellInfo(rune_of_reorigination_crit_buff duration=10)
Define(rune_of_reorigination_haste_buff 139121)
	SpellInfo(rune_of_reorigination_haste_buff duration=10)
Define(rune_of_reorigination_mastery_buff 139120)
	SpellInfo(rune_of_reorigination_mastery_buff duration=10)
SpellList(rune_of_reorigination_buff rune_of_reorigination_crit_buff rune_of_reorigination_haste_buff rune_of_reorigination_mastery_buff)

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
	if List(opt_expel_harm_threshold 90percent) and HealthPercent() <90 Spell(expel_harm)
	if List(opt_expel_harm_threshold 80percent) and HealthPercent() <80 Spell(expel_harm)
	if List(opt_expel_harm_threshold 70percent) and HealthPercent() <70 Spell(expel_harm)
	if List(opt_expel_harm_threshold 60percent) and HealthPercent() <60 Spell(expel_harm)
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
	# Always display the "fist" jab texture when suggesting Jab.
	if Spell(jab) Texture(ability_monk_jab)
}

AddFunction NumberToMaxChi
{
	if TalentPoints(ascension_talent) {5 - Chi()}
	unless TalentPoints(ascension_talent) {4 - Chi()}
}

AddFunction Tier2TalentActions
{
	if TalentPoints(chi_burst_talent) Spell(chi_burst)
	if TalentPoints(chi_wave_talent) Spell(chi_wave)
	if TalentPoints(zen_sphere_talent) and BuffExpires(zen_sphere) Spell(zen_sphere)
}

AddFunction Tier5TalentActions
{
	if TalentPoints(dampen_harm_talent) Spell(dampen_harm)
	if TalentPoints(diffuse_magic_talent) Spell(diffuse_magic)
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
	unless Stance(monk_stance_of_the_sturdy_ox) Spell(stance_of_the_sturdy_ox)
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
		if BuffExpires(tiger_power) Spell(tiger_palm)
	}
}

AddFunction BrewmasterFillerActions
{
	Tier2TalentActions()
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

AddFunction BrewmasterShuffle
{
	Spell(blackout_kick)
}

AddFunction BrewmasterAoEShuffle
{
	if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
	Spell(blackout_kick)
}

# Aggressive Jab for maximizing DPS/TPS.
AddCheckBox(opt_aggressive_jab SpellName(jab) mastery=1)

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

# Tier 5 damage reduction cooldown
AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_left
{
	Tier5TalentActions()
}

# Damage reduction cooldowns
AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_left
{
	Spell(fortifying_brew)
	Spell(symbiosis_survival_instincts)
	UseRacialSurvivalActions()
}

# Defensive abilities
AddIcon mastery=1 help=cd
{
	# Cast Purifying Brew only if Heavy Stagger (urgent!) or if Shuffle uptime won't suffer.
	# Avoid Purifying while Elusive Brew is up unless under Heavy Stagger.
	if DebuffPresent(heavy_stagger)
		or {BuffExpires(elusive_brew) and {BuffPresent(shuffle 6) or Chi() >=2}}
	{
		BrewmasterPurifyingBrew()
	}
	if BuffStacks(elusive_brew) >10 Spell(elusive_brew_use)
	if BuffPresent(power_guard)
	{
		if Glyph(glyph_of_guard) and BuffExpires(guard_glyphed) Spell(guard_glyphed)
		if Glyph(glyph_of_guard no) and BuffExpires(guard) Spell(guard)
	}
}

AddIcon mastery=1 help=main
{
	BrewmasterPreCombatActions()
	BrewmasterBuffActions()

	if BuffExpires(shuffle 2)
	{
		BrewmasterShuffle()
	}
	if NumberToMaxChi() >=2 Spell(keg_smash)
	if NumberToMaxChi() >=1 and HealthPercent() <35 Spell(expel_harm)
	BrewmasterMaintenanceActions()
	if NumberToMaxChi() ==0
	{
		BrewmasterShuffle()
	}
	if BrewmasterEnergyPoolingCondition()
		and {SpellCooldown(keg_smash) > GCD()}
		and {Energy() - SpellData(jab energy) + SpellCooldown(keg_smash) * EnergyRegen() > SpellData(keg_smash energy)}
	{
		# Only Jab or Expel Harm if we'll have enough energy to Keg Smash when it comes off cooldown.
		ExpelHarm()
		Jab()
	}
	if NumberToMaxChi() <2
	{
		BrewmasterShuffle()
	}
	BrewmasterFillerActions()
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	BrewmasterPreCombatActions()
	BrewmasterBuffActions()

	if BuffExpires(shuffle 2)
	{
		BrewmasterAoEShuffle()
	}
	if NumberToMaxChi() >=2 Spell(keg_smash)
	BrewmasterMaintenanceActions()
	if NumberToMaxChi() ==0
	{
		if BuffPresent(shuffle 6) Spell(breath_of_fire)
		BrewmasterAoEShuffle()
	}
	if BrewmasterEnergyPoolingCondition()
		and {SpellCooldown(keg_smash) >2}
		and {Energy() - SpellData(spinning_crane_kick energy) + SpellCooldown(keg_smash) * EnergyRegen() > SpellData(keg_smash energy)}
	{
		# Only SCK if we'll have enough energy to Keg Smash when it comes off cooldown.
		# The channel time of SCK is 2s, so only SCK if Keg Smash is on CD for at least 2s.
		Spell(spinning_crane_kick)
	}
	if NumberToMaxChi() <2
	{
		if BuffPresent(shuffle 6) Spell(breath_of_fire)
		BrewmasterAoEShuffle()
	}
	BrewmasterFillerActions()
}

AddIcon mastery=1 help=cd
{
	if IsFeared() or IsRooted() or IsStunned() Spell(nimble_brew)
	Interrupt()
	if target.Health() < Health() and BuffPresent(death_note) Spell(touch_of_death)
	if TalentPoints(invoke_xuen_the_white_tiger_talent) Spell(invoke_xuen)
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	if BuffExpires(sanctuary_of_the_ox) Spell(summon_black_ox_statue)
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Windwalker
###

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

AddFunction WindwalkerTigereyeBrewConditions
{
	#if ( find_item( "rune_of_reorigination" ) )
	#	tigereye_brew,line_cd=15,if=buff.rune_of_reorigination.react&(buff.rune_of_reorigination.remains<=1|(buff.tigereye_brew_use.down&cooldown.rising_sun_kick.remains=0&chi>=2&target.debuff.rising_sun_kick.remains&buff.tiger_power.remains))
	#	tigereye_brew,if=!buff.tigereye_brew_use.up&(buff.tigereye_brew.react>19|target.time_to_die<20)
	#else
	#	tigereye_brew,if=buff.tigereye_brew_use.down&cooldown.rising_sun_kick.remains=0&chi>=2&target.debuff.rising_sun_kick.remains&buff.tiger_power.remains
	#
	{BuffPresent(rune_of_reorigination_buff) and BuffRemains(rune_of_reorigination_buff) <=1}
		or {{not HasTrinket(rune_of_reorigination) or BuffPresent(rune_of_reorigination_buff)}
			and BuffExpires(tigereye_brew_use) and Spell(rising_sun_kick) and Chi() >=2
			and target.DebuffPresent(rising_sun_kick_aura) and BuffPresent(tiger_power)}
		or {HasTrinket(rune_of_reorigination)
			and BuffExpires(tigereye_brew_use) and {BuffStacks(tigereye_brew) >19 or target.TimeToDie() <20}}
}


AddFunction WindwalkerFullRotation
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		if BuffExpires(str_agi_int 400 any=1) Spell(legacy_of_the_emperor)
		if BuffExpires(critical_strike 400 any=1) Spell(legacy_of_the_white_tiger)
		#stance
		#snapshot_stats
		#virmens_bite_potion
		WindwalkerUsePotion()
	}

	if IsFeared() or IsRooted() or IsStunned() Spell(nimble_brew)
	#auto_attack
	if target.Health() < Health() and BuffPresent(death_note) Spell(touch_of_death)
	Interrupt()
	if BuffExpires(str_agi_int any=1) Spell(legacy_of_the_emperor)
	if BuffExpires(critical_strike any=1) Spell(legacy_of_the_white_tiger)
	#chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <=60 WindwalkerUsePotion()
	#use_item,name=red_crane_grips
	UseItemActions()
	#berserking
	UseRacialActions()
	#chi_brew,if=talent.chi_brew.enabled&chi=0
	if TalentPoints(chi_brew_talent) and Chi() ==0 Spell(chi_brew)
	#tiger_palm,if=buff.tiger_power.remains<=3
	if BuffExpires(tiger_power 3) Spell(tiger_palm)
	if WindwalkerTigereyeBrewConditions() Spell(tigereye_brew_use)
	#energizing_brew,if=energy.time_to_max>5
	if InCombat() and TimeToMaxEnergy() >5 Spell(energizing_brew)
	#rising_sun_kick,if=!target.debuff.rising_sun_kick.remains
	if target.DebuffExpires(rising_sun_kick_aura) Spell(rising_sun_kick)
	#tiger_palm,if=buff.tiger_power.down&target.debuff.rising_sun_kick.remains>1&energy.time_to_max>1
	if BuffExpires(tiger_power) and target.DebuffRemains(rising_sun_kick_aura) >1 and TimeToMaxEnergy() >1 Spell(tiger_palm)
	#invoke_xuen,if=talent.invoke_xuen.enabled
	if TalentPoints(invoke_xuen_the_white_tiger_talent) Spell(invoke_xuen)
	#run_action_list,name=aoe,if=active_enemies>=5
	#run_action_list,name=st,if=active_enemies<5

	if CheckBoxOn(aoe)
	{
		#rushing_jade_wind,if=talent.rushing_jade_wind.enabled
		if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
		#fists_of_fury
		Spell(fists_of_fury)
		#rising_sun_kick,if=chi=4
		if Chi() >=4 Spell(rising_sun_kick)
		#spinning_crane_kick
		Spell(spinning_crane_kick)
	}

	#rising_sun_kick
	Spell(rising_sun_kick)
	#fists_of_fury,if=!buff.energizing_brew.up&energy.time_to_max>4&buff.tiger_power.remains>4
	if BuffExpires(energizing_brew) and TimeToMaxEnergy() >timeWithHaste(4) and BuffRemains(tiger_power) >timeWithHaste(4) Spell(fists_of_fury)
	#chi_wave,if=talent.chi_wave.enabled&energy.time_to_max>2
	if TalentPoints(chi_wave_talent) and TimeToMaxEnergy() >2 Spell(chi_wave)
	#blackout_kick,if=buff.combo_breaker_bok.react
	if BuffPresent(combo_breaker_bok) Spell(blackout_kick)
	#tiger_palm,if=(buff.combo_breaker_tp.react&energy.time_to_max>=2)|(buff.combo_breaker_tp.remains<=2&buff.combo_breaker_tp.react)
	if BuffPresent(combo_breaker_tp)
	{
		if BuffRemains(combo_breaker_tp) <=2 or TimeToMaxEnergy() >=2 Spell(tiger_palm)
	}
	#jab,if=talent.ascension.enabled&chi<=3
	#jab,if=!talent.ascension.enabled&chi<=2
	if NumberToMaxChi() >2 WindwalkerGenerateChi()
	#blackout_kick,if=(energy+(energy.regen*(cooldown.rising_sun_kick.remains)))>=40
	if {Energy() + EnergyRegen() * SpellCooldown(rising_sun_kick)} >=40 Spell(blackout_kick)
}

AddFunction WindwalkerPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		if BuffExpires(str_agi_int 400 any=1) Spell(legacy_of_the_emperor)
		if BuffExpires(critical_strike 400 any=1) Spell(legacy_of_the_white_tiger)
		#stance
		#snapshot_stats
	}
}

AddFunction WindwalkerMaintenanceActions
{
	#auto_attack
	if BuffExpires(str_agi_int any=1) Spell(legacy_of_the_emperor)
	if BuffExpires(critical_strike any=1) Spell(legacy_of_the_white_tiger)
	#chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
	#tiger_palm,if=buff.tiger_power.remains<=3
	if BuffExpires(tiger_power 3) Spell(tiger_palm)
	#rising_sun_kick,if=!target.debuff.rising_sun_kick.remains
	if target.DebuffExpires(rising_sun_kick_aura) Spell(rising_sun_kick)
	#tiger_palm,if=buff.tiger_power.down&target.debuff.rising_sun_kick.remains>1&energy.time_to_max>1
	if BuffExpires(tiger_power) and target.DebuffRemains(rising_sun_kick_aura) >1 and TimeToMaxEnergy() >1 Spell(tiger_palm)
}

AddFunction WindwalkerMainActions
{
	#rising_sun_kick
	Spell(rising_sun_kick)
	#chi_wave,if=talent.chi_wave.enabled&energy.time_to_max>2
	if TalentPoints(chi_wave_talent) and TimeToMaxEnergy() >2 Spell(chi_wave)
	#blackout_kick,if=buff.combo_breaker_bok.react
	if BuffPresent(combo_breaker_bok) Spell(blackout_kick)
	#tiger_palm,if=(buff.combo_breaker_tp.react&energy.time_to_max>=2)|(buff.combo_breaker_tp.remains<=2&buff.combo_breaker_tp.react)
	if BuffPresent(combo_breaker_tp)
	{
		if BuffRemains(combo_breaker_tp) <=2 or TimeToMaxEnergy() >=2 Spell(tiger_palm)
	}
	#jab,if=talent.ascension.enabled&chi<=3
	#jab,if=!talent.ascension.enabled&chi<=2
	if NumberToMaxChi() >2 WindwalkerGenerateChi()
	#blackout_kick,if=(energy+(energy.regen*(cooldown.rising_sun_kick.remains)))>=40
	if {Energy() + EnergyRegen() * SpellCooldown(rising_sun_kick)} >=40 Spell(blackout_kick)
}

AddFunction WindwalkerAoEActions
{
	#rushing_jade_wind,if=talent.rushing_jade_wind.enabled
	if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
	#fists_of_fury
	Spell(fists_of_fury)
	#rising_sun_kick,if=chi=4
	if Chi() >=4 Spell(rising_sun_kick)
	#spinning_crane_kick
	Spell(spinning_crane_kick)
}

AddFunction WindwalkerShortCooldownActions
{
	unless {BuffExpires(tiger_power 3) and Spell(tiger_palm)}
	{
		if WindwalkerTigereyeBrewConditions() Spell(tigereye_brew_use)
		#energizing_brew,if=energy.time_to_max>5
		if InCombat() and TimeToMaxEnergy() >5 Spell(energizing_brew)

		unless {target.DebuffExpires(rising_sun_kick_aura) and Spell(rising_sun_kick)}
			or {BuffExpires(tiger_power) and target.DebuffRemains(rising_sun_kick_aura) >1 and TimeToMaxEnergy() >1 and Spell(tiger_palm)}
			or Spell(rising_sun_kick)
		{
			#fists_of_fury,if=!buff.energizing_brew.up&energy.time_to_max>4&buff.tiger_power.remains>4
			if BuffExpires(energizing_brew) and TimeToMaxEnergy() >timeWithHaste(4) and BuffRemains(tiger_power) >timeWithHaste(4) Spell(fists_of_fury)
		}
	}
}

AddFunction WindwalkerCooldownActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		unless {BuffExpires(str_agi_int 400 any=1) or BuffExpires(critical_strike 400 any=1)}
		{
			#virmens_bite_potion
			WindwalkerUsePotion()
		}
	}

	if IsFeared() or IsRooted() or IsStunned() Spell(nimble_brew)
	if target.Health() < Health() and BuffPresent(death_note) Spell(touch_of_death)
	Interrupt()
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if BuffPresent(burst_haste any=1) or target.TimeToDie() <=60 WindwalkerUsePotion()
	#use_item,name=red_crane_grips
	UseItemActions()
	#berserking
	UseRacialActions()
	#chi_brew,if=talent.chi_brew.enabled&chi=0
	if TalentPoints(chi_brew_talent) and Chi() ==0 Spell(chi_brew)

	unless {BuffExpires(tiger_power 3) and Spell(tiger_palm)}
		or {WindwalkerTigereyeBrewConditions() and Spell(tigereye_brew_use)}
	{
		#invoke_xuen,if=talent.invoke_xuen.enabled
		if TalentPoints(invoke_xuen_the_white_tiger_talent) Spell(invoke_xuen)
	}
}

# Tier 5 damage reduction cooldown
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	Tier5TalentActions()
}

# Tier 2 healing cooldown
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	Tier2TalentActions()
}

AddIcon mastery=3 help=shortcd
{
	WindwalkerShortCooldownActions()
}

AddIcon mastery=3 help=main
{
	WindwalkerPreCombatActions()
	WindwalkerMaintenanceActions()
	WindwalkerMainActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	WindwalkerPreCombatActions()
	WindwalkerMaintenanceActions()
	WindwalkerAoEActions()
}

AddIcon mastery=3 help=cd
{
	WindwalkerCooldownActions()
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]],
}
