require("lib.coisa.coisaCore")

Camera = require("hump-master/camera")
HexMap = require("HexMap")

height = love.graphics.getHeight()
width = love.graphics.getWidth()

local zoom = 1

function love.load()
  cCore.loadScene(R.scene.gameScene)
  camera = Camera(width/2, height/2)
end

function love.update(dt)
  cCore.update(dt)
end

function love.draw()
  camera:attach()
  cCore.draw()
    camera:detach()
end

function love.mousemoved( x, y, dx, dy )
  if love.mouse.isDown(3) then
    camera:move(math.floor(-dx), math.floor(-dy))
  end
end

function love.keypressed(key, scancode, isrepeat)
    if key == 'escape' then
        love.event.quit()
    end
end
