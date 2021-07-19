AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_sm_augolf_mag"] = {
    Name = "Default Magazine",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_smgmag.mdl"),
    Stats = function(self)
        self.Primary.ClipSize = 25
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_armag"] = {
    Name = "5.56 NATO 30-Round Mags",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_armag.mdl"),
    Stats = function(self)
        self.Primary.ClipSize = 30
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_drummag"] = {
    Name = "5.56 NATO 60-Round Drum",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_drummag.mdl"),
    Stats = function(self)
        self.Primary.ClipSize = 60
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_smg_xmag"] = {
    Name = "32 Round Mags",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_smgmag.mdl"),
    Stats = function(self)
        self.Primary.ClipSize = 32
        self.Animations.Reload = self.Animations.Reload
        self.Animations.Reload_Empty = self.Animations.Reload_Empty
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_smgbarrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_smgbarrel.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_arbarrel"] = {
    Name = "407mm Extended Barrel",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_arbarrel.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_lmgbarrel"] = {
    Name = "622mm Long Barrel",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_lmgbarrel.mdl"),
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

MW_ATT_KEYS["attachment_vm_sm_augolf_tag_stock_attach"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_tag_stock_attach.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_stock_tactical"] = {
    Name = "FFS Heavy Stock Pro",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_stock_tactical.mdl"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_stockl"] = {
    Name = "Forge TAC CQB Comb",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_stockl.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_lightstock.vmt"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["attachment_vm_sm_augolf_stocks"] = {
    Name = "FTAC Ultralight Hollow",
    Model = Model("models/viper/mw/attachments/augolf/attachment_vm_sm_augolf_stocks.mdl"),
    Icon = Material("viper/mw/attachments/icons/mcharlie/icon_attachment_ar_mcharlie_lightstock.vmt"),
    Stats = function(self)
    end
}