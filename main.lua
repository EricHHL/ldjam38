require("lib.coisa.coisaCore")

Camera = require("hump-master/camera")
HexMap = require("HexMap")

height = love.graphics.getHeight()
width = love.graphics.getWidth()

local cameraX, cameraY = width/2, height/2
local dx, dy = 0, 0
local mousePressX, mousePressY = 0, 0
local flag = false

function love.load()
	cCore.loadScene(R.scene.gameScene)
	camera = Camera(cameraX, cameraY)
end

function love.update(dt)
	cCore.update(dt)

	if flag then
		dx = (mousePressX - love.mouse.getX()) / 75
		dy = (mousePressY - love.mouse.getY()) / 75
	end

	camera:move(dx,dy)
end

function love.draw()
	camera:attach()
	cCore.draw()
    camera:detach()
end


function love.mousepressed(x, y, button, istouch)
   if button == 3 then -- Versions prior to 0.10.0 use the MouseConstant 'l'
      	mousePressX = x
      	mousePressY = y
      	flag = true
   end
end

function love.mousereleased(x, y, button)
   if button == 3 then
      	dx, dy = 0, 0
      	flag = false
   end
end