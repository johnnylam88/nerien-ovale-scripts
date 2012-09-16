NerienOvaleScripts.script.DRUID.Leafkiller = {
	desc = "Leafkiller: Feral, Guardian",
	code =
[[
# Leafkiller's Feral/Guardian druid script.
# Cat Rotation based on Simulationcraft single target default script. Contributions to that have come from many ferals.
# Guardian script from Tinderhoof
# Revision History
# 5.05.1 09/08/2012 First version in Nerien's addon
#                    TargetDeadIn seems to be having issues - so removing the calls for now. Won't affect most combat
Define(BERSERK 106951) #cat cd buff
    SpellInfo(BERSERK duration=15 cd=180 )
    SpellAddBuff(BERSERK BERSERK=1 )
Define(FAERIEFERAL 770) #bear+cat
    SpellInfo(FAERIEFERAL duration=300 cd=6)
    SpellAddTargetDebuff(FAERIEFERAL FAERIEFERAL=1 weakened_armor=1)
Define(FEROCIOUSBITE 22568) #cat finish 25-50 energy
    SpellInfo(FEROCIOUSBITE energy=25 combo=-5)
Define(MAIM 22570) #cat interrupt
    SpellInfo(MAIM cd=10 energy=35 combo=-5)
Define(MANGLECAT 33876) #cat bleed+debuff
    SpellInfo(MANGLECAT inccounter=ripshreds energy=35 combo=1)
Define(RAKE 1822) #cat bleed
    SpellInfo(RAKE duration=15 energy=35 tick=3 combo=1)
    SpellAddTargetDebuff(RAKE RAKE=1)
Define(RAVAGE 6785)
  SpellInfo(RAVAGE inccounter=ripshreds energy=45 combo=1)
Define(RIP 1079) #cat bleed
    SpellInfo(RIP resetcounter=ripshreds duration=16 energy=30 tick=2 combo=-5)
    SpellAddTargetDebuff(RIP RIP=1)
Define(SAVAGEROAR 127538) #cat damage buff
    SpellInfo(SAVAGEROAR energy=25 duration=12 combo=-5)
    SpellAddBuff(SAVAGEROAR SAVAGEROAR=1 )
Define(SHRED 5221) #cat behind
    SpellInfo(SHRED inccounter=ripshreds energy=40 combo=1)
Define(SHREDBANG 114236)
    SpellInfo(SHREDBANG inccounter=ripshreds energy=40 combo=1)
Define(SKULLBASHCAT 80965) #cat interrupt
    SpellInfo(SKULLBASHCAT cd=15 energy=15)
Define(THRASHCAT 106830)
    SpellInfo(THRASHCAT duration=15 energy=50 tick=3)
    SpellAddTargetDebuff(THRASHCAT THRASHCAT=1 weakened_blows=1)
Define(TIGERSFURY 5217) #cat buff
    SpellInfo(TIGERSFURY duration=6 energy=-60 cd=30)
    SpellAddBuff(TIGERSFURY TIGERSFURY=1)
Define(WILDCHARGE 49376)
    SpellInfo(WILDCHARGE cd=15)

Define(BERSERKBEAR 106952) #cat+bear cd buff
  SpellInfo(BERSERKBEAR duration=10 cd=180 )
  SpellAddBuff(BERSERKBEAR BERSERKBEAR=1)
Define(MANGLEBEAR 33878)
Define(LACERATE 33745)
Define(FRENZIEDREGEN 22842)
Define(INCARNATIONBEAR 102558)
Define(MAUL 6807)
Define(MIGHTOFURSOC 106922)
Define(RENEWAL 108238)
Define(NATURESSWIFTNESS 132158)
Define(CENARIONWARD 102351)
Define(FORCEOFNATURE 106737)
Define(SAVAGEDEFENSE 62606)
Define(SURVIVALINSTINCTS 61336)
Define(SWIPEBEAR 779)
Define(THRASHBEAR 77758)
Define(BARKSKIN 22812)
Define(ENRAGE 5229)

Define(cat_form 768)
  SpellAddBuff(cat_form cat_form=1)
Define(mark_of_the_wild 1126)
  SpellInfo(mark_of_the_wild duration=3600 )
  SpellAddBuff(mark_of_the_wild mark_of_the_wild=1)
Define(incarnation 102543)
  SpellInfo(incarnation duration=30 cd=180 )
Define(treants 106737)
  SpellInfo(treants duration=15 cd=60 )
Define(weakened_armor 113746)
  SpellInfo(weakened_armor duration=30 )
Define(weakened_blows 115798)
  SpellInfo(weakened_blows duration=30 )
Define(dream_of_cenarius_talent 17)
Define(force_of_nature_talent 12)
Define(incarnation_talent 11)
Define(natures_swiftness_talent 4)
Define(renewal_talent 5)
Define(cenarion_ward_talent 6)
Define(natures_vigil_talent 18)

#Buff
Define(CLEARCASTING 16870)

#Glyphs
Define(GLYPHOFSHRED 114234)

AddCheckBox(berserk "Cat Berserk" default mastery=2)
AddCheckBox(cooldownsL "Show Left Rotation Boxes" default)
AddCheckBox(cooldownsR "Show Right Cooldown Boxes" default)
AddCheckBox(lucioles SpellName(FAERIEFERAL) default mastery=2)
AddCheckBox(infront "Frontal attack"  mastery=2)
AddCheckBox(bearaoe "Bear AOE Rotation" mastery=3)
AddCheckBox(predictive "Hide predictive box" mastery=2)


AddIcon help=cd size=small mastery=3 checkboxon=cooldownsL {
    Spell(BARKSKIN)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsL {
    if TalentPoints(natures_swiftness_talent) Spell(NATURESSWIFTNESS)
    if TalentPoints(renewal_talent) Spell(RENEWAL)
    if TalentPoints(cenarion_ward_talent) Spell(CENARIONWARD)
}

# Main rotation
AddIcon help=main mastery=3 {    
    if CheckBoxOff(bearaoe) {
        if 1s before Spell(MANGLEBEAR) Spell(MANGLEBEAR)

        if not TargetDebuffPresent(weakened_blows any=1) Spell(THRASHBEAR)
        if target.DebuffStacks(weakened_armor any=1) <1 Spell(FAERIEFERAL)
        if TargetDebuffPresent(THRASHBEAR) <4 Spell(THRASHBEAR)

        Spell(LACERATE)
        Spell(FAERIEFERAL)
    }
   
    if CheckBoxOn(bearaoe) {   
        if 1s before Spell(MANGLEBEAR) Spell(MANGLEBEAR)
        Spell(THRASHBEAR)
        Spell(SWIPEBEAR)
    }
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
    if TalentPoints(force_of_nature_talent) Spell(FORCEOFNATURE)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    Spell(BERSERKBEAR)
}

AddFunction ExtendRip
{
    if TalentPoints(incarnation_talent) Spell(RAVAGE usable=1)
    if CheckBoxOn(infront) {
        if Glyph(GLYPHOFSHRED) and {BuffPresent(TIGERSFURY) or BuffPresent(BERSERK)} Spell(SHRED)
        Spell(MANGLECAT)
    }
    Spell(SHRED)
}

AddFunction AddCombo
{    
    if BuffPresent(CLEARCASTING) and TargetDebuffExpires(THRASHCAT 3) Spell(THRASHCAT)
    ExtendRip()
}

AddFunction BITWRange
{
    {ArmorSetParts(T13 more 1) and TargetLifePercent(less 60)} or TargetLifePercent(less 25)
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

AddFunction RefreshSavageRoar
{
    if BuffRemains(SAVAGEROAR) <=1 Spell(SAVAGEROAR)
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
    if BuffPresent(TIGERSFURY) and CheckBoxOn(berserk) {
        Spell(BERSERK)
    }
}

AddFunction MainRotation
{
    if CheckBoxOn(lucioles) and target.DebuffStacks(weakened_armor any=1) <1 {
        Spell(FAERIEFERAL)
    }

    # Two conditions for FB during Blood of the Water phase
    # Add in FB code for end of fight - only do this is Rip buff is present
    if BITWRange() and TargetDebuffPresent(RIP) {
        if ComboPoints(more 4) Spell(FEROCIOUSBITE)
        if ComboPoints(more 0) and TargetDebuffExpires(RIP 2.9) Spell(FEROCIOUSBITE)        
    }
    #Extends Rip with shred/mangle/ravage
    if TargetDebuffPresent(RIP) and TargetDebuffExpires(RIP 6) and ComboPoints() <5 and Counter(ripshreds less 3)
        unless BITWRange() ExtendRip()
        
    if ComboPoints(more 0) and BuffExpires(SAVAGEROAR 3) {
        unless ComboPoints(more 4) and TargetDebuffPresent(RIP) and BuffRemains(SAVAGEROAR) >target.DebuffRemains(RIP) Spell(SAVAGEROAR)
    }
    
    # also extend if we are going to energy cap
    if TargetDebuffPresent(RIP) and TargetDebuffExpires(RIP 6) and 1.4s before Energy(more 99) and Counter(ripshreds less 3)
        unless BITWRange() ExtendRip()
    
    # Time to recast Rip - clip if possible - try to hold off for TF        
    if ComboPoints() >=5 and TargetDebuffExpires(RIP 2) and {BuffPresent(BERSERK) or target.DebuffRemains(RIP)+1.9 <=SpellCooldown(TIGERSFURY) }
        Spell(RIP)

    # FBs during Berserk
    if BuffPresent(BERSERK) {
        if ComboPoints(more 4) and Energy(more 12) and TargetDebuffPresent(RIP 5) and BuffPresent(SAVAGEROAR 3) {
            Spell(FEROCIOUSBITE)
        }
    }

    # clip Rake early if TF is up and rake ramining is less than 9 seconds 
    if TargetDebuffExpires(RAKE 8.9) and BuffPresent(TIGERSFURY) {
        Spell(RAKE)
    }
   
    # intentionally clip Rake to maximize uptime
    if TargetDebuffExpires(RAKE 2.9) and {BuffPresent(BERSERK) or Energy(more 60) or {SpellCooldown(tigers_fury) +0.8 } >=target.DebuffRemains(RAKE)} 
        Spell(RAKE)
}

AddFunction DesyncFB
{    
    if Counter(ripshreds) < 3
    {
        if ComboPoints() >=5 and BuffRemains(SAVAGEROAR) <={target.DebuffRemains(RIP)+6-{Counter(ripshreds)*2}}
            Spell(SAVAGEROAR)
    }
    if Counter(ripshreds) >= 3
    {
        if ComboPoints() >=5 and BuffRemains(SAVAGEROAR) <={target.DebuffRemains(RIP)}
            Spell(SAVAGEROAR)
    }
    
    # aggressive FB
    if ComboPoints(more 4) and target.DebuffRemains(RIP) >=8 Spell(FEROCIOUSBITE)
}

AddFunction Fillers
{        
    # Shred aggressively for Berserk and TF
    if BuffPresent(BERSERK) or BuffPresent(TIGERSFURY) AddCombo()
    
    # Shred for combo points for Rip or SR
    if ComboPoints(less 5) and TargetDebuffExpires(RIP 3) AddCombo()
    if ComboPoints(less 1) and BuffExpires(SAVAGEROAR 2) AddCombo()
    
    # Shred to burn off energy so we can TF without capping
    if { 4s before Spell(TIGERSFURY) } AddCombo()
    
    # Fallback Shred to prevent energy capping
    if 1.4s before Energy(more 99) AddCombo()
}

# Main rotation
AddIcon help=main mastery=2 {
    RefreshSavageRoar()
    TFBerserk()    
    if not TargetInRange(SHRED) Texture(ability_druid_catformattack)
    MainRotation()
    if BuffPresent(CLEARCASTING) AddCombo()
    DesyncFB()
    Fillers()
}

# Predictive rotation
AddIcon help=predictive mastery=2 checkboxoff=predictive {
    RefreshSavageRoar()
    MainRotation()
    DesyncFB()
}


AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rake
    if BuffExpires(SAVAGEROAR 0) Spell(SAVAGEROAR)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rip
    if TargetDebuffExpires(RIP 0) Spell(RIP)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rake
    if TargetDebuffExpires(RAKE 0) Spell(RAKE)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR {
    Spell(TIGERSFURY)
}
]]
}