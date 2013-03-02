local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.PRIEST.Opisthobranch = {
	desc = "[5.0] Opisthobranch: Shadow",
	code =
[[
# Opisthobranch: Shadow

Define(berserking 26297)
  SpellInfo(berserking duration=10 cd=180 )
  SpellAddBuff(berserking berserking=1)
Define(devouring_plague 2944)
  SpellInfo(devouring_plague duration=6 shadoworbs=1 )
  SpellAddTargetDebuff(devouring_plague devouring_plague=1)
Define(dispersion 47585)
  SpellInfo(dispersion duration=6 cd=120 )
  SpellAddBuff(dispersion dispersion=1)
Define(divine_insight_shadow 124430)
  SpellInfo(divine_insight_shadow duration=12 )
  SpellAddBuff(divine_insight_shadow divine_insight_shadow=1)
Define(halo_damage 120517)
  SpellInfo(halo_damage cd=40 )
Define(inner_fire 588)
  SpellAddBuff(inner_fire inner_fire=1)
Define(inner_will 73413)
  SpellAddBuff(inner_will inner_will=1)
Define(mind_blast 8092)
  SpellInfo(mind_blast shadoworbs=-1 cd=8 test)
Define(mind_flay 15407)
  SpellInfo(mind_flay duration=3 canStopChannelling=3 )
  SpellAddTargetDebuff(mind_flay mind_flay=1)
Define(mind_sear 49821)
  SpellInfo(mind_sear canStopChannelling=1 )
  SpellAddBuff(mind_sear mind_sear=1)
Define(mind_spike 73510)
Define(power_word_fortitude 21562)
  SpellInfo(power_word_fortitude duration=3600 )
  SpellAddBuff(power_word_fortitude power_word_fortitude=1)
Define(shadow_word_death 32379)
  SpellInfo(shadow_word_death cd=8 )
Define(shadow_word_insanity 129250)
Define(shadow_word_pain 589)
  SpellInfo(shadow_word_pain duration=18 )
  SpellAddTargetDebuff(shadow_word_pain shadow_word_pain=1)
Define(shadowfiend 34433)
  SpellInfo(shadowfiend duration=12 cd=180 )
Define(shadowform 15473)
  SpellInfo(shadowform cd=1.5 )
  SpellAddBuff(shadowform shadowform=1)
Define(surge_of_darkness 87160)
  SpellInfo(surge_of_darkness duration=10 )
  SpellAddBuff(surge_of_darkness surge_of_darkness=1)
Define(vampiric_touch 34914)
  SpellInfo(vampiric_touch duration=15 )
  SpellAddTargetDebuff(vampiric_touch vampiric_touch=1)
Define(mindbender_talent 8)
Define(power_word_solace 9)

AddIcon mastery=3 help=main
{
    if not InCombat() 
    {
        if not BuffPresent(stamina) Spell(power_word_fortitude)
        if BuffExpires(inner_fire) and BuffExpires(inner_will) Spell(inner_fire)
        Spell(shadowform)
    }
    Spell(shadowform)
    if ShadowOrbs() ==3 Spell(devouring_plague)
    if target.HealthPercent(less 20) Spell(shadow_word_death)
    if target.DebuffPresent(shadow_word_pain) and {TalentPoints(power_word_solace) and target.DebuffRemains(shadow_word_pain) <TickTime(shadow_word_pain)} Spell(shadow_word_insanity)
    if {not target.DebuffPresent(shadow_word_pain) or target.DebuffRemains(shadow_word_pain) <TickTime(shadow_word_pain) } Spell(shadow_word_pain)
    if {not target.DebuffPresent(vampiric_touch) or target.DebuffRemains(vampiric_touch) <CastTime(vampiric_touch) +TickTime(vampiric_touch) } Spell(vampiric_touch)
    if SpellCooldown(mind_blast) Spell(mind_blast)
    if BuffPresent(surge_of_darkness) Spell(mind_spike)
    if TalentPoints(mindbender_talent) Spell(shadowfiend)
    Spell(halo_damage)
    Spell(mind_flay)
}
AddIcon mastery=3 help=moving
{
    if ShadowOrbs() ==3 Spell(devouring_plague)
    if target.HealthPercent(less 20) Spell(shadow_word_death)
    if target.DebuffPresent(shadow_word_pain) and {TalentPoints(power_word_solace) and target.DebuffRemains(shadow_word_pain) <TickTime(shadow_word_pain)} Spell(shadow_word_insanity)
    if {not target.DebuffPresent(shadow_word_pain) or target.DebuffRemains(shadow_word_pain) <TickTime(shadow_word_pain) } Spell(shadow_word_pain)
    if BuffPresent(divine_insight_shadow) and SpellCooldown(mind_blast) Spell(mind_blast)
    if BuffPresent(surge_of_darkness) Spell(mind_spike)
    if TalentPoints(mindbender_talent) Spell(shadowfiend)
}

AddIcon mastery=3 help=cd
{
    if SpellCooldown(shadowfiend) Spell(shadowfiend)
    Spell(dispersion)
}
]]
}
