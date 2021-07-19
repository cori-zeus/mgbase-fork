AddCSLuaFile()

if (SERVER) then
    return
end

hook.Add("OnContextMenuOpen", "MW_ContextMenu", function()
    if (input.LookupBinding("mgbase_customize", false) == nil) then
        RunConsoleCommand("mgbase_customize")
    end
end)

local entireMenu = nil

function SWEP:CustomizationMenu()
    if (self:IsCustomizing()) then
        gui.EnableScreenClicker(true)
        self:OpenCustomizationMenu()
    else
        gui.EnableScreenClicker(false)
        self:CloseCustomizationMenu()
    end
end

function SWEP:DrawProsAndCons(slide)
	local x,y = ScrW() * 0.95, ScrH() * 0.5
	local scale = ScrH() / 1080
	local c = 0
	for i, v in pairs(self.StatBreadcrumbs) do
        local info = self.StatInfo[self.StatDefinitions[i]]

		if (info == nil) then
			continue
		end

		c = c + 1
	end

	local spacing = 25 * scale
	y = y - ((c * spacing) * 0.5)
	c = 0
	for i, v in SortedPairs(self.StatBreadcrumbs) do
		local info = self.StatInfo[self.StatDefinitions[i]]

		if (info == nil) then
			continue
		end

		c = c + 1

		local isPro = v.Current >= v.Source

        if (!info.ProIfMore) then
            isPro = v.Current <= v.Source
        end

		local percentage = math.abs((math.Round(v.Source / v.Current * 100) - 100)).."%"

		if (!info.ShowPercentage) then
			percentage = math.abs(v.Source - v.Current)
		end

		percentage = (v.Current > v.Source && "+" || "-")..percentage

        local textSlide = math.max(slide --[[* c]], 1)
		draw.SimpleTextOutlined(info.Name, "mgbase_firemode", x - 20 * scale + textSlide, y + c * spacing, Color(255, 255, 255, 200), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 2, Color(0, 0, 0, 20))
		draw.SimpleTextOutlined(percentage, "mgbase_firemode", x + textSlide, y + c * spacing, isPro && Color(0, 200, 0, 255) || Color(200, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 2, Color(0, 0, 0, 20))
	end
end

local alphaDelta = 0
local buttons = {}

function SWEP:OpenCustomizationMenu()
	local scale = ScrH() / 1080
	local boffset = 20 * scale

    alphaDelta = 0

    --main panel
    entireMenu = vgui.Create("DPanel")
    entireMenu:SetPos(0, 0)
    entireMenu:SetSize(ScrW(), ScrH())
    entireMenu.UsePressed = false
    entireMenu.Paint = function(b)
        if (!b.UsePressed) then
            alphaDelta = Lerp(math.min(10 * FrameTime(), 1), alphaDelta, 1)
        end
        
        draw.SimpleTextOutlined("CUSTOMIZE", "mgbase_attTitle", ScrW() * 0.5, ScrH() * 0.1 + (1 - alphaDelta) * boffset, Color(255, 255, 255, alphaDelta * 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 2, Color(0, 0, 0, alphaDelta * 20))
        
        surface.SetDrawColor(255, 255, 255, alphaDelta * 255)
        surface.DrawLine(ScrW() * 0.5 - alphaDelta * 200 * scale, ScrH() * 0.1 + boffset, ScrW() * 0.5 + alphaDelta * 200 * scale, ScrH() * 0.1 + boffset)

        draw.SimpleTextOutlined(self.PrintName, "mgbase_attWeaponName", ScrW() * 0.5, ScrH() * 0.1 + boffset * 2 - (1 - alphaDelta) * boffset, Color(255, 255, 255, alphaDelta * 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 2, Color(0, 0, 0, alphaDelta * 20))
        
        surface.SetAlphaMultiplier(alphaDelta)
        self:DrawProsAndCons((1 - alphaDelta) * 200)
        surface.SetAlphaMultiplier(1)   

        draw.SimpleTextOutlined("HOLD "..string.upper(input.LookupBinding("+use") || "USE KEY (NOT BOUND)").." TO INSPECT WEAPON", "mgbase_attName", ScrW() * 0.5, ScrH() * 0.9 - 60 * scale, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 2, Color(0, 0, 0, 20))
    end

    entireMenu.Think = function(b)
        if (!IsValid(self) || !self:IsCustomizing()) then
            gui.EnableScreenClicker(false)
            b:Remove()
        end

        local useKey = input.GetKeyCode(input.LookupBinding("+use") or "")

        if (useKey > 0 && input.IsKeyDown(useKey)) then
            if (!b.UsePressed) then
                for i, button in pairs(buttons) do
                    button:Remove()
                end
            end

            b.UsePressed = true

            self.MouseX = self:SafeLerp(20 * FrameTime(), self.MouseX, gui.MouseX())
            self.MouseY = self:SafeLerp(20 * FrameTime(), self.MouseY, gui.MouseY())

            alphaDelta = 0
        else
            if (b.UsePressed) then
                self:CreateAttButtons(b)
            end

            b.UsePressed = false

            self.MouseX = self:SafeLerp(20 * FrameTime(), self.MouseX, ScrW() * 0.5)
            self.MouseY = self:SafeLerp(20 * FrameTime(), self.MouseY, ScrH() * 0.5)
        end
    end
    -- end main panel

    -- exit button
    local exitButton = vgui.Create("DButton", entireMenu)
    exitButton:SetSize(150 * scale, 66 * scale)
    exitButton:SetText("")
    exitButton.HoverDelta = 0
    exitButton:SetPos(ScrW() * 0.5 - 75 * scale, ScrH() * 0.9 - 33 * scale)

    exitButton.Paint = function(b)
        b.HoverDelta = b:IsHovered() && math.min(b.HoverDelta + 10 * FrameTime(), 1) || math.max(b.HoverDelta - 10 * FrameTime(), 0)

        surface.SetDrawColor(255, 255, 255, b.HoverDelta * 50)
        surface.DrawRect(0, 0, b:GetWide(), b:GetTall())

        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawOutlinedRect(0, 0, b:GetWide(), b:GetTall())

        draw.SimpleTextOutlined("EXIT", "mgbase_attTitle", 75 * scale, 28 * scale, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, Color(0, 0, 0, alphaDelta * 20))
    end

    exitButton.DoClick = function(b)
        RunConsoleCommand("mgbase_customize")
    end
    -- end exit button

    self:CreateAttButtons(entireMenu)
end

function SWEP:CreateAttButtons(panel)
    local index = 0

	local scale = ScrH() / 1080
    local spacing = 65 * scale
    local btnsize = 55 * scale
    local labelspacing = 25 * scale
    local animspacing = 28 * scale

    local height = ScrH() * 0.5 - (self:GetCustomizationCount() * 0.5 * spacing) - spacing
    for i, slot in pairs(self.Customization) do
        index = index + 1

        local xChildren = 0

        for ind, att in pairs(slot) do

            if (!istable(att) || ind == "Offset") then
                continue
            end

            if (ind == 1) then
                continue
            end

            local attButton = vgui.Create("DButton", panel)
            attButton:SetSize(btnsize, btnsize)
            attButton:SetText("")
            attButton.HoverDelta = 0
            attButton.XChildren = xChildren
            attButton.SlotIndex = slot.Slot
            attButton.HoverAnim = 0
            attButton:SetPos((ind - 1) * spacing, height + slot.Slot * spacing)
            buttons[#buttons + 1] = attButton

            attButton.Paint = function(b)
                if (!IsValid(self)) then
                    return
                end
                
                if (att.Cope == true) then
                    return -- literally dont care
                end
                
                b.HoverAnim = b.HoverAnim + FrameTime()

                if (b.HoverAnim >= 1) then
                    b.HoverAnim = 0
                end

                if (slot.m_Index != nil && slot.m_Index == ind) then
                    b.HoverDelta = math.min(b.HoverDelta + 10 * FrameTime(), 1.5)
                    
                    cam.Start2D()
                        draw.SimpleTextOutlined(MW_ATT_KEYS[att.Key].Name, "mgbase_attName", (#slot) * spacing, b:GetY() + labelspacing, Color(255, 255, 255, alphaDelta * 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 2, Color(0, 0, 0, alphaDelta * 20))
                    cam.End2D()

                    local delta = b.HoverDelta - 1
                    surface.SetDrawColor(255, 255, 255, (delta / 0.5) * 255)
                    surface.DrawOutlinedRect(0, 0, btnsize, btnsize)

                    local sin = b.HoverAnim
                    local x,y = (1 - sin) * animspacing, (1 - sin) * animspacing

                    surface.SetDrawColor(255, 255, 255, (1 - sin) * 255)
                    surface.DrawOutlinedRect(x, y, sin * btnsize, sin * btnsize)
                else
                    b.HoverDelta = b:IsHovered() && math.min(b.HoverDelta + 10 * FrameTime(), 1) || math.max(b.HoverDelta - 10 * FrameTime(), 0)
                end

                local bAllowed = self:IsAttachmentAllowed(att)

                if (!bAllowed) then
                    b.HoverDelta = 1
                end

                if (!bAllowed) then
                    local col = b.HoverDelta * 100
                    surface.SetDrawColor(col, 0, 0, alphaDelta * 150)
                else
                    local col = b.HoverDelta * 100
                    surface.SetDrawColor(col, col, col, alphaDelta * 150)
                end

                surface.DrawRect(0, 0, b:GetWide(), b:GetTall())
                
                local data = MW_ATT_KEYS[att.Key]

                if (data == nil) then
                    return
                end

                if (data.Icon != nil) then
                    surface.SetMaterial(MW_ATT_KEYS[att.Key].Icon)
                    surface.SetDrawColor(255, 255, 255, alphaDelta * 255)
                    surface.DrawTexturedRect(b:GetWide() * 0.05, b:GetTall() * 0.05, b:GetWide() * 0.9, b:GetTall() * 0.9)
                end
            end

            attButton.DoClick = function(b)
                net.Start("mgbase_customize_att")
                net.WriteInt(b.SlotIndex, 8)
                net.WriteInt(ind, 8)
                net.WriteEntity(self)
                net.SendToServer()
            end

            xChildren = xChildren + 1
        end
    end 
end

function SWEP:CloseCustomizationMenu()
    if (entireMenu != nil) then
        entireMenu:Remove()
    end
end
