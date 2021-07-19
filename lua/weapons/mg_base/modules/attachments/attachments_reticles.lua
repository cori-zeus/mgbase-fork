AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_minireddot_tall"] = {
    Name = "G.I. Mini Reflex",
    Model = Model("models/viper/mw/attachments/attachment_vm_minireddot_tall.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_minireddot.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.1
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.03
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.15
    end
}

MW_ATT_KEYS["attachment_vm_minireddot02_tall"] = {
    Name = "Solozero Optics Mini Reflex",
    Model = Model("models/viper/mw/attachments/attachment_vm_minireddot02_tall.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_minireddot02.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.11
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.03
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.17
    end
}

MW_ATT_KEYS["attachment_vm_minireddot03_tall"] = {
    Name = "Cronen LP945 Mini Reflex",
    Model = Model("models/viper/mw/attachments/attachment_vm_minireddot03_tall.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_minireddot03.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.13
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.03
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.11
    end
}

MW_ATT_KEYS["attachment_vm_holo_west02"] = {
    Name = "PBX Holo 7 Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_holo_west02.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_holo_west02.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/eotech_reticle.vmt"),
        Size = 300,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.23
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.21
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.38
    end
}

MW_ATT_KEYS["attachment_vm_reflex_east02_tall"] = {
    Name = "Monocle Reflex Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_reflex_east02_tall.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_reflex_east02.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.1
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.15
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.26
    end
}

MW_ATT_KEYS["attachment_vm_reflex_west03"] = {
    Name = "Operator Reflex Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_reflex_west03.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_reflex_west03.vmt"),
    Reticle = {
        Material = Material("viper/shared/reticles/aimpoint_reticle.vmt"),
        Size = 200,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.19
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.15
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.21
    end
}

MW_ATT_KEYS["attachment_vm_reflex_west04"] = {
    Name = "Operator Reflex Sight",
    Model = Model("models/viper/mw/attachments/attachment_vm_reflex_west04.mdl"),
    Icon = Material("viper/mw/attachments/icons/reticles/icon_attachment_reflex_west02.vmt"),
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_reflex_default2.vmt"),
        Size = 500,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.08
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.1
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.36
    end
}