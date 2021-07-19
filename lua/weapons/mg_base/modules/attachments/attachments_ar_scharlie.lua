AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_ar_scharlie_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_ar_scharlie_mmags"] = {
    Name = "25 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_mmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_mmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 25
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
    end
}

MW_ATT_KEYS["attachment_vm_ar_scharlie_xmags"] = {
    Name = "30 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_mag_ext.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 30
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.93
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.93
    end
}

MW_ATT_KEYS["attachment_vm_ar_scharlie_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_barrel.mdl"),
}

MW_ATT_KEYS["attachment_vm_ar_scharlie_barrel_long"] = {
    Name = "FORGE TAC 20.0 LB",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_barrel_long.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_barrel_long.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.35
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

MW_ATT_KEYS["attachment_vm_ar_scharlie_barrel_mid"] = {
    Name = "FORGE TAC 17.2",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_barrel_mid.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_barrel_mid.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.26
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.263
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.263
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.888
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.888
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.888
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.888
        self.Cone.Hip =  self.Cone.Hip * 1.225
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95 
    end
}

MW_ATT_KEYS["attachment_vm_ar_scharlie_barrel_pdw"] = {
    Name = "FORGE TAC CQC Pro",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_barrel_pdw.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_barrel_pdw.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.92
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

MW_ATT_KEYS["attachment_vm_ar_scharlie_stock"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_stock.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_scharlie_stock_dmr"] = {
    Name = "XRK Obelisk Pro",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_stock_dmr.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_stock_dmr.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.92
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.92
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.94
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.94
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.94
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.94
    end
}

MW_ATT_KEYS["attachment_vm_ar_scharlie_stock_light"] = {
    Name = "FTAC Collapsible Stock",
    Model = Model("models/viper/mw/attachments/attachment_vm_ar_scharlie_stock_light.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_stock_light.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.15
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.15 
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.2
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.2
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.2
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.2
    end
}