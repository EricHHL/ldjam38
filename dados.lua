melhorias = {
	vazio = {
		tile = 1,
		pontos = 0,
		borda = 0,
		maxBorda = 4,
		combos = {}
	},
	cidade = {
		tile = 15,
		pontos = 100,
		borda = 1,
		maxBorda = 1,
		combos = {}
	},
	floresta = {
		tile = 13,
		pontos = 25,
		borda = 0,
		maxBorda = 2,
		combos = {}
	},
	fazenda = {
		tile = 12,
		pontos = 40,
		borda = 1,
		maxBorda = 1,
		combos = {}
	},
	rua = {
		tile = 1,
		pontos = -10,
		borda = 1,
		maxBorda = 4,
		combos = {}
	}
}

idTiles = {
    melhorias.vazio,
	melhorias.cidade,
	melhorias.floresta,
	melhorias.fazenda,
	melhorias.rua
}

table.insert(melhorias.cidade.combos,{
		m = melhorias.floresta,
		p = 0.25
})


playerPoints = 0
