local Hex = {}
Hex.__index = Hex
Hex.__tostring = function(h) return "Hex("..h.pos.x..", "..h.pos.y..") - "..h.rot end

local function new(pos, tipo)
	local h = {}
	setmetatable(h, Hex)

	h.pos = pos

	--[[ Tipo
		1 = Grama
		2 = Agua
		3 = Montanha
	]]
	h.tipo = tipo or 1

	--[[ Melhoria
		0 = vazio
		1 = Cidade
		2 = Floresta
	]]
	h.melhoria = melhorias.vazio

	--[[ Borda
		0 = Vazio
		1 = Rua
		2 = Rio
	]]
	h.borda = 0	
	h.bordaCont = 0
	--Para uso na renderização
	h.bordas = {0,0,0,0,0,0}


	h.pontos = 0

	h.rede = 0

	return h
end


setmetatable(Hex, {__call = function(_, ...) return new(...) end })
return Hex