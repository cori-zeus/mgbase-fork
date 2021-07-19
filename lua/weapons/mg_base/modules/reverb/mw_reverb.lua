AddCSLuaFile()

--[[local MW_REVERB_SOUNDS = {
	["default"] = {
		Outside = {
			Layer = "Atmo_AR.Outside",
			Reflection = "Reflection_AR.Outside",
		},
		Inside = "Atmo_AR.Inside",
	},

	["assault_rifle_1"] = {
		Outside = {
			Layer = "Atmo_AR.Outside",
			Reflection = "Reflection_AR.Outside",
		},
		Inside = "Atmo_AR.Inside",
	},

	["assault_rifle_2"] = {
		Outside = {
			Layer = "Atmo_AR2.Outside",
			Reflection = "Reflection_AR.Outside",
		},
		Inside = "Atmo_AR.Inside",
	},

	["assault_rifle_3"] = {
		Outside = {
			Layer = "Atmo_AR3.Outside",
			Reflection = "Reflection_AR.Outside",
		},
		Inside = "Atmo_AR.Inside",
	},

	["assault_rifle_4"] = {
		Outside = {
			Layer = "Atmo_AR4.Outside",
			Reflection = "Reflection_AR.Outside",
		},
		Inside = "Atmo_AR.Inside",
	},

	["assault_rifle_5"] = {
		Outside = {
			Layer = "Atmo_AR6.Outside",
			Reflection = "Reflection_AR.Outside",
		},
		Inside = "Atmo_AR.Inside",
	},

	["pistol"] = {
		Outside = {
			Layer = "Atmo_Pistol.Outside",
			Reflection = "Reflection_Pistol.Outside",
		},
		Inside = "Atmo_Pistol.Inside",
	},

	["suppressed_pistol"] = {
		Outside = {
			Layer = "Atmo_Pistol_Sup.Outside",
			Reflection = "Reflection_Pistol.Outside",
		},
		Inside = "Atmo_Pistol_Sup.Inside",
	},

	["suppressed_assault_rifle"] = {
		Outside = {
			Layer = "Atmo_AR2_Sup.Outside",
			Reflection = "Reflection_Rifle.Outside",
		},
		Inside = "Atmo_AR_Sup.Inside",
	},

	["pistol_heavy"] = {
		Outside = {
			Layer = "Atmo_Pistol_Mag2.Outside",
			Reflection = "Reflection_Pistol.Outside",
		},
		Inside = "Atmo_Shotgun.Inside",
	},

	["smg"] = {
		Outside = {
			Layer = "Atmo_SMG.Outside",
			Reflection = "Reflection_Pistol.Outside",
		},
		Inside = "Atmo_SMG.Inside",
	},

	["shotgun"] = {
		Outside = {
			Layer = "Atmo_Shotgun.Outside",
			Reflection = "Reflection_Shotgun.Outside",
		},
		Inside = "Atmo_Shotgun.Inside",
	},

	["sniper"] = {
		Outside = {
			Layer = "Atmo_Sniper.Outside",
			Reflection = "Reflection_Sniper.Outside",
		},
		Inside = "Atmo_Sniper.Inside",
	},

	["LMG"] = {
		Outside = {
			Layer = "Atmo_LMG.Outside",
			Reflection = "Reflection_AR.Outside",
		},
		Inside = "Atmo_LMG.Inside",
	},

	["DMR"] = {
		Outside = {
			Layer = "Atmo_DMR.Outside",
			Reflection = "Reflection_Sniper.Outside",
		},
		Inside = "Atmo_Sniper.Inside",
	},

	["RPG"] = {
		Outside = {
			Layer = "Atmo_RPG.Outside",
			Reflection = "Atmo_RPG.Outside",
		},
		Inside = "Atmo_RPG.Outside",
	},
}]] --IM LEAVING THESE HERE FOR REFERENCE

function SWEP:HandleReverb()
	if (!IsValid(self:GetOwner())) then
		return
	end

	if (self.Reverb == nil) then
		return
	end

	if SERVER then
		net.Start("mgbase_reverb", true)
		net.WriteEntity(self)

		if (game.SinglePlayer()) then
			net.Send(self:GetOwner())
		else
			net.SendOmit(self:GetOwner())
		end

		return
	end

	local layer = ""
	local reflection = ""

	if self.Reverb.Sounds then
		local outside = self.LastReverbState

		if (CurTime() > self.NextReverbTime) then
			outside = self:mg_IsPlayerReverbOutside()
		end

		self.LastReverbState = outside

		if (outside) then
			layer = self.Reverb.Sounds.Outside.Layer
			reflection = self.Reverb.Sounds.Outside.Reflection
		else
			layer = self.Reverb.Sounds.Inside.Layer != nil && self.Reverb.Sounds.Inside.Layer || self.Reverb.Sounds.Inside
			reflection = self.Reverb.Sounds.Inside.Reflection != nil && self.Reverb.Sounds.Inside.Reflection || ""
		end

		if layer != "" then
			self:GetOwner():EmitSound(layer)
		end

		if reflection != "" then
			self:GetOwner():EmitSound(reflection)
		end
	end
end