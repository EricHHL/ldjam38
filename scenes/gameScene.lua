gameScene = Scene("gameScene")

--Componentes
GameHexMap = Component("hexmap", {
	map = HexMap(9,6)
	})

--Scripts
require("mapRenderer")

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
	local x = (q-1) * 120	--Multiplica pela largura
	local y = math.ceil((r-1) * 138.5 * 0.75)	--Multiplica por 75% da altura, porque é hexagono

	if r%2 == 0 then
		x = x + 120/2	--Se por coluna par, tem que ter um offset de metade da largura
	end
	love.graphics.draw(seletor, x-5, y-5)
end

function gameScene:update(dt)
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	
	y = y + 35

	x = x / (70 * math.sqrt(3))
	y = y / (70 * math.sqrt(3))

	temp = math.floor(x + math.sqrt(3) * y + 1)
	q = math.floor((math.floor(2*x+1) + temp) / 3);
	r = math.floor((temp + math.floor(-x + math.sqrt(3) * y + 1))/3);

	q = q - math.ceil((r-1)/2)

end

return gameScene
