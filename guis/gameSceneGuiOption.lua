local gui = {}

function gui:setup()
    -- Define estilo da Gui
    love.graphics.setBackgroundColor(150, 150, 150)
    style = {
        font = love.graphics.newFont("/fonts/Life is goofy.ttf", 32),
        fgColor = "#eeeeee",
        bgColor = {6, 133, 245, 255},
        mode3d = true,
        glass = true,
        radius = 13,
        innerRadius = 3
    }
    gooi.setStyle(style)
    gooi.desktopMode()

    opcoes = gooi.newPanel(width/2 - 150, height/2, 250, 50, "grid 1x2")


    labelQuestion = gooi.newLabel("Are you sure?", width/2 - 150, height/2 - 50, 250, 50):setAlign("center")


    --Inicia o jogo
    opcoes:add(gooi.newButton({text = "Yes", align = "center"}):bg({215, 143, 0, 220})
    :onRelease(function(self)
        love.event.quit()
    end), "1,1")


    --Sai do jogo
    opcoes:add(gooi.newButton({text = "No", align = "center"}):bg({215, 143, 0, 200})
    :onRelease(function()
        gooi.removeComponent(opcoes)
        gooi.removeComponent(labelQuestion)
    end), "1,2")

end

function gui:update(dt)
    gooi.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

end

function gui:draw()
    camera:detach()

    love.graphics.setColor(100, 100, 100, 230)
    love.graphics.rectangle("fill", width/2 - 152, height/2 - 52, 252, 102)

    gooi.draw()

    camera:attach()
end



return gui
