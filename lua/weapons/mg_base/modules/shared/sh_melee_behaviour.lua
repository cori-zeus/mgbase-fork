AddCSLuaFile()

function SWEP:CanMelee()
    return !self:GetIsSprinting()
        && !self:GetIsHolstering()
        && !self:IsDrawing()
        && CurTime() > self:GetNextPrimaryFire()
        && CurTime() > self:GetNextSprintTime()
        && !self:IsCustomizing()
end

function SWEP:MeleeBehaviourModule()
    if (game.SinglePlayer() && CLIENT) then return end

    if ((self:GetOwner():KeyDown(IN_USE) || self.Melee) && self:GetOwner():KeyPressed(IN_ATTACK)) then 
        self:SetSafety(false)
        if (self:CanMelee()) then
            if (CurTime() > self:GetNextMeleeTime()) then

                self:SetIsReloading(false)
                self:PlayerGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, self.HoldTypes[self.HoldType].Melee)
                
                local size = self.Animations["Melee"].Size
                local range = self.Animations["Melee"].Range

                --self:GetOwner():LagCompensation(true)
                
                --[[local tr = util.TraceHull({
                    start = self:GetOwner():EyePos(),
                    endpos = self:GetOwner():EyePos() + self:GetOwner():EyeAngles():Forward() * range,
                    filter = {self:GetOwner(), self},
                    mins = Vector(-size, -size, -size),
                    maxs = Vector(size, size, size),
                    mask = MASK_SHOT_HULL,
                })]]    
                
                local bHit = false

                self:FireBullets({
                    Src = self:GetOwner():EyePos(),
                    Dir = self:GetOwner():EyeAngles():Forward(),
                    Distance = range,
                    HullSize = size,
                    Tracer = 0,
                    Callback = function(attacker, btr, dmgInfo)
                        dmgInfo:SetDamage(self.Animations["Melee_Hit"].Damage)
                        dmgInfo:SetInflictor(self)
                        dmgInfo:SetAttacker(self:GetOwner())
                        dmgInfo:SetDamagePosition(btr.HitPos)
                        dmgInfo:SetDamageForce(self:GetOwner():EyeAngles():Forward() * (self.Animations["Melee_Hit"].Damage * 100))
                        dmgInfo:SetDamageType(DMG_CLUB + DMG_ALWAYSGIB)

                        bHit = true
                    end
                })

                if (bHit) then
                    self:SetNextMeleeTime(CurTime() + self:GetAnimLength("Melee_Hit", self.Animations["Melee_Hit"].Length))
                    if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Melee_Hit") end
                else
                    self:SetNextMeleeTime(CurTime() + self:GetAnimLength("Melee", self.Animations["Melee"].Length))
                    if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Melee") end
                end 

                --debugoverlay.Box(tr.HitPos, Vector(-size, -size, -size), Vector(size, size, size), 10, Color(255, 0, 0, 50))

                --self:GetOwner():LagCompensation(false)
            end
        end
    end
end