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

	return self.map[q][r]
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

end

setmetatable(HexMap, {__call = function(_, ...) return new(...) end})

return HexMap