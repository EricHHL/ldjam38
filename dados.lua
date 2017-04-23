melhorias = {
	cidade = {
		tile = 15,
		pontos = 100,
		combos = {}
	},
	floresta = {
		tile = 13,
		pontos = 25,
		combos = {}
	},
    grama = {
        tile = 14,
        pontos = 10,
        combos = {}
    }
}
idTiles = {}

for k,v in pairs(melhorias) do
    table.insert(idTiles, v)
end


table.insert(melhorias.floresta.combos,{
		m = melhorias.cidade,
		p = 1
})
