gameScene = Scene("gameScene")

require("dados")
--Componentes
GameHexMap = Component("hexmap", {
	map = HexMap(12,12)
	})
gui = require("/guis/gameSceneGui")


--Scripts
require("mapRenderer")
require("playerInput")

local q = 0
local r = 0

function gameScene:init()
	map = Coisa("map", {GameHexMap})

	map.hexmap.map.map[2][2].tipo = 2
	map.hexmap.map.map[3][2].tipo = 2
	map.hexmap.map.map[3][3].tipo = 2

	seletor = R.texture.seletor

    -- GUI
    gui.setup()
end

function gameScene:draw()
    -- Se não estiver dentro do painel de controles
    local mousey = love.mouse.getY()
    if mousey < controles.y then
    	local q,r = PlayerInput.getSelected()
    	local x = (q-1) * 120	--Multiplica pela largura
    	local y = math.ceil((r-1) * 138.5 * 0.75)	--Multiplica por 75% da altura, porque é hexagono

    	if r%2 == 0 then
    		x = x + 120/2	--Se por coluna par, tem que ter um offset de metade da largura
    	end

	    love.graphics.draw(seletor, x-4, y-4)
    end

    gui:draw()
end

function gameScene:update(dt)
    gui:update(dt)
end

function love.mousereleased(x, y, button, isTouch)
    gooi.released()
end

function love.mousepressed(x, y, button, istouch)
    gooi.pressed()
    if button == 3 then
      	mousePressX = x
      	mousePressY = y
      	flag = true
    end
    if button == 1 then
    	local q,r = PlayerInput.getSelected()
    	print(q, r)
    	local m = PlayerInput.getMelhoria()
		if m == 3 then
			map.hexmap.map:poeCaminho(q,r,1)
		else
			map.hexmap.map:poeMelhoria(q, r, PlayerInput.getMelhoria())
		end
    end
end

-- function love.keypressed(key, scancode, isrepeat)
--     gooi.keypressed()
-- end

function love.textinput(text)
    gooi.textinput(text)
end

return gameScene
