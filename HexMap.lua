Hex = require("hex")

local HexMap = {}
HexMap.__index = HexMap

local vizinhosI = {
	vector(1,0),
	vector(0,-1),
	vector(-1,-1),
	vector(-1,0),
	vector(-1,1),
	vector(0,1)
}
local vizinhosP = {
	vector(1,0),
	vector(1,-1),
	vector(0,-1),
	vector(-1,0),
	vector(0,1),
	vector(1,1)
}

local proxRede = 1
redes = {}
pontosRedes = {}

local function new(w,h)
	local hm = {}
	setmetatable(hm, HexMap)

	hm.w = w
	hm.h = h

	hm.map = {}
	for i=1,w do
		hm.map[i] = {}
		hm.map[i].start = math.floor((h-i)/2)
		for j=1,h do
			hm.map[i][j] = Hex(vector(i,j))
		end
	end


	return hm
end

function HexMap:getHex(q,r)
	if type(q) == "table" then
		r = q.y
		q = q.x
	end
	if q==0 then
		q = self.w
	end
	if r==0 then
		r = self.h
	end
	if q>self.w then
		q = 1
	end
	if r>self.h then
		r = 1
	end
	if self.map[q] then
		return self.map[q][r]
	end
end

function HexMap:getVizinho(hex, v)
	v2 = ((v+2) % 6)+1
	local a
	if hex.pos.y%2==0 then
		a = hex.pos+vizinhosP[v2]
	else
		a = hex.pos+vizinhosI[v2]
	end
	return self:getHex(a)
end

function HexMap:poeCaminho(q,r,c)
	local hex = self:getHex(q,r)
	if not hex then return end
	for i=1,6 do
		local vizinho = self:getVizinho(hex,i)
		if vizinho and vizinho.borda == c then
			hex.bordas[i] = c
			vizinho.bordas[i+3%6] = c
		end
	end
	hex.borda = c
	if c ~= 0 then
		self:atualizaCaminho(q,r,c)
	end
end

function HexMap:poeMelhoria(q,r,m)
	local hex = self:getHex(q,r)
	if not hex then return end

	hex.melhoria = m
	hex.pontos = m.pontos
	self:poeCaminho(q,r,m.borda)
	for i=1,6 do
		local vizinho = self:getVizinho(hex,i)
		if vizinho.rede ~= 0 then
			self:atualizaCaminho(vizinho.pos.x,vizinho.pos.y,vizinho.borda)
		end
	end
end

function HexMap:getPontos(hex, excRede)
	
	local base = hex.melhoria.pontos
	local total = base

	for i=1,6 do
		local vizinho = self:getVizinho(hex,i)
		for k,v in pairs(hex.melhoria.combos) do
			if v.m == vizinho.melhoria then
				total = total + (base * v.p)
			end
		end
	end

	if not excRede  and hex.rede~=0 then
		total = total + pontosRedes[hex.rede]
	end

	return total
end

function HexMap:atualizaCaminho(q, r, c)
	local hex = self:getHex(q,r)
	if not hex then return end

	--Atualiza rede
	if (hex.rede == 0) then
		for i=1,6 do
			local vizinho = self:getVizinho(hex,i)
			if vizinho.bordas[i+3%6] == c then
				if hex.rede == 0 then
					hex.rede = vizinho.rede
					table.insert(redes[hex.rede], hex)
				else
					if hex.rede ~= vizinho.rede then
						local antRede = vizinho.rede
						for k,v in pairs(redes[vizinho.rede]) do
							v.rede = hex.rede
							table.insert(redes[hex.rede], v)
						end
						redes[antRede] = nil
					end
				end				
			end
		end
	end
	if hex.rede == 0 then
		hex.rede = proxRede
		redes[hex.rede] = {hex}
		pontosRedes[hex.rede] = 0
		proxRede = proxRede + 1
	end

	--Atualiza pontos da rede
	local pontos = 0
	for k,v in pairs(redes[hex.rede]) do
		if v.melhoria == melhorias.cidade then
			pontos = pontos + self:getPontos(v, true)*0.20	--A cidade contribui com 20% dos pontos para a rede de ruas
		end		
	end

	pontosRedes[hex.rede] = math.floor(pontos)

end

setmetatable(HexMap, {__call = function(_, ...) return new(...) end})

return HexMap
