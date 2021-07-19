AddCSLuaFile()

MW_ATT_KEYS["perk_soh"] = {
    Name = "Sleight Of Hand",
    Icon = Material("viper/mw/attachments/icons/perks/perk_icon_fastreload.vmt"),
    Stats = function(self)
    end
}

MW_ATT_KEYS["perk_fastmelee"] = {
    Name = "Fast Melee",
    Icon = Material("viper/mw/attachments/icons/perks/perk_icon_melee.vmt"),
    Stats = function(self)
        --self.Animations.Melee_Hit.Fps = self.Animations.Melee_Hit.Fps * 1.25
        self.Animations.Melee_Hit.Length = self.Animations.Melee_Hit.Length * 0.75
    end
}

MW_ATT_KEYS["perk_heavymelee"] = {
    Name = "Heavy Hitter",
    Icon = Material("viper/mw/attachments/icons/perks/perk_icon_hitter.vmt"),
    Stats = function(self)
        self.Animations.Melee_Hit.Length = self.Animations.Melee_Hit.Length * 1.25
        self.Animations.Melee_Hit.Damage = self.Animations.Melee_Hit.Damage * 1.4
    end
}
 
MW_ATT_KEYS["perk_fmj"] = {
    Icon = Material("viper/mw/attachments/icons/perks/perk_icon_fmj.vmt"),
    Name = "FMJ",
    Stats = function(self)
        self.Bullet.Damage[1] = self.Bullet.Damage[1] * 1.1
        self.Bullet.Damage[2] = self.Bullet.Damage[2] * 1.1
        if (self.Bullet.Penetration != nil) then
            self.Bullet.Penetration.MaxCount = self.Bullet.Penetration.MaxCount + 1
            self.Bullet.Penetration.Thickness = self.Bullet.Penetration.Thickness * 1.2
            --self.Bullet.Penetration.DamageMultiplier = self.Bullet.Penetration.DamageMultiplier * 1.3
        end
    end
}