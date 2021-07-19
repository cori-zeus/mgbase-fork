AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_ar_asierra12_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_xmags"] = {
    Name = "25 Round Mags",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_xmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 25
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_xxmags"] = {
    Name = "30 Round Mags",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_xxmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_xxmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 30
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_muzzlebrake"] = {
    Name = "Muzzlebrake",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_muzzlebrake.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_muzzlebrake01.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.96
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.96
        self.Recoil.Horizontal[1] =  self.Recoil.Horizontal[1] * 0.91
        self.Recoil.Horizontal[2] =  self.Recoil.Horizontal[2] * 0.91
        self.Recoil.Vertical[1] =  self.Recoil.Vertical[1] * 0.91
        self.Recoil.Vertical[2] =  self.Recoil.Vertical[2] * 0.91
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_longsuppressor"] = {
    Name = "Collosus Suppressor",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_longsuppressor.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_longsuppressor.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.96
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.96
        self.Bullet.EffectiveRange =  self.Bullet.EffectiveRange * 1.07
        self.Bullet.Damage[1] =  self.Bullet.Damage[1] * 1.11
        self.Bullet.Damage[2] =  self.Bullet.Damage[2] * 1.067
    end 
}


MW_ATT_KEYS["attachment_vm_ar_asierra12_scope"] = {
    Name = "Sniper Scope",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_scope.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_scope.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/weapons/asierra12/weapon_vm_ar_asierra12_scopeglass.vmt"),
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
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.89
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.89
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.8
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_barrel.mdl"),
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_barshort"] = {
    Name = "Oden Factory 420mm",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_barshort.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_barshort.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.85
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.85
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.113
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.113
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.113
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.113
        self.Cone.Hip =  self.Cone.Hip * 0.97
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.06
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.06
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_barlong"] = {
    Name = "Oden Factory 730mm",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_barlong.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_barlong.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.175
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.175
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.925
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.925
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.925
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.925
        self.Cone.Hip =  self.Cone.Hip * 1.15
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.96
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.96
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_barlong2"] = {
    Name = "Oden Factory 810mm",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_barlong2.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_barlong2.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.35
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.35
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.85
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.85
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.85
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.85
        self.Cone.Hip =  self.Cone.Hip * 1.3
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_stock"] = {
    Name = "Default",
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_stockh"] = {
    Name = "FORGE TAC Ballast Pack",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_stockh.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_stockh.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.93
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.93
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.93
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.93
    end
}

MW_ATT_KEYS["attachment_vm_ar_asierra12_stockl"] = {
    Name = "Oden Ultralight Hollow",
    Model = Model("models/viper/mw/attachments/asierra12/attachment_vm_ar_asierra12_stockl.mdl"),
    Icon = Material("viper/mw/attachments/icons/asierra12/icon_attachment_ar_asierra12_stockl.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.11
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.11 
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.96
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.96
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.96
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.96
    end
}