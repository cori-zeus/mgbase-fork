AddCSLuaFile()

SWEP.Base = "mg_base"
SWEP.Primary.RPM = 600
SWEP.Primary.BurstRounds = 1
SWEP.Primary.BurstDelay = 0
SWEP.Primary.Automatic = true
SWEP.DisableSway = true

DEFINE_BASECLASS("mg_base")

function SWEP:Projectiles()
    if (CLIENT) then
        return
    end

    local proj = ents.Create(self.Projectile)

    local src = self:GetOwner():EyePos() + self:GetOwner():EyeAngles():Up() * -5 + self:GetOwner():EyeAngles():Right() * 2
    local dir = self:GetOwner():GetEyeTrace().HitPos - src 
    proj:SetPos(src)
    proj:SetAngles(dir:Angle())
    proj:SetOwner(self:GetOwner())
    proj:Spawn()
end

function SWEP:CanAttack()
    if (self:GetAimDelta() < 1) then
        return false
    end

    return BaseClass.CanAttack(self)
end

function SWEP:CanAim()
    if (self:GetIsReloading()) then
        return false
    end

    return !self:GetIsHolstering() 
    && (self:GetOwner():KeyDown(IN_ATTACK2) || self:GetOwner():KeyDown(IN_ATTACK) && self:Clip1() > 0)
    && !self:GetIsSprinting() 
    && CurTime() > self:GetNextSprintTime() 
    && CurTime() > self:GetNextMeleeTime()
end

function SWEP:DrawCrosshairSticks(x, y)
	local aimDelta = 1 - self:GetAimDelta()

	surface.SetAlphaMultiplier(aimDelta)

	--surface.SetDrawColor(0, 0, 0, 200)
	--surface.DrawRect(x - 2, y - 2, 4, 4)

	local crosshairAlpha = 200

	--dot
	local c = self:GetCone()
	local m = self.Cone.Max
	local h = self.Cone.Hip
	local dotDelta = (c - h) / (m - h) 
	if (m - h <= 0) then
		dotDelta = 0
	end
	surface.SetAlphaMultiplier(aimDelta * (1 - dotDelta))
	surface.SetDrawColor(255, 255, 255, crosshairAlpha)
	surface.DrawRect(x - 1, y - 1, 2, 2)
    surface.SetAlphaMultiplier(1)
end