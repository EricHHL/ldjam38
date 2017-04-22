gameScene = Scene("gameScene")

--Componentes
GameHexMap = Component("hexmap", {
	map = HexMap(8,5)
	})

--Scripts
require("mapRenderer")



function gameScene:init()
	map = Coisa("map", {GameHexMap})
end

function gameScene:draw()

end

return gameScene
