AddCSLuaFile()

SWEP.HoldTypes = {
    Rifle = {
        Idle = {Crouching = "ar2", Standing = "ar2"},
        Aim = {Crouching = "ar2", Standing = "rpg"},
        Down = {Crouching = "normal", Standing = "passive"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,
        Reload = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
    },

    RifleWithVerticalGrip = {
        Idle = {Crouching = "smg", Standing = "smg"},
        Aim = {Crouching = "smg", Standing = "rpg"},
        Down = {Crouching = "normal", Standing = "passive"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,
        Reload = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
    },

    RPG = {
        Idle = {Crouching = "rpg", Standing = "rpg"},
        Aim = {Crouching = "rpg", Standing = "rpg"},
        Down = {Crouching = "normal", Standing = "passive"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,
        Reload = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
    },

    Shotgun = {
        Idle = {Crouching = "crossbow", Standing = "crossbow"},
        Aim = {Crouching = "crossbow", Standing = "ar2"},
        Down = {Crouching = "normal", Standing = "passive"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,
        Reload = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
    },

    Pistol = {
        Idle = {Crouching = "pistol", Standing = "revolver"},
        Aim = {Crouching = "pistol", Standing = "revolver"},
        Down = {Crouching = "normal", Standing = "normal"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
        Reload = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
    },

    Revolver = {
        Idle = {Crouching = "pistol", Standing = "revolver"},
        Aim = {Crouching = "pistol", Standing = "revolver"},
        Down = {Crouching = "normal", Standing = "normal"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
        Reload = ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
    },

    AmmoBox = {
        Idle = {Crouching = "fist", Standing = "fist"},
        Aim = {Crouching = "fist", Standing = "fist"},
        Down = {Crouching = "normal", Standing = "normal"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Deploy = ACT_GMOD_GESTURE_ITEM_PLACE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE2
    },

    Shield = {
        Idle = {Crouching = "fist", Standing = "fist"},
        Aim = {Crouching = "fist", Standing = "fist"},
        Down = {Crouching = "normal", Standing = "normal"},
        Attack = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
        Draw = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE,
        Deploy = ACT_GMOD_GESTURE_ITEM_PLACE,
        Melee = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
    }
}

--for reload, attack and draw visit: https://wiki.facepunch.com/gmod/Enums/ACT (only ACT_HL2MP_GESTURE_*)