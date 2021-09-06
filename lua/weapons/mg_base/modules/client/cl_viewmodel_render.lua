AddCSLuaFile()

function SWEP:PostDrawViewModel(vm, weapon, ply)
    if (ply == NULL) then
        return
    end
    
    if (!IsValid(self.m_ViewModel)) then
        self:RecreateClientsideModels(true)
    end

    if (ply:InVehicle() && !ply:GetAllowWeaponsInVehicle()) then
        return
    end

    if (self.m_seqIndex == "INIT") then
    --    return
    end
    
    if (self.m_drawWorkaround) then
        self.m_ViewModel:FrameAdvance()
        self.m_ViewModel:SetCycle(0)

        self.m_drawWorkaround = false

        return
    end

    --customization
    if (self.Customization) then
        self:RenderCustomization(self.m_ViewModel)
    end

    self:RenderModels(self.m_ViewModel)

    --rigs
    self:RenderRigs()

    --particles
    self:RenderParticles(self.Particles)

    --shells
    self:RenderShells(self.ShellModel, self.m_ViewModel)

    --weapon sounds
    self:AnimationEvents()
    
    --reticles
    self:RenderReticles()

    --blur
    self:ViewModelBlurModule()

    --inspection
    self:RenderInspection()

    self.m_ViewModel:FrameAdvance()
end

local lerpedInspectionDelta = 0
function SWEP:RenderInspection()
    if (self.ViewModelOffsets == nil || self.ViewModelOffsets.Inspection == nil) then
        return
    end

    local insp = self.ViewModelOffsets.Inspection

    if (self:IsCustomizing() && self:GetOwner():KeyDown(IN_USE)) then
        self.ViewModelMouseX = self:SafeLerp(FrameTime() * 5, self.ViewModelMouseX, gui.MouseX())
        self.ViewModelMouseY = self:SafeLerp(FrameTime() * 5, self.ViewModelMouseY, gui.MouseY())
        lerpedInspectionDelta = Lerp(FrameTime() * 10, lerpedInspectionDelta, 1)
    else
        self.ViewModelMouseX = self:SafeLerp(FrameTime() * 5, self.ViewModelMouseX, ScrW() * 0.5)
        self.ViewModelMouseY = self:SafeLerp(FrameTime() * 5, self.ViewModelMouseY, ScrH() * 0.5)
        lerpedInspectionDelta = Lerp(FrameTime() * 10, lerpedInspectionDelta, 0)
    end

    local deltaX = math.Clamp(self.ViewModelMouseX / ScrW(), 0, 1)
    local deltaY = math.Clamp(self.ViewModelMouseY / ScrH(), 0, 1)

    local bId = self.m_ViewModel:LookupBone(insp.Bone)

    --local halfYDelta = math.abs(math.cos(math.pi * deltaY))
    --local halfXDelta = math.abs(math.cos(math.pi * deltaX))

    local inspAngleVertical = LerpAngle(deltaY, insp.Y[0].Angles --[[* halfYDelta]], insp.Y[1].Angles --[[* halfYDelta]])
    local inspAngleHorizontal = LerpAngle(deltaX, insp.X[0].Angles --[[* halfXDelta]], insp.X[1].Angles--[[* halfXDelta]])

    local inspPosVertical = LerpVector(deltaY, insp.Y[0].Pos --[[* halfYDelta]], insp.Y[1].Pos --[[* halfYDelta]])
    local inspPosHorizontal = LerpVector(deltaX, insp.X[0].Pos--[[* halfXDelta]], insp.X[1].Pos--[[* halfXDelta]])

    self.m_ViewModel:ManipulateBoneAngles(bId, (inspAngleVertical + inspAngleHorizontal) * lerpedInspectionDelta)
    self.m_ViewModel:ManipulateBonePosition(bId, (inspPosVertical + inspPosHorizontal) * lerpedInspectionDelta)
end

function SWEP:RenderRigs()
    if (!IsValid(self:GetOwner())) then
        return
    end

    local index = math.Clamp(self:GetOwner():GetInfoNum("mgbase_rig", 0), 0, MGBASE_RIGS_COUNT)

    if (index <= 0) then
        self:GetOwner():GetHands():SetParent(self.m_ViewModel)
        self:GetOwner():GetHands():AddEffects(EF_BONEMERGE)
        self.m_ViewModel.Hands:SetParent(NULL)
        self.m_ViewModel.Hands.Gloves:SetParent(NULL)
    else
        --sleeves
        if (self.m_ViewModel.Hands:GetModel() != self.Rigs[index]) then
            self.m_ViewModel.Hands:SetModel(self.Rigs[index])
        end

        self.m_ViewModel.Hands:SetParent(self.m_ViewModel)
        self.m_ViewModel.Hands:AddEffects(EF_BONEMERGE)
        self.m_ViewModel.Hands:SetSkin(self:GetOwner():GetInfoNum("mgbase_rig_skin", 0))

        --gloves
        index = math.Clamp(self:GetOwner():GetInfoNum("mgbase_gloves", 0), 0, MGBASE_GLOVES_COUNT)

        if (self.m_ViewModel.Hands.Gloves:GetModel() != self.Gloves[index]) then
            self.m_ViewModel.Hands.Gloves:SetModel(self.Gloves[index])
        end

        self.m_ViewModel.Hands.Gloves:SetParent(self.m_ViewModel)
        self.m_ViewModel.Hands.Gloves:AddEffects(EF_BONEMERGE)
        self.m_ViewModel.Hands.Gloves:SetSkin(self:GetOwner():GetInfoNum("mgbase_gloves_skin", 0))

        self:GetOwner():GetHands():SetParent(self:GetOwner():GetViewModel())
        self:GetOwner():GetHands():AddEffects(EF_BONEMERGE)
    end
end

function SWEP:BuildBonePositions(ent, numbones)
end

local intersect = util.IntersectRayWithOBB
local dir = Vector(0, 0, 0)

function SWEP:RenderModels(ent, omitSight, distanceFromCameraOmit)
    distanceFromCameraOmit = distanceFromCameraOmit || -1

    if (ent != self:GetCurrentSight() || !omitSight) then
        if (ent._bMWDraw == nil && distanceFromCameraOmit > 0) then
            ent._bMWDraw = true
            
            if (ent != self.m_ViewModel && ent != self.m_ViewModel.Hands && ent != self:GetOwner():GetHands()) then
                if (distanceFromCameraOmit > 0) then
                    local matrix = ent:GetBoneMatrix(0)

                    ent._bMWDraw = false

                    if (matrix != nil) then
                        local pos = matrix:GetTranslation()
                        local origin = EyePos()
                        dir:Set(pos)
                        dir:Sub(origin)
                        dir:Normalize()
                        dir:Mul(distanceFromCameraOmit + 5)

                        local hitPos = intersect(origin, dir, pos, matrix:GetAngles(), ent:GetRenderBounds())

                        ent._bMWDraw = hitPos != nil
                    end
                end
            end
        end

        if (ent._bMWDraw == true || distanceFromCameraOmit <= 0) then
            ent:DrawModel()
            ent:SetupBones()

            ent.mw_Camo = self:GetCamo()
            ent.mw_Aim = self:GetAimDelta()

            for i, child in pairs(ent:GetChildren()) do
                self:RenderModels(child, omitSight, distanceFromCameraOmit)
            end
        end
    end
end

function SWEP:RefreshCandidates(ent)
    ent._bMWDraw = nil

    for i, child in pairs(ent:GetChildren()) do
        self:RefreshCandidates(child)
    end
end

function SWEP:RenderReticles()
    if (self:GetAimDelta() <= 0 && GetConVar("mgbase_fx_cheap_reticles"):GetBool()) then
        return
    end

    if (self:GetCurrentReticle() == nil || self:GetCurrentSight() == nil) then
        return
    end

    if (self:GetCurrentOptic() != nil && self:GetCurrentHybrid() == nil) then
        return
    end

    local ret = self:GetCurrentReticle()

    if (self:GetCurrentHybrid() != nil) then
        ret = self:GetCurrentReticleHybrid()
    end

    local sight = self:GetCurrentSight()

    render.SetStencilWriteMask(0xFF)
    render.SetStencilTestMask(0xFF)
    render.SetStencilReferenceValue(0)
    render.SetStencilCompareFunction(STENCIL_ALWAYS)
    render.SetStencilPassOperation(STENCIL_REPLACE)
    render.SetStencilFailOperation(STENCIL_KEEP)
    render.SetStencilZFailOperation(STENCIL_KEEP)
    render.SetStencilEnable(true)
    render.SetStencilReferenceValue(MWBASE_STENCIL_REFVALUE + 1)

    sight:DrawModel()

    render.SetStencilCompareFunction(STENCIL_EQUAL)

    local att = sight:GetAttachment(sight:LookupAttachment(ret.Attachment))
    local pos, ang = att.Pos, att.Ang
    ang:RotateAroundAxis(ang:Up(), 270)
    ang:RotateAroundAxis(ang:Right(), 0)
    ang:RotateAroundAxis(ang:Forward(), 90)
    
    --what the fuck they dont need offsets anymore?!?
    cam.Start3D2D(pos + ang:Up() * -100 --[[+ ang:Right() * -6.4 + ang:Forward() * -1.31]], ang, 0.01) --wtf happened here? it didnt need the offsets before...
        surface.SetMaterial(ret.Material)

        local size = ret.Size 
        local color = ret.Color

        --surface.SetDrawColor(0, 0, 0, 255)
        --surface.DrawRect(size * -0.5, size * -0.5, size, size)

        surface.SetDrawColor(color.r, color.g, color.b, color.a)
        for i = 1, GetConVar("mgbase_fx_reticle_brightness"):GetInt(), 1 do
            surface.DrawTexturedRect(size * -0.5, size * -0.5, size, size)
        end
    cam.End3D2D()

    render.SetStencilEnable(false)
    render.ClearStencil()
end