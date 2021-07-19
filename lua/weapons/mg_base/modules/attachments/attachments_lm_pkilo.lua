AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_lm_pkilo_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_lm_pkilo_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

-- MW_ATT_KEYS["attachment_vm_ar_akilo47_xmags"] = {
--     Name = "40 Round Mags",
--     Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_ar_akilo47_xmags.mdl"),
--     Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_xmags_akilo47_v11.vmt"),
--     Stats = function(self)
--         self.Primary.ClipSize = 40
--         self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
--         self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
--     end
-- }

-- MW_ATT_KEYS["attachment_vm_ar_akilo47_smgmag"] = {
--     Name = "5.45x39mm 30-Round Mags",
--     Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_ar_akilo47_smgmag.mdl"),
--     Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_smgmag_akilo47.vmt"),
--     Stats = function(self)
--         self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.04
--         self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.04
--         self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.05
--         self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.05
--         self.Primary.ClipSize = 30
--         self.Primary.RPM = 650
--     end
-- }

-- MW_ATT_KEYS["attachment_vm_ar_akilo47_drum_mag"] = {
--     Name = "75 Round Mags",
--     Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_ar_akilo47_drum_mag.mdl"),
--     Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_drums_akilo47.vmt"),
--     Stats = function(self)
--         self.Primary.ClipSize = 75
--         self.Animations.Reload = self.Animations.Reload_XmagLrg
--         self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
--         self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
--         self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
--         self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
--         self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
--     end
-- }

MW_ATT_KEYS["attachment_vm_lm_pkilo_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_lm_pkilo_barrel.mdl"),
}

MW_ATT_KEYS["attachment_vm_lm_pkilo_barrel_heavy"] = {
    Name = "Spetsnaz Elite",
    Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_lm_pkilo_barrel_heavy.mdl"),
    Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_custombarrel_akilo47.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.2
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.2
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.925
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.925
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.925
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.925
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95 
    end
}

MW_ATT_KEYS["attachment_vm_lm_pkilo_barrel_long"] = {
    Name = "23.0 Romanian",
    Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_lm_pkilo_barrel_long.mdl"),
    Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_gripvert_akilo47.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.35
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.35
        self.Cone.Hip =  self.Cone.Hip * 1.13
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.95
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.95
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.95
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.95
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.93
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.93 
        self.HoldType = "RifleWithVerticalGrip"
    end
}

MW_ATT_KEYS["attachment_vm_lm_pkilo_barrel_short"] = {
    Name = "23.0 RPK Barrel",
    Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_lm_pkilo_barrel_short.mdl"),
    Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_lmgbarrel_akilo47.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.35
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.35
        self.Cone.Hip =  self.Cone.Hip * 1.13
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.93
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.93
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.93
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.93
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95 
    end
}


MW_ATT_KEYS["attachment_vm_lm_pkilo_stock"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_lm_pkilo_stock.mdl"),
    Stats = function(self)
    end
}

-- MW_ATT_KEYS["attachment_vm_ar_akilo47_lmgstock"] = {
--     Name = "Field LMG Stock",
--     Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_ar_akilo47_lmgstock.mdl"),
--     Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_stocklmg_akilo47.vmt"),
--     Stats = function(self)
--         self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
--         self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94
--         self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.91
--         self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.91
--         self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.91
--         self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.91
--     end
-- }

-- MW_ATT_KEYS["attachment_vm_ar_akilo47_smgstock_unfolded"] = {
--     Name = "Skeleton Stock",
--     Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_ar_akilo47_smgstock_unfolded.mdl"),
--     Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_smgstock_unfolded_akilo47.vmt"),
--     Stats = function(self)
--         self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.13
--         self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.13 
--         self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.96
--         self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.96
--         self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.96
--         self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.96
--     end
-- }

-- MW_ATT_KEYS["attachment_vm_ar_akilo47_smgstock"] = {
--     Name = "Skeleton Stock Folded",
--     Model = Model("models/viper/mw/attachments/pkilo/attachment_vm_ar_akilo47_smgstock.mdl"),
--     Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_smgstock_akilo47.vmt"),
--     Stats = function(self)
--         self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.25
--         self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.25 
--         self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.13
--         self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.13
--         self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.13
--         self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.13
--     end
-- }

-- MW_ATT_KEYS["attachment_vm_ar_akilo47_stockno"] = {
--     Name = "No Stock",
--     Icon = Material("viper/mw/attachments/icons/akilo47/icon_attachment_stockno_akilo47.vmt"),
--     Stats = function(self)
--         self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.42
--         self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.42
--         self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.33
--         self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.33
--         self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.33
--         self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.33
--     end
-- }