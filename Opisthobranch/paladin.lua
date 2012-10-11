if NerienOvaleScripts.class == "PALADIN" then

NerienOvaleScripts.script.PALADIN.Opisthobranch = {
	desc = "Opisthobranch: Protection, Retribution",
	code =
[[
# Opisthobranch: Protection, Retribution

Define(avengers_shield 31935)
  SpellInfo(avengers_shield cd=15)
Define(avenging_wrath 31884)
  SpellInfo(avenging_wrath duration=20 cd=180 )
  SpellAddBuff(avenging_wrath avenging_wrath=1)
Define(bastion_of_glory 114637)
  SpellInfo(bastion_of_glory duration=20)
  SpellAddBuff(bastion_of_glory bastion_of_glory)
Define(blessing_of_kings 20217)
  SpellInfo(blessing_of_kings duration=3600 )
  SpellAddBuff(blessing_of_kings blessing_of_kings=1)
Define(blessing_of_might 19740)
  SpellInfo(blessing_of_might duration=3600 )
  SpellAddBuff(blessing_of_might blessing_of_might=1)
Define(consecration 26573)
  SpellInfo(consecration cd=9)
Define(crusader_strike 35395)
  SpellInfo(crusader_strike holy=-1 cd=4.5 )
Define(divine_purpose 90174) 
  SpellInfo(divine_purpose duration=8 )
  SpellAddBuff(divine_purpose divine_purpose=1)
Define(execution_sentence 114916)
  SpellInfo(execution_sentence duration=10 tick=1 )
  SpellAddTargetDebuff(execution_sentence execution_sentence=1)
Define(exorcism 879)
  SpellInfo(exorcism holy=-1 cd=15 )
Define(flash_of_light 19750)
Define(guardian_of_ancient_kings 86659)
  SpellInfo(guardian_of_ancient_kings duration=12 cd=180 )
  SpellAddBuff(guardian_of_ancient_kings guardian_of_ancient_kings=1)
Define(hammer_of_the_righteous 53595)
  SpellInfo(hammer_of_the_righteous holy=-1 cd=4.5 )
Define(hammer_of_wrath 24275)
  SpellInfo(hammer_of_wrath holy=-0 cd=6 )
Define(holy_avenger 105809)
Define(holy_wrath 119072)
  SpellInfo(holy_wrath cd=9)
Define(inquisition 84963)
  SpellInfo(inquisition duration=10 holy=1 )
  SpellAddBuff(inquisition inquisition=1)
Define(judgment 20271)
  SpellInfo(judgment cd=6 )
Define(rebuke 96231)
  SpellInfo(rebuke duration=4 cd=15 )
Define(sacred_shield 20925)
  SpellInfo(sacred_shield duration=30)
  SpellAddBuff(sacred_shield sacred_shield=1)
Define(seal_of_insight 20165)
  SpellAddBuff(seal_of_insight seal_of_insight=1)
Define(seal_of_truth 31801)
  SpellAddBuff(seal_of_truth seal_of_truth=1)
Define(selfless_healer 114250)
  SpellInfo(selfless_healer duration=15)
  SpellAddBuff(selfless_healer selfless_healer=1)
Define(shield_of_the_righteous 53600)
Define(shield_of_the_righteous_buff 132403)
  SpellInfo(shield_of_the_righteous_buff duration=3)
  SpellAddBuff(shield_of_the_righteous_buff shield_of_the_righteous_buff=1)
Define(templars_verdict 85256)
Define(weakened_blows 115798)
  SpellInfo(weakened_blows duration=30)
  SpellAddDebuff(weakened_blows weakened_blows=1)

Define(holy_avenger_talent 13)
Define(sacred_shield_talent 9)
Define(selfless_healer_talent 7)
Define(word_of_glory 85673)

AddIcon mastery=2 help=main
{
       if not target.DebuffPresent(weakened_blows) Spell(hammer_of_the_righteous)
       Spell(crusader_strike)
       Spell(judgment)
       Spell(avengers_shield usable=1)
       if not BuffPresent(sacred_shield) and TalentPoints(sacred_shield_talent) Spell(sacred_shield)
       if TalentPoints(selfless_healer_talent) and BuffStacks(selfless_healer) >=3 Spell(flash_of_light)
       Spell(consecration)
       Spell(holy_wrath)
}
AddIcon mastery=2 help=offgcd
{
       if target.IsInterruptible() Spell(rebuke)
       if not BuffPresent(shield_of_the_righteous_buff) and HolyPower() ==5 Spell(shield_of_the_righteous)
       if BuffPresent(shield_of_the_righteous_buff) and HolyPower() ==5 Spell(word_of_glory)
       if {HolyPower() >=3 or BuffPresent(divine_purpose)} and {BuffStacks(bastion_of_glory) ==5 and LifePercent() <=60} Spell(word_of_glory)
       if not BuffPresent(shield_of_the_righteous_buff) and {HolyPower() >=3 or BuffPresent(divine_purpose)} Spell(shield_of_the_righteous)
       if BuffPresent(divine_purpose) and BuffRemains(divine_purpose) <2 Spell(word_of_glory)
}
AddIcon mastery=2 help=cd
{
    if TalentPoints(holy_avenger_talent) Spell(holy_avenger)
    Spell(avenging_wrath)

}

AddIcon mastery=3 help=main
{
    if not InCombat() 
    {
        unless Stance(1) Spell(seal_of_truth)
    }
    if ManaPercent() >=90 or Stance(0) unless Stance(1) Spell(seal_of_truth)
    if ManaPercent() <=20 unless Stance(4) Spell(seal_of_insight)
    if {BuffExpires(inquisition) or BuffRemains(inquisition) <=2 } and {HolyPower() >=3 or BuffPresent(divine_purpose) } Spell(inquisition)
    if HolyPower() ==5 or {BuffPresent(divine_purpose) and BuffRemains(divine_purpose) <=2} Spell(templars_verdict)
    Spell(hammer_of_wrath usable=1)
    if Spell(hammer_of_wrath usable=1) and {SpellCooldown(hammer_of_wrath) >0 and SpellCooldown(hammer_of_wrath) <=0.2} Texture(Spell_nature_timestop) 
    Spell(exorcism)
    Spell(crusader_strike)
    Spell(judgment)
    if HolyPower() >=3 or BuffPresent(divine_purpose) Spell(templars_verdict)
}
AddIcon mastery=3 help=offgcd
{
    if target.IsInterruptible() Spell(rebuke)
    if BuffPresent(inquisition) Spell(avenging_wrath)
    if BuffPresent(inquisition) and TalentPoints(holy_avenger_talent) Spell(holy_avenger)
    if BuffPresent(inquisition) and BuffPresent(avenging_wrath) Spell(guardian_of_ancient_kings)
}
AddIcon mastery=3 help=cd
{
    if HolyPower() >=3 Spell(word_of_glory)
    if TalentPoints(sacred_shield_talent) Spell(sacred_shield)
    if TalentPoints(selfless_healer_talent) and BuffStacks(selfless_healer) >=3 Spell(flash_of_light)
}
]]
}

end