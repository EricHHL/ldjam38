local Hex = {}
Hex.__index = Hex
Hex.__tostring = function(h) return "Hex("..h.pos.x..", "..h.pos.y..") - "..h.rot end

local function new(pos, tipo)
	local h = {}
	setmetatable(h, Hex)

	h.pos = pos
	h.tipo = tipo or 1

	return h
end


setmetatable(Hex, {__call = function(_, ...) return new(...) end })
return Hex