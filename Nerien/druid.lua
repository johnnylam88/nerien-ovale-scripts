local _, NerienOvaleScripts = ...

NerienOvaleScripts.script.DRUID.Nerien = {
	desc = "[5.3] Nerien: Feral, Guardian",
	code =
[[
# Nerien's druid script based on SimulationCraft
#
# Feral:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#UZ!.0.0.1
#	glyphs=savagery
#
# Guardian:
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Ub!...1..

# Spells.
Define(aquatic_form 1066)
	SpellInfo(aquatic_form duration=86400 rage=-10)
	SpellAddBuff(aquatic_form aquatic_form=1)
Define(astral_communion 127663)
	SpellInfo(astral_communion canStopChannelling=4 duration=4 haste=spell tick=1)
	SpellAddBuff(astral_communion astral_communion=1)
Define(astral_storm 106996)
	SpellInfo(astral_storm canStopChannelling=10 duration=10 haste=spell tick=1)
Define(barkskin 22812)
	SpellInfo(barkskin cd=60 duration=12)
	SpellInfo(barkskin addcd=-15 mastery=4)
	SpellAddBuff(barkskin barkskin=1)
Define(bear_form 5487)
	SpellInfo(bear_form duration=86400 rage=-10)
	SpellAddBuff(bear_form bear_form=1)
Define(bear_hug 102795)
	SpellInfo(bear_hug cd=60 duration=3)
	SpellAddDebuff(bear_hug bear_hug=1)
Define(berserk 106952)
Define(berserk_bear 50334)
	SpellInfo(berserk_bear cd=180 duration=10)
	SpellAddBuff(berserk_bear berserk_bear=1)
Define(berserk_cat 106951)
	SpellInfo(berserk_cat cd=180 duration=15)
	SpellAddBuff(berserk_cat berserk_cat=1)
Define(cat_form 768)
	SpellInfo(cat_form duration=86400)
	SpellAddBuff(cat_form cat_form=1)
Define(celestial_alignment 112071)
	SpellInfo(celestial_alignment cd=180 duration=15)
	SpellAddBuff(celestial_alignment celestial_alignment=1)
Define(cenarion_ward 102351)
	SpellInfo(cenarion_ward cd=30 duration=30)
Define(cenarion_ward_hot 102352)
	SpellInfo(cenarion_ward_hot duration=6 haste=spell tick=2)
Define(cenarion_ward_talent 6)
Define(chosen_of_elune 102560)
	SpellInfo(chosen_of_elune cd=180 duration=30)
Define(clearcasting 16870)
Define(cyclone 33786)
	SpellInfo(cyclone cd=20 mastery=2)
	SpellAddBuff(cyclone natures_swiftness=0 predatory_swiftness=0)
Define(dash 1850)
	SpellInfo(dash cd=180 duration=15)
	SpellInfo(dash addcd=-60 glyph=glyph_of_dash)
Define(disorienting_roar 99)
	SpellInfo(disorienting_roar cd=30)
Define(disorienting_roar_talent 10)
Define(displacer_beast 102280)
	SpellInfo(displacer_beast cd=30)
	SpellAddBuff(displacer_beast cat_form=1 displacer_beast_buff=1)
Define(displacer_beast_buff 137452)
	SpellInfo(displacer_beast_buff duration=4)
Define(displacer_beast_talent 2)
Define(dream_of_cenarius_damage 108381)
	SpellInfo(dream_of_cenarius_damage duration=30)
Define(dream_of_cenarius_heal 108382)
	SpellInfo(dream_of_cenarius_heal duration=30)
Define(dream_of_cenarius_talent 17)
Define(enrage 5229)
	SpellInfo(enrage cd=60 duration=10 rage=-20)
	SpellAddBuff(enrage enrage=1)
Define(entangling_roots 339)
	SpellAddBuff(entangling_roots natures_swiftness=0 predatory_swiftness=0)
Define(fae_silence 114238)
	SpellInfo(fae_silence duration=3)
Define(faerie_fire 770)
	SpellInfo(faerie_fire duration=300)
	SpellInfo(faerie_fire cd=6 if_stance=druid_bear_form)
	SpellInfo(faerie_fire cd=6 if_stance=druid_cat_form)
	SpellInfo(faerie_fire cd=15 glyph=glyph_of_fae_silence)
	SpellAddTargetDebuff(faerie_fire faerie_fire=1 weakened_armor=1)
Define(faerie_swarm 102355)
	SpellInfo(faerie_swarm duration=300)
	SpellInfo(faerie_swarm cd=6 if_stance=druid_bear_form)
	SpellInfo(faerie_swarm cd=6 if_stance=druid_cat_form)
	SpellInfo(faerie_swarm cd=15 glyph=glyph_of_fae_silence)
	SpellAddTargetDebuff(faerie_swarm faerie_swarm=1 weakened_armor=1)
Define(faerie_swarm_talent 7)
Define(feline_swiftness_talent 1)
Define(ferocious_bite 22568)
	SpellInfo(ferocious_bite combo=0 energy=25)
	# Ferocious Bite does ((316 to 658) + 762 * CP + 0.196 * AP * CP) damage (from Wowhead).
	# Average the base damage to (316 + 658) / 2 = 487.
	SpellInfo(ferocious_bite base=487 bonuscp=762 bonusapcp=0.196)
	SpellDamageBuff(ferocious_bite dream_of_cenarius_damage=1.25)
Define(force_of_nature_talent 12)
Define(frenzied_regeneration 22842)
	SpellInfo(frenzied_regeneration cd=1.5)
Define(frenzied_regeneration_glyphed 124769)
	SpellInfo(frenzied_regeneration_glyphed duration=6)
	SpellAddBuff(frenzied_regeneration_glyphed frenzied_regeneration_glyphed=1)
Define(glyph_of_blooming 121840)
Define(glyph_of_dash 59219)
Define(glyph_of_fae_silence 114237)
Define(glyph_of_frenzied_regeneration 54810)
Define(glyph_of_might_of_ursoc 116238)
Define(glyph_of_natures_grasp 116203)
Define(glyph_of_savagery 127540)
Define(glyph_of_shred 114234)
Define(glyph_of_skull_bash 116216)
Define(glyph_of_survival_instincts 114223)
Define(glyph_of_wild_growth 62970)
Define(growl 6795)
	SpellInfo(growl cd=8)
	SpellAddBuff(growl bear_form=1)
Define(healing_touch 5185)
	SpellAddBuff(healing_touch natures_swiftness=0 predatory_swiftness=0)
Define(heart_of_the_wild 108292)
	SpellInfo(heart_of_the_wild cd=360)
	SpellAddBuff(heart_of_the_wild heart_of_the_wild=1)
Define(heart_of_the_wild_talent 16)
Define(hibernate 2637)
	SpellAddBuff(hibernate natures_swiftness=0 predatory_swiftness=0)
Define(hurricane 16914)
	SpellInfo(hurricane canStopChannelling=10 duration=10 haste=spell tick=1)
Define(incarnation 106731)
	SpellInfo(incarnation cd=180)
Define(incarnation_talent 11)
Define(infected_wounds 58180)
    SpellInfo(infected_wounds duration=12)
Define(innervate 29166)
	SpellInfo(innervate cd=180 duration=10 tick=1)
Define(ironbark 102342)
	SpellInfo(ironbark cd=90 duration=12)
	SpellAddTargetBuff(ironbark ironbark=1)
Define(king_of_the_jungle 102543)
	SpellInfo(king_of_the_jungle cd=180 duration=30)
Define(lacerate 33745)
	SpellInfo(lacerate cd=3 duration=15 tick=3)
	SpellAddTargetDebuff(lacerate lacerate=1)
Define(lifebloom 33763)
	SpellInfo(lifebloom duration=15 haste=spell tick=1)
	SpellInfo(lifebloom addduration=-5 glyph=glyph_of_blooming)
Define(living_seed 48504)
	SpellInfo(living_seed duration=15)
Define(lunar_shower 81192)
	SpellInfo(lunar_shower duration=3)
Define(maim 22570)
	SpellInfo(maim cd=10 combo=0 energy=35)
Define(mangle 33917)
Define(mangle_bear 33878)
	SpellInfo(mangle_bear buffnocd=mangle_buffnocd cd=6 rage=-5)
	SpellInfo(mangle_bear rage=-8 talent=soul_of_the_forest_talent)
	SpellAddTargetDebuff(mangle_bear infected_wounds=1)
SpellList(mangle_buffnocd berserk_bear son_of_ursoc)
Define(mangle_cat 33876)
	SpellInfo(mangle_cat combo=1 energy=35 inccounter=ripshreds)
	SpellInfo(mangle_cat critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(mangle_cat infected_wounds=1)
Define(mark_of_the_wild 1126)
	SpellInfo(mark_of_the_wild duration=3600)
	SpellAddBuff(mark_of_the_wild mark_of_the_wild=1)
Define(mass_entanglement cd=30 duration=20)
Define(mass_entanglement_talent 8)
Define(maul 6807)
	SpellInfo(maul cd=3 rage=30)
	SpellAddTargetDebuff(maul infected_wounds=1)
Define(might_of_ursoc 106922)
	SpellInfo(might_of_ursoc cd=180 duration=20)
	SpellInfo(might_of_ursoc addcd=120 glyph=glyph_of_might_of_ursoc)
	SpellInfo(might_of_ursoc addcd=-60 itemset=T14_tank itemcount=2)
	SpellAddBuff(might_of_ursoc bear_form=1 might_of_ursoc=1)
Define(mighty_bash 5211)
	SpellInfo(mighty_bash cd=50 duration=5)
	SpellAddTargetDebuff(mighty_bash mighty_bash=1)
Define(mighty_bash_talent 15)
Define(moonfire 8921)
	SpellInfo(moonfire duration=14 haste=spell tick=2)
	SpellInfo(moonfire addduration=2 itemset=T14_caster itemcount=4)
	SpellAddTargetDebuff(moonfire moonfire=1)
Define(moonkin_form 24858)
	SpellInfo(moonkin_form duration=86400)
	SpellAddBuff(moonkin_form moonkin_form=1)
Define(natures_cure 88423)
	SpellInfo(natures_cure cd=8)
Define(natures_grasp 16689)
	SpellInfo(natures_grasp cd=60 duration=45)
	SpellInfo(natures_grasp addcd=-30 glyph=glyph_of_natures_grasp)
Define(natures_swiftness 132158)
	SpellInfo(natures_swiftness cd=60 duration=86400)
	SpellAddBuff(natures_swiftness natures_swiftness=1)
Define(natures_swiftness_talent 4)
Define(natures_vigil 124974)
	SpellInfo(natures_vigil cd=90 duration=30)
	SpellAddBuff(natures_vigil natures_vigil=1)
Define(natures_vigil_talent 18)
Define(nourish 50464)
	SpellAddBuff(nourish natures_swiftness=0)
Define(omen_of_clarity 135700)
Define(owlkin_frenzy 48391)
	SpellInfo(owlkin_frenzy duration=10)
Define(pounce 9005)
	SpellInfo(pounce combo=1 energy=50)
	SpellAddTargetDebuff(pounce pounce_bleed=1)
Define(pounce_incarnation 102546)
	SpellInfo(pounce_incarnation combo=1 energy=50)
	SpellAddTargetDebuff(pounce_incarnation pounce_bleed=1)
Define(pounce_bleed 9007)
	SpellInfo(pounce_bleed duration=18 tick=3)
Define(predatory_swiftness 69369)
	SpellInfo(predatory_swiftness duration=8)
Define(primal_fury 16961)
Define(prowl 5215)
	SpellInfo(prowl duration=1800)
	SpellAddBuff(prowl cat_form=1 prowl=1)
Define(prowl_incarnation 102547)
	SpellInfo(prowl_incarnation duration=1800)
	SpellAddBuff(prowl_incarnation cat_form=1 prowl_incarnation=1)
Define(rake 1822)
	SpellInfo(rake combo=1 duration=15 energy=35 tick=3)
	SpellInfo(rake critcombo=1 if_spell=primal_fury)
	# Damage(rake) = (99 + 0.3 * AP) damage per tick (from Catus).
	SpellInfo(rake base=99 bonusap=0.3)
	SpellDamageBuff(rake dream_of_cenarius_damage=1.25)
	SpellAddTargetDebuff(rake rake=1)
Define(ravage 6785)
	SpellInfo(ravage combo=1 energy=45 inccounter=ripshreds)
	SpellInfo(ravage critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(ravage infected_wounds=1)
Define(ravagebang 102545)
	SpellInfo(ravagebang combo=1 energy=0 inccounter=ripshreds)
	SpellInfo(ravagebang critcombo=1 if_spell=primal_fury)
	SpellAddBuff(ravagebang stampede=0)
	SpellAddTargetDebuff(ravagebang infected_wounds=1)
Define(rebirth 20484)
	SpellInfo(rebirth cd=600)
	SpellAddBuff(rebirth natures_swiftness=0 predatory_swiftness=0)
Define(regrowth 8936)
	SpellInfo(regrowth duration=6 haste=spell tick=2)
	SpellAddBuff(regrowth natures_swiftness=0)
Define(rejuvenation 774)
	SpellInfo(rejuvenation duration=12 haste=spell tick=3)
Define(remove_corruption 2782)
	SpellInfo(remove_corruption cd=8)
Define(renewal 108238)
	SpellInfo(renewal cd=120)
Define(renewal_talent 5)
Define(revive 50769)
Define(rip 1079)
	SpellInfo(rip combo=0 duration=16 energy=30 resetcounter=ripshreds tick=2)
	SpellInfo(rip addduration=4 itemset=T14_melee itemcount=4)
	# Rip does (113 + 320 * CP + 0.0484 * AP * CP * 8) damage over 16 seconds (from Wowhead).
	# Damage(rip) = (14.125 + 40 * CP + 0.0484 * AP * CP) damage per tick.
	SpellInfo(rip base=14.125 bonuscp=40 bonusapcp=0.0484)
	SpellDamageBuff(rip dream_of_cenarius_damage=1.25)
	SpellAddTargetDebuff(rip rip=1)
Define(savage_defense 62606)
	SpellInfo(savage_defense rage=60)
	SpellInfo(savage_defense itemset=T13 itemcount=2 rage=55)
	SpellAddBuff(savage_defense savage_defense_buff=1)
Define(savage_defense_buff 132402)
	SpellInfo(savage_defense_buff duration=6)
Define(savage_roar 52610)
	SpellInfo(savage_roar combo=0 duration=18 energy=25)
	SpellAddBuff(savage_roar savage_roar=1)
Define(savage_roar_glyphed 127538)
	SpellInfo(savage_roar_glyphed combo=-5 duration=18 energy=25)
	SpellAddBuff(savage_roar_glyphed savage_roar_glyphed=1)
SpellList(savage_roar_buff savage_roar savage_roar_glyphed)
Define(shooting_stars 93400)
	SpellInfo(shooting_stars duration=12)
Define(shred 5221)
	SpellInfo(shred combo=1 energy=40 inccounter=ripshreds)
	SpellInfo(shred critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(shred infected_wounds=1)
Define(shredbang 114236)
	SpellInfo(shredbang combo=1 energy=40 inccounter=ripshreds)
	SpellInfo(shredbang critcombo=1 if_spell=primal_fury)
	SpellAddTargetDebuff(shredbang infected_wounds=1)
Define(skull_bash_bear 106839)
	SpellInfo(skull_bash_bear cd=15)
	SpellInfo(skull_bash_bear addcd=10 glyph=glyph_of_skull_bash)
Define(skull_bash_cat 80965)
	SpellInfo(skull_bash_cat cd=15 energy=15)
	SpellInfo(skull_bash_cat addcd=10 glyph=glyph_of_skull_bash)
Define(solar_beam 78675)
	SpellInfo(solar_beam cd=60)
Define(son_of_ursoc 102558)
	SpellInfo(son_of_ursoc cd=180 duration=30)
Define(soothe 2908)
Define(soul_of_the_forest 114108)
	SpellInfo(soul_of_the_forest duration=6)
Define(soul_of_the_forest_talent 10)
Define(stampede 81022)
	SpellInfo(stampede duration=86400)
Define(stampeding_roar 106898)
	SpellInfo(stampeding_roar cd=120 duration=8)
	SpellAddBuff(stampeding_roar stampeding_roar=1)
Define(starfall 48505)
	SpellInfo(starfall cd=90 duration=10)
Define(starfire 2912)
Define(starsurge 78674)
	SpellInfo(starsurge cd=15)
	SpellAddBuff(starsurge shooting_stars=0)
Define(sunfire 93402)
	SpellInfo(sunfire duration=14 haste=spell tick=2)
	SpellInfo(sunfire addduration=2 itemset=T14_caster itemcount=4)
	SpellAddTargetDebuff(sunfire sunfire=1)
Define(survival_instincts 61336)
	SpellInfo(survival_instincts cd=180 duration=12)
	SpellInfo(survival_instincts addcd=-60 duration=6 glyph=glyph_of_survival_instincts)
	SpellAddBuff(survival_instincts survival_instincts=1)
Define(swift_flight_form 40120)
	SpellInfo(swift_flight_form duration=86400)
	SpellAddBuff(swift_flight_form swift_flight_form=1)
Define(swipe 106785)
Define(swipe_bear 779)
	SpellInfo(swipe_bear cd=3 rage=15)
Define(swipe_cat 62078)
	SpellInfo(swipe_cat combo=1 energy=45)
Define(symbiosis 110309)
	SpellInfo(symbiosis duration=3600)
	SpellAddBuff(symbiosis symbiosis=1)
Define(symbiosis_anti_magic_shell 110570)
	SpellInfo(symbiosis_anti_magic_shell cd=45 duration=5)
	SpellAddBuff(symbiosis_anti_magic_shell symbiosis_anti_magic_shell=1)
Define(symbiosis_bone_shield 122285)
	SpellInfo(symbiosis_bone_shield cd=60 duration=300)
	SpellAddBuff(symbiosis_bone_shield symbiosis_bone_shield=1)
Define(symbiosis_clash 126449)
	SpellInfo(symbiosis_clash cd=35)
Define(symbiosis_cleanse 122288)
	SpellInfo(symbiosis_cleanse cd=8)
Define(symbiosis_cloak_of_shadows 110788)
	SpellInfo(symbiosis_cloak_of_shadows cd=120 duration=5)
	SpellAddBuff(symbiosis_cloak_of_shadows symbiosis_cloak_of_shadows=1)
Define(symbiosis_consecration 110701)
	SpellInfo(symbiosis_consecration cd=30 duration=10)
Define(symbiosis_death_coil 122282)
	SpellInfo(symbiosis_death_coil energy=40)
Define(symbiosis_demonic_circle_teleport 112970)
	SpellInfo(symbiosis_demonic_circle_teleport cd=30)
Define(symbiosis_deterrence 110617)
	SpellInfo(symbiosis_deterrence cd=120 duration=5)
	SpellAddBuff(symbiosis_deterrence symbiosis_deterrence=1)
Define(symbiosis_dispersion 110715)
	SpellInfo(symbiosis_dispersion cd=180 duration=6)
	SpellAddBuff(symbiosis_dispersion symbiosis_dispersion=1)
Define(symbiosis_divine_shield 110700)
	SpellInfo(symbiosis_divine_shield cd=300 duration=8)
	SpellAddBuff(symbiosis_divine_shield symbiosis_divine_shield=1)
Define(symbiosis_elusive_brew 126453)
	SpellInfo(symbiosis_elusive_brew cd=60 duration=8)
	SpellAddBuff(symbiosis_elusive_brew symbiosis_elusive_brew=1)
Define(symbiosis_evasion 110791)
	SpellInfo(symbiosis_evasion cd=180 duration=15)
	SpellAddBuff(symbiosis_evasion symbiosis_evasion=1)
Define(symbiosis_fear_ward 110717)
	SpellInfo(symbiosis_fear_ward cd=180 duration=180)
Define(symbiosis_feint 122289)
	SpellInfo(symbiosis_feint duration=5 rage=20)
	SpellAddBuff(symbiosis_feint symbiosis_feint=1)
Define(symbiosis_feral_spirit 110807)
	SpellInfo(symbiosis_feral_spirit cd=120)
Define(symbiosis_fortifying_brew 126456)
	SpellInfo(symbiosis_fortifying_brew cd=180 duration=20)
	SpellAddBuff(symbiosis_fortifying_brew symbiosis_fortifying_brew=1)
Define(symbiosis_frost_armor 110694)
	SpellInfo(symbiosis_frost_armor duration=86400)
	SpellAddBuff(symbiosis_frost_armor symbiosis_frost_armor=1)
Define(symbiosis_frost_nova 110693)
	SpellInfo(symbiosis_frost_nova cd=25 duration=8)
Define(symbiosis_grapple_weapon 126458)
	SpellInfo(symbiosis_grapple_weapon cd=60 duration=8)
	SpellAddTargetDebuff(symbiosis_grapple_weapon symbiosis_grapple_weapon=1)
Define(symbiosis_hammer_of_justice 110698)
	SpellInfo(symbiosis_hammer_of_justice cd=60 duration=6)
	SpellAddTargetDebuff(symbiosis_hammer_of_justice symbiosis_hammer_of_justice=1)
Define(symbiosis_ice_block 110696)
	SpellInfo(symbiosis_ice_block cd=300 duration=10)
	SpellAddBuff(symbiosis_ice_block symbiosis_ice_block=1)
Define(symbiosis_ice_trap 110600)
	SpellInfo(symbiosis_ice_trap cd=30)
Define(symbiosis_icebound_fortitude 110575)
	SpellInfo(symbiosis_icebound_fortitude cd=180 duration=12)
	SpellAddBuff(symbiosis_icebound_fortitude symbiosis_icebound_fortitude=1)
Define(symbiosis_intervene 122292)
	SpellInfo(symbiosis_intervene cd=30 duration=10)
	SpellAddBuff(symbiosis_intervene symbiosis_intervene=1)
Define(symbiosis_intimidating_roar 113004)
	SpellInfo(symbiosis_intimidating_roar cd=90 duration=8)
	SpellAddTargetDebuff(symbiosis_intimidating_roar symbiosis_intimidating_roar=1)
Define(symbiosis_leap_of_faith 110718)
	SpellInfo(symbiosis_leap_of_faith cd=90)
Define(symbiosis_life_tap 122290)
	SpellInfo(symbiosis_life_tap cd=15 rage=-30)
Define(symbiosis_lightning_shield 110803)
	SpellInfo(symbiosis_lightning_shield duration=600)
Define(symbiosis_mass_dispel 110707)
	SpellInfo(symbiosis_mass_dispel cd=60)
Define(symbiosis_mirror_image 110621)
	SpellInfo(symbiosis_mirror_image cd=180 duration=30)
	SpellAddBuff(symbiosis_mirror_image symbiosis_mirror_image=1)
Define(symbiosis_misdirection 110588)
	SpellInfo(symbiosis_misdirection cd=30 duration=20)
	SpellAddBuff(symbiosis_misdirection symbiosis_misdirection=1)
Define(symbiosis_play_dead 110597)
	SpellInfo(symbiosis_play_dead cd=30 duration=360)
	SpellAddBuff(symbiosis_play_dead symbiosis_play_dead=1)
Define(symbiosis_purge 110802)
Define(symbiosis_redirect 110730)
	SpellInfo(symbiosis_redirect cd=60)
Define(symbiosis_shattering_blow 112997)
	SpellInfo(symbiosis_shattering_blow cd=300 duration=10)
	SpellAddBuff(symbiosis_shattering_blow cat_form=1)
	SpellAddTargetDebuff(symbiosis_shattering_blow symbiosis_shattering_blow=1)
Define(symbiosis_soul_swap 110810)
	SpellInfo(symbiosis_soul_swap cd=30)
	SpellAddBuff(symbiosis_soul_swap cat_form=1)
Define(symbiosis_spell_reflection 113002)
	SpellInfo(symbiosis_spell_reflection cd=120 duration=5)
	SpellAddBuff(symbiosis_spell_reflection symbiosis_spell_reflection=1)
Define(symbiosis_spiritwalkers_grace 110806)
	SpellInfo(symbiosis_spiritwalkers_grace cd=120 duration=15)
	SpellAddBuff(symbiosis_spiritwalkers_grace symbiosis_spiritwalkers_grace=1)
Define(symbiosis_unending_resolve 122291)
	SpellInfo(symbiosis_unending_resolve cd=180 duration=12)
	SpellAddBuff(symbiosis_unending_resolve symbiosis_unending_resolve=1)
Define(thrash 106832)
Define(thrash_bear 77758)
	SpellInfo(thrash_bear cd=6 duration=16 tick=2)
	SpellAddTargetDebuff(thrash_bear thrash_bear=1 weakened_blows=1)
Define(thrash_cat 106830)
	SpellInfo(thrash_cat duration=15 energy=50 tick=3)
	SpellAddTargetDebuff(thrash_cat thrash_cat=1 weakened_blows=1)
Define(tigers_fury 5217)
	SpellInfo(tigers_fury cd=30 duration=6 energy=-60)
	SpellAddBuff(tigers_fury tigers_fury=1)
Define(tooth_and_claw 135286)
	SpellInfo(tooth_and_claw duration=10)
Define(tooth_and_claw_debuff 135601)
	SpellInfo(tooth_and_claw_debuff duration=15)
Define(tranquility 740)
	SpellInfo(tranquility canStopChannelling=4 cd=480 duration=8 haste=spell tick=2)
Define(treants 106737)
	SpellInfo(treants cd=60)
Define(treants_balance 33831)
	SpellInfo(treants_balance cd=60)
Define(treants_feral 102703)
	SpellInfo(treants_feral cd=60)
Define(treants_guardian 102706)
	SpellInfo(treants_guardian cd=60)
Define(treants_restoration 102693)
	SpellInfo(treants_restoration cd=60)
Define(tree_of_life 33891)
	SpellInfo(tree_of_life cd=180 duration=30)
Define(typhoon 132469)
	SpellInfo(typhoon cd=30)
Define(typhoon_talent 9)
Define(ursols_vortex 102793)
	SpellInfo(ursols_vortex cd=60)
Define(ursols_vortex_talent 11)
Define(weakened_armor 113746)	# stacks 3 times
    SpellInfo(weakened_armor duration=30)
Define(weakened_blows 115798)
    SpellInfo(weakened_blows duration=30)
Define(wild_charge 102401)
	SpellInfo(wild_charge cd=15)
Define(wild_charge_bear 16979)
	SpellInfo(wild_charge_bear cd=15)
Define(wild_charge_cat 49376)
	SpellInfo(wild_charge_cat cd=15)
Define(wild_charge_moonkin 102383)
	SpellInfo(wild_charge_moonkin cd=15)
Define(wild_charge_talent 3)
Define(wild_growth 48438)
	SpellInfo(wild_growth cd=8 duration=7 haste=spell tick=1)
	SpellInfo(wild_growth addcd=2 glyph=glyph_of_wild_growth)
Define(wild_mushroom 88747)
Define(wild_mushroom_bloom 102791)
	SpellInfo(wild_mushroom_bloom cd=10)
Define(wild_mushroom_detonate 88751)
	SpellInfo(wild_mushroom_detonate cd=10)
Define(wrath 5176)

# Items
Define(virmens_bite_potion 76089)
Define(virmens_bite_potion_buff 105697)
	SpellInfo(virmens_bite_potion_buff duration=25)

# Rune of Re-Origination
ItemList(rune_of_reorigination 94532 95802 96546)
Define(rune_of_reorigination_crit_buff 139117)
	SpellInfo(rune_of_reorigination_crit_buff duration=10)
Define(rune_of_reorigination_haste_buff 139121)
	SpellInfo(rune_of_reorigination_haste_buff duration=10)
Define(rune_of_reorigination_mastery_buff 139120)
	SpellInfo(rune_of_reorigination_mastery_buff duration=10)
SpellList(rune_of_reorigination_buff rune_of_reorigination_crit_buff rune_of_reorigination_haste_buff rune_of_reorigination_mastery_buff)

# Racials
Define(berserking 26297)
	SpellInfo(berserking cd=180 duration=10)
	SpellAddBuff(berserking berserking=1)

AddFunction UseRacialActions
{
	Spell(berserking)
}

AddCheckBox(aoe L(AOE))
AddCheckBox(potions "Use potions" default)

AddCheckBox(opt_icons_left "Left icons")
AddCheckBox(opt_icons_right "Right icons")

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
### Druid (all specializations)
###

# Show the full rotation in an extra icon.
AddCheckBox(full_rotation "Full rotation")

# Faerie Fire/Swarm
AddCheckBox(opt_faerie_fire SpellName(faerie_fire) default)
AddFunction FaerieFire
{
	if CheckBoxOn(opt_faerie_fire)
	{
		if TalentPoints(faerie_swarm_talent) Spell(faerie_swarm)
		if not TalentPoints(faerie_swarm_talent) Spell(faerie_fire)
	}
}

AddFunction FaerieFireReady
{
	CheckBoxOn(opt_faerie_fire)
		and {{TalentPoints(faerie_swarm_talent) and Spell(faerie_swarm)}
			or {not TalentPoints(faerie_swarm_talent) and Spell(faerie_fire)}}
}

AddFunction RipDamageTillDead
{
	# The damage from Rip that is cast under the current conditions and lasting till target is dead.
	# Multiply the damage per tick with the number of ticks that can fit into the time to die.
	# XXX Should factor in crit somehow.
	Damage(rip) * {1 + Mastery() / 100} * {target.TimeToDie() / 2}
}

AddFunction ExistingRipDamageTillDead
{
	# The damage from Rip that is already on the target and lasting till target is dead.
	if target.DebuffPresent(rip)
	{
		# Multiply the damage per tick with the number of ticks that can fit into the time to die.
		# XXX Should factor in crit somehow.
		LastSpellEstimatedDamage(rip) * {1 + LastSpellMastery(rip) / 100} * {target.TimeToDie() / 2}
	}
	if not target.DebuffPresent(rip)
	{
		0
	}
}

###
### Feral
###

AddFunction FeralUsePotion
{
	#virmens_bite_potion
	if CheckBoxOn(potions) and target.Classification(worldboss) Item(virmens_bite_potion)
}

AddFunction FeralSavageRoar
{
    if Glyph(glyph_of_savagery) Spell(savage_roar_glyphed)
    if Glyph(glyph_of_savagery no) and ComboPoints() >0 Spell(savage_roar)
}

AddFunction FeralSavageRoarReady
{
    {Glyph(glyph_of_savagery) and Spell(savage_roar_glyphed)}
		or {Glyph(glyph_of_savagery no) and ComboPoints() >0 and Spell(savage_roar)}
}

AddFunction FeralExecuteRange
{
	# At this target health percent, Ferocious Bite will automatically refresh Rip on the target.
	target.HealthPercent() <=25
}

AddFunction FeralInterrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		if target.InRange(skull_bash_cat) Spell(skull_bash_cat)
		if not target.Classification(worldboss)
		{
			if TalentPoints(mighty_bash_talent) and target.InRange(mighty_bash) Spell(mighty_bash)
			if TalentPoints(typhoon_talent) and target.InRange(skull_bash_cat) Spell(typhoon)
			if ComboPoints() >0 and target.InRange(maim) Spell(maim)
		}
	}
}

AddFunction FeralPreCombatActions
{
	if InCombat(no)
	{
		#flask,type=spring_blossoms
		#food,type=sea_mist_rice_noodles
		#mark_of_the_wild,if=!aura.str_agi_int.up
		if BuffExpires(str_agi_int 400 any=1) Spell(mark_of_the_wild)
		#healing_touch,if=!buff.dream_of_cenarius_damage.up&talent.dream_of_cenarius.enabled
		if TalentPoints(dream_of_cenarius_talent) and BuffExpires(dream_of_cenarius_damage) Spell(healing_touch)
		#cat_form
		if BuffExpires(cat_form) Spell(cat_form)
		#savage_roar
		if Glyph(glyph_of_savagery no) or BuffRemains(savage_roar_buff) <8 FeralSavageRoar()
		#snapshot_stats
	}
}

AddFunction FeralBuffActions
{
	if BuffExpires(str_agi_int any=1) Spell(mark_of_the_wild)
	if BuffExpires(cat_form) Spell(cat_form)
}

AddFunction FeralFillerActions
{
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&combo_points>=5
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and ComboPoints() >=5 Spell(thrash_cat)
	if TalentPoints(incarnation_talent)
	{
		#ravage
		if BuffPresent(king_of_the_jungle) Spell(ravage)
	}
	if not TalentPoints(incarnation_talent) or BuffExpires(king_of_the_jungle)
	{
		#shred,if=buff.omen_of_clarity.react&buff.king_of_the_jungle.down
		if BuffPresent(omen_of_clarity) Spell(shred)
		#shred,if=buff.berserk.up&buff.king_of_the_jungle.down
		if BuffPresent(berserk_cat) Spell(shred)
		#mangle_cat,if=((combo_points<5&dot.rip.remains<3.0)|(combo_points=0&buff.savage_roar.remains<2))&buff.king_of_the_jungle.down
		if {ComboPoints() <5 and target.DebuffRemains(rip) <3} or {ComboPoints() ==0 and BuffRemains(savage_roar_buff) <2} Spell(mangle_cat)
		#shred,if=buff.king_of_the_jungle.down
		Spell(shred)
	}
}

### Feral rotation for talent builds with ``Dream of Cenarius''.

AddFunction FeralDreamOfCenariusFillerActions
{
	#run_action_list,name=filler,if=buff.omen_of_clarity.react
	if BuffPresent(omen_of_clarity) FeralFillerActions()
	#run_action_list,name=filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
	if {ComboPoints() <5 and target.DebuffRemains(rip) <3} or {ComboPoints() ==0 and BuffRemains(savage_roar_buff) <2} FeralFillerActions()
	#run_action_list,name=filler,if=buff.predatory_swiftness.remains>1
	if BuffRemains(predatory_swiftness) >1 FeralFillerActions()
	#run_action_list,name=filler,if=target.time_to_die<=8.5
	if target.TimeToDie() <=8.5 FeralFillerActions()
	#run_action_list,name=filler,if=buff.tigers_fury.up|buff.berserk.up
	if BuffPresent(tigers_fury) or BuffPresent(berserk_cat) FeralFillerActions()
	#run_action_list,name=filler,if=cooldown.tigers_fury.remains<=3
	if SpellCooldown(tigers_fury) <=3 FeralFillerActions()
	#run_action_list,name=filler,if=energy.time_to_max<=1
	if TimeToMaxEnergy() <=1 FeralFillerActions()
}

AddFunction FeralDreamOfCenariusFullRotation
{
	#auto_attack
	#skull_bash_cat
	FeralInterrupt()
	#berserking
	UseRacialActions()
	#healing_touch,if=buff.predatory_swiftness.up&buff.predatory_swiftness.remains<=1.5&buff.dream_of_cenarius_damage.down
	if BuffPresent(predatory_swiftness) and BuffRemains(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage) Spell(healing_touch)
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor any=1) <3 FaerieFire()
	#healing_touch,if=buff.predatory_swiftness.up&combo_points>=4&buff.dream_of_cenarius_damage.stack<2
	if BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2	and ComboPoints() >=4 Spell(healing_touch)
	#healing_touch,if=buff.natures_swiftness.up
	if BuffPresent(natures_swiftness) Spell(healing_touch)
	if TalentPoints(incarnation_talent)
	{
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		if Energy() <=35 and BuffExpires(omen_of_clarity) and Spell(tigers_fury) and Spell(berserk_cat) Spell(king_of_the_jungle)
	}
	#use_item,name=eternal_blossom_grips,sync=tigers_fury
	if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
	{
		UseItemActions()
	}
	#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
	if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	#berserk,if=buff.tigers_fury.up|(target.time_to_die<18&cooldown.tigers_fury.remains>6)
	if BuffPresent(tigers_fury) Spell(berserk_cat)
	if target.TimeToDie() <18 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
	if FeralExecuteRange() and BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
	if target.TimeToDie() <=40 FeralUsePotion()
	if not HasTrinket(rune_of_reorigination) or BuffPresent(rune_of_reorigination_mastery_buff)
	{
		if FeralExecuteRange()
		{
			#virmens_bite_potion,if=(combo_points>=5&target.health.pct<=25&buff.dream_of_cenarius_damage.up)|target.time_to_die<=40
			if ComboPoints() >=5 and BuffPresent(dream_of_cenarius_damage) FeralUsePotion()
			#natures_swiftness,if=enabled&buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&target.health.pct<=25
			if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 Spell(natures_swiftness)
			#rip,line_cd=30,if=combo_points>=5&buff.virmens_bite_potion.up&buff.dream_of_cenarius_damage.up&target.health.pct<=25&target.time_to_die>30
			if FeralExecuteRange() and ComboPoints() >=5 and target.TimeToDie() >30
			{
				# Assume that FB will be 400% normal damage (100% increased damage + crit) to decide if we should overwrite Rip.
				if RipDamageTillDead() > {ExistingRipDamageTillDead() + Damage(ferocious_bite) * 4} Spell(rip)
			}
		}
	}
	if HasTrinket(rune_of_reorigination)
	{
		#natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&target.health.pct<=25
		if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 Spell(natures_swiftness)
	}
	#pool_resource,wait=0.25,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))
	#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=5 and target.DebuffPresent(rip)
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
	}
	if ComboPoints() >=5
	{
		#natures_swiftness,if=combo_points>=5&buff.rune_of_reorigination.react&buff.rune_of_reorigination.remains>1
		if BuffPresent(rune_of_reorigination_mastery_buff 1) Spell(natures_swiftness)
		#rip,if=combo_points>=5&buff.rune_of_reorigination.react
		if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rip)
		#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&buff.dream_of_cenarius_damage.up
		if target.TimeToDie() >=6 and target.DebuffRemains(rip) <2 and BuffPresent(dream_of_cenarius_damage) Spell(rip)
		if TalentPoints(natures_swiftness_talent)
		{
			#natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&dot.rip.remains<3&\
			#	(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
			if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and target.DebuffRemains(rip) <3
				and {BuffPresent(berserk_cat) or target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury)}
			{
				Spell(natures_swiftness)
			}
		}
		#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
		if target.TimeToDie() >=6 and target.DebuffRemains(rip) <2
		{
			if BuffPresent(berserk_cat) Spell(rip)
			if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
		}
	}
	if BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip)
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
		if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 FeralSavageRoar()
	}
	#pool_resource,wait=0.25,if=combo_points>=5&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))&dot.rip.remains>=6.5
	#ferocious_bite,if=combo_points>=5&dot.rip.remains>6
	if ComboPoints() >=5 and target.DebuffRemains(rip) >6
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
	}
	#rake,if=buff.rune_of_reorigination.react
	if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rake)
	#rake,if=dot.rake.remains<9&buff.dream_of_cenarius_damage.up
	if target.DebuffRemains(rake) <9 and BuffPresent(dream_of_cenarius_damage) Spell(rake)
	#rake,if=dot.rake.remains<3
	if target.DebuffRemains(rake) <3 Spell(rake)
	#pool_resource,wait=0.25,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
	FeralDreamOfCenariusFillerActions()
	if TalentPoints(force_of_nature_talent)
	{
		#treants
		Spell(treants_feral)
	}
}

AddFunction FeralDreamOfCenariusMainActions
{
	#auto_attack
	#healing_touch,if=buff.predatory_swiftness.up&buff.predatory_swiftness.remains<=1.5&buff.dream_of_cenarius_damage.down
	if BuffPresent(predatory_swiftness) and BuffRemains(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage) Spell(healing_touch)
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor any=1) <3 FaerieFire()
	#healing_touch,if=buff.predatory_swiftness.up&combo_points>=4&buff.dream_of_cenarius_damage.stack<2
	if BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2	and ComboPoints() >=4 Spell(healing_touch)
	#healing_touch,if=buff.natures_swiftness.up
	if BuffPresent(natures_swiftness) Spell(healing_touch)
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
	if FeralExecuteRange() and BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
	if not HasTrinket(rune_of_reorigination) or BuffPresent(rune_of_reorigination_mastery_buff)
	{
		if FeralExecuteRange()
		{
			#natures_swiftness,if=enabled&buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&target.health.pct<=25
			if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 Spell(natures_swiftness)
			#rip,line_cd=30,if=combo_points>=5&buff.virmens_bite_potion.up&buff.dream_of_cenarius_damage.up&target.health.pct<=25&target.time_to_die>30
			if FeralExecuteRange() and ComboPoints() >=5 and target.TimeToDie() >30
			{
				# Assume that FB will be 400% normal damage (100% increased damage + crit) to decide if we should overwrite Rip.
				if RipDamageTillDead() > {ExistingRipDamageTillDead() + Damage(ferocious_bite) * 4} Spell(rip)
			}
		}
	}
	if HasTrinket(rune_of_reorigination)
	{
		#natures_swiftness,if=buff.dream_of_cenarius_damage.down&buff.predatory_swiftness.down&combo_points>=5&target.health.pct<=25
		if BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 Spell(natures_swiftness)
	}
	#pool_resource,wait=0.25,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))
	#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=5 and target.DebuffPresent(rip)
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
	}
	if ComboPoints() >=5
	{
		#natures_swiftness,if=combo_points>=5&buff.rune_of_reorigination.react&buff.rune_of_reorigination.remains>1
		if BuffPresent(rune_of_reorigination_mastery_buff 1) Spell(natures_swiftness)
		#rip,if=combo_points>=5&buff.rune_of_reorigination.react
		if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rip)
		#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&buff.dream_of_cenarius_damage.up
		#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
		if target.TimeToDie() >=6 and target.DebuffRemains(rip) <2
		{
			if BuffPresent(dream_of_cenarius_damage) Spell(rip)
			if BuffPresent(berserk_cat) Spell(rip)
			if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
		}
	}
	if BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip)
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
		if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 FeralSavageRoar()
	}
	#pool_resource,wait=0.25,if=combo_points>=5&((energy<50&buff.berserk.down)|(energy<25&buff.berserk.remains>1))&dot.rip.remains>=6.5
	#ferocious_bite,if=combo_points>=5&dot.rip.remains>6
	if ComboPoints() >=5 and target.DebuffRemains(rip) >6
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(ferocious_bite)
	}
	#rake,if=buff.rune_of_reorigination.react
	if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rake)
	#rake,if=dot.rake.remains<9&buff.dream_of_cenarius_damage.up
	if target.DebuffRemains(rake) <9 and BuffPresent(dream_of_cenarius_damage) Spell(rake)
	#rake,if=dot.rake.remains<3
	if target.DebuffRemains(rake) <3 Spell(rake)
	#pool_resource,wait=0.25,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
}

AddFunction FeralDreamOfCenariusShortCooldownActions
{
	#skull_bash_cat
	FeralInterrupt()

	unless {BuffPresent(predatory_swiftness) and BuffExpires(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage)}
		or {BuffExpires(savage_roar_buff) and FeralSavageRoarReady()}
		or {target.DebuffStacks(weakened_armor any=1) <3 and FaerieFireReady()}
		or {BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2 and ComboPoints() >=4}
		or BuffPresent(natures_swiftness)
		or not target.InRange(mangle_cat)
	{
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	}
}

AddFunction FeralDreamOfCenariusCooldownActions
{
	#berserking
	UseRacialActions()

	unless {BuffPresent(predatory_swiftness) and BuffExpires(predatory_swiftness) <=1.5 and BuffExpires(dream_of_cenarius_damage)}
		or {BuffExpires(savage_roar_buff) and FeralSavageRoarReady()}
		or {target.DebuffStacks(weakened_armor any=1) <3 and FaerieFireReady()}
		or {BuffPresent(predatory_swiftness) and BuffStacks(dream_of_cenarius_damage) <2 and ComboPoints() >=4}
		or BuffPresent(natures_swiftness)
		or not target.InRange(mangle_cat)
	{
		# Sync Incarnation, Hand enchant, and Berserk with Tiger's Fury.
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		#use_item,name=eternal_blossom_grips,sync=tigers_fury
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		#berserk,if=buff.tigers_fury.up|(target.time_to_die<18&cooldown.tigers_fury.remains>6)
		if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
		{
			if TalentPoints(incarnation_talent) and Spell(berserk_cat) Spell(king_of_the_jungle)
			UseItemActions()
			if not TalentPoints(incarnation_talent) or BuffPresent(king_of_the_jungle) Spell(berserk_cat)
		}
		if BuffPresent(tigers_fury) Spell(berserk_cat)
		if target.TimeToDie() <18 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
		unless FeralExecuteRange() and BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and FeralSavageRoarReady()
		{
			if target.TimeToDie() <=40 FeralUsePotion()
			if not HasTrinket(rune_of_reorigination) or BuffPresent(rune_of_reorigination_mastery_buff)
			{
				if FeralExecuteRange()
				{
					#virmens_bite_potion,if=(combo_points>=5&target.health.pct<=25&buff.dream_of_cenarius_damage.up)|target.time_to_die<=40
					if ComboPoints() >=5 and BuffPresent(dream_of_cenarius_damage) FeralUsePotion()
				}
			}
		}
		if TalentPoints(force_of_nature_talent)
		{
			#treants
			Spell(treants_feral)
		}
	}
}

### Feral rotation for talent builds without ``Dream of Cenarius''.

AddFunction FeralNonDreamOfCenariusFillerActions
{
	#run_action_list,name=filler,if=buff.omen_of_clarity.react
	if BuffPresent(omen_of_clarity) FeralFillerActions()
	#run_action_list,name=filler,if=(combo_points<5&dot.rip.remains<3)|(combo_points=0&buff.savage_roar.remains<2)
	if {ComboPoints() <5 and target.DebuffRemains(rip) <3} or {ComboPoints() ==0 and BuffRemains(savage_roar_buff) <2} FeralFillerActions()
	#run_action_list,name=filler,if=target.time_to_die<=8.5
	if target.TimeToDie() <=8.5 FeralFillerActions()
	#run_action_list,name=filler,if=buff.tigers_fury.up|buff.berserk.up
	if BuffPresent(tigers_fury) or BuffPresent(berserk_cat) FeralFillerActions()
	#run_action_list,name=filler,if=cooldown.tigers_fury.remains<=3
	if SpellCooldown(tigers_fury) <=3 FeralFillerActions()
	#run_action_list,name=filler,if=energy.time_to_max<=1
	if TimeToMaxEnergy() <=1 FeralFillerActions()
	if TalentPoints(soul_of_the_forest_talent)
	{
		#run_action_list,name=filler,if=combo_points<5
		if ComboPoints() <5 FeralFillerActions()
	}
}

AddFunction FeralNonDreamOfCenariusFullRotation
{
	#skull_bash_cat
	FeralInterrupt()
	#init_use_racial_actions()
	UseRacialActions()
	#init_use_profession_actions()
	#UseProfessionActions()
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor any=1) <3 FaerieFire()
	if TalentPoints(incarnation_talent)
	{
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		if Energy() <=35 and BuffExpires(omen_of_clarity) and Spell(tigers_fury) and Spell(berserk_cat) Spell(king_of_the_jungle)
	}
	#use_item,name=eternal_blossom_grips,sync=tigers_fury
	if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
	{
		UseItemActions()
	}
	#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
	if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	#berserk,if=buff.tigers_fury.up|(target.time_to_die<18&cooldown.tigers_fury.remains>6)
	if BuffPresent(tigers_fury) Spell(berserk_cat)
	if target.TimeToDie() <18 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
	#natures_vigil,if=enabled&(buff.tigers_fury.up|(target.time_to_die<35&cooldown.tigers_fury.remains>6))
	if TalentPoints(natures_vigil_talent)
	{
		if BuffPresent(tigers_fury) Spell(natures_vigil)
		if target.TimeToDie() <35 and SpellCooldown(tigers_fury) >6 Spell(natures_vigil)
	}
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
	if FeralExecuteRange() and BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
	#virmens_bite_potion,if=(buff.berserk.up&target.health.pct<=25)|target.time_to_die<=40
	if target.TimeToDie() <=40 FeralUsePotion()
	if FeralExecuteRange()
	{
		if BuffPresent(berserk_cat) FeralUsePotion()
		if ComboPoints() >=5
		{
			#rip,line_cd=30,if=combo_points>=5&target.health.pct<=25&buff.rune_of_reorigination.up&buff.virmens_bite_potion.up
			if BuffPresent(rune_of_reorigination_mastery_buff) and BuffPresent(virmens_bite_potion_buff) Spell(rip)
			#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
			if target.DebuffPresent(rip) Spell(ferocious_bite)
		}
	}
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2
	{
		if BuffPresent(berserk_cat) Spell(rip)
		if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
	}
	#rip,if=combo_points>=5&buff.rune_of_reorigination.react
	if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rip)
	if BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip)
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
		if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 FeralSavageRoar()
	}
	#ferocious_bite,if=combo_points>=5&(dot.rip.remains>10|(dot.rip.remains>6&buff.berserk.up))&dot.rip.ticking
	if ComboPoints() >=5 and target.DebuffPresent(rip)
	{
		if target.DebuffRemains(rip) >10 Spell(ferocious_bite)
		if target.DebuffRemains(rip) >6 and BuffPresent(berserk_cat) Spell(ferocious_bite)
	}
	#rake,if=buff.rune_of_reorigination.react
	if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rake)
	#rake,if=dot.rake.remains<9&buff.tigers_fury.up
	if target.DebuffRemains(rake) <9 and BuffPresent(tigers_fury) Spell(rake)
	#rake,if=dot.rake.remains<3&(buff.berserk.up|(cooldown.tigers_fury.remains+0.8)>=dot.rake.remains|energy>60)
	if target.DebuffRemains(rake) <3
	{
		if BuffPresent(berserk_cat) Spell(rake)
		if SpellCooldown(tigers_fury) +0.8 >= target.DebuffRemains(rake) Spell(rake)
		if Energy() >60 Spell(rake)
	}
	#pool_resource,wait=0.1,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
	FeralNonDreamOfCenariusFillerActions()
	if TalentPoints(force_of_nature_talent)
	{
		#treants
		Spell(treants_feral)
	}
}

AddFunction FeralNonDreamOfCenariusMainActions
{
	#savage_roar,if=buff.savage_roar.down
	if BuffExpires(savage_roar_buff) FeralSavageRoar()
	#faerie_fire,if=debuff.weakened_armor.stack<3
	if target.DebuffStacks(weakened_armor any=1) <3 FaerieFire()
	#ferocious_bite,if=combo_points>=1&dot.rip.ticking&dot.rip.remains<=3&target.health.pct<=25
	if FeralExecuteRange() and ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=3 Spell(ferocious_bite)
	#thrash_cat,if=target.time_to_die>=6&buff.omen_of_clarity.react&dot.thrash_cat.remains<3
	if target.TimeToDie() >=6 and BuffPresent(omen_of_clarity) and target.DebuffRemains(thrash_cat) <3 Spell(thrash_cat)
	#ferocious_bite,if=(target.time_to_die<=4&combo_points>=5)|(target.time_to_die<=1&combo_points>=3)
	if target.TimeToDie() <=4 and ComboPoints() >=5 Spell(ferocious_bite)
	if target.TimeToDie() <=1 and ComboPoints() >=3 Spell(ferocious_bite)
	if FeralExecuteRange()
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&target.health.pct<25
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		if ComboPoints() >=5
		{
			#rip,line_cd=30,if=combo_points>=5&target.health.pct<=25&buff.rune_of_reorigination.up&buff.virmens_bite_potion.up
			if BuffPresent(rune_of_reorigination_mastery_buff) and BuffPresent(virmens_bite_potion_buff) Spell(rip)
			#ferocious_bite,if=combo_points>=5&dot.rip.ticking&target.health.pct<=25
			if target.DebuffPresent(rip) Spell(ferocious_bite)
		}
	}
	#rip,if=combo_points>=5&target.time_to_die>=6&dot.rip.remains<2&(buff.berserk.up|dot.rip.remains+1.9<=cooldown.tigers_fury.remains)
	if target.TimeToDie() >=6 and ComboPoints() >=5 and target.DebuffRemains(rip) <2
	{
		if BuffPresent(berserk_cat) Spell(rip)
		if target.DebuffRemains(rip) +1.9 <= SpellCooldown(tigers_fury) Spell(rip)
	}
	#rip,if=combo_points>=5&buff.rune_of_reorigination.react
	if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rip)
	if BuffRemains(savage_roar_buff) +2 > target.DebuffRemains(rip)
	{
		#savage_roar,if=buff.savage_roar.remains<=3&combo_points>0&buff.savage_roar.remains+2>dot.rip.remains
		if BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 FeralSavageRoar()
		#savage_roar,if=buff.savage_roar.remains<=6&combo_points>=5&buff.savage_roar.remains+2<=dot.rip.remains
		if BuffRemains(savage_roar_buff) <=6 and ComboPoints() >=5 FeralSavageRoar()
	}
	#ferocious_bite,if=combo_points>=5&(dot.rip.remains>10|(dot.rip.remains>6&buff.berserk.up))&dot.rip.ticking
	if ComboPoints() >=5 and target.DebuffPresent(rip)
	{
		if target.DebuffRemains(rip) >10 Spell(ferocious_bite)
		if target.DebuffRemains(rip) >6 and BuffPresent(berserk_cat) Spell(ferocious_bite)
	}
	#rake,if=buff.rune_of_reorigination.react
	if BuffPresent(rune_of_reorigination_mastery_buff) Spell(rake)
	#rake,if=dot.rake.remains<9&buff.tigers_fury.up
	if target.DebuffRemains(rake) <9 and BuffPresent(tigers_fury) Spell(rake)
	#rake,if=dot.rake.remains<3&(buff.berserk.up|(cooldown.tigers_fury.remains+0.8)>=dot.rake.remains|energy>60)
	if target.DebuffRemains(rake) <3
	{
		if BuffPresent(berserk_cat) Spell(rake)
		if SpellCooldown(tigers_fury) +0.8 >= target.DebuffRemains(rake) Spell(rake)
		if Energy() >60 Spell(rake)
	}
	#pool_resource,wait=0.1,for_next=1
	#thrash_cat,if=dot.thrash_cat.remains<3&target.time_to_die>=6&(dot.rip.remains>=4|buff.berserk.up)
	if target.DebuffRemains(thrash_cat) <3 and target.TimeToDie() >=6 and {target.DebuffRemains(rip) >=4 or BuffPresent(berserk_cat)}
	{
		wait if {BuffExpires(berserk_cat) and Energy() >=50} or {BuffPresent(berserk_cat) and Energy() >=25} Spell(thrash_cat)
	}
}

AddFunction FeralNonDreamOfCenariusShortCooldownActions
{
	#skull_bash_cat
	FeralInterrupt()

	unless BuffExpires(savage_roar_buff)
		or {target.DebuffStacks(weakened_armor any=1) <3 and FaerieFireReady()}
		or not target.InRange(mangle_cat)
	{
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		if {Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle) Spell(tigers_fury)
	}
}

AddFunction FeralNonDreamOfCenariusCooldownActions
{
	if InCombat(no)
	{
		#virmens_bite_potion
		FeralUsePotion()
	}

	#init_use_racial_actions()
	UseRacialActions()
	#init_use_profession_actions()
	#UseProfessionActions()

	unless {BuffExpires(savage_roar_buff) and FeralSavageRoarReady()}
		or {target.DebuffStacks(weakened_armor any=1) <3 and FaerieFireReady()}
		or not target.InRange(mangle_cat)
	{
		# Sync Incarnation, Hand enchant, and Berserk with Tiger's Fury.
		#incarnation,if=energy<=35&!buff.omen_of_clarity.react&cooldown.tigers_fury.remains=0&cooldown.berserk.remains=0
		#use_item,name=eternal_blossom_grips,sync=tigers_fury
		#tigers_fury,if=(energy<=35&!buff.omen_of_clarity.react)|buff.king_of_the_jungle.up
		#berserk,if=buff.tigers_fury.up|(target.time_to_die<18&cooldown.tigers_fury.remains>6)
		if {{Energy() <=35 and BuffExpires(omen_of_clarity)} or BuffPresent(king_of_the_jungle)} and Spell(tigers_fury)
		{
			if TalentPoints(incarnation_talent) and Spell(berserk_cat) Spell(king_of_the_jungle)
			UseItemActions()
			if not TalentPoints(incarnation_talent) or BuffPresent(king_of_the_jungle) Spell(berserk_cat)
		}
		if BuffPresent(tigers_fury) Spell(berserk_cat)
		if target.TimeToDie() <18 and SpellCooldown(tigers_fury) >6 Spell(berserk_cat)
		#natures_vigil,if=enabled&(buff.tigers_fury.up|(target.time_to_die<35&cooldown.tigers_fury.remains>6))
		if TalentPoints(natures_vigil_talent)
		{
			if BuffPresent(tigers_fury) Spell(natures_vigil)
			if target.TimeToDie() <35 and SpellCooldown(tigers_fury) >6 Spell(natures_vigil)
		}

		unless FeralExecuteRange() and BuffRemains(savage_roar_buff) <=3 and ComboPoints() >0 and FeralSavageRoarReady()
		{
			#virmens_bite_potion,if=(buff.berserk.up&target.health.pct<=25)|target.time_to_die<=40
			if target.TimeToDie() <=40 FeralUsePotion()
			if FeralExecuteRange()
			{
				if BuffPresent(berserk_cat) FeralUsePotion()
			}
		}
		if TalentPoints(force_of_nature_talent)
		{
			#treants
			Spell(treants_feral)
		}
	}
}

### Feral Icons

# Healing cooldowns.
AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_left
{
	Spell(barkskin)
	Spell(survival_instincts)
	if TalentPoints(renewal_talent) Spell(renewal)
	if TalentPoints(cenarion_ward_talent) Spell(cenarion_ward)
	Spell(tranquility)
}

AddIcon mastery=2 size=small checkboxon=opt_icons_left
{
	if TalentPoints(displacer_beast_talent)
	{
		Spell(displacer_beast)
	}
	if TalentPoints(wild_charge_talent)
	{
		if BuffPresent(bear_form)
		{
			if target.InRange(wild_charge_bear) and not target.InRange(mangle_bear) Spell(wild_charge_bear)
		}
		if BuffPresent(cat_form)
		{
			if target.InRange(wild_charge_cat) and not target.InRange(mangle_cat) Spell(wild_charge_cat)
		}
		if target.InRange(wild_charge) Spell(wild_charge)
	}
	Spell(dash)
}

# Full rotation in a single icon.
AddIcon mastery=2 checkboxon=full_rotation
{
	FeralPreCombatActions()
	FeralBuffActions()
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusFullRotation()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusFullRotation()
	}
}

# Short cooldowns.
AddIcon mastery=2 help=shortcd
{
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusShortCooldownActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusShortCooldownActions()
	}
}

# Main rotation plus fillers.
AddIcon mastery=2 help=main
{
	FeralPreCombatActions()
	FeralBuffActions()
	if not target.InRange(mangle_cat) Texture(ability_druid_catformattack)
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusMainActions()
		FeralDreamOfCenariusFillerActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusMainActions()
		FeralNonDreamOfCenariusFillerActions()
	}
}

# Main rotation.
AddIcon mastery=2 help=main
{
	FeralPreCombatActions()
	FeralBuffActions()
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusMainActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusMainActions()
	}
}

# Cooldowns.
AddIcon mastery=2 help=cd
{
	if TalentPoints(dream_of_cenarius_talent)
	{
		FeralDreamOfCenariusCooldownActions()
	}
	if not TalentPoints(dream_of_cenarius_talent)
	{
		FeralNonDreamOfCenariusCooldownActions()
	}
}

# Tier 6 talent cooldown.
AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_right
{
	if TalentPoints(heart_of_the_wild_talent) Spell(heart_of_the_wild)
	if TalentPoints(dream_of_cenarius_talent) and TalentPoints(natures_swiftness_talent) Spell(natures_swiftness)
	if TalentPoints(natures_vigil_talent) Spell(natures_vigil)
}

# Trinkets.
AddIcon mastery=2 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}

###
### Guardian
###

AddFunction GuardianInterrupt
{
	if not target.IsFriend() and target.IsInterruptible()
	{
		if target.InRange(skull_bash_bear) Spell(skull_bash_bear)
		if not target.Classification(worldboss) and TalentPoints(mighty_bash_talent) and target.InRange(mighty_bash)
		{
			Spell(mighty_bash)
		}
	}
}

# Rotation from The Inconspicious Bear Mists of Pandaria Guardian Guide by Arielle:
#	http://theincbear.com/forums/viewtopic.php?p=12230#p12230

# Health increase cooldowns.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	Spell(might_of_ursoc)
}

# Damage reduction cooldowns.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_left
{
	Spell(barkskin)
	if TalentPoints(force_of_nature_talent) Spell(treants_guardian)
	Spell(survival_instincts)
}

# Main rotation (rage-consuming abilities).
AddIcon mastery=3 help=shortcd
{
	if {BuffPresent(tooth_and_claw) and BuffPresent(savage_defense_buff)} or target.IsAggroed(no)
	{
		if Rage() >90 Spell(maul)
	}
	if BuffExpires(tooth_and_claw) or BuffRemains(savage_defense_buff) <2 Spell(savage_defense usable=1)
	if HealthPercent() <80
	{
		if Glyph(glyph_of_frenzied_regeneration) or Rage() >60 Spell(frenzied_regeneration)
	}
}

# Main rotation (rage-generating abilities).
#
#	Mangle > Lacerate > Thrash Maintenance > FFF
#
# Since FFF does more damage than a simple impact hit of Thrash, you should use
# FFF whenever Thrash still has at least 6 seconds left.
#
AddIcon mastery=3 help=main
{
	if InCombat(no) and BuffRemains(str_agi_int any=1) <400 Spell(mark_of_the_wild)
	if BuffExpires(bear_form) Spell(bear_form)

	Spell(mangle_bear)

	# Debuff maintenance.
	if target.DebuffRemains(weakened_blows any=1) <3 Spell(thrash_bear)
	if target.DebuffRemains(weakened_armor any=1) <3 or target.DebuffStacks(weakened_armor any=1) <3
	{
		FaerieFire()
	}

	Spell(lacerate)
	if target.DebuffPresent(thrash_bear) and target.DebuffRemains(thrash_bear) >6 FaerieFire()
	Spell(thrash_bear)
	FaerieFire()
}

# AoE rotation: Mangle > Thrash > Swipe
AddIcon mastery=3 help=aoe checkboxon=aoe
{
	Spell(mangle_bear)
	Spell(thrash_bear)
	Spell(swipe_bear)
}

# Rage cooldowns.
AddIcon mastery=3 help=cd
{
	if target.IsInterruptible() GuardianInterrupt()
	if Rage() <11 Spell(enrage)
	if HealthPercent() <25
	{
		if BuffExpires(son_of_ursoc) Spell(berserk_bear)
		if TalentPoints(incarnation_talent) and BuffExpires(berserk_bear) Spell(son_of_ursoc)
	}
	if not BuffPresent(burst_haste any=1)
	{
		Spell(berserking)
	}
	if BuffExpires(son_of_ursoc) Spell(berserk_bear)
	if TalentPoints(incarnation_talent) and BuffExpires(berserk_bear) Spell(son_of_ursoc)
}

# Healing cooldowns.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	if TalentPoints(natures_swiftness_talent) Spell(natures_swiftness)
	if TalentPoints(renewal_talent) Spell(renewal)
	if TalentPoints(cenarion_ward_talent) Spell(cenarion_ward)
}

# Trinkets.
AddIcon mastery=3 help=cd size=small checkboxon=opt_icons_right
{
	unless List(trinketcd0 000s) Item(Trinket0Slot usable=1)
	unless List(trinketcd1 000s) Item(Trinket1Slot usable=1)
}
]]
}
