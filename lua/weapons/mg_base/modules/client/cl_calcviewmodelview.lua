AddCSLuaFile()

local CalcVMViewHookBypass = false

function SWEP:GetViewModelPosition(pos, ang)
    if (CalcVMViewHookBypass == true) then
        return pos, ang
    end 

    if (self:GetOwner():InVehicle()) then
        self.m_ViewModel:SetPos(pos)
        self.m_ViewModel:SetAngles(ang)
    end

    if (IsValid(self.m_ViewModel)) then
        return self.m_ViewModel:GetPos(), self.m_ViewModel:GetAngles()
    end

    return pos, ang
end

SWEP.CrouchVector = Vector(-1, -1, -1)

function SWEP:CalcViewModel(ViewModel, EyePos, EyeAng)
    if (!IsValid(self:GetOwner())) then
        return
    end

    if (self:GetOwner():GetInfoNum("mgbase_debug_freeview", 0) > 0) then
        return
    end

    --anims
    self:AnimThinkModule()
    
    local vars = self.ViewModelVars

    vars.LerpAimDelta = self:SafeLerp(10 * FrameTime(), vars.LerpAimDelta, self:GetAimDelta())

    --jump
    self:CalcViewModelJump()
    
    --movement sway
    self:CalcMovementSway()

    --fake recoil
    self:CalcRecoil()
    local recoilPos, recoilAng = vars.Recoil.Translation, vars.Recoil.Rotation

    --sway
    self:CalcSway(EyeAng)
    
    --idle and aim offsets
    local aimPos, aimAng = self:GetAvailableAimOffsets()
    aimAng = aimAng * 1
    aimAng:Mul(self:SafeLerp(self:GetAimDelta(), 0, 1))

    local idleAng = self.ViewModelOffsets.Idle.Angles * self:SafeLerp(self:GetAimDelta(), 1, 0)

    self:SafeLerpAngle(50 * FrameTime(), vars.LerpAimAngles, aimAng)

    EyeAng:Add(vars.LerpAimAngles)
    EyeAng:Add(idleAng)
    --end idle and aim offsets

    --viewpunch
    local vpAngles = self:GetOwner():GetViewPunchAngles()
    vpAngles:Mul(self:SafeLerp(self:GetAimDelta(), 0.2, 0.01))

    EyeAng:Add(vpAngles)
    --end viewpunch

    --jump
    local jumpAngles = Angle(vars.Jump.Lerp, 0, 0)
    jumpAngles:Mul(self:SafeLerp(vars.LerpAimDelta, 1, 0.1))

    EyeAng:Add(jumpAngles)
    --end jump

    --sway
    local swayAngles = Angle(vars.Sway.Y.Lerp, vars.Sway.X.Lerp, 0)
    swayAngles:Mul(self:SafeLerp(vars.LerpAimDelta, 1, 0.1))

    EyeAng:Add(swayAngles)
    --end sway
    
    --fake recoil
    EyeAng:Add(recoilAng)
    --end fake recoil

    local forward = EyeAng:Forward()
    local right = EyeAng:Right()
    local up = EyeAng:Up()

    --recoil
    local intensity = (math.Clamp(self:GetOwner():GetViewPunchAngles().p / 90, -1, 1) * 20) * self:SafeLerp(self:GetAimDelta(), 0.3 * self.ViewModelOffsets.RecoilMultiplier, 0.01 * self.ViewModelOffsets.RecoilMultiplier)
    self:VectorAddAndMul(EyePos, up, intensity * 0.3)
    self:VectorAddAndMul(EyePos, forward, intensity)
    self:VectorAddAndMul(EyePos, forward, -self.Camera.Shake 
    * self:SafeLerp(self:GetAimDelta(), 0.7, 1.3) * (self.ViewModelOffsets.KickMultiplier 
    * self:SafeLerp(self:GetAimDelta(), 1, self.ViewModelOffsets.AimKickMultiplier || 1)))
    --end recoil
    
    --movement
    self:VectorAddAndMul(EyePos, up, vars.Jump.LerpZ * -0.05 * self:SafeLerp(vars.LerpAimDelta, 1, 0.1))
    self:VectorAddAndMul(EyePos, forward, -vars.LerpForward * self:SafeLerp(vars.LerpAimDelta, 2, 0.3))
    self:VectorAddAndMul(EyePos, right, -vars.LerpRight * self:SafeLerp(vars.LerpAimDelta, 1, 0.05))
    --end movement

    --idle
    self:VectorAddAndMul(EyePos, up, math.cos(CurTime() * 2) * math.cos(CurTime()) * 0.1 * self:SafeLerp(vars.LerpAimDelta, 1, 0))
    self:VectorAddAndMul(EyePos, right, math.cos(CurTime() * 2) * math.sin(CurTime()) * 0.1 * self:SafeLerp(vars.LerpAimDelta, 1, 0))
    -- end of idle

    --sway
    self:VectorAddAndMul(EyePos, up, (vars.Sway.PosY.Lerp * 0.25) * self:SafeLerp(vars.LerpAimDelta, 1, 0.35))
    self:VectorAddAndMul(EyePos, forward, (vars.Sway.PosForward.Lerp * 0.1) * self:SafeLerp(vars.LerpAimDelta, 1, 0.35))
    self:VectorAddAndMul(EyePos, right, (vars.Sway.PosX.Lerp * 0.25) * self:SafeLerp(vars.LerpAimDelta, 1, 0.35))
    --end sway

    --offsets
    self:SafeLerpVector(50 * FrameTime(), vars.LerpAimPos, aimPos)

    local aimOffset = self:CalcOffset(vars.LerpAimPos, EyeAng * 1)
    aimOffset:Mul(self:SafeLerp(self:GetAimDelta(), 0, 1))

    local idleOffset = self:CalcOffset(self.ViewModelOffsets.Idle.Pos, EyeAng * 1)
    idleOffset:Mul(self:SafeLerp(self:GetAimDelta(), 1, 0))

    local vmOffset = Vector()
    vmOffset:Add(EyeAng:Right() * GetConVar("mgbase_fx_vm_pos_x"):GetFloat())
    vmOffset:Add(EyeAng:Forward() * GetConVar("mgbase_fx_vm_pos_y"):GetFloat())
    vmOffset:Add(EyeAng:Up() * GetConVar("mgbase_fx_vm_pos_z"):GetFloat())
    if self:GetAimDelta() && !GetConVar("mgbase_fx_vm_pos_ads_affected"):GetBool() then
        vmOffset:Mul(1 - self:GetAimDelta())
    end
    EyePos:Add(vmOffset)

    EyePos:Add(aimOffset)
    EyePos:Add(idleOffset)
    --end offsets

    --crouch
    self:SafeLerpVector(10 * FrameTime(), vars.LerpCrouch, self:CalcCrouchOffset())
    vars.LerpCrouch:Mul(1 - self:GetAimDelta())

    self:VectorAddAndMul(EyePos, up, vars.LerpCrouch.z)
    self:VectorAddAndMul(EyePos, forward, vars.LerpCrouch.y)
    self:VectorAddAndMul(EyePos, right, vars.LerpCrouch.x)
    --end crouch

    --fake recoil
    self:VectorAddAndMul(EyePos, up, recoilPos.z)
    self:VectorAddAndMul(EyePos, forward, recoilPos.y)
    self:VectorAddAndMul(EyePos, right, recoilPos.x)
    --end fake recoil

    CalcVMViewHookBypass = true
    EyePos, EyeAng = hook.Run("CalcViewModelView", self, self.m_ViewModel, self.m_ViewModel:GetPos(), self.m_ViewModel:GetAngles(), EyePos * 1, EyeAng * 1)
    CalcVMViewHookBypass = false

    self.m_ViewModel:SetPos(EyePos)
    self.m_ViewModel:SetAngles(EyeAng)

    self.ViewModelFOV = self:SafeLerp(self.Camera.Fov, self.m_OriginalViewModelFOV, self.m_OriginalViewModelFOV * self.Zoom.ViewModelFovMultiplier) * math.max(GetConVar("mgbase_fx_vm_fov"):GetFloat(), 0.1)
end

function SWEP:CalcViewModelJump()
    local vars = self.ViewModelVars

    if (self:GetOwner() == NULL) then
        return
    end

    if (vars.Jump.bWasOnGround != self:GetOwner():OnGround()) then
        if (self:GetOwner():OnGround()) then
            vars.Jump.Force = math.min(vars.Jump.Velocity * -0.075, 30)
            vars.Jump.ForceZ = vars.Jump.Force
            vars.Jump.Time = 0
            vars.Jump.Shake = vars.Jump.Force * 0.3
        else
            timer.Simple(0, function()
                vars.Jump.Force = self:GetOwner():GetVelocity().z * 0.15
                vars.Jump.ForceZ = vars.Jump.Force
                vars.Jump.Time = 0
            end)
        end

        vars.Jump.bWasOnGround = self:GetOwner():IsOnGround()
    end

    vars.Jump.Velocity = self:GetOwner():GetVelocity().z
    
    vars.Jump.Time = vars.Jump.Time + FrameTime()

    vars.Jump.Force = self:SafeLerp(6 * FrameTime(), vars.Jump.Force, 0)
    vars.Jump.ForceZ = self:SafeLerp(3 * FrameTime(), vars.Jump.ForceZ, 0)

    vars.Jump.Lerp = self:SafeLerp(10 * FrameTime(), vars.Jump.Lerp, math.sin(vars.Jump.Time * 10) * vars.Jump.Force)
    vars.Jump.LerpZ = self:SafeLerp(6 * FrameTime(), vars.Jump.LerpZ, math.sin(vars.Jump.Time * 7) * vars.Jump.ForceZ)
end

function SWEP:GetAvailableAimOffsets()
    local pos, ang = self.ViewModelOffsets.Aim.Pos, self.ViewModelOffsets.Aim.Angles

    if (self.LaserAimPos != nil && self.LaserAimAngles != nil && self:GetCurrentLaser() != nil && self:GetCurrentHybrid() == nil) then
        pos = self.LaserAimPos
        ang = self.LaserAimAngles
    end

    if (self.HybridAimPos != nil && self.HybridAimAngles != nil && self:GetCurrentHybrid() != nil) then
        pos = self.HybridAimPos
        ang = self.HybridAimAngles
    end

    return LerpVector(self:GetAimModeDelta(), self.ViewModelOffsets.Aim.Pos, pos), LerpAngle(self:GetAimModeDelta(), self.ViewModelOffsets.Aim.Angles, ang)
end

function SWEP:CalcMovementSway()
    local velVector = Vector(self:GetOwner():GetVelocity().x, self:GetOwner():GetVelocity().y, 0)
    local forward = Angle(0, self:GetOwner():EyeAngles().yaw, 0):Forward():Dot(velVector) / self:GetOwner():GetWalkSpeed()
    local right = Angle(0, self:GetOwner():EyeAngles().yaw, 0):Right():Dot(velVector) / self:GetOwner():GetWalkSpeed()

    if (self:GetIsSprinting()) then
        forward = 0
        right = 0
    end

    forward = math.Clamp(forward, -1, 1)
    right = math.Clamp(right, -1, 1)
    
    local vars = self.ViewModelVars
    vars.LerpForward = self:SafeLerp(10 * FrameTime(), vars.LerpForward, math.max(forward, 0))
    vars.LerpRight = self:SafeLerp(10 * FrameTime(), vars.LerpRight, right)
end

function SWEP:CalcSway(ang)
    if (self.DisableSway) then
        return 
    end
    
    local x = ang.yaw
    local y = ang.pitch
    local vars = self.ViewModelVars.Sway

    self:CalcSwayAxis(vars.X, x, 10, 0.035)
    self:CalcSwayAxis(vars.Y, y, 10, 0.035)
    self:CalcSwayAxis(vars.PosX, x, 7.5, 0.035)
    self:CalcSwayAxis(vars.PosY, y, 7.5, 0.035)
    self:CalcSwayAxis(vars.PosForward, x, 10, 0.1)
end

function SWEP:CalcSwayAxis(swayObject, angle, speed, bounce)
    local vel = self:GetOwner():GetVelocity():Length()
    local limit = 4 + (vel * 0.015)

    if (swayObject.Ang != angle) then
        swayObject.Sway = math.Clamp(swayObject.Sway + math.AngleDifference(angle, swayObject.Ang) * 0.3, -limit, limit)
    end

    swayObject.Ang = angle
    swayObject.Direction = self:SafeLerp(math.min(speed * FrameTime(), speed), swayObject.Direction, (0 - swayObject.Sway) * bounce)
    swayObject.Sway = swayObject.Sway + (swayObject.Direction * math.min(FrameTime() * 250, speed))
    swayObject.Lerp = self:SafeLerp(math.min(speed * 2 * FrameTime(), speed), swayObject.Lerp, swayObject.Sway)
end

function SWEP:CalcOffset(offset, ang)
    local result = Vector(0, 0, 0)
    local forward = ang:Forward()
    local right = ang:Right()
    local up = ang:Up()

    forward:Mul(offset.y)
    right:Mul(offset.x)
    up:Mul(offset.z)

    result:Add(forward)
    result:Add(right)
    result:Add(up)

    return result
end

function SWEP:CalcCrouchOffset()
    if (self:GetOwner():Crouching() && self:GetOwner():IsOnGround()) then
        return self.CrouchVector
    end

    return self.ZeroVector
end

function SWEP:CalcRecoil()
    local aimDelta = self:SafeLerp(self:GetAimDelta(), 0.75, 0.2)

    if (self.Primary.Automatic) then
        local speed = 25
        local verticalTrans = math.sin(CurTime() * speed * 0.5) * 0.05
        local verticalRot = math.cos(CurTime() * speed * 0.5) * 0.25

        local horizRecoil = math.max(math.abs(self.Recoil.Horizontal[1]), math.abs(self.Recoil.Horizontal[2]))

        if (self.Recoil.ViewModelMultiplier != nil) then
            horizRecoil = horizRecoil * self.Recoil.ViewModelMultiplier
        end
        
        local horizontalTrans = math.cos(CurTime() * speed) * horizRecoil * 0.1
        local horizontalRot = math.sin(CurTime() * speed) * horizRecoil * 0.5

        local delta = math.min(self:GetSprayRounds() / 10, 1)
        
        if (self:GetOwner():KeyDown(IN_ATTACK) && self:Clip1() > 0) then
            local pos1 = Vector(horizontalTrans, 0, verticalTrans)
            pos1:Mul(delta)

            local pos2 = self:GetSprayRounds() > 1 && Vector(0, -1, 0.3) || Vector(0, 0, 0) --avoid editing zerovector
            pos2:Add(pos1)
            pos2:Mul(aimDelta)

            self:SafeLerpVector(math.min(30 * FrameTime(), 1), self.ViewModelVars.Recoil.Translation, pos2)

            local ang1 = Angle(verticalRot, -horizontalRot, horizontalRot * 2)
            ang1:Mul(delta)

            local ang2 = self:GetSprayRounds() > 1 && Angle(0, 0, -5) || Angle(0, 0, 0) --avoid editing zeroangle
            ang2:Add(ang1)
            ang2:Mul(aimDelta)

            self.ViewModelVars.Recoil.Rotation = LerpAngle(math.min(30 * FrameTime(), 1), self.ViewModelVars.Recoil.Rotation, ang2)
        else
            self:SafeLerpVector(math.min(10 * FrameTime(), 1), self.ViewModelVars.Recoil.Translation, self.ZeroVector)
            self.ViewModelVars.Recoil.Rotation = LerpAngle(math.min(10 * FrameTime(), 1), self.ViewModelVars.Recoil.Rotation, self.ZeroAngle)
        end
    end

    --haha :).
end