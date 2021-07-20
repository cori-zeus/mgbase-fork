AddCSLuaFile()

function SWEP:Think()
    --fallback initialize
    if (!self.m_bInitialized && IsFirstTimePredicted()) then
        self:Initialize()
    end

    --fallback draw
    if (!self.m_bDrawn && self:IsDrawing() && IsFirstTimePredicted()) then
        self:Deploy(true)
    end

    --fallback holster
    if (!self.m_bHolstered && self:GetIsHolstering() && IsFirstTimePredicted()) then
        self:Holster(self:GetNextWeapon(), true)
    end

    --fallback reload
    if (!self.m_bReloaded && self:GetIsReloading() && IsFirstTimePredicted()) then
        self:Reload(true)
    end

    --fallback customize
    if (!game.SinglePlayer()) then
        if (self.bCustomize != self:GetIsCustomizing() && IsFirstTimePredicted()) then
            self.bCustomize = self:GetIsCustomizing()
            self:Customize()--(true) no reason to compensate this since there's no timing, fallback logic still left in the method though.
        end 
    end

    --holster
    if (self:GetIsHolstering() && CurTime() >= self:GetNextHolsterTime() && IsValid(self:GetNextWeapon()) && self:GetNextWeapon() != self && self:GetNextWeapon() != self:GetOwner()) then
        self.m_bDrawn = false
        if (game.SinglePlayer()) then
            if (CLIENT) then 
                self.m_drawWorkaround = true
                input.SelectWeapon(self:GetNextWeapon()) 
            end
        else
            if (CLIENT && IsFirstTimePredicted()) then 
                input.SelectWeapon(self:GetNextWeapon()) 
            end
        end   
        
        return
    end

    --spray
    if (CurTime() > self:GetNextPrimaryFire() + 0.15) then
        self:SetSprayRounds(0)

        --cone
        local target = Lerp(self:GetAimDelta(), self.Cone.Hip, self.Cone.Ads) * GetConVar("mgbase_sv_spread"):GetFloat()
        self:SetCone(math.Approach(self:GetCone(), target, (1 / self.Cone.Decrease) * FrameTime()))
    end

    if (CurTime() <= self:GetNextMeleeTime()) then
        self:SetCone(self.Cone.Max)
    end

    --reload
    self:ReloadBehaviourModule()

    --equip
    if (!self:IsDrawing() && self:GetNeedsToEquip()) then
        self:SetNeedsToEquip(false)
    end

    --aim
    self:AimBehaviourModule()

    --movement
    --[[if (CLIENT && IsFirstTimePredicted()) then
        self:AnimThinkModule()
    end]]

    --sprint
    self:SprintBehaviourModule()

    --ladder
    if (self:GetOwner():GetMoveType() == MOVETYPE_LADDER && !self:IsDrawing()) then
        self:Holster(self:GetOwner())
    else
        if (self:GetIsHolstering() && self:GetNextWeapon() == self:GetOwner()) then
            self:Deploy()
        end
    end

    --holdtypes
    --[[local ht = "Idle"
    if (self:GetIsAiming()) then
        ht = "Aim"
    elseif (self:GetIsSprinting() || self:GetIsHolstering()) then
        ht = "Down"
    end

    local crouching = self:GetOwner():Crouching() || self:GetOwner():KeyDown(IN_DUCK)
    self:SetHoldType(crouching && self.HoldTypes[self.HoldType][ht].Crouching || self.HoldTypes[self.HoldType][ht].Standing)]]
    --new meme marine way
    self:SetShouldHoldType()

    --firemodes
    self:FiremodeBehaviourModule()

    --melee
    self:MeleeBehaviourModule()

    --auto reload
    if (self:GetOwner():GetInfoNum("mgbase_autoreload", 1)) >= 1 then
        if (self:Clip1() <= 0 && self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType()) > 0) then
            self:Reload()
        end
    end

    --[[if (self:GetIsHolstering() && !IsValid(self:GetNextWeapon()) && CurTime() > self:GetNextHolsterTime() + 1) then
        self:Deploy()
    end useless? props get auto picked up now]]

    --[[if (CLIENT && IsFirstTimePredicted()) then
        local cmd = GetPredictionPlayer():GetCurrentCommand()
        self.MouseX = math.Clamp(self.MouseX + cmd:GetMouseX() * 0.05, -15, 15)
        self.MouseY = math.Clamp(self.MouseY + cmd:GetMouseY() * 0.05, -15, 15)
    end]] --possible free view

    --[[if (self:GetOwner():IsOnGround() && self:GetAimDelta() > 0) then
        local dir = -self:GetOwner():GetVelocity()
        local len = dir:Length() * self:SafeLerp(self:GetAimDelta(), 1, 10)
        dir:Normalize()
        dir:Mul(len)

        self:GetOwner():SetVelocity(dir * FrameTime())
    end]] --slow down when aiming, kinda works but not predicted

    --trigger
    if (CLIENT && game.SinglePlayer()) then
        return --fuck it
    end

    if (self.Trigger != nil) then
        if (self:GetOwner():KeyDown(IN_ATTACK) && self:CanTrigger()) then
            if (!self:GetIsTrigger()) then
                if (self.Trigger.PressedSound != nil) then
                    self:EmitSound(self.Trigger.PressedSound)
                end

                if (self.Trigger.PressedAnimation != nil) then
                    if (IsFirstTimePredicted()) then self:PlayViewModelAnimation(self.Trigger.PressedAnimation) end
                end
            end

            self:SetIsTrigger(true) 
        else
            if (CurTime() > self:GetNextPrimaryFire() || self.Primary.Automatic) then
                if (self:GetIsTrigger()) then
                    if (self.Trigger.ReleasedSound != nil) then
                        self:EmitSound(self.Trigger.ReleasedSound)
                    end

                    if (self.Trigger.ReleasedAnimation != nil) then
                        if (IsFirstTimePredicted()) then self:PlayViewModelAnimation(self.Trigger.ReleasedAnimation) end
                    end

                    if (!self:GetHasShotAfterTrigger() && self:CanPlayTriggerOut()) then
                        if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Idle") end
                    end
                end
                
                self:SetIsTrigger(false)
                self:SetHasShotAfterTrigger(false)
            end
        end

        if (self:GetIsTrigger()) then
            self:SetTriggerDelta(self:GetTriggerDelta() + (FrameTime() / self.Trigger.Time))

            if (self:GetTriggerDelta() >= 1) then
                if ((!self.Primary.Automatic && !self:GetHasShotAfterTrigger()) || self.Primary.Automatic) then
                    self:PrimaryAttack()
                    self:SetHasShotAfterTrigger(true)
                end

                if (self.Primary.Automatic && !self:GetOwner():KeyDown(IN_ATTACK)) then
                    self:SetIsTrigger(false)
                end
            end 
        else
            self:SetTriggerDelta(0)
        end
    end

    if (self:GetOwner():KeyDown(IN_USE) && self:GetOwner():KeyPressed(IN_ATTACK2)) then
        self:SetSafety(!self:GetSafety())
    end
end

function SWEP:CanTrigger()
    if (self:Clip1() <= 0) then
        return false
    end

    if (self:IsCustomizing()) then
        return
    end

    if (CurTime() < self:GetNextFiremodeTime()) then
        return false
    end

    if (self:GetOwner():KeyDown(IN_USE)) then
        return false
    end

    if (self:GetIsReloading() || self:GetIsHolstering() || self:IsDrawing() || self:GetIsSprinting()) then
        return false
    end

    if (CurTime() < self:GetNextMeleeTime()) then
        return false
    end

    if (CurTime() < self:GetNextSprintTime()) then
        return false
    end

    if (CurTime() < self:GetNextReloadTime() && self:GetHasFilledMag()) then --avoid people from shooting after they canceled their reloads
        return false
    end

    return true
end

function SWEP:CanPlayTriggerOut()
    if (self:IsCustomizing()) then
        return
    end

    if (self:GetIsReloading() || self:GetIsHolstering() || self:IsDrawing() || self:GetIsSprinting()) then
        return false
    end

    if (CurTime() < self:GetNextMeleeTime()) then
        return false
    end

    if (CurTime() < self:GetNextSprintTime()) then
        return false
    end

    return true
end