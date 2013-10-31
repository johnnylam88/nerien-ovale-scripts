local _, NerienOvaleScripts = ...
local Ovale = NerienOvaleScripts.Ovale
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "Nerien"
	local desc = "[5.3] Nerien: Elemental, Restoration"
	local code = [[
# Nerien's shaman script based on SimulationCraft
#
# Elemental
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Wa!...2.2
#	glyphs=chain_lightning

Define(ancestral_guidance 108281)
	SpellInfo(ancestral_guidance cd=120 duration=10)
	SpellAddBuff(ancestral_guidance ancestral_guidance=1)
Define(ancestral_guidance_talent 14)
Define(ancestral_swiftness 16188)
	SpellInfo(ancestral_swiftness cd=90)
	SpellAddBuff(ancestral_swiftness ancestral_swiftness=1)
Define(ancestral_swiftness_talent 11)
Define(ascendance 114049)
	SpellInfo(ascendance cd=180)
Define(ascendance_air 114051)
	SpellInfo(ascendance_air cd=180 duration=15)
Define(ascendance_fire 114050)
	SpellInfo(ascendance_fire cd=180 duration=15)
Define(ascendance_water 114052)
	SpellInfo(ascendance_water cd=180 duration=15)
Define(astral_shift 108271)
	SpellInfo(astral_shift cd=90 duration=6)
	SpellAddBuff(astral_shift astral_shift=1)
Define(astral_shift_talent 3)
Define(bloodlust 2825)
	SpellInfo(bloodlust cd=300 duration=40)
	SpellAddBuff(bloodlust bloodlust=1)
Define(call_of_the_elements 108285)
	SpellInfo(call_of_the_elements cd=180)
Define(call_of_the_elements_talent 7)
Define(capacitor_totem 108269)
	SpellInfo(capacitor_totem cd=45 duration=5)
	SpellInfo(capacitor_totem addduration=-2 glyph=glyph_of_capacitor_totem)
Define(chain_heal 1064)
	SpellInfo(chain_heal cd=2 glyph=glyph_of_chaining)
	SpellAddBuff(chain_heal ancestral_swiftness=0)
Define(chain_lightning 421)
	SpellInfo(chain_lightning cd=3)
	SpellAddBuff(chain_lightning ancestral_swiftness=0)
Define(cleanse_spirit 51886)
	SpellInfo(cleanse_spirit cd=8)
Define(clearcasting 16246)
	SpellInfo(clearcasting duration=15)
Define(conductivity_talent 15)
Define(earth_elemental_totem 2062)
	SpellInfo(earth_elemental_totem cd=300 duration=60)
Define(earth_shield 974)
	SpellInfo(earth_shield duration=600)
Define(earth_shock 8042)
	SpellInfo(earth_shock cd=6 sharedcd=shock)
	SpellInfo(earth_shock addcd=-1 mastery=1)
	SpellAddTargetDebuff(earth_shock weakened_blows=1)
Define(earthbind_totem 2484)
	SpellInfo(earthbind_totem cd=30 duration=20)
Define(earthgrab_totem 51485)
	SpellInfo(earthgrab_totem cd=30 duration=20)
Define(earthgrab_totem_talent 5)
Define(earthliving 51945)
	SpellInfo(earthliving duration=12 haste=spell tick=3)
Define(earthliving_weapon 51730)
Define(earthquake 61882)
	SpellInfo(earthquake cd=10 duration=10)
Define(earthquake_debuff 77478)
Define(echo_of_the_elements_talent 12)
Define(elemental_blast 117014)
	SpellInfo(elemental_blast cd=12)
	SpellAddBuff(elemental_blast elemental_blast_buff=1)
Define(elemental_blast_buff 118522)
	SpellInfo(elemental_blast_buff duration=8)
Define(elemental_blast_talent 18)
Define(elemental_mastery 16166)
	SpellInfo(elemental_mastery cd=90 duration=20)
	SpellAddBuff(elemental_mastery elemental_mastery=1)
Define(elemental_mastery_talent 10)
Define(far_sight 6196)
	SpellInfo(far_sight duration=60)
	SpellAddBuff(far_sight ancestral_swiftness=0 far_sight=1)
Define(feral_spirit 51533)
	SpellInfo(feral_spirit cd=120 duration=30)
Define(fire_elemental_totem 2894)
	SpellInfo(fire_elemental_totem cd=300 duration=60)
	SpellInfo(fire_elemental_totem cd=150 duration=30 glyph=glyph_of_fire_elemental_totem)
Define(fire_nova 1535)
	SpellInfo(fire_nova cd=4)
Define(flame_shock 8050)
	SpellInfo(flame_shock cd=6 duration=30 haste=spell sharedcd=shock tick=3)
	SpellInfo(flame_shock addcd=-1 mastery=1)
	SpellAddBuff(flame_shock unleash_flame=0)
	SpellAddTargetDebuff(flame_shock flame_shock=1)
Define(flametongue_weapon 8024)
Define(flurry 16278)
	SpellInfo(flurry duration=15)
Define(frost_shock 8050)
	SpellInfo(frost_shock cd=6 duration=8 sharedcd=shock)
	SpellInfo(frost_shock addcd=-2 glyph=glyph_of_frost_shock)
	SpellAddTargetDebuff(frost_shock frost_shock=1)
Define(frostbrand_weapon 8033)
Define(ghost_wolf 2645)
Define(glyph_of_capacitor_totem 55442)
Define(glyph_of_chaining 55452)
Define(glyph_of_fire_elemental_totem 55455)
Define(glyph_of_frost_shock 55443)
Define(glyph_of_grounding_totem 55441)
Define(glyph_of_hex 63291)
Define(glyph_of_purge 55439)
Define(glyph_of_riptide 63273)
Define(glyph_of_spirit_walk 55454)
Define(glyph_of_spiritwalkers_grace 55446)
Define(glyph_of_totemic_recall 55438)
Define(glyph_of_the_lakestrider 55448)
Define(glyph_of_thunder 63270)
Define(glyph_of_wind_shear 55451)
Define(greater_healing_wave 77472)
	SpellAddBuff(greater_healing_wave ancestral_swiftness=0 tidal_waves=-1 unleash_life=0)
Define(grounding_totem 8177)
	SpellInfo(grounding_totem cd=25 duration=15)
	SpellInfo(grounding_totem addcd=20 glyph=glyph_of_grounding_totem)
Define(healing_rain 73920)
	SpellInfo(healing_rain cd=10 duration=10 haste=spell tick=2)
	SpellAddBuff(healing_rain ancestral_swiftness=0 unleash_life=0)
Define(healing_stream_totem 5394)
	SpellInfo(healing_stream_totem cd=30 duration=15)
Define(healing_surge 8004)
	SpellAddBuff(healing_surge ancestral_swiftness=0 tidal_waves=-1 unleash_life=0)
Define(healing_tide_totem 108280)
	SpellInfo(healing_tide_totem cd=180 duration=11)
Define(healing_wave 331)
	SpellAddBuff(healing_wave ancestral_swiftness=0 tidal_waves=-1 unleash_life=0)
Define(heroism 32182)
	SpellInfo(heroism duration=40 cd=300)
	SpellAddBuff(heroism heroism=1)
Define(hex 51514)
	SpellInfo(hex cd=45 duration=60)
	SpellInfo(hex addcd=-10 glyph=glyph_of_hex)
	SpellAddBuff(hex ancestral_swiftness=0)
	SpellAddTargetDebuff(hex hex=1)
Define(lava_beam 114074)
Define(lava_burst 51505)
	SpellInfo(lava_burst buffnocd=ascendance_fire cd=8)
	SpellAddBuff(lava_burst clearcasting=-1 lava_surge=0)
Define(lava_lash 60103)
	SpellInfo(lava_lash cd=10)
	SpellAddBuff(lava_lash searing_flames=0)
Define(lava_surge 77762)
	SpellInfo(lava_surge duration=6)
Define(lightning_bolt 403)
	SpellAddBuff(lightning_bolt ancestral_swiftness=0)
Define(lightning_shield 324)
	SpellInfo(lightning_shield duration=3600)	# maximum of 7 charges
	SpellAddBuff(lightning_shield lightning_shield=1 water_shield=0)
Define(maelstrom_weapon 53817)
	SpellInfo(maelstrom_weapon duration=30)		# stacks 5 times
	SpellAddBuff(maelstrom_weapon maelstrom_weapon=1)
Define(magma_totem 8187)
	SpellInfo(magma_totem duration=60 tick=2)
Define(mana_tide_totem 16190)
	SpellInfo(mana_tide_totem cd=180 duration=16)
Define(primal_elementalist_talent 17)
Define(primal_strike 73899)
Define(purge 370)
	SpellInfo(purge cd=6 glyph=glyph_of_purge)
Define(purify_spirit 77130)
Define(riptide 61295)
	SpellInfo(riptide cd=6 duration=18 haste=spell tick=3)
	SpellInfo(riptide cd=0 glyph=glyph_of_riptide)
Define(rockbiter_weapon 8017)
Define(rushing_streams_talent 13)
Define(searing_flames 77661)
	SpellInfo(searing_flames duration=15)	# stacks 5 times
Define(searing_totem 3599)
	SpellInfo(searing_totem duration=60)
Define(shamanistic_rage 30823)
	SpellInfo(shamanistic_rage cd=60 duration=15)
Define(spirit_link_totem 98008)
	SpellInfo(spirit_link_totem cd=180 duration=6)
Define(spirit_walk 58875)
	SpellInfo(spirit_walk cd=60 duration=15)
	SpellInfo(spirit_walk addcd=-15 glyph=glyph_of_spirit_walk)
Define(spiritwalkers_grace 79206)
	SpellInfo(spiritwalkers_grace cd=120 duration=15)
	SpellInfo(spiritwalkers_grace addduration=5 glyph=glyph_of_spiritwalkers_grace)
	SpellAddBuff(spiritwalkers_grace spiritwalkers_grace=1)
Define(stone_bulwark_totem 108270)
	SpellInfo(stone_bulwark_totem cd=10 duration=30)
Define(stone_bulwark_totem_talent 2)
Define(stormblast 115356)
	SpellInfo(stormblast cd=8 duration=15 sharedcd=strike)
	SpellAddTargetDebuff(stormblast stormblast=1)
Define(stormlash 120687)
Define(stormlash_totem 120668)
	SpellInfo(stormlash_totem cd=300 duration=10)
	SpellAddBuff(stormlash_totem stormlash_totem_buff=1)
Define(stormlash_totem_buff 120676)
Define(stormstrike 17364)
	SpellInfo(stormstrike cd=8 duration=15 sharedcd=strike)
	SpellAddTargetDebuff(stormstrike stormstrike=1)
Define(thunderstorm 51490)
	SpellInfo(thunderstorm cd=45 duration=5)
	SpellInfo(thunderstorm addcd=-10 glyph=glyph_of_thunder)
	SpellAddBuff(thunderstorm thunderstorm=1)
Define(tidal_waves 53390)
	SpellInfo(tidal_waves duration=15)
Define(totemic_persistence_talent 8)
Define(totemic_projection 108287)
	SpellInfo(totemic_projection cd=10)
Define(totemic_projection_talent 9)
Define(totemic_recall 36936)
Define(tremor_totem 8143)
	SpellInfo(tremor_totem cd=60 duration=6)
Define(unleash_elements 73680)
	SpellInfo(unleash_elements cd=15)
Define(unleash_flame 73683)
	SpellInfo(unleash_flame cd=15 duration=8)
	SpellAddBuff(unleash_flame unleash_flame=1)
Define(unleash_life 73685)
	SpellInfo(unleash_life cd=15 duration=10)
	SpellAddBuff(unleash_life unleash_life=1)
Define(unleashed_fury_talent 16)
Define(water_shield 52127)
	SpellInfo(water_shield duration=3600)
	SpellAddBuff(water_shield lightning_shield=0 water_shield=1)
Define(water_walking 546)
	SpellInfo(water_walking duration=600)
Define(weakened_blows 115798)
	SpellInfo(weakened_blows duration=30)
Define(wind_shear 57994)
	SpellInfo(wind_shear cd=12 duration=3)
	SpellInfo(wind_shear addcd=3 addduration=1 glyph=glyph_of_wind_shear)
	SpellAddTargetDebuff(wind_shear wind_shear=1)
Define(windwalk_totem 108273)
	SpellInfo(windwalk_totem cd=60 duration=6)
Define(windwalk_totem_talent 6)
Define(windfury_weapon 8232)

# Pet spells (Primal Elementalist Talent)
Define(pet_empower 118350)
	SpellInfo(pet_empower cd=10 duration=60)
	SpellAddBuff(pet_empower pet_empower=1)
Define(pet_reinforce 118347)
	SpellInfo(pet_reinforce cd=10 duration=60)
	SpellAddBuff(pet_reinforce pet_reinforce=1)

# Items
Define(jade_serpent_potion 76093)
Define(jade_serpent_potion_buff 105702)
	SpellInfo(jade_serpent_potion_buff duration=25)
Define(virmens_bite_potion 76089)
Define(virmens_bite_potion_buff 105697)
	SpellInfo(virmens_bite_potion_buff duration=25)

# Racials
Define(berserking 26297)
	SpellInfo(berserking cd=180 duration=10)
	SpellAddBuff(berserking berserking=1)
Define(blood_fury 20572)
	SpellInfo(blood_fury cd=120 duration=15)
	SpellAddBuff(blood_fury blood_fury=1)
Define(stoneform 20594)
	SpellInfo(stoneform cd=120 duration=8)
	SpellAddBuff(stoneform stoneform=1)

AddFunction UseRacialActions
{
	Spell(berserking)
	Spell(blood_fury)
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
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Shaman (all specializations)
###

AddFunction Bloodlust
{
	if DebuffExpires(burst_haste_debuff)
	{
		Spell(bloodlust)
		Spell(heroism)
	}
}

AddFunction Interrupt
{
	if not target.IsFriend() and target.IsInterruptible() Spell(wind_shear)
}

###
### Elemental
###

# Notes on cooldown usage from SimC:sc_shaman.cpp:
#
# - Sync berserking with ascendance as they share a cooldown, but making sure
#   that no two haste cooldowns overlap, within reason
#
# - Sync blood fury with ascendance or fire elemental as long as one is ready
#   soon after blood fury is.
#
# - Use Elemental Mastery after initial Bloodlust ends. Also make sure that
#   Elemental Mastery is not used during Ascendance, if Berserking is up.
#   Finally, after the second Ascendance (time 200+ seconds), start using
#   Elemental Mastery on cooldown.
#
# - Use Ascendance preferably with a haste CD up, but dont overdo the delaying.
#   Make absolutely sure that Ascendance can be used so that only Lava Bursts
#   need to be cast during it's duration.

AddFunction ElementalUsePotion
{
	#jade_serpent_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(jade_serpent_potion usable=1)
}

AddFunction ElementalHasteBuffPresent
{
	BuffPresent(burst_haste any=1) or BuffPresent(elemental_mastery) or BuffPresent(berserking)
}

AddFunction ElementalAscendanceOrFireElementalReady
{
	#((cooldown.ascendance.remains>10|level<87)&cooldown.fire_elemental_totem.remains>10)|buff.ascendance.up
	BuffPresent(ascendance_fire) or {{SpellCooldown(ascendance_fire) >10 or Level() <87} and SpellCooldown(fire_elemental_totem) >10}
}

AddFunction ElementalFullRotation
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		#flametongue_weapon,weapon=main
		if WeaponEnchantExpires(mainhand) Spell(flametongue_weapon)
		#lightning_shield,if=!buff.lightning_shield.up
		if BuffExpires(lightning_shield) Spell(lightning_shield)
		#snapshot_stats
		#jade_serpent_potion
		ElementalUsePotion()
	}

	#wind_shear
	Interrupt()
	#bloodlust,if=target.health.pct<25|time>5
	if not ElementalHasteBuffPresent() and target.HealthPercent() <25 or TimeInCombat() >5 Bloodlust()
	UseItemActions()
	#stormlash_totem,if=!active&!buff.stormlash.up&(buff.bloodlust.up|time>=60)
	if BuffExpires(stormlash_totem_buff any=1) and {BuffPresent(burst_haste any=1) or TimeInCombat() >60} Spell(stormlash_totem)
	#jade_serpent_potion,if=time>60&(pet.primal_fire_elemental.active|pet.greater_fire_elemental.active|target.time_to_die<=60)
	if TimeInCombat() >60 and {TotemPresent(fire totem=fire_elemental_totem) or target.TimeToDie() <=60}
	{
		ElementalUsePotion()
	}
	#berserking,if=!buff.bloodlust.up&!buff.elemental_mastery.up&buff.ascendance.cooldown_remains=0&(dot.flame_shock.remains>buff.ascendance.duration|level<87)
	if not ElementalHasteBuffPresent() and Spell(ascendance_fire)
		and {target.DebuffRemains(flame_shock) > SpellData(ascendance_fire duration) or Level() <87}
	{
		Spell(berserking)
	}
	#blood_fury,if=buff.bloodlust.up|buff.ascendance.up|((cooldown.ascendance.remains>10|level<87)&cooldown.fire_elemental_totem.remains>10)
	if BuffPresent(burst_haste any=1) or ElementalAscendanceOrFireElementalReady() Spell(blood_fury)
	#elemental_mastery,if=talent.elemental_mastery.enabled&(time>15&((!buff.bloodlust.up&time<120)|(!buff.berserking.up&!buff.bloodlust.up&buff.ascendance.up)|(time>=200&(cooldown.ascendance.remains>30|level<87))))
	if TalentPoints(elemental_mastery_talent) and TimeInCombat() >15
		and {{BuffExpires(burst_haste any=1) and TimeInCombat() <120}
			or {not ElementalHasteBuffPresent() and BuffPresent(ascendance_fire)}
			or {TimeInCombat() >200 and {SpellCooldown(ascendance_fire) >30 or Level() <87}}}
	{
		Spell(elemental_mastery)
	}
	#fire_elemental_totem,if=!active
	if TotemExpires(fire totem=fire_elemental_totem) Spell(fire_elemental_totem)
	#ascendance,if=active_enemies>1|(dot.flame_shock.remains>buff.ascendance.duration&(target.time_to_die<20|buff.bloodlust.up|time>=60)&cooldown.lava_burst.remains>0)
	if Enemies() >1 Spell(ascendance_fire)
	if {target.DebuffRemains(flame_shock) > SpellData(ascendance_fire duration)}
		and {target.TimeToDie() <20 or ElementalHasteBuffPresent() or TimeInCombat() >180}
		and SpellCooldown(lava_burst) >0
	{
		Spell(ascendance_fire)
	}
	if Enemies() >1
	{
		#run_action_list,name=aoe,if=active_enemies>1
		#lava_beam
		Spell(lava_beam)
		if TotemExpires(fire)
		{
			#magma_totem,if=active_enemies>2&!totem.fire.active
			if Enemies() >2 Spell(magma_totem)
			#searing_totem,if=active_enemies<=2&!totem.fire.active
			if Enemies() <=2 Spell(searing_totem)
		}
		#lava_burst,if=active_enemies<3&dot.flame_shock.remains>cast_time&cooldown_react
		if Enemies() <3 and target.DebuffRemains(flame_shock) > CastTime(lava_burst) Spell(lava_burst)
		#flame_shock,cycle_targets=1,if=!ticking&active_enemies<3
		if target.DebuffExpires(flame_shock) Spell(flame_shock)
		#earthquake,if=active_enemies>4
		if Enemies() >4 Spell(earthquake)
		#thunderstorm,if=mana.pct_nonproc<80
		if ManaPercent() <80 Spell(thunderstorm)
		#chain_lightning,if=mana.pct_nonproc>10
		if ManaPercent() >10 Spell(chain_lightning)
		#lightning_bolt
		Spell(lightning_bolt)
	}
	#run_action_list,name=single,if=active_enemies=1
	{
		#use_item,name=gloves_of_the_witch_doctor,if=((cooldown.ascendance.remains>10|level<87)&cooldown.fire_elemental_totem.remains>10)|buff.ascendance.up|buff.bloodlust.up|totem.fire_elemental_totem.active
		if BuffPresent(burst_haste any=1) or ElementalAscendanceOrFireElementalReady() or TotemPresent(fire totem=fire_elemental_totem) Item(HandsSlot usable=1)
		#ancestral_swiftness,if=talent.ancestral_swiftness.enabled&!buff.ascendance.up
		if TalentPoints(ancestral_swiftness) and BuffExpires(ascendance_fire) Spell(ancestral_swiftness)
		#unleash_elements,if=talent.unleashed_fury.enabled&!buff.ascendance.up
		if TalentPoints(unleashed_fury_talent) and BuffExpires(ascendance_fire) Spell(unleash_elements)
		#spiritwalkers_grace,moving=1,if=buff.ascendance.up
		if Speed() >0 and BuffPresent(ascendance_fire) Spell(spiritwalkers_grace)
		#lava_burst,if=dot.flame_shock.remains>cast_time&(buff.ascendance.up|cooldown_react)
		if target.DebuffRemains(flame_shock) > CastTime(lava_burst) and {BuffPresent(ascendance_fire) or Spell(lava_burst)} Spell(lava_burst)
		#flame_shock,if=ticks_remain<2
		if target.TicksRemain(flame_shock) <2 Spell(flame_shock)
		#elemental_blast,if=talent.elemental_blast.enabled
		if TalentPoints(elemental_blast_talent) Spell(elemental_blast)
		#earth_shock,if=buff.lightning_shield.react=buff.lightning_shield.max_stack
		if BuffStacks(lightning_shield) >6 Spell(earth_shock)
		#earth_shock,if=buff.lightning_shield.react>3&dot.flame_shock.remains>cooldown&dot.flame_shock.remains<cooldown+action.flame_shock.tick_time
		if BuffStacks(lightning_shield) >3
			and target.DebuffRemains(flame_shock) > SpellCooldown(earth_shock)
			and target.DebuffRemains(flame_shock) < SpellCooldown(earth_shock) + target.NextTick(flame_shock)
		{
			Spell(earth_shock)
		}
		#flame_shock,if=time>60&remains<=buff.ascendance.duration&cooldown.ascendance.remains+buff.ascendance.duration<duration
		if TimeInCombat() >60
			and target.DebuffRemains(flame_shock) <= SpellData(ascendance_fire duration)
			and SpellCooldown(ascendance_fire) + SpellData(ascendance_fire duration) < SpellData(flame_shock duration)
		{
			Spell(flame_shock)
		}
		#earth_elemental_totem,if=!active&cooldown.fire_elemental_totem.remains>=60
		if TotemExpires(earth totem=earth_elemental_totem) and SpellCooldown(fire_elemental_totem) >=60 Spell(earth_elemental_totem)
		#searing_totem,if=cooldown.fire_elemental_totem.remains>20&!totem.fire.active
		if TotemExpires(fire) Spell(searing_totem)
		if Speed() >0
		{
			#spiritwalkers_grace,moving=1,if=((talent.elemental_blast.enabled&cooldown.elemental_blast.remains=0)|(cooldown.lava_burst.remains=0&!buff.lava_surge.react))|(buff.raid_movement.duration>=action.unleash_elements.gcd+action.earth_shock.gcd)
			if {TalentPoints(elemental_blast_talent) and Spell(elemental_blast)} or {Spell(lava_burst) and BuffExpires(lava_surge)} Spell(spiritwalkers_grace)
		}
		#lightning_bolt
		Spell(lightning_bolt)
	}
}

AddFunction ElementalPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		#flametongue_weapon,weapon=main
		if WeaponEnchantExpires(mainhand) Spell(flametongue_weapon)
		#lightning_shield,if=!buff.lightning_shield.up
		if BuffExpires(lightning_shield) Spell(lightning_shield)
	}
}

AddFunction ElementalMainActions
{
	#unleash_elements,if=talent.unleashed_fury.enabled&!buff.ascendance.up
	if TalentPoints(unleashed_fury_talent) and BuffExpires(ascendance_fire) Spell(unleash_elements)
	#lava_burst,if=dot.flame_shock.remains>cast_time&(buff.ascendance.up|cooldown_react)
	if target.DebuffRemains(flame_shock) > CastTime(lava_burst) and {BuffPresent(ascendance_fire) or Spell(lava_burst)} Spell(lava_burst)
	#flame_shock,if=ticks_remain<2
	if target.TicksRemain(flame_shock) <2 Spell(flame_shock)
	#elemental_blast,if=talent.elemental_blast.enabled
	if TalentPoints(elemental_blast_talent) Spell(elemental_blast)
	#earth_shock,if=buff.lightning_shield.react=buff.lightning_shield.max_stack
	if BuffStacks(lightning_shield) >6 Spell(earth_shock)
	#earth_shock,if=buff.lightning_shield.react>3&dot.flame_shock.remains>cooldown&dot.flame_shock.remains<cooldown+action.flame_shock.tick_time
	if BuffStacks(lightning_shield) >3
		and target.DebuffRemains(flame_shock) > SpellCooldown(earth_shock)
		and target.DebuffRemains(flame_shock) < SpellCooldown(earth_shock) + target.NextTick(flame_shock)
	{
		Spell(earth_shock)
	}
	#flame_shock,if=time>60&remains<=buff.ascendance.duration&cooldown.ascendance.remains+buff.ascendance.duration<duration
	if TimeInCombat() >60
		and target.DebuffRemains(flame_shock) <= SpellData(ascendance_fire duration)
		and SpellCooldown(ascendance_fire) + SpellData(ascendance_fire duration) < SpellData(flame_shock duration)
	{
		Spell(flame_shock)
	}
	#searing_totem,if=cooldown.fire_elemental_totem.remains>20&!totem.fire.active
	if TotemExpires(fire) Spell(searing_totem)
}

AddFunction ElementalFillerActions
{
	#lightning_bolt
	Spell(lightning_bolt)
}

AddFunction ElementalAoEActions
{
	#run_action_list,name=aoe,if=active_enemies>1
	#lava_beam
	Spell(lava_beam)
	if TotemExpires(fire)
	{
		#magma_totem,if=active_enemies>2&!totem.fire.active
		if Enemies() >2 Spell(magma_totem)
		#searing_totem,if=active_enemies<=2&!totem.fire.active
		if Enemies() <=2 Spell(searing_totem)
	}
	#lava_burst,if=active_enemies<3&dot.flame_shock.remains>cast_time&cooldown_react
	if Enemies() <3 and target.DebuffRemains(flame_shock) > CastTime(lava_burst) Spell(lava_burst)
	#flame_shock,cycle_targets=1,if=!ticking&active_enemies<3
	if target.DebuffExpires(flame_shock) Spell(flame_shock)
	#earthquake,if=active_enemies>4
	if Enemies() >4 Spell(earthquake)
	#thunderstorm,if=mana.pct_nonproc<80
	if ManaPercent() <80 Spell(thunderstorm)
	#chain_lightning,if=mana.pct_nonproc>10
	if ManaPercent() >10 Spell(chain_lightning)
	#lightning_bolt
	Spell(lightning_bolt)
}

AddFunction ElementalCooldownActions
{
	if InCombat(no)
	{
		#jade_serpent_potion
		ElementalUsePotion()
	}

	#wind_shear
	Interrupt()
	UseItemActions()
	#stormlash_totem,if=!active&!buff.stormlash.up&(buff.bloodlust.up|time>=60)
	if BuffExpires(stormlash_totem_buff any=1) and {BuffPresent(burst_haste any=1) or TimeInCombat() >60} Spell(stormlash_totem)
	#jade_serpent_potion,if=time>60&(pet.primal_fire_elemental.active|pet.greater_fire_elemental.active|target.time_to_die<=60)
	if TimeInCombat() >60 and {TotemPresent(fire totem=fire_elemental_totem) or target.TimeToDie() <=60}
	{
		ElementalUsePotion()
	}
	#berserking,if=!buff.bloodlust.up&!buff.elemental_mastery.up&buff.ascendance.cooldown_remains=0&(dot.flame_shock.remains>buff.ascendance.duration|level<87)
	if not ElementalHasteBuffPresent() and Spell(ascendance_fire)
		and {target.DebuffRemains(flame_shock) > SpellData(ascendance_fire duration) or Level() <87}
	{
		Spell(berserking)
	}
	#blood_fury,if=buff.bloodlust.up|buff.ascendance.up|((cooldown.ascendance.remains>10|level<87)&cooldown.fire_elemental_totem.remains>10)
	if BuffPresent(burst_haste any=1) or ElementalAscendanceOrFireElementalReady() Spell(blood_fury)
	#elemental_mastery,if=talent.elemental_mastery.enabled&(time>15&((!buff.bloodlust.up&time<120)|(!buff.berserking.up&!buff.bloodlust.up&buff.ascendance.up)|(time>=200&(cooldown.ascendance.remains>30|level<87))))
	if TalentPoints(elemental_mastery_talent) and TimeInCombat() >15
		and {{BuffExpires(burst_haste any=1) and TimeInCombat() <120}
			or {not ElementalHasteBuffPresent() and BuffPresent(ascendance_fire)}
			or {TimeInCombat() >200 and {SpellCooldown(ascendance_fire) >30 or Level() <87}}}
	{
		Spell(elemental_mastery)
	}
	#fire_elemental_totem,if=!active
	if TotemExpires(fire totem=fire_elemental_totem) Spell(fire_elemental_totem)
	#ascendance,if=active_enemies>1|(dot.flame_shock.remains>buff.ascendance.duration&(target.time_to_die<20|buff.bloodlust.up|time>=60)&cooldown.lava_burst.remains>0)
	if {target.DebuffRemains(flame_shock) > SpellData(ascendance_fire duration)}
		and {target.TimeToDie() <20 or ElementalHasteBuffPresent() or TimeInCombat() >180}
		and SpellCooldown(lava_burst) >0
	{
		Spell(ascendance_fire)
	}
	#run_action_list,name=single,if=active_enemies=1
	{
		#use_item,name=gloves_of_the_witch_doctor,if=((cooldown.ascendance.remains>10|level<87)&cooldown.fire_elemental_totem.remains>10)|buff.ascendance.up|buff.bloodlust.up|totem.fire_elemental_totem.active
		if BuffPresent(burst_haste any=1) or ElementalAscendanceOrFireElementalReady() or TotemPresent(fire totem=fire_elemental_totem) Item(HandsSlot usable=1)
		#ancestral_swiftness,if=talent.ancestral_swiftness.enabled&!buff.ascendance.up
		if TalentPoints(ancestral_swiftness) and BuffExpires(ascendance_fire) Spell(ancestral_swiftness)
		#spiritwalkers_grace,moving=1,if=buff.ascendance.up
		if Speed() >0 and BuffPresent(ascendance_fire) Spell(spiritwalkers_grace)
		#earth_elemental_totem,if=!active&cooldown.fire_elemental_totem.remains>=60
		if TotemExpires(earth totem=earth_elemental_totem) and SpellCooldown(fire_elemental_totem) >=60 Spell(earth_elemental_totem)
		if Speed() >0
		{
			#spiritwalkers_grace,moving=1,if=((talent.elemental_blast.enabled&cooldown.elemental_blast.remains=0)|(cooldown.lava_burst.remains=0&!buff.lava_surge.react))|(buff.raid_movement.duration>=action.unleash_elements.gcd+action.earth_shock.gcd)
			if {TalentPoints(elemental_blast_talent) and Spell(elemental_blast)} or {Spell(lava_burst) and BuffExpires(lava_surge)} Spell(spiritwalkers_grace)
		}
	}
}

# Survival cooldowns.
AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_left
{
	if TalentPoints(stone_bulwark_totem_talent) Spell(stone_bulwark_totem)
	if TalentPoints(astral_shift_talent) Spell(astral_shift)
	if TalentPoints(earthgrab_totem_talent) Spell(earthgrab_totem)
	Spell(earthbind_totem)
}

# Utility.
AddIcon mastery=1 help=buff size=small checkboxon=opt_icons_left
{
	if IsFeared() Spell(tremor_totem)
	#if IsStunned() Spell(windwalk_totem)
	if TalentPoints(conductivity_talent) Spell(healing_rain)
	if TotemExpires(water)
	{
		if TalentPoints(healing_tide_totem) Spell(healing_tide_totem)
		Spell(healing_stream_totem)
	}
	if TalentPoints(ancestral_guidance_talent) Spell(ancestral_guidance)
}

# Main Rotation plus fillers.
AddIcon mastery=1 help=main
{
	ElementalPreCombatActions()
	ElementalMainActions()
	ElementalFillerActions()
}

# Main Rotation.
AddIcon mastery=1 help=main
{
	ElementalPreCombatActions()
	ElementalMainActions()
}

# AoE.
AddIcon mastery=1 help=aoe checkboxon=aoe
{
	ElementalPreCombatActions()
	ElementalAoEActions()
}

# Cooldowns.
AddIcon mastery=1 help=cd
{
	ElementalCooldownActions()
}

# Bloodlust.
AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	#/bloodlust,if=target.health.pct<25|time>5
	if not ElementalHasteBuffPresent() and target.HealthPercent() <25 or TimeInCombat() >5 Bloodlust()
}

# Trinkets.
AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Restoration
###

# Information from ElitistJerks forum thread "[Resto] Raid Healing 5.1 MoP":
#	http://elitistjerks.com/f79/t130574-resto_raid_healing_5_1_mop/

# Suggest using Totemic Recall to regain mana from casting Healing Stream Totem.
AddCheckBox(opt_totemic_recall SpellName(totemic_recall) mastery=3)

AddFunction RestorationBuffMaintenance
{
	if InCombat(no)
	{
		if WeaponEnchantExpires(mainhand 400) Spell(earthliving_weapon)
	}

	if WeaponEnchantExpires(mainhand 2) Spell(earthliving_weapon)
	if BuffExpires(water_shield) Spell(water_shield)
}

AddFunction RestorationPetChannel
{
	if TalentPoints(primal_elementalist_talent) and pet.Present()
	{
		if TotemPresent(fire totem=fire_elemental_totem)
		{
			if BuffExpires(pet_empower any=1) Spell(pet_empower)
		}
		if TotemPresent(earth totem=earth_elemental_totem)
		{
			if BuffExpires(pet_reinforce any=1) Spell(pet_reinforce)
		}
	}
}

AddFunction RestorationHealingStreamTotemRecall
{
	# Suggest Totemic Recall to regain mana from Healing Stream Totem, but only if it won't
	# recall other totems with very long CDs.
	#
	# Totemic Recall is suggested at 3s remaining on HST so that there is still time to cast
	# it after the current spellcast and GCD.
	#
	if CheckBoxOn(opt_totemic_recall)
	{
		if TotemPresent(water totem=healing_stream_totem) and TotemExpires(water 3)
			and TotemExpires(fire totem=fire_elemental_totem)
			and TotemExpires(earth totem=earth_elemental_totem)
		{
			Spell(totemic_recall)
		}
	}
}

# Survival cooldowns.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	if TalentPoints(stone_bulwark_totem_talent) Spell(stone_bulwark_totem)
	if TalentPoints(astral_shift_talent) Spell(astral_shift)
	if TalentPoints(earthgrab_totem_talent) Spell(earthgrab_totem)
	Spell(earthbind_totem)
}

# Utility.
AddIcon mastery=3 help=buff size=small checkboxon=opt_icons_left
{
	if IsFeared() Spell(tremor_totem)
	#if IsStunned() Spell(windwalk_totem)
	if TotemExpires(water)
	{
		if ManaPercent(less 80) Spell(mana_tide_totem)
		Spell(healing_stream_totem)
		if TalentPoints(healing_tide_totem) Spell(healing_tide_totem)
	}
	if TalentPoints(ancestral_guidance_talent) Spell(ancestral_guidance)
	Spell(spirit_link_totem)
}

# Short cooldowns.
AddIcon mastery=3 help=shortcd
{
	RestorationHealingStreamTotemRecall()
	RestorationPetChannel()
	Spell(unleash_elements)
}

# Main rotation.
AddIcon mastery=3 help=main
{
	RestorationBuffMaintenance()
	RestorationHealingStreamTotemRecall()
	if TotemExpires(water) Spell(healing_stream_totem)
	if Glyph(glyph_of_riptide no) Spell(riptide)
}

# AoE.
AddIcon mastery=3 help=aoe checkboxon=aoe
{
	RestorationBuffMaintenance()
	if TotemExpires(water) Spell(healing_stream_totem)
	Spell(healing_rain)
	Spell(chain_heal)
}

# Cooldowns.
AddIcon mastery=3 help=cd
{
	Interrupt()
	if Speed(more 0) Spell(spiritwalkers_grace)
	Spell(ascendance_water)
	Spell(fire_elemental_totem)
	Spell(earth_elemental_totem)
}

# Bloodlust.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	if BuffExpires(stormlash_totem_buff any=1) and {BuffPresent(burst_haste any=1) or TimeInCombat() >60} Spell(stormlash_totem)
	if BuffExpires(burst_haste any=1) Bloodlust()
}

# Trinkets.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]]

	OvaleScripts:RegisterScript("SHAMAN", name, desc, code)
end
