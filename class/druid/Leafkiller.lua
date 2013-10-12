local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.DRUID.Leafkiller = {
	desc = "[5.4] Leafkiller: Feral, Guardian",
	code =
[[
# Leafkiller's Feral/Guardian druid script, maintained by ShmooDude and aggixx.
# Support/Discussion thread: http://fluiddruid.net/forum/viewtopic.php?f=3&t=857
# 10/03/13 version 5.4.2.1
#   Fixed rake bug
#   Added check to ensure you'll have energy to use thrash at the end of a rune before suggesting it
#   Reenabled bleed ratio prediction but added a mangle specific filler line that occurs shortly after the traditional filler line so something shows up till Ovale bug is fixed
#   Update FoN logic
#   Fix Haromm's spell ID
# 9/28/13 version 5.4.2.0
#   Temporarily disabled bleed ratio prediction on filler rake until ovale fix can be implemented 
#   Removed some unnecessary conditionals from FillerActions
#   Removed Tiger's Fury condition in TimeTilEnergyForAbility functions
#   Reverted to manually calculating the energy cost and TimeTilEnergy for abilities due to weirdness with omen of clarity
# 9/26/13 version 5.4.1.0
#   Only overwrite Rake at the end of a rune if its ratio is >75
#   Changed potion logic to use the new TimeToHealthPercent() function
# 9/25/13 version 5.4.0.4
#   Allowed Ferocious Bite to be used at TimeToDie <=16 without rip present
#   Added crit suppression for damage calculations
#   Added 20% Rip damage buff
# 9/24/13 version 5.4.0.3
#   Changed Rip to use Last functions instead of target.Debuff functions to fix Rip extension bug
#   Added Potion logic
# 9/18/13 version 5.4.0.2
#   Switched to execute range Rip logic if TimeToDie <=16
#   Thrash as filler if the initial hit out damages (per energy) Swipe for AoE rotation
#   Added Energy based considerations for when to suggest applying an end of rune bleed
#   Added Thrash clipping at end of Rune to normal rotation
# 9/13/13 version 5.4.0.1
#   Fixed Incarnation
#   Added Nature's Vigil for CD usage
#   Modified Berserk check box description to "Suggest Long DPS cooldown(s)"
#   Added an AoE rotation for cat
#   Moved Bear AoE to its own box to match cat
#   Modified checkboxes to have spec specific, more detailed descriptions where appropriate and for consistency
#   Changed Big Cat Predictive box to show when on instead of off for consistency
#   Changed Bear Small Rage Usage Boxes to be enabled with the same checkbox as Cat Small Predictive Box
#   Allowed Small Rage Usage Boxes to coexist with left cooldown boxes
#   Cleaned up icon tooltip information
# 9/09/13 version 5.4.0.0
#   Added Feral Rage and Feral Fury buffs and logic
#   Changed Nature's Swiftness to Ysera's Gift
#   Updated FoN logic
# 9/06/13 version 5.4.0.0
#   Added SoO trinkets to buff prediction
#   Removed waiting on TF for Rip
#   Only use fillers during TF for DoC
#   Modified DoC Filler line to be less aggressive at building CPs
#   Added Energy check for fillers
# 9/05/13 version 5.4.0.0
#   Added end of Rune logic for Thrash and Rip
#   Added <12 second SR logic, lowered the priority of FB and increased energy pooling for non-berserk FB
#   Changed fillers to be used at 1.25 seconds from energy cap instead of 1.0.
# 9/02/13 version 5.4.0.0
#   Fixed Savage Roar refresh logic
#   Removed line for HotW+SotF that prevented energy pooling
# 8/29/13 version 5.4.0.0
#   Defined buffs and ItemLists for new SoO trinkets
#   Removed old FoN code, added FoN usage logic to "extraCD" box
#   Changed BAD_JUJU and SOUL_CHARM to 10 second durations
#   Updated DoC damage modifier to 1.30
#   Added DoC as a damage buff to some damage-dealing abilities
# 8/02/13 version 5.3.8.5
#   Added TimeToEnergy to end of rip refreshes and added back waiting on TF when the CD is close
#   Will allow Rake to expire if the new rake will be significantly weaker than the current Rake
#   Increased required duration of Rip/Savage Roar needed to apply Thrash
# 7/25/13 version 5.3.8.4
#   Fixed Faerie Swarm asking for Faerie Fire's cooldown data
#   Applied same fix to Savage Roar
# 7/23/13 version 5.3.8.3
#   Fixed Rake ratios
#   Fixed double tanking icons
# 7/23/13 version 5.3.8.2
#   Changed Rake logic back to strict damage and ratio based.
#   Fixed Non-doc predictive box
# 7/20/13 version 5.3.8.1 
#   Switched from berserk testing to the new built in EnergyCost(ability) function for determining the energy for abilities.
#   Switched from (EnergyCost - CurrentEnergy) / EnergyRegen to the new built in function TimeToEnergyFor(ability).
#   Slight code reorganization to make it easier to browse.
#   More things in functions for better efficiency.
#   Allowed the user to customize the safety margin around expiring buffs via a list item.
#   Removed the "Use Healing CDs for damage" checkbox as its not currently used.
#   Rake will now compare with ravage instead of mangle if incarnation is up (modified by the difference in energy cost).
#   Added bug catching code for target based rip damage.
#   Added a "Debug Mode" checkbox for testing the target.Debuff data vs the LastSpell data.
# 7/19/13 Version 5.3.7.3


############################
## Define Spells, Buffs, Items, Talents ##
############################

# Shared spells
Define(BARKSKIN 22812)
	SpellInfo(BARKSKIN cd=60)
Define(FERAL_SPIRIT 110807)
	SpellInfo(FERAL_SPIRIT cd=120)
Define(HEALING_TOUCH 5185)
Define(MARK_OF_THE_WILD 1126)
	SpellInfo(MARK_OF_THE_WILD duration=3600)
	SpellAddBuff(MARK_OF_THE_WILD MARK_OF_THE_WILD=1)
Define(SYMBIOSIS 110309)
	SpellAddBuff(SYMBIOSIS SYMBIOSIS=1)
Define(WRATH 5176)
Define(HURRICANE 16914)
  SpellInfo(HURRICANE duration=10 tick=1 haste=spell canStopChannelling=9 )

# Shared buffs
Define(DREAM_OF_CENARIUS 145152)
	SpellInfo(DREAM_OF_CENARIUS duration=30)
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
Define(FERAL_FURY 144865)
	SpellInfo(FERAL_FURY duration=6)
Define(FERAL_RAGE 146874)
	SpellInfo(FERAL_RAGE duration=12)

# Trinket, Potion and Weapon Enchant buffs
Define(ROR_CRIT 139117)
	SpellInfo(ROR_CRIT duration=10)
Define(ROR_MASTERY 139120)
	SpellInfo(ROR_MASTERY duration=10)
Define(ROR_HASTE 139121)
	SpellInfo(ROR_HASTE duration=10)
	SpellList(ROR ROR_CRIT ROR_MASTERY ROR_HASTE)
Define(DANCING_STEEL 120032)
	SpellInfo(DANCING_STEEL duration=12)
Define(SOUL_CHARM 138756)
	SpellInfo(SOUL_CHARM duration=10)
Define(BLADES 138737)
Define(BAD_JUJU 138939)
	SpellInfo(BAD_JUJU duration=10)
Define(VICIOUS_TALISMAN 138700)
	SpellInfo(VICIOUS_TALISMAN duration=20)
Define(ASSURANCE_OF_CONSEQUENCE 146309)
	SpellInfo(ASSURANCE_OF_CONSEQUENCE duration=20)
Define(HAROMMS_TALISMAN 148903)
	SpellInfo(HAROMMS_TALISMAN duration=10)
Define(SIGIL_OF_RAMPAGE 148895)
	SpellInfo(SIGIL_OF_RAMPAGE duration=15)
Define(TICKING_EBON_DETONATOR 146311)
	SpellInfo(TICKING_EBON_DETONATOR duration=10)
Define(RESTLESS_AGILITY 146310)
Define(VIRMENS_BITE 105697)

# Shared items
ItemList(ROR_ITEM 94532 95802 96174 96546 96918)
ItemList(SOUL_CHARM_ITEM 96741 96369 95997 94512 95625)
ItemList(BAD_JUJU_ITEM 96781 96409 96037 94523 95665)
ItemList(VICIOUS_TALISMAN_ITEM 94511)
ItemList(ASSURANCE_OF_CONSEQUENCE_ITEM 104974 104725 102292 105223 104476 105472)
ItemList(HAROMMS_TALISMAN_ITEM 105029 104780 102301 105278 104531 105527)
ItemList(SIGIL_OF_RAMPAGE_ITEM 105082 104833 102302 105331 104584 105580)
ItemList(TICKING_EBON_DETONATOR_ITEM 105114 104865 102311 105363 104616 105612)
Define(VIRMENS_BITE_ITEM 76089)

# Talents
Define(YSERAS_GIFT_TALENT 4)
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
	SpellInfo(FEROCIOUS_BITE combo=0)
	SpellDamageBuff(FEROCIOUS_BITE DREAM_OF_CENARIUS=1.30)
Define(INCARNATION_CAT 102543)
	SpellInfo(INCARNATION_CAT duration=30 cd=180)
Define(MAIM 22570) #cat interrupt
	SpellInfo(MAIM cd=10 combo=0)
	SpellDamageBuff(MAIM DREAM_OF_CENARIUS=1.30)
Define(MANGLE_CAT 33876) #cat bleed+debuff
	SpellInfo(MANGLE_CAT inccounter=ripshreds combo=1)
	SpellInfo(MANGLE_CAT critcombo=1 if_spell=PRIMAL_FURY)
	SpellDamageBuff(MANGLE_CAT DREAM_OF_CENARIUS=1.30)
	SpellDamageBuff(MANGLE_CAT FERAL_FURY=1.5)
Define(RAKE 1822) #cat bleed
	SpellInfo(RAKE combo=1 duration=15 tick=3)
    SpellInfo(RAKE base=99 bonusap=0.3)
	SpellInfo(RAKE critcombo=1 if_spell=PRIMAL_FURY)
	SpellAddTargetDebuff(RAKE RAKE=1)
	SpellDamageBuff(RAKE DREAM_OF_CENARIUS=1.30)
Define(RAVAGE 6785)
	SpellInfo(RAVAGE inccounter=ripshreds combo=1)
	SpellInfo(RAVAGE critcombo=1 if_spell=PRIMAL_FURY)
	SpellDamageBuff(RAVAGE DREAM_OF_CENARIUS=1.30)
	SpellDamageBuff(RAVAGE FERAL_FURY=1.5)
Define(RAVAGE_BANG 102545)
	SpellInfo(RAVAGE_BANG inccounter=ripshreds combo=1)
	SpellInfo(RAVAGE_BANG critcombo=1 if_spell=PRIMAL_FURY)
	SpellDamageBuff(RAVAGE_BANG DREAM_OF_CENARIUS=1.30)
	SpellDamageBuff(RAVAGE_BANG FERAL_FURY=1.5)
Define(RIP 1079) #cat bleed
	SpellInfo(RIP resetcounter=ripshreds duration=16 tick=2 combo=0)
	SpellAddTargetDebuff(RIP RIP=1)
	SpellDamageBuff(RIP DREAM_OF_CENARIUS=1.30)
Define(SAVAGE_ROAR_OLD 52610)
	SpellInfo(SAVAGE_ROAR_OLD duration=18 combo=0)
	SpellAddBuff(SAVAGE_ROAR_OLD SAVAGE_ROAR_OLD=1)
Define(SAVAGE_ROAR_GLYPHED 127538)
	SpellInfo(SAVAGE_ROAR_GLYPHED duration=12 combo=-5)
	SpellAddBuff(SAVAGE_ROAR_GLYPHED SAVAGE_ROAR_GLYPHED=1)
	SpellList(SAVAGE_ROAR 52610 127538)
Define(SHRED 5221) #cat behind
	SpellInfo(SHRED inccounter=ripshreds combo=1)
	SpellInfo(SHRED critcombo=1 if_spell=PRIMAL_FURY)
	SpellDamageBuff(SHRED DREAM_OF_CENARIUS=1.30)
	SpellDamageBuff(SHRED FERAL_FURY=1.5)
Define(SHRED_BANG 114236)
	SpellInfo(SHRED_BANG inccounter=ripshreds combo=1)
	SpellInfo(SHRED_BANG critcombo=1 if_spell=PRIMAL_FURY)
	SpellDamageBuff(SHRED_BANG DREAM_OF_CENARIUS=1.30)
	SpellDamageBuff(SHRED_BANG FERAL_FURY=1.5)
Define(STAMPEDE 81022)
	SpellAddBuff(STAMPEDE STAMPEDE=1)
Define(SKULL_BASH_CAT 80965) #cat interrupt
	SpellInfo(SKULL_BASH_CAT cd=15)
Define(THRASH_CAT 106830)
	SpellInfo(THRASH_CAT duration=15 tick=3)
	SpellAddTargetDebuff(THRASH_CAT THRASH_CAT=1 WEAKENED_BLOWS=1)
	SpellDamageBuff(THRASH_CAT DREAM_OF_CENARIUS=1.30)
Define(SWIPE_CAT 62078)
	SpellInfo(SWIPE_CAT combo=1)
	SpellDamageBuff(SWIPE_CAT DREAM_OF_CENARIUS=1.30)
	SpellDamageBuff(SWIPE_CAT FERAL_FURY=1.5)
Define(TIGERS_FURY 5217) #cat buff
	SpellInfo(TIGERS_FURY duration=6 cd=30)
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

AddCheckBox(cooldownsL "Left: DPS CD Boxes" default mastery=2)
AddCheckBox(cooldownsL "Left: Defensive CD Boxes" default mastery=3)
AddCheckBox(cooldownsR "Right: Bleed/SR Remain Boxes" default mastery=2)
AddCheckBox(cooldownsR "Right: Defensive CD Boxes" default mastery=3)
AddCheckBox(altpredictive "Left: Small Predictive Box" mastery=2)
AddCheckBox(altpredictive "Left: Small Rage Usage Boxes" mastery=3)
# AddCheckBox(bearaoe "Bear AoE Rotation") # Removed; AoE rotation is now its own box
AddCheckBox(showaoe "Right: AoE Rotation" default)
AddCheckBox(cooldownsRatio "Left: Rake/Rip Ratio Boxes" mastery=2)
AddCheckBox(cooldownsRatio "Don't change in Guardian" mastery=3)
AddCheckBox(lucioles SpellName(FAERIE_FERAL) default mastery=2)
AddCheckBox(berserk "Suggest Long DPS CD(s)" default mastery=2)
AddCheckBox(infront "Frontal attack" mastery=2)
AddCheckBox(predictive "Right: Big Predictive Box" mastery=2 default)
AddCheckBox(predictive "Right: Big Rage Usage Box" mastery=3 default)
# AddCheckBox(nvbounce "Use healing CDs for damage" mastery=2) # Currently unused
AddCheckBox(potion "Suggest Virmen's Bite Potion" mastery=2)
AddListItem(expbuffsafetymargin point0 "0.0 seconds" mastery=2)
AddListItem(expbuffsafetymargin point1 "0.1 seconds" mastery=2)
AddListItem(expbuffsafetymargin point2 "0.2 seconds" mastery=2)
AddListItem(expbuffsafetymargin point3 "0.3 seconds" mastery=2)
AddListItem(expbuffsafetymargin point4 "0.4 seconds" mastery=2)
AddListItem(expbuffsafetymargin point5 "0.5 seconds" mastery=2 default)

################
# Static Variables
################
AddFunction HeartOfTheWildAgiModifier { 1.06 }
AddFunction LeatherSpecAgiModifier { 1.05 }
AddFunction StatsBuffBonus { 0.05 }
AddFunction RakeBaseDamage { 99 }
AddFunction RakeDamagePerAttackPower { 0.3 }
AddFunction RipBaseDamage { 136 }
AddFunction RipDamagePerComboPoint { 384 }
AddFunction RipDamagePerComboPointAttackPower { 0.05808 }
AddFunction ThrashHitBaseDamage { 1232 }
AddFunction ThrashHitDamagePerAttackPower { 0.191 }
AddFunction SwipeCatWeaponDamageMultiplier { 4.8 }
AddFunction FerociousBiteBaseDamage { 500 }
AddFunction FerociousBiteDamagePerComboPoint { 762 }
AddFunction FerociousBiteDamagePerComboPointAttackPower { 0.196 }
AddFunction FerociousBiteCritChanceBonus { 25 }
AddFunction MangleCatBaseDamage { 78 }
AddFunction MangleCatWeaponDamageMultiplier { 5 }
AddFunction RavageBaseDamage { 78 }
AddFunction RavageWeaponDamageMultiplier { 9.5 }
AddFunction RavageCritChanceBonus { 50 }
AddFunction CritPerAttackPower { 2519.04 }
AddFunction LevelBasedCritSuppression { if target.RelativeLevel() >0 target.RelativeLevel() 0 }
AddFunction ExpiringBuffSafetyMargin 
{ 
	if List(expbuffsafetymargin point0) 0.0
	if List(expbuffsafetymargin point1) 0.1
	if List(expbuffsafetymargin point2) 0.2
	if List(expbuffsafetymargin point3) 0.3
	if List(expbuffsafetymargin point4) 0.4
	if List(expbuffsafetymargin point5) 0.5
	0.5
}

################
# Trinket/Proc values
################
AddFunction TigersFuryMultiplier { 1.15 }
AddFunction RuneMultiplier { 2 } # Not the actual amount like the rest, but given the power of the rune buff the script should still function properly
AddFunction DancingSteelAttackPower { 3300 }
AddFunction SoulCharmAttackPower 
{ 
	if HasTrinket(96741) 3430 # Heroic TF 2/2 upgrade
	if HasTrinket(96369) 3244 # Heroic 2/2 upgrade
	if HasTrinket(95997) 3038 # Normal TF 2/2 upgrade
	if HasTrinket(94512) 2874 # Normal 2/2 upgrade
	if HasTrinket(95625) 2384 # LFR 2/2 upgrade
}
AddFunction BadJujuAttackPower 
{ 
	if HasTrinket(96781) 18864 # Heroic TF 2/2 upgrade
	if HasTrinket(96409) 17840 # Heroic 2/2 upgrade
	if HasTrinket(96037) 16712 # Normal TF 2/2 upgrade
	if HasTrinket(94523) 15806 # Normal 2/2 upgrade
	if HasTrinket(95665) 13118 # LFR 2/2 upgrade
}
AddFunction ViciousTalismanAttackPower
{
	17600 # 2/2 upgrade
}
AddFunction AssuranceOfConsequenceAttackPower 
{ 
	if HasTrinket(105472) 30248 # Heroic WF 2/2 upgrade
	if HasTrinket(104476) 28606 # Heroic 2/2 upgrade
	if HasTrinket(105223) 26798 # Normal WF 2/2 upgrade
	if HasTrinket(102292) 25342 # Normal 2/2 upgrade
	if HasTrinket(104725) 22452 # Flex 2/2 upgrade
	if HasTrinket(104974) 20074 # LFR 2/2 upgrade
}
AddFunction HarommsTalismanAttackPower 
{ 
	if HasTrinket(105527) 30248 # Heroic WF 2/2 upgrade
	if HasTrinket(104531) 28606 # Heroic 2/2 upgrade
	if HasTrinket(105278) 26798 # Normal WF 2/2 upgrade
	if HasTrinket(102301) 25342 # Normal 2/2 upgrade
	if HasTrinket(104780) 22452 # Flex 2/2 upgrade
	if HasTrinket(105029) 20074 # LFR 2/2 upgrade
}
AddFunction SigilOfRampageAttackPower 
{ 
	if HasTrinket(105580) 30248 # Heroic WF 2/2 upgrade
	if HasTrinket(104584) 28606 # Heroic 2/2 upgrade
	if HasTrinket(105331) 26798 # Normal WF 2/2 upgrade
	if HasTrinket(102302) 25342 # Normal 2/2 upgrade
	if HasTrinket(104833) 22452 # Flex 2/2 upgrade
	if HasTrinket(105082) 20074 # LFR 2/2 upgrade
}
AddFunction TickingEbonDetonatorAttackPower 
{ 
	if HasTrinket(105612) 2750 # Heroic WF 2/2 upgrade
	if HasTrinket(104616) 2600 # Heroic 2/2 upgrade
	if HasTrinket(105363) 2436 # Normal WF 2/2 upgrade
	if HasTrinket(102311) 2304 # Normal 2/2 upgrade
	if HasTrinket(104865) 2042 # Flex 2/2 upgrade
	if HasTrinket(105114) 1826 # LFR 2/2 upgrade
}

################
# Energy related functions
################
AddFunction EnergyForThrash { if BuffPresent(BERSERK_CAT) 25 50 }
AddFunction EnergyForRake { if BuffPresent(BERSERK_CAT) 18 35 }
AddFunction EnergyForRip { if BuffPresent(BERSERK_CAT) 15 30 }
AddFunction EnergyForMangle { if BuffPresent(BERSERK_CAT) 18 35 }
AddFunction EnergyForShred { if BuffPresent(BERSERK_CAT) 20 40 }
AddFunction EnergyForRavage { if BuffPresent(BERSERK_CAT) 23 45 }
AddFunction EnergyForFerociousBite { if BuffPresent(BERSERK_CAT) 25 50 }
AddFunction HasEnergyForThrash { Energy() >= EnergyForThrash() }
AddFunction HasEnergyForRake { Energy() >= EnergyForRake() }
AddFunction HasEnergyForRip { Energy() >= EnergyForRip() }
AddFunction HasEnergyForMangle { Energy() >= EnergyForMangle() }
AddFunction HasEnergyForShred { Energy() >= EnergyForShred() }
AddFunction HasEnergyForFerociousBite { Energy() >= EnergyForFerociousBite() }
AddFunction HasEnergyForRavage { Energy() >= EnergyForRavage() }


################
# Combo Point related functions
################
AddFunction MaxComboPoints { ComboPoints() >= 5 }
AddFunction HasAnyComboPoints { ComboPoints() > 0 }
AddFunction NoComboPoints { ComboPoints() == 0 }

################
# Armor Functions
################
AddFunction ArmorReduction
{
	if target.DebuffPresent(WEAKENED_ARMOR any=1)
	{
		if target.Level(less 1) 0.679
		0.698
	}
	if target.Level(less 1) 0.651
	0.671
}

################
# Crit Chance Functions
################
AddFunction FerociousBiteCritChanceRaw { FerociousBiteCritChanceBonus()+MeleeCritChance() }
AddFunction FerociousBiteCritChance 
{ 
	if FerociousBiteCritChanceRaw() > 100
		100
	FerociousBiteCritChanceRaw() 
}
AddFunction RavageCritChanceRaw { RavageCritChanceBonus()+MeleeCritChance() }
AddFunction RavageCritChance 
{ 
	if target.HealthPercent() >=80
	{
		if RavageCritChanceRaw() > 100
			100
		RavageCritChanceRaw()
	}
	MeleeCritChance()
}

################
# Time till energy for abilities functions (must come before Rune functions)
# Moved energy check from functions to main code to fix predictive algorithm bug within ovale
# Always use an energy check when utilizing these functions or you will have a disappearing icon problem
# Example:
# if HasEnergyForRake() and target.DebuffRemains(RAKE) < 3
#     or not HasEnergyForRake() and target.DebuffRemains(RAKE) < 3 + TimeTilEnergyForRake()
################
AddFunction TigersFuryCooldown { SpellCooldown(TIGERS_FURY) }
AddFunction TimeTilEnergyForThrash
{
	if HasEnergyForThrash()
		0
	{ EnergyForThrash() - Energy() } / EnergyRegen()
}
AddFunction TimeTilEnergyForRake
{
	if HasEnergyForRake()
		0
	{ EnergyForRake() - Energy() } / EnergyRegen()
}
AddFunction TimeTilEnergyForRip
{
	if HasEnergyForRip()
		0
	{ EnergyForRip() - Energy() } / EnergyRegen()
}
AddFunction TimeTilEnergyForMangle
{
	if HasEnergyForMangle()
		0
	{ EnergyForRip() - Energy() } / EnergyRegen()
}
AddFunction ThrashEnergySafetyMargin { TimeTilEnergyForThrash()+ExpiringBuffSafetyMargin() }


################
# Buff Calculation assistance functions
################
AddFunction AttackPowerToCrit { 1/CritPerAttackPower()/{1+0.1*BuffStacks(attack_power_multiplier any=1)} }
AddFunction PrimordiusStats { {1 + 0.05 * DebuffStacks(136184)} * {1 - 0.1 * DebuffStacks(136185)} } # Thick and Fragile bones
AddFunction StatsMultiplier # Leatherwearer, Heart of the Wild, Mark of the Wild/Blessing of Kings, Primordius Buffs
{
	if TalentPoints(HEART_OF_THE_WILD)
		LeatherSpecAgiModifier() * HeartOfTheWildAgiModifier() * {1 + StatsBuffBonus() * BuffStacks(str_agi_int any=1)} * PrimordiusStats()
	LeatherSpecAgiModifier() * {1 + StatsBuffBonus() * BuffStacks(str_agi_int any=1)} * PrimordiusStats()
}
AddFunction DancingSteelAttackPowerIncrease { DancingSteelAttackPower()*StatsMultiplier() }
AddFunction SoulCharmAttackPowerIncrease { SoulCharmAttackPower()*BuffStacks(BLADES)*StatsMultiplier() }
AddFunction BadJujuAttackPowerIncrease { BadJujuAttackPower()*StatsMultiplier() }
AddFunction ViciousTalismanAttackPowerIncrease { ViciousTalismanAttackPower()*StatsMultiplier() }
AddFunction AssuranceOfConsequenceAttackPowerIncrease { AssuranceOfConsequenceAttackPower()*StatsMultiplier() }
AddFunction HarommsTalismanAttackPowerIncrease { HarommsTalismanAttackPower()*StatsMultiplier() }
AddFunction SigilOfRampageAttackPowerIncrease { SigilOfRampageAttackPower()*StatsMultiplier() }
AddFunction TickingEbonDetonatorAttackPowerIncrease { TickingEbonDetonatorAttackPower()*BuffStacks(RESTLESS_AGILITY)*StatsMultiplier() }


################
# Rake Buff related functions; Checks to ensure you can use a Rake before a buff expires
################
AddFunction RakeCooldown { if SpellCooldown(RAKE) > 0 SpellCooldown(RAKE) 0 }
AddFunction RakeCooldownSafetyMargin { RakeCooldown()+ExpiringBuffSafetyMargin() }
AddFunction RakeEnergySafetyMargin { TimeTilEnergyForRake()+ExpiringBuffSafetyMargin() }
AddFunction RuneRakeUsableBeforeExpire
{
	if BuffRemains(ROR_MASTERY) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(ROR_MASTERY) > ExpiringBuffSafetyMargin()
		BuffRemains(ROR_MASTERY) > RakeEnergySafetyMargin()
	}
}
AddFunction RuneExpiresRakeMultiplier
{
	if BuffPresent(ROR_MASTERY)
	{
		if RuneRakeUsableBeforeExpire() 1
		RuneMultiplier()
	}
		1
}
AddFunction TigersFuryRakeUsableBeforeExpire
{
	if BuffRemains(TIGERS_FURY) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(TIGERS_FURY) > ExpiringBuffSafetyMargin()
		BuffRemains(TIGERS_FURY) > RakeEnergySafetyMargin()
	}
}
AddFunction TigersFuryExpiresRakeMultiplier
{
	if BuffPresent(TIGERS_FURY)
	{
		if TigersFuryRakeUsableBeforeExpire() 1
		TigersFuryMultiplier()
	}
		1
}
AddFunction DancingSteelRakeUsableBeforeExpire
{
	if BuffRemains(DANCING_STEEL any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(DANCING_STEEL any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(DANCING_STEEL any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction DancingSteelExpiresRakeAttackPower
{
	if BuffPresent(DANCING_STEEL any=1)
	{
		if DancingSteelRakeUsableBeforeExpire() 0
		DancingSteelAttackPowerIncrease()
	}
		0
}
AddFunction SoulCharmRakeUsableBeforeExpire
{
	if BuffRemains(SOUL_CHARM any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(SOUL_CHARM any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(SOUL_CHARM any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction SoulCharmExpiresRakeAttackPower
{
	if BuffPresent(SOUL_CHARM any=1)
	{
		if SoulCharmRakeUsableBeforeExpire() 0
		SoulCharmAttackPowerIncrease()
	}
		0
}
AddFunction BadJujuRakeUsableBeforeExpire
{
	if BuffRemains(BAD_JUJU any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(BAD_JUJU any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(BAD_JUJU any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction BadJujuExpiresRakeAttackPower
{
	if BuffPresent(BAD_JUJU any=1)
	{
		if BadJujuRakeUsableBeforeExpire() 0
		BadJujuAttackPowerIncrease()
	}
		0
}
AddFunction ViciousTalismanRakeUsableBeforeExpire
{
	if BuffRemains(VICIOUS_TALISMAN any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(VICIOUS_TALISMAN any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(VICIOUS_TALISMAN any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction ViciousTalismanExpiresRakeAttackPower
{
	if BuffPresent(VICIOUS_TALISMAN any=1)
	{
		if ViciousTalismanRakeUsableBeforeExpire() 0
		ViciousTalismanAttackPowerIncrease()
	}
		0
}
AddFunction AssuranceOfConsequenceRakeUsableBeforeExpire
{
	if BuffRemains(ASSURANCE_OF_CONSEQUENCE any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(ASSURANCE_OF_CONSEQUENCE any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(ASSURANCE_OF_CONSEQUENCE any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction AssuranceOfConsequenceExpiresRakeAttackPower
{
	if BuffPresent(ASSURANCE_OF_CONSEQUENCE any=1)
	{
		if AssuranceOfConsequenceRakeUsableBeforeExpire() 0
		AssuranceOfConsequenceAttackPowerIncrease()
	}
		0
}
AddFunction HarommsTalismanRakeUsableBeforeExpire
{
	if BuffRemains(HAROMMS_TALISMAN any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(HAROMMS_TALISMAN any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(HAROMMS_TALISMAN any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction HarommsTalismanExpiresRakeAttackPower
{
	if BuffPresent(HAROMMS_TALISMAN any=1)
	{
		if HarommsTalismanRakeUsableBeforeExpire() 0
		HarommsTalismanAttackPowerIncrease()
	}
		0
}
AddFunction SigilOfRampageRakeUsableBeforeExpire
{
	if BuffRemains(SIGIL_OF_RAMPAGE any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(SIGIL_OF_RAMPAGE any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(SIGIL_OF_RAMPAGE any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction SigilOfRampageExpiresRakeAttackPower
{
	if BuffPresent(SIGIL_OF_RAMPAGE any=1)
	{
		if SigilOfRampageRakeUsableBeforeExpire() 0
		SigilOfRampageAttackPowerIncrease()
	}
		0
}
AddFunction TickingEbonDetonatorRakeUsableBeforeExpire
{
	if BuffRemains(TICKING_EBON_DETONATOR any=1) > RakeCooldownSafetyMargin()
	{
		if HasEnergyForRake()
			BuffRemains(TICKING_EBON_DETONATOR any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(TICKING_EBON_DETONATOR any=1) > RakeEnergySafetyMargin()
	}
}
AddFunction TickingEbonDetonatorExpiresRakeAttackPower
{
	if BuffPresent(TICKING_EBON_DETONATOR any=1)
	{
		if TickingEbonDetonatorRakeUsableBeforeExpire() TickingEbonDetonatorAttackPower()
		TickingEbonDetonatorAttackPowerIncrease()
	}
		0
}

################
# Rip Buff related functions; Checks to ensure you can use a Rip before a buff expires
################
AddFunction RipCooldownSafetyMargin { SpellCooldown(RIP)+ExpiringBuffSafetyMargin() }
AddFunction RipEnergySafetyMargin { TimeTilEnergyForRip()+ExpiringBuffSafetyMargin() }
AddFunction RuneRipUsableBeforeExpire
{
	if BuffRemains(ROR_MASTERY) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(ROR_MASTERY) > ExpiringBuffSafetyMargin()
		BuffRemains(ROR_MASTERY) > RipEnergySafetyMargin()
	}
}
AddFunction RuneExpiresRipMultiplier
{
	if BuffPresent(ROR_MASTERY)
	{
		if RuneRipUsableBeforeExpire() 1
		RuneMultiplier()
	}
		1
}
AddFunction TigersFuryRipUsableBeforeExpire 
{
	if BuffRemains(TIGERS_FURY) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(TIGERS_FURY) > ExpiringBuffSafetyMargin()
		BuffPresent(TIGERS_FURY) and BuffRemains(TIGERS_FURY) > RipEnergySafetyMargin()
	}
}
AddFunction TigersFuryExpiresRipMultiplier
{
	if BuffPresent(TIGERS_FURY)
	{
		if TigersFuryRipUsableBeforeExpire() 1
		TigersFuryMultiplier()
	}
		1
}
AddFunction DancingSteelRipUsableBeforeExpire
{
	if BuffRemains(DANCING_STEEL any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(DANCING_STEEL any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(DANCING_STEEL any=1) > RipEnergySafetyMargin()
	}
}
AddFunction DancingSteelExpiresRipAttackPower
{
	if BuffPresent(DANCING_STEEL any=1)
	{
		if DancingSteelRipUsableBeforeExpire() 0
		DancingSteelAttackPowerIncrease()
	}
		0
}
AddFunction SoulCharmRipUsableBeforeExpire
{
	if BuffRemains(SOUL_CHARM any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(SOUL_CHARM any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(SOUL_CHARM any=1) > RipEnergySafetyMargin()
	}
}
AddFunction SoulCharmExpiresRipAttackPower
{
	if BuffPresent(SOUL_CHARM any=1)
	{
		if SoulCharmRipUsableBeforeExpire() 0
		SoulCharmAttackPowerIncrease()
	}
		0
}
AddFunction BadJujuRipUsableBeforeExpire
{
	if BuffRemains(BAD_JUJU any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(BAD_JUJU any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(BAD_JUJU any=1) > RipEnergySafetyMargin()
	}
}
AddFunction BadJujuExpiresRipAttackPower
{
	if BuffPresent(BAD_JUJU any=1)
	{
		if BadJujuRipUsableBeforeExpire() 0
		BadJujuAttackPowerIncrease()
	}
		0
}
AddFunction ViciousTalismanRipUsableBeforeExpire
{
	if BuffRemains(VICIOUS_TALISMAN any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(VICIOUS_TALISMAN any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(VICIOUS_TALISMAN any=1) > RipEnergySafetyMargin()
	}
}
AddFunction ViciousTalismanExpiresRipAttackPower
{
	if BuffPresent(VICIOUS_TALISMAN any=1)
	{
		if ViciousTalismanRipUsableBeforeExpire() 0
		ViciousTalismanAttackPowerIncrease()
	}
		0

}
AddFunction AssuranceOfConsequenceRipUsableBeforeExpire
{
	if BuffRemains(ASSURANCE_OF_CONSEQUENCE any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(ASSURANCE_OF_CONSEQUENCE any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(ASSURANCE_OF_CONSEQUENCE any=1) > RipEnergySafetyMargin()
	}
}
AddFunction AssuranceOfConsequenceExpiresRipAttackPower
{
	if BuffPresent(ASSURANCE_OF_CONSEQUENCE any=1)
	{
		if AssuranceOfConsequenceRipUsableBeforeExpire() 0
		AssuranceOfConsequenceAttackPowerIncrease()
	}
		0
}
AddFunction HarommsTalismanRipUsableBeforeExpire
{
	if BuffRemains(HAROMMS_TALISMAN any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(HAROMMS_TALISMAN any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(HAROMMS_TALISMAN any=1) > RipEnergySafetyMargin()
	}
}
AddFunction HarommsTalismanExpiresRipAttackPower
{
	if BuffPresent(HAROMMS_TALISMAN any=1)
	{
		if HarommsTalismanRipUsableBeforeExpire() 0
		HarommsTalismanAttackPowerIncrease()
	}
		0
}
AddFunction SigilOfRampageRipUsableBeforeExpire
{
	if BuffRemains(SIGIL_OF_RAMPAGE any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(SIGIL_OF_RAMPAGE any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(SIGIL_OF_RAMPAGE any=1) > RipEnergySafetyMargin()
	}
}
AddFunction SigilOfRampageExpiresRipAttackPower
{
	if BuffPresent(SIGIL_OF_RAMPAGE any=1)
	{
		if SigilOfRampageRipUsableBeforeExpire() 0
		SigilOfRampageAttackPowerIncrease()
	}
		0
}
AddFunction TickingEbonDetonatorRipUsableBeforeExpire
{
	if BuffRemains(TICKING_EBON_DETONATOR any=1) > RipCooldownSafetyMargin()
	{
		if HasEnergyForRip()
			BuffRemains(TICKING_EBON_DETONATOR any=1) > ExpiringBuffSafetyMargin()
		BuffRemains(TICKING_EBON_DETONATOR any=1) > RipEnergySafetyMargin()
	}
}
AddFunction TickingEbonDetonatorExpiresRipAttackPower
{
	if BuffPresent(TICKING_EBON_DETONATOR any=1)
	{
		if TickingEbonDetonatorRipUsableBeforeExpire() TickingEbonDetonatorAttackPower()
		TickingEbonDetonatorAttackPowerIncrease()
	}
		0
}

################
# Rake Damage functions
################
AddFunction RakeTickDamage # Switched to raw numbers in place of Damage(RAKE) for 5.3.4+ compatibility
{
	{RakeBaseDamage() + AttackPower()*RakeDamagePerAttackPower()} * DamageMultiplier(RAKE) * {1+{MeleeCritChance()-LevelBasedCritSuppression()}/100} * {1+Mastery()/100}
}
AddFunction LastRakeTickDamage
{
	{RakeBaseDamage() + target.DebuffAttackPower(RAKE)*RakeDamagePerAttackPower()} * target.DebuffDamageMultiplier(RAKE) * {1+{target.DebuffMeleeCritChance(RAKE)-LevelBasedCritSuppression()}/100} * {1+target.DebuffMastery(RAKE)/100}
}
AddFunction TotalRakeMultiplier
{
	RuneExpiresRakeMultiplier()*TigersFuryExpiresRakeMultiplier()
}
AddFunction TotalRakeAttackPower
{
	DancingSteelExpiresRakeAttackPower() +
	SoulCharmExpiresRakeAttackPower() +
	BadJujuExpiresRakeAttackPower() +
	ViciousTalismanExpiresRakeAttackPower() +
	AssuranceOfConsequenceExpiresRakeAttackPower() +
	HarommsTalismanExpiresRakeAttackPower() +
	SigilOfRampageExpiresRakeAttackPower() +
	TickingEbonDetonatorExpiresRakeAttackPower()
}
AddFunction FutureRakeTickDamage
{
	{RakeBaseDamage() + {AttackPower() - TotalRakeAttackPower()} * RakeDamagePerAttackPower()} 
	* DamageMultiplier(RAKE) / TotalRakeMultiplier()
	* {1 + {MeleeCritChance()-LevelBasedCritSuppression() - TotalRakeAttackPower()*AttackPowerToCrit()} / 100} 
	* {1 + Mastery() / 100} 
}
AddFunction RakeRatio
{
	if TargetDebuffPresent(RAKE) 100 * FutureRakeTickDamage()/LastRakeTickDamage()
	100.0
}

################
# Rip Damage functions
################
AddFunction RipTickDamage
{
	{RipBaseDamage() + {{RipDamagePerComboPoint() + {RipDamagePerComboPointAttackPower() * AttackPower()}} * ComboPoints()}} * DamageMultiplier(RIP) * {1+{MeleeCritChance()-LevelBasedCritSuppression()}/100} * {1 + Mastery()/100}
}
AddFunction LastRipTickDamage
{
	{RipBaseDamage() + {{RipDamagePerComboPoint() + {RipDamagePerComboPointAttackPower() * LastAttackPower(RIP)}} * LastComboPoints(RIP)}} * LastDamageMultiplier(RIP) * {1+{LastMeleeCritChance(RIP)-LevelBasedCritSuppression()}/100} * {1 + LastMastery(RIP)/100}
}
AddFunction TotalRipMultiplier
{
	RuneExpiresRipMultiplier()*TigersFuryExpiresRipMultiplier()
}
AddFunction TotalRipAttackPower
{
	DancingSteelExpiresRipAttackPower() + 
	SoulCharmExpiresRipAttackPower() + 
	BadJujuExpiresRipAttackPower() + 
	ViciousTalismanExpiresRipAttackPower() +
	AssuranceOfConsequenceExpiresRipAttackPower() +
	HarommsTalismanExpiresRipAttackPower() +
	SigilOfRampageExpiresRipAttackPower() +
	TickingEbonDetonatorExpiresRipAttackPower()
}
AddFunction FutureRipTickDamage
{
	{RipBaseDamage() + {{RipDamagePerComboPoint() + {RipDamagePerComboPointAttackPower() * {AttackPower() - TotalRipAttackPower()}}} * ComboPoints()}}
	* DamageMultiplier(RIP) / TotalRipMultiplier()
	* {1 + {MeleeCritChance()-LevelBasedCritSuppression() - TotalRipAttackPower()*AttackPowerToCrit() }/100} 
	* {1 + Mastery()/100}
}
AddFunction RipDamageTillDead
{
	# The damage from Rip that is cast under the current conditions and lasting till target is dead.
	# Multiply the damage per tick with the number of ticks that can fit into the time to die.
	FutureRipTickDamage() * {target.TimeToDie() / 2}
}
AddFunction ExistingRipDamageTillDead
{
	# The damage from Rip that is already on the target and lasting till target is dead.
	if target.DebuffPresent(RIP)
	{
		# Multiply the damage per tick with the number of ticks that can fit into the time to die.
		LastRipTickDamage() * {target.TimeToDie() / 2}
	}
		0
}
AddFunction RipRatio
{
	if TargetDebuffPresent(RIP) 100 * FutureRipTickDamage()/LastRipTickDamage()
	100.0
}

################
# Ability damage functions
################
AddFunction FerociousBiteDamage # Switched to raw numbers in place of Damage(FEROCIOUS_BITE) for 5.3.4+ compatibility
{
	{FerociousBiteBaseDamage() + {FerociousBiteDamagePerComboPoint() + FerociousBiteDamagePerComboPointAttackPower() * AttackPower()} * ComboPoints()} * DamageMultiplier(FEROCIOUS_BITE)  * {1+{FerociousBiteCritChance()-LevelBasedCritSuppression()}/100} * 2 * ArmorReduction()
}
AddFunction MangleCatDamage
{
	{{MangleCatBaseDamage() + WeaponDamage(MH)} * MangleCatWeaponDamageMultiplier()} * DamageMultiplier(MANGLE_CAT) * {1+{MeleeCritChance()-LevelBasedCritSuppression()}/100} * ArmorReduction()
}
AddFunction ShredDamage
{
	MangleCatDamage()*1.2
}
AddFunction ThrashCatHitDamage
{
	{ThrashHitBaseDamage() + AttackPower()*ThrashHitDamagePerAttackPower()} * DamageMultiplier(THRASH_CAT) * {1+MeleeCritChance()-LevelBasedCritSuppression()/100} * {1+Mastery()/100}
}
AddFunction SwipeCatDamage
{
	{WeaponDamage(MH) * MangleCatWeaponDamageMultiplier()} * DamageMultiplier(MANGLE_CAT) * {1+MeleeCritChance()-LevelBasedCritSuppression()/100} * ArmorReduction()
}
AddFunction RavageDamage
{
	{{RavageBaseDamage() + WeaponDamage(MH)} * RavageWeaponDamageMultiplier()} * DamageMultiplier(RAVAGE) * {1+{RavageCritChance()-LevelBasedCritSuppression()}/100} * ArmorReduction()
}

################
# Misc functions
################
AddFunction FaerieFire
{
	if TalentPoints(FAERIE_SWARM_TALENT) Spell(FAERIE_SWARM)
	unless TalentPoints(FAERIE_SWARM_TALENT) Spell(FAERIE_FERAL)
}
AddFunction SavageRoar
{
	if Glyph(GLYPH_OF_SAVAGERY) Spell(SAVAGE_ROAR_GLYPHED)
	if Glyph(GLYPH_OF_SAVAGERY no) and HasAnyComboPoints() Spell(SAVAGE_ROAR_OLD)
}
AddFunction UsePotion
{
	#virmens_bite_potion
	Item(virmens_bite_potion)
}
AddFunction TreantTimeThreshold
{
	1+{Charges(FORCE_OF_NATURE)-1}*0.33
}

#############################
## Feral rotation functions (Mastery=2) ##
#############################

AddFunction NotInCombat
{
	unless InCombat() {
		if BuffExpires(str_agi_int 400 any=1) Spell(MARK_OF_THE_WILD)
		if BuffExpires(DREAM_OF_CENARIUS) and TalentPoints(DREAM_OF_CENARIUS_TALENT) Spell(HEALING_TOUCH)
		unless Stance(3) Spell(CAT_FORM)
		if Glyph(GLYPH_OF_SAVAGERY) and NoComboPoints() {
			if BuffRemains(SAVAGE_ROAR_GLYPHED) <12 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-11.5
			or BuffRemains(SAVAGE_ROAR_GLYPHED) <9 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-8.5
			or BuffRemains(SAVAGE_ROAR_GLYPHED) <6 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-5.5
			or BuffRemains(SAVAGE_ROAR_GLYPHED) <3 and TimeToMaxEnergy() < BuffRemains(SAVAGE_ROAR_GLYPHED)-2.5
			or BuffExpires(SAVAGE_ROAR_GLYPHED)
			{
				SavageRoar()
			}
		}
		if TalentPoints(FORCE_OF_NATURE_TALENT) Spell(FORCE_OF_NATURE)
	}
}

AddFunction SpareGcdCooldowns {
	# Spirit Wolves goes here when symbiosis is supported appropriately.
}

AddFunction SavageRoarOrWeakenedArmorMissing
{
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(SAVAGE_ROAR) SavageRoar()
	
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(WEAKENED_ARMOR any=1) <3 and CheckBoxOn(lucioles) FaerieFire()
}

AddFunction RangeCheck
{
	#range check
	unless target.InRange(MANGLE_CAT) Texture(ability_druid_catformattack)
}

AddFunction DpsCooldownLogic
{
	#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
	#use_item,slot=hands,if=buff.tigers_fury.up
	#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
	#berserk,if=buff.tigers_fury.up|(target.time_to_die<15&cooldown.tigers_fury.remains>6)
	if {{Energy() <=35 and BuffExpires(CLEARCASTING)} or BuffPresent(INCARNATION_CAT)} and Spell(TIGERS_FURY)
	{
		if CheckBoxOn(berserk) and Spell(BERSERK_CAT)
		{
		    if not TalentPoints(INCARNATION_TALENT) or BuffPresent(INCARNATION_CAT) Spell(BERSERK_CAT)
			if TalentPoints(INCARNATION_TALENT) wait Spell(INCARNATION) #wait is necessary otherwise it suggests TF for about a half second before suggesting Incarnation
		}
		unless BuffPresent(BERSERK_CAT) Spell(TIGERS_FURY)
	}
	if CheckBoxOn(berserk) 
	{
		if TalentPoints(INCARNATION_TALENT) and BuffPresent(BERSERK_CAT) Spell(INCARNATION_CAT)
		if TalentPoints(NATURES_VIGIL_TALENT) and {BuffPresent(BERSERK_CAT) or {SpellCooldown(BERSERK_CAT) >88}} Spell(NATURES_VIGIL)
	}

}

AddFunction ExecuteRangeRipFerociousBiteLogic
{
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if target.HealthPercent() <=25 and HasAnyComboPoints()
		and target.DebuffPresent(RIP) and target.DebuffRemains(RIP) <=4 # is 4 instead of 3 because the remaining time on rip can be inaccurate upto 2 seconds
	{
		Spell(FEROCIOUS_BITE)
	}
	
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=9 and BuffPresent(CLEARCASTING)
		and target.DebuffRemains(THRASH_CAT) <3
	{
		Spell(THRASH_CAT)
	}
	
	#ferocious_bite,if=target.time_to_die<=1&combo_points>=3
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(FEROCIOUS_BITE)
	
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
	if BuffRemains(SAVAGE_ROAR) <=3 and HasAnyComboPoints() and target.HealthPercent() <=25
	{
		SavageRoar()
	}
	
	if MaxComboPoints()
	{
		if CheckBoxOn(potions) and target.Classification(worldboss) and ItemCount(VIRMENS_BITE_ITEM) >0
		{
			if TimeToHealthPercent(25) <=15
			{
				#virmens_bite_potion,if=combo_points>=5&$(time_til_bitw)<15&$(rip_ratio)>=1.15&buff.dream_of_cenarius_damage.up
				if not HasTrinket(ROR_ITEM) and MaxComboPoints() and {BuffPresent(DREAM_OF_CENARIUS) or not TalentPoints(DREAM_OF_CENARIUS_TALENT)} and RipRatio() >=115 Item(VIRMENS_BITE_ITEM)
					
				#virmens_bite_potion,if=combo_points>=5&$(time_til_bitw)<15&buff.rune_of_reorigination.up&buff.dream_of_cenarius_damage.up
				if HasTrinket(ROR_ITEM) and MaxComboPoints() and {BuffPresent(DREAM_OF_CENARIUS) or not TalentPoints(DREAM_OF_CENARIUS_TALENT)} and BuffPresent(ROR_MASTERY) Item(VIRMENS_BITE_ITEM)
			}	
			#virmens_bite_potion,if=target.time_to_die<=40
			if target.TimeToDie() <=40 Item(VIRMENS_BITE_ITEM)
		}
			
		#rip,if=combo_points>=5&(tick_damage*(1+crit_pct_current)-tick_dmg*(1+crit_pct))*target.time_to_die%2>=action.ferocious_bite.hit_damage*(1+action.ferocious_bite.crit_pct_current)*2&target.health.pct<=25
		if RipDamageTillDead() > {ExistingRipDamageTillDead() + FerociousBiteDamage()} and {target.HealthPercent() <=25 or target.TimeToDie() <=16}
		{
			Spell(RIP)
		}
			
		#pool_resource,wait=0.25,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))
		#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
		if target.DebuffPresent(RIP) and target.HealthPercent() <=25
		{
			if not HasEnergyForFerociousBite() SpareGcdCooldowns()
			wait if HasEnergyForFerociousBite() Spell(FEROCIOUS_BITE)
		}
	}
}

AddFunction RipLogic
{
	if target.HealthPercent() >25 and target.TimeToDie() >16
	{
		#rip,if=combo_points>=5&$(rip_ratio)>=1.15
		if MaxComboPoints() and RipRatio() >= 115
		{
			Spell(RIP)
		}
	  
		#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2
		if {HasEnergyForRip() and {MaxComboPoints() and target.DebuffRemains(RIP) <2}}
			or {not HasEnergyForRip() and {MaxComboPoints() and target.DebuffRemains(RIP) <2+TimeTilEnergyForRip()}}
		{
			Spell(RIP)
		}
	  
		#rip,if=combo_points>=5&action.rip.tick_damage%dot.rip.tick_dmg>=1.15
		if BuffPresent(ROR_MASTERY) and RipRatio() >= 95
			and {{HasEnergyForRip() and BuffRemains(ROR_MASTERY) <=1.5 and ExpiringBuffSafetyMargin() < BuffRemains(ROR_MASTERY) and ComboPoints() >=4}
			or {not HasEnergyForRip() and BuffRemains(ROR_MASTERY) <=1.5 + TimeTilEnergyForRip() and RipEnergySafetyMargin() < BuffRemains(ROR_MASTERY) and ComboPoints() >=4 and BuffExpires(CLEARCASTING)}}
		{
			Spell(RIP)
		}
   }
}

AddFunction SavageRoarRefreshLogic
{
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
	if BuffRemains(SAVAGE_ROAR) <=3 and HasAnyComboPoints() and BuffRemains(SAVAGE_ROAR) +2 > target.DebuffRemains(RIP)
	{
		SavageRoar()
	}
   
	#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains&dot.rip.ticking
	if BuffRemains(SAVAGE_ROAR) <=6 and MaxComboPoints() and BuffRemains(SAVAGE_ROAR) +2 <= target.DebuffRemains(RIP) and target.DebuffPresent(RIP)
	{
		SavageRoar()
	}
   
	#savage_roar,if=buff.savage_roar.remains<=12&combo_points>=5&energy.time_to_max<=1.25&buff.savage_roar.remains<=dot.rip.remains+6&dot.rip.ticking
	if BuffRemains(SAVAGE_ROAR) <=12 and MaxComboPoints() and TimeToMaxEnergy()<=1.25 and BuffRemains(SAVAGE_ROAR)  <= target.DebuffRemains(RIP) +6
	{
		SavageRoar()
	}
}

AddFunction RakeLogic
{
	if target.TimeToDie() - target.DebuffRemains(RAKE) >3
	{
		#rake,if=target.time_to_die-dot.rake.remains>3&buff.rune_of_reorigination.up&dot.rake.remains<9&(buff.rune_of_reorigination.remains<=1.5)
		if BuffPresent(ROR_MASTERY) and RakeRatio() > 75
			and {{HasEnergyForRake() and target.DebuffRemains(RAKE) <9 and BuffRemains(ROR_MASTERY) <=1.5 
			and ExpiringBuffSafetyMargin() < BuffRemains(ROR_MASTERY)}
			or {not HasEnergyForRake() and target.DebuffRemains(RAKE) <9 + TimeTilEnergyForRake() and BuffExpires(CLEARCASTING) and BuffRemains(ROR_MASTERY) <=1.5 + TimeTilEnergyForRake()
			and RakeEnergySafetyMargin() < BuffRemains(ROR_MASTERY)}}
		{
			Spell(RAKE)
		}
			
		#rake,if=target.time_to_die-dot.rake.remains>3&(action.rake.tick_damage>dot.rake.tick_dmg*1.12|(dot.rake.remains<3&action.rake.tick_damage%dot.rake.tick_dmg>=0.75))
		if RakeRatio() > 75 and {{HasEnergyForRake() and target.DebuffRemains(RAKE) < 3}
			or {not HasEnergyForRake() and target.DebuffRemains(RAKE) < 3 + TimeTilEnergyForRake() and BuffExpires(CLEARCASTING)}}
			or RakeRatio() > 112
		{
			Spell(RAKE)
		}
		
		#rake if its about to fall off.  Simcraft doesn't require this line but ovale does for the prediction box.
		if {HasEnergyForRake() and target.DebuffRemains(RAKE) < 0.001}
			or {not HasEnergyForRake() and target.DebuffRemains(RAKE) < 0.001 + TimeTilEnergyForRake() and BuffExpires(CLEARCASTING)}
		{
			Spell(RAKE)
		}
	}
}

AddFunction ThrashLogic
{
	#pool_resource,wait=0.25,for_next=1
	#thrash_cat,if=target.time_to_die>=6&dot.thrash_cat.remains<3&(dot.rip.remains>=8&buff.savage_roar.remains>=12|buff.berserk.up|combo_points>=5)&dot.rip.ticking
	if {HasEnergyForThrash() 
		and target.DebuffRemains(THRASH_CAT) < 3
		and target.TimeToDie() >=9
		and {{target.DebuffRemains(RIP) >=8 and BuffRemains(SAVAGE_ROAR) >=12}
			or BuffPresent(BERSERK_CAT) or MaxComboPoints()}}
	or {not HasEnergyForThrash()
		and target.DebuffRemains(THRASH_CAT) < 3 + TimeTilEnergyForThrash() and BuffExpires(CLEARCASTING)
		and target.TimeToDie() - TimeTilEnergyForThrash() >=9
		and {{target.DebuffRemains(RIP) - TimeTilEnergyForThrash() >=8 and BuffRemains(SAVAGE_ROAR) - TimeTilEnergyForThrash() >=12}
			or BuffPresent(BERSERK_CAT) or MaxComboPoints()}}
	{
		if TimeTilEnergyForThrash() >=1.5 SpareGcdCooldowns()
		Spell(THRASH_CAT)
	}
	
	#pool_resource,for_next=1
	#thrash_cat,if=target.time_to_die>=6&dot.thrash_cat.remains<9&buff.rune_of_reorigination.up&buff.rune_of_reorigination.remains<=1.5&dot.rip.ticking
	if BuffPresent(ROR_MASTERY) and target.DebuffPresent(RIP) 
		and {{{HasEnergyForThrash() or BuffPresent(CLEARCASTING)} and ExpiringBuffSafetyMargin() < BuffRemains(ROR_MASTERY)
			and target.DebuffRemains(THRASH_CAT) < 9 and BuffRemains(ROR_MASTERY) <=1.5
			and target.TimeToDie() >=9}
		or {not HasEnergyForThrash() and ThrashEnergySafetyMargin() < BuffRemains(ROR_MASTERY)
			and target.DebuffRemains(THRASH_CAT) < 9 + TimeTilEnergyForThrash() and BuffRemains(ROR_MASTERY) <=1.5 + TimeTilEnergyForThrash() and TimeTilEnergyForThrash() <= BuffRemains(ROR_MASTERY) + ExpiringBuffSafetyMargin()
			and target.TimeToDie() - TimeTilEnergyForThrash() >=9}}
	{
		if TimeTilEnergyForThrash() >=1.5 SpareGcdCooldowns()
		Spell(THRASH_CAT)
	}
}

AddFunction NonExcuteRangeFerociousBiteLogic
{
	#pool_resource,if=combo_points>=5&!(energy.time_to_max<=1.25|(buff.feral_rage.up&buff.feral_rage.remains<1)|(energy>=50&cooldown.tigers_fury.remains<=1.5)|(buff.berserk.up&energy>=25))&dot.rip.ticking
	#ferocious_bite,if=combo_points>=5&dot.rip.ticking
	if MaxComboPoints() and {target.DebuffPresent(RIP) or target.TimeToDie() <=16} and BuffPresent(SAVAGE_ROAR)
	{
		if not {TimeToMaxEnergy()<=1.25 or {target.DebuffExpires(RIP) and HasEnergyForFerociousBite()} or {BuffPresent(BERSERK_CAT) and HasEnergyForFerociousBite()} or {TigersFuryCooldown() <=1.5 and HasEnergyForFerociousBite()} or {BuffPresent(FERAL_RAGE) and BuffRemains(FERAL_RAGE) <=1.25}} SpareGcdCooldowns()
		wait if {TimeToMaxEnergy()<=1.25 or {target.DebuffExpires(RIP) and HasEnergyForFerociousBite()} or {BuffPresent(BERSERK_CAT) and HasEnergyForFerociousBite()} or {TigersFuryCooldown() <=1.5 and HasEnergyForFerociousBite()} or {BuffPresent(FERAL_RAGE) and BuffRemains(FERAL_RAGE) <=1.25}} Spell(FEROCIOUS_BITE)
	}
}

AddFunction FillerActions
{
	#rake,if=target.time_to_die-dot.rake.remains>3&action.rake.tick_damage*(dot.rake.ticks_remain+1)-dot.rake.tick_dmg*dot.rake.ticks_remain>action.mangle_cat.hit_damage
	if target.TimeToDie() - target.DebuffRemains(RAKE) >=3 and FutureRakeTickDamage() * {target.TicksRemain(RAKE)+1} - LastRakeTickDamage() * target.TicksRemain(RAKE) >= MangleCatDamage()
	{
		Spell(RAKE)
	}
	#rake,if=target.time_to_die-dot.rake.remains<=3&action.rake.tick_damage*(target.time_to_die%3+1)-dot.rake.tick_dmg*target.time_to_die%3>action.mangle_cat.hit_damage
	if target.TimeToDie() - target.DebuffRemains(RAKE) <3 and FutureRakeTickDamage() * {target.TimeToDie()/3+1} - LastRakeTickDamage() * target.TimeToDie()/3 >= MangleCatDamage()
	{
		Spell(RAKE)
	}
	#ravage
	if BuffPresent(INCARNATION_CAT) Spell(RAVAGE)

	#actions.filler+=/shred,if=(buff.omen_of_clarity.react|buff.berserk.up|energy.regen>=15)&buff.king_of_the_jungle.down
	if BuffPresent(CLEARCASTING) Spell(SHRED)
	if BuffPresent(BERSERK_CAT) or EnergyRegen() >=15
	and {not CheckBoxOn(infront)
		or {Glyph(GLYPH_OF_SHRED) and {BuffPresent(TIGERS_FURY) or BuffPresent(BERSERK_CAT)}}}
		Spell(SHRED)

	#actions.filler+=/mangle_cat,if=buff.king_of_the_jungle.down
	Spell(MANGLE_CAT)
}

AddFunction AoeFillerActions
{
		if ThrashCatHitDamage() > SwipeCatDamage() * 50 / 45
			and {{{HasEnergyForThrash() or BuffPresent(CLEARCASTING)} and ExpiringBuffSafetyMargin() < BuffRemains(ROR_MASTERY)}
			or {not HasEnergyForThrash() and ThrashEnergySafetyMargin() < BuffRemains(ROR_MASTERY)}}
		{
			Spell(THRASH_CAT)
		}
		Spell(SWIPE_CAT)
}


# Feral rotation

AddFunction MainActions
{
	#healing_touch,if=talent.dream_of_cenarius.enabled&buff.predatory_swiftness.up&buff.dream_of_cenarius.down&(buff.predatory_swiftness.remains<1.5|combo_points>=4)
	if TalentPoints(DREAM_OF_CENARIUS_TALENT) and BuffPresent(PREDATORY_SWIFTNESS) and BuffExpires(DREAM_OF_CENARIUS_DAMAGE) and 
		{BuffRemains(PREDATORY_SWIFTNESS) <=1.5 or ComboPoints() >=4} 
	{   
		Spell(HEALING_TOUCH)
	}
   
	SavageRoarOrWeakenedArmorMissing()
	
	RangeCheck()
	
	DpsCooldownLogic()
	
	#Also includes Clearcasting Thrash and end of fight Ferocious Bite
	ExecuteRangeRipFerociousBiteLogic()
	
	RipLogic()
	
	SavageRoarRefreshLogic()
	
	RakeLogic()

	ThrashLogic()
	
	NonExcuteRangeFerociousBiteLogic()
}

AddFunction FillerConditions
{
	#run_action_list,name=filler,if=buff.omen_of_clarity.react
	if BuffPresent(CLEARCASTING) FillerActions()
	#run_action_list,name=filler,if=buff.feral_fury.react
	if BuffPresent(FERAL_FURY) and BuffRemains(FERAL_FURY) > TimeTilEnergyForMangle() FillerActions()
	#run_action_list,name=filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
	if {not MaxComboPoints() and target.DebuffRemains(RIP) <3} or {NoComboPoints() and BuffRemains(SAVAGE_ROAR) <2} FillerActions()
	#run_action_list,name=filler,if=target.time_to_die<=8.5
	if target.TimeToDie() <=8.5 FillerActions()
	#run_action_list,name=filler,if=(talent.dream_of_cenarius.enabled&buff.tigers_fury.up)|buff.berserk.up
	if {TalentPoints(DREAM_OF_CENARIUS_TALENT) and BuffPresent(TIGERS_FURY)} or BuffPresent(BERSERK_CAT) FillerActions()
	#run_action_list,name=filler,if=cooldown.tigers_fury.remains<=3
	if TigersFuryCooldown() <=3 FillerActions()
	#run_action_list,name=filler,if=talent.dream_of_cenarius.enabled&combo_points<=3&buff.predatory_swiftness.remains<(5.5-combo_points)&buff.predatory_swiftness.up
	if TalentPoints(DREAM_OF_CENARIUS_TALENT) and BuffPresent(PREDATORY_SWIFTNESS) and BuffRemains(PREDATORY_SWIFTNESS) <= {5.5-ComboPoints()} and ComboPoints() <=3 FillerActions() 
	#run_action_list,name=filler,if=energy.time_to_max<=1
	if TimeToMaxEnergy()<=1.2 Spell(MANGLE_CAT)
	if TimeToMaxEnergy()<=1.25 FillerActions()
}

AddFunction AoeActions
{
	#healing_touch,if=talent.dream_of_cenarius.enabled&buff.predatory_swiftness.up&buff.dream_of_cenarius.down&(buff.predatory_swiftness.remains<1.5|combo_points>=4)
	if TalentPoints(DREAM_OF_CENARIUS_TALENT) and BuffPresent(PREDATORY_SWIFTNESS) and BuffExpires(DREAM_OF_CENARIUS_DAMAGE) and 
		{BuffRemains(PREDATORY_SWIFTNESS) <=1.5 or ComboPoints() >=4}
	{   
		Spell(HEALING_TOUCH)
	}

	SavageRoarOrWeakenedArmorMissing()
	
	RangeCheck()
	
	DpsCooldownLogic()
	
	ExecuteRangeRipFerociousBiteLogic()
	
	if TalentPoints(DREAM_OF_CENARIUS_TALENT) or TalentPoints(SOUL_OF_THE_FOREST_TALENT) or Enemies() <=6
	{
		RipLogic()
	}
	
	SavageRoarRefreshLogic()
	
	#pool_resource,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3
	if {HasEnergyForThrash() 
		and target.DebuffRemains(THRASH_CAT) < 3}
	or {not HasEnergyForThrash()
		and target.DebuffRemains(THRASH_CAT) < 3 + TimeTilEnergyForThrash()}
	{
		if TimeTilEnergyForThrash() >=1.5 SpareGcdCooldowns()
		Spell(THRASH_CAT)
	}
	

	
	if target.TimeToDie() - target.DebuffRemains(RAKE) >15
	{
		#rake,if=buff.rune_of_reorigination.up&active_enemies<=8&dot.rake.remains<3&target.time_to_die>=15&action.rake.tick_damage%dot.rake.tick_dmg>=0.75		
		if BuffPresent(ROR_MASTERY) and RakeEnergySafetyMargin() < BuffRemains(ROR_MASTERY) and RakeRatio() >75 and Enemies() <=8 
			and {{HasEnergyForRake() and target.DebuffRemains(RAKE) < 3}
			or {not HasEnergyForRake() and target.DebuffRemains(RAKE) < 3 + TimeTilEnergyForRake()}}
		{
			Spell(RAKE)
		}
		#rake,if=active_enemies<=4&dot.rake.remains<3&target.time_to_die>=15&action.rake.tick_damage%dot.rake.tick_dmg>=0.75
		if Enemies() <=4 and RakeRatio() >75 
			and {{HasEnergyForRake() and target.DebuffRemains(RAKE) < 3}
			or {not HasEnergyForRake() and target.DebuffRemains(RAKE) < 3 + TimeTilEnergyForRake()}}
		{
			Spell(RAKE)
		}
		#rake if its about to fall off.  Simcraft doesn't require this line but ovale does for the prediction box.
		if Enemies() <=4 
			and {HasEnergyForRake() and target.DebuffRemains(RAKE) < 0.001}
			or {not HasEnergyForRake() and target.DebuffRemains(RAKE) < 0.001 + TimeTilEnergyForRake() and BuffExpires(CLEARCASTING)}
		{
			Spell(RAKE)
		}
	}
	
	#ferocious_bite,if=combo_points>=5&dot.rip.ticking&talent.dream_of_cenarius.enabled&talent.soul_of_the_forest.enabled&buff.berserk.up
	if TalentPoints(DREAM_OF_CENARIUS_TALENT) and TalentPoints(SOUL_OF_THE_FOREST_TALENT) and BuffPresent(BERSERK_CAT)
	{
		Spell(FEROCIOUS_BITE)
	}
	
	#run_action_list,name=cleave_filler,if=buff.feral_fury.react
	if BuffPresent(FERAL_FURY) AoeFillerActions()
	#run_action_list,name=cleave_filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
	if {not MaxComboPoints() and target.DebuffRemains(RIP) <3} or {NoComboPoints() and BuffRemains(SAVAGE_ROAR) <2} AoeFillerActions()
	#run_action_list,name=cleave_filler,if=buff.omen_of_clarity.react
	if BuffPresent(CLEARCASTING) AoeFillerActions()
	#run_action_list,name=cleave_filler,if=buff.tigers_fury.up|buff.berserk.up
	if BuffPresent(TIGERS_FURY) or BuffPresent(BERSERK_CAT) AoeFillerActions()
	#run_action_list,name=cleave_filler,if=cooldown.tigers_fury.remains<=3
	if TigersFuryCooldown() <=3 AoeFillerActions()
	#run_action_list,name=cleave_filler,if=energy.time_to_max<=1
	if TimeToMaxEnergy() <=1.25 AoeFillerActions()
}

AddFunction Prediction
{
	if Stance(3) {
		MainActions()
	}
	if Stance(1) {
		if BuffPresent(HEART_OF_THE_WILD) Spell(FRENZIED_REGEN)
		unless BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
	}
	if Stance(0) {
		if BuffPresent(HEART_OF_THE_WILD) {
			if BuffExpires(HEART_OF_THE_WILD) Texture(spell_holy_blessingofagility)
		}
		unless BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
	}
	if Stance(4) or Stance(2) Spell(CAT_FORM)
}

#####################
## Feral icons (Mastery=2) ##
#####################

AddIcon help=Rake_Ratio size=small mastery=2 checkboxon=cooldownsRatio 
{
	RakeRatio()
}

AddIcon help=Rip_Ratio size=small mastery=2 checkboxon=cooldownsRatio 
{
	RipRatio()
}

#AddIcon help=Interrupts_and_Wild_Charge size=small mastery=2 checkboxon=cooldownsL {
#    if target.InRange(SKULL_BASH_CAT) Spell(SKULL_BASH_CAT)
#    unless target.Classification(worldboss)
#    {
#        if TalentPoints(MIGHTY_BASH_TALENT) and target.InRange(MIGHTY_BASH) Spell(MIGHTY_BASH)
#        if TalentPoints(TYPHOON_TALENT) and target.InRange(SKULL_BASH_CAT) Spell(TYPHOON)
#        if HasAnyComboPoints() and target.InRange(MAIM) Spell(MAIM)
#    }
#    Spell(WILD_CHARGE)
#}

AddIcon size=small mastery=2 checkboxon=cooldownsL {
	Spell(TIGERS_FURY)
}
AddIcon help=Berserk size=small mastery=2 checkboxon=cooldownsL { # Berserk Icon
	if BuffPresent(TIGERS_FURY) Spell(BERSERK_CAT)
	if 0s before Spell(BERSERK_CAT) Texture(Ability_mount_polarbear_white)
}


# Predictive rotation
AddIcon help=Predictive size=small mastery=2 checkboxon=altpredictive {
	Prediction()
}

AddIcon help=Talent_Cooldowns size=small mastery=2 checkboxon=altpredictive {
	if TalentPoints(FORCE_OF_NATURE_TALENT)
	{
		if Charges(FORCE_OF_NATURE) ==3 or {Charges(FORCE_OF_NATURE) ==2 and SpellChargeCooldown(FORCE_OF_NATURE) <=1} Spell(FORCE_OF_NATURE)
                if BuffPresent(TICKING_EBON_DETONATOR)
                   or {BuffPresent(SOUL_CHARM) and BuffRemains(SOUL_CHARM) <= TreantTimeThreshold()}
                   or {BuffPresent(ROR_MASTERY) and BuffRemains(ROR_MASTERY) <= TreantTimeThreshold()}
                   or {BuffPresent(BAD_JUJU) and BuffRemains(BAD_JUJU) <= TreantTimeThreshold()}
                   or {BuffPresent(VICIOUS_TALISMAN) and BuffRemains(VICIOUS_TALISMAN) <= TreantTimeThreshold()}
                   or {BuffPresent(ASSURANCE_OF_CONSEQUENCE) and BuffRemains(ASSURANCE_OF_CONSEQUENCE) <= TreantTimeThreshold()}
                   or {BuffPresent(HAROMMS_TALISMAN) and BuffRemains(HAROMMS_TALISMAN) <= TreantTimeThreshold()}
                   or {BuffPresent(SIGIL_OF_RAMPAGE)  and BuffRemains(SIGIL_OF_RAMPAGE) <= TreantTimeThreshold()}
                {
			Spell(FORCE_OF_NATURE)
		}
	}
	unless TalentPoints(FORCE_OF_NATURE_TALENT)
	{
		if TalentPoints(HEART_OF_THE_WILD_TALENT) Spell(HEART_OF_THE_WILD)
		if TalentPoints(DREAM_OF_CENARIUS_TALENT) 
		{
			if TalentPoints(CENARION_WARD_TALENT) Spell(CENARION_WARD)
			if TalentPoints(RENEWAL_TALENT) Spell(RENEWAL)
		}
		if TalentPoints(NATURES_VIGIL_TALENT) Spell(NATURES_VIGIL)
	}
}

# Main rotation
AddIcon help=main mastery=2 {
	NotInCombat()
	if Stance(3) 
		{
			MainActions()
			FillerConditions()
			SpareGcdCooldowns()
		}
	if Stance(1) 
	{
		if BuffPresent(HEART_OF_THE_WILD) 
			BearMain()
		unless BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
	}
	if Stance(0) 
	{
		if BuffPresent(HEART_OF_THE_WILD) 
		{
			if CastTime(WRATH) <BuffRemains(HEART_OF_THE_WILD) Spell(WRATH)
			Spell(CAT_FORM)
		}
		unless BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
	}
	if Stance(4) or Stance(2) Spell(CAT_FORM)
}

# Predictive rotation
AddIcon help=Predictive mastery=2 checkboxon=predictive {
	Prediction()
}

AddIcon help=aoe mastery=2 checkboxon=showaoe 
{
	NotInCombat()
	if Stance(3) 
		{
			AoeActions()
			SpareGcdCooldowns()
		}
	if Stance(1) 
	{
		if BuffPresent(HEART_OF_THE_WILD)
			BearMainAOE()
		unless BuffPresent(HEART_OF_THE_WILD) Spell(CAT_FORM)
	}
	if Stance(0) 
	{
		if BuffRemains(HEART_OF_THE_WILD) > GCD()
			Spell(HURRICANE)
		Spell(CAT_FORM)
	}
	if Stance(4) or Stance(2) Spell(CAT_FORM)
}

AddIcon help=Savage_Roar size=small mastery=2 checkboxon=cooldownsR { # Savage Roar
	if BuffExpires(SAVAGE_ROAR) Texture(ability_druid_skinteeth)
}
AddIcon help=Rip size=small mastery=2 checkboxon=cooldownsR { # Rip
	if TargetDebuffExpires(RIP) Texture(ability_ghoulfrenzy)
}
AddIcon help=Rake size=small mastery=2 checkboxon=cooldownsR { # Rake
	if TargetDebuffExpires(RAKE) Texture(ability_druid_disembowel)
}
AddIcon help=Thrash size=small mastery=2 checkboxon=cooldownsR { # Thrash
	if TargetDebuffExpires(THRASH_CAT) Texture(spell_druid_thrash)
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

AddIcon help=Rake size=small mastery=3 checkboxon=cooldownsRatio 
{
	# Offset the guardian icons if the user has bleed ratios enabled
}

AddIcon help=Rip size=small mastery=3 checkboxon=cooldownsRatio 
{
	# Offset the guardian icons if the user has bleed ratios enabled
}

AddIcon size=small mastery=3 checkboxon=cooldownsL {
	Spell(BARKSKIN)
}

AddIcon size=small mastery=3 checkboxon=cooldownsL {
	if TalentPoints(RENEWAL_TALENT) Spell(RENEWAL)
	if TalentPoints(CENARION_WARD_TALENT) Spell(CENARION_WARD)
}

AddIcon mastery=3 size=small checkboxon=altpredictive {
	if Rage(less 11) Spell(ENRAGE useable=1)
	Spell(SAVAGE_DEFENSE usable=1)
	Spell(FRENZIED_REGEN)
}

AddIcon mastery=3 size=small checkboxon=altpredictive {
	if BuffPresent(TOOTH_AND_CLAW) and target.DebuffExpires(TOOTH_AND_CLAW_DEBUFF) Spell(TOOTH_AND_CLAW)
	unless BuffPresent(TOOTH_AND_CLAW) and target.DebuffExpires(TOOTH_AND_CLAW_DEBUFF) Spell(MAUL)
}

# Main rotation
AddIcon help=main mastery=3 {
	if InCombat(no) and BuffRemains(str_agi_int any=1) <400 Spell(MARK_OF_THE_WILD)
	unless Stance(1) Spell(BEAR_FORM)
	
	BearMain()

}

AddIcon mastery=3 checkboxon=predictive {
	if Rage(less 11) Spell(ENRAGE useable=1)
	Spell(SAVAGE_DEFENSE usable=1)
	Spell(FRENZIED_REGEN)
}

AddIcon help=aoe mastery=3 checkboxon=showaoe {
	if InCombat(no) and BuffRemains(str_agi_int any=1) <400 Spell(MARK_OF_THE_WILD)
	unless Stance(1) Spell(BEAR_FORM)
	
	BearMainAOE()
}
AddIcon size=small mastery=3 checkboxon=cooldownsR {
	Spell(SURVIVAL_INSTINCTS)
}

AddIcon size=small mastery=3 checkboxon=cooldownsR {
	Spell(MIGHT_OF_URSOC)
}

AddIcon size=small mastery=3 checkboxon=cooldownsR {
	if TalentPoints(INCARNATION_TALENT) Spell(INCARNATION_BEAR)
	if TalentPoints(FORCE_OF_NATURE_TALENT) Spell(FORCE_OF_NATURE)
}

AddIcon size=small mastery=3 checkboxon=cooldownsR {
	Spell(BERSERK_BEAR)
}
]]
}
