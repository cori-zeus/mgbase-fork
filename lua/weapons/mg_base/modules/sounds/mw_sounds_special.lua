AddCSLuaFile()

--- DBLMG ---
sound.Add({
    name =           "mw19.dblmg.fire",
    channel =        CHAN_MINIGUNFIRE,
    volume =         1,
    pitch = {80,110},
    sound = {"viper/weapons/dblmg/weap_kilo121_fire_plr_01.wav",
             "viper/weapons/dblmg/weap_kilo121_fire_plr_02.wav",
             "viper/weapons/dblmg/weap_kilo121_fire_plr_03.wav",
             "viper/weapons/dblmg/weap_kilo121_fire_plr_04.wav",
             "viper/weapons/dblmg/weap_kilo121_fire_plr_05.wav",
             "viper/weapons/dblmg/weap_kilo121_fire_plr_06.wav"
            }              
})



sound.Add({
    name =           "mw19.dblmg.spin.up",
    channel =        CHAN_WEAPON,
    volume =         1,
    sound = {"viper/weapons/dblmg/weap_dblmg_spinup_plr_01.wav"}              
})
sound.Add({
    name =           "mw19.dblmg.spin.loop",
    channel =        CHAN_WEAPON,
    volume =         1,
    sound = {"viper/weapons/dblmg/weap_dblmg_spinloop_plr.wav"}              
})
sound.Add({
    name =           "mw19.dblmg.spin.down",
    channel =        CHAN_WEAPON,
    volume =         1,
    sound = {"viper/weapons/dblmg/weap_dblmg_spindown_plr_01.wav"}              
})



sound.Add({
    name =           "mw19.dblmg.inspect.1",
    channel =        CHAN_WPNFOLEY,
    volume =         1,
    sound = {"viper/weapons/dblmg/wfoly_lm_dblmg_inspect_01.wav"}              
})
sound.Add({
    name =           "mw19.dblmg.inspect.2",
    channel =        CHAN_WPNFOLEY,
    volume =         1,
    sound = {"viper/weapons/dblmg/wfoly_lm_dblmg_inspect_02.wav"}              
})
sound.Add({
    name =           "mw19.dblmg.inspect.3",
    channel =        CHAN_WPNFOLEY,
    volume =         1,
    sound = {"viper/weapons/dblmg/wfoly_lm_dblmg_inspect_03.wav"}              
})



--- Mike32 ---
sound.Add({
    name =           "mw19.mike32.fire",
    channel =        CHAN_WEAPON,
    volume =         0.75,
    pitch = {90,110},
    sound = {"viper/weapons/mike32/weap_mike203_fire_plr_01.ogg",
             "viper/weapons/mike32/weap_mike203_fire_plr_02.ogg",
             "viper/weapons/mike32/weap_mike203_fire_plr_03.ogg",
             "viper/weapons/mike32/weap_mike203_fire_plr_04.ogg"
            }              
})



sound.Add({
    name =           "mw19.m32.raise.first.1",
    channel =        CHAN_WPNFOLEY +1,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_raise_first_up.ogg"}              
})
sound.Add({
    name =           "mw19.m32.raise.first.2",
    channel =        CHAN_WPNFOLEY +2,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_raise_first_close_01.ogg"}              
})
sound.Add({
    name =           "mw19.m32.raise.first.3",
    channel =        CHAN_WPNFOLEY +3,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_raise_first_settle.ogg"}              
})



sound.Add({
    name =           "wfoly_plr_la_mike32_reload_01",
    channel =        CHAN_WPNFOLEY +1,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_open_01.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_02",
    channel =        CHAN_WPNFOLEY +2,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_start.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_03",
    channel =        CHAN_WPNFOLEY +3,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_smack.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_04",
    channel =        CHAN_WPNFOLEY +4,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_shellsout_01.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_05",
    channel =        CHAN_WPNFOLEY +5,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_grab.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_06",
    channel =        CHAN_WPNFOLEY +6,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_rattle.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_07",
    channel =        CHAN_WPNFOLEY +7,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_armup.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_08",
    channel =        CHAN_WPNFOLEY +8,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_shellsin_01.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_09",
    channel =        CHAN_WPNFOLEY +9,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_cylinder_01.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_10",
    channel =        CHAN_WPNFOLEY +10,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_armdown.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_11",
    channel =        CHAN_WPNFOLEY +11,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_grab2.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_12",
    channel =        CHAN_WPNFOLEY +12,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_close_01.ogg"}              
})
sound.Add({
    name =           "wfoly_plr_la_mike32_reload_13",
    channel =        CHAN_WPNFOLEY +13,
    volume =         1,
    sound = {"viper/weapons/mike32/wfoly_plr_la_mike32_reload_end.ogg"}              
})