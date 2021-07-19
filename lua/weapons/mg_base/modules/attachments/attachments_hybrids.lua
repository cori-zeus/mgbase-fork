
MW_ATT_KEYS["attachment_vm_hybrid_west"] = {
    Name = "Integral Hybrid",
    Model = Model("models/viper/mw/attachments/attachment_vm_hybrid_west.mdl"),
    Icon = Material("viper/mw/attachments/icons/hybrid/icon_attachment_hybrid_west_lw.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_hybrid_west_lens_scope.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 250, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_acog_default3.vmt"),
        Size = 600,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    ReticleHybrid = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle2"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.68
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.86
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.81
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}

MW_ATT_KEYS["attachment_vm_hybrid_west02"] = {
    Name = "4.0x Flip Hybrid",
    Model = Model("models/viper/mw/attachments/attachment_vm_hybrid_west02.mdl"),
    Icon = Material("viper/mw/attachments/icons/hybrid/icon_attachment_hybrid_west02_lw.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_hybrid_west02_magnifier_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 250, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_acog_default3.vmt"),
        Size = 600,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    ReticleHybrid = {
        Material = Material("viper/mw/reticles/reticle_holo_default.vmt"),
        Size = 700,
        Color = Color(255, 255, 255, 255),
        OnAnimation = "HybridOn",
        OffAnimation = "HybridOff",
        Attachment = "reticle2"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.47
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.87
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}

MW_ATT_KEYS["attachment_vm_hybrid_west03"] = {
    Name = "Canted Hybrid",
    Model = Model("models/viper/mw/attachments/attachment_vm_hybrid_west03.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_4x_west02.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_4x_west02_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 250, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_acog_default3.vmt"),
        Size = 600,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    ReticleHybrid = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle2"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.78
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.87
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.78
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}


MW_ATT_KEYS["attachment_vm_thermal_hybrid"] = {
    Name = "Thermal Hybrid",
    Model = Model("models/viper/mw/attachments/attachment_vm_thermal_hybrid.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_thermal_east.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_thermal_east_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 250, --a value of zero means 1:1 size with the end of the optic
        Thermal = true
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_thermal_default2.vmt"),
        Size = 750,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    ReticleHybrid = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle2"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.89
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.8
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.78
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}