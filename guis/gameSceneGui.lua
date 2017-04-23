local gui = {}

function gui:setup()
    imgs = MapRenderer.quads
    buttons = {}
    for i=1,6 do
        buttons[i] = gooi.newButton("", 50, love.graphics.getHeight() - 150, 120, 140)
        :setTooltip("This is a tooltip!")
        :onRelease(function()
            -- gooi.confirm("Are you sure?", function()
            --
            -- end)
        end)
        :setIcon(MapRenderer.texture, imgs[i])--love.math.random(1, #MapRenderer.quads - 10)])
        :bg({100, 100, 100, 90})
    end

    controles = gooi.newPanel(5, love.graphics.getHeight() - 160, love.graphics.getWidth() - 10, 152, "game")
    for i,v in ipairs(buttons) do
        controles:add(v, "b-l")
    end
end

function gui:update(dt)
    gooi.update(dt)
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
