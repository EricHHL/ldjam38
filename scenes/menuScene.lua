menuScene = Scene("menuScene")

guiMenu = require("/guis/gameSceneGuiMenu")

function menuScene:init()
    -- GUI
    guiMenu.setup()
    --guiMenu.setup()
end

function menuScene:draw()
    
    guiMenu:draw()
    --guiMenu:draw()
end

function menuScene:update(dt)
    guiMenu:update(dt)
    --guiMenu:update(dt)
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

return menuScene
