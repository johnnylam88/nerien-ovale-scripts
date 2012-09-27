NerienOvaleScripts.script.MONK.Nerien = {
	desc = "Nerien: Brewmaster (leveling)",
	code =
[[
# Nerien's monk script.

Define(ascension_talent 8)
Define(blackout_kick 100784)
	SpellInfo(blackout_kick chi=2)
	SpellAddBuff(blackout_kick shuffle=1)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire chi=2)
Define(chi_brew 115399)
	SpellInfo(chi_brew chi=-4 cd=90)
Define(chi_brew_talent 9)
Define(chi_burst 123986)
	SpellInfo(chi_burst chi=2)
Define(chi_burst_talent 6)
Define(chi_sphere 121286)
	SpellInfo(chi_sphere duration=120)
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=8 chi=2)
Define(chi_wave_talent 4)
Define(combo_breaker_bok 116768)
	SpellInfo(combo_breaker_bok duration=15)
	SpellAddBuff(combo_breaker_bok combo_breaker_bok=1)
Define(combo_breaker_tp 118864)
	SpellInfo(combo_breaker_tp duration=15)
	SpellAddBuff(combo_breaker_tp combo_breaker_tp=1)
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
	SpellInfo(energizing_brew duration=6 cd=60)
	SpellAddBuff(energizing_brew energizing_brew=1)
Define(expel_harm 115072)
	SpellInfo(expel_harm cd=15 chi=-1 energy=40)
Define(fists_of_fury 113656)
	SpellInfo(fists_of_fury duration=4 chi=3 cd=25)
	SpellAddBuff(fists_of_fury fists_of_fury=1)
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=180)
Define(guard 115295)
	SpellInfo(guard cd=30 chi=2 duration=30)
	SpellAddBuff(guard guard=1)
Define(heavy_stagger 124273)
	SpellInfo(heavy_stagger duration=10 tick=1)
Define(invoke_xuen 123904)
	SpellInfo(invoke_xuen duration=45 cd=180)
Define(invoke_xuen_the_white_tiger_talent 17)
Define(jab 100780)
	SpellInfo(jab chi=-1 energy=40)
Define(keg_smash 121253)
	SpellInfo(keg_smash cd=8 chi=-2 energy=40)
	SpellAddTargetDebuff(keg_smash dizzying_haze_aura=1 weakened_blows=1)
Define(legacy_of_the_emperor 115921)
	SpellInfo(legacy_of_the_emperor energy=50)
	SpellAddBuff(legacy_of_the_emperor legacy_of_the_emperor_aura=1)
Define(legacy_of_the_emperor_aura 117666)
	SpellInfo(legacy_of_the_emperor_aura duration=3600)
Define(light_stagger 124275)
	SpellInfo(light_stagger duration=10 tick=1)
Define(moderate_stagger 124274)
	SpellInfo(moderate_stagger duration=10 tick=1)
Define(power_guard 118636)
	SpellInfo(power_guard duration=30)
Define(power_strikes 121817)
Define(power_strikes_talent 7)
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=1 chi=1)
	SpellAddDebuff(purifying_brew heavy_stagger=0 light_stagger=0 moderate_stagger=0)
Define(rising_sun_kick 107428)
	SpellInfo(rising_sun_kick chi=2 cd=8)
Define(rushing_jade_wind 116847)
	SpellInfo(rushing_jade_wind duration=8 chi=2 cd=30)
	SpellAddBuff(rushing_jade_wind rushing_jade_wind=1)
Define(rushing_jade_wind_talent 16)
Define(shuffle 115307)
	SpellInfo(shuffle duration=6)
Define(spear_hand_strike 116705)
	SpellInfo(spear_hand_strike cd=15 energy=30)
	SpellInfo(spear_hand_strike energy=0 mastery=1)
Define(spinning_crane_kick 101546)
	SpellInfo(spinning_crane_kick duration=2.25 energy=40 tick=0.75)
	SpellAddBuff(spinning_crane_kick spinning_crane_kick=1)
Define(stance_of_the_fierce_tiger 103985)
Define(stance_of_the_sturdy_ox 115069)
Define(summon_black_ox_statue 115315)
	SpellInfo(summon_black_ox_statue cd=30)
Define(tiger_palm 100787)
	SpellInfo(tiger_palm chi=1)
	SpellInfo(tiger_palm chi=0 mastery=1) # with Brewmaster Training at level 34
	SpellAddBuff(tiger_palm power_guard=1 tiger_power=1)
Define(tiger_power 125359)
	SpellInfo(tiger_power duration=20)
	SpellAddBuff(tiger_power tiger_power=1)
Define(tigereye_brew 125195)
	SpellInfo(tigereye_brew duration=120)
Define(tigereye_brew_use 116740)
	SpellInfo(tigereye_brew_use duration=15 cd=1)
	SpellAddBuff(tigereye_brew_use tigereye_brew=0 tigereye_brew_use=1)
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
Define(berserking 26297)
	SpellInfo(berserking cd=180 duration=10 sharedcd=racial)
	SpellAddBuff(berserking berserking=1)
Define(blood_fury 20572)
	SpellInfo(blood_fury cd=120 duration=15 sharedcd=racial)
	SpellAddBuff(blood_fury blood_fury=1)
Define(quaking_palm 107079)
	SpellInfo(quaking_palm cd=120 duration=4 sharedcd=racial)
	SpellAddTargetDebuff(quaking_palm quaking_palm=1)
Define(stoneform 20594)
	SpellInfo(stoneform cd=120 duration=8 sharedcd=racial)
	SpellAddBuff(stoneform stoneform=1)

AddFunction UseRacialActions
{
	Spell(berserking)
	Spell(blood_fury)
}

AddFunction UseRacialInterruptActions
{
	if not TargetClassification(worldboss) and TargetInRange(quaking_palm) Spell(quaking_palm)
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

AddCheckBox(targetdummy "Target Dummy")
AddFunction TimeUntilTargetIsDead
{
	if CheckBoxOn(targetdummy) 3600
	if CheckBoxOff(targetdummy) target.TimeToDie()
}

###
### Monk (all specializations)
###

AddFunction Interrupt
{
	if TargetInRange(spear_hand_strike) Spell(spear_hand_strike)
	UseRacialInterruptActions()
}

AddFunction NumberToMaxChi
{
	if TalentPoints(ascension_talent) {5 - Chi()}
	unless TalentPoints(ascension_talent) {4 - Chi()}
}

AddFunction MonkTier2TalentActions
{
	if TalentPoints(chi_burst_talent) Spell(chi_burst)
	if TalentPoints(chi_wave_talent) Spell(chi_wave)
	if TalentPoints(zen_sphere_talent) and BuffExpires(zen_sphere) Spell(zen_sphere)
}

###
### Brewmaster
###

AddFunction BrewmasterBuffActions
{
	unless Stance(1) Spell(stance_of_the_sturdy_ox)
	unless BuffPresent(str_agi_int any=1) Spell(legacy_of_the_emperor)
}

AddFunction BrewmasterMainActions
{
	if Chi(more 3) and BuffExpires(shuffle) Spell(blackout_kick)
	if HealthPercent(less 35) and NumberToMaxChi() >=1 Spell(expel_harm)
	if NumberToMaxChi() >=2 Spell(keg_smash)
	if HealthPercent(less 90) and NumberToMaxChi() >=1 Spell(expel_harm)
	if Level(more 33)
	{
		# Brewmaster Training is automatically learned at level 34, which makes Tiger Palm usable.
		if BuffStacks(power_guard) <3 and BuffExpires(guard 6) Spell(tiger_palm)
		if BuffPresent(power_guard) and BuffExpires(power_guard 3) Spell(tiger_palm)
	}
}

AddFunction BrewmasterFillerActions
{
	# Don't Tiger Palm before getting Brewmaster Training at level 34 since it costs Chi.
	if Level(more 33) Spell(tiger_palm)
	unless Level(more 33) Spell(jab)
}

# Damage reduction cooldowns
AddIcon mastery=1 help=cd size=small
{
	Spell(fortifying_brew)
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
	BrewmasterBuffActions()
	BrewmasterMainActions()
	if Chi(more 3) and BuffPresent(shuffle)
	{
		MonkTier2TalentActions()
	}
	if TimeToMaxEnergy() <1.2 Spell(jab)
	BrewmasterFillerActions()
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	BrewmasterBuffActions()
	BrewmasterMainActions()
	if Chi(more 3) and BuffPresent(shuffle)
	{
		Spell(breath_of_fire)
	}
	if TimeToMaxEnergy() <1.2 Spell(spinning_crane_kick)
	BrewmasterFillerActions()
}

AddIcon mastery=1 help=cd
{
	if TargetIsInterruptible() Interrupt()
}

AddIcon mastery=3 help=cd size=small
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]],
}
