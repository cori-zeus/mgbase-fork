AddCSLuaFile()

local REVERB_RESOLUTION = 0.1 --Default: 0.1. Less means more raycasts.

local REVERB_MEMORY_LIFE = 0.5 --seconds, time before reverb is checked again
local REVERB_MEMORY_RESULT_NONE = 0
local REVERB_MEMORY_RESULT_INSIDE = 1
local REVERB_MEMORY_RESULT_OUTSIDE = 2

function SWEP:CheckRoomScale(dist)
	local resolution = 1

	if (!self:IsCarriedByLocalPlayer()) then
		resolution = 0.25
	end

	return dist > (self.Reverb.RoomScale * self.Reverb.RoomScale) * resolution;
end

function SWEP:mg_IsPlayerReverbOutside()
	if (!IsValid(self:GetOwner())) then
		return
	end

	self.NextReverbTime = CurTime() + REVERB_MEMORY_LIFE
	
	local dist = 0
	local start = self:GetOwner():EyePos() 
	local len = math.pow(self.Reverb.RoomScale, 1/3) * 100
	local resolution = 1

	if (!self:IsCarriedByLocalPlayer()) then
		resolution = 0.25
	end

	for r = 0.1, 1, (REVERB_RESOLUTION / resolution) do
		local hCos = math.sin(r * math.pi)

		for i = -1, 1, (REVERB_RESOLUTION / resolution) do 
			local sin = math.sin(i * math.pi) * hCos
			local cos = math.cos(i * math.pi) * hCos

			local dir = Vector(sin, cos, math.cos(r * math.pi))
			local tr = util.TraceLine({
				start = start,
				endpos = start + (dir * len),
				mask = MASK_SHOT,
				filter = self:GetOwner()
			})

			if (tr.Hit && !tr.HitSky) then
				dist = dist + start:DistToSqr(tr.HitPos)
				--debugoverlay.Line(start, tr.HitPos, 4, Color(0, 255, 0, 255))
			else
				--hit sky or nothing
				--dist = dist + (self.Reverb.RoomScale * self.Reverb.RoomScale) * 0.15
				local outsideDist = (self.Reverb.RoomScale * self.Reverb.RoomScale) * 0.1
				dist = dist + outsideDist

				--debugoverlay.Line(start, tr.HitPos, 4, Color(255, 0, 0, 255))
			end

			--If room scale is already big enough, no need to cast any more rays.
			if self:CheckRoomScale(dist) then
				return true
			end

			--If we are at half rays casted and we are less than half room scale, assume we are inside.
			if r > 0.5 and dist < (self.Reverb.RoomScale * self.Reverb.RoomScale) * 0.5 then
				return false
			end
		end
	end

	return self:CheckRoomScale(dist)
end 