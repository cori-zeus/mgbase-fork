AddCSLuaFile()

MW_ATT_KEYS["camo_jermasus"] = {
    Name = "jermasus",
    Icon = Material("viper/mw/attachments/icons/perks/perk_icon_fastreload.vmt"),
    Stats = function(self)
        self:SetCamo("viper/shared/camos/jermasus")
    end
}

MW_ATT_KEYS["camo_digital"] = {
    Name = "Digital",
    Icon = Material("viper/mw/attachments/icons/perks/perk_icon_melee.vmt"),
    Stats = function(self)
        self:SetCamo("viper/shared/camos/h2_weapon_camo_digital")
    end
}