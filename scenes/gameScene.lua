gameScene = Scene("gameScene")

--Componentes
GameHexMap = Component("hexmap", {
	map = HexMap(6,5)
	})

--Scripts
require("mapRenderer")



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
end

function gameScene:draw()

end

return gameScene
