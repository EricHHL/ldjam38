local Path = {}
Path.__index = Path

local function new(pos, tipo)
	local p = {}
	setmetatable(p, Path)

	p.pos = pos
	p.tipo = tipo

	return p
end

setmetatable(Path, {__call = function(_, ...) return new(...) end})
return Path