require("lib.coisa.coisaCore")
-- PUSH
local push = require("lib.push")
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

    -- PUSH configurações
    gameWidth, gameHeight = 1366, 768 --fixed game resolution
    local windowWidth, windowHeight = love.window.getDesktopDimensions()
    windowWidth, windowHeight = windowWidth*.7, windowHeight*.7 --make the window a bit smaller than the screen itself

    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

end

function love.update(dt)
    cCore.update(dt)
    Timer.update(dt)
end

function love.draw()
    push:start()

    camera:attach()
    cCore.draw()
    camera:detach()
    -- gooi.draw()

    -- love.graphics.setLineWidth(10)
    -- love.graphics.rectangle("line", 0, 0, gameWidth, gameHeight)

    push:finish()
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
