AddCSLuaFile()

MW_ATT_KEYS["attachment_vm_laser_pstl"] = {
    Name = "Tac Laser",
    Model = Model("models/viper/mw/attachments/attachment_vm_laser_pstl.mdl"),
    Icon = Material("viper/mw/attachments/icons/laser/icon_attachment_laser_pstl.vmt"),
    Laser = {
        BeamMaterial = Material("mw19_laserbeam.vmt"),
        DotMaterial = Material("sprites/light_glow02_add.vmt"),
        BeamSize = 15,
        BeamWidth = 1,
        DotSize = 5,
        Color = Color(255, 0, 0, 255),
        Attachment = "laser"
    },
    Flashlight = {
        FlashlightMaterial = Material("effects/flashlight001.vmt"),
        Color = Color(255, 255, 255, 255),
        Attachment = "laser"
    },
    
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.03
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.03
        self.Cone.Hip =  self.Cone.Hip * 0.75
    end 
}

MW_ATT_KEYS["attachment_vm_laser_pstl03"] = {
    Name = "5mW Laser",
    Model = Model("models/viper/mw/attachments/attachment_vm_laser_pstl03.mdl"),
    Icon = Material("viper/mw/attachments/icons/laser/icon_attachment_laser_pstl03.vmt"),
    Laser = {
        BeamMaterial = Material("mw19_laserbeam.vmt"),
        DotMaterial = Material("sprites/light_glow02_add.vmt"),
        BeamSize = 15,
        BeamWidth = 1,
        DotSize = 5,
        Color = Color(0, 255, 255, 255),
        Attachment = "laser"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.015
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.015
        self.Cone.Hip =  self.Cone.Hip * 0.75
    end  
}

MW_ATT_KEYS["attachment_vm_laser_pstl04"] = {
    Name = "1mW Laser",
    Model = Model("models/viper/mw/attachments/attachment_vm_laser_pstl04.mdl"),
    Icon = Material("viper/mw/attachments/icons/laser/icon_attachment_laser_pstl04.vmt"),
    Laser = {
        BeamMaterial = Material("mw19_laserbeam.vmt"),
        DotMaterial = Material("sprites/light_glow02_add.vmt"),
        BeamSize = 15,
        BeamWidth = 0.5,
        DotSize = 5,
        Color = Color(0, 255, 0, 255),
        Attachment = "laser"
    },
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.015
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.015
        self.Cone.Hip =  self.Cone.Hip * 0.75
    end 
}

MW_ATT_KEYS["attachment_vm_laser_pstl_shoothouse"] = {
    Name = ".red Swift",
    Model = Model("models/viper/mw/attachments/attachment_vm_laser_pstl.mdl"),
    Icon = Material("viper/mw/attachments/icons/laser/icon_attachment_laser_pstl.vmt"),
    Laser = {
        BeamMaterial = Material("mw19_laserbeam.vmt"),
        DotMaterial = Material("mg/sprites/shoothouselaser.vmt"),
        BeamSize = 15,
        BeamWidth = 1,
        DotSize = 2,
        Color = Color(255, 0, 255, 255),
        Attachment = "laser"
    },
    Flashlight = {
        FlashlightMaterial = Material("effects/flashlight001.vmt"),
        Color = Color(255, 255, 255, 255),
        Attachment = "laser"
    },
    
    Stats = function(self)
        self.Animations.Ads_In.Fps = self.Animations.Ads_In.Fps * 1.03
        self.Animations.Ads_Out.Fps = self.Animations.Ads_Out.Fps * 1.03
        self.Cone.Hip =  self.Cone.Hip * 0.75
    end 
}