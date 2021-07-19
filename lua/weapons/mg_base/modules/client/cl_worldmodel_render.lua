AddCSLuaFile()

function SWEP:DrawWorldModelTranslucent(flags)
    if (!IsValid(self.m_WorldModel)) then
        self:RecreateClientsideModels(true)
    end

    render.SetBlend(0)
    self:DrawModel()
    render.SetBlend(1)

    local pos, ang = self:GetBonePosition(0)
    local wPos = self:GetPos()
    self.m_WorldModel:SetPos(wPos + (pos - wPos))

    local wAng = self:GetAngles()
    self.m_WorldModel:SetAngles(wAng + (ang - wAng))

    local bone = self.m_WorldModel:LookupBone(self.WorldModelOffsets.Bone)

    if (bone != nil && bone > 0) then
        --if (IsValid(self:GetOwner())) then
            self.m_WorldModel:ManipulateBoneAngles(bone, self.WorldModelOffsets.Angles)
            self.m_WorldModel:ManipulateBonePosition(bone, self.WorldModelOffsets.Pos)
        --[[else
            self.m_WorldModel:ManipulateBoneAngles(bone, Angle())
            self.m_WorldModel:ManipulateBonePosition(bone, Vector())
        end]]
    end

    --particles
    --self:RenderParticles(self.TpParticles)

    --shells
    self:RenderShells(self.TpShellModel, self.m_WorldModel)

    self:SetupBones()
    self.m_WorldModel:SetupBones()
    
    --customization
    if (self.Customization) then
        self:RequestCustomization()
        self:RenderCustomization(self.m_WorldModel)
    end
    
    --anims
    self.m_ViewModel:FrameAdvance()
    self:AnimationEvents()

    self:RenderModels(self.m_WorldModel)
end