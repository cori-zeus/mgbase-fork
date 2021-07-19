AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_ar_falpha_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_xmags"] = {
    Name = "50 Round Mags",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_xmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 50
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_Xmag
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_Xmag_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_xmags2"] = {
    Name = "60 Round Mags",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_xmags2.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_xmags2.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 60
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_barrel_muzzle"] = {
    Name = "Compensator",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_barrel_muzzle.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_muzzle.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97 
        self.Cone.Hip =  self.Cone.Hip * 0.96
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.95
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.95
    end 
}

MW_ATT_KEYS["attachment_vm_ar_falpha_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_barrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_pi_mike1911_v1_slide.vmt")
}

MW_ATT_KEYS["attachment_vm_ar_falpha_barlong2"] = {
    Name = "TAC FORGE Ultralight",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_barlong2.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_barlong2.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.075
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.075
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.2
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.2
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97 
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_barrellong_alt"] = {
    Name = "FR 24.4 Sniper",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_barrellong_alt.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_barrellong.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.35
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.35
        self.Cone.Hip =  self.Cone.Hip * 1.3
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.85
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.85
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.85
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.85
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94 
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_barshort"] = {
    Name = "FR 15.9 Commando",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_barshort.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_barshort.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.9
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.075
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.075
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.075
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.075
        self.Cone.Hip =  self.Cone.Hip * 0.98
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.04
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.04 
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_stock"] = {
    Name = "Default",
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_stock_light"] = {
    Name = "FR Ultralight Hollow",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_stock_light.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_stock_light_v1.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.96
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.96
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.96
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.96
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.075
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.075 
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_stock_stable"] = {
    Name = "FSS Tac-Wrap",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_stock_stable.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_stock_stable_v1.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.937
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.937
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.937
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.937
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.96
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.96 
    end
}

MW_ATT_KEYS["attachment_vm_ar_falpha_stock_tactical_v1"] = {
    Name = "FORGE TAC Ballast Pack",
    Model = Model("models/viper/mw/attachments/falpha/attachment_vm_ar_falpha_stock_tactical_v1.mdl"),
    Icon = Material("viper/mw/attachments/icons/falpha/icon_attachment_ar_falpha_stock_tactical_v1.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.9
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.9
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.9
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.9
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.945
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.945 
    end
}