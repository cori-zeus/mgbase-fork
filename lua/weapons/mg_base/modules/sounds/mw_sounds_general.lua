AddCSLuaFile()

----------- CUSTOMIZATION -----------


sound.Add({
    name =            "MW_UI.Attach",
    channel =        CHAN_USER_BASE,
    volume =      1,
    pitch = 100,
    sound = {"viper/shared/iw8_general_select_v1.ogg"}
})

sound.Add({
    name =            "MW_UI.Deattach",
    channel =        CHAN_USER_BASE,
    pitch = 100,
    volume =      1,
    sound = {"viper/shared/iw8_general_select_alt_v1.ogg"}
})



----------- ATMO OUTSIDE ------------

--- AR ---
sound.Add({
    name =            "Atmo_AR.Outside",
    channel =        CHAN_ATMO,
    volume =      0.5,
    pitch = {90, 110},
    sound = {"viper/shared/atmo/ar/weap_ar_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_AR_Sup.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
    volume =      0.5,
    sound = {"viper/shared/atmo/ar/weap_ar_sup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar_sup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar_sup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar_sup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar_sup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar_sup_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_AR2.Outside", 
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/ar/weap_ar2_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar2_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar2_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar2_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar2_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar2_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_AR2_Sup.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/ar/weap_ar2_sup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar2_sup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar2_sup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar2_sup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar2_sup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar2_sup_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_AR3.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
    volume = 0.5,
    sound = {"viper/shared/atmo/ar/weap_ar3_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar3_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar3_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar3_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar3_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar3_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_AR4.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/ar/weap_ar4_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar4_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar4_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar4_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar4_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar4_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_AR5.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/ar/weap_ar5_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar5_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar5_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar5_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar5_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar5_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_AR6.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/ar/weap_ar6_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/ar/weap_ar6_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/ar/weap_ar6_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/ar/weap_ar6_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/ar/weap_ar6_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/ar/weap_ar6_fire_plr_atmo_ext1_06.ogg"}
})

--- BR ---
sound.Add({
    name =            "Atmo_br1.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/br/weap_br1_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/br/weap_br1_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/br/weap_br1_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/br/weap_br1_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/br/weap_br1_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/br/weap_br1_fire_plr_atmo_ext1_06.ogg"}
})

--- DMR ---
sound.Add({
    name =            "Atmo_DMR.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/dmr/weap_dmr_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/dmr/weap_dmr_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/dmr/weap_dmr_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/dmr/weap_dmr_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/dmr/weap_dmr_fire_plr_atmo_ext1_05.ogg", 
            "viper/shared/atmo/dmr/weap_dmr_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_DMR_Sup.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/dmr/weap_dmr_sup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/dmr/weap_dmr_sup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/dmr/weap_dmr_sup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/dmr/weap_dmr_sup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/dmr/weap_dmr_sup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/dmr/weap_dmr_sup_fire_plr_atmo_ext1_06.ogg"}
})

--- LMG ---
sound.Add({
    name =            "Atmo_LMG.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
    volume = 0.5,
    sound = {"viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_ext1_05.ogg"}
})

--- M203 ---
sound.Add({
    name =            "Atmo_M203.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_01.ogg",
            "viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_02.ogg",
            "viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_03.ogg",
            "viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_04.ogg"}
})

--- PISTOLS ---
sound.Add({
    name =            "Atmo_Pistol.Outside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =     0.5,
    sound = {"viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_Pistol_Sup.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    soundlevel = SNDLVL_GUNFIRE,
    sound = {"viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_Pistol_Mag.Outside",
    channel =        CHAN_ATMO,
     volume = 0.45,
    sound = {"viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext1_06.ogg",}
})

sound.Add({
    name =            "Atmo_Pistol_Mag_Sup.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    sound = {"viper/shared/atmo/pistol/weap_pistol_mag_sup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_sup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_sup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_sup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_sup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_sup_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_Pistol_Mag2.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    sound = {"viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext2_01.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext2_02.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext2_03.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext2_04.ogg",
            "viper/shared/atmo/pistol/weap_pistol_mag_fire_plr_atmo_ext2_05.ogg"}
})


--- SHOTGUNS ---

sound.Add({
    name =            "Atmo_Shotgun.Outside",
    channel =        CHAN_ATMO,
volume =      0.5,
    soundlevel = SNDLVL_GUNFIRE,
    sound = {"viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_Shotgun2.Outside",
    channel =        CHAN_ATMO,
volume =      0.5,
    sound = {"viper/shared/atmo/shotgun/weap_shotgunsup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/shotgun/weap_shotgunsup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/shotgun/weap_shotgunsup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/shotgun/weap_shotgunsup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/shotgun/weap_shotgunsup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/shotgun/weap_shotgunsup_fire_plr_atmo_ext1_06.ogg"}
})


--- SMG's ---

sound.Add({
    name =            "Atmo_SMG.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    sound = {"viper/shared/atmo/smg/weap_smg_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_SMG_Sup.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    sound = {"viper/shared/atmo/smg/weap_smg_sup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/smg/weap_smg_sup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/smg/weap_smg_sup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/smg/weap_smg_sup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/smg/weap_smg_sup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/smg/weap_smg_sup_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_SMG2.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    sound = {"viper/shared/atmo/smg/weap_smg2_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/smg/weap_smg2_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/smg/weap_smg2_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/smg/weap_smg2_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/smg/weap_smg2_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/smg/weap_smg2_fire_plr_atmo_ext1_06.ogg"}
})

--- Snipers ---

sound.Add({
    name =            "Atmo_Sniper.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    sound = {"viper/shared/atmo/sniper/weap_sniper2_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/sniper/weap_sniper2_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/sniper/weap_sniper2_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/sniper/weap_sniper2_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/sniper/weap_sniper2_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/sniper/weap_sniper2_fire_plr_atmo_ext1_06.ogg"}
})

sound.Add({
    name =            "Atmo_Sniper_Sup.Outside",
    channel =        CHAN_ATMO,
 volume =      0.5,
    sound = {"viper/shared/atmo/sniper/weap_sniper_sup_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/sniper/weap_sniper_sup_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/sniper/weap_sniper_sup_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/sniper/weap_sniper_sup_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/sniper/weap_sniper_sup_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/sniper/weap_sniper_sup_fire_plr_atmo_ext1_06.ogg"}
})

---  Western ---
sound.Add({
    name =            "Atmo_Western.Outside",
    channel =        CHAN_ATMO,
volume =      0.5,
    sound = {"viper/shared/atmo/western/weap_western_fire_plr_atmo_ext1_01.ogg",
            "viper/shared/atmo/western/weap_western_fire_plr_atmo_ext1_02.ogg",
            "viper/shared/atmo/western/weap_western_fire_plr_atmo_ext1_03.ogg",
            "viper/shared/atmo/western/weap_western_fire_plr_atmo_ext1_04.ogg",
            "viper/shared/atmo/western/weap_western_fire_plr_atmo_ext1_05.ogg",
            "viper/shared/atmo/western/weap_western_fire_plr_atmo_ext1_06.ogg"}
})

--- ROCKET LAUNCHERS ---

sound.Add({
    name =            "Atmo_RPG.Outside",
    channel =        CHAN_ATMO,
volume =      0.5,
    sound = {"viper/shared/atmo/launchers/weap_rpapa7_fire_plr_atmo_01.ogg",
            "viper/shared/atmo/launchers/weap_rpapa7_fire_plr_atmo_02.ogg",
            "viper/shared/atmo/launchers/weap_rpapa7_fire_plr_atmo_03.ogg",
            "viper/shared/atmo/launchers/weap_rpapa7_fire_plr_atmo_04.ogg"}
})

----------- ATMO INSIDE ------------

--- AR ---
sound.Add({
    name =            "Atmo_AR.Inside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/AR/weap_ar_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/AR/weap_ar_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/AR/weap_ar_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/AR/weap_ar_fire_plr_atmo_int1_04.ogg"}
})

sound.Add({
    name =            "Atmo_AR_Sup.Inside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/AR/weap_ar_sup_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/AR/weap_ar_sup_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/AR/weap_ar_sup_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/AR/weap_ar_sup_fire_plr_atmo_int1_04.ogg",
            "viper/shared/atmo/AR/weap_ar_sup_fire_plr_atmo_int1_05.ogg",
            "viper/shared/atmo/AR/weap_ar_sup_fire_plr_atmo_int1_06.ogg"}
})

--- DMR ---
sound.Add({
    name =            "Atmo_DMR_Sup.Inside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/DMR/weap_dmr_sup_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/DMR/weap_dmr_sup_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/DMR/weap_dmr_sup_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/DMR/weap_dmr_sup_fire_plr_atmo_int1_04.ogg",
            "viper/shared/atmo/DMR/weap_dmr_sup_fire_plr_atmo_int1_05.ogg",
            "viper/shared/atmo/DMR/weap_dmr_sup_fire_plr_atmo_int1_06.ogg"}
})

--- LMG ---
sound.Add({
    name =            "Atmo_LMG.Inside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_int1_04.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_int1_05.ogg",
            "viper/shared/atmo/lmg/weap_lmg_fire_plr_atmo_int1_06.ogg"}
})

--- M203 ---
sound.Add({
    name =            "Atmo_Mike203.Inside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_int1_01.ogg",
            "viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_int1_02.ogg",
            "viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_int1_03.ogg",
            "viper/shared/atmo/launcher/weap_mike203_fire_plr_atmos_int1_04.ogg"}
})

--- Pistol ---
sound.Add({
    name =            "Atmo_Pistol.Inside",
    channel =        CHAN_ATMO,
volume =      0.5,
    sound = {"viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_int1_04.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_int1_05.ogg",
            "viper/shared/atmo/pistol/weap_pistol_fire_plr_atmo_int1_06.ogg"}
})

sound.Add({
    name =            "Atmo_Pistol_Sup.Inside",
    channel =        CHAN_ATMO,
volume =      0.5,
    sound = {"viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_int1_04.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_int1_05.ogg",
            "viper/shared/atmo/pistol/weap_pistol_sup_fire_plr_atmo_int1_06.ogg"}
})

--- Shotguns ---
sound.Add({
    name =            "Atmo_Shotgun.Inside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_int1_04.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_int1_05.ogg",
            "viper/shared/atmo/shotgun/weap_shotgun_fire_plr_atmo_int1_06.ogg"}
})

--- SMG ---
sound.Add({
    name =            "Atmo_SMG.Inside",
    channel =        CHAN_ATMO,
    soundlevel = SNDLVL_GUNFIRE,
volume =      0.5,
    sound = {"viper/shared/atmo/smg/weap_smg_fire_plr_atmo_int1_01.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_int1_02.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_int1_03.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_int1_04.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_int1_05.ogg",
            "viper/shared/atmo/smg/weap_smg_fire_plr_atmo_int1_06.ogg"}
})

--- RPG ---
sound.Add({
    name =            "Atmo_Launcher.Inside",
    channel =        CHAN_ATMO,
volume =      0.5,
    sound = {"viper/shared/atmo/launchers/weap_juliet_launch_atmo_int_01.ogg",
            "viper/shared/atmo/launchers/weap_juliet_launch_atmo_int_02.ogg",
            "viper/shared/atmo/launchers/weap_juliet_launch_atmo_int_03.ogg"}
})




--- Reflections ---

--- AR ---
sound.Add({
    name =            "Reflection_AR.Outside",
    channel =        CHAN_REFLECTION,
    volume =      0.5,
    sound = {"viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_01.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_02.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_03.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_04.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_05.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_06.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_07.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_ext_dist_lr_08.ogg"}
})
sound.Add({
    name =            "Reflection_AR.Inside",
    channel =        CHAN_REFLECTION,
    volume =      1,
    sound = {"viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_01.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_02.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_03.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_04.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_05.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_06.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_07.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_ar_urb_int_close_front_08.ogg"}
})

sound.Add({
    name =            "Reflection_ARSUP.Outside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_01.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_02.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_03.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_04.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_05.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_06.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_07.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_ext_dist_lr_08.ogg"}
})
sound.Add({
    name =            "Reflection_ARSUP.Inside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_01.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_02.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_03.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_04.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_05.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_06.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_07.ogg",
            "viper/shared/reflection/ar/weap_refl_ar_urb/weap_refl_arsup_urb_int_close_front_08.ogg"}
})

sound.Add({
    name =            "Reflection_Pistol.Outside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_ext_dist_lr_01.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_ext_dist_lr_02.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_ext_dist_lr_03.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_ext_dist_lr_04.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_ext_dist_lr_05.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_ext_dist_lr_06.ogg"}
})
sound.Add({
    name =            "Reflection_Pistol.Inside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_01.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_02.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_03.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_04.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_05.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_06.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_07.ogg",
            "viper/shared/reflection/pistol/weap_pist_ref_urb/weap_refl_pistol_urb_int_close_front_08.ogg"}
})

sound.Add({
    name =            "Reflection_Shotgun.Outside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_01.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_02.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_03.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_04.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_05.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_06.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_07.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_ext_dist_lr_08.ogg"}
})
sound.Add({
    name =            "Reflection_Shotgun.Inside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_01.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_02.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_03.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_04.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_05.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_06.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_07.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/weap_refl_shotgun_urb_int_close_front_08.ogg"}
})
sound.Add({
    name =            "Reflection_ShotgunSUP.Inside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/shotgun/weap_refl_shotgun_urb/wex_shotgunsup_urb_int_close_front_plr_01.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/wex_shotgunsup_urb_int_close_front_plr_02.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/wex_shotgunsup_urb_int_close_front_plr_03.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/wex_shotgunsup_urb_int_close_front_plr_04.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/wex_shotgunsup_urb_int_close_front_plr_05.ogg",
            "viper/shared/reflection/shotgun/weap_refl_shotgun_urb/wex_shotgunsup_urb_int_close_front_plr_06.ogg"}
})

sound.Add({
    name =            "Reflection_Sniper.Outside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_01.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_02.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_03.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_04.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_05.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_06.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_07.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_ext_dist_lr_08.ogg"}
})
sound.Add({
    name =            "Reflection_Sniper.Inside",
    channel =        CHAN_REFLECTION,
volume =      0.5,
    sound = {"viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_01.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_02.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_03.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_04.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_05.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_06.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_07.ogg",
            "viper/shared/reflection/sniper/weap_refl_sniper_urb/weap_refl_sniper_urb_int_close_front_08.ogg"}
})

----------- CASINGS ------------

sound.Add({
    name =            "MW_Casings.Pistol",
    channel =        CHAN_CASINGS,
    soundlevel = SNDLVL_GUNFIRE,
    sound = {"viper/shared/casings/pistol_casing1.wav", "viper/shared/casings/pistol_casing2.wav", "viper/shared/casings/pistol_casing3.wav",
    "viper/shared/casings/pistol_casing4.wav", "viper/shared/casings/pistol_casing5.wav", "viper/shared/casings/pistol_casing6.wav", "viper/shared/casings/pistol_casing7.wav",
    "viper/shared/casings/pistol_casing8.wav", "viper/shared/casings/pistol_casing9.wav", "viper/shared/casings/pistol_casing10.wav", "viper/shared/casings/pistol_casing11.wav",
    "viper/shared/casings/pistol_casing12.wav", "viper/shared/casings/pistol_casing13.wav", "viper/shared/casings/pistol_casing14.wav", "viper/shared/casings/pistol_casing15.wav",
    "viper/shared/casings/pistol_casing16.wav", "viper/shared/casings/pistol_casing17.wav"}
})

----------- BASHING ------------

sound.Add({
	name = 			"MW_Melee.Miss_Large",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_attack_gun_lrg_plr_01.wav",
	"viper/shared/melee/melee_attack_gun_lrg_plr_02.wav",
	"viper/shared/melee/melee_attack_gun_lrg_plr_03.wav",
	"viper/shared/melee/melee_attack_gun_lrg_plr_04.wav",
	"viper/shared/melee/melee_attack_gun_lrg_plr_05.wav",
	"viper/shared/melee/melee_attack_gun_lrg_plr_06.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.Miss_Medium",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_attack_gun_med_plr_01.wav",
	"viper/shared/melee/melee_attack_gun_med_plr_02.wav",
	"viper/shared/melee/melee_attack_gun_med_plr_03.wav",
	"viper/shared/melee/melee_attack_gun_med_plr_04.wav",
	"viper/shared/melee/melee_attack_gun_med_plr_05.wav",
	"viper/shared/melee/melee_attack_gun_med_plr_06.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.Miss_Small",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_attack_gun_sml_plr_01.wav",
	"viper/shared/melee/melee_attack_gun_sml_plr_02.wav",
	"viper/shared/melee/melee_attack_gun_sml_plr_03.wav",
	"viper/shared/melee/melee_attack_gun_sml_plr_04.wav",
	"viper/shared/melee/melee_attack_gun_sml_plr_05.wav",
	"viper/shared/melee/melee_attack_gun_sml_plr_06.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.World_Large",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_world_gun_lrg_polymer_cement_plr_01.wav",
	"viper/shared/melee/melee_world_gun_lrg_polymer_cement_plr_02.wav",
	"viper/shared/melee/melee_world_gun_lrg_polymer_cement_plr_03.wav",
	"viper/shared/melee/melee_world_gun_lrg_polymer_cement_plr_04.wav",
	"viper/shared/melee/melee_world_gun_lrg_polymer_cement_plr_05.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.World_Medium",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_world_gun_med_polymer_cement_plr_01.wav",
	"viper/shared/melee/melee_world_gun_med_polymer_cement_plr_02.wav",
	"viper/shared/melee/melee_world_gun_med_polymer_cement_plr_03.wav",
	"viper/shared/melee/melee_world_gun_med_polymer_cement_plr_04.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.World_Small",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_world_gun_sml_polymer_cement_plr_01.wav",
	"viper/shared/melee/melee_world_gun_sml_polymer_cement_plr_02.wav",
	"viper/shared/melee/melee_world_gun_sml_polymer_cement_plr_03.wav",
	"viper/shared/melee/melee_world_gun_sml_polymer_cement_plr_04.wav",
	"viper/shared/melee/melee_world_gun_sml_polymer_cement_plr_05.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.Flesh_Large",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_character_gun_lrg_steel_plr_01.wav",
	"viper/shared/melee/melee_character_gun_lrg_steel_plr_02.wav",
	"viper/shared/melee/melee_character_gun_lrg_steel_plr_03.wav",
	"viper/shared/melee/melee_character_gun_lrg_steel_plr_04.wav",
	"viper/shared/melee/melee_character_gun_lrg_steel_plr_05.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.Flesh_Medium",
	channel = 		CHAN_WEAPON +10,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_character_gun_med_steel_plr_01.wav",
	"viper/shared/melee/melee_character_gun_med_steel_plr_02.wav",
	"viper/shared/melee/melee_character_gun_med_steel_plr_03.wav",
	"viper/shared/melee/melee_character_gun_med_steel_plr_04.wav",
	"viper/shared/melee/melee_character_gun_med_steel_plr_05.wav",
	}
})

sound.Add({
	name = 			"MW_Melee.Flesh_Small",
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			{
	"viper/shared/melee/melee_character_gun_sml_steel_plr_01.wav",
	"viper/shared/melee/melee_character_gun_sml_steel_plr_02.wav",
	"viper/shared/melee/melee_character_gun_sml_steel_plr_03.wav",
	"viper/shared/melee/melee_character_gun_sml_steel_plr_04.wav",
	"viper/shared/melee/melee_character_gun_sml_steel_plr_05.wav",
	}
})


sound.Add({
    name =          "MW_Fist.Miss",
    channel =       CHAN_WEAPON,
    volume =        1.0,
    sound =             {
    "viper/shared/melee/melee_attack_fist_plr_01.ogg",
    "viper/shared/melee/melee_attack_fist_plr_02.ogg",
    "viper/shared/melee/melee_attack_fist_plr_03.ogg",
    "viper/shared/melee/melee_attack_fist_plr_04.ogg",
    "viper/shared/melee/melee_attack_fist_plr_05.ogg",
    "viper/shared/melee/melee_attack_fist_plr_06.ogg",
    "viper/shared/melee/melee_attack_fist_plr_07.ogg",
    "viper/shared/melee/melee_attack_fist_plr_08.ogg",
    }
})

sound.Add({
    name =          "MW_Fist.HitPlayer",
    channel =       CHAN_WEAPON,
    volume =        1.0,
    sound =             {
    "viper/shared/melee/melee_character_fist_plr_01.ogg",
    "viper/shared/melee/melee_character_fist_plr_02.ogg",
    "viper/shared/melee/melee_character_fist_plr_03.ogg",
    "viper/shared/melee/melee_character_fist_plr_04.ogg",
    "viper/shared/melee/melee_character_fist_plr_05.ogg",
    "viper/shared/melee/melee_character_fist_plr_06.ogg",
    "viper/shared/melee/melee_character_fist_plr_07.ogg",
    "viper/shared/melee/melee_character_fist_plr_08.ogg",    
    "viper/shared/melee/melee_character_fist_plr_09.ogg",
    "viper/shared/melee/melee_character_fist_plr_10.ogg",
    "viper/shared/melee/melee_character_fist_plr_11.ogg",
    }
})

sound.Add({
    name =          "MW_Fist.HitWorld",
    channel =       CHAN_WEAPON,
    volume =        1.0,
    sound =             {
    "viper/shared/melee/melee_world_fist_soft_plr_01.ogg",
    "viper/shared/melee/melee_world_fist_soft_plr_02.ogg",
    "viper/shared/melee/melee_world_fist_soft_plr_03.ogg",
    "viper/shared/melee/melee_world_fist_soft_plr_04.ogg",
    "viper/shared/melee/melee_world_fist_soft_plr_05.ogg",
    }
})

sound.Add({
    name =          "MW.Explosion",
    channel =       CHAN_WEAPON,
    volume =        1.0,
    soundlevel =  SNDLVL_NONE,
    sound =             {
    "viper/shared/rocket_expl_body_01.wav",
    "viper/shared/rocket_expl_body_02.wav",
    "viper/shared/rocket_expl_body_03.wav",
    "viper/shared/rocket_expl_body_04.wav"} 
})

sound.Add({
    name =          "MW.Rocket_Fly_Loop",
    channel =       CHAN_WEAPON,
    volume =        1.0,
    soundlevel =   SNDLVL_NONE,
    sound =             {
    "^viper/shared/move_rpapa7_proj_flame_cls.wav"}
})


----- CASINGS -----


sound.Add({
    name =          "MW_Casings.9mm",
    channel =       CHAN_CASINGS,
    volume =        1.0,
    soundlevel =   SNDLVL_75db,
    sound =             {
    "viper/shared/casings/blt_case_bounce_9_cement_close_lrg_01.ogg",
    "viper/shared/casings/blt_case_bounce_9_cement_close_lrg_02.ogg",
    "viper/shared/casings/blt_case_bounce_9_cement_close_lrg_03.ogg",
    "viper/shared/casings/blt_case_bounce_9_cement_close_lrg_04.ogg"}
})

sound.Add({
    name =          "MW_Casings.556",
    channel =       CHAN_CASINGS,
    volume =        1.0,
    soundlevel =   SNDLVL_75db,
    sound =             {
    "viper/shared/casings/blt_case_bounce_556_cement_close_lrg_01.ogg",
    "viper/shared/casings/blt_case_bounce_556_cement_close_lrg_02.ogg",
    "viper/shared/casings/blt_case_bounce_556_cement_close_lrg_03.ogg"}
})

sound.Add({
    name =          "MW_Casings.Shotgun",
    channel =       CHAN_CASINGS,
    volume =        1.0,
    soundlevel =   SNDLVL_75db,
    sound =             {
    "viper/shared/casings/blt_case_bounce_shotgun_cement_close_lrg_01.ogg",
    "viper/shared/casings/blt_case_bounce_shotgun_cement_close_lrg_02.ogg",
    "viper/shared/casings/blt_case_bounce_shotgun_cement_close_lrg_03.ogg"}
})

sound.Add({
    name =          "MW_Casings.338",
    channel =       CHAN_CASINGS,
    volume =        1.0,
    soundlevel =   SNDLVL_75db,
    sound =             {
    "viper/shared/casings/blt_case_bounce_338_cement_close_lrg_01.ogg",
    "viper/shared/casings/blt_case_bounce_338_cement_close_lrg_02.ogg",
    "viper/shared/casings/blt_case_bounce_338_cement_close_lrg_03.ogg",
    "viper/shared/casings/blt_case_bounce_338_cement_close_lrg_05.ogg"}
})

sound.Add({
    name =          "MW_Casings.308",
    channel =       CHAN_CASINGS,
    volume =        1.0,
    soundlevel =   SNDLVL_75db,
    sound =             {
    "viper/shared/casings/blt_case_bounce_308_cement_close_lrg_01.ogg",
    "viper/shared/casings/blt_case_bounce_308_cement_close_lrg_02.ogg",
    "viper/shared/casings/blt_case_bounce_308_cement_close_lrg_03.ogg",
    "viper/shared/casings/blt_case_bounce_308_cement_close_lrg_04.ogg"} 
})



sound.Add({
    name =          "MW_MagazineDrop.AK.Metal",
    channel =       CHAN_MAGAZINEDROP,
    volume =        1.0,
    sound =             {
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_metal_concrete_01.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_metal_concrete_02.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_metal_concrete_03.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_metal_concrete_04.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_metal_concrete_05.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_metal_concrete_06.ogg",
    }
})

sound.Add({
    name =          "MW_MagazineDrop.AK.Poly",
    channel =       CHAN_MAGAZINEDROP,
    volume =        1.0,
    sound =             {
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_poly_concrete_01.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_poly_concrete_02.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_poly_concrete_03.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_poly_concrete_04.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_poly_concrete_05.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ak_poly_concrete_06.ogg",
    }
})

sound.Add({
    name =          "MW_MagazineDrop.AR.Metal",
    channel =       CHAN_MAGAZINEDROP,
    volume =        1.0,
    sound =             {
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_metal_concrete_01.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_metal_concrete_02.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_metal_concrete_03.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_metal_concrete_04.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_metal_concrete_05.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_metal_concrete_06.ogg",
    }
})

sound.Add({
    name =          "MW_MagazineDrop.AR.Poly",
    channel =       CHAN_MAGAZINEDROP,
    volume =        1.0,
    sound =             {
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_poly_concrete_01.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_poly_concrete_02.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_poly_concrete_03.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_poly_concrete_04.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_poly_concrete_05.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_ar_poly_concrete_06.ogg",
    }
})

sound.Add({
    name =          "MW_MagazineDrop.Drum",
    channel =       CHAN_MAGAZINEDROP,
    volume =        1.0,
    sound =             {
    "viper/shared/magazine_drops/iw8_phys_mag_drop_large_drum_concrete_01.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_large_drum_concrete_02.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_large_drum_concrete_03.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_large_drum_concrete_04.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_large_drum_concrete_05.ogg",
    }
})

sound.Add({
    name =          "MW_MagazineDrop.SMG.Metal",
    channel =       CHAN_MAGAZINEDROP,
    volume =        1.0,
    sound =             {
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_metal_concrete_01.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_metal_concrete_02.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_metal_concrete_03.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_metal_concrete_04.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_metal_concrete_05.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_metal_concrete_06.ogg",
    }
})

sound.Add({
    name =          "MW_MagazineDrop.SMG.Poly",
    channel =       CHAN_MAGAZINEDROP,
    volume =        1.0,
    sound =             {
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_poly_concrete_01.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_poly_concrete_02.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_poly_concrete_03.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_poly_concrete_04.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_poly_concrete_05.ogg",
    "viper/shared/magazine_drops/iw8_phys_mag_drop_smg_poly_concrete_06.ogg",
    }
})

sound.Add({
    name =          "Impact.Riotshield",
    channel =       CHAN_AUTO,
    volume =        1.0,
    sound =             {
    "viper/shared/impact_riotshield_01.ogg",
    "viper/shared/impact_riotshield_02.ogg",
    "viper/shared/impact_riotshield_03.ogg",
    "viper/shared/impact_riotshield_04.ogg",
    "viper/shared/impact_riotshield_05.ogg",
     }
})

sound.Add({
    name =          "Canted.On",
    channel =       CHAN_WPNFOLEY,
    volume =        0.5,
    sound =             {
    "viper/shared/foley/wfoly_plr_hybrid_scope_side_on.ogg",
     }
})
sound.Add({
    name =          "Canted.Off",
    channel =       CHAN_WPNFOLEY,
    volume =        0.5,
    sound =             {
    "viper/shared/foley/wfoly_plr_hybrid_scope_side_off.ogg",
     }
})

sound.Add({
    name =          "Flipsight.Up",
    channel =       CHAN_WPNFOLEY,
    volume =        1.0,
    sound =             {
    "viper/shared/foley/wpfoly_hybrid_toggle_on.ogg",
     }
})
sound.Add({
    name =          "Flipsight.Down",
    channel =       CHAN_WPNFOLEY,
    volume =        1.0,
    sound =             {
    "viper/shared/foley/wpfoly_hybrid_flip_down_v1.ogg",
     }
})