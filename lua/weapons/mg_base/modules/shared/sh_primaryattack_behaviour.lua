AddCSLuaFile()

function SWEP:CanAttack()
    if (self:Clip1() <= 0) then
        return false
    end

    if (self:IsCustomizing()) then
        return
    end

    if (CurTime() < self:GetNextPrimaryFire()) then
        return false
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

    if (self.Trigger && self:GetTriggerDelta() < 1) then
        return false
    end

    return true
end

function SWEP:CalculateRecoil()
    math.randomseed(self.Recoil.Seed + self:GetSprayRounds())

    local verticalRecoil = math.min(self:GetSprayRounds(), math.min(self:GetMaxClip1() * 0.33, 20)) * 0.1 + math.Rand(self.Recoil.Vertical[1], self.Recoil.Vertical[2]) * GetConVar("mgbase_sv_recoil"):GetFloat()
    local horizontalRecoil = math.Rand(self.Recoil.Horizontal[1], self.Recoil.Horizontal[2]) * GetConVar("mgbase_sv_recoil"):GetFloat()
    local angles = Angle(-verticalRecoil, horizontalRecoil, horizontalRecoil * -0.3)

    return angles * Lerp(self:GetAimDelta(), 1, self.Recoil.AdsMultiplier)
end

function SWEP:CalculateCone()
    math.randomseed(self.Cone.Seed + self:Clip1() + self:Ammo1())
    return math.Clamp(math.Rand(-self:GetCone(), self:GetCone()) * 1000, -self:GetCone(), self:GetCone())

    --local verticalCone = math.random(self.Cone.Vertical[1], self.Recoil.Vertical[2])
    --local horizontalRecoil = math.random(self.Recoil.Horizontal[1], self.Recoil.Horizontal[2])
    --local angles = Angle(verticalRecoil, horizontalRecoil, horizontalRecoil * -0.3)

    --return angles * Lerp(1, self.Recoil.AdsMultiplier, self:GetAimDelta())
end

function SWEP:MetersToHU(meters)
    return (meters * 100) / 2.54
end

function SWEP:BulletCallbackInternal(attacker, tr, dmgInfo)
    local dist = tr.HitPos:Distance(self:GetOwner():GetShootPos())
    local effectiveRange = self:MetersToHU(self.Bullet.EffectiveRange)
    local damage = Lerp(math.Clamp(dist / effectiveRange, 0, 1), self.Bullet.Damage[1], self.Bullet.Damage[2])
    
    local pen = self.Bullet.Penetration

    if (pen != nil) then
        if (self:GetPenetrationCount() < pen.MaxCount) then
            local mul = pen.DamageMultiplier
            local c = pen.MaxCount - self:GetPenetrationCount()

            while (c > 0) do
                mul = mul * pen.DamageMultiplier
                c = c - 1
            end

            damage = damage * mul
        end
    end

    if (tr.Entity:IsPlayer()) then
        damage = damage * GetConVar("mgbase_sv_pvpdamage"):GetFloat()
    elseif (tr.Entity:IsNPC() || tr.Entity:IsNextBot()) then
        damage = damage * GetConVar("mgbase_sv_pvedamage"):GetFloat()
    end

    if (SERVER) then
        debugoverlay.Text(tr.HitPos, math.Round(damage, 1), 5, false)
    end

    dmgInfo:SetDamage(damage)
    dmgInfo:SetDamageType(DMG_BULLET)
    dmgInfo:SetDamageForce(tr.Normal * (self.Bullet.Damage[2] * self.Bullet.PhysicsMultiplier * 200))

    if (damage <= 1.9) then
        return
    end

    if (tr.HitTexture == "**displacement**") then
        return
    end

    if (pen != nil && self:GetPenetrationCount() > 0) then

        if (tr.HitNoDraw || tr.HitSky) then
            return
        end

        local dir = tr.Normal
        local start = tr.HitPos
        local steps = 5

        local output = {}
        local limit = 0
        while (limit < pen.Thickness) do
            limit = limit + steps
            
            local penTr = util.TraceLine({
                start = start + (dir * limit),
                endpos = start + (dir * (limit + steps)),
                mask = MASK_SHOT,
                output = output,
            })

            if (!output.StartSolid) then
                break
            end

            if (output.HitNoDraw || output.HitSky) then
                break
            end
        end

        if (output != nil && !output.StartSolid && !output.HitNoDraw && !output.HitSky) then

            self:SetPenetrationCount(self:GetPenetrationCount() - 1)

            --fire back to the wall to make hole
            self:FireBullets({
                Attacker = self:GetOwner(),
                Src = output.StartPos,
                Dir = -tr.Normal,
                Num = 1,
                Tracer = 0,
                Damage = 0
            })

            --fire forward
            self:FireBullets({
                Attacker = self:GetOwner(),
                Src = output.StartPos,
                Dir = tr.Normal,
                Num = 1,
                Tracer = 0,
                Callback = function(attacker, tr, dmgInfo)
                    self:BulletCallback(attacker, tr, dmgInfo)
                end
            })
        end
    end
end

function SWEP:BulletCallback(attacker, tr, dmgInfo)
    if (GetConVar("mgbase_sv_hitreg"):GetInt() > 0 && !game.SinglePlayer()) then
        if (CLIENT && IsFirstTimePredicted()) then
            if (!self:IsCarriedByLocalPlayer()) then
                return
            end

            net.Start("mgbase_clienthitreg", true)
                net.WriteEntity(tr.Entity)
                net.WriteVector(tr.HitPos)
            net.SendToServer()

            self:BulletCallbackInternal(attacker, tr, dmgInfo)
        end
    else
        self:BulletCallbackInternal(attacker, tr, dmgInfo)
    end
end

function SWEP:Bullets()
    self:SetPenetrationCount(self.Bullet.Penetration != nil && self.Bullet.Penetration.MaxCount || 0)

    self:FireBullets({
        Attacker = self:GetOwner(),
        Src = self:GetOwner():EyePos(),
        Dir = (self:GetOwner():EyeAngles() + self:GetOwner():GetViewPunchAngles() + self:GetBreathingAngle()):Forward(),
        Spread = Vector(self:CalculateCone(), -self:CalculateCone()) * 0.1,
        Num = self.Bullet.NumBullets,
        --Force = (self.Bullet.Damage[1] * self.Bullet.PhysicsMultiplier) * 0.01,
        Distance = self:MetersToHU(self.Bullet.Range),
        Tracer = self.Bullet.Tracer && 1 || 0,
        Callback = function(attacker, tr, dmgInfo)
            self:BulletCallback(attacker, tr, dmgInfo)
        end
    })
end

function SWEP:PrimaryAttack()
    self:SetSafety(false)

    if (!self:CanAttack()) then
        return
    end

    self:SetLastShootTime(CurTime())
    self:SetClip1(self:Clip1() - 1)
    self:SetSprayRounds(self:GetSprayRounds() + 1)

    --self:GetOwner():DoCustomAnimEvent(PLAYERANIMEVENT_ATTACK_PRIMARY, 0)
    self:PlayerGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, self.HoldTypes[self.HoldType].Attack)

    local seqIndex = "Fire"

    if (self:Clip1() <= 0 && self.Animations["Fire_Last"] != nil) then
        seqIndex = "Fire_Last"
    end
    
    if (IsFirstTimePredicted()) then self:PlayViewModelAnimation(seqIndex) end

    self:SetNextPrimaryFire(CurTime() + (60 / self.Primary.RPM))
    self:SetBurstRounds(self:GetBurstRounds() + 1)

    if (self:GetBurstRounds() >= self.Primary.BurstRounds && self.Primary.BurstRounds > 1) then
        self:SetNextPrimaryFire(CurTime() + self.Primary.BurstDelay)
        self:SetBurstRounds(0)
    end

    self:GetOwner():ViewPunch(self:CalculateRecoil())

    --bullets
    if (!self.Projectile) then
        self:Bullets()
    else
        self:Projectiles()
    end

    --cone
    self:SetCone(math.min(self:GetCone() + self.Cone.Increase * Lerp(self:GetAimDelta(), 1, self.Cone.AdsMultiplier / GetConVar("mgbase_sv_accuracy"):GetFloat()), self.Cone.Max / GetConVar("mgbase_sv_accuracy"):GetFloat()))
    
    if (CLIENT && IsFirstTimePredicted()) then
        self.Camera.Shake = self.Recoil.Shake --* Lerp(self:GetAimDelta(), 1, self.Recoil.AdsMultiplier)
    end

    self:EmitSound(self.Primary.Sound)

    if (game.SinglePlayer() || (IsFirstTimePredicted())) then
        self:HandleReverb()
    end

    if (SERVER && game.SinglePlayer()) then self:GetOwner():SendLua("Entity("..self:EntIndex()..").Camera.Shake = "..self.Recoil.Shake) end --cant be assed
    
    --smoke
    if (self.BarrelSmoke != nil) then
        if (CLIENT) then
            if (IsFirstTimePredicted()) then
                self.m_SmokeData.Current = math.min(self.m_SmokeData.Current + self.BarrelSmoke.ShotTemperatureIncrease, self.BarrelSmoke.TemperatureThreshold)
            end
        end

        if (SERVER && game.SinglePlayer()) then
            local w = "Entity("..self:EntIndex()..")"
            local sm = ".m_SmokeData"
            local current = w..sm..".Current"
            local lua = current.."= math.min("..current.." + "..self.BarrelSmoke.ShotTemperatureIncrease..", "..self.BarrelSmoke.TemperatureThreshold..")" 
            self:GetOwner():SendLua(lua)
        end
    end
end