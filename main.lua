require("lib.coisa.coisaCore")
require("HexMap")


function love.load()
	cCore.loadScene(R.scene.gameScene)
end

function love.update(dt)
	cCore.update(dt)
end

function love.draw()
	cCore.draw()
end
