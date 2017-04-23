
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
    MapRenderer.quads = map.tiles
    MapRenderer.texture = map.texture
end
local font
function MapRenderer:init(m)
	loadTileset("tileset", 2, 0)
	font = love.graphics.newFont("/fonts/Life is goofy.ttf", 32)
	love.graphics.setFont(font)
end


function MapRenderer:draw(m)

	local wrapX = m.hexmap.map.w * 120
	local wrapY = m.hexmap.map.h * 138 * 0.75

	local cameraX, cameraY = camera:position()


	if cameraX > wrapX then
		camera:move(-wrapX, 0)
	elseif cameraX < 0 then
		camera:move(wrapX, 0)
	end
	if cameraY > wrapY then
		camera:move(0, -wrapY)
	elseif cameraY < 0 then
		camera:move(0, wrapY)
	end

	local mmap = m.hexmap.map

	mmap:atualizaPontos()

	drawMap(mmap, -wrapX, -wrapY) -- Esquerda e cima
	drawMap(mmap, 0, -wrapY) -- Cima
	drawMap(mmap, wrapX, -wrapY) -- Direita e Cima

	drawMap(mmap, -wrapX, 0) -- Esquerda
	drawMap(mmap, 0, 0) -- Centro
	drawMap(mmap, wrapX, 0) -- Direita
	
	drawMap(mmap, -wrapX, wrapY) -- Esquerda e baixo
	drawMap(mmap, 0, wrapY) -- Baixo
	drawMap(mmap, wrapX, wrapY) -- Direita e Baixo


end

function drawMap( mmap, wrapX, wrapY)
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
					love.graphics.draw(map.texture, map.tiles[idBordas[v]], x+60, y+70, -((i-1)/6) * math.pi*2, 1.05, 1.05, 60, 70)
				end
			end

			if hex.melhoria ~= melhorias.vazio then
				love.graphics.draw(map.texture, map.tiles[hex.melhoria.tile], x, y)
			end


			local pontos = hex.pontos--mmap:getPontos(hex, false)
			if pontos ~= 0 then
				if pontos>0 then
					love.graphics.setColor(Color.blue:value())
					love.graphics.print(pontos, x+50, y+100)
				else
					love.graphics.setColor(Color.red:value())
					love.graphics.print(-pontos, x+50, y+100)
				end
			end
			love.graphics.setColor(Color.white:value())
			--love.graphics.print(hex.rede, x+50, y+115)
			--[[love.graphics.print(hex.pos.x..","..hex.pos.y, x+50, y+60)
			if hex.sel then
				love.graphics.print(hex.sel, x+50, y+75)
			end]]
		end
	end
end
