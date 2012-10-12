if NerienOvaleScripts.class == "MONK" then

NerienOvaleScripts.script.MONK.Nerien = {
	desc = "Nerien: Brewmaster, Windwalker",
	code =
[[
# Nerien's monk script based on SimulationCraft
#
# Windwalker
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#fb!022221

Define(ascension_talent 8)
Define(blackout_kick 100784)
	SpellInfo(blackout_kick chi=2)
	SpellAddBuff(blackout_kick combo_breaker_bok=0 shuffle=1)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire chi=2)
Define(chi_brew 115399)
	SpellInfo(chi_brew cd=90 chi=-4)
	SpellInfo(chi_brew chi=-5 talent=ascension_talent)
Define(chi_brew_talent 9)
Define(chi_burst 123986)
	SpellInfo(chi_burst chi=2)
Define(chi_burst_talent 6)
Define(chi_sphere 121286)
	SpellInfo(chi_sphere duration=120)
Define(chi_torpedo 115008)
Define(chi_torpedo_talent 18)
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=8 chi=2)
Define(chi_wave_talent 4)
Define(combo_breaker_bok 116768)
	SpellInfo(combo_breaker_bok duration=15)
Define(combo_breaker_tp 118864)
	SpellInfo(combo_breaker_tp duration=15)
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
	SpellAddBuff(elusive_brew_use elusive_brew=0 elusive_brew_use=1)
Define(energizing_brew 115288)
	SpellInfo(energizing_brew cd=60 duration=6 tick=1)
	SpellAddBuff(energizing_brew energizing_brew=1)
Define(expel_harm 115072)
	SpellInfo(expel_harm cd=15 chi=-1 energy=40)
	SpellInfo(expel_harm chi=-2 if_stance=1 mastery=3)
	SpellInfo(expel_harm chi=-2 if_stance=2)
Define(fists_of_fury 113656)
	SpellInfo(fists_of_fury cd=25 chi=3 duration=4 tick=1)
	SpellAddBuff(fists_of_fury fists_of_fury=1)
Define(flying_serpent_kick 101545)
	SpellInfo(flying_serpent_kick cd=25)
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=180)
Define(guard 115295)
	SpellInfo(guard cd=30 chi=2 duration=30)
	SpellAddBuff(guard guard=1 power_guard=0)
Define(heavy_stagger 124273)
	SpellInfo(heavy_stagger duration=10 tick=1)
Define(invoke_xuen 123904)
	SpellInfo(invoke_xuen cd=180 duration=45)
Define(invoke_xuen_the_white_tiger_talent 17)
Define(jab 100780)
	SpellInfo(jab chi=-1 energy=40)
	SpellInfo(jab chi=-2 if_stance=1 mastery=3)
	SpellInfo(jab chi=-2 if_stance=2)
Define(keg_smash 121253)
	SpellInfo(keg_smash cd=8 chi=-2 energy=40)
	SpellAddTargetDebuff(keg_smash dizzying_haze_aura=1 weakened_blows=1)
Define(legacy_of_the_emperor 115921)
	SpellInfo(legacy_of_the_emperor energy=50)
	SpellAddBuff(legacy_of_the_emperor legacy_of_the_emperor_aura=1)
Define(legacy_of_the_emperor_aura 117666)
	SpellInfo(legacy_of_the_emperor_aura duration=3600)
Define(legacy_of_the_white_tiger 116781)
	SpellInfo(legacy_of_the_white_tiger duration=3600)
	SpellAddBuff(legacy_of_the_white_tiger legacy_of_the_white_tiger=1)
Define(light_stagger 124275)
	SpellInfo(light_stagger duration=10 tick=1)
Define(moderate_stagger 124274)
	SpellInfo(moderate_stagger duration=10 tick=1)
Define(paralysis 115078)
	SpellInfo(paralysis cd=15 duration=30 energy=20)
	SpellAddTargetDebuff(paralysis paraylsis=1)
Define(power_guard 118636)
	SpellInfo(power_guard duration=30)
Define(power_strikes 121817)
Define(power_strikes_talent 7)
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=1 chi=1)
	SpellAddDebuff(purifying_brew heavy_stagger=0 light_stagger=0 moderate_stagger=0)
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
	SpellInfo(spear_hand_strike cd=15 energy=30)
	SpellInfo(spear_hand_strike energy=0 mastery=1)
Define(spinning_crane_kick 101546)
	SpellInfo(spinning_crane_kick duration=2.25 energy=40 tick=0.75)
	SpellAddBuff(spinning_crane_kick spinning_crane_kick=1)
Define(spinning_fire_blossom 115073)
	SpellInfo(spinning_fire_blossom chi=1)
Define(stance_of_the_fierce_tiger 103985)
Define(stance_of_the_sturdy_ox 115069)
Define(summon_black_ox_statue 115315)
	SpellInfo(summon_black_ox_statue cd=30)
Define(symbiosis_bear_hug 127361)
	SpellInfo(symbiosis_bear_hug cd=60 duration=3)
	SpellAddTargetDebuff(symbiosis_bear_hug symbiosis_bear_hug=1)
Define(symbiosis_survival_instincts 113306)
	SpellInfo(symbiosis_survival_instincts cd=180 duration=6)
	SpellAddBuff(symbiosis_survival_instincts symbiosis_survival_instincts=1)
Define(tiger_palm 100787)
	SpellInfo(tiger_palm chi=1)
	SpellInfo(tiger_palm chi=0 mastery=1) # with Brewmaster Training at level 34
	SpellAddBuff(tiger_palm combo_break_tp=0 power_guard=1 tiger_power=1)
Define(tiger_power 125359)
	SpellInfo(tiger_power duration=20)
Define(tigereye_brew 125195)
	SpellInfo(tigereye_brew duration=120)
Define(tigereye_brew_use 116740)
	SpellInfo(tigereye_brew_use cd=1 duration=15)
	SpellAddBuff(tigereye_brew_use tigereye_brew=0 tigereye_brew_use=1)
Define(touch_of_death 115080)
	SpellInfo(touch_of_death cd=90 chi=3)
Define(touch_of_karma 122470)
	SpellInfo(touch_of_karma cd=90 chi=2 duration=10)
	SpellAddTargetDebuff(touch_of_karma touch_of_karma=1)
Define(weakened_blows 115798)
	SpellInfo(weakened_blows duration=30)
Define(zen_sphere 124081)
	SpellInfo(zen_sphere chi=2 duration=16 tick=2)
Define(zen_sphere_talent 5)

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
	if TargetClassification(worldboss no)
	{
		Spell(arcane_torrent_chi)
		if TargetInRange(quaking_palm) Spell(quaking_palm)
	}
}

AddFunction UseRacialSurvivalActions
{
	Spell(stoneform)
}

AddCheckBox(aoe L(AOE))
AddCheckBox(potions "Use potions" default)

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

AddFunction Interrupt
{
	if TargetInRange(spear_hand_strike) Spell(spear_hand_strike)
	if TargetClassification(worldboss no) and TargetInRange(paralysis) Spell(paralysis)
	UseRacialInterruptActions()
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
# Single-target and AoE rotations from Alaron's 5.0 Brewmaster PvE Guide:
#	http://worldofmonkcraft.com/brewmaster-mists-of-pandaria-guide/

AddFunction BrewmasterOOCActions
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
	unless Stance(1) Spell(stance_of_the_sturdy_ox)
	unless BuffPresent(str_agi_int any=1) Spell(legacy_of_the_emperor)
}

AddFunction BrewmasterGenerateChiActions
{
	if NumberToMaxChi() >=1 and HealthPercent(less 35) Spell(expel_harm)
	if NumberToMaxChi() >=2 Spell(keg_smash)
	if NumberToMaxChi() >=1 and HealthPercent(less 90) Spell(expel_harm)
}

AddFunction BrewmasterMaintenanceActions
{
	if Level(more 33)
	{
		# Brewmaster Training is automatically learned at level 34 and makes Tiger Palm cost no chi.
		if BuffStacks(power_guard) <3 and BuffExpires(guard 6) Spell(tiger_palm)
		if BuffPresent(power_guard) and BuffExpires(power_guard 3) Spell(tiger_palm)
		if BuffPresent(tiger_power) and BuffExpires(tiger_power 3) Spell(tiger_palm)
	}
}

AddFunction BrewmasterFillerActions
{
	# Don't Tiger Palm before getting Brewmaster Training at level 34 since it costs Chi.
	if Level(more 33) Spell(tiger_palm)
	unless Level(more 33) Jab()
}

# Tier 5 damage reduction cooldown
AddIcon mastery=1 help=cd size=small
{
	Tier5TalentActions()
}

# Damage reduction cooldowns
AddIcon mastery=1 help=cd size=small
{
	Spell(fortifying_brew)
	Spell(symbiosis_survival_instincts)
	UseRacialSurvivalActions()
}

# Defensive abilities
AddIcon mastery=1 help=cd
{
	if DebuffPresent(moderate_stagger) or DebuffPresent(heavy_stagger) Spell(purifying_brew)
	if BuffStacks(elusive_brew) >10 Spell(elusive_brew_use)
	Spell(guard)
}

AddIcon mastery=1 help=main
{
	BrewmasterOOCActions()
	BrewmasterBuffActions()
	if BuffExpires(shuffle)
	{
		# Try to keep Shuffle uptime at 80-90%.
		Spell(blackout_kick)
	}
	if NumberToMaxChi() ==0 or {NumberToMaxChi() <2	and SpellCooldown(keg_smash) <1.5}
	{
		# Chi is capped or will cap with Keg Smash and KS coming off CD.
		Tier2TalentActions()
	}
	BrewmasterGenerateChiActions()
	if TimeToMaxEnergy() <1.2 Jab()
	BrewmasterMaintenanceActions()
	BrewmasterFillerActions()
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	BrewmasterOOCActions()
	BrewmasterBuffActions()
	if BuffExpires(shuffle)
	{
		# Try to keep Shuffle uptime at 80-90%.
		if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
		Spell(blackout_kick)
	}
	if NumberToMaxChi() ==0 or {NumberToMaxChi() <2 and SpellCooldown(keg_smash) <1.5}
	{
		# Chi is capped or will cap with Keg Smash and KS coming off CD.
		Spell(breath_of_fire)
	}
	BrewmasterGenerateChiActions()
	if TimeToMaxEnergy() <1.2 Spell(spinning_crane_kick)
	BrewmasterMaintenanceActions()
	BrewmasterFillerActions()
}

AddIcon mastery=1 help=cd
{
	if TargetIsInterruptible() Interrupt()
	if BuffPresent(death_note) Spell(touch_of_death)
	if TalentPoints(invoke_xuen_the_white_tiger_talent) Spell(invoke_xuen)
}

AddIcon mastery=1 help=cd size=small
{
	Spell(summon_black_ox_statue)
}

AddIcon mastery=1 help=cd size=small
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Windwalker
###

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
		if CheckBoxOn(potions) and TargetClassification(worldboss) Item(virmens_bite_potion usable=1)
	}

	#auto_attack
	if TargetIsInterruptible() Interrupt()
	if BuffExpires(str_agi_int any=1) Spell(legacy_of_the_emperor)
	if BuffExpires(critical_strike any=1) Spell(legacy_of_the_white_tiger)
	#chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
	#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
	if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(burst_haste any=1) or TargetTimeToDie() <=60}
	{
		Item(virmens_bite_potion usable=1)
	}
	#use_item,name=red_crane_grips
	UseItemActions()
	#berserking
	UseRacialActions()
	#chi_brew,if=talent.chi_brew.enabled&chi=0
	if TalentPoints(chi_brew_talent) and Chi() ==0 Spell(chi_brew)
	if BuffPresent(death_note) Spell(touch_of_death)
	#rising_sun_kick,if=!target.debuff.rising_sun_kick.remains|target.debuff.rising_sun_kick.remains<=3
	if TargetDebuffExpires(rising_sun_kick_aura 3) Spell(rising_sun_kick)
	#tiger_palm,if=buff.tiger_power.stack<3|buff.tiger_power.remains<=3
	if BuffExpires(tiger_power 3 stacks=3) Spell(tiger_palm)
	#tigereye_brew_use,if=!buff.tigereye_brew_use.up&buff.tigereye_brew.react=10
	if BuffExpires(tigereye_brew_use) and BuffStacks(tigereye_brew) >=10 Spell(tigereye_brew_use)
	#energizing_brew,if=energy.time_to_max>5
	if TimeToMaxEnergy() >5 Spell(energizing_brew)
	#invoke_xuen,if=talent.invoke_xuen.enabled
	if TalentPoints(invoke_xuen_the_white_tiger_talent) Spell(invoke_xuen)
	#run_action_list,name=aoe,if=active_enemies>=5
	#run_action_list,name=st,if=active_enemies<5

	if CheckBoxOn(aoe)
	{
		#rushing_jade_wind,if=talent.rushing_jade_wind.enabled
		if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
		#rising_sun_kick,if=chi=4
		if NumberToMaxChi() ==0 Spell(rising_sun_kick)
		#spinning_crane_kick
		Spell(spinning_crane_kick)
	}

	#rising_sun_kick
	Spell(rising_sun_kick)
	#fists_of_fury,if=!buff.energizing_brew.up&energy.time_to_max>(cast_time)&buff.tiger_power.remains>(cast_time)&buff.tiger_power.stack=3
	if BuffExpires(energizing_brew) and TimeToMaxEnergy() >4 and BuffPresent(tiger_power 4 stacks=3) Spell(fists_of_fury)
	#blackout_kick,if=buff.combo_breaker_bok.react
	if BuffPresent(combo_breaker_bok) Spell(blackout_kick)
	#blackout_kick,if=(chi>=3&energy.time_to_max<=2&!talent.ascension.enabled)|(chi>=4&energy.time_to_max<=2&talent.ascension.enabled)
	if NumberToMaxChi() <=1 and TimeToMaxEnergy() <=2 Spell(blackout_kick)
	#tiger_palm,if=(buff.combo_breaker_tp.react&energy.time_to_max>=2)|(buff.combo_breaker_tp.remains<=2&buff.combo_breaker_tp.react)
	if BuffPresent(combo_breaker_tp) and {TimeToMaxEnergy() >=2 or BuffExpires(combo_breaker_tp 2)} Spell(tiger_palm)
	if NumberToMaxChi() >=1 and HealthPercent(less 90) Spell(expel_harm)
	#jab,if=talent.ascension.enabled&chi<=3
	#jab,if=!talent.ascension.enabled&chi<=2
	if NumberToMaxChi() >=2 Jab()
	#blackout_kick,if=((energy+(energy.regen*(cooldown.rising_sun_kick.remains)))>=40)|\
	#	(chi=4&!talent.ascension.enabled)|(chi=5&talent.ascension.enabled)
	if {{Energy() + EnergyRegen() * SpellCooldown(rising_sun_kick)} >=40} or NumberToMaxChi() ==0 Spell(blackout_kick)
}

AddFunction WindwalkerMaintenanceActions
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

	#auto_attack
	if BuffExpires(str_agi_int any=1) Spell(legacy_of_the_emperor)
	if BuffExpires(critical_strike any=1) Spell(legacy_of_the_white_tiger)
	#chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
	#rising_sun_kick,if=!target.debuff.rising_sun_kick.remains|target.debuff.rising_sun_kick.remains<=3
	if TargetDebuffExpires(rising_sun_kick_aura 3) Spell(rising_sun_kick)
	#tiger_palm,if=buff.tiger_power.stack<3|buff.tiger_power.remains<=3
	if BuffExpires(tiger_power 3 stacks=3) Spell(tiger_palm)
}

AddFunction WindwalkerMainActions
{
	#rising_sun_kick
	Spell(rising_sun_kick)
	#blackout_kick,if=buff.combo_breaker_bok.react
	if BuffPresent(combo_breaker_bok) Spell(blackout_kick)
	#blackout_kick,if=(chi>=3&energy.time_to_max<=2&!talent.ascension.enabled)|(chi>=4&energy.time_to_max<=2&talent.ascension.enabled)
	if NumberToMaxChi() <=1 and TimeToMaxEnergy() <=2 Spell(blackout_kick)
	#tiger_palm,if=(buff.combo_breaker_tp.react&energy.time_to_max>=2)|(buff.combo_breaker_tp.remains<=2&buff.combo_breaker_tp.react)
	if BuffPresent(combo_breaker_tp) and {TimeToMaxEnergy() >=2 or BuffExpires(combo_breaker_tp 2)} Spell(tiger_palm)
	if NumberToMaxChi() >=1 and HealthPercent(less 90) Spell(expel_harm)
	#jab,if=talent.ascension.enabled&chi<=3
	#jab,if=!talent.ascension.enabled&chi<=2
	if NumberToMaxChi() >=2 Jab()
	#blackout_kick,if=((energy+(energy.regen*(cooldown.rising_sun_kick.remains)))>=40)|\
	#	(chi=4&!talent.ascension.enabled)|(chi=5&talent.ascension.enabled)
	if {{Energy() + EnergyRegen() * SpellCooldown(rising_sun_kick)} >=40} or NumberToMaxChi() ==0 Spell(blackout_kick)
}

AddFunction WindwalkerAoEActions
{
	#rising_sun_kick,if=chi=4
	if NumberToMaxChi() ==0 Spell(rising_sun_kick)
	#rushing_jade_wind,if=talent.rushing_jade_wind.enabled
	if TalentPoints(rushing_jade_wind_talent) Spell(rushing_jade_wind)
	#spinning_crane_kick
	Spell(spinning_crane_kick)
}

AddFunction WindwalkerShortCooldownActions
{
	unless {BuffExpires(str_agi_int any=1) or BuffExpires(critical_strike any=1)}
		or {TargetDebuffExpires(rising_sun_kick_aura 3) and Spell(rising_sun_kick)}
		or {BuffExpires(tiger_power 3 stacks=3) and Spell(tiger_palm)}
	{
		#tigereye_brew_use,if=!buff.tigereye_brew_use.up&buff.tigereye_brew.react=10
		if BuffExpires(tigereye_brew_use) and BuffStacks(tigereye_brew) >=10 Spell(tigereye_brew_use)
		#energizing_brew,if=energy.time_to_max>5
		if TimeToMaxEnergy() >5 Spell(energizing_brew)

		unless Spell(rising_sun_kick)
		{
			#fists_of_fury,if=!buff.energizing_brew.up&energy.time_to_max>(cast_time)&buff.tiger_power.remains>(cast_time)&buff.tiger_power.stack=3
			if BuffExpires(energizing_brew) and TimeToMaxEnergy() >4 and BuffPresent(tiger_power 4 stacks=3) Spell(fists_of_fury)
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
			if CheckBoxOn(potions) and TargetClassification(worldboss) Item(virmens_bite_potion usable=1)
		}
	}

	if TargetIsInterruptible() Interrupt()
	unless {BuffExpires(str_agi_int any=1) or BuffExpires(critical_strike any=1)}
	{
		#virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
		if CheckBoxOn(potions) and TargetClassification(worldboss) and {BuffPresent(burst_haste any=1) or TargetTimeToDie() <=60}
		{
			Item(virmens_bite_potion usable=1)
		}
		#use_item,name=red_crane_grips
		UseItemActions()
		#berserking
		UseRacialActions()
		#chi_brew,if=talent.chi_brew.enabled&chi=0
		if TalentPoints(chi_brew_talent) and Chi() ==0 Spell(chi_brew)
		if BuffPresent(death_note) Spell(touch_of_death)

		unless {TargetDebuffExpires(rising_sun_kick_aura 3) and Spell(rising_sun_kick)}
			or {BuffExpires(tiger_power 3 stacks=3) and Spell(tiger_palm)}
			or {BuffExpires(tigereye_brew_use) and BuffStacks(tigereye_brew) >=10 and Spell(tigereye_brew_use)}
			or {TimeToMaxEnergy() >5 and Spell(energizing_brew)}
		{
			#invoke_xuen,if=talent.invoke_xuen.enabled
			if TalentPoints(invoke_xuen_the_white_tiger_talent) Spell(invoke_xuen)
		}
	}
}

# Tier 5 damage reduction cooldown
AddIcon mastery=3 help=cd size=small
{
	Tier5TalentActions()
}

# Tier 2 healing cooldown
AddIcon mastery=3 help=cd size=small
{
	Tier2TalentActions()
}

AddIcon mastery=3 help=cd
{
	WindwalkerShortCooldownActions()
}

AddIcon mastery=3 help=main
{
	WindwalkerMaintenanceActions()
	WindwalkerMainActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	WindwalkerMaintenanceActions()
	WindwalkerAoEActions()
}

AddIcon mastery=3 help=cd
{
	WindwalkerCooldownActions()
}

AddIcon mastery=3 help=cd size=small
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]],
}

end