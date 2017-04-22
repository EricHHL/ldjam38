HexMap = Component("hexmap",{

	})

Hex = {}

local newHex(tipo)
local h = {}
	setmetatable(h, Hex)

	h.tipo = tipo or 0


	return h
end

setmetatable(Hex, {__call = function(_, ...) return nexHex(...) end})