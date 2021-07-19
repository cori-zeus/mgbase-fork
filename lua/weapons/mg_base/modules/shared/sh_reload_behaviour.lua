AddCSLuaFile()

function SWEP:CanReload()
    if (self:IsCustomizing()) then
        return false
    end

    if (CurTime() < self:GetNextPrimaryFire()) then
        return false
    end

    if (self:GetIsReloading() || self:GetIsHolstering() || self:IsDrawing() || self:GetIsSprinting()) then
        return false
    end

    if (CurTime() < self:GetNextSprintTime()) then
        return false
    end

    if (CurTime() < self:GetNextMeleeTime()) then
        return false
    end

    if (CurTime() < self:GetNextFiremodeTime()) then
        return false
    end

    if (CurTime() < self:GetNextReloadTime() && self:GetHasFilledMag()) then --avoid people from reloading after they canceled their reloads
        return false
    end
 
    if (self:Ammo1() <= 0) then
        return false
    end

    if (self:GetOwner():KeyDown(IN_USE)) then
        return false
    end

    if (self:IsDrawing()) then
        return false
    end

    return true
end

function SWEP:CanInspect()
    if (self:IsCustomizing()) then
        return false
    end

    if (CurTime() < self:GetNextPrimaryFire()) then
        return false
    end

    if (self:GetIsReloading() || self:GetIsHolstering() || self:IsDrawing() || self:GetIsSprinting()) then
        return false
    end

    if (CurTime() < self:GetNextSprintTime()) then
        return false
    end

    if (CurTime() < self:GetNextMeleeTime()) then
        return false
    end

    if (CurTime() < self:GetNextFiremodeTime()) then
        return false
    end

    if (self:GetOwner():KeyDown(IN_USE)) then
        return false
    end

    if (self:GetAimDelta() > 0) then
        return false
    end

    if (self:GetIsSprinting()) then
        return
    end

    if (self:IsDrawing()) then
        return false
    end
    
    return true
end

function SWEP:Reload(fromFallback)
    fromFallback = fromFallback || false

    if (self:Clip1() >= self:GetMaxClip1() || self:Ammo1() <= 0) then
        if (CurTime() > self:GetNextInspectTime() && self:CanInspect()) then
            if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Inspect") end
            self:SetNextInspectTime(CurTime() + self:GetAnimLength("Inspect"))
        end

        return
    end

    if (!fromFallback && !self:CanReload()) then
        return
    end

    local seqIndex = "Reload"

    if (self:Clip1() <= 0 && self.Animations["Reload_Empty"]) then
        seqIndex = "Reload_Empty"
    end

    local length = self:GetAnimLength(seqIndex)
    local magLength = self:GetAnimLength(seqIndex, self.Animations[seqIndex].MagLength)

    self:SetNextReloadTime(CurTime() + length)
    self:SetNextMagTime(CurTime() + magLength)
    self:SetHasFilledMag(false)
    self:SetIsReloading(true)
    self:SetBurstRounds(0)

    self:PlayerGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, self.HoldTypes[self.HoldType].Reload)

    if (IsFirstTimePredicted()) then self:PlayViewModelAnimation(seqIndex, fromFallback) end

    self.m_bReloaded = true
end

function SWEP:ReloadBehaviourModule()
    if (self:GetIsReloading()) then
        if (CurTime() > self:GetNextMagTime() && !self:GetHasFilledMag()) then
            local maxClip = self:GetMaxClip1()

            if (self.CanChamberRound && self:Clip1() > 0) then
                maxClip = maxClip + 1
            end

            local ammoNeeded = math.min(maxClip - self:Clip1(), self:Ammo1())

            self:SetClip1(self:Clip1() + ammoNeeded)
            self:GetOwner():SetAmmo(self:Ammo1() - ammoNeeded, self:GetPrimaryAmmoType())

            self:SetHasFilledMag(true)
        end

        if (CurTime() > self:GetNextReloadTime()) then
            self:SetIsReloading(false)
            self.m_bReloaded = false
        end
    end
end