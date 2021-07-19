AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_pi_papa320_slide_black"] = {
    Name = "XRK L Super",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_papa320_slide_black.mdl"),
    Icon = Material("viper/mw/attachments/icons/icon_attachment_pi_papa320_slide.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.4
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.1
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.15
        self.Cone.Hip =  self.Cone.Hip * 0.785
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_pi_papa320_slide_vented"] = {
    Name = "A9-16 Lightweight",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_papa320_slide_vented.mdl"),
    Icon = Material("viper/mw/attachments/icons/icon_attachment_pi_papa320_slide.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.83
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.95
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.3
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.3
    end
}

MW_ATT_KEYS["attachment_vm_pi_papa320_barrel_ext"] = {
    Name = "XRK V Extended",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_papa320_barrel_ext.mdl"),
    Icon = Material("viper/mw/attachments/icons/icon_attachment_pi_papa320_barrel_ext.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.4
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.1
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.15
        self.Cone.Hip =  self.Cone.Hip * 0.785
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_pi_papa320_slide"] = {
    Name = "Default Slide",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_papa320_slide.mdl"),
    Icon = Material("viper/mw/attachments/icons/icon_attachment_pi_papa320_slide.vmt")
}

MW_ATT_KEYS["attachment_vm_pi_papa320_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_papa320_mag.mdl"),
    Icon = Material("viper/mw/attachments/icons/icon_attachment_pi_papa320_mag.vmt"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_pi_papa320_mag_ext"] = {
    Name = "21 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_papa320_mag_ext.mdl"),
    Icon = Material("viper/mw/attachments/icons/icon_attachment_pi_papa320_mag_ext.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 21
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_Xmag_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_pi_papa320_mag_ext2"] = {
    Name = "32 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_papa320_mag_ext2.mdl"),
    Icon = Material("viper/mw/attachments/icons/icon_attachment_pi_papa320_mag_ext2.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 32
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
    end
}