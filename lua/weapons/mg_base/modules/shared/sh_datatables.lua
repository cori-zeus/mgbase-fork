AddCSLuaFile()

function SWEP:SetupDataTables()
    self:NetworkVar("Float", "0", "NextReloadTime")
    self:NetworkVar("Float", "1", "NextMagTime")
    self:NetworkVar("Float", "2", "NextDrawTime")
    self:NetworkVar("Float", "3", "NextHolsterTime")
    self:NetworkVar("Float", "4", "AimDelta")
    self:NetworkVar("Float", "5", "Cone")
    self:NetworkVar("Float", "6", "NextSprintTime")
    self:NetworkVar("Float", "7", "NextInspectTime")
    self:NetworkVar("Float", "8", "NextFiremodeTime")
    self:NetworkVar("Float", "9", "NextMeleeTime")
    self:NetworkVar("Float", "14", "TriggerDelta")
    self:NetworkVar("Float", "15", "NextAimModeTime")
    self:NetworkVar("Float", "20", "AimModeDelta")
    self:NetworkVar("Float", "21", "BreathingDelta")
    
    self:NetworkVar("Bool", "0", "HasFilledMag")
    self:NetworkVar("Bool", "1", "NeedsToEquip")
    self:NetworkVar("Bool", "2", "IsReloading")
    self:NetworkVar("Bool", "3", "IsHolstering")
    self:NetworkVar("Bool", "4", "IsAiming")
    self:NetworkVar("Bool", "5", "IsSprinting")
    self:NetworkVar("Bool", "14", "IsTrigger")
    self:NetworkVar("Bool", "15", "HasShotAfterTrigger")
    self:NetworkVar("Bool", "20", "IsCustomizing") --some delay to account for other sweps having data tables
    self:NetworkVar("Bool", "21", "ToggleAim")
    self:NetworkVar("Bool", "22", "Safety")
    self:NetworkVar("Bool", "23", "AimModeUsePressed")
    self:NetworkVar("Bool", "24", "HasRunOutOfBreath")

    self:NetworkVar("Entity", "0", "NextWeapon")

    self:NetworkVar("Int", "0", "SprayRounds")
    self:NetworkVar("Int", "1", "Firemode")
    self:NetworkVar("Int", "2", "BurstRounds")
    self:NetworkVar("Int", "3", "PenetrationCount")
    self:NetworkVar("Int", "4", "AimMode")

    self:NetworkVar("String", "0", "Camo")

    self:NetworkVar("Angle", "0", "BreathingAngle")
end