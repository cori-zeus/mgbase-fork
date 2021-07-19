AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_sm_papa90_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/papa90/attachment_vm_sm_papa90_mag.mdl"),
    Stats = function(self)
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_sm_papa90_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/papa90/attachment_vm_sm_papa90_barrel.mdl")
}

MW_ATT_KEYS["attachment_vm_sm_papa90_longbarrel"] = {
    Name = "Tempus Mini",
    Model = Model("models/viper/mw/attachments/papa90/attachment_vm_sm_papa90_longbarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_shortbarrel.vmt"),
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 0.8
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.8
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.15
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.15
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 1.15
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 1.15
        self.Cone.Hip =  self.Cone.Hip * 0.96
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.08
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.08
    end
}

MW_ATT_KEYS["attachment_vm_sm_papa90_custombarrel"] = {
    Name = "Tempus Marksman",
    Model = Model("models/viper/mw/attachments/papa90/attachment_vm_sm_papa90_custombarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_longbarrel.vmt"),
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

MW_ATT_KEYS["attachment_vm_sm_papa90_stock_tactical"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/papa90/attachment_vm_sm_papa90_stock_tactical.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_sm_papa90_stockl"] = {
    Name = "M13 Skeleton Stock",
    Model = Model("models/viper/mw/attachments/papa90/attachment_vm_sm_papa90_stockl.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_lightstock.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.12
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.12
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.94
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.94
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.94
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.94
    end
}

MW_ATT_KEYS["attachment_vm_sm_papa90_stocks"] = {
    Name = "M13 Skeleton Stock",
    Model = Model("models/viper/mw/attachments/papa90/attachment_vm_sm_papa90_stocks.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_lightstock.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.12
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.12
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.94
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.94
        self.Recoil.Horizontal[1] = self.Recoil.Horizontal[1] * 0.94
        self.Recoil.Horizontal[2] = self.Recoil.Horizontal[2] * 0.94
    end
}