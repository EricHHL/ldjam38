AnimaCards = Component("animaCards", {tile = 1})

CardsAnimator = Script({AnimaCards, Position})

local img = love.graphics.newImage("/textures/agua1.png")
function CardsAnimator:init(t)
	local a = t
    t.pos.fade = 255
	Timer.tween(0.5, t.pos, {y = t.pos.y - 100, fade = 0}, "out-quad", function() self.cList[t.id] = nil end)
end

function CardsAnimator:drawAfter(t)
    love.graphics.setColor(255, 255, 255, t.pos.fade)
	love.graphics.draw(MapRenderer.texture, MapRenderer.quads[t.animaCards.tile], t.pos.x, t.pos.y, 0, 1, 1, 0, 0)
    love.graphics.setColor(255, 255, 255, 255)
end
