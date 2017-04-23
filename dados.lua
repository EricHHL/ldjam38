melhorias = {
	vazio = {
		tile = 1,
		pontos = 0,
		borda = 0,
		combos = {}
	},
	cidade = {
		tile = 15,
		pontos = 100,
		borda = 1,
		combos = {}
	},
	floresta = {
		tile = 13,
		pontos = 25,
		borda = 0,
		combos = {}
	},
	rua = {
		tile = 1,
		pontos = -10,
		borda = 1,
		combos = {}
	}
}

caminhos = {
}

table.insert(melhorias.cidade.combos,{
		m = melhorias.floresta,
		p = 0.25
})

table.insert(melhorias.rua.combos,{
		m = melhorias.cidade,
		p = 1
	})

idTiles = {
	cidade,
	floresta
}