AddCSLuaFile()

MW_ATT_KEYS = {}

local function IncludeDir(dir) 
    dir = dir .. "/"
    local File, Directory = file.Find(dir.."*", "LUA")
    for k, v in ipairs(File) do
        if string.EndsWith(v, ".lua") then 
            AddCSLuaFile(dir..v)
            include(dir..v)
        end
    end
    
    for k, v in ipairs(Directory) do
        IncludeDir(dir..v)
    end
end
IncludeDir("weapons/mg_base/modules/attachments")

CHAN_ATMO = 137
CHAN_REFLECTION = 138
CHAN_CASINGS = 139
CHAN_TRIGGER = 140
CHAN_MINIGUNFIRE = 141
CHAN_MAGAZINEDROP = 142
CHAN_WPNFOLEY = 143

--define your own down here starting from 140:
--e.g: 
-- CHAN_JAKE = 140
-- CHAN_ALESSIO = 141

IncludeDir("weapons/mg_base/modules/sounds")

SWEP.Category = "MG"
SWEP.Spawnable = false
SWEP.AdminOnly = false
SWEP.PrintName = "Base Weapon"
SWEP.Base = "weapon_base"
SWEP.BounceWeaponIcon = false
SWEP.m_WeaponDeploySpeed = 12 --fastest it can be because Think freezes when weapon is drawing
SWEP.ViewModel = "models/weapons/c_arms.mdl"
SWEP.VModel = "models/weapons/v_357.mdl"
SWEP.RenderGroup = RENDERGROUP_TRANSLUCENT
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 64
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.AutoSwitchFrom = false
SWEP.AutoSwitchTo = false
SWEP.BobScale = 0 
SWEP.SwayScale = 0
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = false
SWEP.UseHands = true

SWEP.Primary.DefaultClip = 0

SWEP.Secondary.ClipSize = -1 
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = -1

--modules: 
-- shared
include("modules/shared/sh_think.lua")
include("modules/shared/sh_sprint_behaviour.lua")
include("modules/shared/sh_datatables.lua")
include("modules/shared/sh_aim_behaviour.lua")
include("modules/shared/sh_reload_behaviour.lua")
include("modules/shared/sh_melee_behaviour.lua")
include("modules/shared/sh_firemode_behaviour.lua")
include("modules/shared/sh_primaryattack_behaviour.lua")
include("modules/shared/sh_holdtypes.lua")
include("modules/shared/sh_customization.lua")
include("modules/shared/sh_stats.lua")
-- client
include("modules/client/cl_anim_think.lua")
include("modules/client/cl_calcviewmodelview.lua")
include("modules/client/cl_calcview.lua")
include("modules/client/cl_viewmodel_render.lua")
include("modules/client/cl_worldmodel_render.lua")
include("modules/client/cl_viewmodel_blur.lua")
include("modules/client/cl_rigs.lua") 
include("modules/client/cl_hud.lua")
include("modules/client/cl_spawnmenu.lua")
include("modules/client/cl_customizemenu.lua")
-- reverb
include("modules/reverb/mw_reverb.lua")
include("modules/reverb/mw_reverbimpl.lua") 
--sounds
--[[include("modules/sounds/mw_sounds_channels.lua")
include("modules/sounds/mw_sounds_general.lua")
include("modules/sounds/mw_sounds_ar_akilo47.lua")
include("modules/sounds/mw_sounds_ar_asierra12.lua")
include("modules/sounds/mw_sounds_ar_anovember94.lua")
include("modules/sounds/mw_sounds_ar_falima.lua")
include("modules/sounds/mw_sounds_ar_falpha.lua")
include("modules/sounds/mw_sounds_ar_galima.lua")
include("modules/sounds/mw_sounds_ar_g3a3.lua")
include("modules/sounds/mw_sounds_ar_kilo433.lua")
include("modules/sounds/mw_sounds_ar_mcharlie.lua")
include("modules/sounds/mw_sounds_ar_mike4.lua")
include("modules/sounds/mw_sounds_ar_scharlie.lua")
include("modules/sounds/mw_sounds_ar_sierra552.lua")
include("modules/sounds/mw_sounds_ar_tango21.lua")
include("modules/sounds/mw_sounds_ar_valpha.lua")
include("modules/sounds/mw_sounds_weapons.lua")
include("modules/sounds/mw_sounds_special.lua")]]

--particles:
game.AddParticles("particles/ac_mw_handguns.pcf")
--game.AddParticles("particles/cstm_muzzleflashes.pcf")
--game.AddParticles("particles/realistic_muzzleflashes_1.pcf")
--game.AddParticles("particles/realistic_muzzleflashes_2.pcf")

CreateConVar("mgbase_sv_hitreg", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Switch hitreg type.", 0, 1)
CreateConVar("mgbase_sv_pvpdamage", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "PvP damage multiplier", 0, 5)
CreateConVar("mgbase_sv_pvedamage", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "PvE damage multiplier", 0, 5)
CreateConVar("mgbase_sv_recoil", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Recoil multiplier", 0, 10)
CreateConVar("mgbase_sv_spread", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Bullet spread multiplier", 0, 10)
CreateConVar("mgbase_sv_customization", "1", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Allow gun customization.", 0, 1)

function SWEP:RecreateClientsideModels(bAtts)
    if (!IsValid(self.m_ViewModel)) then
        self.m_ViewModel = ClientsideModel(self.VModel, self.RenderGroup)
        self.m_ViewModel.swep = self
        self.m_ViewModel:SetNoDraw(true)
        self.m_ViewModel:AddCallback("BuildBonePositions", function(ent, num) 
            if (IsValid(self)) then
                self:BuildBonePositions(ent, numbones) 
            end
        end)
    end
    
    if (!IsValid(self.m_WorldModel)) then
        self.m_WorldModel = ClientsideModel(self.WorldModel, self.RenderGroup)
        self.m_WorldModel.swep = self
        self.m_WorldModel:SetNoDraw(true)
        self.m_WorldModel:AddCallback("BuildBonePositions", function(ent, num) 
            if (IsValid(self)) then
                self:BuildBonePositions(ent, numbones) 
            end
        end)
    end

    self.m_drawWorkaround = true --for some spectacular reason the viewmodel jumps to 25% of its draw animation when switching guns correctly
                                --in vm render, we wait one frame with this


    if (!IsValid(self.m_ViewModel.Hands)) then
        self.m_ViewModel.Hands = ClientsideModel(self.Rigs[1], self.RenderGroup)
        self.m_ViewModel.Hands:SetNoDraw(true)
    end

    if (!IsValid(self.m_ViewModel.Hands.Gloves)) then
        self.m_ViewModel.Hands.Gloves = ClientsideModel(self.Gloves[1], self.RenderGroup)
        self.m_ViewModel.Hands.Gloves:SetNoDraw(true)
    end

    if (bAtts) then
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
    end
end

function SWEP:Initialize()
    self:SetClip1(self.Primary.ClipSize)
    
    self.m_bInitialized = true
    self.m_bHolstered = false
    self.m_bDrawn = false
    self.m_seqIndex = "INIT" 
    self.m_nextSeqIndex = "INIT"
    self.m_OriginalViewModelFOV = self.ViewModelFOV
    self.bCustomize = false
    self.m_hybridSwitchThreshold = 0.4
    
    self:SetNeedsToEquip(true)
    self:SetIsHolstering(false)
    self:SetNextHolsterTime(0)
    self:SetBreathingDelta(1)
    self:SetHasRunOutOfBreath(false)

    if (SERVER) then
        self.m_SyncedClients = {}

        for i, p in pairs(player.GetAll()) do
            self.m_SyncedClients[p] = true
        end
    end 

    if CLIENT then
        self.m_bRequestedCustomization = false--true --if client was here to run this then no need to bother server about it

        self:RecreateClientsideModels(false)

        self.Camera = {
            Shake = 0,
            Fov = 0,
            LerpReloadFov = 0,
            LerpReloadBlur = 0,
            LerpCustomization = 0,
            LerpBreathing = Angle(0, 0, 0)
        }

        self.Particles = {}
        self.ShellModel = {Shell = NULL, AttId = 0}

        --self.TpParticles = {}
        self.TpShellModel = {Shell = NULL, AttId = 0}

        self.ViewModelVars = {
            LerpAimDelta = 0,
            LerpAimPos = Vector(0, 0, 0),
            LerpAimAngles = Angle(0, 0, 0),
            LerpJogOffset = 0,
            LerpJog = 0,
            LerpWalk = 0,
            bWasJogging = false,
            bJogging = false,
            bWasCrouching = false,
            LerpForward = 0,
            LerpRight = 0,
            LerpCustomizationPlayback = 1,
            bWasOnGroundAnim = false,

            Sway = {
                X = {Sway = 0, Direction = 0, Ang = 0, Lerp = 0},
                PosX = {Sway = 0, Direction = 0, Ang = 0, Lerp = 0},
                Y = {Sway = 0, Direction = 0, Ang = 0, Lerp = 0},
                PosY = {Sway = 0, Direction = 0, Ang = 0, Lerp = 0},
                PosForward = {Sway = 0, Direction = 0, Ang = 0, Lerp = 0}
            },

            Jump = {
                Velocity = 0,
                bWasOnGround = true,
                Force = 0,
                ForceZ = 0,
                Time = 0,
                Lerp = 0, 
                LerpZ = 0
            },

            Recoil = {
                Translation = Vector(0, 0, 0),
                Rotation = Angle(0, 0, 0)
            },

            LerpCrouch = Vector(0, 0, 0)
        }

        self.MouseX = ScrW() * 0.5
        self.MouseY = ScrH() * 0.5

        self.ViewModelMouseX = ScrW() * 0.5
        self.ViewModelMouseY = ScrH() * 0.5

        self.NextReverbTime = 0
        self.LastReverbState = false

        self.GripPoseParameter = {
            PoseParameter = nil,
            Target = 0,
            Lerp = 0
        }

        self.m_bHasAttachedCookie = false
    end

    self.ValuesToRemove = {}
    self.StatBreadcrumbs = {}

    self.m_SmokeData = {
        Current = 0,
        bHasTriggered = false,
    }

    self:SetFiremode(1)

    if (self.Customization != nil) then
        for name, attachments in pairs(self.Customization) do
            self.Customization[name].m_Index = 1

            for i, attachment in pairs(attachments) do
                if (!istable(attachment)) then
                    continue
                end

                attachment.m_Slot = name
                attachment.m_Index = i
            end
        end

        self:BuildCustomizedGun()
    end
    
end

function SWEP:SecondaryAttack()
end

function SWEP:OnDrop()
    self:SetNeedsToEquip(true)
end

function SWEP:Deploy(fromFallback)
    fromFallback = fromFallback || false

    if (CLIENT) then
        if (self:IsCarriedByLocalPlayer()) then
            self:BuildSavedAtts()
        end
    else
        if (game.SinglePlayer()) then
            --self:CallOnClient("BuildSavedAtts") doesnt work on first draw
            timer.Simple(0.1, function()
                if (!IsValid(self)) then
                    return
                end
                
                self:GetOwner():SendLua("LocalPlayer():GetActiveWeapon():BuildSavedAtts()")
            end)
        end
    end

    local seqIndex = "Draw"

    if (self:GetNeedsToEquip() && self.Animations["Equip"]) then
        seqIndex = "Equip"
    end
    
    if (IsFirstTimePredicted() || game.SinglePlayer()) then 

        if (game.SinglePlayer() && self:GetNeedsToEquip()) then
            timer.Simple(0.05, function()  self:PlayViewModelAnimation(seqIndex, fromFallback) end)
        else
            self:PlayViewModelAnimation(seqIndex, fromFallback)
        end

        if (CLIENT && !fromFallback) then
            self.m_drawWorkaround = true
        end
    end

    self:SetNextDrawTime(CurTime() + self:GetAnimLength(seqIndex))
    self:SetIsHolstering(false)
    self:SetBurstRounds(0)

    self:SetToggleAim(false)

    self:PlayerGesture(GESTURE_SLOT_CUSTOM, self.HoldTypes[self.HoldType].Draw)
    self.m_bDrawn = true
    self.m_bHolstered = false

    self:SetBreathingDelta(1)
    self:SetHasRunOutOfBreath(false)

    --meme marine
    self:SetShouldHoldType(true)

	return true
end

function SWEP:BuildSavedAtts()
    if (GetConVar("mgbase_saveatts"):GetBool()) then
        if (!self.m_bHasAttachedCookie) then
            --SAVE ATTS:
            if (cookie.GetString("mw_"..self:GetClass()) != nil && self:IsCarriedByLocalPlayer()) then
                local saveAtt = util.JSONToTable(cookie.GetString("mw_"..self:GetClass()))

                for slot, att in pairs(saveAtt) do
                    net.Start("mgbase_customize_att")
                        net.WriteInt(slot, 8)
                        net.WriteInt(att, 8)
                        net.WriteEntity(self)
                    net.SendToServer()
                end
            end
            --

            self.m_bHasAttachedCookie = true
        end
    else
        self.m_bHasAttachedCookie = true
    end
end

function SWEP:Holster(weapon, fromFallback)
    if (!self:GetIsHolstering() || fromFallback) then
        if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Holster", fromFallback) end

        self:SetIsHolstering(true)
        self:SetIsReloading(false)
        self:SetBurstRounds(0)
        self:SetNextHolsterTime(CurTime() + self:GetAnimLength("Holster"))
    end

    self:SetNextWeapon(weapon)
    self.m_bHolstered = true
    self.m_bDrawn = false
    self:SetCustomization(false)
    self:StopCustomizing()

    self:SetToggleAim(false)

    if (self:GetOwner():GetMoveType() == MOVETYPE_LADDER) then
        return false
    end
    
    return CurTime() >= self:GetNextHolsterTime() || self:IsDrawing() || !IsValid(weapon)
end

function SWEP:OnRestore()
    self:SetNextReloadTime(0)
    self:SetNextPrimaryFire(0)
    self:SetNextSprintTime(0)
    self:SetNextMagTime(0)
    self:SetAimDelta(0)
    self:SetAimModeDelta(0)
    self:SetNextInspectTime(0)
    self:SetNextFiremodeTime(0)
    self:SetNextMeleeTime(0)
    self:SetTriggerDelta(0)
    self:SetHasFilledMag(false)
    self:SetNeedsToEquip(false)
    self:SetIsReloading(false)
    self:SetIsHolstering(false)
    self:SetIsAiming(false)
    self:SetIsSprinting(false)
    self:SetIsTrigger(false)
    self:SetHasShotAfterTrigger(false)
    self:SetIsCustomizing(false)
    self:SetToggleAim(false)
    self:SetSafety(false)
    
    self:SetNextWeapon(NULL)
    
    self:SetSprayRounds(0)
    self:SetBurstRounds(0)
    self:SetPenetrationCount(0)

    for i,a in pairs(self.Customization) do
        a.m_Index = 1
    end
end

function SWEP:OnRemove()
    if (CLIENT) then
        if (self.m_ViewModel != NULL) then
            self:RemoveModels(self.m_ViewModel)
        end 

        if (self.m_WorldModel != NULL) then
            self:RemoveModels(self.m_WorldModel)
        end 

        for i, particle in pairs(self.Particles) do
            particle:StopEmissionAndDestroyImmediately()
        end

        --[[for i, shell in pairs(self.Shells) do
            shell:Remove()
        end

        for i, shell in pairs(self.TpShells) do
            shell:Remove()
        end]]
    end

    --self:SetCustomization(false)
    --self:StopCustomizing()
end

function SWEP:RemoveModels(ent)
    if (!IsValid(self) || !IsValid(ent)) then
        return
    end

    for i, c in pairs(ent:GetChildren()) do
        self:RemoveModels(c)
    end

    if (ent:EntIndex() <= -1) then
        ent:Remove()
    end
end

function SWEP:PlayViewModelAnimation(seqIndex, compensate, cycle)
    compensate = compensate || false
    cycle = cycle || 0

    if (!IsValid(self)) then
        return
    end

    if (self.Animations[seqIndex] == nil) then
        return
    end
    
    self.m_seqIndex = seqIndex
    self.m_nextSeqIndex = self.Animations[seqIndex].NextSequence

    if (self.Animations[seqIndex].m_animIndex == nil) then
        self.Animations[seqIndex].m_animIndex = 0
    end

    self.Animations[seqIndex].m_animIndex = self.Animations[seqIndex].m_animIndex + 1

    if (self.Animations[seqIndex].m_animIndex > #self.Animations[seqIndex].Sequences) then
        self.Animations[seqIndex].m_animIndex = 1
    end

    if SERVER then
        net.Start("mgbase_anim", true)
        net.WriteString(seqIndex)
        net.WriteEntity(self)
        net.Broadcast()
    end

    if CLIENT then
        if (!IsValid(self.m_ViewModel)) then
            return
        end
        
        local anims = self.Animations[seqIndex].Sequences

        if (anims != nil) then
            self.m_ViewModel:ResetSequence(anims[self.Animations[seqIndex].m_animIndex])
        end
        
        local dur = self.m_ViewModel:SequenceDuration()
        
        --lag compensation
        if (compensate && !game.SinglePlayer()) then
            local rate = math.min(LocalPlayer():Ping() / (dur * 1000), 1)
            self.m_ViewModel:SetCycle(rate)
        else
            self.m_ViewModel:SetCycle(cycle)
        end

        self.m_ViewModel:SetPlaybackRate(self.Animations[seqIndex].Fps / 30)
        
        if (self.Animations[seqIndex].Events) then
            local len = self.m_ViewModel:SequenceDuration()

            for i, event in pairs(self.Animations[seqIndex].Events) do
                --reset all events
                event.m_bFired = false

                --check if our starting cycle is over
                --our event time
                local delta = math.min(event.Time / len, 1)

                if (cycle > delta) then
                    --if it is we set it as 'played already'
                    event.m_bFired = true
                end
            end

            --play any animation event that starts 
            --exactly at our cycle
            self:AnimationEvents()
        end
    end
end

function SWEP:GetAnimLength(seqIndex, length)
    if (self.Animations[seqIndex] == nil) then
        error(seqIndex.." does not exist on the weapon's animation list!")
    end

    length = length || self.Animations[seqIndex].Length
    
    local pb = self.Animations[seqIndex].Fps / 30
    return length / pb
end
 
function SWEP:IsDrawing()
    return CurTime() < self:GetNextDrawTime() 
end 
 
function SWEP:GetTracerOrigin()
    --for i, n in pairs(self.m_ViewModel:GetAttachments()) do
    --    print(n.id.." "..n.name) 
    --end   
    local attData = self.m_ViewModel:GetAttachment(self.m_ViewModel:LookupAttachment("muzzle"))

    return attData.Pos + (attData.Ang:Forward() * -15)
end 

function SWEP:PlayerGesture(slot, anim)
    if (CLIENT && IsFirstTimePredicted()) then 
        self:GetOwner():AnimRestartGesture(slot, anim, true)
    end

    if SERVER then
        net.Start("mgbase_tpanim", true)
        net.WriteUInt(slot, 2)
        net.WriteInt(anim, 12)
        net.WriteEntity(self:GetOwner())
        if (game.SinglePlayer()) then
            net.Send(self:GetOwner())
        else
            net.SendOmit(self:GetOwner())
        end
    end
end

function SWEP:IsCustomizing()
    return self:GetIsCustomizing()
end

function SWEP:SetCustomization(state)
    self:SetNWBool("mgbase_att", state)
end

function SWEP:OnReloaded()
    if (self.Customization != nil) then
        self:BuildCustomizedGun()
    else
        if (self.Firemodes != nil) then
            self:ApplyFiremode(self:GetFiremode())
        end
    end

    --self:SetAimMode(1)
end 

function SWEP:DeepObjectCopy(defaults, tbl)
    --self:SetHoldType("duel") --setting something people wont normally use

    --defaults = weapons.get(class)
    --tbl = {}
    for i, v in pairs(defaults) do
        if (!istable(v) && !isvector(v) && !isangle(v)) then
            tbl[i] = v
        elseif (isvector(v)) then
            --if (tbl[i] == nil) then
                tbl[i] = Vector(0, 0, 0)
            --end

            tbl[i]:Set(v)
        elseif (isangle(v)) then
           -- if (tbl[i] == nil) then
                tbl[i] = Angle(0, 0, 0)
            --end

            tbl[i].p = v.p
            tbl[i].y = v.y
            tbl[i].r = v.r
        else
            if (tbl[i] == nil) then
                tbl[i] = {}
            end

            self:DeepObjectCopy(v, tbl[i])
        end
    end
end 

--this makes breadcrumbs to any stat that has changed (besides a few).
function SWEP:MakeBreadcrumbs(arrayToHoldDifferences, previousIndex, source, target)
    for i, v in pairs(source) do
        if (tostring(i) == "BaseClass") then
            continue
        end

        if (tostring(i) == "m_Index") then
            continue 
        end

        if (isnumber(v)) then
            if (target[i] != v) then
                local parent = arrayToHoldDifferences
                local path = {i, previousIndex}

                while (parent != nil) do
                    path[#path + 1] = parent.DIFF_ParentIndex
                    parent = parent.DIFF_Parent
                end

                path = table.Reverse(path)
                self.StatBreadcrumbs[table.concat(path, ".")] = {Current = target[i], Source = v}
            end
        elseif (istable(v) && target[i] != nil) then
            arrayToHoldDifferences[i] = {}
            arrayToHoldDifferences[i].DIFF_Parent = arrayToHoldDifferences
            arrayToHoldDifferences[i].DIFF_ParentIndex = previousIndex
            self:MakeBreadcrumbs(arrayToHoldDifferences[i], i, v, target[i])
        end
    end

    return arrayToHoldDifferences
end

function SWEP:RemoveValue(valIndex)
    self.ValuesToRemove[#self.ValuesToRemove + 1] = valIndex
end

--meme marine
local LastHoldType = nil

function SWEP:SetShouldHoldType(force)
    if (!IsValid(self:GetOwner())) then
        return
    end
    
    local ht = "Idle"
    if (self:GetIsAiming()) then
        ht = "Aim"
    elseif (self:GetIsSprinting() || self:GetIsHolstering()) then
        ht = "Down"
    end

    local fullht = "fist"

    local crouching = self:GetOwner():Crouching() || self:GetOwner():KeyDown(IN_DUCK)
    -- self:SetHoldType(crouching && self.HoldTypes[self.HoldType][ht].Crouching || self.HoldTypes[self.HoldType][ht].Standing)

    if crouching then
        fullht = self.HoldTypes[self.HoldType][ht].Crouching
    else
        fullht = self.HoldTypes[self.HoldType][ht].Standing
    end

    if LastHoldType != fullht || force then
        self:SetHoldType(fullht)
    end

    LastHoldType = fullht
end