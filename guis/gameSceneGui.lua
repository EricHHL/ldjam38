require("dados")

local gui = {}

function gui:setup()
    -- Define estilo da Gui
    selected = {15, 256, 12}
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

    -- Pega os quads globais para desenhar nos botões
    local quads = MapRenderer.quads
    -- Opções de tiles para se colocar no jogo
    local tileOptions = {}
    for i=1,6 do
        local t = idTiles[love.math.random(1, #idTiles)]
        tileOptions[i] = gooi.newButton("", 50, love.graphics.getHeight() - 150, 120, 140, 0.9, 0.9)
        :onRelease(function()
            if PlayerInput.discardMode then
                -- Se estiver no modo de descartar muda o quad a se desenhar
                t = idTiles[love.math.random(1, #idTiles)] -- pega um aleatório
                -- Muda o ícone do botão pro novo valor
                tileOptions[i]:setIcon(MapRenderer.texture, quads[t.tile])
                -- Muda a parada a desenhar
                PlayerInput.setMelhoria(t)
            else
                PlayerInput.setMelhoria(t)
            end
        end)
        :setTooltip("Este é um Tile")
        :setIcon(MapRenderer.texture, quads[t.tile])--love.math.random(1, #MapRenderer.quads - 10)])
        :bg({100, 100, 100, 80})
    end
    -- Opções, cria um painel em grade 3x3 pra elas
    opcoes = gooi.newPanel(love.graphics.getWidth() - 420, love.graphics.getHeight() - 154, 400, 140, "grid 3x3")
    -- Botão para selecionar um tile para colocar
    opcoes:add(gooi.newButton("Select")
        :onRelease(function(self)
            for k,v in pairs(opcoes.sons) do
                if v.ref == self then
                    v.ref:bg(selected)
                else
                    v.ref:bg(style.bgColor)
                end
            end
            print("Select mode")
            PlayerInput.discardMode = false
        end)
        :bg(selected),
    "1,1")
    -- Botão para descartar um tile a lista
    opcoes:add(gooi.newButton("Discard")
        :onRelease(function(self)
            for k,v in pairs(opcoes.sons) do
                if v.ref == self then
                    v.ref:bg(selected)
                else
                    v.ref:bg(style.bgColor)
                end
            end
            print("Discard mode")
            PlayerInput.discardMode = true
        end),
    "2,1")
    -- Botão para destruir um tile do jogo
    opcoes:add(gooi.newButton("Destroy")
        :onRelease(function(self)
            for k,v in pairs(opcoes.sons) do
                if v.ref == self then
                    v.ref:bg(selected)
                else
                    v.ref:bg(style.bgColor)
                end
            end
            print("Destroy mode")
            PlayerInput.discardMode = true
        end),
    "3,1")
    -- Botão para sair do jogo
    opcoes:add(gooi.newButton("Exit")
    :onRelease(function()
        gooi.confirm("Are you sure?", function()
            love.event.quit()
        end)
    end),
    "3,3")


    -- Cria painel controles pra por os controles
    controles = gooi.newPanel(5, love.graphics.getHeight() - 160, love.graphics.getWidth() - 10, 152, "game")
    for i,v in ipairs(tileOptions) do
        controles:add(v, "b-l")
    end

    -- Amostra pontos do jogador
    label = gooi.newLabel(string.format("%d", playerPoints), love.graphics.getWidth()/2, 10)


    -- TEST AREA
    opcoes.layout.debug = true
    -- Da pra facilmente mudar a fonte assim
    label.style.font = love.graphics.newFont("/fonts/Life is goofy.ttf", 40)
    -- gooi.confirm("olar")
end

function gui:update(dt)
    gooi.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end
end

function gui:draw()
    camera:detach()

    love.graphics.setColor(10, 10, 10, 200)
    love.graphics.rectangle("fill", controles.x, controles.y, controles.w, controles.h)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.rectangle("line", controles.x, controles.y, controles.w, controles.h)
    -- love.graphics.setColor(255, 255, 255, 255)

    gooi.draw()

    camera:attach()
end

return gui
