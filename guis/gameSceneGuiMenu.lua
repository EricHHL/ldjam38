
local gui = {}

function gui:setup()
    -- Define estilo da Gui
    love.graphics.setBackgroundColor(150, 150, 150)
    style = {
        font = love.graphics.newFont("/fonts/Berry Rotunda.ttf", 40),
        fgColor = "#000000",
        bgColor = {6, 133, 245, 255},
        mode3d = true,
        glass = true,
        radius = 13,
        innerRadius = 3
    }
    gooi.setStyle(style)
    gooi.desktopMode()

    opcoesMenu = gooi.newPanel(20, height - 170, 250, 150, "grid 2x1")
    --Inicia o jogo
    --text, x, y, w, h, scalex, scaley, q
    opcoesMenu:add(gooi.newButton({text = "Play", align = "center"}):bg({215, 143, 0, 220})
    :onRelease(function(self)
        gooi.removeComponent(opcoesMenu)
        cCore.loadScene(R.scene.gameScene)
    end), "1,1")


    --Sai do jogo
    opcoesMenu:add(gooi.newButton({text = "Exit", align = "center"}):bg({215, 143, 0, 200})
    :onRelease(function()
        cCore.loadScene(R.scene.OptionScene)
    end), "2,1")

end

function gui:update(dt)
    gooi.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

end

function gui:draw()
    camera:detach()

    love.graphics.setBackgroundColor(150, 150, 150)
    love.graphics.setColor(10, 10, 10, 200)
    love.graphics.rectangle("fill", 19, height - 171, 251, 151)


    gooi.draw()

    camera:attach()
end



return gui
