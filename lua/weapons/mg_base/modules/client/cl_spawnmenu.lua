AddCSLuaFile()

hook.Add("AddToolMenuCategories", "Mw_CustomCategory", function()
	spawnmenu.AddToolCategory("Options", "mw_options", "MW Options")
end)

hook.Add("PopulateToolMenu", "CustomMenuSettings", function()
	spawnmenu.AddToolMenuOption("Options", "mw_options", "mw_vmodel", "View Model", "", "", function(panel)
                panel:ClearControls()

                panel:NumSlider("Sleeves", "mgbase_rig", 0, MGBASE_RIGS_COUNT, 0)
                panel:ControlHelp("Swap between Modern Warfare first person sleeves. A value of zero will enable CHands.")

                panel:NumSlider("Sleeves Skin", "mgbase_rig_skin", 0, MGBASE_RIGS_SKIN_COUNT, 0)
                panel:ControlHelp("Change appearance of sleeves.")

                panel:NumSlider("Gloves", "mgbase_gloves", 1, MGBASE_GLOVES_COUNT, 0)
                panel:ControlHelp("Change Modern Warfare first person gloves.")

                panel:NumSlider("Gloves Skin", "mgbase_gloves_skin", 0, MGBASE_GLOVES_SKIN_COUNT, 0)
                panel:ControlHelp("Change appearance of gloves.")

                panel:NumSlider("FOV", "mgbase_fx_vm_fov", 0.1, 2, 2)
                panel:ControlHelp("Change view model FOV.")

                panel:NumSlider("X Offset", "mgbase_fx_vm_pos_x", -8, 8)
                panel:ControlHelp("Change viewmodel X offset.")

                panel:NumSlider("Y Offset", "mgbase_fx_vm_pos_y", -8, 8)
                panel:ControlHelp("Change viewmodel Y offset.")

                panel:NumSlider("Z Offset", "mgbase_fx_vm_pos_z", -8, 8)
                panel:ControlHelp("Change viewmodel Z offset.")

                panel:CheckBox("Offset ADS", "mgbase_fx_vm_pos_ads_affected")
                panel:ControlHelp("Toggle viewmodel offset taking effect whilst aiming down sights.")
        end)
        
        spawnmenu.AddToolMenuOption("Options", "mw_options", "mw_performance", "Performance", "", "", function(panel)
                panel:ClearControls()

                panel:CheckBox("Cheap Particles", "mgbase_fx_cheap_particles")
                panel:ControlHelp("Stops all particles before emitting new ones.")

                panel:CheckBox("Barrel Smoke", "mgbase_fx_smoke")
                panel:ControlHelp("Toggle overheat smoke coming from the barrels.")

                panel:CheckBox("Cheap Reticles", "mgbase_fx_cheap_reticles")
                panel:ControlHelp("Reticles stop rendering when not aiming.")

                panel:CheckBox("View Blur FX", "mgbase_fx_blur")
                panel:ControlHelp("Toggle DOF blur when reloading/customizing.")

                panel:CheckBox("View Model Blur FX", "mgbase_fx_vmblur")
                panel:ControlHelp("Toggle DOF blur on the view model.")

                panel:CheckBox("View Model Blur FX (Hip)", "mgbase_fx_vmblur_hip")
                panel:ControlHelp("Toggle DOF blur on the view model when firing from the hip.")
        end)
        
        spawnmenu.AddToolMenuOption("Options", "mw_options", "mw_hud", "HUD", "", "", function(panel)
                panel:ClearControls()

                panel:Help("Crosshair Color")

                local DermaColorCombo = vgui.Create("DColorCombo", panel)
                DermaColorCombo:SetColor(string.ToColor(GetConVar("mgbase_hud_xhaircolor"):GetString()))
                function DermaColorCombo:OnValueChanged(col)
                        RunConsoleCommand("mgbase_hud_xhaircolor", string.FromColor(col))
                end

                panel:AddItem(DermaColorCombo)

                panel:CheckBox("Crosshair", "mgbase_hud_xhair")
                panel:ControlHelp("Toggle crosshair.")

                panel:CheckBox("Firemode Helper", "mgbase_hud_firemode")
                panel:ControlHelp("Toggle firemode HUD.")

                panel:CheckBox("Sights Helper", "mgbase_hud_sights")
                panel:ControlHelp("Toggle sights HUD.")

                panel:CheckBox("Custom Lasers", "mgbase_fx_laser_weaponcolor")
                panel:ControlHelp("Toggle sandbox weapon color for lasers.")

                panel:NumSlider("Reticle Brightness", "mgbase_fx_reticle_brightness", 1, 6, 0)
                panel:ControlHelp("Change reticle brightness for sights.")
                
                panel:Button("Customize Gun", "mgbase_customize")
        end)

        spawnmenu.AddToolMenuOption("Options", "mw_options", "mw_controls", "Controls", "", "", function(panel)
                panel:ClearControls()

                panel:CheckBox("Toggle ADS", "mgbase_toggleaim")
                panel:ControlHelp("Switch between hold and toggle to ADS.")

                panel:CheckBox("Auto Reload", "mgbase_autoreload")
                panel:ControlHelp("Toggle auto reload when magazine is empty.")

                --[[panel:Help("Customize Menu Bind")
                local binder = vgui.Create("DBinder", panel)
                binder:SetValue(input.GetKeyCode(input.LookupBinding("mgbase_customize")))

                function binder:OnChange(num)
                        RunConsoleCommand("bind mgbase_customize "..input.LookupKeyBinding(num))
                end
                panel:AddItem(binder)
                panel:ControlHelp("Once this is set, the menu won't show up when pressing the context menu key!")]] --doesn't work lol

                panel:CheckBox("Attachments Saving", "mgbase_saveatts")
                panel:ControlHelp("Toggle whether or not to keep attachments after death.")

                panel:NumSlider("Scope ADS Sensitivity", "mgbase_scopesens", 0.01, 10, 2)
                panel:ControlHelp("Set the aim sensitivity when using scopes.")
	end)
        
        spawnmenu.AddToolMenuOption("Options", "mw_options", "mw_debug", "Debug", "", "", function(panel)
                panel:ClearControls()

                panel:CheckBox("Free View Model", "mgbase_debug_freeview")
                panel:ControlHelp("Toggle free view model transform.")

                panel:CheckBox("Ironsights Crosshair", "mgbase_debug_crosshair")
                panel:ControlHelp("Toggle ironsights crosshair.")

                panel:CheckBox("Disable Breathing", "mgbase_debug_disablebreathing")
                panel:ControlHelp("Toggle breathing.")
	end)

        spawnmenu.AddToolMenuOption("Options", "mw_options", "mw_svcontrols", "Server Controls", "", "", function(panel)
                panel:ClearControls()

                if (!LocalPlayer():IsAdmin()) then
                        panel:ControlHelp("shoo")
                        return
                end

                panel:CheckBox("High Latency Hitreg Method", "mgbase_sv_hitreg")
                panel:ControlHelp("Do not turn this on for PvP-focused servers!")

                panel:NumSlider("PvP Damage Multiplier", "mgbase_sv_pvpdamage", 0, 5, 1)
                panel:ControlHelp("Change damage towards players.")

                panel:NumSlider("PvE Damage Multiplier", "mgbase_sv_pvedamage", 0, 5, 1)
                panel:ControlHelp("Change damage towards NPCs and Nextbots.")

                panel:NumSlider("Recoil Multiplier", "mgbase_sv_recoil", 0, 5, 1)
                panel:ControlHelp("Change recoil intensity.")

                panel:NumSlider("Bullet Spread Multiplier", "mgbase_sv_spread", 0, 10, 1)
                panel:ControlHelp("Change bullet spread intensity.")

                panel:CheckBox("Enable ADS Speed Penalty", "mgbase_sv_ads_penalty")
                panel:ControlHelp("Slows down players while aiming down sights. (buggy)")

                panel:CheckBox("Toggle Customization", "mgbase_sv_customization")
                panel:ControlHelp("Allow gun customization.")
	end)

        --[[
CreateConVar("mgbase_sv_hitreg", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Switch hitreg type.", 0, 1)
CreateConVar("mgbase_sv_pvpdamage", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "PvP damage multiplier", 0, 5)
CreateConVar("mgbase_sv_pvedamage", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "PvE damage multiplier", 0, 5)
CreateConVar("mgbase_sv_recoil", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Recoil multiplier", 0, 5)
CreateConVar("mgbase_sv_accuracy", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Accuracy multiplier", 0, 5)
CreateConVar("mgbase_sv_customization", "1", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Allow gun customization.", 0, 1)]]
end)