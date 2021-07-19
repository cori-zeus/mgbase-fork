AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_flashhider_psl01"] = {
    Name = "Flash Guard",
    Model = Model("models/viper/mw/attachments/attachment_vm_flashhider_psl01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_flashhider_pstl01.vmt"),
    Stats = function(self)
        self.Bullet.EffectiveRange = self.Bullet.EffectiveRange * 0.97
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9

    end 
}

MW_ATT_KEYS["attachment_vm_muzzlebrake_pstl01"] = {
    Name = "Muzzle Brake",
    Model = Model("models/viper/mw/attachments/attachment_vm_muzzlebrake_pstl01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_muzzlebrake_pstl01.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9 
        self.Cone.Hip =  self.Cone.Hip * 0.8
        self.Cone.Ads =  self.Cone.Ads * 1.03
    end  
}

MW_ATT_KEYS["attachment_vm_compensator_pstl01"] = {
    Name = "Compensator",
    Model = Model("models/viper/mw/attachments/attachment_vm_compensator_pstl01.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_compensator_pstl01.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.9
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.9
        self.Cone.Hip =  self.Cone.Hip * 0.9
        self.Recoil.Shake =  self.Recoil.Shake * 0.9
    end 
}

MW_ATT_KEYS["attachment_vm_oil_filter_suppressor"] = {
    Name = "Oil Can Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_oil_filter_suppressor.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_oil_filter_suppressor.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
        self.Cone.Hip =  self.Cone.Hip * 0.9
    end 
}

MW_ATT_KEYS["attachment_vm_silencerpstl"] = {
    Name = "Monolithic Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_silencerpstl.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_silencerpstl.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
        self.Cone.Hip =  self.Cone.Hip * 0.9
    end 
}

MW_ATT_KEYS["attachment_vm_silencer_pstl_02"] = {
    Name = "Lightweight Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_silencer_pstl_02.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_silencer_pstl_02.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
        self.Cone.Hip =  self.Cone.Hip * 0.9
    end 
}

MW_ATT_KEYS["attachment_vm_silencerpstl03"] = {
    Name = "Tactical Suppressor",
    Model = Model("models/viper/mw/attachments/attachment_vm_silencerpstl03.mdl"),
    Icon = Material("viper/mw/attachments/icons/muzzle/icon_attachment_silencerpstl03.vmt"),
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 0.85
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 0.85
        self.Cone.Hip =  self.Cone.Hip * 0.9
    end 
}
