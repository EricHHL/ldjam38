AnimTexto = Component("animTexto", {texto = "", alpha = 255})

TextoAnimator = Script({AnimTexto, Position})

function TextoAnimator:init(t)
	local a = t
	Timer.tween(2, t.pos, {y = t.pos.y - 100}, "out-quad", function() self.cList[t.id] = nil end)
	Timer.tween(2, t.animTexto, {alpha = 0})
end

function TextoAnimator:draw(t)
	love.graphics.setColor(255, 255, 255, t.animTexto.alpha)
	love.graphics.print(t.animTexto.texto, t.pos.x, t.pos.y)
end
