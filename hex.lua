local Hex = {}
Hex.__index = Hex
Hex.__tostring = function(h) return "Hex("..h.pos.x..", "..h.pos.y..") - "..h.rot end

local function new(pos, rot)
	local h = {}
	setmetatable(h, Hex)

	h.pos = pos
	h.rot = rot or 0

	h.paths = {}

	return h
end


setmetatable(Hex, {__call = function(_, ...) return new(...) end })
return Hex