PlayerInput = Script()

local q = 0
local r = 0

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