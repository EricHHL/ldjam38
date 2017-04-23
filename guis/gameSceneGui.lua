local gui = {}

function gui:setup()
    quads = MapRenderer.quads
    buttons = {}
    for i=1,2 do
        local tile = 15
        if i == 2 then tile = 13 end
        buttons[i] = gooi.newButton("", 50, love.graphics.getHeight() - 150, 120, 140)
        :setTooltip("This is a tooltip!")
        :onRelease(function()
            PlayerInput.setMelhoria(tile)
        end)
        :setIcon(MapRenderer.texture, quads[tile])--love.math.random(1, #MapRenderer.quads - 10)])
        :bg({100, 100, 100, 90})
    end

    controles = gooi.newPanel(5, love.graphics.getHeight() - 160, love.graphics.getWidth() - 10, 152, "game")
    for i,v in ipairs(buttons) do
        controles:add(v, "b-l")
    end
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
