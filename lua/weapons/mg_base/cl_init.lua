AddCSLuaFile()

include("shared.lua")

MWBASE_STENCIL_REFVALUE = 69

CreateClientConVar("mgbase_rig", "0", true, true, "Change first person arms rig.", 0, MGBASE_RIGS_COUNT)
CreateClientConVar("mgbase_rig_skin", "0", true, true, "Change first person arms rig skin.", 0, MGBASE_RIGS_SKIN_COUNT - 1)
CreateClientConVar("mgbase_gloves", "1", true, true, "Change first person arms gloves.", 1, MGBASE_GLOVES_COUNT)
CreateClientConVar("mgbase_gloves_skin", "0", true, true, "Change first person arms gloves.", 0, MGBASE_GLOVES_SKIN_COUNT - 1)
CreateClientConVar("mgbase_toggleaim", "0", true, true, "Hold to aim.", 0, 1)
CreateClientConVar("mgbase_autoreload", "1", true, true, "Toggle auto reload.", 0, 1)
CreateClientConVar("mgbase_scopesens", "1", true, true, "Scope aim sensitivity.", 0.01, 10)
CreateClientConVar("mgbase_saveatts", "1", true, true, "Toggle attachments saving.", 0, 1)
CreateClientConVar("mgbase_fx_vmblur_hip", "1", true, true, "Toggle viewmodel blur when firing from the hip.", 0, 1)
CreateClientConVar("mgbase_fx_vmblur", "1", true, true, "Toggle viewmodel blur when aiming.", 0, 1)
CreateClientConVar("mgbase_fx_blur", "1", true, true, "Toggle first person blur.", 0, 1)
CreateClientConVar("mgbase_fx_cheap_particles", "0", true, true, "Toggle cheap particles.", 0, 1)
CreateClientConVar("mgbase_fx_smoke", "1", true, true, "Toggle barrel smoke.", 0, 1)
CreateClientConVar("mgbase_fx_cheap_reticles", "0", true, true, "Toggle cheap reticles.", 0, 1)
CreateClientConVar("mgbase_fx_laser_weaponcolor", "0", true, true, "Toggle sandbox weapon color usage for lasers.", 0, 1)
CreateClientConVar("mgbase_fx_vmfov", "1", true, true, "Change viewmodel FOV.", 0.1, 2)
CreateClientConVar("mgbase_fx_reticle_brightness", "1", true, true, "Change reticle brightness.", 1, 6)
CreateClientConVar("mgbase_hud_xhaircolor", "255 255 255", true, true, "Crosshair color.", 0, 1)
CreateClientConVar("mgbase_hud_xhair", "1", true, true, "Toggle crosshair.", 0, 1)
CreateClientConVar("mgbase_hud_firemode", "1", true, true, "Toggle firemode HUD.", 0, 1)
CreateClientConVar("mgbase_hud_sights", "1", true, true, "Toggle sights HUD.", 0, 1)
CreateClientConVar("mgbase_debug_freeview", "0", false, true, "Toggle debug free view.", 0, 1)
CreateClientConVar("mgbase_debug_crosshair", "0", false, true, "Toggle debug crosshair for ironsights.", 0, 1)
CreateClientConVar("mgbase_debug_disablebreathing", "0", false, true, "Toggle breathing.", 0, 1)

net.Receive("mgbase_anim", function()
    local seqIndex = net.ReadString()
    local weapon = net.ReadEntity()

    if (weapon == NULL) then
        return
    end
 
    if (!weapon.PlayViewModelAnimation) then
        return
    end

    if (weapon:IsCarriedByLocalPlayer()) then
        if (game.SinglePlayer()) then
            weapon:PlayViewModelAnimation(seqIndex)
        end
    else
        weapon:PlayViewModelAnimation(seqIndex)
    end
end)

net.Receive("mgbase_tpanim", function()
    local slot = net.ReadUInt(2)
    local anim = net.ReadInt(12)
    local ply = net.ReadEntity()

    if (ply == NULL) then
        return
    end

    ply:AnimRestartGesture(slot, anim, true)
end)

net.Receive("mgbase_reverb", function()
    local weapon = net.ReadEntity()

    if (!IsValid(weapon)) then
        return
    end

    if (weapon.HandleReverb == nil) then
        return
    end

    weapon:HandleReverb()
end)

net.Receive("mgbase_customize_att_cl", function(len, ply)
    local weapon = net.ReadEntity()
    local attIndex = net.ReadInt(8)
    local slotIndex = net.ReadInt(8)

    if (IsValid(weapon)) then
        weapon:Attach(attIndex, slotIndex)

        if (weapon:IsCarriedByLocalPlayer()) then
            local saveAtt = {}
            for name, attachments in pairs(weapon.Customization) do
                local attachment = attachments[attachments.m_Index]
                saveAtt[attachments.Slot] = attachments.m_Index
            end
            cookie.Set("mw_"..weapon:GetClass(), util.TableToJSON(saveAtt))
        end
    end
end)

net.Receive("mgbase_attsync_cl", function(len, ply)
    local weapon = net.ReadEntity()
    local data = net.ReadTable()

    data = util.JSONToTable(data)

    if (IsValid(weapon) && weapon.Customization != nil) then
        for name, att in pairs(weapon.Customization) do
            weapon.Customization[name].m_Index = data[name]
        end

        weapon:BuildCustomizedGun()
    end
end)