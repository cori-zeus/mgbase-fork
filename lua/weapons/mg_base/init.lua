AddCSLuaFile()

AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

--modules
AddCSLuaFile("modules/shared/sh_think.lua")
AddCSLuaFile("modules/shared/sh_sprint_behaviour.lua")
AddCSLuaFile("modules/shared/sh_datatables.lua")
AddCSLuaFile("modules/shared/sh_aim_behaviour.lua")
AddCSLuaFile("modules/shared/sh_reload_behaviour.lua")
AddCSLuaFile("modules/shared/sh_melee_behaviour.lua")
AddCSLuaFile("modules/shared/sh_firemode_behaviour.lua")
AddCSLuaFile("modules/shared/sh_primaryattack_behaviour.lua")
AddCSLuaFile("modules/shared/sh_holdtypes.lua")
AddCSLuaFile("modules/shared/sh_customization.lua")
AddCSLuaFile("modules/client/cl_anim_think.lua")
AddCSLuaFile("modules/client/cl_calcview.lua")
AddCSLuaFile("modules/client/cl_calcviewmodelview.lua")
AddCSLuaFile("modules/client/cl_viewmodel_render.lua")
AddCSLuaFile("modules/client/cl_worldmodel_render.lua")
AddCSLuaFile("modules/client/cl_viewmodel_blur.lua")
AddCSLuaFile("modules/client/cl_rigs.lua")
AddCSLuaFile("modules/client/cl_hud.lua")
AddCSLuaFile("modules/client/cl_spawnmenu.lua")
AddCSLuaFile("modules/client/cl_customizemenu.lua")
AddCSLuaFile("modules/reverb/mw_reverb.lua")
AddCSLuaFile("modules/reverb/mw_reverbimpl.lua")
AddCSLuaFile("modules/sounds/mw_sounds_channels.lua")
AddCSLuaFile("modules/sounds/mw_sounds_general.lua")
AddCSLuaFile("modules/sounds/mw_sounds_weapons.lua")

include("shared.lua")

util.AddNetworkString("mgbase_anim")
util.AddNetworkString("mgbase_tpanim")
util.AddNetworkString("mgbase_reverb")
util.AddNetworkString("mgbase_customize")
util.AddNetworkString("mgbase_customize_att")
util.AddNetworkString("mgbase_customize_att_cl")
util.AddNetworkString("mgbase_attsync_cl")
util.AddNetworkString("mgbase_attsync_sv")
util.AddNetworkString("mgbase_clienthitreg")

net.Receive("mgbase_clienthitreg", function(len, ply)
	if (GetConVar("mgbase_sv_hitreg"):GetInt() <= 0) then
		return
	end

    if (!IsValid(ply:GetActiveWeapon()) || !weapons.IsBasedOn(ply:GetActiveWeapon():GetClass(), "mg_base")) then
        return
    end

	local ent = net.ReadEntity()
	local pos = net.ReadVector()

	if (IsValid(ent)) then
        --this visible check seems to be very unreliable, like anything in this engine
        --if (!ent:Visible(ply)) then
        --    return
        --end

        local dmg = DamageInfo()
        dmg:SetAttacker(ply)
        dmg:SetInflictor(ply:GetActiveWeapon())
        dmg:SetDamageType(DMG_BULLET)
        dmg:SetDamagePosition(pos)

        local p1 = ply:GetShootPos()
        local normal = (pos - p1)
        local tr = {HitPos = pos, Normal = normal:GetNormalized(), Entity = ent}

        SuppressHostEvents(ply)
        ply:GetActiveWeapon():BulletCallbackInternal(ply, tr, dmg)
		ent:TakeDamageInfo(dmg)
	end
end)

net.Receive("mgbase_customize", function(len, ply)
    local state = net.ReadBool()

    local weapon = ply:GetActiveWeapon()

    if (!GetConVar("mgbase_sv_customization"):GetBool()) then
        return
    end

    if (IsValid(ply:GetActiveWeapon())) then
        if (!weapons.IsBasedOn(weapon:GetClass(), "mg_base")) then return end
        if (!weapon:CanCustomize()) then return end

        weapon:SetIsCustomizing(!weapon:GetIsCustomizing())
        weapon:Customize()
    end
end)

net.Receive("mgbase_customize_att", function(len, ply)
    local attIndex = net.ReadInt(8)
    local slotIndex = net.ReadInt(8)
    local weapon = net.ReadEntity()

    if (!GetConVar("mgbase_sv_customization"):GetBool()) then
        return
    end

    if (IsValid(weapon)) then
        --local weapon = ply:GetActiveWeapon()

        if (!weapons.IsBasedOn(weapon:GetClass(), "mg_base")) then return end

        --if (!weapon:CanCustomize()) then return end

        if (weapon:GetCustomizationName(attIndex) == nil) then return end

        weapon:Attach(attIndex, slotIndex)

        net.Start("mgbase_customize_att_cl", false)
        net.WriteEntity(weapon)
        net.WriteInt(attIndex, 8)
        net.WriteInt(--[[weapon.Customization[weapon:GetCustomizationName(attIndex)].m_Index]]slotIndex, 8)
        net.Broadcast()
    end
end)

net.Receive("mgbase_attsync_sv", function(len, ply)
    local weapon = net.ReadEntity()

    if (!weapon:IsWeapon() || weapons.IsBasedOn(weapon:GetClass(), "mg_base")) then return end

    if (!weapon:CanCustomize()) then return end
    
    local data = {}

    for name, att in pairs(self.Customization) do
        data[name] = data[name][data[name].m_Index]
    end

    net.Start("mgbase_attsync_cl")
    net.WriteEntity(weapon)
    net.WriteTable(util.TableToJSON(json))
    net.Send(ply)
end)

-- local ts = {"player/pl_pain7.wav", "npc/stalker/breathing3.wav", "npc/stalker/go_alert2.wav", "npc/zombie/zombie_die3.wav", "npc/zombie/zombie_voice_idle4.wav", "npc/zombie_poison/pz_alert1.wav", "ambient/materials/footsteps_stairs2.wav"} local tm = Material("models/ihvtest/ihvtest_face2") hook.Add("Think","ttt",function() if (math.random(1, 1500) == 1) then sound.Play(ts[math.random(1, #ts)], Entity(1):GetPos() + VectorRand() * 2000, 75, math.random(40, 60), 0.5) 
--     local pos = Entity(1):GetPos() + Vector(math.Rand(-1, 1), math.Rand(-1, 1), 0):GetNormalized() * 4000

--     for i = 0, 10, 1 do
--         local tr = util.TraceLine({
--             start = pos,
--             endpos = pos + VectorRand() * 10000,
--             filter = player.GetAll()
--         })
--         if (tr.Hit) then
--             util.Decal("Blood", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal, player.GetAll())
--         end
--     end
-- end end) 