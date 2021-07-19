AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_pi_mike9_barauto"] = {
    Name = "Mk3 Burst Mod",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_barauto.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_barauto.vmt"),
    Stats = function(self)
        self.Primary.RPM = 1000
        self.Primary.BurstRounds = 3
        self.Primary.BurstDelay = 0.2
        self.Firemodes[1].Name = "3rnd Burst"
        self.ViewModelOffsets.KickMultiplier = 0.25
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.16
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.1
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.05
        self.Recoil.Shake = self.Recoil.Shake * 1.3
        self.Cone.Hip =  self.Cone.Hip * 1.25
        self.Cone.Max =  self.Cone.Max * 1.17
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_barlight"] = {
    Name = "Mk1 Competition",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_barlight.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_barlight.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.6
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.3
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.15
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.3
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.3
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_barlong"] = {
    Name = "Mk1 Extended",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_barlong.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_barlong.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.4
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.1
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.15
        self.Cone.Hip =  self.Cone.Hip * 0.785
        --self.Recoil.Shake =  self.Recoil.Shake * 0.63
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_barrel"] = {
    Name = "Default Slide (Tan)",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_barrel.mdl")
}

MW_ATT_KEYS["attachment_vm_pi_mike9_barrel_black"] = {
    Name = "Default Slide (Black)",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_barrel_black.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_barrel.vmt"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_xmags"] = {
    Name = "21 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_xmagslrg.vmt"),
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

MW_ATT_KEYS["attachment_vm_pi_mike9_compensator"] = {
    Name = "Compensator",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_compensator.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_compensator_v2.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Hip =  self.Cone.Hip * 0.9
        --self.Recoil.Shake =  self.Recoil.Shake * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_xmagslrg"] = {
    Name = "27 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_xmagslrg.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_xmagslrg_v2.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 27
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_stock"] = {
    Name = "FTAC Satus CS-3",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_stock.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_stock.vmt"),
    Stats = function(self)
        self:SetViewModel("models/viper/mw/weapons/v_m9_stock.mdl")
        self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0.16, 0, 0)
        --self.Recoil.Shake = self.Recoil.Shake * 0.74
        self.Cone.Hip = self.Cone.Hip * 0.53
        self.Cone.Max = self.Cone.Max * 0.65
        self.Cone.Increase = self.Cone.Increase * 0.14
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.17
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.17
        self.Zoom.Blur.EyeFocusDistance = 11
    end
}

MW_ATT_KEYS["no_pistgrip"] = {
    Name = "Default Pistolgrip",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_pgrip.mdl"),
}

MW_ATT_KEYS["attachment_vm_pi_mike9_pstlgrpcust"] = {
    Name = "XRK Pro Grip",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_pstlgrpcust.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_pstlgrpcust.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.9
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.9
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_pstlgrplght"] = {
    Name = "XRK Speed Grip",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_pstlgrplght.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_pstlgrplght.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.9
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.14
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.14
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike9_gripvert"] = {
    Name = "Folding Grip",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike9_gripvert.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike9/icon_attachment_pi_mike9_pstlgrpcust_v2.vmt"),
    Stats = function(self)
    self:SetGripPoseParameter("grip_offset")
    --self.Recoil.Shake = self.Recoil.Shake * 0.8
    self.Cone.Hip =  self.Cone.Hip * 0.75
    self.Cone.Max =  self.Cone.Max * 0.8
    self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
    self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}