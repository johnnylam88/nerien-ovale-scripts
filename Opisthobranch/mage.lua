if NerienOvaleScripts.class == "MAGE" then

NerienOvaleScripts.script.MAGE.Opisthobranch = {
	desc = "Opisthobranch: Arcane, Fire, Frost",
	code =
[[
# Opisthobranch: Arcane, Fire, Frost
#
# Caveats:
# 1. The entire arcane rotation will change based on which level 90 talent you
#    take, and it is an inferior spec atm. When MoP comes, you'll get new
#    scripts with rotations based on these talents.
#
# 2. Combustion usage is heavily dependent on gear and situation, so I have left
#    out a combustion suggestion. I would strongly advise users of this script
#    to get the CombustionHelper addon.
#
# 3. I have left many cooldowns (trinkets etc.) up to the user.

Define(alter_time 110909)
  SpellInfo(alter_time duration=6 )
  SpellAddBuff(alter_time alter_time=1)
Define(alter_time_activate 108978)
  SpellInfo(alter_time_activate duration=10 cd=180 )
Define(arcane_barrage 44425)
  SpellInfo(arcane_barrage cd=3 )
Define(arcane_blast 30451)
Define(arcane_brilliance 1459)
  SpellInfo(arcane_brilliance duration=3600 )
  SpellAddBuff(arcane_brilliance arcane_brilliance=1)
Define(arcane_charge 36032)
  SpellInfo(arcane_charge duration=10 )
Define(arcane_missiles 5143)
Define(arcane_missiles_aura 79683)
  SpellInfo(arcane_missiles_aura duration=20 )
  SpellAddBuff(arcane_missiles_aura arcane_missiles_aura=1)
Define(arcane_power 12042)
  SpellInfo(arcane_power duration=15 cd=90 )
  SpellAddBuff(arcane_power arcane_power=1)
Define(berserking 26297)
  SpellInfo(berserking duration=10 cd=180 )
  SpellAddBuff(berserking berserking=1)
Define(blazing_speed 108843)
Define(blood_fury 20572)
  SpellInfo(blood_fury duration=15 cd=120 )
  SpellAddBuff(blood_fury blood_fury=1)
Define(brain_freeze 57761)
Define(cold_snap 11958)
  SpellInfo(cold_snap cd=180 )
Define(combustion 11129)
  SpellInfo(combustion cd=45 )
Define(conjure_mana_gem 759)
Define(counterspell 2139)
  SpellInfo(counterspell duration=6 cd=24 )
Define(deep_freeze 44572)
  SpellInfo(deep_freeze cd=30)
  SpellAddTargetDebuff(deep_freeze)
Define(evocation 12051)
  SpellInfo(evocation duration=6 cd=120 )
  SpellAddBuff(evocation evocation=1)
Define(fingers_of_frost 44544)
  SpellInfo(fingers_of_frost duration=15 )
  SpellAddBuff(fingers_of_frost fingers_of_frost=1)
Define(fire_blast 2136)
  SpellInfo(fire_blast cd=8 )
Define(fireball 133)
Define(frost_armor 7302)
  SpellAddBuff(frost_armor frost_armor=1)
Define(frost_bomb 112948)
  SpellInfo(frost_bomb duration=2 )
  SpellAddTargetDebuff(frost_bomb frost_bomb=1)
Define(frostbolt 116)
  SpellInfo(frostbolt duration=15 )
  SpellAddTargetDebuff(frostbolt frostbolt=1)
Define(frostfire_bolt 44614)
  SpellInfo(frostfire_bolt duration=8 )
  SpellAddTargetDebuff(frostfire_bolt frostfire_bolt=1)
Define(frozen_orb 84714)
  SpellInfo(frozen_orb duration=10 cd=60 )
Define(heating_up 48107)
  SpellInfo(heating_up duration=10 )
  SpellAddBuff(heating_up heating_up=1)
Define(ice_barrier 11426)
  SpellInfo(ice_barrier cd=25)
  SpellAddBuff(ice_barrier ice_barrier=1)
Define(ice_floes 108839)
  SpellInfo(ice_floes cd=90 )
  SpellAddBuff(ice_floes ice_floes=1)
Define(ice_lance 30455)
Define(ice_ward 111264)
  SpellInfo(ice_ward duration=30 cd=20)
  SpellAddBuff(ice_ward ice_ward=1)
Define(icy_veins 12472)
  SpellInfo(icy_veins duration=20 cd=180 )
  SpellAddBuff(icy_veins icy_veins=1)
Define(ignite 12654)
  SpellInfo(ignite duration=4 tick=2 )
  SpellAddTargetDebuff(ignite ignite=1)
Define(inferno_blast 108853)
  SpellInfo(inferno_blast cd=8 )
Define(invocation 114003)
Define(living_bomb 44457)
  SpellInfo(living_bomb duration=12)
  SpellAddTargetDebuff(living_bomb living_bomb=1)
Define(mage_armor 6117)
  SpellAddBuff(mage_armor mage_armor=1)
Define(mana_gem 56597)
Define(mirror_image 55342)
  SpellInfo(mirror_image duration=30 cd=180 )
  SpellAddBuff(mirror_image mirror_image=1)
Define(molten_armor 30482)
  SpellAddBuff(molten_armor molten_armor=1)
Define(nether_tempest 114923)
  SpellInfo(nether_tempest duration=12 tick=1 )
  SpellAddTargetDebuff(nether_tempest nether_tempest=1)
Define(presence_of_mind 12043)
  SpellInfo(presence_of_mind cd=90 )
  SpellAddBuff(presence_of_mind presence_of_mind=1)
Define(pyroblast 11366)
  SpellInfo(pyroblast duration=18 tick=3 )
  SpellAddTargetDebuff(pyroblast pyroblast=1)
Define(pyroblast_aura 48108)
  SpellInfo(pyroblast_aura duration=15 )
  SpellAddBuff(pyroblast_aura pyroblast_aura=1)
Define(rune_of_power 116011)
  SpellInfo(rune_of_power duration=60 cd=6 )
Define(scorch 2948)
Define(time_warp 35346)
  SpellInfo(time_warp duration=6 cd=15 )
  SpellAddBuff(time_warp time_warp=1)
Define(water_elemental 63859)
Define(water_elemental_freeze 33395)
  SpellInfo(water_elemental_freeze duration=8 cd=25 )
  SpellAddBuff(water_elemental_freeze water_elemental_freeze=1)
Define(living_bomb_talent 14)
Define(ice_ward_talent 8)
Define(ice_floes_talent 3)
Define(ice_barrier_talent 6)
Define(frost_bomb_talent 15)
Define(nether_tempest_talent 13)
Define(blazing_speed_talent 5)
Define(presence_of_mind_talent 1)
Define(scorch_talent 2)
AddIcon mastery=1 help=main
{
    if not InCombat() 
    {
    if not BuffPresent(arcane_brilliance) Spell(arcane_brilliance)
    if ItemCharges(36799) <3 Spell(conjure_mana_gem)
    }

    if BuffPresent(presence_of_mind) Spell(arcane_blast)
    if not target.DebuffPresent(living_bomb) and TalentPoints(living_bomb_talent) Spell(living_bomb)
    if not target.DebuffPresent(frost_bomb) and TalentPoints(frost_bomb_talent) Spell(frost_bomb)
    if not target.DebuffPresent(nether_tempest) and TalentPoints(nether_tempest_talent) Spell(nether_tempest)
    if BuffPresent(arcane_power) and BuffPresent(arcane_missiles_aura) Spell(arcane_missiles)
    if BuffPresent(arcane_power) Spell(arcane_blast)
    if ManaPercent() <=30 Spell(evocation)
    if BuffPresent(arcane_missiles_aura) and BuffRemains(arcane_missiles_aura) <3 Spell(arcane_missiles)
    if BuffStacks(arcane_missiles_aura) ==2 Spell(arcane_missiles)
    if BuffStacks(arcane_missiles_aura) <=1 and ManaPercent(more 79) Spell(arcane_blast)
    if BuffStacks(arcane_charge) ==6 and ManaPercent(less 80) Spell(arcane_barrage)
    if BuffStacks(arcane_charge) >=4 and ManaPercent(less 80) Spell(arcane_barrage)
    if BuffStacks(arcane_charge) <5 and ManaPercent(more 79) Spell(arcane_blast)
    if BuffStacks(arcane_charge) ==5 and ManaPercent(less 80) and BuffStacks(arcane_missiles_aura) ==1 Spell(arcane_missiles)
    if BuffStacks(arcane_charge) <4 and ManaPercent(less 80) Spell(arcane_blast)
    if {BuffStacks(arcane_charge) >=4 and ManaPercent(less 80)} and BuffStacks(arcane_missiles_aura) ==1 Spell(arcane_missiles)
    Spell(arcane_blast)
}
AddCheckBox(df "Deep Freeze" mastery=1)
AddIcon mastery=1 help=cd
{
    if CheckBoxOn(df) Spell(deep_freeze usable=1)
    if not BuffPresent(ice_barrier) and TalentPoints(ice_barrier_talent) Spell(ice_barrier)
    if not BuffPresent(ice_ward) and TalentPoints(ice_ward_talent) Spell(ice_ward)
}
AddIcon mastery=1 help=offgcd
{
    if target.IsInterruptible() Spell(counterspell)
    Spell(arcane_power usable=1)
    if ManaPercent(less 80) and BuffPresent(arcane_power) Item(36799)
    if TalentPoints(blazing_speed_talent) Spell(blazing_speed)
}

AddIcon mastery=2 help=main
{
    if not InCombat() 
    {
    if not BuffPresent(arcane_brilliance) Spell(arcane_brilliance)
    if ItemCharges(36799) <3 Spell(conjure_mana_gem)
    }
    if not target.DebuffPresent(living_bomb) and TalentPoints(living_bomb_talent) Spell(living_bomb)
    if not target.DebuffPresent(frost_bomb) and TalentPoints(frost_bomb_talent) Spell(frost_bomb)
    if not target.DebuffPresent(nether_tempest) and TalentPoints(nether_tempest_talent) Spell(nether_tempest)
    if BuffPresent(pyroblast_aura) and BuffRemains(pyroblast_aura) <2 Spell(pyroblast)
    if not target.DebuffPresent(pyroblast) and BuffPresent(pyroblast_aura) Spell(pyroblast)
    if BuffPresent(pyroblast_aura) and BuffPresent(heating_up) Spell(pyroblast)
    if BuffPresent(heating_up) and BuffExpires(pyroblast_aura) Spell(inferno_blast)
    Spell(fireball)
}
AddCheckBox(df "Deep Freeze" mastery=2)
AddIcon mastery=2 help=cd
{
    if CheckBoxOn(df) Spell(deep_freeze usable=1)
    if not BuffPresent(ice_barrier) and TalentPoints(ice_barrier_talent) Spell(ice_barrier)
    if not BuffPresent(ice_ward) and TalentPoints(ice_ward_talent) Spell(ice_ward)
}
AddIcon mastery=2 help=offgcd
{
    if target.IsInterruptible() Spell(counterspell)
    if ManaPercent(less 80) Item(36799)
    if TalentPoints(blazing_speed_talent) Spell(blazing_speed)
}

AddIcon mastery=3 help=main
{
    if not InCombat() 
    {
    if not BuffPresent(arcane_brilliance) Spell(arcane_brilliance)
    if ItemCharges(36799) <3 Spell(conjure_mana_gem)
    }
    if TargetDebuffPresent(deep_freeze) and BuffPresent(brain_freeze) Spell(frostfire_bolt)
    if TargetDebuffPresent(deep_freeze) and BuffPresent(fingers_of_frost) Spell(ice_lance)
    if TargetDebuffPresent(deep_freeze) Spell(frostbolt)
    if BuffStacks(fingers_of_frost) <2 Spell(water_elemental_freeze usable=1)
    if not target.DebuffPresent(living_bomb) and TalentPoints(living_bomb_talent) Spell(living_bomb)
    if not target.DebuffPresent(frost_bomb) and TalentPoints(frost_bomb_talent) Spell(frost_bomb usable=1)
    if not target.DebuffPresent(nether_tempest) and TalentPoints(nether_tempest_talent) Spell(nether_tempest)
    if BuffPresent (fingers_of_frost) and BuffRemains(fingers_of_frost) <3 Spell(ice_lance)
    if BuffPresent(brain_freeze) Spell(frostfire_bolt)
    if BuffStacks(fingers_of_frost) <=1 Spell(frozen_orb)
    if BuffStacks(fingers_of_frost) >1 Spell(ice_lance)
    Spell(frostbolt)
}
AddCheckBox(df "Deep Freeze" mastery=3)
AddIcon mastery=3 help=cd
{
    if CheckBoxOn(df) Spell(deep_freeze usable=1)
    if not BuffPresent(ice_barrier) and TalentPoints(ice_barrier_talent) Spell(ice_barrier)
    if not BuffPresent(ice_ward) and TalentPoints(ice_ward_talent) Spell(ice_ward)
}
AddIcon mastery=3 help=offgcd
{
    if target.IsInterruptible() Spell(counterspell)
    if ManaPercent(less 80) Item(36799)
    if TalentPoints(blazing_speed_talent) Spell(blazing_speed)
    Spell(icy_veins)
}


AddCheckBox(mob "Mobility")
AddIcon help=Mobility size=small checkboxon=mob
{
    if TalentPoints(presence_of_mind_talent) Spell(presence_of_mind)
    if TalentPoints(ice_floes_talent) Spell(ice_floes)
    if TalentPoints(scorch_talent) Spell(scorch)
}
]]
}

end