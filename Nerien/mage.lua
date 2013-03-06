local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.MAGE.Nerien = {
	desc = "[5.2] Nerien: Frost",
	code =
[[
# Nerien's mage script based on SimulationCraft.
#
# Frost:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#eb!0...20
#	glyphs=evocation/icy_veins/ice_lance

Define(alter_time 110909)
	SpellInfo(alter_time duration=6)
Define(alter_time_activate 108978)
	SpellInfo(alter_time_activate cd=180)
Define(arcane_barrage 44425)
	SpellInfo(arcane_barrage cd=3)
	SpellAddDebuff(arcane_barrage arcane_charge=0)
Define(arcane_blast 30451)
	SpellAddDebuff(arcane_blast arcane_charge=1)
Define(arcane_brilliance 1459)
	SpellInfo(arcane_brilliance duration=3600)
	SpellAddBuff(arcane_brilliance arcane_brilliance=1)
Define(arcane_charge 36032)
	SpellInfo(arcane_charge duration=10)
Define(arcane_explosion 1449)
	SpellAddDebuff(arcane_explosion arcane_charge=refresh)
Define(arcane_missiles 5143)
	SpellInfo(arcane_missiles duration=2)
	SpellAddDebuff(arcane_missiles arcane_charge=1)
Define(arcane_missiles_aura 79683)
	SpellInfo(arcane_missiles_aura duration=20)
Define(arcane_power 12042)
	SpellInfo(arcane_power cd=90 duration=15)
	SpellAddBuff(arcane_power arcane_power=1)
Define(blazing_speed 108843)
	SpellInfo(blazing_speed cd=25 duration=1)
Define(blazing_speed_talent 2)
Define(blink 1953)
	SpellInfo(blink cd=15)
Define(brain_freeze_aura 57761)
	SpellInfo(brain_freeze_aura duration=15)
Define(cold_snap 11958)
	SpellInfo(cold_snap cd=180)
Define(combustion 11129)
	SpellInfo(combustion cd=45)
	SpellInfo(combustion cd=90 glyph=glyph_of_combustion)
	SpellInfo(combustion cd=36 itemset=T14 itemcount=4)
	SpellInfo(combustion cd=72 glyph=glyph_of_combustion itemset=T14 itemcount=4)
	SpellAddTargetDebuff(combustion combustion_aura=1)
Define(combustion_aura 83853)
	SpellInfo(combustion_aura duration=10 tick=1)
	SpellInfo(combustion_aura addduration=10 glyph=glyph_of_combustion)
Define(conjure_brilliant_mana_gem 119316)
Define(conjure_mana_gem 759)
Define(counterspell 2139)
	SpellInfo(counterspell cd=24 duration=6)
Define(evocation 12051)
	SpellInfo(evocation cd=120 canStopChannelling=3 duration=6 tick=2)
	SpellInfo(evocation cd=0 duration=3 tick=1 talent=invocation_talent)
	SpellAddBuff(evocation arcane_charge=0 evocation=1)
Define(fingers_of_frost_aura 44544)
	SpellInfo(fingers_of_frost_aura duration=15)
Define(fire_blast 2136)
	SpellInfo(fire_blast cd=8)
Define(fireball 133)
Define(flamestrike 2120)
	SpellInfo(flamestrike cd=12 duration=8 tick=2)
Define(frost_armor 7302)
Define(frost_bomb 112948)
	SpellInfo(frost_bomb cd=10 duration=4 tick=4)
	SpellAddTargetDebuff(frost_bomb frost_bomb=1)
Define(frost_bomb_talent 15)
Define(frost_nova 122)
	SpellInfo(frost_nova cd=25 duration=8)
	SpellInfo(frost_nova addcd=-5 glyph=glyph_of_frost_nova)
Define(frostbolt 116)
	SpellInfo(frostbolt duration=15)
	SpellAddTargetDebuff(frostbolt frostbolt=1)
Define(frostfire_bolt 44614)
	SpellInfo(frostfire_bolt duration=8)
	SpellAddBuff(frostfire_bolt brain_freeze_aura=0)
	SpellAddTargetDebuff(frostfire_bolt frostfire_bolt=1)
Define(frostjaw 102051)
	SpellInfo(frostjaw cd=20 duration=8)
	SpellAddTargetDebuff(frostjaw frostjaw=1)
Define(frostjaw_talent 9)
Define(frozen_orb 84714)
	SpellInfo(frozen_orb cd=60 duration=10)
Define(glyph_of_combustion 56368)
Define(glyph_of_frost_nova 56376)
Define(glyph_of_icy_veins 56364)
Define(heating_up 48107)
	SpellInfo(heating_up duration=10)
Define(ice_barrier 11426)
	SpellInfo(ice_barrier cd=25 duration=60)
	SpellAddBuff(ice_barrier ice_barrier=1)
Define(ice_block 45438)
	SpellInfo(ice_block cd=300 duration=10)
	SpellAddBuff(ice_block ice_block=10)
Define(ice_floes 108839)
	SpellInfo(ice_floes cd=45 duration=15)
	SpellAddBuff(ice_floes ice_floes=1)
Define(ice_floes_talent 3)
Define(ice_lance 30455)
Define(ice_ward 111264)
	SpellInfo(ice_ward cd=20 duration=30)
Define(ice_ward_talent 8)
Define(icy_veins 12472)
	SpellInfo(icy_veins cd=180 duration=20)
	SpellInfo(icy_veins addcd=-90 itemset=T14 itemcount=4)
	SpellAddBuff(icy_veins icy_veins=1)
Define(icy_veins_glyphed 131078)
	SpellInfo(icy_veins_glyphed cd=180 duration=20)
	SpellInfo(icy_veins_glyphed addcd=-90 itemset=T14 itemcount=4)
	SpellAddBuff(icy_veins_glyphed icy_veins_glyphed=1)
SpellList(icy_veins_aura 12472 131078)
Define(ignite 12654)
	SpellInfo(ignite duration=4 tick=2)
Define(incanters_absorption 116267)
	SpellInfo(incanters_absorption duration=15)
Define(incanters_ward 1463)
	SpellInfo(incanters_ward cd=25 duration=8)
	SpellAddBuff(incanters_ward incanters_ward=1)
Define(incanters_ward_talent 18)
Define(inferno_blast 108853)
	SpellInfo(inferno_blast cd=8 )
Define(invocation_talent 16)
Define(invokers_energy 116257)
	SpellInfo(invokers_energy duration=60)
Define(living_bomb 44457)
	SpellInfo(living_bomb cd=1 duration=12 tick=3)
	SpellAddTargetDebuff(living_bomb living_bomb=1)
Define(living_bomb_talent 14)
Define(mage_armor 6117)
Define(mirror_image 55342)
	SpellInfo(mirror_image cd=180)
Define(molten_armor 30482)
Define(nether_tempest 114923)
	SpellInfo(nether_tempest duration=12 tick=1)
	SpellAddTargetDebuff(nether_tempest nether_tempest=1)
Define(nether_tempest_talent 13)
Define(presence_of_mind 12043)
	SpellInfo(presence_of_mind cd=90)
Define(presence_of_mind_talent 1)
Define(pyroblast 11366)
	SpellInfo(pyroblast duration=18 tick=3)
	SpellAddTargetDebuff(pyroblast pyroblast=1)
Define(pyroblast_aura 48108)
	SpellInfo(pyroblast_aura duration=15 )
Define(rune_of_power 116011)
Define(rune_of_power_aura 116014)
Define(rune_of_power_talent 17)
Define(scorch 2948)
Define(spellsteal 30449)
Define(temporal_displacement 80354)
	SpellInfo(temporal_displacement duration=600)
Define(time_warp 80353)
	SpellInfo(time_warp cd=300 duration=40)
	SpellAddBuff(time_warp time_warp=1)
	SpellAddDebuff(time_warp temporal_displacement=1)
Define(water_elemental 31687)
	SpellInfo(water_elemental cd=60)
Define(water_elemental_freeze 33395)
	SpellInfo(water_elemental_freeze cd=25 duration=8)
	SpellAddBuff(water_elemental_freeze fingers_of_frost_aura=1)
	SpellAddTargetDebuff(water_elemental_freeze water_elemental_freeze=1)

# Items
Define(brilliant_mana_gem 81901)
Define(jade_serpent_potion 76093)
Define(jade_serpent_potion_buff 105702)
	SpellInfo(jade_serpent_potion_buff duration=25)
Define(mana_gem 36799)

# Racials
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
	if not target.Classification(worldboss) and target.InRange(quaking_palm) Spell(quaking_palm)
}

AddFunction UseRacialSurvivalActions
{
	Spell(stoneform)
}

AddCheckBox(aoe L(AOE))
AddCheckBox(potions "Use potions" default)

AddCheckBox(opt_icons_left "Left icons" default)
AddCheckBox(opt_icons_right "Right icons" default)

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
### Mage (all specializations)
###

AddCheckBox(opt_alter_time SpellName(alter_time) default)

AddFunction Interrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		Spell(counterspell)
		UseRacialInterruptActions()
	}
}

AddFunction ConjureManaGem
{
	if Glyph(glyph_of_mana_gem) and ItemCharges(brilliant_mana_gem) <10 Spell(conjure_brilliant_mana_gem)
	if Glyph(glyph_of_mana_gem no) and ItemCharges(mana_gem) <3 Spell(conjure_mana_gem)
}

AddFunction UseManaGem
{
	if Glyph(glyph_of_mana_gem) Item(brilliant_mana_gem)
	if Glyph(glyph_of_mana_gem no) Item(mana_gem)
}

###
### Frost
###

AddFunction FrostIcyVeins
{
	if Glyph(glyph_of_icy_veins) Spell(icy_veins_glyphed)
	if Glyph(glyph_of_icy_veins no) Spell(icy_veins)
}

AddFunction FrostIcyVeinsCooldown
{
	if Glyph(glyph_of_icy_veins) SpellCooldown(icy_veins_glyphed)
	if Glyph(glyph_of_icy_veins no) SpellCooldown(icy_veins)
}

AddFunction FrostTier6FrozenOrb
{
	#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.invokers_energy.remains>20&buff.alter_time.down
	#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.rune_of_power.remains>20&buff.alter_time.down
	#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.alter_time.down
	if {TalentPoints(invocation_talent) and BuffPresent(invokers_energy 20)}
		or {TalentPoints(rune_of_power_talent) and BuffPresent(rune_of_power_aura)}
		or TalentPoints(incanters_ward_talent)
	{
		if BuffExpires(alter_time)
		{
			if target.TimeToDie() >4 and BuffStacks(fingers_of_frost_aura) <2 and FrostIcyVeinsCooldown() < GCD() Spell(frozen_orb)
		}
	}
}

AddFunction FrostTier6IcyVeinsActions
{
	if ArmorSetParts(T14) >3
	{
		#icy_veins,if=set_bonus.tier14_4pc_caster&buff.invokers_energy.remains>20&buff.alter_time.down
		#icy_veins,if=set_bonus.tier14_4pc_caster&buff.rune_of_power.remains>20&buff.alter_time.down
		#icy_veins,if=set_bonus.tier14_4pc_caster&buff.alter_time.down
		if {TalentPoints(invocation_talent) and BuffPresent(invokers_energy 20)}
			or {TalentPoints(rune_of_power_talent) and BuffPresent(rune_of_power_aura)}
			or {TalentPoints(incanters_ward_talent)}
			or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
		{
			if BuffExpires(alter_time) FrostIcyVeins()
		}
	}
	#icy_veins,if=!set_bonus.tier14_4pc_caster&dot.frozen_orb.ticking
	if ArmorSetParts(T14) <4
	{
		if SpellCooldown(frozen_orb) >50 FrostIcyVeins()
	}
}

AddFunction FrostTimeWarp
{
	#time_warp,if=target.health.pct<25|time>5
	if InCombat() and {target.HealthPercent() <25 or TimeInCombat() >5}
	{
		if BuffExpires(burst_haste any=1) and DebuffExpires(burst_haste_debuff) Spell(time_warp)
	}
}

AddFunction FrostFullRotation
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		#arcane_brilliance
		if BuffExpires(spell_power_multiplier 400 any=1) or BuffExpires(critical_strike 400 any=1) Spell(arcane_brilliance)
		#frost_armor
		if BuffExpires(frost_armor) Spell(frost_armor)
		#water_elemental
		if pet.Present(no) Spell(water_elemental)
		#snapshot_stats
		ConjureManaGem()
		#evocation
		if TalentPoints(invocation_talent) Spell(evocation)
		if TalentPoints(rune_of_power_talent) and BuffExpires(rune_of_power_aura) Spell(rune_of_power)
		#jade_serpent_potion
		if CheckBoxOn(potions) and target.Classification(worldboss) Item(jade_serpent_potion usable=1)
		#mirror_image
		Spell(mirror_image)
	}

	#counterspell,if=target.debuff.casting.react
	Interrupt()
	#cancel_buff,name=alter_time,moving=1
	#cold_snap,if=health.pct<30
	if TalentPoints(cold_snap) and HealthPercent() <30 Spell(cold_snap)
	#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
	if InCombat(no) ConjureManaGem()
	#time_warp,if=target.health.pct<25|time>5
	if InCombat() and {target.HealthPercent() <25 or TimeInCombat() >5}
	{
		if BuffExpires(burst_haste any=1) and DebuffExpires(burst_haste_debuff) Spell(time_warp)
	}
	#presence_of_mind,if=buff.alter_time.down
	if TalentPoints(presence_of_mind_talent) and BuffExpires(alter_time) Spell(presence_of_mind)
	#icy_veins,if=target.time_to_die<22
	if target.TimeToDie() <22 FrostIcyVeins()
	#blood_fury,if=target.time_to_die<12
	if target.TimeToDie() <12 Spell(blood_fury)
	#berserking,if=target.time_to_die<18
	if target.TimeToDie() <18 Spell(berserking)
	if BuffPresent(alter_time)
	{
		#frostfire_bolt,if=buff.alter_time.up&buff.brain_freeze.up
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
		#ice_lance,if=buff.alter_time.up&buff.fingers_of_frost.react
		if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
		#frostbolt,if=buff.alter_time.up&buff.presence_of_mind.up
		if BuffPresent(presence_of_mind) Spell(frostbolt)
	}
	if TalentPoints(invocation_talent)
	{
		FrostTier6FrozenOrb()
		FrostTier6IcyVeinsActions()
	}
	#frost_bomb,if=!ticking&target.time_to_die>cast_time+tick_time
	if TalentPoints(frost_bomb_talent)
	{
		if target.DebuffExpires(frost_bomb)
			and {target.TimeToDie() > CastTime(frost_bomb) + SpellData(frost_bomb tick)}
		{
			Spell(frost_bomb)
		}
	}
	if not TalentPoints(invocation_talent)
	{
		FrostTier6FrozenOrb()
		FrostTier6IcyVeinsActions()
	}
	#mirror_image
	Spell(mirror_image)
	#frostfire_bolt,if=buff.brain_freeze.up&((dot.frost_bomb.ticking&dot.frost_bomb.remains<2)|buff.brain_freeze.remains<2)
	#frostfire_bolt,if=buff.brain_freeze.react&((dot.nether_tempest.ticking&dot.nether_tempest.remains<2)|buff.brain_freeze.remains<2)
	#frostfire_bolt,if=buff.brain_freeze.react&((dot.living_bomb.ticking&dot.living_bomb.remains<2)|buff.brain_freeze.remains<2)
	if BuffPresent(brain_freeze_aura)
	{
		if BuffExpires(brain_freeze_aura 2) Spell(frostfire_bolt)
		if target.DebuffPresent(frost_bomb) and target.DebuffExpires(frost_bomb 2) Spell(frostfire_bolt)
		if target.DebuffPresent(nether_tempest) and target.DebuffExpires(nether_tempest 2) Spell(frostfire_bolt)
		if target.DebuffPresent(living_bomb) and target.DebuffExpires(living_bomb 2) Spell(frostfire_bolt)
	}
	#ice_lance,if=buff.fingers_of_frost.react&buff.fingers_of_frost.remains<2
	if BuffPresent(fingers_of_frost_aura) and BuffExpires(fingers_of_frost_aura 2) Spell(ice_lance)
	if BuffExpires(alter_time)
	{
		#/evocation,if=buff.invocation.down&buff.alter_time.down
		if TalentPoints(invocation_talent) and BuffExpires(invokers_energy) Spell(evocation)
		#rune_of_power,if=buff.rune_of_power.down&buff.alter_time.down
		if TalentPoints(rune_of_power_talent) and BuffExpires(rune_of_power_aura) Spell(rune_of_power)
		#incanters_ward,break_after=4,if=buff.alter_time.down
		if TalentPoints(incanters_ward_talent) Spell(incanters_ward)

		if CheckBoxOn(potions) and target.Classification(worldboss)
		{
			#jade_serpent_potion,if=target.time_to_die<=50&buff.alter_time.down
			if target.TimeToDie() <=50 Item(jade_serpent_potion usable=1)
		}
		{
			#blood_fury,if=buff.invokers_energy.remains>15&buff.alter_time.down&mana.pct>28
			#blood_fury,if=buff.rune_of_power.remains>15&buff.alter_time.down
			#blood_fury,if=buff.incanters_absorption.react&buff.alter_time.down
			#blood_fury,if=buff.alter_time.down
			if {BuffPresent(invokers_energy 15) and ManaPercent() >28}
				or BuffPresent(rune_of_power_aura)
				or BuffPresent(incanters_absorption)
				or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
			{
				Spell(blood_fury)
			}
		}
		{
			#/berserking,if=buff.invokers_energy.remains>10&buff.alter_time.down&mana.pct>28
			#/berserking,if=buff.rune_of_power.remains>10&buff.alter_time.down
			#/berserking,if=buff.incanters_absorption.react&buff.alter_time.down
			#/berserking,if=buff.alter_time.down
			if {BuffPresent(invokers_energy 10) and ManaPercent() > 28}
				or BuffPresent(rune_of_power_aura)
				or BuffPresent(incanters_absorption)
				or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
			{
				Spell(berserking)
			}
		}
		if BuffPresent(invokers_energy 15) or BuffPresent(rune_of_power_aura) or TalentPoints(incanters_ward_talent)
			or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
		{
			UseItemActions()
			#UseProfessionActions()
		}
	}
	#frostbolt,if=debuff.frostbolt.stack<3
	if target.TimeToDie() >20 and target.DebuffExpires(frostbolt 3 stacks=3) Spell(frostbolt)
	if CheckBoxOn(opt_alter_time)
	{
		#jade_serpent_potion,sync=alter_time_activate,if=buff.alter_time.down
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.invokers_energy.remains>6,moving=0
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.rune_of_power.remains>6,moving=0
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react,moving=0
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react,moving=0
		if BuffPresent(invokers_energy 6) or BuffPresent(rune_of_power_aura) or TalentPoints(incanters_ward_talent)
			or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
		{
			if BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) and Spell(alter_time_activate)
			{
				if CheckBoxOn(potions) and target.Classification(worldboss) Item(jade_serpent_potion usable=1)
				Spell(alter_time_activate)
			}
		}
	}
	if TalentPoints(nether_tempest_talent)
	{
		#nether_tempest,if=(!ticking|remains<tick_time)&target.time_to_die>6
		if target.TimeToDie() >6
		{
			if target.DebuffExpires(nether_tempest_debuff)
				or {target.DebuffRemains(nether_tempest_debuff) < target.NextTick(nether_tempest_debuff)}
			{
				Spell(nether_tempest)
			}
		}
	}
	if TalentPoints(living_bomb_talent)
	{
		#living_bomb,if=(!ticking|remains<tick_time)&target.time_to_die>tick_time*3
		if target.TimeToDie() > target.TickTime(living_bomb) * 3
		{
			if target.DebuffExpires(living_bomb)
				or {target.DebuffRemains(living_bomb) < target.NextTick(living_bomb)}
			{
				Spell(living_bomb)
			}	
		}
	}
	#ice_lance,if=buff.fingers_of_frost.react
	if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	if Level() >=87 and CheckBoxOn(opt_alter_time)
	{
		#frostfire_bolt,if=buff.brain_freeze.react&(buff.alter_time.up|cooldown.alter_time_activate.remains>4)
		if BuffPresent(brain_freeze_aura) and {BuffPresent(alter_time) or SpellCooldown(alter_time_activate) >4}
		{
			Spell(frostfire_bolt)
		}
	}
	if Level() <87 or CheckBoxOff(opt_alter_time)
	{
		#frostfire_bolt,if=buff.brain_freeze.react
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
	}
	#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2
	if target.TimeToDie() >4 and BuffStacks(fingers_of_frost_aura) <2 Spell(frozen_orb)
	#mana_gem,if=mana.pct<84&buff.alter_time.down
	if ManaPercent() <84 and BuffExpires(alter_time) UseManaGem()
	if not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent)}
	{
		#evocation,if=mana.pct<10&target.time_to_die>=30
		if ManaPercent() <10 and target.TimeToDie() >30 Spell(evocation)
	}
	#ice_floes,moving=1
	#frostbolt
	Spell(frostbolt)
	#fire_blast,moving=1
	#ice_lance,moving=1
}

AddFunction FrostMainActions
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		#arcane_brilliance
		if BuffExpires(spell_power_multiplier 400 any=1) or BuffExpires(critical_strike 400 any=1) Spell(arcane_brilliance)
		#frost_armor
		if BuffExpires(frost_armor) Spell(frost_armor)
		#snapshot_stats
		#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
		ConjureManaGem()
	}

	if BuffPresent(alter_time)
	{
		#frostfire_bolt,if=buff.alter_time.up&buff.brain_freeze.up
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
		#ice_lance,if=buff.alter_time.up&buff.fingers_of_frost.react
		if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
		#frostbolt,if=buff.alter_time.up&buff.presence_of_mind.up
		if BuffPresent(presence_of_mind) Spell(frostbolt)
	}
	#frost_bomb,if=!ticking&target.time_to_die>cast_time+tick_time
	if TalentPoints(frost_bomb_talent)
	{
		if target.DebuffExpires(frost_bomb)
			and {target.TimeToDie() > CastTime(frost_bomb) + SpellData(frost_bomb tick)}
		{
			Spell(frost_bomb)
		}
	}
	#frostfire_bolt,if=buff.brain_freeze.up&((dot.frost_bomb.ticking&dot.frost_bomb.remains<2)|buff.brain_freeze.remains<2)
	#frostfire_bolt,if=buff.brain_freeze.react&((dot.nether_tempest.ticking&dot.nether_tempest.remains<2)|buff.brain_freeze.remains<2)
	#frostfire_bolt,if=buff.brain_freeze.react&((dot.living_bomb.ticking&dot.living_bomb.remains<2)|buff.brain_freeze.remains<2)
	if BuffPresent(brain_freeze_aura)
	{
		if BuffExpires(brain_freeze_aura 2) Spell(frostfire_bolt)
		if target.DebuffPresent(frost_bomb) and target.DebuffExpires(frost_bomb 2) Spell(frostfire_bolt)
		if target.DebuffPresent(nether_tempest) and target.DebuffExpires(nether_tempest 2) Spell(frostfire_bolt)
		if target.DebuffPresent(living_bomb) and target.DebuffExpires(living_bomb 2) Spell(frostfire_bolt)
	}
	#ice_lance,if=buff.fingers_of_frost.react&buff.fingers_of_frost.remains<2
	if BuffPresent(fingers_of_frost_aura) and BuffExpires(fingers_of_frost_aura 2) Spell(ice_lance)
	#frostbolt,if=debuff.frostbolt.stack<3
	if TalentPoints(nether_tempest_talent)
	{
		#nether_tempest,if=(!ticking|remains<tick_time)&target.time_to_die>6
		if target.TimeToDie() >6
		{
			if target.DebuffExpires(nether_tempest_debuff)
				or {target.DebuffRemains(nether_tempest_debuff) < target.NextTick(nether_tempest_debuff)}
			{
				Spell(nether_tempest)
			}
		}
	}
	if TalentPoints(living_bomb_talent)
	{
		#living_bomb,if=(!ticking|remains<tick_time)&target.time_to_die>tick_time*3
		if target.TimeToDie() > target.TickTime(living_bomb) * 3
		{
			if target.DebuffExpires(living_bomb)
				or {target.DebuffRemains(living_bomb) < target.NextTick(living_bomb)}
			{
				Spell(living_bomb)
			}	
		}
	}
	#ice_lance,if=buff.fingers_of_frost.react
	if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	if Level() >=87 and CheckBoxOn(opt_alter_time)
	{
		#frostfire_bolt,if=buff.brain_freeze.react&(buff.alter_time.up|cooldown.alter_time_activate.remains>4)
		if BuffPresent(brain_freeze_aura) and {BuffPresent(alter_time) or SpellCooldown(alter_time_activate) >4}
		{
			Spell(frostfire_bolt)
		}
	}
	if Level() <87 or CheckBoxOff(opt_alter_time)
	{
		#frostfire_bolt,if=buff.brain_freeze.react
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
	}
	#mana_gem,if=mana.pct<84&buff.alter_time.down
	if ManaPercent() <84 and BuffExpires(alter_time) UseManaGem()
	if not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent)}
	{
		#evocation,if=mana.pct<10&target.time_to_die>=30
		if ManaPercent() <10 and target.TimeToDie() >=30 Spell(evocation)
	}
	#frostbolt
	Spell(frostbolt)
	#fire_blast,moving=1
	#ice_lance,moving=1
}

AddFunction FrostShortCooldownActions
{
	if InCombat(no)
	{
		#water_elemental
		if pet.Present(no) Spell(water_elemental)
		#evocation
		if TalentPoints(invocation_talent) Spell(evocation)
		if TalentPoints(rune_of_power_talent) and BuffExpires(rune_of_power_aura) Spell(rune_of_power)
	}

	#counterspell,if=target.debuff.casting.react
	Interrupt()
	#cancel_buff,name=alter_time,moving=1
	#cold_snap,if=health.pct<30
	if TalentPoints(cold_snap) and HealthPercent() <30 Spell(cold_snap)
	if TalentPoints(invocation_talent)
	{
		FrostTier6FrozenOrb()
	}
	if TalentPoints(rune_of_power_talent)
	{
		#rune_of_power,if=buff.rune_of_power.down&buff.alter_time.down
		if BuffExpires(rune_of_power_aura) and BuffExpires(alter_time) Spell(rune_of_power)
	}
	if TalentPoints(incanters_ward_talent)
	{
		#incanters_ward,break_after=4,if=buff.alter_time.down
		if BuffExpires(alter_time) Spell(incanters_ward)
	}
	if not TalentPoints(invocation_talent)
	{
		FrostTier6FrozenOrb()
	}
	#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2
	if target.TimeToDie() >4 and BuffStacks(fingers_of_frost_aura) <2 Spell(frozen_orb)
	#ice_floes,moving=1
}

AddFunction FrostCooldownActions
{
	if InCombat(no)
	{
		#jade_serpent_potion
		if CheckBoxOn(potions) and target.Classification(worldboss) Item(jade_serpent_potion usable=1)
		#mirror_image
		Spell(mirror_image)
	}

	#presence_of_mind,if=buff.alter_time.down
	if TalentPoints(presence_of_mind_talent) and BuffExpires(alter_time) Spell(presence_of_mind)
	#icy_veins,if=target.time_to_die<22
	if target.TimeToDie() <22 FrostIcyVeins()
	#blood_fury,if=target.time_to_die<12
	if target.TimeToDie() <12 Spell(blood_fury)
	#berserking,if=target.time_to_die<18
	if target.TimeToDie() <18 Spell(berserking)
	if TalentPoints(invocation_talent)
	{
		FrostTier6IcyVeinsActions()
	}
	if not TalentPoints(invocation_talent)
	{
		FrostTier6IcyVeinsActions()
	}
	#mirror_image
	Spell(mirror_image)
	if BuffExpires(alter_time)
	{
		#/evocation,if=buff.invocation.down&buff.alter_time.down
		if TalentPoints(invocation_talent) and BuffExpires(invokers_energy) Spell(evocation)
		#rune_of_power,if=buff.rune_of_power.down&buff.alter_time.down
		if TalentPoints(rune_of_power_talent) and BuffExpires(rune_of_power_aura) Spell(rune_of_power)
		#incanters_ward,break_after=4,if=buff.alter_time.down
		if TalentPoints(incanters_ward_talent) Spell(incanters_ward)

		if CheckBoxOn(potions) and target.Classification(worldboss)
		{
			#jade_serpent_potion,if=target.time_to_die<=50&buff.alter_time.down
			if target.TimeToDie() <=50 Item(jade_serpent_potion usable=1)
		}
		{
			#blood_fury,if=buff.invokers_energy.remains>15&buff.alter_time.down&mana.pct>28
			#blood_fury,if=buff.rune_of_power.remains>15&buff.alter_time.down
			#blood_fury,if=buff.incanters_absorption.react&buff.alter_time.down
			#blood_fury,if=buff.alter_time.down
			if {BuffPresent(invokers_energy 15) and ManaPercent() >28}
				or BuffPresent(rune_of_power_aura)
				or BuffPresent(incanters_absorption)
				or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
			{
				Spell(blood_fury)
			}
		}
		{
			#/berserking,if=buff.invokers_energy.remains>10&buff.alter_time.down&mana.pct>28
			#/berserking,if=buff.rune_of_power.remains>10&buff.alter_time.down
			#/berserking,if=buff.incanters_absorption.react&buff.alter_time.down
			#/berserking,if=buff.alter_time.down
			if {BuffPresent(invokers_energy 10) and ManaPercent() >28}
				or BuffPresent(rune_of_power_aura)
				or BuffPresent(incanters_absorption)
				or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
			{
				Spell(berserking)
			}
		}
		if BuffPresent(invokers_energy 15) or BuffPresent(rune_of_power_aura) or TalentPoints(incanters_ward_talent)
			or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
		{
			UseItemActions()
			#UseProfessionActions()
		}
	}
	if CheckBoxOn(opt_alter_time)
	{
		#jade_serpent_potion,sync=alter_time_activate,if=buff.alter_time.down
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.invokers_energy.remains>6,moving=0
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.rune_of_power.remains>6,moving=0
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react,moving=0
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react,moving=0
		if BuffPresent(invokers_energy 6) or BuffPresent(rune_of_power_aura) or TalentPoints(incanters_ward_talent)
			or not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
		{
			if BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) and Spell(alter_time_activate)
			{
				if CheckBoxOn(potions) and target.Classification(worldboss) Item(jade_serpent_potion usable=1)
				Spell(alter_time_activate)
			}
		}
	}
}

# Frost AoE rotation from Icy Veins Frost Mage Class Guide:
#	http://icy-veins.com/frost-mage-wow-pve-dps-rotation-cooldowns-abilities#sec-2
#
AddFunction FrostAoEActions
{
	# Freeze targets just before Frost Bomb explodes to increase damage due to Shatter.
	if TalentPoints(frost_bomb_talent) and target.DebuffRemains(frost_bomb) <0.5
	{
		if TalentPoints(ice_ward_talent) Spell(ice_ward)
		Spell(frost_nova)
		if pet.Present() Spell(water_elemental_freeze)
	}

	# Cast Flamestrike on cooldown.
	Spell(flamestrike)

	# Cast Mage Bomb on at least one target.
	{
		if TalentPoints(nether_tempest_talent)
		{
			if target.DebuffExpires(nether_tempest_debuff)
				or {target.DebuffRemains(nether_tempest_debuff) < target.NextTick(nether_tempest_debuff)}
			{
				Spell(nether_tempest)
			}
		}
		if TalentPoints(living_bomb_talent) and target.DebuffExpires(living_bomb) Spell(living_bomb)
		if TalentPoints(frost_bomb_talent) and target.DebuffExpires(frost_bomb) Spell(frost_bomb)
	}

	# Toss out Frozen Orb to generate Fingers of Frost to use with Ice Lance.
	# Ice Lance should be glyphed for maximum cleave damage.
	if BuffExpires(fingers_of_frost_aura) Spell(frozen_orb)
	if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)

	# Arcane Explosion as filler.
	Spell(arcane_explosion)
}

AddIcon mastery=3 help=Blink size=small checkboxon=opt_icons_left
{
	Spell(blink)
}

AddIcon mastery=3 help=Freeze size=small checkboxon=opt_icons_left
{
	#water_elemental:freeze,if=buff.alter_time.down&buff.fingers_of_frost.react<2
	if pet.Present() and BuffExpires(alter_time) and BuffStacks(fingers_of_frost_aura) <2 Spell(water_elemental_freeze)
}

AddIcon mastery=3 help=shortcd
{
	FrostShortCooldownActions()
}

AddIcon mastery=3 help=main
{
	FrostMainActions()
}

AddIcon mastery=3 help=aoe checkboxon=aoe
{
	FrostAoEActions()
}

AddIcon mastery=3 help=cd
{
	FrostCooldownActions()
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	FrostTimeWarp()
}
]],
}
