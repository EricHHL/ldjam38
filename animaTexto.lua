

AnimTexto = Component("animTexto", {texto = ""})


TextoAnimator = Script({AnimTexto, Position})

function TextoAnimator:init(t)
	local a = t
	Timer.tween(2, t.pos, {y = t.pos.y - 100}, "out-quad", function() self.cList[t.id] = nil end)
end

function TextoAnimator:draw(t)
	love.graphics.print(t.animTexto.texto, t.pos.x, t.pos.y)
end