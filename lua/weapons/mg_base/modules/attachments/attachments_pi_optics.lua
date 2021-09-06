AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_holo_east"] = {
    Name = "APX5 Holographic Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_holo_east.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_holo_east.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_holo_east_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 6, 
        ParallaxSize = 450, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_holo_default2.vmt"),
        Size = 800,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Zoom.ViewModelFovMultiplier = 0.9
        self.Zoom.FovMultiplier = 0.7
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.15
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94
        self.Zoom.ViewModelFovMultiplier = 0.9
        self.Zoom.FovMultiplier = 0.85
    end
}

MW_ATT_KEYS["attachment_vm_4x_east"] = {
    Name = "VLK 3.0x Optic",
    Model = Model("models/viper/mw/attachments/attachment_vm_4x_east.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_4x_east.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_4x_east_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 0, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_acog_default2.vmt"),
        Size = 700,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.15
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.91
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.91
        self.Zoom.ViewModelFovMultiplier = 0.8
        self.Zoom.FovMultiplier = 0.7
    end
}

MW_ATT_KEYS["attachment_vm_4x_west"] = {
    Name = "Scout Combat Optic",
    Model = Model("models/viper/mw/attachments/attachment_vm_4x_west.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_4x_west.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_4x_west_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 450, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_holo_default.vmt"),
        Size = 850,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.15
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.92
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.92
        self.Zoom.ViewModelFovMultiplier = 0.8
        self.Zoom.FovMultiplier = 0.7
    end
}

MW_ATT_KEYS["attachment_vm_4x_west02"] = {
    Name = "Cronen C480 Pro Optic",
    Model = Model("models/viper/mw/attachments/attachment_vm_4x_west02.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_4x_west02.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_4x_west02_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 250, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_holo_default.vmt"),
        Size = 950,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.15
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Zoom.ViewModelFovMultiplier = 0.8
        self.Zoom.FovMultiplier = 0.7
    end
}