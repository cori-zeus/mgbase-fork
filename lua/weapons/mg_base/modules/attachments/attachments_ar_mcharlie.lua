AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_ar_mcharlie_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_magsub"] = {
    Name = ".300 Blackout 30-Round Mags",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_magsub.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_magsub.vmt"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.3
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.2
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.2
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.2
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.2
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.23
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.23
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_xmags"] = {
    Name = "50 Round Mags",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/kilo433/icon_attachment_ar_kilo433_xmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 50
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_Xmag_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.93
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.93
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_xmags2"] = {
    Name = "60 Round Mags",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_xmags2.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_xmags2_clip.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 60
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Hip =  self.Cone.Hip * 1.025
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_barrel.mdl")
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_shortbarrel"] = {
    Name = "Tempus Mini",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_shortbarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_shortbarrel.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.8
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.8
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.15
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.15
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.15
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.15
        self.Cone.Hip =  self.Cone.Hip * 0.96
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.08
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.08
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_longbarrel"] = {
    Name = "Tempus Marksman",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_longbarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_longbarrel.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.35
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.35
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.85
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.85
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.85
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.85
        self.Cone.Hip =  self.Cone.Hip * 1.3
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_suppressorbarrel"] = {
    Name = "Tempus Cyclone",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_suppressorbarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_suppressorbarrel.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.15
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.15
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_stock"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_stock.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_mcharlie_lightstock"] = {
    Name = "M13 Skeleton Stock",
    Model = Model("models/viper/mw/attachments/mcharlie/attachment_vm_ar_mcharlie_lightstock.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_lightstock.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.12
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.12
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.94
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.94
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.94
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.94
    end
}