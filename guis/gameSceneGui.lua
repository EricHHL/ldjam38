local gui = {}

function gui:setup()
    imgs = MapRenderer.quads
    btn1 = gooi.newButton("", 50, love.graphics.getHeight() - 150, 120, 140)
        :setTooltip("This is a tooltip!")
        :onRelease(function()
            gooi.confirm("Are you sure?", function()
                -- love.event.quit()
            end)
        end)
    -- :setScale(0.5, 0.5)
        :setIcon(MapRenderer.texture, imgs[3])
        :bg({100, 100, 100, 90})


    controles = gooi.newPanel(5, love.graphics.getHeight() - 160, love.graphics.getWidth() - 10, 152, "game")
    controles:add(btn1, "b-l")
end

local t = 0
local i = 1
function gui:update(dt)
    gooi.update(dt)

    if t > 1 then
        t = 0
        btn1:setIcon(MapRenderer.texture, imgs[i])
        print("trocou")
        i = i + 1
    end
    t = t + dt
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
