AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_magazine_g3_custom"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/attachment_vm_magazine_g3_custom.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_magazine_ext_g3_custom"] = {
    Name = "30 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_magazine_ext_g3_custom.mdl"),
    Icon = Material("viper/mw/attachments/icons/scharlie/icon_attachment_ar_scharlie_mmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 30
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
        self.Cone.Hip =  self.Cone.Hip * 0.95
    end
}