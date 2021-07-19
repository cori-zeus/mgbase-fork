AddCSLuaFile()

SWEP.StatDefinitions = {
    ["SWEP.Primary.ClipSize"] = "ClipSize",
    ["SWEP.Primary.RPM"] = "RPM",
    ["SWEP.Animations.Ads_Out.Fps"] = "AimSpeed",
    ["SWEP.Animations.Ads_In.Fps"] = "AimSpeed",
    ["SWEP.Cone.Ads"] = "AimAccuracy",
    ["SWEP.Cone.Hip"] = "HipAccuracy",
    ["SWEP.Animations.Reload.Length"] = "ReloadSpeed",
    ["SWEP.Animations.Reload_Empty.Length"] = "ReloadSpeed",
    ["SWEP.Bullet.Damage.1"] = "DamageClose",
    ["SWEP.Bullet.Damage.2"] = "DamageRange",
    ["SWEP.Bullet.EffectiveRange"] = "EffectiveRange",
    ["SWEP.Bullet.Penetration.Thickness"] = "PenetrationThickness",
    ["SWEP.Recoil.Vertical.1"] = "VerticalRecoil",
    ["SWEP.Recoil.Vertical.2"] = "VerticalRecoil",
    ["SWEP.Recoil.Horizontal.1"] = "HorizontalRecoil",
    ["SWEP.Recoil.Horizontal.2"] = "HorizontalRecoil",
    ["SWEP.Animations.Melee_Hit.Length"] = "MeleeSpeed",
    ["SWEP.Animations.Melee.Length"] = "MeleeSpeed",
    ["SWEP.Animations.Melee_Hit.Damage"] = "MeleeDamage"
}

SWEP.StatInfo = {
    ["ClipSize"] = {
        Name = "Magazine Size",
        ProIfMore = true,
        ShowPercentage = false
    },
    ["RPM"] = {
        Name = "Rounds Per Minute",
        ProIfMore = true,
        ShowPercentage = false
    },
    ["AimSpeed"] = {
        Name = "ADS Speed",
        ProIfMore = true,
        ShowPercentage = true
    },
    ["AimAccuracy"] = {
        Name = "ADS Spread",
        ProIfMore = false,
        ShowPercentage = true
    },
    ["HipAccuracy"] = {
        Name = "Hip Spread",
        ProIfMore = false,
        ShowPercentage = true
    },
    ["ReloadSpeed"] = {
        Name = "Reload Speed",
        ProIfMore = false,
        ShowPercentage = true
    },
    ["DamageClose"] = {
        Name = "Damage Close",
        ProIfMore = true,
        ShowPercentage = true
    },
    ["DamageRange"] = {
        Name = "Damage Range",
        ProIfMore = true,
        ShowPercentage = true
    },
    ["EffectiveRange"] = {
        Name = "Effective Range",
        ProIfMore = true,
        ShowPercentage = true
    },
    ["PenetrationThickness"] = {
        Name = "Penetration Power",
        ProIfMore = true,
        ShowPercentage = true
    },
    ["HorizontalRecoil"] = {
        Name = "Recoil Horizontal",
        ProIfMore = false,
        ShowPercentage = true
    },
    ["VerticalRecoil"] = {
        Name = "Recoil Vertical",
        ProIfMore = false,
        ShowPercentage = true
    },
    ["MeleeSpeed"] = {
        Name = "Melee Recovery",
        ProIfMore = false,
        ShowPercentage = true
    },
    ["MeleeDamage"] = {
        Name = "Damage Melee",
        ProIfMore = true,
        ShowPercentage = true
    }
}