AddCSLuaFile()

if (CLIENT) then
    concommand.Add("mgbase_customize", function(ply, cmd, args, argStr)
        net.Start("mgbase_customize", true)
        net.SendToServer()
    end)
end

function SWEP:StopCustomizing()
    if (self:IsCustomizing()) then
        
        self.bCustomize = false
        self:SetIsCustomizing(false)
        self:Customize()
    end
end

function SWEP:GetCustomizationIndex(name)
    if (!self.Customization) then
        return 0
    end

    local c = 0

    for index, atts in pairs(self.Customization) do
        c = c + 1
       
        if (index == name) then
            if (self.Customization[index].Slot != nil) then
                return self.Customization[index].Slot
            end

            return c
        end
    end

    return nil
end

function SWEP:GetCustomizationCount()
    if (!self.Customization) then
        return 0
    end

    local c = 0

    for index, atts in pairs(self.Customization) do
        c = c + 1
    end

    return c
end

function SWEP:GetAttachmentCount(slot)
    if (!self.Customization) then
        return 0
    end

    local c = 0

    for index, atts in pairs(self.Customization[slot]) do
        if (istable(atts) && index != "Offset") then
            c = c + 1
        end
    end

    return c
end

function SWEP:GetCustomizationName(index)
    if (!self.Customization) then
        return 0
    end

    local c = 0

    for name, atts in pairs(self.Customization) do
        if (self.Customization[name].Slot != nil && self.Customization[name].Slot == index) then 
            return name 
        end

        c = c + 1

        if (self.Customization[name].Slot == nil && c == index) then 
            return name 
        end
    end

    return nil
end

function SWEP:CanCustomize()
    return !self:GetIsReloading()
        && !self:IsDrawing()
        && !self:GetIsHolstering()
        && CurTime() > self:GetNextPrimaryFire()
        --&& self:Clip1() > 0
        && self.Customization != nil
        && self:GetAimDelta() <= 0
        && !self:GetIsSprinting()
end

function SWEP:CanPlayInspectAfterCustomization() --people lagging could still be playing draws
    return !string.find(string.lower(self.m_seqIndex), "init") && !string.find(string.lower(self.m_seqIndex), "draw") && !string.find(string.lower(self.m_seqIndex), "equip")
end

function SWEP:Customize(fromFallback)
    fromFallback = fromFallback || false

    local state = self:IsCustomizing()
    local cycle = 0

    if (CLIENT && IsFirstTimePredicted()) then
        self:CustomizationMenu()
    end

    if (game.SinglePlayer() && IsValid(self:GetOwner())) then
        self:GetOwner():SendLua("LocalPlayer():GetActiveWeapon():CustomizationMenu()")
    end

    if (CLIENT && game.SinglePlayer()) then
        return
    end

    if (state) then
        self:PlayViewModelAnimation("Inspect", fromFallback)
    end
end

function SWEP:Attach(slot, att)
    local name = self:GetCustomizationName(slot)

    if (name == nil) then
        return
    end

    if (att == nil) then
        att = self.Customization[name].m_Index + 1
    end

    if (att > #self.Customization[name]) then
        att = 1
    end

    if (SERVER) then
        while (true) do
            local att = self.Customization[name][att]

            if (att.Key == nil) then
                if (att.Model != nil) then
                    error("Attachment does not have a valid key! ("..att.Model..")")
                else
                    error("Attachment does not have a valid key!")
                end
            end

            if (MW_ATT_KEYS[att.Key] == nil || MW_ATT_KEYS[att.Key] == nil) then
                error("Attachment does not have a registered/disabled key! ("..att.Key..")")
            end

            --[[if (self.Customization[name][att].Model == nil) then
                break;
            end]]
            
            local goodModel = MW_ATT_KEYS[att.Key]--util.IsValidModel(self.Customization[name][att].Model) 

            if (goodModel) then
                break;
            end

            att = att + 1;

            if (att > #self.Customization[name]) then
                break;
            end
        end
    end

    if (att > #self.Customization[name]) then
        att = 1
    end

    local attachment = self.Customization[name][att]

    while (!self:IsAttachmentAllowed(attachment)) do
        att = att + 1

        if (att > #self.Customization[name]) then
            att = 1
        end

        attachment = self.Customization[name][att]
    end

    
        local snd = "MW_UI.Attach"
        
    if (self.Customization[name].m_Index == att) then
        self.Customization[name].m_Index = 1
        snd = "MW_UI.Deattach"
    else
        self.Customization[name].m_Index = att
    end
    
    if (self:CanPlayInspectAfterCustomization()) then
        if (game.SinglePlayer() || (CLIENT && self:GetOwner() == GetViewEntity())) then
            self:GetOwner():EmitSound(snd)
        end
    end

    --BUILD:
    self:BuildCustomizedGun()

    --reset inspect animation
    if (CLIENT) then
        if (self:CanPlayInspectAfterCustomization()) then
            local cycle = self.m_ViewModel:GetCycle()
            self:PlayViewModelAnimation("Inspect", false, cycle)
        else
            local cycle = self.m_ViewModel:GetCycle()
            self:PlayViewModelAnimation(self.m_seqIndex, false, cycle)
        end
    end
end

function SWEP:CreateAttachmentModel(attachment)
    if (SERVER) then
        return
    end

    if (attachment.Key == nil || MW_ATT_KEYS[attachment.Key] == nil || MW_ATT_KEYS[attachment.Key].Model == nil) then
        return
    end

    local slot = self.Customization[attachment.m_Slot]

    slot.m_Model = ClientsideModel(MW_ATT_KEYS[attachment.Key].Model, self.RenderGroup)
    slot.m_Model:SetNoDraw(true)
    slot.m_Model:InvalidateBoneCache()
    slot.m_Model:SetMoveType(MOVETYPE_NONE)
    slot.m_Model:SetParent(self.m_ViewModel)
    
    if (attachment.VElement == nil) then
        slot.m_Model:AddEffects(EF_BONEMERGE)
        slot.m_Model:AddEffects(EF_BONEMERGE_FASTCULL)
        slot.m_Model:AddEffects(EF_PARENT_ANIMATES)
    end

    slot.m_TpModel = ClientsideModel(MW_ATT_KEYS[attachment.Key].Model, self.RenderGroup)
    slot.m_TpModel:SetNoDraw(true)
    slot.m_TpModel:InvalidateBoneCache()
    slot.m_TpModel:SetMoveType(MOVETYPE_NONE)
    slot.m_TpModel:SetParent(self.m_WorldModel)
    
    if (attachment.VElement == nil) then
        slot.m_TpModel:AddEffects(EF_BONEMERGE)
        slot.m_TpModel:AddEffects(EF_BONEMERGE_FASTCULL)
        slot.m_TpModel:AddEffects(EF_PARENT_ANIMATES)
    end
end

function SWEP:Detach(name, att)
    local attachment = self.Customization[name][att]

    if (CLIENT) then
        if (IsValid(self.Customization[name].m_Model)) then
            self.Customization[name].m_Model:Remove()
        end

        if (IsValid(self.Customization[name].m_TpModel)) then
            self.Customization[name].m_TpModel:Remove()
        end
    end
end

function SWEP:BuildCustomizedGun()
    --this resets gun to defaults, but keeps the internal variables
    self:DeepObjectCopy(weapons.Get(self:GetClass()), self)

    self:ResetBodygroups()

    --apply firemode first while resetting defaults:
    self:ApplyFiremodeStats()
    self:SetBurstRounds(0)
    self:SetCamo("") 
    
    if (self.Customization == nil) then
        return
    end

    if (CLIENT) then
        self.m_ViewModel:SetModel(self.VModel)

        self.GripPoseParameter.PoseParameter = nil
        --self.GripPoseParameter.Target = 0
        --self.GripPoseParameter.Lerp = 0 caused glitch when switching firemodes
    end 

    --first pass (detach everything):
    for name, attachments in pairs(self.Customization) do
        for i = 1, #attachments, 1 do
            self:Detach(name, i)
        end
    end

    --check if atts are allowed
    for name, attachments in pairs(self.Customization) do
        local attachment = self.Customization[name][self.Customization[name].m_Index]

        if (!self:IsAttachmentAllowed(attachment)) then
            self.Customization[name].m_Index = 1
        end
    end

    self.ValuesToRemove = {}

    local stats = {}
    self:DeepObjectCopy(self:GetTable(), stats)

    for name, attachments in pairs(self.Customization) do
        local attachment = self.Customization[name][self.Customization[name].m_Index]

        if (self.Customization[name].m_Index > 1) then --avoid user changing defaults
            if (attachment.Key && MW_ATT_KEYS[attachment.Key] != nil) then
                MW_ATT_KEYS[attachment.Key].Stats(stats)
            end

            attachment.Stats(stats)
        end
    end
    
    self:DeepObjectCopy(stats, self)

    for i, v in pairs(self.ValuesToRemove) do
        self[v] = nil
    end

    ----BREADCRUMBS
    --generate em
    self.StatBreadcrumbs = {}
    local diffs = self:MakeBreadcrumbs({}, "SWEP", weapons.Get(self:GetClass()), self)

    --check for duplicates
    local dupes = {}
    for path, key in pairs(self.StatDefinitions) do
        if (dupes[key] == nil) then
            dupes[key] = {}
        end

        if (self.StatBreadcrumbs[path] != nil) then
            dupes[key][#dupes[key] + 1] = self.StatBreadcrumbs[path]
            dupes[key][#dupes[key]].path = path
        end
    end

    for key, crumbs in pairs(dupes) do
        if (#crumbs <= 0) then
            continue
        end
        
        local size = 0
        local winner = nil

        for i, crumb in pairs(crumbs) do
            local diff = math.abs(crumb.Current - crumb.Source)
            if (diff > size) then
                size = diff
                winner = crumb
            end
        end

        if (winner != nil) then
            for i, crumb in pairs(crumbs) do
                if (crumb != winner) then
                    self.StatBreadcrumbs[crumb.path] = nil
                end
            end
        end
    end
    ----end breadcrumbs
    
    --check magazine:
    if (IsValid(self:GetOwner())) then
        local maxClip = self.Primary.ClipSize

        if (self.CanChamberRound) then
            maxClip = maxClip + 1
        end

        if (self:Clip1() > maxClip) then
            local diff = self:Clip1() - maxClip
            self:SetClip1(self:Clip1() - diff)
            self:GetOwner():SetAmmo(self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType()) + diff, self:GetPrimaryAmmoType())
        end
    end

    --check if we can keep aim mode
    if (!self:CanChangeAimMode()) then
        self:SetAimMode(0)
    end

    --create models:
    for name, attachments in pairs(self.Customization) do
        self:CreateAttachmentModel(self.Customization[name][self.Customization[name].m_Index])
    end

    --bodygroups:
    for name, attachments in pairs(self.Customization) do
        local att = self.Customization[name][self.Customization[name].m_Index]

        if (att.Bodygroups != nil) then
            for bg, v in pairs(att.Bodygroups) do
                self:DoBodygroup(bg, v)
            end
        end
    end

    if (CLIENT) then
        self._RTTexture = GetRenderTarget("mw19_rt", 1024, 1024, false)
    end

    --meme marine
    self:SetHoldType("camera")
    timer.Simple(0, function()
        if !IsValid(self) then return end
        self:SetShouldHoldType(true)
    end)
end

function SWEP:RenderCustomization(model)
    for name, attachments in pairs(self.Customization) do
        local attachment = self.Customization[name][self.Customization[name].m_Index]

        if (attachment.VElement != nil) then
            local ve = attachment.VElement
            local bone = model:LookupBone(attachment.VElement.Bone)
            if (bone == nil) then
                continue
            end
            
            local matrix = model:GetBoneMatrix(bone)

            if (matrix == nil) then
                continue
            end
            
            local attModel = self.Customization[name].m_Model

            if (model == self.m_WorldModel) then
                attModel = self.Customization[name].m_TpModel
            end

            local oPos, oAng = self:GetTotalAttachmentOffset(attachment)

            local ang = matrix:GetAngles()
            ang:RotateAroundAxis(ang:Forward(), ve.Angles.r + oAng.r)
            ang:RotateAroundAxis(ang:Right(), ve.Angles.y + oAng.y)
            ang:RotateAroundAxis(ang:Up(), ve.Angles.p + oAng.p)

            local pos = matrix:GetTranslation()
            pos = pos + ang:Forward() * (ve.Position.y + oPos.y)
            pos = pos + ang:Right() * (ve.Position.x + oPos.x)
            pos = pos + ang:Up() * (ve.Position.z + oPos.z)

            attModel:SetPos(pos)
            attModel:SetAngles(ang)
            attModel:SetupBones()
            --attModel:EnableMatrix("RenderMultiply", newMatrix)
        end
    end

    if (self:GetCurrentOptic() != nil) then
        local optic = self:GetCurrentOptic()
        local sight = self:GetCurrentSight()

        sight:SetBodygroup(sight:FindBodygroupByName(optic.LensBodygroup), self:GetAimModeDelta() <= self.m_hybridSwitchThreshold && self:GetAimDelta() > 0 && 0 || 1)
    end

    self:DrawLaser(model)
    --self:DrawFlashlight(model) too unstable, enable when you are ready to maintain this mess.
end

function SWEP:GetTotalAttachmentOffset(currentAttachment)
    local pos = Vector()
    local ang = Angle()

    local offsets = currentAttachment.VElement.Offsets

    for name, attachments in pairs(self.Customization) do
        if (name == currentAttachment.m_Slot) then
            continue
        end

        local slot = self.Customization[name]

        if (offsets[name] != nil) then
            if (offsets[name][slot.m_Index] != nil) then
                pos:Add(offsets[name][slot.m_Index][1])
                ang:Add(offsets[name][slot.m_Index][2])
            end
        end
    end

    return pos, ang
end

function SWEP:GetCurrentAttachment(slot)
    return self.Customization[slot][self.Customization[slot].m_Index]
end

function SWEP:DoBodygroup(name, value)
    if (SERVER) then
        return
    end
    local ind = self.m_ViewModel:FindBodygroupByName(name)
    self.m_ViewModel:SetBodygroup(ind, self.m_ViewModel:GetBodygroup(ind) + value)

    ind = self.m_WorldModel:FindBodygroupByName(name)
    self.m_WorldModel:SetBodygroup(ind, self.m_WorldModel:GetBodygroup(ind) + value)
end

function SWEP:ResetBodygroups()
    if (SERVER) then
        return
    end

    for b = 0, self.m_ViewModel:GetNumBodyGroups() do
        self.m_ViewModel:SetBodygroup(b, 0)
    end

    for b = 0, self.m_WorldModel:GetNumBodyGroups() do
        self.m_WorldModel:SetBodygroup(b, 0)
    end
end

function SWEP:GetCurrentSight()
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && (MW_ATT_KEYS[att.Key].Reticle != nil || MW_ATT_KEYS[att.Key].Optic != nil || MW_ATT_KEYS[att.Key].ReticleHybrid != nil)) then
                local modelToFind = MW_ATT_KEYS[att.Key].Model
                for i, child in pairs(self.m_ViewModel:GetChildren()) do
                    if (child:GetModel() == modelToFind) then
                        return child
                    end
                end
            end
        end
    end

    return nil
end

function SWEP:GetCurrentHybrid()
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && (MW_ATT_KEYS[att.Key].ReticleHybrid != nil)) then
                return MW_ATT_KEYS[att.Key].ReticleHybrid
            end
        end
    end

    return nil
end

function SWEP:GetCurrentReticle()
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && MW_ATT_KEYS[att.Key].Reticle != nil) then
                local ret = MW_ATT_KEYS[att.Key].Reticle

                --[[if (self:GetAimModeDelta() <= 0.5 && MW_ATT_KEYS[att.Key].ReticleHybrid != nil) then
                    ret = MW_ATT_KEYS[att.Key].ReticleHybrid
                end]]

                return ret
            end
        end
    end

    return nil
end

function SWEP:GetCurrentReticleHybrid()
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && MW_ATT_KEYS[att.Key].ReticleHybrid != nil) then
                local ret = MW_ATT_KEYS[att.Key].ReticleHybrid

                --[[if (self:GetAimModeDelta() <= 0.5 && MW_ATT_KEYS[att.Key].ReticleHybrid != nil) then
                    ret = MW_ATT_KEYS[att.Key].ReticleHybrid
                end]]

                return ret
            end
        end
    end

    return nil
end

function SWEP:GetCurrentOptic()
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && MW_ATT_KEYS[att.Key].Optic != nil) then
                return MW_ATT_KEYS[att.Key].Optic
            end
        end
    end

    return nil
end

function SWEP:GetCurrentLaser()
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && MW_ATT_KEYS[att.Key].Laser != nil) then
                return MW_ATT_KEYS[att.Key].Laser
            end
        end
    end

    return nil
end


function SWEP:GetCurrentLaserModel(model)
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && MW_ATT_KEYS[att.Key].Laser != nil) then
                local modelToFind = MW_ATT_KEYS[att.Key].Model
                for i, child in pairs(model:GetChildren()) do
                    if (child:GetModel() == modelToFind) then
                        return child
                    end
                end
            end
        end
    end

    return nil
end

function SWEP:GetCurrentFlashlight()
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && MW_ATT_KEYS[att.Key].Flashlight != nil) then
                return MW_ATT_KEYS[att.Key].Flashlight
            end
        end
    end

    return nil
end


function SWEP:GetCurrentFlashlightModel(model)
    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            local att = self.Customization[name][self.Customization[name].m_Index]

            if (att.Key != nil && MW_ATT_KEYS[att.Key] != nil && MW_ATT_KEYS[att.Key].Flashlight != nil) then
                local modelToFind = MW_ATT_KEYS[att.Key].Model
                for i, child in pairs(model:GetChildren()) do
                    if (child:GetModel() == modelToFind) then
                        return child
                    end
                end
            end
        end
    end
 
    return nil
end

function SWEP:HasAttachment(key)
    for name, a in pairs(self.Customization) do
        if (self.Customization[name][self.Customization[name].m_Index].Key == key) then
            return true
        end
    end

    return false
end

function SWEP:IsAttachmentAllowed(attachment)
    local slot = attachment.m_Slot

    for name, atts in pairs(self.Customization) do
        if (self.Customization[name][self.Customization[name].m_Index] != nil) then
            local currentAttachment = self.Customization[name][self.Customization[name].m_Index]

            if (currentAttachment.ExcludedAttachments == nil) then
                continue
            end

            local excluded = currentAttachment.ExcludedAttachments

            if (excluded[slot] == nil) then
                continue
            end

            if (table.HasValue(excluded[slot], attachment.m_Index)) then
                return false
            end
        end
    end

    return true
end

function SWEP:SetGripPoseParameter(value)
    if (CLIENT) then
        if (self.GripPoseParameters == nil) then
            return error("you haven't defined any grip pose parameters")
        end

        if (!table.HasValue(self.GripPoseParameters, value)) then
            return error("pose parameter "..value.." was not defined in GripPoseParameters!")
        end

        self.GripPoseParameter.PoseParameter = value
        --self.GripPoseParameter.Target = 1
        --self.GripPoseParameter.Lerp = 1
    end
end

function SWEP:DisableGrip(instant)
    if (instant) then
        self.GripPoseParameter.Lerp = 0
    end

    self.GripPoseParameter.Target = 0
end

function SWEP:EnableGrip(instant)
    if (instant) then
        self.GripPoseParameter.Lerp = 1
    end

    self.GripPoseParameter.Target = 1
end

function SWEP:SetViewModel(path)
    if (SERVER) then
        return
    end

    self.m_ViewModel:SetModel(path)
end

if (SERVER) then
    return
end

SWEP._RTTexture = GetRenderTarget("mw19_rt", 1024, 1024, false)
local ParallaxMaterial = Material("mw19_parallax.vmt")
local RefractMaterial = Material("mw19_scoperefract.vmt")
local RefractTintMaterial = Material("mw19_refracttint.vmt")
local _rt = {
    x = 0,
    y = 0,
    w = 1024,
    h = 1024,
    fov = 6.5,
    drawviewmodel = false,
    drawhud = false,
    dopostprocess = false
}

local thermalCC = {
    [ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0,
	[ "$pp_colour_brightness" ] = 2,
	[ "$pp_colour_contrast" ] = 0.1,
	[ "$pp_colour_colour" ] = 0,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0
}
local ThermalNoiseMaterial = Material("mw19_thermalnoise.vmt")

local function util_NormalizeAngles(a)
    a.p =  math.NormalizeAngle(a.p)
    a.y =  math.NormalizeAngle(a.y)
    a.r =  math.NormalizeAngle(a.r)
    
    return a
end

function SWEP:RenderScreen()
    if (self:GetAimModeDelta() > 0.5) then
        return
    end
    
    if (self:GetAimDelta() <= 0) then
        return
    end

    if (!IsValid(self:GetCurrentSight())) then
        return
    end

    if (self:GetCurrentOptic() == nil) then
        return
    end

    local optic = self:GetCurrentOptic()
    local ret = self:GetCurrentReticle()
    local sight = self:GetCurrentSight()

    local ang = sight:GetAngles()
    local matrix = sight:GetBoneMatrix(0)

    _rt.origin = self:GetOwner():EyePos()--sight:GetPos()
    _rt.fov = optic.FOV
    _rt.angles = ang

    local angDif = util_NormalizeAngles(sight:GetAngles() - self._eyeang) * math.max(15 - optic.FOV, 1) * 50

    render.PushRenderTarget(self._RTTexture)
    cam.Start2D()
        render.Clear(0, 0, 0, 0)
        render.RenderView(_rt)

        DrawSharpen(1, 2)

        --THERMALS:
        if (optic.Thermal) then
            DrawColorModify(thermalCC)

            --NOISE:
            surface.SetMaterial(ThermalNoiseMaterial)
            surface.SetDrawColor(255, 255, 255, math.random(255))
            surface.DrawTexturedRect(0, 0, ScrW() * 2, ScrH() * 2)
            --

            self:DrawThermalEntities()
        end
        ----

        --REFRACT:
        RefractMaterial:SetTexture("$basetexture", render.GetRenderTarget())
        RefractMaterial:SetFloat("$refractamount", 0.1)

        surface.SetMaterial(RefractMaterial)
        surface.SetDrawColor(255, 255, 255, 255)

        local rSize = math.cos(math.pi) * -optic.ParallaxSize * 0.5
        local refractW, refractH = ScrW(), ScrH() * 0.75
        surface.DrawTexturedRect((ScrW() - refractW) * -0.5 - (rSize * 0.5), (ScrH() - refractH) * 0.5 - (rSize * 0.5), refractW + rSize, refractH + rSize)

        --REFTINT:
        local tintSize = 400
        surface.SetMaterial(RefractTintMaterial)
        surface.SetDrawColor(0, 0, 0, 255)

        for i = 1, 2, 1 do
            surface.DrawTexturedRect(tintSize * -0.5, tintSize * -0.5, ScrW() + tintSize, ScrH() + tintSize)
        end
        ----

        self:DrawParallax()

        --FADE:
        surface.SetDrawColor(0, 0, 0, (1 - self:GetAimDelta()) * 255)
        surface.DrawRect(0, 0, ScrW(), ScrH())
        ----
	cam.End2D()
	render.PopRenderTarget()
    
    optic.LensHideMaterial:SetTexture("$basetexture", self._RTTexture)
end

function SWEP:DrawParallax()
    local optic = self:GetCurrentOptic()
    local ret = self:GetCurrentReticle()
    local sight = self:GetCurrentSight()

    local angDif = util_NormalizeAngles(sight:GetAngles() - self._eyeang) * math.max(15 - optic.FOV, 1) * 10--50

    render.SetStencilWriteMask(0xFF)
    render.SetStencilTestMask(0xFF)
    render.SetStencilReferenceValue(0)
    render.SetStencilCompareFunction(STENCIL_ALWAYS)
    render.SetStencilPassOperation(STENCIL_REPLACE)
    render.SetStencilFailOperation(STENCIL_KEEP)
    render.SetStencilZFailOperation(STENCIL_KEEP)
    render.SetStencilEnable(true)
    render.SetStencilReferenceValue(MWBASE_STENCIL_REFVALUE + 1)

    --RETICLE:
    surface.SetMaterial(ret.Material)

    local color = ret.Color
    surface.SetDrawColor(color.r, color.g, color.b, color.a)

    local size = ret.Size 
    for i = 1, GetConVar("mgbase_fx_reticle_brightness"):GetInt(), 1 do
        surface.DrawTexturedRect(ScrW() * 0.5 - (size * 0.5) - angDif.y, ScrH() * 0.5 - (size * 0.5) + angDif.p, size, size)
    end
    ----
    
    --cam.Start2D()

    surface.SetMaterial(ParallaxMaterial)
    surface.SetDrawColor(0, 0, 0, 255)

    local pSize = math.cos(self.ViewModelVars.LerpAimDelta * math.pi) * -optic.ParallaxSize
    local x,y = (ScrW() * -0.5) - pSize * 0.5 - angDif.y, (ScrH() * -0.5) - pSize * 0.5 + angDif.p

    surface.DrawTexturedRect(x, y, (ScrW() * 2) + pSize, (ScrH() * 2) + pSize)

    --cam.End2D()

    render.SetStencilCompareFunction(STENCIL_NOTEQUAL)

    surface.SetDrawColor(0, 0, 0, 255)
    surface.DrawRect(0, 0, ScrW(), ScrH())
    
    render.SetStencilEnable(false)
    render.ClearStencil()
end

function SWEP:DrawThermalEntities()
    render.SetStencilWriteMask(0xFF)
    render.SetStencilTestMask(0xFF)
    render.SetStencilReferenceValue(0)
    render.SetStencilCompareFunction(STENCIL_ALWAYS)
    render.SetStencilPassOperation(STENCIL_REPLACE)
    render.SetStencilFailOperation(STENCIL_KEEP)
    render.SetStencilZFailOperation(STENCIL_KEEP)
    render.SetStencilEnable(true)
    render.SetStencilReferenceValue(MWBASE_STENCIL_REFVALUE + 1)

    cam.Start3D()

    for i, e in pairs(ents.GetAll()) do
        if (e:IsNPC() || e:IsPlayer() || e:IsNextBot()) then
            if (e:GetNoDraw()) then
                continue
            end

            e:SetupBones()
            e:DrawModel()
        end
    end

    cam.End3D()

    render.SetStencilCompareFunction(STENCIL_EQUAL)

    surface.SetDrawColor(255, 255, 255, math.random(200, 255))
    surface.DrawRect(0, 0, ScrW(), ScrH())

    render.SetStencilEnable(false)
    render.ClearStencil()
end

function SWEP:DrawLaser(model)
    local laserSettings = self:GetCurrentLaser()
    local laserModel = self:GetCurrentLaserModel(model)

    if (laserSettings == nil || !IsValid(laserModel)) then
        return
    end

    local att = laserModel:GetAttachment(laserModel:LookupAttachment(laserSettings.Attachment))
    local tr = util.TraceLine({
        start = att.Pos,
        endpos = att.Pos + att.Ang:Forward() * 1000,
        filter = {self, self:GetOwner()},
        mask = MASK_SHOT
    })

    if (laserModel.mw_laserTrailPos == nil) then
        laserModel.mw_laserTrailPos = tr.HitPos
    end

    local distSq = tr.HitPos:DistToSqr(att.Pos)
    local beamDelta = math.Clamp(distSq / (laserSettings.BeamSize * laserSettings.BeamSize), 0, 1)

    local color = laserSettings.Color

    if (GetConVar("mgbase_fx_laser_weaponcolor", 0):GetBool()) then
        if (IsValid(self:GetOwner()) && self:GetOwner():IsPlayer()) then
            local c = self:GetOwner():GetWeaponColor()
            color = Color(c.x * 255, c.y * 255, c.z * 255, 255)
        end
    end

    if (self:GetAimDelta() < 0.5 && !laserSettings.EnableHip) then
        color = Color(0, 0, 0, 0)
    end

    render.SetMaterial(laserSettings.BeamMaterial)
    render.DrawBeam(att.Pos, att.Pos + att.Ang:Forward() * (beamDelta * laserSettings.BeamSize), laserSettings.BeamWidth * math.random(0.5, 1), 0, 0.95, color)

    local bCanDrawLaser = true

    if (self:GetCurrentHybrid() == nil) then
        bCanDrawLaser = self:GetAimMode() >= 1
    else
        bCanDrawLaser = self:GetAimMode() >= 2
    end

    local pos = tr.HitPos * 1

    if (bCanDrawLaser || (laserSettings.EnableADS && self:GetAimDelta() >= 0)) then
        self:SafeLerpVector(self:GetAimDelta() * 0.9, pos, EyePos() + EyeAngles():Forward() * 300)
    end

    local normal = tr.HitNormal * 1
    self:SafeLerpVector(self:GetAimDelta(), normal, (EyePos() - pos):GetNormalized())

    local sens = Lerp(self:GetAimDelta(), 50, 150)
    self:SafeLerpVector(math.min(sens * FrameTime(), 1), laserModel.mw_laserTrailPos, pos)

    if ((self:GetAimDelta() < 0.5 && laserSettings.EnableHip) || (bCanDrawLaser && self.LaserAimPos != nil && self.LaserAimAngles != nil) || (self:GetAimDelta() >= 0.5 && laserSettings.EnableADS)) then
        render.SetMaterial(laserSettings.DotMaterial)
        render.DrawQuadEasy(pos, normal, laserSettings.DotSize, laserSettings.DotSize, color, math.random(179, 180))
        render.DrawBeam(laserModel.mw_laserTrailPos, pos, laserSettings.DotSize * 0.8, 0, 0.5, color)
    end
end

function SWEP:DrawFlashlight(model)
    local flashSettings = self:GetCurrentFlashlight()
    local flashModel = self:GetCurrentFlashlightModel(model)

    if (flashSettings == nil || !IsValid(flashModel)) then
        return
    end

    local att = flashModel:GetAttachment(flashModel:LookupAttachment(flashSettings.Attachment))

    if (flashModel.mw_flashlightProjTexture == nil) then
        flashModel.mw_flashlightProjTexture = ProjectedTexture()
    end

    local proj = flashModel.mw_flashlightProjTexture

    proj:SetPos(att.Pos)
    proj:SetAngles(att.Ang)
    proj:SetFOV(50)
    proj:SetTexture(flashSettings.FlashlightMaterial:GetTexture("$basetexture"))

    proj:Update()
end

function SWEP:RequestCustomization() --this is ran on wmodel render hook. so if it weapon never gets rendered on client it can potentially save bandwidth
    if (!self.m_bRequestedCustomization) then
        net.Start("mgbase_attsync_sv")
        net.WriteEntity(self)
        net.SendToServer()

        self.m_bRequestedCustomization = true
    end
end

