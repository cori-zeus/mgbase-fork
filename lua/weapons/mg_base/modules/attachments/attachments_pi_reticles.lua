AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_minireddot01"] = {
    Name = "G.I. Mini Reflex",
    Model = Model("models/viper/mw/attachments/attachment_vm_minireddot01_mike1911.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_minireddot.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        --self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.4)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Ads =  self.Cone.Ads * 0.7
    end
}

MW_ATT_KEYS["attachment_vm_minireddot02"] = {
    Name = "Solozero Optics Mini Reflex",
    Model = Model("models/viper/mw/attachments/attachment_vm_minireddot02_mike1911.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_minireddot02.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        --self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.35)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Ads =  self.Cone.Ads * 0.7
    end
}

MW_ATT_KEYS["attachment_vm_minireddot03"] = {
    Name = "Cronen LP945 Mini Reflex",
    Model = Model("models/viper/mw/attachments/attachment_vm_minireddot03_mike1911.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_minireddot03.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        --self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.35)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Ads =  self.Cone.Ads * 0.7
    end
}

MW_ATT_KEYS["attachment_vm_reflex_east"] = {
    Name = "Viper Reflex Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_reflex_east_lod0.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_reflex_east.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/kobra_reticle.vmt"),
        Size = 300,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.18
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.1
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.18
    end
}

MW_ATT_KEYS["attachment_vm_holo_west_lod0"] = {
    Name = "Corp Combat Holo Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_holo_west_lod0.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_holo_west.vmt"),
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_holo_default.vmt"),
        Size = 700,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.14
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.03
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.41
    end
}

MW_ATT_KEYS["attachment_vm_reflex_east02_lod0"] = {
    Name = "Monocle Reflex Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_reflex_east02_lod0.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_reflex_east02.vmt"),
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_reflex_default3.vmt"),
        Size = 700,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Ads =  self.Cone.Ads * 0.7
    end
}

MW_ATT_KEYS["attachment_vm_reflex_west02_lod0"] = {
    Name = "Aim-Op Reflex Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_reflex_west02_lod0.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_reflex_west02.vmt"),
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_reflex_default2.vmt"),
        Size = 500,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Ads =  self.Cone.Ads * 0.7
    end
}
