gameScene = Scene("gameScene")

--Componentes
GameHexMap = Component("hexmap", {
	map = HexMap(9,6)
	})

--Scripts
require("mapRenderer")
require("playerInput")

q = 0
r = 0

function gameScene:init()
	map = Coisa("map", {GameHexMap})

	map.hexmap.map.map[2][2].tipo = 2
	map.hexmap.map.map[3][2].tipo = 2
	map.hexmap.map.map[3][3].tipo = 2
	map.hexmap.map.map[4][2].melhoria = 1
	map.hexmap.map.map[4][3].melhoria = 2
	map.hexmap.map.map[4][1].melhoria = 2
	map.hexmap.map.map[5][3].bordas[2] = 1
	map.hexmap.map.map[5][3].bordas[5] = 1
	map.hexmap.map.map[5][4].bordas[2] = 1
	map.hexmap.map.map[5][4].bordas[4] = 1
	map.hexmap.map.map[5][3].bordas[4] = 1
	map.hexmap.map.map[6][4].bordas[1] = 1
	map.hexmap.map.map[6][4].bordas[2] = 1
	map.hexmap.map.map[6][3].bordas[1] = 1
	map.hexmap.map.map[6][3].bordas[5] = 1

	seletor = R.texture.seletor
end

function gameScene:draw()
	local q,r = PlayerInput.getSelected()
	local x = (q-1) * 120	--Multiplica pela largura
	local y = math.ceil((r-1) * 138.5 * 0.75)	--Multiplica por 75% da altura, porque é hexagono

	if r%2 == 0 then
		x = x + 120/2	--Se por coluna par, tem que ter um offset de metade da largura
	end
	
	love.graphics.draw(seletor, x-4, y-4)
end

function gameScene:update(dt)
	

end

return gameScene
