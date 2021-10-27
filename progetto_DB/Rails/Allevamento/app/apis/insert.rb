# EQ vd #

require 'postgres'

class Insert

	def initialize
		c = Conf.new
		@insert = PGconn.connect(c.add, c.port, c.opt, c.tty, c.db, c.log, c.pw)
		@insert.exec("BEGIN;")
	end

	def insert_mucca ( matricola, nome, padre, madre, data, peso )

		sql = "INSERT INTO Mucca(matricola, nome, padre, madre, data_nascita, peso_nascita) " +
		      "values ('#{matricola}', '#{nome}', '#{padre}', '#{madre}', '#{data}', '#{peso}')"
		@insert.exec(sql)
	end

	def insert_fecondazione ( fecondazione, tipologia, data )

		sql = "INSERT INTO Fecondazione(fecondazione, tipologia, data ) " +
		      "values ('#{fecondazione}', '#{tipologia}', '#{data}' )"
		@insert.exec(sql)
	end

	def insert_lattazione ( lattazione, data )

		sql = "INSERT INTO Lattazione(lattazione, data) " +
		      "values ('#{lattazione}', '#{data}')"
		@insert.exec(sql)
	end

	def insert_toro ( toro, nome, padre, madre )

		sql = "INSERT INTO Toro(toro, nome, padre, madre) " +
		      "values ('#{toro}', '#{nome}', '#{padre}', '#{madre}')"
		@insert.exec(sql)
	end

	def insert_vitello ( vitello, sesso )

		sql = "INSERT INTO Vitello(vitello, sesso) " +
		      "values ('#{vitello}', '#{sesso}')"
		@insert.exec(sql)
	end

	def insert_prima ( matricola, fecondazione, eta, peso )

		sql = "INSERT INTO Prima(matricola, fecondazione, eta, peso) " +
		      "values ('#{matricola}', '#{fecondazione}', '#{eta}', #{peso})"
		@insert.exec(sql)
	end

	def insert_qualita ( matricola, lattazione, quantita, durata, grasso )

		sql = "INSERT INTO Qualita(matricola, lattazione, quantita, durata, grasso) " +
		      "values ('#{matricola}', '#{lattazione}', '#{quantita}', '#{durata}', '#{grasso}')"
		@insert.exec(sql)
	end

	def insert_maternita ( matricola, vitello )

		begin
		sql = "INSERT INTO Maternita(matricola, vitello) " +
		      "values ('#{matricola}', '#{vitello}')"
		@insert.exec(sql)
		rescue
			return
		end
		
	end

	def insert_paternita ( toro, vitello )

		begin
		sql = "INSERT INTO Paternita(toro, vitello) " +
		      "values ('#{toro}', '#{vitello}')"
		@insert.exec(sql)
		rescue
			return
		end
	end

	def insert_nascita ( vitello, lattazione )

		begin
		sql = "INSERT INTO Nascita(vitello, lattazione) " +
		      "values ('#{vitello}', '#{lattazione}')"
		@insert.exec(sql)
		rescue
			return
		end
	end

	def insert_gestazione ( vitello, fecondazione )

		begin
		sql = "INSERT INTO Gestazione(vitello, fecondazione) " +
		      "values ('#{vitello}', '#{fecondazione}')"
		@insert.exec(sql)
		rescue
			return
		end
	end

	def insert_concluse ( matricola, toro, fecondazione )

		begin
		sql = "INSERT INTO Concluse(matricola, toro, fecondazione) " +
		      "values ('#{matricola}', '#{toro}', '#{fecondazione}')"
		@insert.exec(sql)
		rescue
			return
		end
	end

	def disconnect
		@insert.exec("COMMIT;")
		@insert.close
	end

end 
