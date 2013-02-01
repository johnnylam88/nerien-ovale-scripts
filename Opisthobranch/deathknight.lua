if NerienOvaleScripts.class == "DEATHKNIGHT" then

NerienOvaleScripts.script.DEATHKNIGHT.Opisthobranch = {
	desc = "[5.0] Opisthobranch: Blood, Frost, Unholy",
	code =
[[
# Opisthobranch: Blood, Frost, Unholy

Define(army_of_the_dead 42650)
  SpellInfo(army_of_the_dead duration=4 frost=1 blood=1 unholy=1 runicpower=-300 xxx=0 cd=600 )
  SpellAddBuff(army_of_the_dead army_of_the_dead=1)
Define(blood_boil 48721)
 SpellInfo(blood_boil blood=1 )
Define(blood_charge 114851)
  SpellInfo(blood_charge duration=25)
  SpellAddBuff(blood_charge blood_charge=1)
Define(blood_fury 20572)
  SpellInfo(blood_fury duration=15 cd=120 )
  SpellAddBuff(blood_fury blood_fury=1)
Define(blood_plague 55078)
  SpellInfo(blood_plague duration=30 tick=3 )
  SpellAddTargetDebuff(blood_plague blood_plague=1)
Define(blood_presence 48263)
  SpellAddBuff(blood_presence blood_presence=1)
Define(blood_shield 77535)
 SpellInfo(blood_shield duration=10 )
 SpellAddBuff(blood_shield blood_shield=1)
Define(blood_strike 49143)
  SpellInfo(blood_strike runicpower=200 )
Define(blood_tap 45529)
Define(bone_shield 49222)
 SpellInfo(bone_shield duration=300 cd=60 )
Define(crimson_scourge 81141)
 SpellInfo(crimson_scourge duration=15)
 SpellAddBuff(crimson_scourge crimson_scourge=1)
Define(dancing_rune_weapon 49028)
 SpellInfo(dancing_rune_weapon runicpower=600 duration=12 cd=90 )
Define(dark_simulacrum 77606)
Define(dark_transformation 63560)
  SpellInfo(dark_transformation duration=30 unholy=1 runicpower=-100 xxx=0 )
  SpellAddBuff(dark_transformation dark_transformation=1)
Define(death_and_decay 43265)
  SpellInfo(death_and_decay duration=10 unholy=1 runicpower=-100 xxx=0 cd=30 )
  SpellAddBuff(death_and_decay death_and_decay=1)
Define(death_coil 47541)
  SpellInfo(death_coil runicpower=400 )
Define(death_strike 49998)
  SpellInfo(death_strike frost=1 unholy=1 runicpower=-200 xxx=0 )
Define(desecrated_ground 108201)
  SpellInfo(desecrated_ground duration=10 cd=120 )
Define(empower_rune_weapon 47568)
  SpellInfo(empower_rune_weapon runicpower=-250 xxx=0 cd=300 )
Define(festering_strike 85948)
  SpellInfo(festering_strike frost=1 blood=1 runicpower=-200 xxx=0 )
Define(freezing_fog 59052)
  SpellInfo(freezing_fog duration 15)
  SpellAddBuff(freezing_fog freezing_fog=1)
Define(frost_fever 55095)
  SpellInfo(frost_fever duration=30 tick=3 )
  SpellAddTargetDebuff(frost_fever frost_fever=1)
Define(frost_presence 48266)
  SpellAddBuff(frost_presence frost_presence=1)
Define(frost_strike 49143)
  SpellInfo(frost_strike runicpower=200 )
Define(gorefiends_grasp 108199)
  SpellInfo(gorefiends_grasp cd=60 )
Define(heart_strike 45902)
 SpellInfo(heart_strike blood=1 runicpower=-100 xxx=0 )
Define(horn_of_winter 57330)
  SpellInfo(horn_of_winter duration=300 runicpower=-100 xxx=0 cd=20 )
  SpellAddBuff(horn_of_winter horn_of_winter=1)
Define(howling_blast 49184)
  SpellInfo(howling_blast frost=1 runicpower=-100 xxx=0 )
Define(icy_touch 45477)
  SpellInfo(icy_touch frost=1 runicpower=-100 xxx=0 )
Define(killing_machine 51124)
  SpellInfo(killing_machine duration=10 )
Define(mind_freeze 47528)
 SpellInfo(mind_freeze cd=15 )
Define(mogu_power_potion_aura 105706)
  SpellInfo(mogu_power_potion_aura duration=25 cd=1 )
  SpellAddBuff(mogu_power_potion_aura mogu_power_potion_aura=1)
Define(obliterate 49020)
  SpellInfo(obliterate frost=1 unholy=1 runicpower=-200 xxx=0 )
Define(outbreak 77575)
  SpellInfo(outbreak runicpower=0 cd=60 )
Define(pestilence 50842)
  SpellInfo(pestilence blood=1 xxx=0)
Define(pillar_of_frost 51271)
  SpellInfo(pillar_of_frost duration=20 frost=1 runicpower=-100 xxx=0 cd=60 )
  SpellAddBuff(pillar_of_frost pillar_of_frost=1)
Define(plague_leech 123693)
  SpellInfo(plague_leech cd=25 )
Define(plague_strike 45462)
  SpellInfo(plague_strike unholy=1 runicpower=-100 xxx=0 )
Define(raise_dead 46584)
  SpellInfo(raise_dead cd=120 )
  SpellAddBuff(raise_dead raise_dead=1)
Define(remorseless_winter 108200)
  SpellInfo(remorseless_winter duration=8 cd=60 )
Define(rune_strike 56815)
 SpellInfo(rune_strike runicpower=300 )
Define(rune_tap 48982)
 SpellInfo(rune_tap cd=30 )
Define(scourge_strike 55090)
  SpellInfo(scourge_strike unholy=1 runicpower=-100 xxx=0 )
Define(shadow_infusion 91342)
  SpellInfo(shadow_infusion duration 30)
  SpellAddBuff(shadow_infusion shadow_infusion=1)
Define(soul_reaper_blood 114866)
  SpellInfo(soul_reaper_blood blood=1 runicpower=-200 cd=6 xxx=0)
Define(soul_reaper_frost 130735)
  SpellInfo(soul_reaper_frost frost=1 runicpower=-200 cd=6 xxx=0)
Define(soul_reaper_unholy 130736)
  SpellInfo(soul_reaper_unholy unholy=1 runicpower=-200 cd=6 xxx=0)
Define(sudden_doom 81340)
  SpellInfo(sudden_doom duration 10)
  SpellAddBuff(sudden_doom sudden_doom=1)
Define(summon_gargoyle 49206)
  SpellInfo(summon_gargoyle duration=40 runicpower=600 cd=180 )
  SpellAddBuff(summon_gargoyle summon_gargoyle=1)
Define(unholy_blight 115989)
  SpellInfo(unholy_blight duration=10 cd=90 )
  SpellAddBuff(unholy_blight unholy_blight=1)
Define(unholy_frenzy 49016)
  SpellInfo(unholy_frenzy duration=30 cd=180 )
  SpellAddBuff(unholy_frenzy unholy_frenzy=1)
Define(unholy_presence 48265)
  SpellAddBuff(unholy_presence unholy_presence=1)
Define(vampiric_blood 55233)
 SpellInfo(vampiric_blood duration=10 cd=60 )

Define(asphyxiate_talent 9)
Define(blood_tap_talent 13)
Define(desecrated_ground_talent 18)
Define(gorefiends_grasp_talent 16)
Define(plague_leech_talent 2)
Define(remorseless_winter_talent 17)
Define(roiling_blood_talent 1)
Define(unholy_blight_talent 3)

AddCheckBox(aoe "AoE")

AddIcon mastery=1 help=main
{
    if {{TalentPoints(plague_leech_talent) and target.DebuffPresent(frost_fever) and target.DebuffPresent(blood_plague) and {target.DebuffRemains(frost_fever) <4 or target.DebuffRemains(blood_plague) <4}} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or RuneCount(death) <1 }} Spell(plague_leech)
    if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
    if target.DebuffRemains(frost_fever) <3 Spell(icy_touch)
    if target.DebuffRemains(blood_plague) <3 Spell(plague_strike)
    if BuffRemains(blood_shield) <2 Spell(death_strike)
    if target.HealthPercent() <=35 and {RuneCount(blood) >=1 and RunicPower() <90} Spell(soul_reaper_blood)
    if RuneCount(blood) >=1 and LifePercent(less 90) Spell(rune_tap usable=1)
    if RunicPower() >=60 Spell(rune_strike usable=1)
    if RuneCount(blood) >=1 and RunicPower() <90 Spell(heart_strike)
    if BuffPresent(crimson_scourge) Spell(blood_boil)
    if {{RuneCount(unholy) >=1 or RuneCount(frost) >=1} and {RuneCount(death) >=1 }} or {RuneCount(unholy) >=1 and RuneCount(frost) >=1} Spell(death_strike)
    if RuneCount(death) >=2 Spell(death_strike)
    Spell(horn_of_winter)
}

AddIcon help=aoe mastery=1 checkboxon=aoe
{
    if {{TalentPoints(plague_leech_talent) and target.DebuffPresent(frost_fever) and target.DebuffPresent(blood_plague) and {target.DebuffRemains(frost_fever) <4 or target.DebuffRemains(blood_plague) <4}} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or RuneCount(death) <1 }} Spell(plague_leech)
    if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
    if target.DebuffRemains(frost_fever) <3 Spell(icy_touch)
    if target.DebuffRemains(blood_plague) <3 Spell(plague_strike)
    if BuffRemains(blood_shield) <2 Spell(death_strike)
    if target.HealthPercent() <=35 Spell(soul_reaper)
    if RuneCount(blood) >=1 and LifePercent(less 90) Spell(rune_tap usable=1)
    if RunicPower() >=60 Spell(rune_strike usable=1)
    if RuneCount(unholy) >=1 or RuneCount(death) >=1 Spell(death_and_decay)
    if RuneCount(blood) >=1 and RunicPower() <90 Spell(blood_boil)
    if BuffPresent(crimson_scourge) Spell(blood_boil)
    if {{RuneCount(unholy) >=1 or RuneCount(frost) >=1} and {RuneCount(death) >=1 }} or {RuneCount(unholy) >=1 and RuneCount(frost) >=1} Spell(death_strike)
    if RuneCount(death) >=2 Spell(death_strike)
    Spell(horn_of_winter)

}

AddIcon mastery=1 help=offgcd
{
    if not InCombat()
    {
       unless Stance(1) Spell(blood_presence)
        Spell(horn_of_winter)
    }
    
    if target.IsInterruptible() Spell(mind_freeze)
    if not TalentPoints(asphyxiate_talent) and target.IsInterruptible() Spell(strangulate)
    if TalentPoints(asphyxiate_talent) and target.IsInterruptible() Spell(asphyxiate)
    if target.HealthPercent() <=35 Spell(soul_reaper)
    if {TalentPoints(blood_tap_talent) and BuffStacks(blood_charge) >=5} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or {RuneCount(death) <1 or RuneCount(blood) <1}} Spell(blood_tap)
    if not BuffPresent (bone_shield) Spell(bone_shield)
    if RunicPower() >=60 Spell(dancing_rune_weapon)
    Spell(vampiric_blood)

}

AddIcon mastery=1 help=cd
{

    if TalentPoints(unholy_blight_talent) and {target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 } Spell(unholy_blight)
    if not target.DebuffPresent(frost_fever) Spell(unholy_blight)
    if not target.DebuffPresent(blood_plague) Spell(unholy_blight)
    if TalentPoints(gorefiends_grasp_talent) Spell(gorefiends_grasp)
    if TalentPoints(remorseless_winter_talent) Spell(remorseless_winter)
    if TalentPoints(desecrated_ground_talent) Spell(desecrated_ground)
    Spell(empower_rune_weapon)
}

AddCheckBox(dw "Dual Wield" mastery=2)
AddIcon mastery=2 help=main
{
    if not InCombat() 
    {
        unless Stance(2) Spell(frost_presence)
        Spell(horn_of_winter)
    }
    if target.HealthPercent() <=35 and {{RuneCount(frost) >=1 or RuneCount(death) >=1} and RunicPower() <90} Spell(soul_reaper_frost)
    if {{TalentPoints(plague_leech_talent) and target.DebuffPresent(frost_fever) and target.DebuffPresent(blood_plague) and {target.DebuffRemains(frost_fever) <4 or target.DebuffRemains(blood_plague) <4}} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or RuneCount(death) <1 }} Spell(plague_leech)
    if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
    if not target.DebuffPresent(frost_fever) Spell(howling_blast)
    if not target.DebuffPresent(blood_plague) Spell(plague_strike)
    if {CheckBoxOff(dw) and BuffPresent(killing_machine)} and {{RuneCount(unholy) >=1 and {RuneCount(frost) >=1 or RuneCount(death) >=1 }} or {RuneCount(frost) >=1 and {RuneCount(unholy) >=1 or RuneCount(death) >=1 }} or {RuneCount(death) ==2}} Spell(obliterate)
    if {CheckBoxOn(dw) and BuffPresent(killing_machine)} and {RunicPower() >=20} Spell(frost_strike)
    if {CheckBoxOn(dw) and BuffPresent(killing_machine)} and {RuneCount(unholy) ==2 and {RuneCount(frost) >=1 or RuneCount(death) >=1 } } Spell(obliterate)
    if RunicPower() >74 Spell(frost_strike)
    if BuffPresent(freezing_fog) Spell(howling_blast)
    if CheckBoxOn(dw) and {RuneCount(unholy) ==2 and {RuneCount(frost) >=1 or RuneCount(death) >=1 }} Spell(obliterate)
    if CheckBoxOff(dw) and {{RuneCount(unholy) >=1 and {RuneCount(frost) >=1 or RuneCount(death) >=1 }} or {RuneCount(frost) >=1 and {RuneCount(unholy) >=1 or RuneCount(death) >=1 }} or {RuneCount(death) >=2}} Spell(obliterate)
    if CheckBoxOff(dw) and {{Runecount(unholy) <1 or Runecount(frost) <1} or Runecount(death) <1 } and RunicPower() >19 Spell(frost_strike)
    if CheckBoxOn(dw) and {RuneCount(frost) >=1 or RuneCount(death) >=1} Spell(howling_blast)
    Spell(horn_of_winter)
}

AddIcon help=aoe mastery=2 checkboxon=aoe

{
    if {{TalentPoints(plague_leech_talent) and target.DebuffPresent(frost_fever) and target.DebuffPresent(blood_plague) and {target.DebuffRemains(frost_fever) <4 or target.DebuffRemains(blood_plague) <4}} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or RuneCount(death) <1 }} Spell(plague_leech)
    if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
    if not target.DebuffPresent(frost_fever) Spell(howling_blast)
    if not target.DebuffPresent(blood_plague) Spell(plague_strike)
    if BuffPresent(freezing_fog) Spell(howling_blast)
    if RuneCount(frost) ==2 or RuneCount(death) ==2 Spell(howling_blast)
    if RuneCount(unholy) ==2 Spell(death_and_decay)
    if RunicPower() >74 Spell(frost_strike)
    if RuneCount(unholy) ==2 and {RuneCount(frost) >=1 or RuneCount(death) >=1} Spell(obliterate)
    if RuneCount(frost) >=1 or RuneCount(death) >=1    Spell(howling_blast)    
    if RuneCount(unholy) >=1 Spell(death_and_decay)
    if CheckBoxOff(dw) and {{Runecount(unholy) <1 or Runecount(frost) <1} or Runecount(death) <1 } and RunicPower() >19 Spell(frost_strike)
    Spell(horn_of_winter)
}

AddIcon mastery=2 help=offgcd
{
    if target.IsInterruptible() Spell(mind_freeze)
    if not TalentPoints(asphyxiate_talent) and target.IsInterruptible() Spell(strangulate)
    if TalentPoints(asphyxiate_talent) and target.IsInterruptible() Spell(asphyxiate)
    if {TalentPoints(blood_tap_talent) and BuffStacks(blood_charge) >=5} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or {RuneCount(death) <1 or RuneCount(blood) <1}} Spell(blood_tap)
    Spell(pillar_of_frost)
}
AddIcon mastery=2 help=cd
{
    if not InCombat() 
    {
        Spell(army_of_the_dead)
    }
    if TalentPoints(unholy_blight_talent) and {target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 } Spell(unholy_blight)
    if TalentPoints(gorefiends_grasp_talent) Spell(gorefiends_grasp)
    if TalentPoints(remorseless_winter_talent) Spell(remorseless_winter)
    if TalentPoints(desecrated_ground_talent) Spell(desecrated_ground)
    Spell(raise_dead)
    Spell(empower_rune_weapon)
}
AddIcon mastery=3 help=main
{
    if not InCombat() 
    {
        unless Stance(3) Spell(unholy_presence)
        Spell(horn_of_winter)
    }
    if target.HealthPercent() <=35 and {{RuneCount(unholy) >=1 or RuneCount(death) >=1} and RunicPower() <90} Spell(soul_reaper_unholy)
    if {{TalentPoints(plague_leech_talent) and target.DebuffPresent(frost_fever) and target.DebuffPresent(blood_plague) and {target.DebuffRemains(frost_fever) <4 or target.DebuffRemains(blood_plague) <4}} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or RuneCount(death) <1 }} Spell(plague_leech)
    if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
    if not target.DebuffPresent(frost_fever) Spell(icy_touch)
    if not target.DebuffPresent(blood_plague) Spell(plague_strike)
    if Buffstacks(shadow_infusion) ==5 and {RuneCount(unholy) >=1 or RuneCount(death) >=1} Spell(dark_transformation)
    if RunicPower() >89 Spell(death_coil)
    if RuneCount(unholy) >=1 or RuneCount(death) >=1 Spell(death_and_decay)
    if RuneCount(unholy) >=1 or RuneCount(death) >=1 Spell(scourge_strike)
    if RuneCount(blood) >=1 and RuneCount(frost) >=1 Spell(festering_strike)
    if BuffPresent(sudden_doom) Spell(death_coil)
    if RunicPower() >59 Spell(death_coil)
    Spell(scourge_strike)
    Spell(festering_strike)
    Spell(horn_of_winter)
}
AddIcon help=aoe mastery=3 checkboxon=aoe
{
    if {{TalentPoints(plague_leech_talent) and target.DebuffPresent(frost_fever) and target.DebuffPresent(blood_plague) and {target.DebuffRemains(frost_fever) <4 or target.DebuffRemains(blood_plague) <4}} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or RuneCount(death) <1 }} Spell(plague_leech)
    if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
    if not target.DebuffPresent(frost_fever) Spell(icy_touch)
    if not target.DebuffPresent(blood_plague) Spell(plague_strike)
    if Buffstacks(shadow_infusion) ==5 and {RuneCount(unholy) >=1 or RuneCount(death) >=1} Spell(dark_transformation)
    if TalentPoints(roiling_blood_talent) and RuneCount(blood) >=1 Spell(blood_boil)
    if RuneCount(unholy) >=1 or RuneCount(death) >=1 Spell(death_and_decay)

    if RuneCount(frost) >=1 and {RuneCount(unholy) >=1 or RuneCount(death) >=1} Spell(festering_strike)
    if RuneCount(blood) >=1 or RuneCount(death) >=1 Spell(blood_boil)
    if RuneCount(unholy) >=1 and RuneCount(frost) <1 Spell(scourge_strike)
    if BuffPresent(sudden_doom) or RunicPower() >89 Spell(death_coil)
}

AddIcon mastery=3 help=offgcd
{
    if target.IsInterruptible() Spell(mind_freeze)
    if not TalentPoints(asphyxiate_talent) and target.IsInterruptible() Spell(strangulate)
    if TalentPoints(asphyxiate_talent) and target.IsInterruptible() Spell(asphyxiate)
    if {TalentPoints(blood_tap_talent) and BuffStacks(blood_charge) >=5} and {{RuneCount(unholy) <1 or RuneCount(frost) <1} or {RuneCount(death) <1 or RuneCount(blood) <1}} Spell(blood_tap)
    Spell(summon_gargoyle)
    Spell(unholy_frenzy)
}
AddIcon mastery=3 help=cd
{
    if not InCombat() 
    {
        Spell(army_of_the_dead)
        Spell(raise_dead)
    }
    Spell(blood_fury)

    if TalentPoints(unholy_blight_talent) and {target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 } Spell(unholy_blight)
    if not target.DebuffPresent(frost_fever) Spell(unholy_blight)
    if not target.DebuffPresent(blood_plague) Spell(unholy_blight)
    if TalentPoints(gorefiends_grasp_talent) Spell(gorefiends_grasp)
    if TalentPoints(remorseless_winter_talent) Spell(remorseless_winter)
    if TalentPoints(desecrated_ground_talent) Spell(desecrated_ground)
    Spell(empower_rune_weapon)
}
]]
}

end