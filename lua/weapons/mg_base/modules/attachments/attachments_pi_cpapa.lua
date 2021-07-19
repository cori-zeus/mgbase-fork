AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_pi_cpapa_barrel"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_cpapa_barrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/cpapa/icon_attachment_pi_cpapa_barrel.vmt")
}

MW_ATT_KEYS["attachment_vm_pi_cpapa_barrel_long"] = {
    Name = ".357 Long",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_cpapa_barrel_long.mdl"),
    Icon = Material("viper/mw/attachments/icons/cpapa/icon_attachment_pi_cpapa_barrel_long.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.5
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.1
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.08
        self.Cone.Hip =  self.Cone.Hip * 0.7
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.85
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.73
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85 
    end
}

MW_ATT_KEYS["attachment_vm_pi_cpapa_shortbarrel"] = {
    Name = ".357 Snub Nose",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_cpapa_shortbarrel.mdl"),
    Icon = Material("viper/mw/attachments/icons/cpapa/icon_attachment_pi_cpapa_shortbarrel.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.7
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.25
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 0.9
        self.Cone.Hip =  self.Cone.Hip * 1.1
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.03
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 1.2
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.15
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.15 
    end
}

MW_ATT_KEYS["attachment_vm_pi_cpapa_barrel_v2"] = {
    Name = "Silverfield Ordnance .357",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_cpapa_barrel_v2.mdl"),
    Icon = Material("viper/mw/attachments/icons/cpapa/icon_attachment_pi_cpapa_barrel_v2.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 1.75
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.3
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.1
        self.Cone.Hip =  self.Cone.Hip * 1.2
        self.Cone.Ads =  self.Cone.Ads * 0.3
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 1.05
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.9
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.7
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.7 
    end
}

MW_ATT_KEYS["attachment_vm_pi_cpapa_grip"] = {
    Name = "Default",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_cpapa_grip.mdl"),
    Icon = Material("viper/mw/attachments/icons/cpapa/icon_attachment_pi_cpapa_grip.vmt")
}

MW_ATT_KEYS["attachment_vm_pi_cpapa_grip_stock"] = {
    Name = "Lockwood .357 Custom Stock",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_cpapa_grip_stock.mdl"),
    Icon = Material("viper/mw/attachments/icons/cpapa/icon_attachment_pi_cpapa_grip_stock.vmt"),
    Stats = function(self)
        self:SetViewModel("models/viper/mw/weapons/v_357_stock.mdl")
        self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, 0)
        self.Cone.Hip =  self.Cone.Hip * 0.5
        self.Cone.Ads =  self.Cone.Ads * 0.5
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.5
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.5
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85 
    end
}

MW_ATT_KEYS["attachment_vm_pi_cpapa_stockl"] = {
    Name = "FSS Raider Stock",
    Model = Model("models/viper/mw/attachments/attachment_vm_pi_cpapa_stockl.mdl"),
    Icon = Material("viper/mw/attachments/icons/cpapa/icon_attachment_pi_cpapa_stockl.vmt"),
    Stats = function(self)
        self:SetViewModel("models/viper/mw/weapons/v_357_stock.mdl")
        self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, 0)
        self.Cone.Hip =  self.Cone.Hip * 0.5
        self.Cone.Ads =  self.Cone.Ads * 0.5
        self.Recoil.Vertical[1] = self.Recoil.Vertical[1] * 0.5
        self.Recoil.Vertical[2] = self.Recoil.Vertical[2] * 0.5
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85 
    end
}