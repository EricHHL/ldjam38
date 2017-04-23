require("dados")

local gui = {}

function gui:setup()
    -- Define estilo da Gui
    style = {
        font = love.graphics.newFont("/fonts/Life is goofy.ttf", 16),
		fgColor = "#ffffff",
		bgColor = "#111111EE",
		mode3d = false,
		glass = true,
		radius = 3,
		innerRadius = 3
	}
	gooi.setStyle(style)
	gooi.desktopMode()
    -- Pega os quas globais para desenhar nos botões
    local quads = MapRenderer.quads
    buttons = {}
    for i=1,6 do
        local t = idTiles[love.math.random(1, #idTiles)]
        buttons[i] = gooi.newButton("", 50, love.graphics.getHeight() - 150, 120, 140, 1, 1)
        :onRelease(function()
            PlayerInput.setMelhoria(t)
        end)
        :setTooltip("Este é um Tile")
        :setIcon(MapRenderer.texture, quads[t.tile])--love.math.random(1, #MapRenderer.quads - 10)])
        :bg({100, 100, 100, 90})
    end
    -- Cria painel controles pra por os controles
    controles = gooi.newPanel(5, love.graphics.getHeight() - 160, love.graphics.getWidth() - 10, 152, "game")
    for i,v in ipairs(buttons) do
        controles:add(v, "b-l")
    end

    -- TEST AREA
    label = gooi.newLabel("Goofy font parece boa.", 200, 10)
    -- Da pra facilmente mudar a fonte assim
    label.style.font = love.graphics.newFont("/fonts/Life is goofy.ttf", 40)

end

function gui:update(dt)
    gooi.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end
end

function gui:draw()
    camera:detach()

    gooi.draw()
    love.graphics.setColor(0, 0, 0, 127)
    love.graphics.rectangle("line", controles.x, controles.y, controles.w, controles.h)
    love.graphics.setColor(255, 255, 255, 255)

    camera:attach()
end

return gui
