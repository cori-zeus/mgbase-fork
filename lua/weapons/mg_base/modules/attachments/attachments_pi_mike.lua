AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_pi_mike_barlight"] = {
    Name = "SSB 105mm",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_barlight.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_barlight.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.83
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.95
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.3
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.3
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_barsil"] = {
    Name = "SSL 308mm",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_barsil.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_barsil.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.92
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Hip =  self.Cone.Hip * 0.87
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_barauto"] = {
    Name = "Sorokin 140mm Auto",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_barauto.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_barauto.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.5
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.1
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.05
        self.Recoil.Shake = self.Recoil.Shake * 1.3
        self.Cone.Hip =  self.Cone.Hip * 1.5
        self.Cone.Max =  self.Cone.Max * 1.5
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.75
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.75
        self.Primary.Automatic = true
        self.Primary.RPM = 800
        self.Firemodes[1].Name = "Full Auto"
        self.PrintName = "Sorokin"
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_barrel"] = {
    Name = "Default Slide",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_barrel.mdl")
}


MW_ATT_KEYS["attachment_vm_pi_mike_grip"] = {
    Name = "Default Grip",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_grip.mdl"),
    Stats = function(self)
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_pistolgrip01"] = {
    Name = "VLK Spetznaz",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_pistolgrip01.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_pistolgrip01.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.9
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.9
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_pistolgrip02"] = {
    Name = "VLK Prizrak",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_pistolgrip02.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_pistolgrip02.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.9
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.9
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_pistolgrip03"] = {
    Name = "VLK Elita",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_pistolgrip03.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_pistolgrip03.vmt"),
    Stats = function(self)
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.9
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.9
    end
}



MW_ATT_KEYS["attachment_vm_pi_mike_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_mag.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_mag.vmt"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_xmags"] = {
    Name = "20 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_xmags.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_xmags.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 20
        self.Animations.Reload = self.Animations.Reload_Xmag
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_Xmag
        self.Animations.Reload_Fast = self.Animations.Reload_Xmag_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_Xmag_Fast
        self.Animations.Inspect = self.Animations.Inspect_Xmag
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
    end
}
MW_ATT_KEYS["attachment_vm_pi_mike_drummag"] = {
    Name = "80 Round Mags",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_drummag.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_drummag.vmt"),
    Stats = function(self)
        self.Primary.ClipSize = 80
        self.Animations.Reload = self.Animations.Reload_XmagLrg
        self.Animations.Reload_Empty = self.Animations.Reload_Empty_XmagLrg
        self.Animations.Reload_Fast = self.Animations.Reload_XmagLrg_Fast
        self.Animations.Reload_Empty_Fast = self.Animations.Reload_Empty_XmagLrg_Fast
        self.Animations.Inspect = self.Animations.Inspect_Drum
        self.Animations.Equip = self.Animations.Equip_Drum
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.65
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.65
        self.Animations.Reload_XmagLrg.Fps = self.Animations.Reload_XmagLrg.Fps * 0.9
        self.Animations.Reload_Empty_XmagLrg.Fps = self.Animations.Reload_Empty_XmagLrg.Fps * 0.8
        self.Animations.Reload_XmagLrg_Fast.Fps = self.Animations.Reload_XmagLrg.Fps * 0.9
        self.Animations.Reload_Empty_XmagLrg_Fast.Fps = self.Animations.Reload_Empty_XmagLrg.Fps * 0.8
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 2.5
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 3.5
    end
}

MW_ATT_KEYS["attachment_vm_pi_mike_stockl"] = {
    Name = "PP-Skelet",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_mike_stockl.mdl"),
    Icon = Material("viper/mw/attachments/icons/mike/icon_attachment_pi_mike_stockl.vmt"),
    Stats = function(self)
        self:SetViewModel("models/viper/mw/weapons/v_makarov_stock.mdl")
        self.Animations.Equip = self.Animations.Equip_Stock
        self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.15, 0, 0)
        self.Recoil.Shake = self.Recoil.Shake * 0.74
        self.Cone.Hip = self.Cone.Hip * 0.58
        self.Cone.Max = self.Cone.Max * 0.7
        self.Cone.Increase = self.Cone.Increase * 0.15
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.15
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.15
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.15
        self.Zoom.Blur.EyeFocusDistance = 7
    end
}