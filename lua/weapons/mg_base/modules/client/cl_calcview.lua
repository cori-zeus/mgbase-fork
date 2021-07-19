AddCSLuaFile()

function SWEP:GetCameraAttachment()
    return self.m_ViewModel:GetAttachment(self.m_ViewModel:LookupAttachment("camera"))
end

function SWEP:SafeLerp(rate, current, target)
    if (math.abs(current - target) < 0.001) then
        return target
    end

    return Lerp(rate, current, target)
end

function SWEP:VectorAddAndMul(current, add, mul)
    current.x = current.x + (add.x * mul)
    current.y = current.y + (add.y * mul)
    current.z = current.z + (add.z * mul)
end

function SWEP:SafeLerpVector(rate, current, target)
    current.x = self:SafeLerp(rate, current.x, target.x)
    current.y = self:SafeLerp(rate, current.y, target.y)
    current.z = self:SafeLerp(rate, current.z, target.z)
end

function SWEP:SafeLerpAngle(rate, current, target)
    current.p = self:SafeLerp(rate, current.p, target.p)
    current.y = self:SafeLerp(rate, current.y, target.y)
    current.r = self:SafeLerp(rate, current.r, target.r)
end

SWEP.ZeroVector = Vector(0, 0, 0)
SWEP.ZeroAngle = Angle(0, 0, 0)

function SWEP:CalcView(ply, pos, ang, fov)
    if (!IsValid(self.m_ViewModel)) then
        return pos, ang, fov
    end

    ang.p = math.Clamp(ang.p, -89, 89)
    
    local rpm = math.Clamp(self.Primary.RPM / 10, 55, 90)
    local rate = 60 / (rpm * 10)
    rate = 20 - (rate * 100)
    self.Camera.Shake = self:SafeLerp(rate * FrameTime(), self.Camera.Shake, 0)

    if (ply:GetInfoNum("mgbase_debug_freeview", 0) <= 0) then
        self.m_ViewModel:SetAngles(ang)
        self._eyeang = ang * 1
    end

    local camAtt = self:GetCameraAttachment()

    if (camAtt != nil) then
        local cameraAttAngles = camAtt.Ang
        cameraAttAngles:Sub(self.m_ViewModel:GetAngles())
        
        ang:Add(cameraAttAngles)
    end

    local pitch = (math.cos(CurTime() * rpm) * (self.Camera.Shake * 0.5)) * self:SafeLerp(self:GetAimDelta(), 1, 0.4)

    local recoilAndShakeAngles = Angle(pitch, 0, math.sin(CurTime() * rpm))
    recoilAndShakeAngles:Mul(self.Camera.Shake)

    ang:Add(recoilAndShakeAngles)

    local vpAngles = self:GetOwner():GetViewPunchAngles()
    vpAngles:Mul(self:SafeLerp(self:GetAimDelta(), 0.2, 0.01))

    ang:Sub(vpAngles)

    --breathing
    self.Camera.LerpBreathing = LerpAngle(10 * FrameTime(), self.Camera.LerpBreathing, self:GetBreathingAngle())

    if (GetConVar("mgbase_debug_disablebreathing"):GetInt() <= 0) then
        ang:Add(self.Camera.LerpBreathing)
    end
    --end breathing

    self:VectorAddAndMul(pos, ang:Forward(), -self.Camera.Shake)
    
    self.Camera.Fov = self:SafeLerp(10 * FrameTime(), self.Camera.Fov, self:GetAimDelta())

    local diff = 0

    if (self:GetIsReloading()) then
        diff = (1 - self.Zoom.FovMultiplier) * 0.25
    end

    self.Camera.LerpReloadFov = self:SafeLerp(4 * FrameTime(), self.Camera.LerpReloadFov, diff)

    local fovMultiplier = self:SafeLerp(self.Camera.Fov, 1, self.Zoom.FovMultiplier + self.Camera.LerpReloadFov)

    fov = (fov * fovMultiplier) + (self.Camera.Shake * 1.5)

    --VIEWMODEL
    self:CalcViewModel(self:GetOwner():GetViewModel(), pos * 1, ang * 1)
    --END VIEWMODEL

    self:CalcCustomizationView(pos, ang)

    self._fov = fov
    
    return pos, ang, fov
end

function SWEP:CalcCustomizationView(pos, ang)
    local bCustomizing = self:IsCustomizing()

    self.Camera.LerpCustomization = self:SafeLerp(5 * FrameTime(), self.Camera.LerpCustomization, bCustomizing && 1 || 0)

    local lerp = self.Camera.LerpCustomization
    local forward = ang:Forward()
    forward:Mul(lerp * -3)

    pos:Add(forward)

    local deltaX = self:SafeLerp(self.MouseX / ScrW(), -15, 15)
    local deltaY = self:SafeLerp(self.MouseY / ScrH(), -15, 15)

    local freeView = Angle(deltaY, -deltaX, 0)
    freeView:Mul(lerp * 0.2)

    ang:Add(freeView)
end