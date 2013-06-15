if NerienOvaleScripts.class == "DRUID" then

NerienOvaleScripts.script.DRUID.Leafkiller = {
	desc = "[5.3] Leafkiller: Feral, Guardian",
	code =
[[
# Leafkiller's Feral/Guardian druid script.
# Support/Discussion thread: http://fluiddruid.net/forum/viewtopic.php?f=3&t=857
# Cat Rotation based on Simulationcraft single target default script. Contributions to that have come from many ferals.
# Guardian rotation based on the guide at theincbear.com
# Lots of input and constructs from jlam aka Nerien
# Currently maintained by aggixx and Tinderhoof
# Revision History
# 5.2.4 04/18/2013 Better RoR code, better rake code, some DPS oriented changes for Guardian while not tanking
# 5.2.3 03/18/2013 Use Mangle to generate combo points except for high energy situations. Fix issue with misplaced NSs.
# 5.2.2 03/09/2013 Smarter FB logic, fix Faerie Fire, fix mastery assumption for RoR, better Thrash logic, better precombat SR logic
# 5.2.1 02/25/2013 Support for 5.2 changes, rough support for Rune of Reorigination
# 5.1.8 02/16/2013 Fix TF not displaying with berserk checked and TF displaying while Berserk is active, fix lookahead issue with Ravage.
# 5.1.7 02/12/2013 Fix FF option, fix WEAKENED_ARMOR.
# 5.1.6 02/10/2013 Fix frontal attack and talent conditional in main button (dream_of_cenarius_talent should be DREAM_OF_CENARIUS_TALENT)
# 5.1.5 02/09/2013 Update to SimC (Base code from Nerien), code consistency and formatting
# 5.1.4 12/07/2012 Tooth and Claw
# 5.1.3 12/07/2012 Tweak for Bear display with alternate setup selected
# 5.1.2 12/07/2012 Misc changes including SR, Ravage!, alternate layout for Aggixx and some script reconciliation
# 5.1.1 11/30/2012 Ravage fix for PVP 4 set and support for faster combo points on crits
# 5.05.14 11/09/2012 New spell ID for clearcasting
# 5.05.14 11/09/2012 Only suggest Feral_spirit if the symbiosis buff is present - otherwise it suggests symbiosis even when the buff is not up
# 5.05.13 10/23/2012 Don't pool during NV
# 5.05.12 10/22/2012 Fix bad spell name in Rake conditional (TIGERS_FURY should be TIGERSFURY)
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

############################
## Define Spells, Buffs, Items, Talents ##
############################

# Shared spells
Define(BARKSKIN 22812)
    SpellInfo(BARKSKIN cd=60)
Define(FERAL_SPIRIT 110807)
Define(HEALING_TOUCH 5185)
Define(MARK_OF_THE_WILD 1126)
    SpellInfo(MARK_OF_THE_WILD duration=3600)
    SpellAddBuff(MARK_OF_THE_WILD MARK_OF_THE_WILD=1)
Define(SYMBIOSIS 110309)
    SpellAddBuff(SYMBIOSIS SYMBIOSIS=1)
Define(WRATH 5176)

# Shared buffs
Define(DREAM_OF_CENARIUS_DAMAGE 108381)
    SpellInfo(DREAM_OF_CENARIUS_DAMAGE duration=30 )
    SpellAddBuff(DREAM_OF_CENARIUS_DAMAGE DREAM_OF_CENARIUS_DAMAGE=1)
Define(NATURES_VIGIL 124974)
    SpellInfo(NATURES_VIGIL cd=180)
    SpellAddBuff(NATURES_VIGIL NATURES_VIGIL=1)
Define(PREDATORY_SWIFTNESS 69369)
    SpellAddBuff(PREDATORY_SWIFTNESS PREDATORY_SWIFTNESS=1)
Define(PRIMAL_FURY 16961)
Define(TRICKS 57933)
    SpellAddBuff(TRICKS TRICKS=1)
Define(WEAKENED_ARMOR 113746)
    SpellInfo(WEAKENED_ARMOR duration=30)
Define(WEAKENED_BLOWS 115798)
    SpellInfo(WEAKENED_BLOWS duration=30)
Define(CLEARCASTING 135700)
Define(ROR_CRIT 139117)
    SpellInfo(ROR_CRIT duration=10)
Define(ROR_MASTERY 139120)
    SpellInfo(ROR_MASTERY duration=10)
Define(ROR_HASTE 139121)
    SpellInfo(ROR_HASTE duration=10)
    SpellList(ROR ROR_CRIT ROR_MASTERY ROR_HASTE)

# Shared items
ItemList(ROR_ITEM 94532 95802 96546)

# Talents
Define(NATURES_SWIFTNESS_TALENT 4)
Define(RENEWAL_TALENT 5)
Define(CENARION_WARD_TALENT 6)
Define(FAERIE_SWARM_TALENT 7)
Define(TYPHOON_TALENT 9)
Define(SOUL_OF_THE_FOREST 10)
Define(INCARNATION_TALENT 11)
Define(FORCE_OF_NATURE_TALENT 12)
Define(MIGHTY_BASH_TALENT 15)
Define(HEART_OF_THE_WILD_TALENT 16)
Define(DREAM_OF_CENARIUS_TALENT 17)
Define(NATURES_VIGIL_TALENT 18)

# Talent spells
Define(CENARION_WARD 102351)
    SpellInfo(CENARION_WARD cd=30)
Define(FORCE_OF_NATURE 106737)
    SpellInfo(FORCE_OF_NATURE duration=15 cd=60)
Define(HEART_OF_THE_WILD 108292)
    SpellInfo(HEART_OF_THE_WILD cd=360)
    SpellAddBuff(HEART_OF_THE_WILD HEART_OF_THE_WILD=1)
Define(INCARNATION 106731)
    SpellInfo(INCARNATION cd=180)
Define(MIGHTY_BASH 5211)
    SpellInfo(MIGHTY_BASH cd=50)
Define(NATURES_SWIFTNESS 132158)
    SpellInfo(NATURES_SWIFTNESS cd=60)
    SpellAddBuff(NATURES_SWIFTNESS NATURES_SWIFTNESS=1)
Define(RENEWAL 108238)
    SpellInfo(RENEWAL cd=120)
Define(TYPHOON 132469)
    SpellInfo(TYPHOON cd=20)
Define(WILD_CHARGE 102401)
    SpellInfo(WILD_CHARGE cd=15)

#Glyphs
Define(GLYPH_OF_SHRED 114234)
Define(GLYPH_OF_SAVAGERY 127540)

# Shared spells
Define(FAERIE_FERAL 770)
    SpellInfo(FAERIE_FERAL duration=300 cd=6)
    SpellAddTargetDebuff(FAERIE_FERAL FAERIE_FERAL=1 WEAKENED_ARMOR=1)
Define(FAERIE_SWARM 102355)
    SpellInfo(FAERIE_SWARM duration=300 cd=6)
    SpellAddTargetDebuff(FAERIE_SWARM FAERIE_SWARM=1 WEAKENED_ARMOR=1)

# Cat spells
Define(BERSERK_CAT 106951) #cat cd buff
    SpellInfo(BERSERK_CAT duration=15 cd=180)
    SpellAddBuff(BERSERK_CAT BERSERK_CAT=1)
Define(CAT_FORM 768)
    SpellAddBuff(CAT_FORM CAT_FORM=1)
Define(FEROCIOUS_BITE 22568) #cat finish 25-50 energy
    SpellInfo(FEROCIOUS_BITE energy=25 combo=0)
    SpellDamageBuff(FEROCIOUS_BITE DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(INCARNATION_CAT 102543)
    SpellInfo(INCARNATION_CAT duration=30 cd=180)
Define(MAIM 22570) #cat interrupt
    SpellInfo(MAIM cd=10 energy=35 combo=0)
Define(MANGLE_CAT 33876) #cat bleed+debuff
    SpellInfo(MANGLE_CAT inccounter=ripshreds energy=35 combo=1)
    SpellInfo(MANGLE_CAT critcombo=1 if_spell=PRIMAL_FURY)
    #SpellInfo(MANGLE_CAT base=77.7265)
    SpellInfo(MANGLE_CAT base=32207.7265 bonusap=0.3571)
    SpellDamageBuff(MANGLE_CAT DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(RAKE 1822) #cat bleed
    SpellInfo(RAKE combo=1 duration=15 energy=35 tick=3)
    SpellInfo(RAKE base=98.5266 bonusap=0.3)
    SpellInfo(RAKE critcombo=1 if_spell=PRIMAL_FURY)
    SpellAddTargetDebuff(RAKE RAKE=1)
    SpellDamageBuff(RAKE DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(RAVAGE 6785)
    SpellInfo(RAVAGE inccounter=ripshreds energy=45 combo=1)
    SpellInfo(RAVAGE critcombo=1 if_spell=PRIMAL_FURY)
    SpellDamageBuff(RAVAGE DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(RAVAGE_BANG 102545)
    SpellInfo(RAVAGE_BANG inccounter=ripshreds energy=0 combo=1)
    SpellInfo(RAVAGE_BANG critcombo=1 if_spell=PRIMAL_FURY)
    SpellDamageBuff(RAVAGE_BANG DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(RIP 1079) #cat bleed
    SpellInfo(RIP resetcounter=ripshreds duration=16 energy=30 tick=2 combo=0)
    SpellInfo(RIP base=112.76 bonuscp=320 bonusapcp=0.0484) # damage coefficients
    SpellAddTargetDebuff(RIP RIP=1)
    SpellDamageBuff(RIP DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(SAVAGE_ROAR_OLD 52610)
    SpellInfo(SAVAGE_ROAR_OLD duration=18 combo=0 energy=25)
    SpellAddBuff(SAVAGE_ROAR_OLD SAVAGE_ROAR_OLD=1)
Define(SAVAGE_ROAR_GLYPHED 127538)
    SpellInfo(SAVAGE_ROAR_GLYPHED duration=12 combo=-5 energy=25)
    SpellAddBuff(SAVAGE_ROAR_GLYPHED SAVAGE_ROAR_GLYPHED=1)
    SpellList(SAVAGE_ROAR 52610 127538)
Define(SHRED 5221) #cat behind
    SpellInfo(SHRED inccounter=ripshreds energy=40 combo=1)
    SpellInfo(SHRED critcombo=1 if_spell=PRIMAL_FURY)
    SpellDamageBuff(SHRED DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(SHRED_BANG 114236)
    SpellInfo(SHRED_BANG inccounter=ripshreds energy=40 combo=1)
    SpellInfo(SHRED_BANG critcombo=1 if_spell=PRIMAL_FURY)
    SpellDamageBuff(SHRED_BANG DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(STAMPEDE 81022)
    SpellAddBuff(STAMPEDE STAMPEDE=1)
Define(SKULL_BASH_CAT 80965) #cat interrupt
    SpellInfo(SKULL_BASH_CAT cd=15 energy=15)
Define(THRASH_CAT 106830)
    SpellInfo(THRASH_CAT duration=15 energy=50 tick=3)
    SpellAddTargetDebuff(THRASH_CAT THRASH_CAT=1 WEAKENED_BLOWS=1)
    SpellDamageBuff(THRASH_CAT DREAM_OF_CENARIUS_DAMAGE=1.25)
Define(TIGERS_FURY 5217) #cat buff
    SpellInfo(TIGERS_FURY duration=6 energy=-60 cd=30)
    SpellAddBuff(TIGERS_FURY TIGERS_FURY=1)

# Bear spells
Define(BEAR_FORM 5487)
    SpellAddBuff(BEAR_FORM BEAR_FORM=1)
Define(BERSERK_BEAR 106952) #cat+bear cd buff
    SpellInfo(BERSERK_BEAR duration=10 cd=180 )
    SpellAddBuff(BERSERK_BEAR BERSERK_BEAR=1)
Define(ENRAGE 5229)
Define(FRENZIED_REGEN 22842)
Define(INCARNATION_BEAR 102558)
    SpellInfo(INCARNATION_BEAR duration=30 cd=180 )
Define(LACERATE 33745)
Define(MANGLE_BEAR 33878)
    SpellInfo(MANGLE_BEAR cd=3 buffnocd=INCARNATION_BEAR buffnocd=BERSERK_BEAR)
Define(MAUL 6807)
Define(MIGHT_OF_URSOC 106922)
Define(SAVAGE_DEFENSE 62606)
Define(SURVIVAL_INSTINCTS 61336)
Define(SWIPE_BEAR 779)
Define(THRASH_BEAR 77758)
Define(TOOTH_AND_CLAW 135286)
    SpellAddBuff(TOOTH_AND_CLAW TOOTH_AND_CLAW=1)
Define(TOOTH_AND_CLAW_DEBUFF 135601)
    SpellAddTargetDebuff(TOOTH_AND_CLAW_DEBUFF TOOTH_AND_CLAW_DEBUFF=1)

###############
## Define Settings ##
###############

AddCheckBox(cooldownsL "Show Left Rotation Boxes" default)
AddCheckBox(cooldownsR "Show Right Cooldown Boxes" default)
AddCheckBox(altpredictive "Alternate predictive box")
AddCheckBox(bearaoe "Bear AOE Rotation")
AddCheckBox(cooldownsRatio "Show Rake and Rip Ratio Boxes" mastery=2)
AddCheckBox(lucioles SpellName(FAERIE_FERAL) default mastery=2)
AddCheckBox(berserk "Cat Berserk" default mastery=2)
AddCheckBox(infront "Frontal attack" mastery=2)
AddCheckBox(predictive "Hide predictive box" mastery=2)
AddCheckBox(nvbounce "Use healing CDs for damage" mastery=2)

################
## Helper Functions ##
################

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
AddFunction RakeRatio
{
    if TargetDebuffPresent(RAKE) {100 * RakeTickDamage()/LastRakeTickDamage()}
    unless TargetDebuffPresent(RAKE) 100.0
}
AddFunction MangleDamage
{
    if TargetRelativeLevel() == 3
    {
        if TargetDebuffPresent(WEAKENED_ARMOR 3 any=1) Damage(MANGLE_CAT)*0.6798
    #unless TargetDebuffPresent(WEAKENED_ARMOR 3 any=1)
    #{
    #   if TargetDebuffPresent(WEAKENED_ARMOR 2 any=1) Damage(MANGLE_CAT)*0.6652
    #    unless TargetDebuffPresent(WEAKENED_ARMOR 2 any=1)
    #    {
    #        TargetDebuffPresent(WEAKENED_ARMOR any=1) Damage(MANGLE_CAT)*0.6506
        unless TargetDebuffPresent(WEAKENED_ARMOR 3 any=1) Damage(MANGLE_CAT)*0.6361
    #    }
    #}
    }
    unless TargetRelativeLevel() == 3 Damage(MANGLE_CAT)
}

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
AddFunction RipRatio
{
    if TargetDebuffPresent(RIP) {100 * RipTickDamage()/LastRipTickDamage()}
    unless TargetDebuffPresent(RIP) 100.0
}
AddFunction RipDamageTillDead
{
    # The damage from Rip that is cast under the current conditions and lasting till target is dead.
    # Multiply the damage per tick with the number of ticks that can fit into the time to die.
    # XXX Should factor in crit somehow.
    Damage(RIP) * {1 + Mastery() / 100} * {target.TimeToDie() / 2}
}
AddFunction ExistingRipDamageTillDead
{
    # The damage from Rip that is already on the target and lasting till target is dead.
    if target.DebuffPresent(RIP)
    {
        # Multiply the damage per tick with the number of ticks that can fit into the time to die.
        # XXX Should factor in crit somehow.
        LastSpellEstimatedDamage(RIP) * {1 + LastSpellMastery(RIP) / 100} * {target.TimeToDie() / 2}
    }
    if not target.DebuffPresent(RIP)
    {
        0
    }
}

# Misc functions
AddFunction FaerieFire
{
    if TalentPoints(FAERIE_SWARM_TALENT) Spell(FAERIE_SWARM)
    if not TalentPoints(FAERIE_SWARM_TALENT) Spell(FAERIE_FERAL)
}
AddFunction SavageRoar
{
    if Glyph(GLYPH_OF_SAVAGERY) Spell(SAVAGE_ROAR_GLYPHED)
    if Glyph(GLYPH_OF_SAVAGERY no) and ComboPoints(more 0) Spell(SAVAGE_ROAR_OLD)
}
AddFunction BITWRange
{
    # At this target health percent, Ferocious Bite will automatically refresh Rip on the target.
    target.HealthPercent() <=25
}
AddFunction UsePotion
{
    #virmens_bite_potion
    if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion)
}
AddFunction TimeTilEnergyForThrash
{
    if BuffExpires(BERSERK_CAT) {
        if Energy() <= 50 {
            { 50 - Energy() } / EnergyRegen()
        }
        unless Energy() <= 50 {
            0
        }
    }
    if BuffPresent(BERSERK_CAT) {
        if Energy() <= 25 {
            { 25 - Energy() } / EnergyRegen()
        }
        unless Energy() <= 25 {
            0
        }
    }
}

#############################
## Feral rotation functions (Mastery=2) ##
#############################

AddFunction NotInCombat
{
    if not InCombat() {
        if BuffExpires(str_agi_int 400 any=1) Spell(MARK_OF_THE_WILD)
        if BuffExpires(DREAM_OF_CENARIUS_DAMAGE) and TalentPoints(DREAM_OF_CENARIUS_TALENT) Spell(HEALING_TOUCH)
        unless Stance(3) Spell(CAT_FORM)
        if Glyph(GLYPH_OF_SAVAGERY) and ComboPoints() ==0 {
            if BuffRemains(SAVAGE_ROAR_GLYPHED) <15 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-11.5
            or BuffRemains(SAVAGE_ROAR_GLYPHED) <9 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-8.5
            or BuffRemains(SAVAGE_ROAR_GLYPHED) <6 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-5.5
            or BuffRemains(SAVAGE_ROAR_GLYPHED) <3 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-2.5
            or BuffExpires(SAVAGE_ROAR_GLYPHED) {
                SavageRoar()
            }
        }
        if TalentPoints(FORCE_OF_NATURE_TALENT) Spell(FORCE_OF_NATURE)
    }
}

AddFunction FillerActions {
    #thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&combo_points>=5
    if target.DebuffRemains(THRASH_CAT) <3 and target.TimeToDie() >=9 and ComboPoints() >=5 Spell(THRASH_CAT)
    if TalentPoints(INCARNATION_TALENT)
    {
        #ravage
        if BuffPresent(INCARNATION_CAT) Spell(RAVAGE)
    }
    if not TalentPoints(INCARNATION_TALENT) or BuffExpires(INCARNATION_CAT)
    {
        #actions.filler+=/shred,if=(buff.omen_of_clarity.react|buff.berserk.up|energy.regen>=15)&buff.king_of_the_jungle.down
        if BuffPresent(CLEARCASTING) or BuffPresent(BERSERK_CAT) or EnergyRegen() >=15
        and {not CheckBoxOn(infront)
            or {Glyph(GLYPH_OF_SHRED) and {BuffPresent(TIGERS_FURY) or BuffPresent(BERSERK_CAT)}}}
        Spell(SHRED)
        #actions.filler+=/mangle_cat,if=buff.king_of_the_jungle.down
        Spell(MANGLE_CAT)
    }
}

AddFunction SpareGcdCooldowns {
    if TalentPoints(FORCE_OF_NATURE_TALENT)
    {
        #treants
        Spell(FORCE_OF_NATURE)
    }
    # Spirit Wolves goes here when symbiosis is supported appropriately.
}

# Feral rotation for talent builds with "Dream of Cenarius".

AddFunction FillerConditionsDoC
{
    #run_action_list,name=filler,if=buff.omen_of_clarity.react
    if BuffPresent(CLEARCASTING) FillerActions()
    #run_action_list,name=filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
    if {ComboPoints() <5 and target.DebuffRemains(RIP) <3} or {ComboPoints() ==0 and BuffRemains(SAVAGE_ROAR) <2} FillerActions()
    #run_action_list,name=filler,if=buff.predatory_swiftness.remains>1
    if BuffRemains(PREDATORY_SWIFTNESS) >1 FillerActions()
    #run_action_list,name=filler,if=target.time_to_die<=8.5
    if target.TimeToDie() <=8.5 FillerActions()
    #run_action_list,name=filler,if=buff.tigers_fury.up|buff.berserk.up
    if BuffPresent(TIGERS_FURY) or BuffPresent(BERSERK_CAT) FillerActions()
    #run_action_list,name=filler,if=cooldown.tigers_fury.remains<=3
    if SpellCooldown(TIGERS_FURY) <=3 FillerActions()
    #run_action_list,name=filler,if=energy.time_to_max<=1
    if TimeToMaxEnergy() <=1 FillerActions()
}

AddFunction MainActionsDoC
{
    #auto_attack
    
    #healing_touch,if=buff.predatory_swiftness.up&buff.predatory_swiftness.remains<=1.5&buff.dream_of_cenarius_damage.down
    if BuffPresent(PREDATORY_SWIFTNESS) and BuffRemains(PREDATORY_SWIFTNESS) <=1.5 and BuffExpires(DREAM_OF_CENARIUS_DAMAGE) Spell(HEALING_TOUCH)
    
    #savage_roar,if=buff.savage_roar.down
    if BuffExpires(SAVAGE_ROAR) SavageRoar()
    
    #faerie_fire,if=debuff.weakened_armor.stack<3
    if target.DebuffStacks(WEAKENED_ARMOR any=1) <3 and CheckBoxOn(lucioles) FaerieFire()
    
    #healing_touch,if=buff.predatory_swiftness.up&combo_points>=4&buff.dream_of_cenarius_damage.down
    if BuffPresent(PREDATORY_SWIFTNESS) and BuffExpires(DREAM_OF_CENARIUS_DAMAGE) and ComboPoints() >=4 Spell(HEALING_TOUCH)
    
    #healing_touch,if=buff.natures_swiftness.up
    if BuffPresent(NATURES_SWIFTNESS) Spell(HEALING_TOUCH)
    
    if not target.InRange(MANGLE_CAT) Texture(ability_druid_catformattack)
    
    #incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
    #use_item,name=eternal_blossom_grips,sync=tigers_fury
    #tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
    #berserk,if=buff.tigers_fury.up|(target.time_to_die<15&cooldown.tigers_fury.remains>6)
    if {{Energy() <=35 and BuffExpires(CLEARCASTING)} or BuffPresent(INCARNATION_CAT)} and Spell(TIGERS_FURY)
    {
        if CheckBoxOn(berserk) and Spell(BERSERK_CAT)
        {
            if TalentPoints(INCARNATION_TALENT) Spell(INCARNATION)
            if not TalentPoints(INCARNATION_TALENT) or BuffPresent(INCARNATION_CAT) Spell(BERSERK_CAT)
        }
        if not BuffPresent(BERSERK_CAT) Spell(TIGERS_FURY)
    }
    if CheckBoxOn(berserk) and TalentPoints(INCARNATION_TALENT) and BuffPresent(BERSERK_CAT) Spell(INCARNATION_CAT)
    
    #ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
    if BITWRange() and ComboPoints() >=1 and target.DebuffPresent(RIP) and target.DebuffRemains(RIP) <=4 Spell(FEROCIOUS_BITE)
    
    #thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
    if target.TimeToDie() >=9 and BuffPresent(CLEARCASTING) and target.DebuffRemains(THRASH_CAT) <3 Spell(THRASH_CAT)
    
    #ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
    if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(FEROCIOUS_BITE)
    if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(FEROCIOUS_BITE)
    
    if BITWRange()
    {
        #savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
        if BuffRemains(SAVAGE_ROAR) <=3 and ComboPoints() >0 SavageRoar()
        
        if ComboPoints() >=5
        {
            #natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&target.health.pct<=25
            if TalentPoints(NATURES_SWIFTNESS_TALENT) and BuffExpires(DREAM_OF_CENARIUS_DAMAGE) and BuffExpires(PREDATORY_SWIFTNESS) and BuffRemains(SAVAGE_ROAR) >5 Spell(NATURES_SWIFTNESS)
            
            #virmens_bite_potion,if=combo_points>=5&$(time_til_bitw)<15&$(rip_ratio)>=1.15&buff.dream_of_cenarius_damage.up
            if not HasTrinket(ROR_ITEM) and ComboPoints() >=5 and BuffPresent(DREAM_OF_CENARIUS_DAMAGE) and RipRatio() >=115 UsePotion()
            
            #virmens_bite_potion,if=combo_points>=5&$(time_til_bitw)<15&buff.rune_of_reorigination.up&buff.dream_of_cenarius_damage.up
            if HasTrinket(ROR_ITEM) and ComboPoints() >=5 and BuffPresent(DREAM_OF_CENARIUS_DAMAGE) and BuffPresent(ROR_MASTERY) UsePotion()
            
            #virmens_bite_potion,if=target.time_to_die<=40
            if target.TimeToDie() <=40 UsePotion()
            
            #rip,line_cd=30,if=combo_points>=5&buff.virmens_bite_potion.up&buff.dream_of_cenarius_damage.up&target.health.pct<=25&target.time_to_die>30
            # Assume that FB will be 400% normal damage (100% increased damage + crit) to decide if we should overwrite Rip.
            if RipDamageTillDead() > {ExistingRipDamageTillDead() + Damage(FEROCIOUS_BITE) * 4} Spell(RIP)
            
            #pool_resource,wait=0.25,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))
            #ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
            if target.DebuffPresent(RIP)
            {
                unless {{BuffExpires(BERSERK_CAT) and Energy() >=50} or {BuffPresent(BERSERK_CAT) and Energy() >=25}} SpareGcdCooldowns()
                wait if {BuffExpires(BERSERK_CAT) and Energy() >=50} or {BuffPresent(BERSERK_CAT) and Energy() >=25} Spell(FEROCIOUS_BITE)
            }
        }
    }
    
    if HasTrinket(ROR_ITEM) and BuffPresent(ROR_MASTERY) and not BITWRange() and ComboPoints() >=5 and target.TimeToDie() >30
    {
        #natures_swiftness,if=enabled&buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&$(rip_ratio)>=0.92&target.time_to_die>30
        if BuffRemains(ROR_MASTERY) >1.5 and TalentPoints(NATURES_SWIFTNESS_TALENT) and BuffExpires(DREAM_OF_CENARIUS_DAMAGE) and BuffExpires(PREDATORY_SWIFTNESS)
        and RipRatio() >=92 Spell(NATURES_SWIFTNESS)
        
        #rip,if=combo_points>=5&$(rip_ratio)>=1.15&target.time_to_die>30
        if RipRatio() >=115 Spell(RIP)
    }
    
    #rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&buff.dream_of_cenarius_damage.up
    if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(RIP) <2 and BuffPresent(DREAM_OF_CENARIUS_DAMAGE) Spell(RIP)
    
    #rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<6.0&buff.dream_of_cenarius_damage.up&dot.rip.multiplier<=tick_multiplier
    if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(RIP) <6 and BuffPresent(DREAM_OF_CENARIUS_DAMAGE) and RipRatio() >=100 Spell(RIP)
    
    #natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&dot.rip.remains<3&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
    if TalentPoints(NATURES_SWIFTNESS_TALENT) and BuffExpires(DREAM_OF_CENARIUS_DAMAGE)
    and BuffExpires(PREDATORY_SWIFTNESS) and ComboPoints() >=5 and target.DebuffRemains(RIP) <3
    and {BuffPresent(BERSERK_CAT) or target.DebuffRemains(RIP) +1.9 <= SpellCooldown(TIGERS_FURY)}
    {
        Spell(NATURES_SWIFTNESS)
    }
    
    #rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
    if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(RIP) <2
    and {BuffPresent(BERSERK_CAT) or {target.DebuffRemains(RIP)+1.9} <=SpellCooldown(TIGERS_FURY)}
    {
        Spell(RIP)
    }
    
    #savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
    if BuffRemains(SAVAGE_ROAR) <=3 and ComboPoints() >0 and {BuffRemains(SAVAGE_ROAR) +2 > target.DebuffRemains(RIP)} SavageRoar()
    
    #savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
    if BuffRemains(SAVAGE_ROAR) <=6 and ComboPoints() >=5 and {BuffRemains(SAVAGE_ROAR) +2 <= target.DebuffRemains(RIP)} SavageRoar()
    
    #actions.doc+=/pool_resource,wait=0.1,if=combo_points>=5&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))&dot.rip.ticking&!(dot.rip.remains-2<=energy.time_to_max-1)&!(buff.savage_roar.remains-3<=energy.time_to_max-1)
    #actions.doc+=/ferocious_bite,if=combo_points>=5&dot.rip.ticking&!(dot.rip.remains-2<=energy.time_to_max-1)&!(buff.savage_roar.remains-3<=energy.time_to_max-1)&!((buff.savage_roar.remains-6<=energy.time_to_max-1)&buff.savage_roar.remains+2<=$(rip_remains))
    if ComboPoints() >=5 and target.DebuffPresent(RIP) and BuffPresent(SAVAGE_ROAR)
    and not target.DebuffRemains(RIP)-2 <= TimeToMaxEnergy()-1
    and not BuffRemains(SAVAGE_ROAR)-3 <= TimeToMaxEnergy()-1
    and not {BuffRemains(SAVAGE_ROAR)-6 <= TimeToMaxEnergy()-1
        and BuffRemains(SAVAGE_ROAR)+2 <= target.DebuffRemains(RIP)}
    and target.DebuffRemains(RIP) >=5
    {
        unless {{BuffExpires(BERSERK_CAT) and Energy() >=50} or {BuffPresent(BERSERK_CAT) and Energy() >=25}} SpareGcdCooldowns()
        wait if {BuffExpires(BERSERK_CAT) and Energy() >=50} or {BuffPresent(BERSERK_CAT) and Energy() >=25} Spell(FEROCIOUS_BITE)
    }
    
    #rake,if=action.rake.tick_damage>action.mangle_cat.hit_damage&action.rake.tick_damage>=dot.rake.tick_dmg
    if RakeTickDamage() >MangleDamage() and RakeRatio() >=100 Spell(RAKE)
    
    if target.TimeToDie() - target.DebuffRemains(RAKE) >3
    {
        #rake,if=buff.rune_of_reorigination.up&dot.rake.remains<9&(buff.rune_of_reorigination.remains<=1.5)
        if HasTrinket(ROR_ITEM) and BuffPresent(ROR_MASTERY) and target.DebuffRemains(RAKE) <9 and BuffRemains(ROR_MASTERY) <=1.5 Spell(RAKE)
        
        #rake,if=target.time_to_die-dot.rake.remains>3&dot.rake.remains<6.0&buff.dream_of_cenarius_damage.up&dot.rake.multiplier<=tick_multiplier
        if target.DebuffRemains(RAKE) <6 and BuffPresent(DREAM_OF_CENARIUS_DAMAGE) and RakeRatio() >=100 Spell(RAKE)
        
        #rake,if=target.time_to_die-dot.rake.remains>3&tick_multiplier%dot.rake.multiplier>1.12
        if RakeRatio() >=112 Spell(RAKE)
        
        #rake,if=target.time_to_die-dot.rake.remains>3&dot.rake.remains<3.0&(buff.berserk.up|(cooldown.tigers_fury.remains+0.8)>=dot.rake.remains|energy>60)
        if target.DebuffRemains(RAKE) <3
        and {BuffPresent(BERSERK_CAT)
            or Energy(more 60) 
            or {SpellCooldown(TIGERS_FURY) +0.8 } >=target.DebuffRemains(RAKE)}
        Spell(RAKE)
    }
    
    #pool_resource,wait=0.25,for_next=1
    #thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
    if target.DebuffRemains(THRASH_CAT) < {3 + TimeTilEnergyForThrash()} 
    and target.TimeToDie() - TimeTilEnergyForThrash() >=9
    and {target.DebuffRemains(RIP) - TimeTilEnergyForThrash() >=4
        or BuffPresent(BERSERK_CAT)}
    {
        if TimeTilEnergyForThrash() >=1.5 SpareGcdCooldowns()
        wait if {BuffExpires(BERSERK_CAT) and Energy() >=50} or {BuffPresent(BERSERK_CAT) and Energy() >=25} Spell(THRASH_CAT)
    }
}

# Feral rotation for talent builds without "Dream of Cenarius".

AddFunction FillerConditionsNonDoC
{
    #run_action_list,name=filler,if=buff.omen_of_clarity.react
    if BuffPresent(CLEARCASTING) FillerActions()
    #run_action_list,name=filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
    if {ComboPoints() <5 and target.DebuffRemains(RIP) <3} or {ComboPoints() ==0 and BuffRemains(SAVAGE_ROAR) <2} FillerActions()
    #run_action_list,name=filler,if=target.time_to_die<=8.5
    if target.TimeToDie() <=8.5 FillerActions()
    #run_action_list,name=filler,if=buff.tigers_fury.up|buff.berserk.up
    if BuffPresent(TIGERS_FURY) or BuffPresent(BERSERK_CAT) FillerActions()
    #run_action_list,name=filler,if=cooldown.tigers_fury.remains<=3
    if SpellCooldown(TIGERS_FURY) <=3 FillerActions()
    #run_action_list,name=filler,if=energy.time_to_max<=1
    if TimeToMaxEnergy() <=1 FillerActions()
    if TalentPoints(SOUL_OF_THE_FOREST_TALENT)
    {
        #run_action_list,name=filler,if=combo_points<5
        if ComboPoints() <5 FillerActions()
    }
}

AddFunction MainActionsNonDoC
{
    #savage_roar,if=buff.savage_roar.down
    if BuffExpires(SAVAGE_ROAR) SavageRoar()
    
    #faerie_fire,if=debuff.weakened_armor.stack<3
    if target.DebuffStacks(WEAKENED_ARMOR any=1) <3 and CheckBoxOn(lucioles) FaerieFire()
    
    if not target.InRange(MANGLE_CAT) Texture(ability_druid_catformattack)
    
    #incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
    #use_item,name=eternal_blossom_grips,sync=tigers_fury
    #tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
    #berserk,if=buff.tigers_fury.up|(target.time_to_die<15&cooldown.tigers_fury.remains>6)
    if {{Energy() <=35 and BuffExpires(CLEARCASTING)} or BuffPresent(INCARNATION_CAT)} and Spell(TIGERS_FURY)
    {
        if CheckBoxOn(berserk) and Spell(BERSERK_CAT)
        {
            if TalentPoints(INCARNATION_TALENT) Spell(INCARNATION)
            if not TalentPoints(INCARNATION_TALENT) or BuffPresent(INCARNATION_CAT) Spell(BERSERK_CAT)
        }
        if not BuffPresent(BERSERK_CAT) Spell(TIGERS_FURY)
    }
    if CheckBoxOn(berserk) and BuffPresent(BERSERK_CAT)
    {
        if TalentPoints(INCARNATION_TALENT) Spell(INCARNATION_CAT)
        if TalentPoints(NATURES_VIGIL_TALENT) Spell(NATURES_VIGIL)
    }
    
    #ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
    if BITWRange() and ComboPoints() >=1 and target.DebuffPresent(RIP) and target.DebuffRemains(RIP) <=3 Spell(FEROCIOUS_BITE)
    
    #thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
    if target.TimeToDie() >=9 and BuffPresent(CLEARCASTING) and target.DebuffRemains(THRASH_CAT) <3 Spell(THRASH_CAT)
    
    #ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
    if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(FEROCIOUS_BITE)
    if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(FEROCIOUS_BITE)
    
    if BITWRange()
    {
        #savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
        if BuffRemains(SAVAGE_ROAR) <=3 and ComboPoints() >0 SavageRoar()
        
        #ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
        if ComboPoints() >=5 and target.DebuffPresent(RIP) Spell(FEROCIOUS_BITE)
    }
    
    if not BITWRange()
    {
        #actions.doc+=/rip,if=combo_points>=5&$(rip_ratio)>=1.15&target.time_to_die>30
        if HasTrinket(ROR_ITEM) and ComboPoints() >=5 and BuffPresent(ROR_MASTERY) and target.TimeToDie() >30 Spell(RIP)
    }
    
    #rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
    if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(RIP) <2
    {
        if BuffPresent(BERSERK_CAT) Spell(RIP)
        if target.DebuffRemains(RIP) +1.9 <= SpellCooldown(TIGERS_FURY) Spell(RIP)
    }
    
    #savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
    if BuffRemains(SAVAGE_ROAR) <=3 and ComboPoints() >0 and BuffRemains(SAVAGE_ROAR) +2 > target.DebuffRemains(RIP) SavageRoar()
    
    #savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
    if BuffRemains(SAVAGE_ROAR) <=6 and ComboPoints() >=5 and {BuffRemains(SAVAGE_ROAR) +2 <= target.DebuffRemains(RIP)} SavageRoar()
    
    #actions.doc+=/ferocious_bite,if=combo_points>=5&dot.rip.ticking&!(dot.rip.remains-2<=energy.time_to_max-1)&!(buff.savage_roar.remains-3<=energy.time_to_max-1)&!((buff.savage_roar.remains-6<=energy.time_to_max-1)&buff.savage_roar.remains+2<=$(rip_remains))
    if ComboPoints() >=5 and target.DebuffPresent(RIP) and BuffPresent(SAVAGE_ROAR)
    and not target.DebuffRemains(RIP)-2 <= TimeToMaxEnergy()-1
    and not BuffRemains(SAVAGE_ROAR)-3 <= TimeToMaxEnergy()-1
    and not {BuffRemains(SAVAGE_ROAR)-6 <= TimeToMaxEnergy()-1
        and BuffRemains(SAVAGE_ROAR)+2 <= target.DebuffRemains(RIP)}
    {
        Spell(FEROCIOUS_BITE)
    }
    
    #rake,if=action.rake.tick_damage>action.mangle_cat.hit_damage&action.rake.tick_damage>=dot.rake.tick_dmg
    if RakeTickDamage() >MangleDamage() and RakeRatio() >=100 Spell(RAKE)
    
    if target.TimeToDie() - target.DebuffRemains(RAKE) >3
    {
        #rake,if=buff.rune_of_reorigination.up&dot.rake.remains<9&(buff.rune_of_reorigination.remains<=1.5)
        if HasTrinket(ROR_ITEM) and BuffPresent(ROR_MASTERY) and target.DebuffRemains(RAKE) <9 and BuffRemains(ROR_MASTERY) <=1.5 Spell(RAKE)
        
        #rake,if=target.time_to_die-dot.rake.remains>3&tick_multiplier%dot.rake.multiplier>1.12
        if RakeRatio() >=112 Spell(RAKE)
        
        #rake,if=target.time_to_die-dot.rake.remains>3&dot.rake.remains<3.0&(buff.berserk.up|(cooldown.tigers_fury.remains+0.8)>=dot.rake.remains|energy>60)
        if target.DebuffRemains(RAKE) <3
        and {BuffPresent(BERSERK_CAT)
            or Energy(more 60) 
            or {SpellCooldown(TIGERS_FURY) +0.8 } >=target.DebuffRemains(RAKE)}
        Spell(RAKE)
    }
    
    #pool_resource,wait=0.1,for_next=1
    #thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
    if target.DebuffRemains(THRASH_CAT) < {3 + TimeTilEnergyForThrash()}
    and target.TimeToDie() - TimeTilEnergyForThrash() >=9
    and {target.DebuffRemains(RIP) - TimeTilEnergyForThrash() >=4
        or BuffPresent(BERSERK_CAT)}
    {
        if TimeTilEnergyForThrash() >=1.5 SpareGcdCooldowns()
        wait if {BuffExpires(BERSERK_CAT) and Energy() >=50} or {BuffPresent(BERSERK_CAT) and Energy() >=25} Spell(THRASH_CAT)    
    }
}

AddFunction Prediction
{
    if Stance(3) {
        if TalentPoints(DREAM_OF_CENARIUS_TALENT)
        {
            MainActionsDoC()
        }
        if not TalentPoints(DREAM_OF_CENARIUS_TALENT)
        {
            MainActionsNonDoC()
        }
    }
    if Stance(1) {
        if BuffPresent(HEART_OF_THE_WILD) Spell(FRENZIED_REGEN)
        if not BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
    }
    if Stance(0) {
        if BuffPresent(HEART_OF_THE_WILD) {
            if BuffExpires(HEART_OF_THE_WILD) Texture(spell_holy_blessingofagility)
        }
        if not BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
    }
    if Stance(4) or Stance(2) Spell(CAT_FORM)
}

#####################
## Feral icons (Mastery=2) ##
#####################

AddIcon help=Rake size=small mastery=2 checkboxon=cooldownsRatio 
{
    #RakeRatio()
    RipTickDamage()
}

AddIcon help=Rip size=small mastery=2 checkboxon=cooldownsRatio 
{
    #RipRatio()
    #MangleDamage()
    LastRipTickDamage()
}

AddIcon help=cd size=small mastery=2 checkboxon=cooldownsL {
    if target.InRange(SKULL_BASH_CAT) Spell(SKULL_BASH_CAT)
    if not target.Classification(worldboss)
    {
        if TalentPoints(MIGHTY_BASH_TALENT) and target.InRange(MIGHTY_BASH) Spell(MIGHTY_BASH)
        if TalentPoints(TYPHOON_TALENT) and target.InRange(SKULL_BASH_CAT) Spell(TYPHOON)
        if ComboPoints() >0 and target.InRange(MAIM) Spell(MAIM)
    }
    Spell(WILD_CHARGE)
}

AddIcon help=cd size=small mastery=2 checkboxon=cooldownsL { # Berserk Icon
    if BuffPresent(TIGERS_FURY) Spell(BERSERK_CAT)
    if 0s before Spell(BERSERK_CAT) Texture(Ability_mount_polarbear_white)
}


# Predictive rotation
AddIcon help=predictive size=small mastery=2 checkboxon=altpredictive {
    Prediction()
}

AddIcon help=extraCD size=small mastery=2 checkboxon=altpredictive {    
    if TalentPoints(HEART_OF_THE_WILD_TALENT) Spell(HEART_OF_THE_WILD)
    if TalentPoints(DREAM_OF_CENARIUS_TALENT) {
        if TalentPoints(NATURES_SWIFTNESS_TALENT) Spell(NATURES_SWIFTNESS)
        if TalentPoints(CENARION_WARD_TALENT) Spell(CENARION_WARD)
        if TalentPoints(RENEWAL_TALENT) Spell(RENEWAL)
    }
    if TalentPoints(NATURES_VIGIL_TALENT) Spell(NATURES_VIGIL)
}

# Main rotation
AddIcon help=main mastery=2 {
    NotInCombat()
    if Stance(3) {
        if TalentPoints(DREAM_OF_CENARIUS_TALENT)
        {
            MainActionsDoC()
            FillerConditionsDoC()
            SpareGcdCooldowns()
        }
        if not TalentPoints(DREAM_OF_CENARIUS_TALENT)
        {
            MainActionsNonDoC()
            FillerConditionsNonDoC()
            SpareGcdCooldowns()
        }
    }
    if Stance(1) {
        if BuffPresent(HEART_OF_THE_WILD) {
            if CheckBoxOff(bearaoe) BearMain()
            if CheckBoxOn(bearaoe) BearMainAOE()
        }
        if not BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
    }
    if Stance(0) {
        if BuffPresent(HEART_OF_THE_WILD) {
            if CastTime(WRATH) <BuffRemains(HEART_OF_THE_WILD) Spell(WRATH)
            Spell(CAT_FORM)
        }
        if not BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
    }
    if Stance(4) or Stance(2) Spell(CAT_FORM)
}

# Predictive rotation
AddIcon help=predictive mastery=2 checkboxoff=predictive {
    Prediction()
}

AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rake
    if BuffExpires(SAVAGE_ROAR) Texture(ability_druid_skinteeth)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rip
    if TargetDebuffExpires(RIP) Texture(ability_ghoulfrenzy)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR { # Rake
    if TargetDebuffExpires(RAKE) Texture(ability_druid_disembowel)
}
AddIcon help=cd size=small mastery=2 checkboxon=cooldownsR {
    Spell(TIGERS_FURY)
}

################################
## Guardian rotation functions (Mastery=3) ##
################################

AddFunction BearMain {
    if Threat() <100 and target.DebuffPresent(LACERATE) and target.DebuffRemains(LACERATE) <2 Spell(LACERATE)
    if Threat() <100 and BuffPresent(INCARNATION_BEAR) and target.DebuffRemains(THRASH_BEAR) <2 Spell(THRASH_BEAR)
    
    Spell(MANGLE_BEAR)
    
    
    # Debuff maintenance.
    if target.DebuffRemains(WEAKENED_BLOWS 3 any=1) <=3 Spell(THRASH_BEAR)
    if target.DebuffRemains(WEAKENED_ARMOR 3 any=1) <=3 or target.DebuffStacks(WEAKENED_ARMOR any=1) <3
    {
        FaerieFire()
    }
    
    Spell(LACERATE)
    if target.DebuffPresent(THRASH_BEAR 6) FaerieFire()
    Spell(THRASH_BEAR)
}

AddFunction BearMainAOE {
    Spell(MANGLE_BEAR)
    Spell(THRASH_BEAR)
    Spell(SWIPE_BEAR)
}

#######################
## Guardian icons (Mastery=3) ##
#######################

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsL {
    Spell(BARKSKIN)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsL {
    if TalentPoints(NATURES_SWIFTNESS_TALENT) Spell(NATURES_SWIFTNESS)
    if TalentPoints(RENEWAL_TALENT) Spell(RENEWAL)
    if TalentPoints(CENARION_WARD_TALENT) Spell(CENARION_WARD)
}

AddIcon mastery=3 size=small checkboxon=altpredictive checkboxoff=cooldownsL {
    if Rage(less 11) Spell(ENRAGE useable=1)
    Spell(SAVAGE_DEFENSE usable=1)
    Spell(FRENZIED_REGEN)
}

AddIcon mastery=3 size=small checkboxon=altpredictive checkboxoff=cooldownsL {
    if BuffPresent(TOOTH_AND_CLAW) and target.DebuffExpires(TOOTH_AND_CLAW_DEBUFF) Spell(TOOTH_AND_CLAW)
    unless BuffPresent(TOOTH_AND_CLAW) and target.DebuffExpires(TOOTH_AND_CLAW_DEBUFF) Spell(MAUL)
}

# Main rotation
AddIcon help=main mastery=3 {
    if InCombat(no) and BuffRemains(str_agi_int any=1) <400 Spell(MARK_OF_THE_WILD)
    if not Stance(1) Spell(BEAR_FORM)
    
    if CheckBoxOff(bearaoe) BearMain()
    if CheckBoxOn(bearaoe) BearMainAOE()
}

AddIcon help=defense mastery=3 checkboxoff=altpredictive {
    if Rage(less 11) Spell(ENRAGE useable=1)
    Spell(SAVAGE_DEFENSE usable=1)
    Spell(FRENZIED_REGEN)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    Spell(SURVIVAL_INSTINCTS)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    Spell(MIGHT_OF_URSOC)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    if TalentPoints(INCARNATION_TALENT) Spell(INCARNATION_BEAR)
    if TalentPoints(FORCE_OF_NATURE_TALENT) Spell(FORCE_OF_NATURE)
}

AddIcon help=cd size=small mastery=3 checkboxon=cooldownsR {
    Spell(BERSERK_BEAR)
}
]]
}

end
