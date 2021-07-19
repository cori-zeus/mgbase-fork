AddCSLuaFile()

MW_ATT_KEYS["weapon_vm_la_mike32_scope"] = {
    Name = "Scope",
    Model = Model("models/viper/mw/attachments/mike32/weapon_vm_la_mike32_scope.mdl"),
    Icon = Material("viper/mw/attachments/icons/optics/icon_attachment_4x_east.vmt"),
    Optic = {
        LensHideMaterial = Material("viper/MW/weapons/mike32/weapon_vm_la_mike32_scope_lens.vmt"),
        LensBodygroup = "lens",
        FOV = 7, 
        ParallaxSize = 0, --a value of zero means 1:1 size with the end of the optic
        Thermal = false
    },
    Reticle = {
        Material = Material("viper/mw/reticles/reticle_vzscope_default.vmt"),
        Size = 700,
        Color = Color(255, 255, 255, 255),
        Attachment = "reticle"
    },
    Stats = function(self)
        self.Zoom.ViewModelFovMultiplier = 0.95
        self.Zoom.FovMultiplier = 0.9
    end
}