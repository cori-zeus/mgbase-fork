AddCSLuaFile()

SWEP.Base = "mg_base"
DEFINE_BASECLASS("mg_base")

function SWEP:Reload(fromFallback)
    fromFallback = fromFallback || false

    if (!fromFallback && !self:CanReload()) then
        return
    end

    if (self:Clip1() >= self:GetMaxClip1() + 1) then
        if (CurTime() > self:GetNextInspectTime() && self:GetAimDelta() == 0) then
            if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Inspect") end
            self:SetNextInspectTime(CurTime() + self:GetAnimLength("Inspect"))
        end

        return
    end

    local seqIndex = "Reload_Start"
    local length = self:GetAnimLength(seqIndex)
    local magLength = self:GetAnimLength(seqIndex, self.Animations[seqIndex].MagLength)

    self:SetNextReloadTime(CurTime() + length)
    self:SetNextMagTime(CurTime() + magLength)
    self:SetHasFilledMag(false)
    self:SetIsReloading(true)
    self:SetBurstRounds(0)

    self:PlayerGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, self.HoldTypes[self.HoldType].Reload)

    if (IsFirstTimePredicted()) then self:PlayViewModelAnimation(seqIndex) end

    self.m_bReloaded = true
end

function SWEP:ReloadBehaviourModule()
    if (self:GetIsReloading()) then
        if (CurTime() > self:GetNextMagTime() && !self:GetHasFilledMag()) then
            self:SetClip1(self:Clip1() + 1)
            self:GetOwner():SetAmmo(self:Ammo1() - 1, self:GetPrimaryAmmoType())

            self:SetHasFilledMag(true)
        end

        if (CurTime() > self:GetNextReloadTime()) then
            local maxClip = self.Primary.ClipSize

            if (self:GetHasPumped() && self.CanChamberRound) then
                maxClip = maxClip + 1
            end

            if (self:Clip1() >= maxClip || self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType()) <= 0) then
                self:EndReload()
                return
            end

            if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Reload_Loop") end

            self:SetNextReloadTime(CurTime() + self:GetAnimLength("Reload_Loop"))
            self:SetNextMagTime(CurTime() + self:GetAnimLength("Reload_Loop", self.Animations["Reload_Loop"].MagLength))
            self:SetHasFilledMag(false)

            self:PlayerGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, self.HoldTypes[self.HoldType].Reload)
        end
    end
end

function SWEP:EndReload()
    if (!self:GetHasPumped() && self:Clip1() > 0) then
        if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Reload_End_Empty") end
        self:SetNextPrimaryFire(CurTime() + self:GetAnimLength("Reload_End_Empty"))
        self:SetHasPumped(true)
    else
        if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Reload_End") end
        self:SetNextPrimaryFire(CurTime() + self:GetAnimLength("Reload_End"))
    end

    self:SetIsReloading(false)
end

function SWEP:Think()
    BaseClass.Think(self)

    if (CurTime() >= self:GetNextPrimaryFire() && self:CanPump()) then
        if (!self:GetHasPumped()) then
            local anim = "Rechamber"

            if (self.Animations["Rechamber"] == nil) then
                anim = "Reload_End_Empty"
            end

            if (IsFirstTimePredicted()) then self:PlayViewModelAnimation(anim) end

            self:SetNextPrimaryFire(CurTime() + self:GetAnimLength(anim))
            self:SetHasPumped(true)
        end
    end
end

function SWEP:CanPump()
    return !self:GetIsHolstering()
        && !self:IsDrawing()
        && self:Clip1() > 0
        && !self:GetIsReloading()
        && CurTime() > self:GetNextMeleeTime()
        --&& self.Animations["Rechamber"] != nil
end

function SWEP:CanCustomize()
    if (!self:GetHasPumped()) then
        return false
    end
    
    return BaseClass.CanCustomize(self)
end

function SWEP:CanAttack()
    local bCanAttack = BaseClass.CanAttack(self)

    if (self:GetIsReloading() && !self:IsCustomizing()) then
        bCanAttack = true
    end

    return bCanAttack
end

function SWEP:PrimaryAttack()
    if (!self:CanAttack()) then
        return
    end

    if (self:Clip1() <= 0) then
        return
    end

    if (self:GetIsReloading()) then
        self:EndReload()
        return
    end

    if (self.Animations.Rechamber || self:Clip1() <= 1) then
        self:SetHasPumped(false)
    end
    
    BaseClass.PrimaryAttack(self) --it'll check twice for canattack here, but whatever
end

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)

    self:NetworkVar("Bool", "7", "HasPumped")
end

function SWEP:Initialize()
    BaseClass.Initialize(self)

    self:SetHasPumped(true)
end

function SWEP:SprintBehaviourModule()
    if (self:Clip1() > 0 && !self:GetHasPumped()) then
        self:SetIsSprinting(false)
    end

    BaseClass.SprintBehaviourModule(self)
end
