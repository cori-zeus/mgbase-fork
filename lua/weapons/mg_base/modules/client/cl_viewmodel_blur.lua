AddCSLuaFile()

local blurMaterial = Material("mg/blur.vmt")

function SWEP:IdleBlur()
    if (self:IsCustomizing()) then
        return
    end
    
    local focus = Lerp(self:GetAimDelta(), 5.5, self.Zoom && self.Zoom.Blur.EyeFocusDistance || 5.5)
    local time = os.clock()
    
    render.SetStencilWriteMask(0xFF)
    render.SetStencilTestMask(0xFF)
    render.SetStencilReferenceValue(0)

    for i = 3, 1, -1 do
        render.SetStencilCompareFunction(STENCIL_ALWAYS)
        render.SetStencilPassOperation(STENCIL_REPLACE)
        render.SetStencilFailOperation(STENCIL_KEEP)
        render.SetStencilZFailOperation(STENCIL_REPLACE)
        
        render.SetStencilEnable(true)
        render.SetStencilReferenceValue(MWBASE_STENCIL_REFVALUE + i)

            local normal = -EyeAngles():Forward()
            local position = normal:Dot(EyePos() + EyeAngles():Forward() * (focus + i * 0.35))

            local oldEC = render.EnableClipping(true)
            render.PushCustomClipPlane(normal, position)
            
            render.SetBlend(0)
            self:RenderModels(self.m_ViewModel, self:GetAimDelta() > 0, focus + i)
            render.SetBlend(1)

            render.PopCustomClipPlane()
            render.EnableClipping(oldEC)
                
        render.SetStencilCompareFunction(STENCIL_EQUAL)
            cam.Start2D()
                for b = 1, 4 - i, 1 do
                    render.UpdateScreenEffectTexture()
                    surface.SetMaterial(blurMaterial) 
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
                end
            cam.End2D()
        render.SetStencilEnable(false)
    end
    render.ClearStencil()

    self:RefreshCandidates(self.m_ViewModel)
end

function SWEP:ViewModelBlurModule()
    if (!IsValid(self:GetOwner())) then
        return
    end

    local bPixelShaders2 = render.SupportsPixelShaders_2_0()

    if (!bPixelShaders2) then
        return
    end
    
    --keeping this for low cost maybe?
    --[[if (self.Camera.Fov > 0.1 && self.Zoom.Blur != nil) then 
        local focus = Lerp(self:GetAimDelta(), 0, self.Zoom.Blur.EyeFocusDistance)
        render.SetStencilWriteMask(0xFF)
        render.SetStencilTestMask(0xFF)
        render.SetStencilReferenceValue(0)
        render.SetStencilCompareFunction(STENCIL_ALWAYS)
        render.SetStencilPassOperation(STENCIL_REPLACE)
        render.SetStencilFailOperation(STENCIL_KEEP)
        render.SetStencilZFailOperation(STENCIL_REPLACE)
        render.SetStencilEnable(true)
        
        render.SetStencilReferenceValue(1)

            local normal = -self:GetOwner():EyeAngles():Forward()
            local position = normal:Dot(self:GetOwner():EyePos() + self:GetOwner():EyeAngles():Forward() * focus)

            local oldEC = render.EnableClipping(true)
            render.PushCustomClipPlane(normal, position)

                self.m_ViewModel:DrawModel()

                for i, child in pairs(self.m_ViewModel:GetChildren()) do
                    child:DrawModel()
                end 

            render.PopCustomClipPlane()
            render.EnableClipping(oldEC)
            
        render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            cam.Start2D()
                for i = 1, self.Zoom.Blur.Strength, 1 do
                    render.UpdateScreenEffectTexture()
                    surface.SetMaterial(blurMaterial)
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
                end
            cam.End2D()

        render.SetStencilEnable(false)
        render.ClearStencil()
    else]]
        
    --end

    local bInState = (self.m_seqIndex == "Fire" || self.m_seqIndex == "Fire_Last" || self.m_seqIndex == "Melee" || self.m_seqIndex == "Melee_Hit")
    local cycleTarget = 0.5

    if (self.m_seqIndex == "Fire" || self.m_seqIndex == "Fire_Last") then
        cycleTarget = 0.35 / self.m_ViewModel:SequenceDuration()
    end

    if (!self:GetIsAiming() && bInState && self.m_ViewModel:GetCycle() < cycleTarget) then
        if (GetConVar("mgbase_fx_vmblur_hip"):GetBool()) then
            render.SetStencilWriteMask(0xFF)
            render.SetStencilTestMask(0xFF)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilPassOperation(STENCIL_REPLACE)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilEnable(true)
            render.SetStencilReferenceValue(MWBASE_STENCIL_REFVALUE + 1)

            render.SetBlend(0)
            self:RenderModels(self.m_ViewModel)
            render.SetBlend(1)
            
            render.SetStencilCompareFunction(STENCIL_EQUAL)
                
                cam.Start2D()
                    for i = 1, 3, 1 do
                        render.UpdateScreenEffectTexture()
                        surface.SetMaterial(blurMaterial)
                        surface.SetDrawColor(255, 0, 0, 255)
                        surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
                    end
                cam.End2D()

            render.SetStencilEnable(false)
            render.ClearStencil()
        end
    else
        if (GetConVar("mgbase_fx_vmblur"):GetBool()) then
            self:IdleBlur()
        end
    end
end

function SWEP:PreDrawViewModel(vm, weapon, ply)
    local bPixelShaders2 = render.SupportsPixelShaders_2_0()

    if (!bPixelShaders2) then
        return
    end

    if (ply:GetInfoNum("mgbase_fx_blur", 1) != 1) then return end

    if (self.DisableReloadBlur && self:GetIsReloading()) then return end

    local bOpticAim = (self:GetAimDelta() > 0 && self:GetCurrentOptic() != nil && self:GetAimModeDelta() <= self.m_hybridSwitchThreshold)
    local bCanBlur = self:GetIsReloading() || self:IsCustomizing() || bOpticAim

    if (bCanBlur) then
        local delta = 1 - self:GetAimDelta()

        if (bOpticAim) then
            delta = self:GetAimDelta()
        end

        self.Camera.LerpReloadBlur = Lerp(5 * FrameTime(), self.Camera.LerpReloadBlur, 5 * delta)

        cam.Start2D()
        for i = 1, self.Camera.LerpReloadBlur, 1 do
            render.UpdateScreenEffectTexture()
            surface.SetMaterial(blurMaterial)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
        end
        cam.End2D()
    else
        self.Camera.LerpReloadBlur = 0
    end
end