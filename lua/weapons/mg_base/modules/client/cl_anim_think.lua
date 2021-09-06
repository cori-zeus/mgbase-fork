AddCSLuaFile()

local poseparameters = {
    aim_offset = "aim_offset",
    firemode_offset = "firemode_offset",
    jog_offset = "jog_offset",
    jog_loop = "jog_loop",
    walk_loop = "walk_loop",
    freefall_loop = "freefall_loop",
    empty_offset = "empty_offset",
    sprint_loop = "sprint_loop",
    hybrid_offset = "hybrid_offset"
}

local lerpAimDelta = 0

function SWEP:AnimThinkModule()
    --cant sync on the server yet, so for now its just client doing this

    if (!IsValid(self.m_ViewModel)) then
        return
    end

    self.m_ViewModel:SetPoseParameter(poseparameters.hybrid_offset, self:GetAimMode())

    lerpAimDelta = self:SafeLerp(30 * FrameTime(), lerpAimDelta, self:GetAimDelta())

    --next sequence
    if (self.Animations[self.m_nextSeqIndex] && self.m_ViewModel:GetCycle() > 0.98) then
        self:PlayViewModelAnimation(self.m_nextSeqIndex)
    end

    --movement animations
    self.m_ViewModel:SetPoseParameter(poseparameters.aim_offset, lerpAimDelta)
    self.m_ViewModel:SetPoseParameter(poseparameters.firemode_offset, self:GetFiremode() - 1)

    local velVector = Vector(self:GetOwner():GetVelocity().x, self:GetOwner():GetVelocity().y, 0)
    local vel = math.max(velVector:Length(), 0.1)
    local limit = self:GetOwner():GetWalkSpeed()
    local delta = vel / limit

    if (!self:GetOwner():IsOnGround()) then
        self.ViewModelVars.LerpJogOffset = Lerp(4 * FrameTime(), self.ViewModelVars.LerpJogOffset, 0)
    else
        self.ViewModelVars.LerpJogOffset = Lerp(10 * FrameTime(), self.ViewModelVars.LerpJogOffset, delta)
    end

    self.m_ViewModel:SetPoseParameter(poseparameters.jog_offset, self.ViewModelVars.LerpJogOffset * math.max(1 - lerpAimDelta * 2, 0))

    local jogDelta = 0
    local walkDelta = 0
    
    self.ViewModelVars.bJogging = false

    if (self:GetOwner():IsOnGround()) then
        if (vel <= self:GetOwner():GetSlowWalkSpeed() * 1.1) then
            walkDelta = math.min(vel / self:GetOwner():GetSlowWalkSpeed(), 1)
        else
            jogDelta = math.min(vel / self:GetOwner():GetWalkSpeed(), 1)
            self.ViewModelVars.bJogging = true
        end

        walkDelta = math.min(walkDelta + math.abs(self.ViewModelVars.Sway.X.Lerp) * 0.2, 1)
    end

    self.ViewModelVars.LerpJog = Lerp(5 * FrameTime(), self.ViewModelVars.LerpJog, jogDelta)
    self.ViewModelVars.LerpWalk = Lerp(5 * FrameTime(), self.ViewModelVars.LerpWalk, walkDelta)

    self.m_ViewModel:SetPoseParameter(poseparameters.jog_loop, self.ViewModelVars.LerpJog * Lerp(lerpAimDelta, 1, 0.02))
    self.m_ViewModel:SetPoseParameter(poseparameters.walk_loop, self.ViewModelVars.LerpWalk * Lerp(lerpAimDelta, 1, 0.05))

    if (self.m_seqIndex == "Idle" && lerpAimDelta <= 0) then
        if (self.ViewModelVars.bWasJogging != self.ViewModelVars.bJogging) then
            local bJogging = self.ViewModelVars.bJogging

            if (!bJogging && self:GetOwner():IsOnGround()) then
                self:PlayViewModelAnimation("Jog_Out")
            end
        end
    end

    self.ViewModelVars.bWasJogging = self.ViewModelVars.bJogging

    --crouch test
    if (self.m_seqIndex == "Idle" && lerpAimDelta <= 0) then
        if (self.ViewModelVars.bWasCrouching != self:GetOwner():Crouching()) then
            if (self:GetOwner():IsOnGround()) then
                self:PlayViewModelAnimation("Jog_Out")
            end
        end
    end

    self.ViewModelVars.bWasCrouching = self:GetOwner():Crouching()

    --freefall loop
    local z = math.min(self:GetOwner():GetVelocity().z, 0)
    local delta = math.min(math.min(z + 500, 0) / -1100, 1)
    self.m_ViewModel:SetPoseParameter(poseparameters.freefall_loop, delta * Lerp(lerpAimDelta, 1, 0.1))

    --empty
    self.m_ViewModel:SetPoseParameter(poseparameters.empty_offset, self:Clip1() <= 0 && 1 || 0)

    --jump/land
    if ((self.m_seqIndex == "Idle" || self.m_seqIndex == "Jump" || self.m_seqIndex == "Land" || self.m_seqIndex == "Jog_Out") && self:GetAimDelta() <= 0) then
        if (self.ViewModelVars.bWasOnGroundAnim != self:GetOwner():IsOnGround()) then
            local bOnGround = self:GetOwner():IsOnGround()

            if (!bOnGround) then
                self:PlayViewModelAnimation("Jump")
            else
                self:PlayViewModelAnimation("Land")
            end
        end
    end

    self.ViewModelVars.bWasOnGroundAnim = self:GetOwner():IsOnGround()

    --sprint playback rate
    --deprecated, using pose params instead
    --[[if (self.m_seqIndex == "Sprint_Loop") then
        local vel = math.max(self:GetOwner():GetVelocity():Length(), 0.1)
        local target = math.Clamp(vel / self:GetOwner():GetWalkSpeed(), 0.1, self.Animations["Sprint_Loop"].Fps / 30)
        local speed = 10

        if (!self:GetOwner():IsOnGround()) then
            target = 0.01
            speed = 5
        end

        self.m_ViewModel:SetPlaybackRate(Lerp(speed * FrameTime(), self.m_ViewModel:GetPlaybackRate(), target))
    end]]

    if (self:GetIsSprinting() && self:GetOwner():WaterLevel() <= 2) then
        local vel = math.max(self:GetOwner():GetVelocity():Length(), 0.001)
        local target = math.Clamp(vel / self:GetOwner():GetWalkSpeed(), 0.001, 1)
        local speed = 5

        if (!self:GetOwner():IsOnGround()) then
            target = 0.01
        end

        if (self:GetSafety() && !self:GetOwner():KeyDown(IN_SPEED)) then
            target = target * 0.3
        end

        local lerp = Lerp(speed * FrameTime(), self.m_ViewModel:GetPoseParameter(poseparameters.sprint_loop) || 0, target)
        self.m_ViewModel:SetPoseParameter(poseparameters.sprint_loop, lerp)
    else
        local lerp = Lerp(5 * FrameTime(), self.m_ViewModel:GetPoseParameter(poseparameters.sprint_loop) || 0, 0)
        self.m_ViewModel:SetPoseParameter(poseparameters.sprint_loop, lerp)
    end

    --aim sync with aimdelta
    if (self.m_seqIndex == "Ads_In") then
        self:SetViewModelCycle(lerpAimDelta)
    end

    if (self.m_seqIndex == "Ads_Out") then
        self:SetViewModelCycle(1 - lerpAimDelta)
    end

    --freeze inspect
    if (self:IsCustomizing() && self.m_seqIndex == "Inspect" && self.m_ViewModel:GetCycle() > 0.15) then
        local cos = math.cos(CurTime() * 3) * 0.25
        self.ViewModelVars.LerpCustomizationPlayback = Lerp(4 * FrameTime(), self.ViewModelVars.LerpCustomizationPlayback, cos)
    else
        self.ViewModelVars.LerpCustomizationPlayback = Lerp(4 * FrameTime(), self.ViewModelVars.LerpCustomizationPlayback, 1)
    end

    if (self.m_seqIndex == "Inspect") then
        self.m_ViewModel:SetPlaybackRate(self.ViewModelVars.LerpCustomizationPlayback)
    end

    --grips
    if (self.GripPoseParameters != nil) then
        for i, pp in pairs(self.GripPoseParameters) do
            self.m_ViewModel:SetPoseParameter(pp, 0)
        end

        self.GripPoseParameter.Lerp = math.Approach(self.GripPoseParameter.Lerp, self.GripPoseParameter.Target, 20 * FrameTime())

        if (self.GripPoseParameter.PoseParameter != nil) then
            self.m_ViewModel:SetPoseParameter(self.GripPoseParameter.PoseParameter, self.GripPoseParameter.Lerp)
        end
    end

    --smoke

    if (GetConVar("mgbase_fx_smoke"):GetBool()) then
        if (self.BarrelSmoke != nil) then
            local data = self.m_SmokeData

            if (CurTime() > self:LastShootTime() + 1) then
                if (data.Current >= self.BarrelSmoke.TemperatureThreshold && !data.bHasTriggered) then
                    self:DoParticle(self.BarrelSmoke.Particle, self.BarrelSmoke.Attachment)
                    data.bHasTriggered = true
                end

                data.Current = math.max(data.Current - (self.BarrelSmoke.TemperatureCooldown * FrameTime()), 0)

                if (data.Current < self.BarrelSmoke.TemperatureThreshold) then
                    data.bHasTriggered = false
                end
            end
        end
    end

    --invalidate bone cache?
    --wiki says to call this after using pose params, whatever
    self.m_ViewModel:InvalidateBoneCache()
end

function SWEP:DoParticle(particleName, attName)
    if (self.ParticleEffects != nil && self.ParticleEffects[particleName] != nil) then
        particleName = self.ParticleEffects[particleName]
    end

    if (self:GetOwner():GetInfoNum("mgbase_fx_cheap_particles", 0) > 0) then
        if (self.Particles[particleName] != nil) then
            self.Particles[particleName]:StopEmissionAndDestroyImmediately()
            self.Particles[particleName] = nil
        end
    end

    --[[if (self.TpParticles[particleName] != nil) then
        self.TpParticles[particleName]:StopEmissionAndDestroyImmediately()
        self.TpParticles[particleName] = nil
    end]]

    if (self:IsCarriedByLocalPlayer()) then
        if (self.m_ViewModel:LookupAttachment(attName) <= 0) then
            return
        end
        
        local ent, attid = self:FindAttachmentInChildren(self.m_ViewModel, attName)

        local effect = CreateParticleSystem(ent, particleName, PATTACH_POINT_FOLLOW, attid)
        effect:StartEmission()
        effect:SetIsViewModelEffect(true)
        effect:SetShouldDraw(false)

        if (self:GetOwner():GetInfoNum("mgbase_fx_cheap_particles", 0) > 0) then
            self.Particles[particleName] = effect
        else
            self.Particles[#self.Particles + 1] = effect
        end

        --[[timer.Simple(3, function() --isfinished doesnt work lmao!
            if (IsValid(self) && self.Particles[particleName] != nil) then
                self.Particles[particleName]:StopEmissionAndDestroyImmediately()
                self.Particles[particleName] = nil
            end
        end)]]
    end

    if (self:GetOwner():ShouldDrawLocalPlayer() || !self:IsCarriedByLocalPlayer()) then
        --[[debugoverlay.Box(ent:GetAttachment(attid).Pos, Vector(-1, -1, -1), Vector(1, 1, 1), 5, Color(255, 0, 0, 0))
        local effect = CreateParticleSystem(ent, particleName, PATTACH_POINT_FOLLOW, attid)
        effect:StartEmission()
        effect:SetIsViewModelEffect(false)
        effect:SetShouldDraw(false)

        self.TpParticles[particleName] = effect]]
        if (self.m_WorldModel:LookupAttachment(attName) <= 0) then
            return
        end

        ParticleEffectAttach(particleName, PATTACH_POINT_FOLLOW, self.m_WorldModel, self.m_WorldModel:LookupAttachment(attName))

        --[[timer.Simple(3, function() --isfinished doesnt work lmao!
            if (IsValid(self) && self.TpParticles[particleName] != nil) then
                self.TpParticles[particleName]:StopEmissionAndDestroyImmediately()
                self.TpParticles[particleName] = nil
            end
        end)]]
    end
end

function SWEP:DoSound(soundName)
    self:GetOwner():EmitSound(soundName)
end

function SWEP:DoSpatialSound(soundName, position)
    local ang = self:GetOwner():EyeAngles()
    sound.Play(soundName, self:GetOwner():EyePos() + ang:Forward() * position.y + ang:Right() * position.x + ang:Up() * position.z)
end

function SWEP:DoEjection(attName)
    --[[local attId = self.m_ViewModel:LookupAttachment(attName)
    local att = self.m_ViewModel:GetAttachment(attId)
    local shell = ClientsideModel(self.Shell.Model, self.RenderGroup)
    shell:SetMoveType(MOVETYPE_NONE)
    shell:SetParent(self.m_ViewModel)
    shell:SetModelScale(self.Shell.Scale)
    shell:SetPos(att.Pos)
    shell:SetAngles(att.Ang + AngleRand() * 100)
    shell:SetNoDraw(true)
    
    local ind = #self.Shells + 1
    
    self.Shells[ind] = {
        Shell = shell,
        AttId = attId
    }

    timer.Simple(0.1, function()
        if (shell != NULL) then
            shell:Remove()
            self.Shells[ind] = nil
        end
    end)

    self:DoEjectionWorld(attName)]]

    if (IsValid(self.ShellModel.Shell)) then
        self.ShellModel.Shell:Remove()
    end

    if (IsValid(self.TpShellModel.Shell)) then
        self.TpShellModel.Shell:Remove()
    end

    if (self:IsCarriedByLocalPlayer()) then
        local attId = self.m_ViewModel:LookupAttachment(attName)
        local att = self.m_ViewModel:GetAttachment(attId)
        local shell = ClientsideModel(self.Shell.Model, self.RenderGroup)
        shell:SetMoveType(MOVETYPE_NONE)
        shell:SetParent(self.m_ViewModel)
        shell:SetModelScale(self.Shell.Scale)
        shell:SetPos(att.Pos)
        shell:SetAngles(att.Ang)
        shell:SetNoDraw(true)

        self.ShellModel.Shell = shell
        self.ShellModel.AttId = attId

        timer.Simple(0.4, function()
            if (IsValid(shell)) then
                shell:Remove()
            end
        end)
    end

    if (self:GetOwner():ShouldDrawLocalPlayer() || !self:IsCarriedByLocalPlayer()) then
        local attId = self.m_WorldModel:LookupAttachment(attName)
        local att = self.m_WorldModel:GetAttachment(attId)
        local shell = ClientsideModel(self.Shell.Model, self.RenderGroup)
        shell:SetMoveType(MOVETYPE_NONE)
        shell:SetParent(self.m_WorldModel)
        shell:SetModelScale(self.Shell.Scale)
        shell:SetPos(att.Pos)
        shell:SetAngles(att.Ang + AngleRand() * 100)
        shell:SetNoDraw(true)

        self.TpShellModel.Shell = shell
        self.TpShellModel.AttId = attId

        timer.Simple(0.4, function()
            if (IsValid(shell)) then
                shell:Remove()
            end
        end)
    end

    timer.Simple(0.6, function()
        if (IsValid(self) && IsValid(self:GetOwner())) then
            sound.Play(self.Shell.Sound, self:GetOwner():GetPos() + self:GetOwner():GetRight() * 128)
        end
    end)
end

--[[function SWEP:DoEjectionWorld(attName)
    local attId = self:LookupAttachment(attName)
    local att = self:GetAttachment(attId)
    local shell = ClientsideModel(self.Shell.Model, self.RenderGroup)
    shell:SetMoveType(MOVETYPE_NONE)
    shell:SetParent(self)
    shell:SetModelScale(self.Shell.Scale)
    shell:SetPos(att.Pos)
    shell:SetAngles(att.Ang + AngleRand() * 100)
    shell:SetNoDraw(true)

    local ind = #self.TpShells + 1
    
    self.TpShells[ind] = {
        Shell = shell,
        AttId = attId
    }

    timer.Simple(0.4, function()
        if (shell != NULL) then
            shell:Remove()
            self.TpShells[ind] = nil
        end
    end)
end]]

function SWEP:AnimationEvents()
    if (self:GetOwner() == NULL) then
        return
    end
    
    if (self.Animations[self.m_seqIndex] && self.Animations[self.m_seqIndex].Events) then
        local events = self.Animations[self.m_seqIndex].Events
        local cycle = self.m_ViewModel:GetCycle()
        local len = self.m_ViewModel:SequenceDuration()

        for i, event in pairs(events) do
            if (event.m_bFired) then
                continue
            end
            
            local delta = math.min(event.Time / len, 1)

            if (cycle >= delta) then
                if (!event.m_bFired) then
                    if (event.Callback) then
                        event.Callback(self)
                    end
                end
 
                event.m_bFired = true
            end
        end
    end
end

function SWEP:SetViewModelCycle(cycle)
    if (self.Animations[self.m_seqIndex] && self.Animations[self.m_seqIndex].Events) then
        local events = self.Animations[self.m_seqIndex].Events
        local len = self.m_ViewModel:SequenceDuration()

        for i, event in pairs(events) do
            local delta = math.min(event.Time / len, 1)

            if (cycle > delta) then
                event.m_bFired = true
            end
        end
    end

    self.m_ViewModel:SetCycle(cycle)
end

function SWEP:RenderParticles(particles)
    for i, particle in pairs(particles) do
        if (!particle:IsValid()) then
            particles[i] = nil
            continue
        end

        particle:Render()
    end
end

function SWEP:RenderShells(shells, ent)
    if (IsValid(shells.Shell)) then
        shells.Shell:DrawModel()
        shells.Shell:SetAngles(shells.Shell:GetAngles() * (1000 * FrameTime()))
        local data = ent:GetAttachment(shells.AttId)
        shells.Shell:SetPos(shells.Shell:GetPos() + data.Ang:Forward() * (self.Shell.Force * FrameTime()))
    end
    --[[for i, shell in pairs(shells) do
        if (shell != NULL) then
            shell.Shell:DrawModel()
            shell.Shell:SetAngles(shell.Shell:GetAngles() * (1000 * FrameTime()))

            local data = ent:GetAttachment(shell.AttId)
            shell.Shell:SetPos(shell.Shell:GetPos() + data.Ang:Forward() * (self.Shell.Force * FrameTime()))
        end
    end]]
end

function SWEP:FindAttachmentInChildren(ent, att)
    -- first pass only for nonbonemerged things
    for i, child in pairs(ent:GetChildren()) do
        if (child:IsEffectActive(EF_BONEMERGE)) then
            continue
        end

        local childAtt = child:LookupAttachment(att)
        if (childAtt > 0) then
            return child, childAtt
        end
    end

    --second pass for bonemerged things
    for i, child in pairs(ent:GetChildren()) do
        if (!child:IsEffectActive(EF_BONEMERGE)) then
            continue
        end
        
        local childAtt = child:LookupAttachment(att)
        if (childAtt > 0) then
            return child, childAtt
        end
    end

    return ent, ent:LookupAttachment(att)
end