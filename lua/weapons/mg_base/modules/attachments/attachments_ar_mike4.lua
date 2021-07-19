AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_ar_mike4_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_calsmg"] = {
    Name = "9mm Para 32-Round Mags",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_calsmg.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_ar_mike4_calsmg.vmt"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload_Calsmg
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_Calsmg
        self.Animations.Reload_Fast = self.Animations.Reload_Calsmg_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_Calsmg_Fast
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.9
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Cone.Hip =  self.Cone.Hip * 0.91
        self.Primary.RPM = self.Primary.RPM * 1.25
        self.Recoil.Shake = self.Recoil.Shake * 0.7
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_xmags"] = {
    Name = "50 Round Mags",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_ar_mike4_xmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 50
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_Xmag_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.92
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.92
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_mag_v5"] = {
    Name = ".458 SOCOM 10-Round Mags",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_mag_v5.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_ar_mike4_mag_v5.vmt"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_carryhandle"] = {
    Name = "Carry Handle",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_carryhandle.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_ar_mike4_carryhandle.vmt"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_carryhandle_v18"] = {
    Name = "Carry Handle",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_carryhandle_v18.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_ar_mike4_carryhandle.vmt"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_xmags2"] = {
    Name = "60 Round Mags",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_xmags2.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_ar_mike4_xmags2.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 60
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_barrel.mdl")
}

MW_ATT_KEYS["attachment_vm_ar_mike4_custombarrel"] = {
    Name = "Corvus Custom Marksman",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_custombarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_barcust_mike4.vmt"),
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

MW_ATT_KEYS["attachment_vm_ar_mike4_mike203barrel"] = {
    Name = "Stock M16 Grenadier",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_mike203barrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_barmid_mike4.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.4
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.4
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.83
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.83
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.83
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.83
        self.Cone.Hip =  self.Cone.Hip * 1.35
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.93
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.93
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_shortbarrel"] = {
    Name = "FSS 11.5 Commando",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_shortbarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_barshort_mike4.vmt"),
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

MW_ATT_KEYS["attachment_vm_ar_mike4_barrel_v3_alt"] = {
    Name = "FSS 14.5 Tac Lite",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_barrel_v3_alt.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_bar_mike4_v03.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.9
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.93
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.93
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.93
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.93
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_barsil"] = {
    Name = "FSS 12.4 Predator",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_barsil.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_ar_mike4_barsil.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.9
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.93
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.93
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.93
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.93
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_stock"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_stock.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_stockno"] = {
    Name = "No Stock",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_stockno.mdl"),
    Icon = Material("viper/mw/attachments/icons/stock/icon_attachment_stock_no.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.1
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.1
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.1
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.1
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.16
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.16
    end
}

MW_ATT_KEYS["attachment_vm_ar_mike4_customstock"] = {
    Name = "M-16 Stock",
    Model = Model("models/viper/mw/attachments/mike4/attachment_vm_ar_mike4_customstock.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike4/icon_attachment_stockcust_mike4.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.89
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.89
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.89
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.89
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.89
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.89
    end
}