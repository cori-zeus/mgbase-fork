AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_ar_falima_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_mmags"] = {
    Name = "24 Round Mags",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_mmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/falima/icon_attachment_ar_falima_mmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 25
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_xmags"] = {
    Name = "30 Round Mags",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/falima/icon_attachment_ar_falima_xmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 30
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.91
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.91
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_barrel_muzzle"] = {
    Name = "Muzzlebrake",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_barrel_muzzle.mdl"),
    Icon = Material("viper/mw/attachments/icons/falima/icon_attachment_ar_falima_muzzle.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.96
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.96
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.96
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.96
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_barrel.mdl"),
}

MW_ATT_KEYS["attachment_vm_ar_falima_barlong"] = {
    Name = "18.0 Ultralight",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_barlong.mdl"),
    Icon = Material("viper/mw/attachments/icons/falima/icon_attachment_ar_falima_barlong.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.263
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.263
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.88
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.88
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.88
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.88
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94 
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_barsmg"] = {
    Name = "13.0 OSW Para",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_barsmg.mdl"),
    Icon = Material("viper/mw/attachments/icons/falima/icon_attachment_ar_falima_barsmg.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.9
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.94
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.12
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.12
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.12
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.12
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.15
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.15 
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_stock"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_stock.mdl"),
    Icon = Material("viper/mw/attachments/icons/falima/icon_attachment_ar_asierra12_barlong.vmt"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_nostock"] = {
    Name = "No Stock",
    Icon = Material("viper/mw/attachments/icons/stock/icon_attachment_stock_no.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.4
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.4 
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.24
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.24
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.24
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.24
    end
}

MW_ATT_KEYS["attachment_vm_ar_falima_stockl"] = {
    Name = "Factory 18 Aluminum Stock",
    Model = Model("models/viper/mw/attachments/falima/attachment_vm_ar_falima_stockl.mdl"),
    Icon = Material("viper/mw/attachments/icons/falima/icon_attachment_ar_falima_stockl.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.13
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.13
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.94
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.94
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.94
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.94
    end
}