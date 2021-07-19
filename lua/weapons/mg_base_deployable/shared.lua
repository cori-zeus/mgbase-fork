AddCSLuaFile()

SWEP.Base = "mg_base"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1

--implementation
--the behaviour on this gun is just purely custom
--reimplementing all the methods...

DEFINE_BASECLASS("mg_base")

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)

    self:NetworkVar("Bool", "6", "IsDeploying")
    self:NetworkVar("Bool", "7", "HasDroppedBox")
end

function SWEP:Deploy()
    if (IsFirstTimePredicted()) then 
        self:PlayViewModelAnimation("Draw") 

        if (CLIENT) then
            self.m_drawWorkaround = true
        end
    end

    self:SetNextDrawTime(CurTime() + self:GetAnimLength("Draw"))
    self:SetIsDeploying(false)

    self.m_bDrawn = true

    return true
end

function SWEP:HUDShouldDraw(element)
    if (element == "CHudAmmo") then
        return false
    end
    
    return true
end

function SWEP:CanCustomize()
    return false
end

function SWEP:Think()
    self:SetHoldType("fist")

    --fallback initialize
    if (!self.m_bInitialized && IsFirstTimePredicted()) then
        self:Initialize()
    end

    --fallback draw
    if (!self.m_bDrawn && self:IsDrawing() && IsFirstTimePredicted()) then
        self:Deploy(true)
    end

    --melee
    if (self.Animations["Melee"] != nil) then
        self:MeleeBehaviourModule()
    end
    
    if (!self:GetOwner():GetGroundEntity():IsWorld() && !self:GetHasDroppedBox() && self.Stationary) then
        if (self:GetIsDeploying()) then
            if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Idle") end
            self:SetIsDeploying(false)
        end
    end

    if (CurTime() > self:LastShootTime() + self:GetAnimLength("Deploy", self.Animations["Deploy"].DeployLength)) then
        if (self:GetIsDeploying() && !self:GetHasDroppedBox()) then
            if (SERVER) then
                local ammo = ents.Create(self.Deployable)
                ammo:SetOwner(self:GetOwner())
                ammo:Spawn()
                self:OnSpawnDeployable(ammo)
            end

            self:SetHasDroppedBox(true)
        end
    end

    if (CurTime() > self:GetNextPrimaryFire() && self:GetIsDeploying()) then
        if (self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType()) > 0) then
            self:Deploy()
            self:GetOwner():SetAmmo(self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType()) - 1, self:GetPrimaryAmmoType())
        else
            --autoswitchfrom doesn't seem to do anything

            if (CLIENT && IsFirstTimePredicted()) then
                RunConsoleCommand("lastinv") --fuck it idk

                if (!IsValid(LocalPlayer():GetActiveWeapon())) then --in case if lastinv didnt work
                    for i, w in pairs(LocalPlayer():GetWeapons()) do
                        input.SelectWeapon(w)
                        break
                    end
                end
            end

            if (SERVER) then
                self:Remove()

                if (game.SinglePlayer()) then
                    RunConsoleCommand("lastinv")

                    if (!IsValid(self:GetOwner():GetActiveWeapon())) then
                        for i, w in pairs(self:GetOwner():GetWeapons()) do
                            self:GetOwner():SelectWeapon(w:GetClass())
                            break
                        end
                    end
                end
            end
        end
    end
end

function SWEP:PrimaryAttack()
    if (self:IsDrawing()) then 
        return 
    end

    if (CurTime() < self:GetNextMeleeTime()) then 
        return 
    end

    if (self:GetOwner():KeyDown(IN_USE)) then 
        return 
    end

    if (IsFirstTimePredicted()) then self:PlayViewModelAnimation("Deploy") end

    self:SetLastShootTime(CurTime())
    self:SetNextPrimaryFire(CurTime() + self:GetAnimLength("Deploy"))
    self:SetIsDeploying(true)
    self:SetHasDroppedBox(false)

    self:PlayerGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, self.HoldTypes.AmmoBox.Deploy)
end

function SWEP:Reload()
end

function SWEP:SecondaryAttack()
end

function SWEP:Holster()
    self.m_bDrawn = false
    self:SetIsDeploying(false)

    return true
end

function SWEP:CalcView(ply, pos, ang, fov)
    self.m_ViewModel:SetAngles(ang)

    local cameraAttAngles = self.m_ViewModel:GetAttachment(self.m_ViewModel:LookupAttachment("camera")).Ang
    ang = ang + (cameraAttAngles - self.m_ViewModel:GetAngles())

    self:CalcViewModel(self:GetOwner():GetViewModel(), ply:EyePos(), ply:EyeAngles(), pos, ang)

    return pos, ang, fov
end

function SWEP:CalcViewModel(ViewModel, OldEyePos, OldEyeAng, EyePos, EyeAng)
    if (!IsValid(self:GetOwner())) then
        return EyePos, EyeAng
    end

    local vars = self.ViewModelVars

    --anims
    self:AnimThinkModule()

    --jump
    self:CalcViewModelJump()
    
    --movement sway
    self:CalcMovementSway()

    --sway
    self:CalcSway(Angle(OldEyeAng.p, OldEyeAng.y, OldEyeAng.r))

    EyeAng = EyeAng + Angle(vars.Jump.Lerp, 0, 0)
    EyeAng = EyeAng + Angle(vars.Sway.Y.Lerp, vars.Sway.X.Lerp, 0)

    EyePos = EyePos + EyeAng:Up() * (vars.Jump.LerpZ * -0.05)
    EyePos = EyePos + EyeAng:Right() * -vars.LerpRight + EyeAng:Forward() * -(vars.LerpForward * 2)
    EyePos = EyePos + EyeAng:Up() * math.sin(CurTime() * 2) * 0.1 + EyeAng:Right() * math.cos(CurTime() * 2) * 0.1
    EyePos = EyePos + EyeAng:Right() * (vars.Sway.PosX.Lerp * 0.1) + EyeAng:Forward() * (vars.Sway.PosForward.Lerp * 0.1) + EyeAng:Up() * (vars.Sway.PosY.Lerp * 0.1)

    self.m_ViewModel:SetPos(EyePos)
    self.m_ViewModel:SetAngles(EyeAng)
end

function SWEP:OnReloaded()
end


function SWEP:DrawWorldModel(flags)
    BaseClass.DrawWorldModel(self, flags)
    
    self:SetRenderAngles(nil)
    self:SetRenderOrigin(nil)

    if (!IsValid(self:GetOwner())) then
        return
    end

    local rHand = self:GetOwner():LookupBone("ValveBiped.Bip01_R_Hand")
    local lHand = self:GetOwner():LookupBone("ValveBiped.Bip01_L_Hand")

    local rHandPos = self:GetOwner():GetBonePosition(rHand)
    local lHandPos = self:GetOwner():GetBonePosition(lHand)

    local ang = (rHandPos - lHandPos):Angle()

    self:SetRenderAngles(ang)

    local pos = (rHandPos + lHandPos) / 2
    self:SetRenderOrigin(pos + ang:Right() * -5)
end

function SWEP:FreezeMovement()
    return self.Stationary && self:GetIsDeploying()
end

function SWEP:OnSpawnDeployable(deployable)

end