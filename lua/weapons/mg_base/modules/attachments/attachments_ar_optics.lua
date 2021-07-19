AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_4x_east_tall"] = {
    Name = "VLK 3.0x Optic",
    Model = Model("models/viper/mw/attachments/attachment_vm_4x_east_tall.mdl"),
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
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.89
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.92
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.92
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}

MW_ATT_KEYS["attachment_vm_4x_west_tall"] = {
    Name = "Scout Combat Optic",
    Model = Model("models/viper/mw/attachments/attachment_vm_4x_west_tall.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_4x_west.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_4x_west_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 450, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_acog_default3.vmt"),
        Size = 600,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.63
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.92
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.92
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}

MW_ATT_KEYS["attachment_vm_4x_west02_tall"] = {
    Name = "Cronen C480 Pro Optic",
    Model = Model("models/viper/mw/attachments/attachment_vm_4x_west02_tall.mdl"),
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
        Size = 550,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 2.1
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}

MW_ATT_KEYS["attachment_vm_thermal_east_tall"] = {
    Name = "Merc Thermal Optic",
    Model = Model("models/viper/mw/attachments/attachment_vm_thermal_east_tall.mdl"),
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
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.89
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}

MW_ATT_KEYS["attachment_vm_thermal_west_01"] = {
    Name = "Solozero NVG Enhanced",
    Model = Model("models/viper/mw/attachments/attachment_vm_thermal_west_01.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_thermal_west01.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_thermal_west01_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 250, --a value of zero means 1:1 size with the end of the optic
        Thermal = true
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_thermal_default.vmt"),
        Size = 550,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 2.05
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}

MW_ATT_KEYS["attachment_vm_scope_vz"] = {
    Name = "Variable Zoom Scope",
    Model = Model("models/viper/mw/attachments/attachment_vm_scope_vz.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_scope_vz.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/attachment_vm_scope_vz_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 250, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_int_default.vmt"),
        Size = 800,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 3.5
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.91
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.91
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.8
    end
}

MW_ATT_KEYS["weapon_vm_scope_mike14_alt"] = {
    Name = "Sniper Scope",
    Model = Model("models/viper/mw/attachments/weapon_vm_scope_mike14_alt.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_snprscope_mike14.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/attachments/weapon_vm_sn_mike14_scope_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 400, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_int_default.vmt"),
        Size = 800,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 3
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.92
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.92
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.8
    end
}