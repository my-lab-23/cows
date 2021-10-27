# EQ vd #

require 'insert'
require 'random'

class Popola
	
	def popola ()

		value = Random.new

		@popola = Insert.new

		for i in 0...1000

			matricola = value.random_matricola
			nome = value.random_nome_femminile
			padre = value.random_nome_maschile
			madre = value.random_nome_femminile
			data = value.random_data
			peso = value.random_peso_nascita
			@popola.insert_mucca(matricola, nome, padre, madre, data, peso)
		end

		value.azzera

		for i in 0...1000
			fecondazione = value.random_fecondazione
			tipologia = value.random_tipologia
			data = value.random_data
			@popola.insert_fecondazione(fecondazione, tipologia, data)
		end

		value.azzera

		for i in 0...1000
			lattazione = value.random_lattazione
			data = value.random_data
			@popola.insert_lattazione(lattazione, data)
		end

		value.azzera

		for i in 0...1000
			toro = value.random_toro
			nome = value.random_nome_maschile
			padre = value.random_nome_maschile
			madre = value.random_nome_femminile
			@popola.insert_toro(toro, nome, padre, madre)
		end

		value.azzera

		for i in 0...1000
			vitello = value.random_vitello
			sesso = value.random_sesso
			@popola.insert_vitello(vitello, sesso)
		end

		value.azzera

		for i in 0...1000
			matricola = value.random_matricola
			fecondazione = value.random_fecondazione
			eta = value.random_eta
			peso = value.random_peso_prima
			@popola.insert_prima(matricola, fecondazione, eta, peso)
		end

		value.azzera

		for i in 0...1000
			matricola = value.random_matricola
			lattazione = value.random_lattazione
			quantita = value.random_quantita
			durata = value.random_durata
			grasso = value.random_grasso
			@popola.insert_qualita(matricola, lattazione, quantita, durata, grasso)
		end

		value.azzera

		for i in 0...1000
			matricola = value.random_matricola
			vitello = value.random_vitello
			@popola.insert_maternita(matricola, vitello)
		end

		value.azzera

		for i in 0...1000
			toro = value.random_toro
			vitello = value.random_vitello
			@popola.insert_paternita(toro, vitello)
		end

		value.azzera

		for i in 0...1000
			vitello = value.random_vitello
			lattazione = value.random_lattazione
			@popola.insert_nascita(vitello, lattazione)
		end

		value.azzera

		for i in 0...1000
			vitello = value.random_vitello
			fecondazione = value.random_fecondazione
			@popola.insert_gestazione(vitello, fecondazione)
		end

		value.azzera
		
		for i in 0...1000
			matricola = value.random_matricola
			toro = value.random_toro
			fecondazione = value.random_fecondazione
			@popola.insert_concluse(matricola, toro, fecondazione)
		end

		value.azzera

		@popola.disconnect

	end
end