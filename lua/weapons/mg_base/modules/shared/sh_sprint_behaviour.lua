AddCSLuaFile()

function SWEP:CanSprint()
    return !self:IsDrawing() 
        && !self:GetIsHolstering() 
        && CurTime() > self:GetNextPrimaryFire()
        && (self:GetSafety() || self:GetOwner():WaterLevel() > 2 || self:GetOwner():KeyDown(IN_FORWARD) || self:GetOwner():KeyDown(IN_BACK) || self:GetOwner():KeyDown(IN_MOVERIGHT) || self:GetOwner():KeyDown(IN_MOVELEFT)) --checking velocity can sometimes cause desyncs (touching server entities while sprinting)
        --&& self:GetOwner():GetVelocity():LengthSqr() > 0
        --&& self:GetOwner():EyeAngles():Forward():Dot(self:GetOwner():GetVelocity())--(!game.SinglePlayer() && self:GetOwner():GetCurrentCommand():GetForwardMove() > 0 || self:GetOwner():KeyDown(IN_FORWARD))
        --&& self:GetOwner():GetVelocity():Length() > 30 
        && (self:GetOwner():WaterLevel() > 2 || (!self:GetOwner():Crouching() || self:GetSafety()))
        && CurTime() > self:GetNextFiremodeTime()
        && CurTime() > self:GetNextMeleeTime()
        --&& !self:IsCustomizing()
end

function SWEP:CanPlaySprintOutAnim()
    return !self:IsDrawing() 
        && !self:GetIsHolstering() 
        && CurTime() > self:GetNextPrimaryFire()
        && CurTime() > self:GetNextFiremodeTime()
        && !self:IsCustomizing()
end

function SWEP:SprintBehaviourModule()
    if (CLIENT && game.SinglePlayer()) then
        return
    end
    
    if ((self:GetOwner():KeyDown(IN_SPEED) || self:GetOwner():WaterLevel() > 2 || self:GetSafety()) && self:CanSprint()) then
        self:StopCustomizing()
         
        if (!self:GetIsSprinting()) then
            if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Sprint_In") end
            self:PlayerGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, 0)
        end

        self:SetIsSprinting(true)
        self:SetIsReloading(false)
    else
        if (self:GetIsSprinting()) then
            self:SetNextSprintTime(CurTime() + self:GetAnimLength("Sprint_Out"))

            if (self:CanPlaySprintOutAnim()) then
                if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Sprint_Out") end
            end
        end

        self:SetIsSprinting(false)
    end
end
