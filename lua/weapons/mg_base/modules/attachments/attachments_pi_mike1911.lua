AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_pi_mike1911_v1_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_v1_mag.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_v1_mag.vmt"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike1911_mmags"] = {
    Name = "10 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_mmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_mmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = self.Primary.ClipSize + 3
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_Xmag_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
        self.Cone.Hip =  self.Cone.Hip * 1.025
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike1911_xmags"] = {
    Name = "15 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_xmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = self.Primary.ClipSize + 8
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.8
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.8
        self.Cone.Hip =  self.Cone.Hip * 1.05
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike1911_muzzlebrake"] = {
    Name = "Muzzle Brake",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_muzzlebrake.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_muzzlebrake.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9 
        self.Cone.Hip =  self.Cone.Hip * 0.8
        self.Cone.Ads =  self.Cone.Ads * 1.03
    end 
}

MW_ATT_KEYS["attachment_vm_pi_mike1911_v1_slide"] = {
    Name = "Default Slide",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_v1_slide.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_v1_slide.vmt")
}

MW_ATT_KEYS["attachment_vm_pi_mike1911_barlong"] = {
    Name = ".45 Match Grade",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_barlong.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_barlong.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.3
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.05
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.03
        self.Cone.Hip =  self.Cone.Hip * 0.8
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9 
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike1911_barshort"] = {
    Name = ".45 Compact",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_barshort.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_barshort.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.3
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.05
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.03
        self.Cone.Hip =  self.Cone.Hip * 1.1
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.3
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.3 
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike1911_v2_slide"] = { 
    Name = "1911 Stalker",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike1911_v2_slide.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike1911/icon_attachment_pi_mike1911_v2_slide.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.6
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.15
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.1
        self.Cone.Hip =  self.Cone.Hip * 0.9
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.7
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.7 
    end
}