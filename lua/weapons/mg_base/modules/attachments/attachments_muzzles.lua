AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_flashhider01"] = {
    Name = "Flash Guard",
    Model = Model("models/viper/mw/attachments/attachment_vm_flashhider01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_flashhider01.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.96
    end 
}

MW_ATT_KEYS["attachment_vm_flashhider02"] = {
    Name = "Flash Guard",
    Model = Model("models/viper/mw/attachments/attachment_vm_flashhider02.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_flashhider02.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.96
    end 
}

MW_ATT_KEYS["attachment_vm_flashhider03"] = {
    Name = "Flash Guard",
    Model = Model("models/viper/mw/attachments/attachment_vm_flashhider03.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_flashhider03.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.96
    end 
}

MW_ATT_KEYS["attachment_vm_flashhider05"] = {
    Name = "Flash Guard",
    Model = Model("models/viper/mw/attachments/attachment_vm_flashhider05.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_flashhider05.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.96
    end 
}

MW_ATT_KEYS["attachment_vm_muzzlebrake01"] = {
    Name = "Muzzle Brake",
    Model = Model("models/viper/mw/attachments/attachment_vm_muzzlebrake01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_muzzlebrake01.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97 
        self.Recoil.Horizontal[1] =  self.Recoil.Horizontal[1] * 0.93
        self.Recoil.Horizontal[2] =  self.Recoil.Horizontal[2] * 0.93
        self.Recoil.Vertical[1] =  self.Recoil.Vertical[1] * 0.93
        self.Recoil.Vertical[2] =  self.Recoil.Vertical[2] * 0.93
    end  
}

MW_ATT_KEYS["attachment_vm_muzzlebrake02"] = {
    Name = "Muzzle Brake",
    Model = Model("models/viper/mw/attachments/attachment_vm_muzzlebrake02.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_muzzlebrake02.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97 
        self.Recoil.Horizontal[1] =  self.Recoil.Horizontal[1] * 0.93
        self.Recoil.Horizontal[2] =  self.Recoil.Horizontal[2] * 0.93
        self.Recoil.Vertical[1] =  self.Recoil.Vertical[1] * 0.93
        self.Recoil.Vertical[2] =  self.Recoil.Vertical[2] * 0.93
    end  
}

MW_ATT_KEYS["attachment_vm_muzzlebrake03"] = {
    Name = "Muzzle Brake",
    Model = Model("models/viper/mw/attachments/attachment_vm_muzzlebrake03.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_muzzlebrake03.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94 
        self.Recoil.Horizontal[1] =  self.Recoil.Horizontal[1] * 0.95
        self.Recoil.Horizontal[2] =  self.Recoil.Horizontal[2] * 0.95
        self.Recoil.Vertical[1] =  self.Recoil.Vertical[1] * 0.95
        self.Recoil.Vertical[2] =  self.Recoil.Vertical[2] * 0.95
    end  
}

MW_ATT_KEYS["attachment_vm_muzzlebrake04"] = {
    Name = "Muzzle Brake",
    Model = Model("models/viper/mw/attachments/attachment_vm_muzzlebrake04.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_muzzlebrake04.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.91
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.91
        self.Recoil.Horizontal[1] =  self.Recoil.Horizontal[1] * 0.92
        self.Recoil.Horizontal[2] =  self.Recoil.Horizontal[2] * 0.92
        self.Recoil.Vertical[1] =  self.Recoil.Vertical[1] * 0.92
        self.Recoil.Vertical[2] =  self.Recoil.Vertical[2] * 0.92
    end  
}

MW_ATT_KEYS["attachment_vm_compensator01"] = {
    Name = "Compensator",
    Model = Model("models/viper/mw/attachments/attachment_vm_compensator01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_compensator01.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
        self.Recoil.Vertical[1] =  self.Recoil.Vertical[1] * 0.96
        self.Recoil.Vertical[2] =  self.Recoil.Vertical[2] * 0.96
    end 
}

MW_ATT_KEYS["attachment_vm_compensator02"] = {
    Name = "Compensator",
    Model = Model("models/viper/mw/attachments/attachment_vm_compensator02.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_compensator02.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.93
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.93
        self.Recoil.Vertical[1] =  self.Recoil.Vertical[1] * 0.94
        self.Recoil.Vertical[2] =  self.Recoil.Vertical[2] * 0.94
    end 
}

MW_ATT_KEYS["attachment_vm_muzzlemelee01"] = {
    Name = "Breacher Device",
    Model = Model("models/viper/mw/attachments/attachment_vm_muzzlemelee01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_muzzlemelee01.vmt"),
    Stats = function(self)
        self.Animations.Melee_Hit.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97 
        self.Animations.Melee_Hit.Damage = self.Animations.Melee_Hit.Damage * 1.6
    end 
}

MW_ATT_KEYS["attachment_vm_muzzlemelee02"] = {
    Name = "Breacher Device",
    Model = Model("models/viper/mw/attachments/attachment_vm_muzzlemelee02.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_muzzlemelee02.vmt"),
    Stats = function(self)
        self.Animations.Melee_Hit.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97 
        self.Animations.Melee_Hit.Damage = self.Animations.Melee_Hit.Damage * 1.26
    end 
}

MW_ATT_KEYS["attachment_vm_silencer_east01"] = {
    Name = "Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_silencer_east01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_silencer_east01.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.94
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.94
        self.Bullet.Damage[1] =  self.Bullet.Damage[1] * 0.95
        self.Bullet.Damage[2] =  self.Bullet.Damage[2] * 0.95
    end 
}

MW_ATT_KEYS["attachment_vm_silencer02"] = {
    Name = "Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_silencer02.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_silencer02.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.97
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.97
        self.Bullet.Damage[1] =  self.Bullet.Damage[1] * 0.93
        self.Bullet.Damage[2] =  self.Bullet.Damage[2] * 0.93
    end 
}

MW_ATT_KEYS["attachment_vm_silencer03"] = {
    Name = "Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_silencer03.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_silencer03.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.95
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.95
        self.Bullet.Damage[1] =  self.Bullet.Damage[1] * 0.96
        self.Bullet.Damage[2] =  self.Bullet.Damage[2] * 0.96
    end 
}

MW_ATT_KEYS["attachment_vm_silencer04"] = {
    Name = "Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_silencer04.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_silencer04.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.92
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.92
        self.Bullet.Damage[1] =  self.Bullet.Damage[1] * 0.97
        self.Bullet.Damage[2] =  self.Bullet.Damage[2] * 0.97
    end 
}