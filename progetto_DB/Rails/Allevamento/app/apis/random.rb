# EQ vd #

class Random

	def initialize
		@i_mat = 0
		@i_tor = 0
		@i_vit = 0
		@i_lat = 0
		@i_fec = 0
	end

	def azzera
		@i_mat = 0
		@i_tor = 0
		@i_vit = 0
		@i_lat = 0
		@i_fec = 0
	end

	def random_matricola
		# ATTENZIONE primary key
		@i_mat = @i_mat + 1
		return string = "IT060000" + @i_mat.to_s
	end

	def random_nome_maschile
		file = File.new("app/apis/file/nomi_maschili", "r")
		
		j = rand(1000) + 1

		for i in 0...j
			string = file.readline
		end
		
		file.close
		return string.chop
	end

	def random_nome_femminile
		file = File.new("app/apis/file/nomi_femminili", "r")
		
		j = rand(500) + 1

		for i in 0...j
			string = file.readline
		end
		
		file.close
		return string.chop
	end

	def random_data
		giorno = rand(28) + 1
		mese = rand(11) + 1
		anno = rand(15) + 1990
		return "#{mese.to_s}/#{giorno.to_s}/#{anno.to_s}"
	end

	def random_peso_nascita
		peso = rand(20) + 40
		return peso
	end

	def random_peso_prima
		peso = rand(40) + 280
		return peso
	end

	def random_tipologia
		n = rand(2)
		if n==0 then return "artificiale" end
		if n==1 then return "naturale" end
	end
	
	def random_toro
		# ATTENZIONE primary key
		@i_tor = @i_tor + 1
		return @i_tor
	end

	def random_vitello
		# ATTENZIONE primary key
		@i_vit = @i_vit + 1
		return @i_vit
	end

	def random_sesso
		n = rand(2)
		if n==0 then return "F" end
		if n==1 then return "M" end
	end

	def random_lattazione
		# ATTENZIONE primary key
		@i_lat = @i_lat + 1
		return @i_lat
	end

	def random_fecondazione
		# ATTENZIONE primary key
		@i_fec = @i_fec + 1
		return @i_fec
	end

	def random_eta
		eta = rand(5) + 12
		return eta.to_s
	end

	def random_quantita
		quantita = rand(500) + 300
		return quantita
	end

	def random_durata
		durata = rand(90) + 30
		return durata
	end

	def random_grasso
		grasso = rand(20)
		return grasso
	end

end