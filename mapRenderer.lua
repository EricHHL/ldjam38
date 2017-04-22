
MapRenderer = Script({GameHexMap})
local map

local function loadTileset(name)
	map = require("textures."..name)
	map.tiles = {}

	local ts = map.tilesets[1]
	map.texture = R.get("tileset", ts.image)
	local curID = ts.firstgid
	ts.lastid = curID + ts.tilecount
	for j=0, (ts.imageheight/ts.tileheight)-1 do
		for i=0, (ts.imagewidth/ts.tilewidth)-1 do
			map.tiles[curID] = love.graphics.newQuad(i*ts.tilewidth, j*ts.tileheight, ts.tilewidth, ts.tileheight, ts.imagewidth, ts.imageheight)
			curID = curID + 1
		end
	end

	for k,t in pairs(ts.tiles) do
		for k,p in pairs(t.properties) do
			map.tiles[t.id+1][k] = p
		end
	end

end

function MapRenderer:init(m)
	print("criou MapRenderer")
	loadTileset("tileset")
end

function MapRenderer:draw(m)
	
	love.graphics.draw(map.texture, map.tiles[2], 100, 100)
end


