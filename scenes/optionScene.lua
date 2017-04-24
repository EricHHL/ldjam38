optionScene = Scene("optionScene")

guiMenu = require("/guis/gameSceneGuiOption")

function optionScene:init()
    -- GUI
    guiMenu.setup()
end

function optionScene:draw()
    guiMenu:draw()
end

function optionScene:update(dt)
    guiMenu:update(dt)
end

function love.mousereleased(x, y, button, isTouch)
    gooi.released()
end

function love.mousepressed(x, y, button, istouch)
    gooi.pressed()
end

-- function love.keypressed(key, scancode, isrepeat)
--     gooi.keypressed()
-- end

function love.textinput(text)
    gooi.textinput(text)
end

return optionScene
