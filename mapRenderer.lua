
MapRenderer = Script({GameHexMap})
local map

--id dos tiles
idTile = {
	14 --grama

}

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
	
	local mmap = m.hexmap.map
	for i=1, mmap.w do
		for j=1, mmap.h do
			local x = (i-1) * 120	--Multiplica pela largura
			local y = (j-1) * 136 * 0.75	--Multiplica por 75% da altura, porque é hexagono
			
			if j%2 == 0 then
				x = x + 120/2	--Se por coluna par, tem que ter um offset de metade da largura
			end
			love.graphics.draw(map.texture, map.tiles[idTile[mmap.map[i][j].tipo]], x, y)
		end
	end

end


