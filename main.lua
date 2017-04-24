require("lib.coisa.coisaCore")
-- GOOI
require("lib.gooi.gooi")
gooiComponent = require("lib.gooi.component")
gooiUtf8      = require("lib.gooi.utf8")
gooiLayout    = require("lib.gooi.layout")

Camera = require("hump-master/camera")
Timer = require("lib.timer")
HexMap = require("HexMap")

height = love.graphics.getHeight()
width = love.graphics.getWidth()

local zoom = 1

function love.load()
    -- cCore.loadScene(R.scene.menuScene)
    cCore.loadScene(R.scene.gameScene)
    camera = Camera(width/2, height/2)
end

function love.update(dt)
    cCore.update(dt)
    Timer.update(dt)
end

function love.draw()
    camera:attach()
    cCore.draw()
    camera:detach()
    -- gooi.draw()
end


function love.mousemoved( x, y, dx, dy )
    if love.mouse.isDown(3) then
      camera:move(math.floor(-dx), math.floor(-dy))
      love.mouse.setVisible(false)
    else
      love.mouse.setVisible(true)
    end
end


function love.keypressed(key, scancode, isrepeat)
    gooi.keypressed()
    if key == 'escape' then
        love.event.quit()
    end
end
