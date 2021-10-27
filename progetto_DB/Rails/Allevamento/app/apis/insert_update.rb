# EQ vd #

require 'postgres'
require 'update'

class Insert_Update < Insert

	def initialize
		c = Conf.new
		@insert = PGconn.connect(c.add, c.port, c.opt, c.tty, c.db, c.log, c.pw)
	end

	def insert_mucca ( matricola, nome, padre, madre, data, peso )

		begin
			sql = "INSERT INTO Mucca(matricola) values ('#{matricola}')"
			@insert.exec(sql)
		rescue
		ensure
			@update = Update.new
			@update.update_mucca(matricola, nome, padre, madre, data, peso)
			@update.disconnect
		end
	end

	def insert_fecondazione ( fecondazione, tipologia, data )

		begin
			sql = "INSERT INTO Fecondazione(fecondazione) values ('#{fecondazione}')"
			@insert.exec(sql)
		rescue
		ensure
			@update = Update.new
			@update.update_fecondazione(fecondazione, tipologia, data )
			@update.disconnect
		end
	end

	def insert_lattazione ( lattazione, data )

		begin
			sql = "INSERT INTO Lattazione(lattazione) values ('#{lattazione}')"
			@insert.exec(sql)
		rescue
		ensure
			@update = Update.new
			@update.update_lattazione(lattazione, data)
			@update.disconnect
		end
	end

	def insert_toro ( toro, nome, padre, madre )

		begin
			sql = "INSERT INTO Toro(toro) values ('#{toro}')"
			@insert.exec(sql)
		rescue
		ensure
			@update = Update.new
			@update.update_toro(toro, nome, padre, madre)
			@update.disconnect
		end
	end

	def insert_vitello ( vitello, sesso )

		begin
			sql = "INSERT INTO Vitello(vitello) values ('#{vitello}')"
			@insert.exec(sql)
		rescue
		ensure
			@update = Update.new
			@update.update_vitello(vitello, sesso)
			@update.disconnect
		end
	end

	def insert_prima ( matricola, fecondazione, eta, peso )

		begin
			sql = "INSERT INTO Prima(matricola, fecondazione) values ('#{matricola}', '#{fecondazione}')"
			@insert.exec(sql)
		rescue
		ensure
			@update = Update.new
			@update.update_prima(matricola, fecondazione, eta, peso)
			@update.disconnect
		end
	end

	def insert_qualita ( matricola, lattazione, quantita, durata, grasso )

		begin
			sql = "INSERT INTO Qualita(matricola, lattazione) values ('#{matricola}', '#{lattazione}')"
			@insert.exec(sql)
		rescue
		ensure
			@update = Update.new
			@update.update_qualita(matricola, lattazione, quantita, durata, grasso)
			@update.disconnect
		end
	end
end
