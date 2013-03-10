local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.MAGE.Nerien = {
	desc = "[5.2] Nerien: Arcane, Frost",
	code =
[[
# Nerien's mage script based on SimulationCraft.
#
# Arcane:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#ea!0...01
#	glyphs=mana_gem/mirror_image/arcane_power
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
Define(cold_snap_talent 12)
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

AddFunction UsePotion
{
	#jade_serpent_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(jade_serpent_potion usable=1)
}

AddFunction MageBomb
{
	if TalentPoints(nether_tempest_talent)
	{
		#nether_tempest,if=(!ticking|remains<tick_time)&target.time_to_die>6
		if {target.DebuffExpires(nether_tempest) or target.TicksRemain(nether_tempest) <1} and target.TimeToDie() >6 Spell(nether_tempest)
	}
	if TalentPoints(living_bomb_talent)
	{
		#living_bomb,if=(!ticking|remains<tick_time)&target.time_to_die>tick_time*3
		if {target.DebuffExpires(living_bomb) or target.TicksRemain(living_bomb) <1} and target.TimeToDie() >{target.TickTime(living_bomb) * 3} Spell(living_bomb)
	}
	if TalentPoints(frost_bomb_talent)
	{
		#frost_bomb,if=target.time_to_die>cast_time+tick_time
		if target.TimeToDie() > CastTime(frost_bomb) + target.TickTime(frost_bomb) Spell(frost_bomb)
	}
}

###
### Arcane
###

AddFunction ArcaneFullRotation
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		#arcane_brilliance
		if BuffExpires(spell_power_multiplier 400 any=1) or BuffExpires(critical_strike 400 any=1) Spell(arcane_brilliance)
		#mage_armor
		if BuffExpires(mage_armor) Spell(mage_armor)
		#snapshot_stats
		if TalentPoints(invocation_talent)
		{
			#evocation
			Spell(evocation)
		}
		if TalentPoints(rune_of_power_talent)
		{
			#rune_of_power
			Spell(rune_of_power)
		}
		#jade_serpent_potion
		UsePotion()
		#mirror_image
		Spell(mirror_image)
	}

	#counterspell,if=target.debuff.casting.react
	Interrupt()
	#cancel_buff,name=alter_time,moving=1
	#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
	if InCombat(no) ConjureManaGem()
	#time_warp,if=target.health.pct<25|time>5
	if InCombat() and {target.HealthPercent() <25 or TimeInCombat() >5}
	{
		if BuffExpires(burst_haste any=1) and DebuffExpires(burst_haste_debuff) Spell(time_warp)
	}
	if TalentPoints(rune_of_power_talent)
	{
		#rune_of_power,if=buff.rune_of_power.remains<cast_time
		#rune_of_power,if=cooldown.arcane_power.remains=0&buff.rune_of_power.remains<buff.arcane_power.duration
		if BuffExpires(rune_of_power_aura) Spell(rune_of_power)
	}
	if TalentPoints(invocation_talent)
	{
		#evocation,if=buff.invokers_energy.down
		if BuffExpires(invokers_energy) Spell(evocation)
		#evocation,if=cooldown.arcane_power.remains=0&buff.invokers_energy.remains<buff.arcane_power.duration
		if Spell(arcane_power) and BuffRemains(invokers_energy) < SpellData(arcane_power duration) Spell(evocation)
		#evocation,if=mana.pct<50,interrupt_if=mana.pct>95&buff.invokers_energy.remains>10
		if ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95 and BuffRemains(invokers_energy) >10} Spell(evocation)
	}
	if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
	{
		#evocation,if=mana.pct<50,interrupt_if=mana.pct>95
		if ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95} Spell(evocation)
	}
	#mirror_image
	Spell(mirror_image)
	#mana_gem,if=mana.pct<80&buff.alter_time.down
	if ManaPercent() <80 and BuffExpires(alter_time) UseManaGem()
	{
		#arcane_power,if=(buff.rune_of_power.remains>=buff.arcane_power.duration&buff.arcane_missiles.stack=2&buff.arcane_charge.stack>2)|target.time_to_die<buff.arcane_power.duration+5,moving=0
		#arcane_power,if=(buff.invokers_energy.remains>=buff.arcane_power.duration&buff.arcane_missiles.stack=2&buff.arcane_charge.stack>2)|target.time_to_die<buff.arcane_power.duration+5,moving=0
		#arcane_power,if=(buff.arcane_missiles.stack=2&buff.arcane_charge.stack>2)|target.time_to_die<buff.arcane_power.duration+5,moving=0
		if BuffStacks(arcane_missiles_aura) ==2 and DebuffStacks(arcane_charge) >2
		{
			if TalentPoints(rune_of_power_talent) and BuffPresent(rune_of_power_aura) Spell(arcane_power)
			if TalentPoints(invocation_talent) and BuffRemains(invokers_energy) >=SpellData(arcane_power duration) Spell(arcane_power)
			if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent) Spell(arcane_power)
		}
		if target.TimeToDie() < SpellData(arcane_power duration) +5 Spell(arcane_power)
	}
	#blood_fury,if=buff.alter_time.down&(buff.arcane_power.up|cooldown.arcane_power.remains>15|target.time_to_die<18)
	if BuffExpires(alter_time) and {BuffPresent(arcane_power) or SpellCooldown(arcane_power) >15 or target.TimeToDie() <18} Spell(berserking)
	#berserking,if=buff.alter_time.down&(buff.arcane_power.up|target.time_to_die<18)
	if BuffExpires(alter_time) and {BuffPresent(arcane_power) or target.TimeToDie() <18} Spell(berserking)
	#jade_serpent_potion,if=buff.alter_time.down&(buff.arcane_power.up|target.time_to_die<50)
	if BuffExpires(alter_time) and {BuffPresent(arcane_power) or target.TimeToDie() <50} UsePotion()
	#use_item,name=gloves_of_the_chromatic_hydra,sync=alter_time_activate,if=buff.alter_time.down
	if Spell(alter_time_activate) and BuffExpires(alter_time) UseItemActions()
	#alter_time,if=buff.alter_time.down&buff.arcane_power.up
	if CheckBoxOn(opt_alter_time) and BuffExpires(alter_time) and BuffPresent(arcane_power) Spell(alter_time_activate)
	{
		#use_item,name=gloves_of_the_chromatic_hydra,if=(cooldown.alter_time_activate.remains>45|target.time_to_die<25)&buff.rune_of_power.remains>20
		#use_item,name=gloves_of_the_chromatic_hydra,if=(cooldown.alter_time_activate.remains>45|target.time_to_die<25)&buff.invokers_energy.remains>20
		#use_item,name=gloves_of_the_chromatic_hydra,if=(cooldown.alter_time_activate.remains>45|target.time_to_die<25)
		if SpellCooldown(alter_time_activate) >45 or target.TimeToDie() <25
		{
			if TalentPoints(rune_of_power_talent) and BuffPresent(rune_of_power) UseItemActions()
			if TalentPoints(invocation_talent) and BuffRemains(invokers_energy) >20 UseItemActions()
			if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent) UseItemActions()
		}
	}
	if BuffPresent(alter_time)
	{
		#arcane_barrage,if=buff.alter_time.up&buff.alter_time.remains<2
		if BuffRemains(alter_time) <2 Spell(arcane_barrage)
		#arcane_missiles,if=buff.alter_time.up
		Spell(arcane_missiles usable=1)
		#arcane_blast,if=buff.alter_time.up
		Spell(arcane_blast)
	}
	#arcane_missiles,if=(buff.arcane_missiles.stack=2&cooldown.arcane_power.remains>0)|(buff.arcane_charge.stack>=4&cooldown.arcane_power.remains>8)
	if BuffStacks(arcane_missiles_aura) ==2
		or {DebuffStacks(arcane_charge) >=4 and {Spell(arcane_power) or SpellCooldown(arcane_power) >8}}
	{
		Spell(arcane_missiles usable=1)
	}
	#nether_tempest,if=(!ticking|remains<tick_time)&target.time_to_die>6
	MageBomb()
	#arcane_barrage,if=buff.arcane_charge.stack>=4&mana.pct<95
	if DebuffStacks(arcane_charge) >=4 and ManaPercent() <95 Spell(arcane_barrage)
	if TalentPoints(presence_of_mind_talent)
	{
		#presence_of_mind
		Spell(presence_of_mind)
	}
	#arcane_blast
	Spell(arcane_blast)
	if Speed() >0
	{
		if TalentPoints(ice_floes_talent)
		{
			#ice_floes,moving=1
			Spell(ice_floes)
		}
		#arcane_barrage,moving=1
		Spell(arcane_barrage)
		#fire_blast,moving=1
		Spell(fire_blast)
		#ice_lance,moving=1
		Spell(ice_lance)
	}
}

AddFunction ArcaneMainActions
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		#arcane_brilliance
		if BuffExpires(spell_power_multiplier 400 any=1) or BuffExpires(critical_strike 400 any=1) Spell(arcane_brilliance)
		#mage_armor
		if BuffExpires(mage_armor) Spell(mage_armor)
		#snapshot_stats
	}

	#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
	if InCombat(no) ConjureManaGem()
	#mana_gem,if=mana.pct<80&buff.alter_time.down
	if ManaPercent() <80 and BuffExpires(alter_time) UseManaGem()
	if BuffPresent(alter_time)
	{
		#arcane_barrage,if=buff.alter_time.up&buff.alter_time.remains<2
		if BuffRemains(alter_time) <2 Spell(arcane_barrage)
		#arcane_missiles,if=buff.alter_time.up
		Spell(arcane_missiles usable=1)
		#arcane_blast,if=buff.alter_time.up
		Spell(arcane_blast)
	}
	#arcane_missiles,if=(buff.arcane_missiles.stack=2&cooldown.arcane_power.remains>0)|(buff.arcane_charge.stack>=4&cooldown.arcane_power.remains>8)
	if BuffStacks(arcane_missiles_aura) ==2
		or {DebuffStacks(arcane_charge) >=4 and {Spell(arcane_power) or SpellCooldown(arcane_power) >8}}
	{
		Spell(arcane_missiles usable=1)
	}
	#nether_tempest,if=(!ticking|remains<tick_time)&target.time_to_die>6
	MageBomb()
	#arcane_barrage,if=buff.arcane_charge.stack>=4&mana.pct<95
	if DebuffStacks(arcane_charge) >=4 and ManaPercent() <95 Spell(arcane_barrage)
	if TalentPoints(presence_of_mind_talent)
	{
		#presence_of_mind
		Spell(presence_of_mind)
	}
	#arcane_blast
	Spell(arcane_blast)
}

AddFunction ArcaneShortCooldownActions
{
	if InCombat(no)
	{
		if TalentPoints(invocation_talent)
		{
			#evocation
			Spell(evocation)
		}
		if TalentPoints(rune_of_power_talent)
		{
			#rune_of_power
			Spell(rune_of_power)
		}
	}

	if TalentPoints(rune_of_power_talent)
	{
		#rune_of_power,if=buff.rune_of_power.remains<cast_time
		#rune_of_power,if=cooldown.arcane_power.remains=0&buff.rune_of_power.remains<buff.arcane_power.duration
		if BuffExpires(rune_of_power_aura) Spell(rune_of_power)
	}
	if TalentPoints(invocation_talent)
	{
		#evocation,if=buff.invokers_energy.down
		if BuffExpires(invokers_energy) Spell(evocation)
		#evocation,if=cooldown.arcane_power.remains=0&buff.invokers_energy.remains<buff.arcane_power.duration
		if Spell(arcane_power) and BuffRemains(invokers_energy) < SpellData(arcane_power duration) Spell(evocation)
		#evocation,if=mana.pct<50,interrupt_if=mana.pct>95&buff.invokers_energy.remains>10
		if ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95 and BuffRemains(invokers_energy) >10} Spell(evocation)
	}
	if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
	{
		#evocation,if=mana.pct<50,interrupt_if=mana.pct>95
		if ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95} Spell(evocation)
	}
}

AddFunction ArcaneCooldownActions
{
	if InCombat(no)
	{
		#jade_serpent_potion
		UsePotion()
		#mirror_image
		Spell(mirror_image)
	}

	#counterspell,if=target.debuff.casting.react
	Interrupt()

	unless {TalentPoints(rune_of_power_talent) and BuffExpires(rune_of_power_aura)}
		or {TalentPoints(invocation_talent)
			and {BuffExpires(invokers_energy)
				or {Spell(arcane_power) and BuffRemains(invokers_energy) < SpellData(arcane_power duration)}
				or {ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95 and BuffRemains(invokers_energy) >10}}}}
		or {not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
			and {ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95} and Spell(evocation)}}
	{
		#mirror_image
		Spell(mirror_image)
		{
			#arcane_power,if=(buff.rune_of_power.remains>=buff.arcane_power.duration&buff.arcane_missiles.stack=2&buff.arcane_charge.stack>2)|target.time_to_die<buff.arcane_power.duration+5,moving=0
			#arcane_power,if=(buff.invokers_energy.remains>=buff.arcane_power.duration&buff.arcane_missiles.stack=2&buff.arcane_charge.stack>2)|target.time_to_die<buff.arcane_power.duration+5,moving=0
			#arcane_power,if=(buff.arcane_missiles.stack=2&buff.arcane_charge.stack>2)|target.time_to_die<buff.arcane_power.duration+5,moving=0
			if BuffStacks(arcane_missiles_aura) ==2 and DebuffStacks(arcane_charge) >2
			{
				if TalentPoints(rune_of_power_talent) and BuffPresent(rune_of_power_aura) Spell(arcane_power)
				if TalentPoints(invocation_talent) and BuffRemains(invokers_energy) >=SpellData(arcane_power duration) Spell(arcane_power)
				if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent) Spell(arcane_power)
			}
			if target.TimeToDie() < SpellData(arcane_power duration) +5 Spell(arcane_power)
		}
		#blood_fury,if=buff.alter_time.down&(buff.arcane_power.up|cooldown.arcane_power.remains>15|target.time_to_die<18)
		if BuffExpires(alter_time) and {BuffPresent(arcane_power) or SpellCooldown(arcane_power) >15 or target.TimeToDie() <18} Spell(berserking)
		#berserking,if=buff.alter_time.down&(buff.arcane_power.up|target.time_to_die<18)
		if BuffExpires(alter_time) and {BuffPresent(arcane_power) or target.TimeToDie() <18} Spell(berserking)
		#jade_serpent_potion,if=buff.alter_time.down&(buff.arcane_power.up|target.time_to_die<50)
		if BuffExpires(alter_time) and {BuffPresent(arcane_power) or target.TimeToDie() <50} UsePotion()
		#use_item,name=gloves_of_the_chromatic_hydra,sync=alter_time_activate,if=buff.alter_time.down
		if Spell(alter_time_activate) and BuffExpires(alter_time) UseItemActions()
		#alter_time,if=buff.alter_time.down&buff.arcane_power.up
		if CheckBoxOn(opt_alter_time) and BuffExpires(alter_time) and BuffPresent(arcane_power) Spell(alter_time_activate)
		{
			#use_item,name=gloves_of_the_chromatic_hydra,if=(cooldown.alter_time_activate.remains>45|target.time_to_die<25)&buff.rune_of_power.remains>20
			#use_item,name=gloves_of_the_chromatic_hydra,if=(cooldown.alter_time_activate.remains>45|target.time_to_die<25)&buff.invokers_energy.remains>20
			#use_item,name=gloves_of_the_chromatic_hydra,if=(cooldown.alter_time_activate.remains>45|target.time_to_die<25)
			if SpellCooldown(alter_time_activate) >45 or target.TimeToDie() <25
			{
				if TalentPoints(rune_of_power_talent) and BuffPresent(rune_of_power) UseItemActions()
				if TalentPoints(invocation_talent) and BuffRemains(invokers_energy) >20 UseItemActions()
				if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent) UseItemActions()
			}
		}
	}
}

AddFunction ArcaneMovingActions
{
	if TalentPoints(ice_floes_talent)
	{
		#ice_floes,moving=1
		Spell(ice_floes)
	}
	#arcane_barrage,moving=1
	Spell(arcane_barrage)
	#fire_blast,moving=1
	Spell(fire_blast)
	#ice_lance,moving=1
	Spell(ice_lance)
}

# Arcane AoE rotation from Icy Veins Arcane Mage Class Guide:
#	http://www.icy-veins.com/arcane-mage-wow-pve-dps-rotation-cooldowns-abilities#sec-2
#
AddFunction ArcaneAoEActions
{
	# Cast Flamestrike on cooldown.
	Spell(flamestrike)

	# Cast Mage Bomb on at least one target.
	{
		if TalentPoints(nether_tempest_talent)
		{
			if target.DebuffExpires(nether_tempest)
				or {target.DebuffRemains(nether_tempest) < target.NextTick(nether_tempest)}
			{
				Spell(nether_tempest)
			}
		}
		if TalentPoints(living_bomb_talent) and target.DebuffExpires(living_bomb) Spell(living_bomb)
		if TalentPoints(frost_bomb_talent) and target.DebuffExpires(frost_bomb) Spell(frost_bomb)
	}

	# Arcane Explosion as filler.
	Spell(arcane_explosion)
}

AddIcon mastery=1 help=Blink size=small checkboxon=opt_icons_left
{
	Spell(blink)
}

AddIcon mastery=1 help=moving size=small checkboxon=opt_icons_left
{
	ArcaneMovingActions()
}

AddIcon mastery=1 help=shortcd
{
	ArcaneShortCooldownActions()
}

AddIcon mastery=1 help=main
{
	ArcaneMainActions()
}

AddIcon mastery=1 help=aoe checkboxon=aoe
{
	ArcaneAoEActions()
}

AddIcon mastery=1 help=cd
{
	ArcaneCooldownActions()
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	if TalentPoints(cold_snap_talent)
	{
		#cold_snap,if=health.pct<30
		Spell(cold_snap)
	}
}

AddIcon mastery=1 help=cd size=small checkboxon=opt_icons_right
{
	if BuffExpires(burst_haste any=1) and DebuffExpires(burst_haste_debuff) Spell(time_warp)
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

AddFunction FrostIcyVeinsReady
{
	{Glyph(glyph_of_icy_veins) and Spell(icy_veins_glyphed)} or {Glyph(glyph_of_icy_veins no) and Spell(icy_veins)}
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
		if TalentPoints(invocation_talent)
		{
			#evocation
			Spell(evocation)
		}
		if TalentPoints(rune_of_power_talent)
		{
			#rune_of_power
			Spell(rune_of_power)
		}
		#jade_serpent_potion
		UsePotion()
		#mirror_image
		Spell(mirror_image)
	}

	#counterspell,if=target.debuff.casting.react
	Interrupt()
	#cancel_buff,name=alter_time,moving=1
	if TalentPoints(cold_snap_talent)
	{
		#cold_snap,if=health.pct<30
		if HealthPercent() <30 Spell(cold_snap)
	}
	#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
	if InCombat(no) ConjureManaGem()
	#time_warp,if=target.health.pct<25|time>5
	if InCombat() and {target.HealthPercent() <25 or TimeInCombat() >5}
	{
		if BuffExpires(burst_haste any=1) and DebuffExpires(burst_haste_debuff) Spell(time_warp)
	}
	if TalentPoints(rune_of_power_talent)
	{
		#rune_of_power,if=buff.rune_of_power.remains<cast_time&buff.alter_time.down
		if BuffExpires(rune_of_power_aura) and BuffExpires(alter_time) Spell(rune_of_power)
		#rune_of_power,if=cooldown.icy_veins.remains=0&buff.rune_of_power.remains<20
		if FrostIcyVeinsReady() and BuffExpires(rune_of_power_aura) Spell(rune_of_power)
	}
	if TalentPoints(invocation_talent)
	{
        #evocation,if=(buff.invokers_energy.down|mana.pct<20)&buff.alter_time.down
		if {BuffExpires(invokers_energy) or ManaPercent() <20} and BuffExpires(alter_time) Spell(evocation)
        #evocation,if=cooldown.icy_veins.remains=0&buff.invokers_energy.remains<20
		if FrostIcyVeinsReady() and BuffRemains(invokers_energy) <20 Spell(evocation)
	}
	if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
	{
		#evocation,if=mana.pct<50,interrupt_if=mana.pct>95
		if ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95} Spell(evocation)
	}
	#mirror_image
	Spell(mirror_image)
	#frozen_orb,if=!buff.fingers_of_frost.react
	if BuffExpires(fingers_of_frost_aura) Spell(frozen_orb)
	#icy_veins,if=(debuff.frostbolt.stack>=3&(buff.brain_freeze.react|buff.fingers_of_frost.react))|target.time_to_die<22,moving=0
	{
		if target.DebuffStacks(frostbolt) >=3 and {BuffPresent(brain_freeze_aura) or BuffPresent(fingers_of_frost_aura)} FrostIcyVeins()
		if target.TimeToDie() <22 FrostIcyVeins()
	}
	#blood_fury,if=buff.icy_veins.up|cooldown.icy_veins.remains>30|target.time_to_die<18
	if BuffPresent(icy_veins) or FrostIcyVeinsCooldown() >30 or target.TimeToDie() <18 Spell(blood_fury)
	#berserking,if=buff.icy_veins.up|target.time_to_die<18
	if BuffPresent(icy_veins) or target.TimeToDie() <18 Spell(berserking)
	#jade_serpent_potion,if=buff.icy_veins.up|target.time_to_die<45
	if BuffPresent(icy_veins) or target.TimeToDie() <45 UsePotion()
	if TalentPoints(presence_of_mind_talent)
	{
		#presence_of_mind,if=buff.icy_veins.up|cooldown.icy_veins.remains>15|target.time_to_die<15
		if BuffPresent(icy_veins) or FrostIcyVeinsCooldown() >15 or target.TimeToDie() <15 Spell(presence_of_mind)
	}
	#use_item,sync=alter_time_activate,if=buff.alter_time.down
	if {CheckBoxOff(opt_alter_time) or Spell(alter_time_activate)} and BuffExpires(alter_time) UseItemActions()
	#alter_time,if=buff.alter_time.down&buff.icy_veins.up
	if CheckBoxOn(opt_alter_time) and BuffExpires(alter_time) and BuffPresent(icy_veins) Spell(alter_time_activate)
	if TalentPoints(rune_of_power_talent)
	{
		#use_item,if=(cooldown.alter_time_activate.remains>45&buff.rune_of_power.remains>20)|target.time_to_die<25
		if {{CheckBoxOff(opt_alter_time) or SpellCooldown(alter_time_activate) >45} and BuffPresent(rune_of_power_aura)} or target.TimeToDie() <25
		{
			UseItemActions()
		}
	}
	if TalentPoints(invocation_talent)
	{
		#use_item,if=(cooldown.alter_time_activate.remains>45&buff.invokers_energy.remains>20)|target.time_to_die<25
		if {{CheckBoxOff(opt_alter_time) or SpellCooldown(alter_time_activate) >45} and BuffRemains(invokers_energy) >20} or target.TimeToDie() <25
		{
			UseItemActions()
		}
	}
	if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
	{
		#use_item,if=cooldown.alter_time_activate.remains>45|target.time_to_die<25
		if {CheckBoxOff(opt_alter_time) or SpellCooldown(alter_time_activate) >45} or target.TimeToDie() <25
		{
			UseItemActions()
		}
	}
	#frostfire_bolt,if=buff.alter_time.up&buff.brain_freeze.up
	if {CheckBoxOff(opt_alter_time) or BuffPresent(alter_time)} and BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
	#ice_lance,if=buff.alter_time.up&buff.fingers_of_frost.up
	if {CheckBoxOff(opt_alter_time) or BuffPresent(alter_time)} and BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	#nether_tempest,if=(!ticking|remains<tick_time)&target.time_to_die>6
	MageBomb()
	#frostbolt,if=debuff.frostbolt.stack<3
	if target.DebuffStacks(frostbolt) <3 Spell(frostbolt)
	if FrostIcyVeinsReady() or FrostIcyVeinsCooldown() >2
	{
		#frostfire_bolt,if=buff.brain_freeze.react&cooldown.icy_veins.remains>2
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
		#ice_lance,if=buff.fingers_of_frost.react&cooldown.icy_veins.remains>2
		if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	}
	#frostbolt
	Spell(frostbolt)
	if Speed() >0
	{
		if TalentPoints(ice_floes_talent)
		{
			#ice_floes,moving=1
			Spell(ice_floes)
		}
		#fire_blast,moving=1
		Spell(fire_blast)
		#ice_lance,moving=1
		Spell(ice_lance)
	}
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
	}

	#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
	if InCombat(no) ConjureManaGem()
	#frostfire_bolt,if=buff.alter_time.up&buff.brain_freeze.up
	if {CheckBoxOff(opt_alter_time) or BuffPresent(alter_time)} and BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
	#ice_lance,if=buff.alter_time.up&buff.fingers_of_frost.up
	if {CheckBoxOff(opt_alter_time) or BuffPresent(alter_time)} and BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	#nether_tempest,if=(!ticking|remains<tick_time)&target.time_to_die>6
	MageBomb()
	#frostbolt,if=debuff.frostbolt.stack<3
	if target.DebuffStacks(frostbolt) <3 Spell(frostbolt)
	if FrostIcyVeinsReady() or FrostIcyVeinsCooldown() >2
	{
		#frostfire_bolt,if=buff.brain_freeze.react&cooldown.icy_veins.remains>2
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
		#ice_lance,if=buff.fingers_of_frost.react&cooldown.icy_veins.remains>2
		if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	}
	#frostbolt
	Spell(frostbolt)
}

AddFunction FrostShortCooldownActions
{
	if InCombat(no)
	{
		#water_elemental
		if pet.Present(no) Spell(water_elemental)
		#snapshot_stats
		if TalentPoints(invocation_talent)
		{
			#evocation
			Spell(evocation)
		}
		if TalentPoints(rune_of_power_talent)
		{
			#rune_of_power
			Spell(rune_of_power)
		}
	}

	if TalentPoints(rune_of_power_talent)
	{
		#rune_of_power,if=buff.rune_of_power.remains<cast_time&buff.alter_time.down
		if BuffExpires(rune_of_power_aura) and BuffExpires(alter_time) Spell(rune_of_power)
		#rune_of_power,if=cooldown.icy_veins.remains=0&buff.rune_of_power.remains<20
		if FrostIcyVeinsReady() and BuffExpires(rune_of_power_aura) Spell(rune_of_power)
	}
	if TalentPoints(invocation_talent)
	{
        #evocation,if=(buff.invokers_energy.down|mana.pct<20)&buff.alter_time.down
		if {BuffExpires(invokers_energy) or ManaPercent() <20} and BuffExpires(alter_time) Spell(evocation)
        #evocation,if=cooldown.icy_veins.remains=0&buff.invokers_energy.remains<20
		if FrostIcyVeinsReady() and BuffRemains(invokers_energy) <20 Spell(evocation)
	}
	if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
	{
		#evocation,if=mana.pct<50,interrupt_if=mana.pct>95
		if ManaPercent() <50 and not {Casting(evocation) and ManaPercent() >95} Spell(evocation)
	}
	#frozen_orb,if=!buff.fingers_of_frost.react
	if BuffExpires(fingers_of_frost_aura) Spell(frozen_orb)
}

AddFunction FrostCooldownActions
{
	if InCombat(no)
	{
		#jade_serpent_potion
		UsePotion()
		#mirror_image
		Spell(mirror_image)
	}

	#counterspell,if=target.debuff.casting.react
	Interrupt()

	unless {TalentPoints(rune_of_power_talent) and BuffExpires(rune_of_power_aura)
			and {BuffExpires(alter_time) or FrostIcyVeinsReady()}}
		or {TalentPoints(invocation_talent)
			and {{{BuffExpires(invokers_energy) or ManaPercent() <20} and BuffExpires(alter_time)}
				or {FrostIcyVeinsReady() and BuffRemains(invokers_energy) <20}}}
		or {not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
			and not {Casting(evocation) and ManaPercent() >95} and ManaPercent() <50 and Spell(evocation)}
	{
		#mirror_image
		Spell(mirror_image)

		unless {BuffExpires(fingers_of_frost_aura) and Spell(frozen_orb)}
		{
			#icy_veins,if=(debuff.frostbolt.stack>=3&(buff.brain_freeze.react|buff.fingers_of_frost.react))|target.time_to_die<22,moving=0
			{
				if target.DebuffStacks(frostbolt) >=3 and {BuffPresent(brain_freeze_aura) or BuffPresent(fingers_of_frost_aura)} FrostIcyVeins()
				if target.TimeToDie() <22 FrostIcyVeins()
			}
			#blood_fury,if=buff.icy_veins.up|cooldown.icy_veins.remains>30|target.time_to_die<18
			if BuffPresent(icy_veins) or FrostIcyVeinsCooldown() >30 or target.TimeToDie() <18 Spell(blood_fury)
			#berserking,if=buff.icy_veins.up|target.time_to_die<18
			if BuffPresent(icy_veins) or target.TimeToDie() <18 Spell(berserking)
			#jade_serpent_potion,if=buff.icy_veins.up|target.time_to_die<45
			if BuffPresent(icy_veins) or target.TimeToDie() <45 UsePotion()
			if TalentPoints(presence_of_mind_talent)
			{
				#presence_of_mind,if=buff.icy_veins.up|cooldown.icy_veins.remains>15|target.time_to_die<15
				if BuffPresent(icy_veins) or FrostIcyVeinsCooldown() >15 or target.TimeToDie() <15 Spell(presence_of_mind)
			}
			#use_item,sync=alter_time_activate,if=buff.alter_time.down
			if {CheckBoxOff(opt_alter_time) or Spell(alter_time_activate)} and BuffExpires(alter_time) UseItemActions()
			#alter_time,if=buff.alter_time.down&buff.icy_veins.up
			if CheckBoxOn(opt_alter_time) and BuffExpires(alter_time) and BuffPresent(icy_veins) Spell(alter_time_activate)
			if TalentPoints(rune_of_power_talent)
			{
				#use_item,if=(cooldown.alter_time_activate.remains>45&buff.rune_of_power.remains>20)|target.time_to_die<25
				if {{CheckBoxOff(opt_alter_time) or SpellCooldown(alter_time_activate) >45} and BuffPresent(rune_of_power_aura)} or target.TimeToDie() <25
				{
					UseItemActions()
				}
			}
			if TalentPoints(invocation_talent)
			{
				#use_item,if=(cooldown.alter_time_activate.remains>45&buff.invokers_energy.remains>20)|target.time_to_die<25
				if {{CheckBoxOff(opt_alter_time) or SpellCooldown(alter_time_activate) >45} and BuffRemains(invokers_energy) >20} or target.TimeToDie() <25
				{
					UseItemActions()
				}
			}
			if not TalentPoints(rune_of_power_talent) and not TalentPoints(invocation_talent)
			{
				#use_item,if=cooldown.alter_time_activate.remains>45|target.time_to_die<25
				if {CheckBoxOff(opt_alter_time) or SpellCooldown(alter_time_activate) >45} or target.TimeToDie() <25
				{
					UseItemActions()
				}
			}
		}
	}
}

AddFunction FrostMovingActions
{
	if TalentPoints(ice_floes_talent)
	{
		#ice_floes,moving=1
		Spell(ice_floes)
	}
	#fire_blast,moving=1
	Spell(fire_blast)
	#ice_lance,moving=1
	Spell(ice_lance)
}

# Frost AoE rotation from Icy Veins Frost Mage Class Guide:
#	http://icy-veins.com/frost-mage-wow-pve-dps-rotation-cooldowns-abilities#sec-2
#
AddFunction FrostAoEActions
{
	# Freeze targets just before Frost Bomb explodes to increase damage due to Shatter.
	if TalentPoints(frost_bomb_talent) and target.DebuffPresent(frost_bomb) and target.DebuffRemains(frost_bomb) <0.5
	{
		Spell(frost_nova)
		if TalentPoints(ice_ward_talent) Spell(ice_ward)
		if pet.Present() Spell(water_elemental_freeze)
	}

	# Cast Flamestrike on cooldown.
	Spell(flamestrike)

	# Cast Mage Bomb on at least one target.
	{
		if TalentPoints(nether_tempest_talent)
		{
			if target.DebuffExpires(nether_tempest)
				or {target.DebuffRemains(nether_tempest) < target.NextTick(nether_tempest)}
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
	if TalentPoints(cold_snap_talent)
	{
		#cold_snap,if=health.pct<30
		Spell(cold_snap)
	}
}

AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	if BuffExpires(burst_haste any=1) and DebuffExpires(burst_haste_debuff) Spell(time_warp)
}
]],
}
