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
	}
}

table.insert(melhorias.floresta.combos,{
		m = melhorias.cidade,
		p = 1
})
