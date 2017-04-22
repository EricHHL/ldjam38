
MapRenderer = Script({GameHexMap})
local map

--id dos tiles
local idTile = {
	14, --grama
	27	--agua
}
local idMelhoria = {
	15,	--cidade
	13	--floresta
}
local idBordas = {
	9
}


local function loadTileset(name, spacing, margin)
    if not spacing then
        spacing = 0
    end
    if not margin then
        margin = 0
    end

	map = require("textures."..name)
	map.tiles = {}

	local ts = map.tilesets[1]
	map.texture = R.get("tileset", ts.image)
	local curID = ts.firstgid
	ts.lastid = curID + ts.tilecount
	for j=0, (ts.imageheight/ts.tileheight)-1 do
		for i=0, (ts.imagewidth/ts.tilewidth)-1 do
			map.tiles[curID] = love.graphics.newQuad(margin + i*ts.tilewidth + spacing * i, margin + j*ts.tileheight + spacing * j, ts.tilewidth, ts.tileheight, ts.imagewidth, ts.imageheight)
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
	loadTileset("tileset", 2, 0)
end


function MapRenderer:draw(m)
 
	local wrapX = m.hexmap.map.w * 121
	local wrapY = m.hexmap.map.h * 140 * 0.75

	local mmap = m.hexmap.map

	desenhaMapa(mmap, 0, 0) -- Centro
	desenhaMapa(mmap, wrapX, 0) -- Direita
	desenhaMapa(mmap, -wrapX, 0) -- Esquerda
	desenhaMapa(mmap, 0, wrapY) -- Baixo
	desenhaMapa(mmap, 0, -wrapY) -- Cima
	desenhaMapa(mmap, wrapX, wrapY) -- Direita e Baixo
	desenhaMapa(mmap, wrapX, -wrapY) -- Direita e Cima
	desenhaMapa(mmap, -wrapX, wrapY) -- Esquerda e baixo
	desenhaMapa(mmap, -wrapX, -wrapY) -- Esquerda e cima
 
end

function desenhaMapa( mmap, wrapX, wrapY)
	for i=1, mmap.w do
		for j=1, mmap.h do
			local x = (i-1) * 120 + wrapX	--Multiplica pela largura
			local y = math.ceil((j-1) * 138.5 * 0.75) + wrapY	--Multiplica por 75% da altura, porque é hexagono

			if j%2 == 0 then
				x = x + 120/2	--Se por coluna par, tem que ter um offset de metade da largura
			end

			local hex = mmap.map[i][j]

			love.graphics.draw(map.texture, map.tiles[idTile[hex.tipo]], x, y)


			for i,v in pairs(hex.bordas) do
				if (v~=0) then
					love.graphics.draw(map.texture, map.tiles[idBordas[v]], x+60, y+70, ((i-1)/6) * math.pi*2, 1.05, 1.05, 60, 70)
				end
			end
				
			if hex.melhoria ~= 0 then
				love.graphics.draw(map.texture, map.tiles[idMelhoria[hex.melhoria]], x, y)
			end

		end
	end
end