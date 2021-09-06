AddCSLuaFile()

function SWEP:CanChangeFiremode()
    return !self:GetIsReloading()
        && !self:IsDrawing()
        && !self:GetIsHolstering()
        && (!self:GetIsSprinting() || self:GetSafety())
        && CurTime() > self:GetNextSprintTime()
        && CurTime() > self:GetNextPrimaryFire()
        && CurTime() > self:GetNextMeleeTime()
        && !self:IsCustomizing()
end

function SWEP:FiremodeBehaviourModule()
    if (CLIENT && game.SinglePlayer()) then
        return
    end

    if (self:GetOwner():KeyDown(IN_USE) && self:GetOwner():KeyDown(IN_RELOAD) && self:CanChangeFiremode()) then
        if (CurTime() > self:GetNextFiremodeTime()) then
            local index = self:GetFiremode()

            if (self.Firemodes[index + 1]) then
                index = index + 1
            else
                index = 1
            end

            if (self:GetFiremode() != index) then
                local seqIndex = self:ApplyFiremode(index)
                
                if (game.SinglePlayer() || IsFirstTimePredicted()) then
                    self:PlayViewModelAnimation(seqIndex)
                end

                local length = 0.5

                if (self.Animations[seqIndex].Length != nil) then
                    length = self:GetAnimLength(seqIndex)
                end

                self:SetNextFiremodeTime(CurTime() + length)
                self:SetBurstRounds(0)
            end
        end
    end

    if (CLIENT && game.SinglePlayer()) then
        return
    end
    
    if (self.Primary.BurstRounds > 1 && self:GetBurstRounds() < self.Primary.BurstRounds && self:GetBurstRounds() > 0) then
        self:PrimaryAttack()
    end
end

function SWEP:ApplyFiremodeStats()
    if (index == 1) then
        seqIndex = self.Firemodes[self:GetFiremode()].OnSet() --prevent giving reference to weapon so user doesn't change defaults
    else
        seqIndex = self.Firemodes[self:GetFiremode()].OnSet(self)
    end

    return seqIndex
end

function SWEP:ApplyFiremode(index)
    local seqIndex = "Idle"

    if (type(index) == "string") then
        index = tonumber(index)
    end

    self:SetFiremode(index)

    if (game.SinglePlayer() || IsFirstTimePredicted()) then
        self:BuildCustomizedGun()
    end

    if (game.SinglePlayer() && SERVER) then
        self:CallOnClient("ApplyFiremode", index)
    end

    return self:ApplyFiremodeStats()
end