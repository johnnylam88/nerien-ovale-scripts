if NerienOvaleScripts.class == "DRUID" then

NerienOvaleScripts.script.DRUID.Leafkiller = {
	desc = "Leafkiller: Feral, Guardian",
	code =
[[
# Leafkiller's Feral/Guardian druid script.
# Cat Rotation based on Simulationcraft single target default script. Contributions to that have come from many ferals.
# Guardian script from Tinderhoof.
# Lots of input and constructs from jlam aka Nerien
# Revision History
# 5.1.2 12/07/2012 Misc changes including SR, Ravage!, alternate layout for Aggixx and some script reconciliation
# 5.1.1 11/30/2012 Ravage fix for PVP 4 set and support for faster combo points on crits
# 5.05.14 11/09/2012 New spell ID for clearcasting
# 5.05.14 11/09/2012 Only suggest Feral_spirit if the symbiosis buff is present - otherwise it suggests symbiosis even when the buff is not up
# 5.05.13 10/23/2012 Don't pool during NV
# 5.05.12 10/22/2012 Fix bad spell name in Rake conditional (tigers_fury should be TIGERSFURY)
# 5.05.11 10/22/2012 Fix for energy pooling for non-DoC specs. Small updates based on most recent sim script for TTD. FFF() added. TTD updated.
# 5.05.10 10/21/2012 4 Piece PvP gear support and Nature's Vigil HT code
# 5.05.9 10/16/2012 Feral Spirit support
# 5.05.8 10/14/2012 Fix 3 second SR to interfere less with Rip for HotW (and NV). 60 seconds for Rake.
# 5.05.7 10/14/2012 Update to latest version of sim script - small changes and Rake improvements
# 5.05.6 10/11/2012 Heart of the Wild support, add out of combat support
# 5.05.6 10/10/2012 Update to limit SR using comb points when DoC is up
# 5.05.5a 10/08/2012 Update to include optimizations in simc script
# 5.05.5 09/24/2012 Multiply damage ratios by 100 to avoid rounding issues, put in variable Rip overwriting during BitW, tweak numbers slightly (TF is 14% not 15% for example).
# 5.05.4 09/23/2012 Level 90 script - First complete version
# 5.05.2 09/20/2012 Level 90 script - WiP
# 5.05.1 09/08/2012 First version in Nerien's addon

# Shared defines 
Define(barkskin 22812)
    SpellInfo(barkskin cd=60)
Define(cat_form 768)
    SpellAddBuff(cat_form cat_form=1)
Define(cenarion_ward 102351)
    SpellInfo(cenarion_ward cd=30)
Define(dream_of_cenarius_damage 108381)
    SpellInfo(dream_of_cenarius_damage duration=30 )
    SpellAddBuff(dream_of_cenarius_damage dream_of_cenarius_damage=1)
Define(feral_spirit 110807)
Define(force_of_nature 106737)
    SpellInfo(force_of_nature cd=60)
Define(healing_touch 5185)
Define(heart_of_the_wild_spell 108292)
    SpellInfo(heart_of_the_wild_spell cd=360)
    SpellAddBuff(heart_of_the_wild_spell heart_of_the_wild_spell=1)
Define(mark_of_the_wild 1126)
    SpellInfo(mark_of_the_wild duration=3600)
    SpellAddBuff(mark_of_the_wild mark_of_the_wild=1)
Define(natures_swiftness 132158)
    SpellInfo(natures_swiftness cd=60)
    SpellAddBuff(natures_swiftness natures_swiftness=1)
Define(natures_vigil_buff 124974)
    SpellInfo(natures_vigil_buff cd=180)
    SpellAddBuff(natures_vigil_buff natures_vigil_buff=1)
Define(predatory_swiftness 69369)
    SpellAddBuff(predatory_swiftness predatory_swiftness=1)
Define(primal_fury 16961)
Define(renewal 108238)
    SpellInfo(renewal cd=120 )
Define(symbiosis 110309)
    SpellAddBuff(symbiosis symbiosis=1)
Define(treants 106737)
    SpellInfo(treants duration=15 cd=60)
Define(tricks 57933)
    SpellAddBuff(tricks tricks=1)
Define(wrath 5176)
Define(weakened_armor 113746)
    SpellInfo(weakened_armor duration=30)
Define(weakened_blows 115798)
    SpellInfo(weakened_blows duration=30)
  
# Talents
Define(natures_swiftness_talent 4)
Define(renewal_talent 5)
Define(cenarion_ward_talent 6)
Define(faerie_swarm 7)
Define(soul_of_the_forest 10)
Define(incarnation_talent 11)
Define(force_of_nature_talent 12)
Define(heart_of_the_wild_talent 16)
Define(dream_of_cenarius_talent 17)
Define(natures_vigil_talent 18)

#Buff
Define(CLEARCASTING 135700)

#Glyphs
Define(GLYPHOFSHRED 114234)
Define(GLYPHOFSAVAGERY 127540)

# cat abilities. Using the convention that constants are CAPs
Define(BERSERK 106951) #cat cd buff
    SpellInfo(BERSERK duration=15 cd=180 )
    SpellAddBuff(BERSERK BERSERK=1 )
Define(FAERIEFERAL 770) #bear+cat
    SpellInfo(FAERIEFERAL duration=300 cd=6)
    SpellAddTargetDebuff(FAERIEFERAL FAERIEFERAL=1 weakened_armor=1)
Define(FAERIESWARM 102355) #bear+cat
    SpellInfo(FAERIESWARM duration=300 cd=6)
    SpellAddTargetDebuff(FAERIESWARM FAERIESWARM=1 weakened_armor=1)
Define(FEROCIOUSBITE 22568) #cat finish 25-50 energy
    SpellInfo(FEROCIOUSBITE energy=25 combo=0)
Define(INCARNATIONCAT 102543)
    SpellInfo(INCARNATIONCAT duration=30 cd=180 )
Define(MAIM 22570) #cat interrupt
    SpellInfo(MAIM cd=10 energy=35 combo=0)
Define(MANGLECAT 33876) #cat bleed+debuff
    SpellInfo(MANGLECAT inccounter=ripshreds energy=35 combo=1)
    SpellInfo(MANGLECAT critcombo=1 if_spell=primal_fury)
Define(RAKE 1822) #cat bleed
    SpellInfo(RAKE combo=1 duration=15 energy=35 tick=3)
    SpellInfo(RAKE base=98.13 bonusap=0.31453)
    SpellInfo(RAKE critcombo=1 if_spell=primal_fury)
    SpellAddTargetDebuff(RAKE RAKE=1)
    SpellDamageBuff(RAKE dream_of_cenarius_damage=1.25)
Define(RAVAGE 6785)
    SpellInfo(RAVAGE inccounter=ripshreds energy=45 combo=1)
    SpellInfo(RAVAGE critcombo=1 if_spell=primal_fury)
Define(RAVAGEBANG 102545)
    SpellInfo(RAVAGEBANG inccounter=ripshreds energy=0 combo=1)
    SpellInfo(RAVAGEBANG critcombo=1 if_spell=primal_fury)
Define(RIP 1079) #cat bleed
    SpellInfo(RIP resetcounter=ripshreds duration=16 energy=30 tick=2 combo=0)
    SpellInfo(RIP base=112.76 bonuscp=320 bonusapcp=0.0484) # damage coefficients
    SpellAddTargetDebuff(RIP RIP=1)
    SpellDamageBuff(RIP dream_of_cenarius_damage=1.25)
Define(SAVAGEROAROLD 52610)
    SpellInfo(SAVAGEROAROLD duration=18 combo=0 energy=25)
    SpellAddBuff(SAVAGEROAROLD SAVAGEROAROLD=1)
Define(SAVAGEROARGLYPHED 127538)
    SpellInfo(SAVAGEROARGLYPHED duration=12 combo=-5 energy=25)
    SpellAddBuff(SAVAGEROARGLYPHED SAVAGEROARGLYPHED=1)
SpellList(savage_roar_buff 52610 127538)
Define(SHRED 5221) #cat behind
    SpellInfo(SHRED inccounter=ripshreds energy=40 combo=1)
    SpellInfo(SHRED critcombo=1 if_spell=primal_fury)
Define(SHREDBANG 114236)
    SpellInfo(SHREDBANG inccounter=ripshreds energy=40 combo=1)
    SpellInfo(SHREDBANG critcombo=1 if_spell=primal_fury)
Define(STAMPEDEBUFF 81022)
    SpellAddBuff(STAMPEDEBUFF STAMPEDEBUFF=1)
Define(SKULLBASHCAT 80965) #cat interrupt
    SpellInfo(SKULLBASHCAT cd=15 energy=15)
Define(THRASHCAT 106830)
    SpellInfo(THRASHCAT duration=15 energy=50 tick=3)
    SpellAddTargetDebuff(THRASHCAT THRASHCAT=1 weakened_blows=1)
    SpellDamageBuff(THRASHCAT dream_of_cenarius_damage=1.25)
Define(TIGERSFURY 5217) #cat buff
    SpellInfo(TIGERSFURY duration=6 energy=-60 cd=30)
    SpellAddBuff(TIGERSFURY TIGERSFURY=1)
Define(WILDCHARGE 49376)
    SpellInfo(WILDCHARGE cd=15)

# Bear abilities. Using the convention that constants are all CAPs

Define(BERSERKBEAR 106952) #cat+bear cd buff
    SpellInfo(BERSERKBEAR duration=10 cd=180 )
    SpellAddBuff(BERSERKBEAR BERSERKBEAR=1)
Define(ENRAGE 5229)
Define(FRENZIEDREGEN 22842)
Define(INCARNATIONBEAR 102558)
    SpellInfo(INCARNATIONBEAR duration=30 cd=180 )
Define(LACERATE 33745)
Define(MANGLEBEAR 33878)
Define(MAUL 6807)
Define(MIGHTOFURSOC 106922)
Define(RENEWAL 108238)
Define(SAVAGEDEFENSE 62606)
Define(SURVIVALINSTINCTS 61336)
Define(SWIPEBEAR 779)
Define(THRASHBEAR 77758)
Define(WILDCHARGEBEAR 102401)
    SpellInfo(WILDCHARGEBEAR cd=15)

AddCheckBox(cooldownsL "Show Left Rotation Boxes" default)
AddCheckBox(cooldownsR "Show Right Cooldown Boxes" default)

AddCheckBox(bearaoe "Bear AOE Rotation")

AddCheckBox(cooldownsRatio "Show Rake and Rip Ratio Boxes" mastery=2)
AddCheckBox(lucioles SpellName(FAERIEFERAL) default mastery=2)
AddCheckBox(berserk "Cat Berserk" default mastery=2)
AddCheckBox(infront "Frontal attack" mastery=2)
AddCheckBox(predictive "Hide predictive box" mastery=2)
AddCheckBox(altpredictive "Alternate predictive box" mastery=2)

#
# Mastery=2 Feral cooldown boxes and rotation
#
AddFunction FFF
{
    if TalentPoints(faerie_swarm) Spell(FAERIESWARM)
    if not TalentPoints(faerie_swarm) Spell(FAERIEFERAL)
}
AddFunction SavageRoar
{
    if Glyph(GLYPHOFSAVAGERY) Spell(SAVAGEROARGLYPHED)
    if Glyph(GLYPHOFSAVAGERY no) and ComboPoints(more 0) Spell(SAVAGEROAROLD)
}

AddFunction TimeUntilTargetIsDead
{
    target.TimeToDie()
}


AddFunction MinRatioForRipOverwrite
{
    if {TimeUntilTargetIsDead() >120} 112
    if {TimeUntilTargetIsDead() <=120} {{0.002*{180.00-TimeUntilTargetIsDead()}} + 1.00} * 100
}

#
# Rake functions
AddFunction RakeTickDamage
{
    # rake_tick_damage = (tick_damage + coeff * AP) * damage_multiplier * bleed_multiplier
    Damage(RAKE) * {1 + Mastery()/100}
}

AddFunction LastRakeTickDamage
{
    # rake_tick_damage = (tick_damage + coeff * AP) * damage_multiplier * bleed_multiplier
    LastSpellEstimatedDamage(RAKE) * {1 + LastSpellMastery(RAKE)/100}
}

AddFunction RakeTickDamageRatio
{
    if TargetDebuffPresent(RAKE) {100 * RakeTickDamage()/LastRakeTickDamage()}
    unless TargetDebuffPresent(RAKE) 100.0
}

#
# Rip functions
AddFunction RipTickDamage
{
    # Damage(rip) == { 113 + (320 * CP) + (0.3872 * AP * CP) } * DamageMultiplier(rip)
    Damage(RIP) * {1 + Mastery()/100}
}

AddFunction LastRipTickDamage
{
    # Damage(rip) == { 113 + (320 * CP) + (0.3872 * AP * CP) } * DamageMultiplier(rip)
    LastSpellEstimatedDamage(RIP) * {1 + LastSpellMastery(RIP)/100}
}

AddFunction RipTickDamageRatio
{
    if TargetDebuffPresent(RIP) {100 * RipTickDamage()/LastRipTickDamage()}
    unless TargetDebuffPresent(RIP) 100.0
}


AddIcon help=Rake size=small mastery=2 checkboxon=cooldownsRatio 
{
    RakeTickDamageRatio()
}

AddIcon help=Rip size=small mastery=2 checkboxon=cooldownsRatio 
{
    RipTickDamageRatio()
}

AddFunction ExtendRip
{
    if BuffPresent(INCARNATIONCAT) or BuffPresent(STAMPEDEBUFF) {
        Spell(RAVAGE)
    }
    unless BuffPresent(INCARNATIONCAT) or BuffPresent(STAMPEDEBUFF) {
        if CheckBoxOn(infront) {
            if Glyph(GLYPHOFSHRED) and {BuffPresent(TIGERSFURY) or BuffPresent(BERSERK)} Spell(SHRED)
            Spell(MANGLECAT)
        }
        Spell(SHRED)
    }
}

AddFunction AddCombo
{    
    ExtendRip()
}


AddFunction AddComboWithThrash
{    
    if ComboPoints() >= 5 and target.DebuffRemains(THRASHCAT) < 6  and TimeUntilTargetIsDead() >=6 Spell(THRASHCAT)
    AddCombo()
}

AddFunction BITWRange
{
    {ArmorSetParts(T13 more 1) and TargetLifePercent(less 60)} or TargetLifePercent(less 25)
}

AddFunction ExtendedRipDuration
{
    if {target.DebuffPresent(RIP) and Counter(ripshreds) < 3} {{{3-Counter(ripshreds)}*2} + target.DebuffRemains(RIP)}
    if {target.DebuffPresent(RIP) and Counter(ripshreds) >= 3} {target.DebuffRemains(RIP)}
}

AddFunction EnergyForPredatorySwiftness
{
    Energy()+{10*{BuffRemains(predatory_swiftness) -1}}
}

AddFunction EnergyForSoul
{
    Energy()+{10*{4 - ComboPoints()}}
}
 
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsL {
    if TargetIsInterruptible(yes) {
        Spell(SKULLBASHCAT)
        if ComboPoints(more 1)
            Spell(MAIM)
    }
    Spell(WILDCHARGE)
}

AddIcon help=cd size=small mastery=2 checkboxon=cooldownsL { # Berserk Icon
    if BuffPresent(TIGERSFURY) Spell(BERSERK)
    if 0s before Spell(BERSERK) Texture(Ability_mount_polarbear_white)
}

AddFunction NotInCombat
{
    if not InCombat() {
        if not BuffPresent(str_agi_int any=1) Spell(mark_of_the_wild)
        if not BuffPresent(dream_of_cenarius_damage) and TalentPoints(dream_of_cenarius_talent) Spell(healing_touch)
        unless Stance(3) Spell(cat_form)
        if BuffExpires(savage_roar_buff) SavageRoar()
        if TalentPoints(force_of_nature_talent) Spell(treants)
    }
}
AddFunction StartRotation
{
    if TalentPoints(dream_of_cenarius_talent) and BuffPresent(predatory_swiftness) and BuffRemains(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage) 
        Spell(healing_touch)
    if BuffExpires(savage_roar_buff) SavageRoar()
    if TalentPoints(dream_of_cenarius_talent) and BuffPresent(predatory_swiftness) and ComboPoints() >= 4 and BuffStacks(dream_of_cenarius_damage) <2
        Spell(healing_touch)
    if TalentPoints(dream_of_cenarius_talent) and PreviousSpell(natures_swiftness) Spell(healing_touch)
}

AddFunction TFBerserk
{    
    # TF + Berserk logic - only show Berserk if both are off of cooldown - everyone should macro TF to their Berserk key
    if not {BuffPresent(BERSERK) or BuffPresent(CLEARCASTING)} {
        if Energy(less 36) and {0s before Spell(TIGERSFURY)} {
            if CheckBoxOn(berserk) Spell(BERSERK)
            Spell(TIGERSFURY)
        }
    }
    
    #In case Berserk was not cast with TF
    if {BuffPresent(TIGERSFURY) or {TimeUntilTargetIsDead() <15 and SpellCooldown(TIGERSFURY) >6 }} and CheckBoxOn(berserk) Spell(BERSERK)
}

AddFunction MainRotation
{
    # Two conditions for FB during Blood of the Water phase
    # Add in FB code for end of fight - only do this is Rip buff is present
    if BITWRange() and ComboPoints(more 0) and TargetDebuffPresent(RIP) and TargetDebuffExpires(RIP 2.9) Spell(FEROCIOUSBITE)
    if CheckBoxOn(lucioles) and target.DebuffStacks(weakened_armor any=1) <3  FFF()
    
    if TimeUntilTargetIsDead() >=6 and BuffPresent(CLEARCASTING) and TargetDebuffExpires(THRASHCAT 3) and BuffExpires(dream_of_cenarius_damage) Spell(THRASHCAT)
    
    if {TimeUntilTargetIsDead() <=4 and ComboPoints() >=5} or {TimeUntilTargetIsDead() <=1 and ComboPoints() >=3}
        Spell(FEROCIOUSBITE)
    
    # Blood in the water code - mostly for DoC - combined the BITW check to make Ovale more efficient
    if BITWRange() {
        if BuffRemains(savage_roar_buff) <=3 and ComboPoints(more 0) and BuffExpires(dream_of_cenarius_damage) SavageRoar()   
        if TalentPoints(dream_of_cenarius_talent) and BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5
            Spell(natures_swiftness)    
        if ComboPoints() >=5 and TimeUntilTargetIsDead() >30 and RipTickDamageRatio() >=114 Spell(RIP)
        # Pool here
        if TargetDebuffPresent(RIP) and ComboPoints() >=5 Spell(FEROCIOUSBITE)
    }
    
    if BuffPresent(dream_of_cenarius_damage) and ComboPoints() >=5 and TimeUntilTargetIsDead() >6 and {TargetDebuffExpires(RIP 2) or
        {TargetDebuffExpires(RIP 6) and RipTickDamageRatio() >=100 and not BITWRange()}} Spell(RIP)
    
    if TalentPoints(dream_of_cenarius_talent) and BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 
             and TargetDebuffExpires(RIP) <3 and {BuffPresent(BERSERK) or target.DebuffRemains(RIP)+1.9 <=SpellCooldown(TIGERSFURY)} and not BITWRange()
        Spell(natures_swiftness)
        
    # Time to recast Rip - clip if possible - try to hold off for TF        
    if ComboPoints() >=5 and TimeUntilTargetIsDead() >=6 and TargetDebuffExpires(RIP) <2 and {BuffPresent(BERSERK) or target.DebuffRemains(RIP)+1.9 <=SpellCooldown(TIGERSFURY)}
        Spell(RIP)
    
    if BuffRemains(savage_roar_buff) <=3 and ComboPoints(more 0) and BuffExpires(dream_of_cenarius_damage) and TalentPoints(dream_of_cenarius_talent) SavageRoar()
    if BuffRemains(savage_roar_buff) <=3 and ComboPoints(more 0) and not TalentPoints(dream_of_cenarius_talent) {
        if not {TargetDebuffExpires(RIP) <2 and {BuffPresent(BERSERK) or target.DebuffRemains(RIP)+1.9 <=SpellCooldown(TIGERSFURY)}} SavageRoar()
    }
        
    if TimeUntilTargetIsDead() >=6 and BuffPresent(CLEARCASTING) and TargetDebuffExpires(THRASHCAT 3) Spell(THRASHCAT)
    
    #Extends Rip with shred/mangle/ravage
    if TargetDebuffPresent(RIP) and TargetDebuffExpires(RIP 4) and Counter(ripshreds less 3) ExtendRip()
    
    if ComboPoints() >=5 and BuffRemains(savage_roar_buff) <=6 and target.DebuffPresent(RIP) and {BuffRemains(savage_roar_buff)+2 <= ExtendedRipDuration()} SavageRoar()
    
    # Doc FB and pooling code here
    
    if ComboPoints() >=5 and target.DebuffPresent(RIP) and {{BuffPresent(BERSERK) and ExtendedRipDuration() > 6} 
        or ExtendedRipDuration() >10} Spell(FEROCIOUSBITE)

    # Rake code
    if TimeUntilTargetIsDead() >3 and BuffPresent(dream_of_cenarius_damage) and target.DebuffRemains(RAKE) <6 and RakeTickDamageRatio() >=100 Spell(RAKE)
    if TimeUntilTargetIsDead() >3 and RakeTickDamageRatio() >=112 Spell(RAKE)
    if TimeUntilTargetIsDead() >3 and TargetDebuffExpires(RAKE 2.9) and {BuffPresent(BERSERK) or Energy(more 60) 
            or {SpellCooldown(TIGERSFURY) +0.8 } >=target.DebuffRemains(RAKE)}
        Spell(RAKE)
}

AddFunction Fillers
{        
    # take care of OOC when it was not used for Thrash
    if BuffPresent(CLEARCASTING) AddCombo()

    # use Ravage! before other fillers since it is freen
    
    # aggressive shred for Predatory Swiftness and/or Soul of the Forest
    if TalentPoints(dream_of_cenarius_talent) and BuffRemains(predatory_swiftness) >1 and EnergyForPredatorySwiftness() > {{4 - ComboPoints()}*20} AddCombo()
    if TalentPoints(soul_of_the_forest) and ComboPoints() <5 and EnergyForSoul() > {{5 - ComboPoints()}*20} and not TalentPoints(dream_of_cenarius_talent) AddCombo()
    
    # Shred for combo points for Rip or SR
    if ComboPoints(less 5) and TargetDebuffExpires(RIP 3) AddCombo()
    if ComboPoints(less 1) and BuffExpires(savage_roar_buff 2) AddCombo()
    
    if TimeUntilTargetIsDead() <=8.5 AddCombo()
    
    # Shred aggressively for Berserk and TF
    if BuffPresent(BERSERK) or BuffPresent(TIGERSFURY) or BuffPresent(natures_vigil_buff) AddComboWithThrash()
    
    # Shred to burn off energy so we can TF without capping
    if { 4s before Spell(TIGERSFURY) } AddComboWithThrash()
    
    # Fallback Shred to prevent energy capping
    if 1.4s before Energy(more 99) AddComboWithThrash()
    
    # Nature's Vigil HTs for extra damage
    if not BuffPresent(BERSERK) and BuffPresent(natures_vigil_buff) {
        if BuffExpires(predatory_swiftness) Spell(natures_swiftness)
        if BuffPresent(predatory_swiftness) or BuffPresent(natures_swiftness) Spell(healing_touch)
    }
    
    # Feral Spirit
    if BuffPresent(symbiosis) Spell(feral_spirit)
    
    # opportunistic FF
    if CheckBoxOn(lucioles) and target.DebuffExpires(weakened_armor) <15 and Energy(less 75) FFF()
}

AddFunction Prediction
{

    if Stance(3) {
        StartRotation()
        MainRotation()
    }
    if Stance(1) {
        if BuffPresent(heart_of_the_wild_spell) Spell(FRENZIEDREGEN)
        if not BuffPresent(heart_of_the_wild_spell) Spell(cat_form)
    }
    if Stance(0) {
        if BuffPresent(heart_of_the_wild_spell) {
            if BuffExpires(heart_of_the_wild_spell) Texture(spell_holy_blessingofagility)
        }
        if not BuffPresent(heart_of_the_wild_spell) Spell(cat_form)
    }
    if Stance(4) or Stance(2) Spell(cat_form)
}


# Predictive rotation
AddIcon help=predictive size=small mastery=2 checkboxon=altpredictive {
    Prediction()
}

AddIcon help=predictive size=small mastery=2 checkboxon=altpredictive {    
    if TalentPoints(heart_of_the_wild_talent) Spell(heart_of_the_wild_spell)
    if TalentPoints(dream_of_cenarius_talent) Spell(natures_swiftness)
    if TalentPoints(natures_vigil_talent) Spell(natures_vigil_buff)
}

# Main rotation
AddIcon help=main mastery=2 {
    NotInCombat()
    if Stance(3) {
        StartRotation()
        TFBerserk()    
        if not TargetInRange(SHRED) Texture(ability_druid_catformattack)
        MainRotation()
        Fillers()
    }
    if Stance(1) {
        if BuffPresent(heart_of_the_wild_spell) {
            if CheckBoxOff(bearaoe) BearMain()
            if CheckBoxOn(bearaoe) BearMainAOE()
        }
        if not BuffPresent(heart_of_the_wild_spell) Spell(cat_form)
    }
    if Stance(0) {
        if BuffPresent(heart_of_the_wild_spell) {
            if CastTime(wrath) <BuffRemains(heart_of_the_wild_spell) Spell(wrath)
            Spell(cat_form)
        }
        if not BuffPresent(heart_of_the_wild_spell) Spell(cat_form)
    }
    if Stance(4) or Stance(2) Spell(cat_form)
}

# Predictive rotation
AddIcon help=predictive mastery=2 checkboxoff=predictive {
    Prediction()
}

AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rake
    if BuffExpires(savage_roar_buff) Texture(ability_druid_skinteeth)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rip
    if TargetDebuffExpires(RIP) Texture(ability_ghoulfrenzy)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rake
    if TargetDebuffExpires(RAKE ) Texture(ability_druid_disembowel)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR {
    Spell(TIGERSFURY)
}

#
# Mastery=3 Guardian cooldown boxes and rotation
#
AddIcon help=cd size=small mastery=3 checkboxon=cooldownsL {
    Spell(barkskin)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsL {
    if TalentPoints(natures_swiftness_talent) Spell(natures_swiftness)
    if TalentPoints(renewal_talent) Spell(RENEWAL)
    if TalentPoints(cenarion_ward_talent) Spell(cenarion_ward)
}

AddFunction BearMain
{
    if 1s before Spell(MANGLEBEAR) Spell(MANGLEBEAR)

    if not TargetDebuffPresent(weakened_blows any=1) Spell(THRASHBEAR)
    if target.DebuffStacks(weakened_armor any=1) <1 FFF()
    if TargetDebuffPresent(THRASHBEAR) <4 Spell(THRASHBEAR)

    Spell(LACERATE)
    FFF()
}

AddFunction BearMainAOE
{
    if 1s before Spell(MANGLEBEAR) Spell(MANGLEBEAR)
    Spell(THRASHBEAR)
    Spell(SWIPEBEAR)
}

AddIcon mastery=3 size=small checkboxon=altpredictive checkboxoff=cooldownsL {
}

# Main rotation
AddIcon help=main mastery=3 {
    if CheckBoxOff(bearaoe) BearMain()
    if CheckBoxOn(bearaoe) BearMainAOE()
}

AddIcon help=defense mastery=3 {
    if Rage(less 11) Spell(ENRAGE useable=1)
    Spell(SAVAGEDEFENSE usable=1)
    Spell(FRENZIEDREGEN)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    Spell(SURVIVALINSTINCTS)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    Spell(MIGHTOFURSOC)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    if TalentPoints(incarnation_talent) Spell(INCARNATIONBEAR)
    if TalentPoints(force_of_nature_talent) Spell(force_of_nature)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    Spell(BERSERKBEAR)
}

]]
}

end