AddCSLuaFile()

if SERVER then return end

matproxy.Add( {
	name = "MwEnvMapTint",
	
	init = function(self, mat, values)
		self.min = values.min
		self.max = values.max
		--self.colorBoost = values.colorBoost || 1
	end,

	bind = function(self, mat, ent)
		if (!IsValid(ent)) then return end

		if (ent.m_MwEnvMapTint == nil) then
			ent.m_MwEnvMapTint = 0 --leeching off of ents as 'self' in bind seems to be the same reference across all ents
		end
		
		local c = render.GetLightColor(ent:GetPos())
		--local a = render.GetAmbientLightColor()

		--luminance (0.2126*R + 0.7152*G + 0.0722*B)
		--luminance heavy sqrt( 0.299*R^2 + 0.587*G^2 + 0.114*B^2 )
		local luminance = (c.x * 0.2126) + (c.y * 0.7152) + (c.z * 0.0722)
		--local ambientLuminance = (a.x * 0.2126) + (a.y * 0.7152) + (a.z * 0.0722)
		local targetLuminance = luminance - 0.06--(luminance / ambientLuminance) - 0.06
		
		ent.m_MwEnvMapTint = Lerp(10 * FrameTime(), ent.m_MwEnvMapTint, targetLuminance)

		local tint = c * Lerp(ent.m_MwEnvMapTint, self.min, self.max)
		--local colorTint = Vector(1.5, 1.5, 1.5) * Lerp(ent.m_MwEnvMapTint * 2.5, 0.05, 0.2)

		mat:SetVector("$envmaptint", tint)
		--mat:SetVector("$color2", colorTint)
		--mat:SetVector("$phongtint", c * 1)
	end
})

matproxy.Add( {
	name = "MwCamo",
	
	init = function(self, mat, values)
	end,

	bind = function(self, mat, ent)
		if (!IsValid(ent)) then return end

		mat:SetInt("$detailblendmode", 0)
		mat:SetFloat("$detailblendfactor", 0)

		if (ent.mw_Camo == nil || ent.mw_Camo == "") then return end

		mat:SetInt("$detailblendmode", 4)
		mat:SetFloat("$detailblendfactor", 1)
		mat:SetTexture("$detail",  ent.mw_Camo)
	end
})

matproxy.Add( {
	name = "MwSight",
	
	init = function(self, mat, values)
	end,

	bind = function(self, mat, ent)
		if (!IsValid(ent)) then return end

		if (ent.mw_Aim == nil) then
			mat:SetInt("$cloakpassenabled", 0)
			mat:SetFloat("$cloakfactor", 0)
		else
			mat:SetInt("$cloakpassenabled", 1)
			mat:SetFloat("$cloakfactor", math.Round(ent.mw_Aim))
		end
	end
})

