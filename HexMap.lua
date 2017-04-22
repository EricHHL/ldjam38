Hex = require("hex")

local HexMap = {}
HexMap.__index = HexMap

local vizinhos = {
	vector(1,-1),
	vector(1,0),
	vector(0,1),
	vector(-1,1),
	vector(-1,0),
	vector(0,-1)
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

	if (q>0 and q<=self.w and r>0 and r<=self.h+1) then
		return self.map[q][r-self.map[q]["start"]]
	end
	return nil
end

function HexMap:getVizinho(hex, v)
	v2 = ((v+2) % 6)+1
	return self:getHex(hex.pos+vizinhos[v2])

end

setmetatable(HexMap, {__call = function(_, ...) return new(...) end})

return HexMap