if NerienOvaleScripts.class == "MAGE" then

NerienOvaleScripts.script.MAGE.Nerien = {
	desc = "Nerien: Frost",
	code =
[[
# Nerien's mage script based on SimulationCraft.
#
# Frost:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#eb!022220
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
Define(blink 1953)
	SpellInfo(blink cd=15)
Define(brain_freeze_aura 57761)
	SpellInfo(brain_freeze_aura duration=15)
Define(cold_snap 11958)
	SpellInfo(cold_snap cd=180)
Define(combustion 11129)
	SpellInfo(combustion cd=45)
	SpellInfo(combustion addcd=45 glyph=glyph_of_combustion)
	SpellAddTargetDebuff(combustion combustion_aura=1)
Define(combustion_aura 83853)
	SpellInfo(combustion_aura duration=10 tick=1)
Define(conjure_mana_gem 759)
Define(counterspell 2139)
	SpellInfo(counterspell cd=24 duration=6)
Define(evocation 12051)
	SpellInfo(evocation cd=120 duration=6 tick=2)
	SpellInfo(evocation cd=10 talent=invocation_talent)
	SpellAddBuff(evocation evocation=1)
Define(fingers_of_frost_aura 44544)
	SpellInfo(fingers_of_frost_aura duration=15)
Define(fire_blast 2136)
	SpellInfo(fire_blast cd=8)
Define(fireball 133)
Define(frost_armor 7302)
Define(frost_bomb 112948)
	SpellInfo(frost_bomb cd=10 duration=5)
	SpellAddTargetDebuff(frost_bomb frost_bomb=1)
Define(frost_bomb_talent 15)
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
	SpellAddBuff(frozen_orb fingers_of_frost_aura=1)
Define(glyph_of_combustion 56368)
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
	SpellInfo(ice_floes cd=60 duration=10)
	SpellAddBuff(ice_floes ice_floes=1)
Define(ice_floes_talent 3)
Define(ice_lance 30455)
Define(icy_veins 12472)
	SpellInfo(icy_veins cd=180 duration=20)
	SpellAddBuff(icy_veins icy_veins=1)
Define(icy_veins_glyphed 131078)
	SpellInfo(icy_veins_glyphed cd=180 duration=20)
	SpellAddBuff(icy_veins_glyphed icy_veins_glyphed=1)
SpellList(icy_veins_aura 12472 131078)
Define(ignite 12654)
	SpellInfo(ignite duration=4 tick=2)
Define(incanters_ward_post 116267)
	SpellInfo(incanters_ward_post duration=15)
Define(incanters_ward_talent 18)
Define(inferno_blast 108853)
	SpellInfo(inferno_blast cd=8 )
Define(invocation 114003)
Define(invocation_talent 16)
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
	SpellInfo(rune_of_power cd=6)
Define(rune_of_power_talent 17)
Define(scorch 2948)
Define(scorch_talent 2)
Define(spellsteal 30449)
Define(time_warp 80353)
	SpellInfo(time_warp cd=300 duration=40)
	SpellAddBuff(time_warp time_warp=1)
Define(water_elemental 31687)
	SpellInfo(water_elemental cd=60)
Define(water_elemental_freeze 33395)
	SpellInfo(water_elemental_freeze cd=25 duration=8)
	SpellAddBuff(water_elemental_freeze fingers_of_frost_aura=1)
	SpellAddTargetDebuff(water_elemental_freeze water_elemental_freeze=1)

# Items
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
### Common mage actions.
###

AddFunction Interrupt
{
	Spell(counterspell)
	UseRacialInterruptActions()
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
	if Glyph(glyph_of_icy_veins no) FrostIcyVeinsCooldown()
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
		if BuffExpires(frost_armor 400) and BuffExpires(mage_armor 400) and BuffExpires(molten_armor 400) Spell(frost_armor)
		#water_elemental
		if pet.Present(no) Spell(water_elemental)
		#snapshot_stats
		#evocation
		if TalentPoints(invocation_talent) Spell(evocation)
		if False() and TalentPoints(rune_of_power_talent) Spell(rune_of_power)
		#jade_serpent_potion
		if CheckBoxOn(potions) and TargetClassification(worldboss) Item(jade_serpent_potion usable=1)
	}

	#counterspell,if=target.debuff.casting.react
	if TargetIsInterruptible() Interrupt()
	#cold_snap,if=health.pct<30
	if TalentPoints(cold_snap) and HealthPercent(less 30) Spell(cold_snap)
	#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
	if InCombat(no) and ItemCharges(mana_gem less 3) Spell(conjure_mana_gem)
	#time_warp,if=target.health.pct<25|time>5
	if {TargetHealthPercent(less 25) or TimeInCombat(more 5)} and BuffExpires(burst_haste any=1) Spell(time_warp)
	#presence_of_mind,if=buff.alter_time.down
	if TalentPoints(presence_of_mind_talent) and BuffExpires(alter_time) Spell(presence_of_mind)
	#water_elemental:freeze,if=buff.alter_time.down&buff.fingers_of_frost.stack<2
	if pet.Present() and BuffExpires(alter_time) and BuffStacks(fingers_of_frost_aura) <2 Spell(water_elemental_freeze)
	#icy_veins,if=target.time_to_die<22
	if TimeUntilTargetIsDead(less 22) FrostIcyVeins()
	#blood_fury,if=target.time_to_die<12
	if TimeUntilTargetIsDead() <12 Spell(blood_fury)
	#berserking,if=target.time_to_die<18
	if TimeUntilTargetIsDead() <18 Spell(berserking)
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
		#ice_lance,if=buff.fingers_of_frost.react&buff.fingers_of_frost.remains<5
		if BuffPresent(fingers_of_frost_aura) and BuffExpires(fingers_of_frost_aura 5) Spell(ice_lance)
		if BuffExpires(alter_time) and BuffPresent(invocation 20)
		{
			#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.invocation.remains>20&buff.alter_time.down
			if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() Spell(frozen_orb)
			#icy_veins,if=set_bonus.tier14_4pc_caster&buff.invocation.remains>20&buff.alter_time.down
			if ArmorSetParts(T14 more 3) FrostIcyVeins()
		}
		#icy_veins,if=!set_bonus.tier14_4pc_caster&dot.frozen_orb.ticking
		if ArmorSetParts(T14 less 4) and SpellCooldown(frozen_orb) >50 FrostIcyVeins()
	}
	#frost_bomb,if=!ticking
	if TalentPoints(frost_bomb_talent) and TargetDebuffExpires(frost_bomb) Spell(frost_bomb)
	if TalentPoints(rune_of_power_talent)
	{
		if BuffExpires(alter_time) and BuffPresent(rune_of_power 20)
		{
			#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.rune_of_power.remains>20&buff.alter_time.down
			if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() Spell(frozen_orb)
			#icy_veins,if=set_bonus.tier14_4pc_caster&buff.rune_of_power.remains>20&buff.alter_time.down
			if ArmorSetParts(T14 more 3) FrostIcyVeins()
		}
		#icy_veins,if=!set_bonus.tier14_4pc_caster&dot.frozen_orb.ticking
		if ArmorSetParts(T14 less 4) and SpellCooldown(frozen_orb) >50 FrostIcyVeins()
	}
	if TalentPoints(incanters_ward_talent)
	{
		if BuffExpires(alter_time)
		{
			#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.alter_time.down
			if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() Spell(frozen_orb)
			#icy_veins,if=set_bonus.tier14_4pc_caster&buff.alter_time.down
			if ArmorSetParts(T14 more 3) FrostIcyVeins()
		}
		#icy_veins,if=!set_bonus.tier14_4pc_caster&dot.frozen_orb.ticking
		if ArmorSetParts(T14 less 4) and SpellCooldown(frozen_orb) >50 FrostIcyVeins()
	}
	if not {TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
	{
		#icy_veins,if=dot.frozen_orb.ticking&buff.alter_time.down
		if SpellCooldown(frozen_orb) >50 and BuffExpires(alter_time) FrostIcyVeins()
	}
	#mirror_image
	Spell(mirror_image)
	if TalentPoints(invocation_talent)
	{
		#evocation,if=buff.invocation.down&buff.alter_time.down		
		if BuffExpires(invocation) and BuffExpires(alter_time) Spell(evocation)
	}
	#ice_lance,if=buff.fingers_of_frost.react&buff.fingers_of_frost.remains<2
	if BuffPresent(fingers_of_frost_aura) and BuffStacks(fingers_of_frost_aura) <2 Spell(ice_lance)
	if TalentPoints(rune_of_power_talent)
	{
		#rune_of_power,if=buff.rune_of_power.down&buff.alter_time.down
		if False() and BuffExpires(rune_of_power) and BuffExpires(alter_time) Spell(rune_of_power)
	}
	if TalentPoints(incanters_ward_talent)
	{
		#incanters_ward
		Spell(incanters_ward)
	}
	#jade_serpent_potion,if=buff.bloodlust.react|buff.icy_veins.up|target.time_to_die<=40
	if CheckBoxOn(potions) and TargetClassification(worldboss)
	{
		if BuffPresent(burst_haste any=1) or BuffPresent(icy_veins_aura) or TimeUntilTargetIsDead() <40
		{
			Item(jade_serpent_potion usable=1)
		}
	}
	if TalentPoints(invocation_talent)
	{
		if BuffExpires(alter_time)
		{
			if ManaPercent(more 28)
			{
				#blood_fury,if=buff.invocation.remains>15&buff.alter_time.down&mana.pct>28
				if BuffPresent(invocation 15) Spell(blood_fury)
				#/berserking,if=buff.invocation.remains>10&buff.alter_time.down&mana.pct>28
				if BuffPresent(invocation 10) Spell(berserking)
			}
			if BuffPresent(invocation 15) UseItemActions()
		}
		#frostbolt,if=debuff.frostbolt.stack<3
		if TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3) Spell(frostbolt)
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.invocation.remains>6
		if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) and BuffPresent(invocation 6) Spell(alter_time_activate)
	}
	if TalentPoints(rune_of_power_talent)
	{
		if BuffExpires(alter_time)
		{
			#blood_fury,if=buff.rune_of_power.remains>15&buff.alter_time.down
			if BuffPresent(rune_of_power 15) Spell(blood_fury)
			#/berserking,if=buff.rune_of_power.remains>10&buff.alter_time.down
			if BuffPresent(rune_of_power 10) Spell(berserking)
			if BuffPresent(rune_of_power 15) UseItemActions()
		}
		#frostbolt,if=debuff.frostbolt.stack<3
		if TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3) Spell(frostbolt)
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.rune_of_power.remains>6
		if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) and BuffPresent(rune_of_power 6) Spell(alter_time_activate)
	}
	if TalentPoints(incanters_ward_talent)
	{
		if BuffExpires(alter_time)
		{
			if BuffPresent(incanters_ward_post)
			{
				#blood_fury,if=buff.incanters_ward_post.react&buff.alter_time.down
				if BuffPresent(incanters_ward_post) Spell(blood_fury)
				#/berserking,if=buff.incanters_ward_post.react&buff.alter_time.down
				if BuffPresent(incanters_ward_post) Spell(berserking)
			}
			UseItemActions()
		}
		#frostbolt,if=debuff.frostbolt.stack<3
		if TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3) Spell(frostbolt)
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react
		if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) Spell(alter_time_activate)
	}
	if not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
	{
		if BuffExpires(alter_time)
		{
			#blood_fury,if=buff.alter_time.down
			if BuffPresent(incanters_ward_post) Spell(blood_fury)
			#/berserking,if=buff.alter_time.down
			if BuffPresent(incanters_ward_post) Spell(berserking)
			UseItemActions()
		}
		#frostbolt,if=debuff.frostbolt.stack<3
		if TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3) Spell(frostbolt)
		#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react
		if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) Spell(alter_time_activate)
	}
	if Level() >=87 and {BuffPresent(alter_time) or SpellCooldown(alter_time_activate) >4}
	{
		#frostfire_bolt,if=buff.brain_freeze.react&(buff.alter_time.up|cooldown.alter_time_activate.remains>4)
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
		#ice_lance,if=buff.fingers_of_frost.react&(buff.alter_time.up|cooldown.alter_time_activate.remains>4)
		if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	}
	if Level() <87
	{
		#frostfire_bolt,if=buff.brain_freeze.react
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
	}
	#ice_lance,if=buff.fingers_of_frost.react
	if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2
	if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2 Spell(frozen_orb)
	#mana_gem,if=mana.pct<84&buff.alter_time.down
	if ManaPercent(less 84) and BuffExpires(alter_time) Item(mana_gem)
	if not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent)}
	{
		#evocation,if=mana.pct<10&target.time_to_die>=30
		if ManaPercent(less 10) and TimeUntilTargetIsDead() >=30 Spell(evocation)
	}
	#frostbolt
	Spell(frostbolt)
	#scorch,moving=1
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
		if BuffExpires(frost_armor 400) and BuffExpires(mage_armor 400) and BuffExpires(molten_armor 400) Spell(frost_armor)
		#water_elemental
		if pet.Present(no) Spell(water_elemental)
		#snapshot_stats
		#evocation
		if TalentPoints(invocation_talent) Spell(evocation)
		#conjure_mana_gem,if=mana_gem_charges<3&target.debuff.invulnerable.react
		if ItemCharges(mana_gem less 3) Spell(conjure_mana_gem)
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
	if TalentPoints(invocation_talent)
	{
		#ice_lance,if=buff.fingers_of_frost.react&buff.fingers_of_frost.remains<5
		if BuffPresent(fingers_of_frost_aura) and BuffExpires(fingers_of_frost_aura 5) Spell(ice_lance)
	}
	#frost_bomb,if=!ticking
	if TalentPoints(frost_bomb_talent) and TargetDebuffExpires(frost_bomb) Spell(frost_bomb)
	if TalentPoints(invocation_talent)
	{
		#evocation,if=buff.invocation.down&buff.alter_time.down		
		if BuffExpires(invocation) and BuffExpires(alter_time) Spell(evocation)
	}
	#ice_lance,if=buff.fingers_of_frost.react&buff.fingers_of_frost.remains<2
	if BuffPresent(fingers_of_frost_aura) and BuffStacks(fingers_of_frost_aura) <2 Spell(ice_lance)
	#frostbolt,if=debuff.frostbolt.stack<3
	if TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3) Spell(frostbolt)
	if Level() >=87 and {BuffPresent(alter_time) or SpellCooldown(alter_time_activate) >4}
	{
		#frostfire_bolt,if=buff.brain_freeze.react&(buff.alter_time.up|cooldown.alter_time_activate.remains>4)
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
		#ice_lance,if=buff.fingers_of_frost.react&(buff.alter_time.up|cooldown.alter_time_activate.remains>4)
		if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	}
	if Level() <87
	{
		#frostfire_bolt,if=buff.brain_freeze.react
		if BuffPresent(brain_freeze_aura) Spell(frostfire_bolt)
	}
	#ice_lance,if=buff.fingers_of_frost.react
	if BuffPresent(fingers_of_frost_aura) Spell(ice_lance)
	#frostbolt
	Spell(frostbolt)
	#scorch,moving=1
	#fire_blast,moving=1
	#ice_lance,moving=1
}

AddFunction FrostShortCooldownActions
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		#arcane_brilliance
		unless {BuffExpires(spell_power_multiplier 400 any=1) or BuffExpires(critical_strike 400 any=1)}
			or {BuffExpires(frost_armor 400) and BuffExpires(mage_armor 400) and BuffExpires(molten_armor 400)}
		{
			#water_elemental
			if pet.Present(no) Spell(water_elemental)
			#snapshot_stats
			#evocation
			unless TalentPoints(invocation_talent) and Spell(evocation)
			{
				if False() and TalentPoints(rune_of_power_talent) Spell(rune_of_power)
			}
		}
	}

	#counterspell,if=target.debuff.casting.react
	if TargetIsInterruptible() Interrupt()
	#presence_of_mind,if=buff.alter_time.down
	if TalentPoints(presence_of_mind_talent) and BuffExpires(alter_time) Spell(presence_of_mind)
	#water_elemental:freeze,if=buff.alter_time.down&buff.fingers_of_frost.stack<2
	if pet.Present() and BuffExpires(alter_time) and BuffStacks(fingers_of_frost_aura) <2 Spell(water_elemental_freeze)
	unless {BuffPresent(alter_time) and {BuffPresent(brain_freeze_aura) or BuffPresent(fingers_of_frost_aura) or BuffPresent(presence_of_mind)}}
	{
		if TalentPoints(invocation_talent)
		{
			unless BuffPresent(fingers_of_frost_aura) and BuffExpires(fingers_of_frost_aura 5)
			{
				if BuffExpires(alter_time) and BuffPresent(invocation 20)
				{
					#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.invocation.remains>20&buff.alter_time.down
					if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() Spell(frozen_orb)
				}
			}
		}
		#presence_of_mind,if=buff.alter_time.down
		if TalentPoints(presence_of_mind_talent) and BuffExpires(alter_time) Spell(presence_of_mind)
		unless TalentPoints(frost_bomb_talent) and TargetDebuffExpires(frost_bomb) and Spell(frost_bomb)
		{
			if TalentPoints(rune_of_power_talent)
			{
				if BuffExpires(alter_time) and BuffPresent(rune_of_power 20)
				{
					#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.rune_of_power.remains>20&buff.alter_time.down
					if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() Spell(frozen_orb)
				}
			}
			if TalentPoints(incanters_ward_talent)
			{
				if BuffExpires(alter_time)
				{
					#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains<gcd&buff.alter_time.down
					if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() Spell(frozen_orb)
				}
			}
			unless TalentPoints(invocation_talent) and BuffExpires(invocation) and BuffExpires(alter_time) and Spell(evocation)
				or {BuffPresent(fingers_of_frost_aura) and BuffStacks(fingers_of_frost_aura) <2}
			{
				if TalentPoints(rune_of_power_talent)
				{
					#rune_of_power,if=buff.rune_of_power.down&buff.alter_time.down
					if False() and BuffExpires(rune_of_power) and BuffExpires(alter_time) Spell(rune_of_power)
				}
				if TalentPoints(incanters_ward_talent)
				{
					#incanters_ward
					Spell(incanters_ward)
				}
				unless {TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3)}
					or {Level() >=87 and {BuffPresent(alter_time) or SpellCooldown(alter_time_activate) >4}
						and {BuffPresent(brain_freeze_aura) or BuffPresent(fingers_of_frost_aura)}}
					or {Level() <87	and BuffPresent(brain_freeze_aura)}
					or BuffPresent(fingers_of_frost_aura)
				{
					#frozen_orb,if=target.time_to_die>=4&buff.fingers_of_frost.stack<2
					if TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2 Spell(frozen_orb)
				}
			}
		}
	}
}

AddFunction FrostCooldownActions
{
	if InCombat(no)
	{
		#flask,type=warm_sun
		#food,type=mogu_fish_stew
		unless {BuffExpires(spell_power_multiplier 400 any=1) or BuffExpires(critical_strike 400 any=1)}
			or {BuffExpires(frost_armor 400) and BuffExpires(mage_armor 400) and BuffExpires(molten_armor 400)}
			or {pet.Present(no) and Spell(water_elemental)}
			or {TalentPoints(invocation_talent) and Spell(evocation)}
			or {False() and TalentPoints(rune_of_power_talent) and Spell(rune_of_power)}
		{
			#jade_serpent_potion
			if CheckBoxOn(potions) and TargetClassification(worldboss) Item(jade_serpent_potion usable=1)
		}
	}

	unless pet.Present() and BuffExpires(alter_time) and BuffStacks(fingers_of_frost_aura) <2 and Spell(water_elemental_freeze)
	{
		#icy_veins,if=target.time_to_die<22
		if TimeUntilTargetIsDead(less 22) FrostIcyVeins()
		#blood_fury,if=target.time_to_die<12
		if TimeUntilTargetIsDead() <12 Spell(blood_fury)
		#berserking,if=target.time_to_die<18
		if TimeUntilTargetIsDead() <18 Spell(berserking)
		unless {BuffPresent(alter_time) and {BuffPresent(brain_freeze_aura) or BuffPresent(fingers_of_frost_aura) or BuffPresent(presence_of_mind)}}
		{
			if TalentPoints(invocation_talent)
			{
				unless {BuffPresent(fingers_of_frost_aura) and BuffExpires(fingers_of_frost_aura 5)}
				{
					if BuffExpires(alter_time) and BuffPresent(invocation 20)
					{
						unless TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() and Spell(frozen_orb)
						{
							#icy_veins,if=set_bonus.tier14_4pc_caster&buff.invocation.remains>20&buff.alter_time.down
							if ArmorSetParts(T14 more 3) FrostIcyVeins()
						}
					}
					#icy_veins,if=!set_bonus.tier14_4pc_caster&dot.frozen_orb.ticking
					if ArmorSetParts(T14 less 4) and SpellCooldown(frozen_orb) >50 FrostIcyVeins()
				}
			}
			unless {TalentPoints(presence_of_mind_talent) and BuffExpires(alter_time) and Spell(presence_of_mind)}
				or {TalentPoints(frost_bomb_talent) and TargetDebuffExpires(frost_bomb) and Spell(frost_bomb)}
			{
				if TalentPoints(rune_of_power_talent)
				{
					if BuffExpires(alter_time) and BuffPresent(rune_of_power 20)
					{
						unless TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() and Spell(frozen_orb)
						{
							#icy_veins,if=set_bonus.tier14_4pc_caster&buff.rune_of_power.remains>20&buff.alter_time.down
							if ArmorSetParts(T14 more 3) FrostIcyVeins()
						}
					}
					#icy_veins,if=!set_bonus.tier14_4pc_caster&dot.frozen_orb.ticking
					if ArmorSetParts(T14 less 4) and SpellCooldown(frozen_orb) >50 FrostIcyVeins()
				}
				if TalentPoints(incanters_ward_talent)
				{
					if BuffExpires(alter_time)
					{
						unless TimeUntilTargetIsDead() >=4 and BuffStacks(fingers_of_frost_aura) <2	and FrostIcyVeinsCooldown() < GCD() and Spell(frozen_orb)
						{
							#icy_veins,if=set_bonus.tier14_4pc_caster&buff.alter_time.down
							if ArmorSetParts(T14 more 3) FrostIcyVeins()
						}
					}
					#icy_veins,if=!set_bonus.tier14_4pc_caster&dot.frozen_orb.ticking
					if ArmorSetParts(T14 less 4) and SpellCooldown(frozen_orb) >50 FrostIcyVeins()
				}
				if not {TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
				{
					#icy_veins,if=dot.frozen_orb.ticking&buff.alter_time.down
					if SpellCooldown(frozen_orb) >50 and BuffExpires(alter_time) FrostIcyVeins()
				}
				#mirror_image
				Spell(mirror_image)
				unless {TalentPoints(invocation_talent) and BuffExpires(invocation) and BuffExpires(alter_time) and Spell(evocation)}
					or {BuffPresent(fingers_of_frost_aura) and BuffStacks(fingers_of_frost_aura) <2}
					or {TalentPoints(rune_of_power_talent) and False() and BuffExpires(rune_of_power) and BuffExpires(alter_time) and Spell(rune_of_power)}
					or {TalentPoints(incanters_ward_talent) and Spell(incanters_ward)}
				{
					#jade_serpent_potion,if=buff.bloodlust.react|buff.icy_veins.up|target.time_to_die<=40
					if CheckBoxOn(potions) and TargetClassification(worldboss)
					{
						if BuffPresent(burst_haste any=1) or BuffPresent(icy_veins_aura) or TimeUntilTargetIsDead() <40
						{
							Item(jade_serpent_potion usable=1)
						}
					}
					if TalentPoints(invocation_talent)
					{
						if BuffExpires(alter_time)
						{
							if ManaPercent(more 28)
							{
								#blood_fury,if=buff.invocation.remains>15&buff.alter_time.down&mana.pct>28
								if BuffPresent(invocation 15) Spell(blood_fury)
								#/berserking,if=buff.invocation.remains>10&buff.alter_time.down&mana.pct>28
								if BuffPresent(invocation 10) Spell(berserking)
							}
							if BuffPresent(invocation 15) UseItemActions()
						}
						unless TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3)
						{
							#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.invocation.remains>6
							if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) and BuffPresent(invocation 6)
							{
								Spell(alter_time_activate)
							}
						}
					}
					if TalentPoints(rune_of_power_talent)
					{
						if BuffExpires(alter_time)
						{
							#blood_fury,if=buff.rune_of_power.remains>15&buff.alter_time.down
							if BuffPresent(rune_of_power 15) Spell(blood_fury)
							#/berserking,if=buff.rune_of_power.remains>10&buff.alter_time.down
							if BuffPresent(rune_of_power 10) Spell(berserking)
							if BuffPresent(rune_of_power 15) UseItemActions()
						}
						unless TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3)
						{
							#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react&buff.rune_of_power.remains>6
							if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura) and BuffPresent(rune_of_power 6)
							{
								Spell(alter_time_activate)
							}
						}
					}
					if TalentPoints(incanters_ward_talent)
					{
						if BuffExpires(alter_time)
						{
							if BuffPresent(incanters_ward_post)
							{
								#blood_fury,if=buff.incanters_ward_post.react&buff.alter_time.down
								if BuffPresent(incanters_ward_post) Spell(blood_fury)
								#/berserking,if=buff.incanters_ward_post.react&buff.alter_time.down
								if BuffPresent(incanters_ward_post) Spell(berserking)
							}
							UseItemActions()
						}
						unless TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3)
						{
							#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react
							if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura)
							{
								Spell(alter_time_activate)
							}
						}
					}
					if not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent) or TalentPoints(incanters_ward_talent)}
					{
						if BuffExpires(alter_time)
						{
							#blood_fury,if=buff.alter_time.down
							if BuffPresent(incanters_ward_post) Spell(blood_fury)
							#/berserking,if=buff.alter_time.down
							if BuffPresent(incanters_ward_post) Spell(berserking)
							UseItemActions()
						}
						unless TimeUntilTargetIsDead() >20 and TargetDebuffExpires(frostbolt 3 stacks=3)
						{
							#alter_time,if=buff.alter_time.down&buff.brain_freeze.react&buff.fingers_of_frost.react
							if BuffExpires(alter_time) and BuffPresent(brain_freeze_aura) and BuffPresent(fingers_of_frost_aura)
							{
								Spell(alter_time_activate)
							}
						}
					}
				}
			}
		}
	}
}

AddFunction FrostManaActions
{
	#mana_gem,if=mana.pct<84&buff.alter_time.down
	if ManaPercent(less 84) and BuffExpires(alter_time) Item(mana_gem)
	if not {TalentPoints(invocation_talent) or TalentPoints(rune_of_power_talent)}
	{
		#evocation,if=mana.pct<10&target.time_to_die>=30
		if ManaPercent(less 10) and TimeUntilTargetIsDead() >=30 Spell(evocation)
	}
}

AddIcon mastery=3 help=Blink size=small
{
	Spell(blink)
}

AddIcon mastery=3 help=main
{
	FrostMainActions()
}

AddIcon mastery=3 help=cd
{
	FrostShortCooldownActions()
}

AddIcon mastery=3 help=cd
{
	FrostCooldownActions()
}

AddIcon mastery=3 help=mana size=small
{
	FrostManaActions()
}
]],
}

end