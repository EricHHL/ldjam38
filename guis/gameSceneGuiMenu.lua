require("dados")

local gui = {}

function gui:setup()
    -- Define estilo da Gui
    selectedColor = {15, 256, 12}
    style = {
        font = love.graphics.newFont("/fonts/Life is goofy.ttf", 32),
        fgColor = "#ffffff",
        bgColor = {6, 133, 245, 200},
        mode3d = true,
        glass = true,
        radius = 3,
        innerRadius = 3
    }
    gooi.setStyle(style)
    gooi.desktopMode()

    
end

function gui:update(dt)
    gooi.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

    opcoesMenu = gooi.newPanel(width/2 - 150, height/2 - 200, 300, 300, "grid 3x1")
    --Inicia o jogo
    opcoesMenu:add(gooi.newButton("Play")
        :onRelease(function(self)
            --Função para começar o jogo
        end),
    "1,1")
    --Entra nas opções
    opcoesMenu:add(gooi.newButton("Options")
        :onRelease(function(self)
            --Função para ir para o menu
        end),
    "2,1")
    --Sai do jogo
    opcoesMenu:add(gooi.newButton("Exit")
    :onRelease(function()
            gooi.confirm("Are you sure?", function()
                love.event.quit()
            end)
        end),
    "3,1")
end

function gui:draw()
    camera:detach()

    -- Desenha fundo da gui
    love.graphics.setColor(200, 200, 200, 170)
    love.graphics.rectangle("fill",  width/2 - 150, height/2 - 200, 300, 300)
    
    love.graphics.setColor(80, 80, 80, 255)
    love.graphics.rectangle("line",  width/2 - 150, height/2 - 200, 300, 300)
    gooi.draw()

    camera:attach()
end

return gui
