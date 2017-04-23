PlayerInput = Script()

local q = 0
local r = 0

local melhoria = melhorias.cidade

function PlayerInput:updateOnce(dt)
	local x, y = camera:worldCoords(love.mouse.getPosition())
	
	y = y + 35

	x = x / (70 * math.sqrt(3))
	y = y / (70 * math.sqrt(3))

	temp = math.floor(x + math.sqrt(3) * y + 1)
	q = math.floor((math.floor(2*x+1) + temp) / 3);
	r = math.floor((temp + math.floor(-x + math.sqrt(3) * y + 1))/3);

	q = q - math.ceil((r-1)/2)
end

function PlayerInput.getSelected()
	return q, r
end

function love.keypressed(k)
	if k == "1" then
		melhoria = melhorias.cidade
	end
	if k == "2" then
		melhoria = melhorias.floresta
	end

end

function PlayerInput.getMelhoria()
	return melhoria
end