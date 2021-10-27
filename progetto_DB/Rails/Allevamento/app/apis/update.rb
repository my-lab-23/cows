# EQ vd #

require 'postgres'

class Update

	def initialize
		c = Conf.new
		@update = PGconn.connect(c.add, c.port, c.opt, c.tty, c.db, c.log, c.pw)
	end

	def update_mucca ( matricola, nome, padre, madre, data, peso )

		sql = Array.new
	 
		if (nome[0] <=> "") != 0 then sql[0] = "UPDATE Mucca SET nome = '#{nome}'" +
		                                       " WHERE matricola = '#{matricola}'" end
		if (padre[0] <=> "") != 0 then sql[1] = "UPDATE Mucca SET padre = '#{padre}'" +
		                                        " WHERE matricola = '#{matricola}'" end
		if (madre[0] <=> "") != 0 then sql[2] = "UPDATE Mucca SET madre = '#{madre}'"
		                                        " WHERE matricola = '#{matricola}'" end
		if (data[0] <=> "") != 0 then sql[3] = "UPDATE Mucca SET data_nascita = '#{data}'" +
		                                       " WHERE matricola = '#{matricola}'" end
		if (peso[0] <=> "") != 0 then sql[4] = "UPDATE Mucca SET peso_nascita = '#{peso}'" +
		                                       " WHERE matricola = '#{matricola}'" end

		for i in 0...5
			if sql[i] != nil then @update.exec(sql[i]) end
		end
	end

	def update_fecondazione ( fecondazione, tipologia, data )
		
		sql = Array.new
	 
		if (tipologia[0] <=> "") != 0 then sql[0] = "UPDATE Fecondazione SET tipologia = '#{tipologia}'" +
		                                            " WHERE fecondazione = '#{fecondazione}'" end
		if (data[0] <=> "") != 0 then sql[1] = "UPDATE Fecondazione SET data = '#{data}'" +
		                                       " WHERE fecondazione = '#{fecondazione}'" end

		for i in 0...2
			if sql[i] != nil then @update.exec(sql[i]) end
		end
	end

	def update_lattazione ( lattazione, data )

		if (data[0] <=> "") != 0 then sql = "UPDATE Lattazione SET data = '#{data}'" +
		                                    " WHERE lattazione = '#{lattazione}'" end
		if sql != nil then @update.exec(sql) end
	end

	def update_toro ( toro, nome, padre, madre )

		sql = Array.new
	 
		if (nome[0] <=> "") != 0 then sql[0] = "UPDATE Toro SET nome = '#{nome}'" +
		                                       " WHERE toro = '#{toro}'" end
		if (padre[0] <=> "") != 0 then sql[1] = "UPDATE Toro SET padre = '#{padre}'" +
		                                        " WHERE toro = '#{toro}'" end
		if (madre[0] <=> "") != 0 then sql[2] = "UPDATE Toro SET madre = '#{madre}'" +
		                                        " WHERE toro = '#{toro}'" end

		for i in 0...3
			if sql[i] != nil then @update.exec(sql[i]) end
		end
	end

	def update_vitello ( vitello, sesso )
	 
		if (sesso[0] <=> "") != 0 then sql = "UPDATE Vitello SET sesso = '#{sesso}'" +
		                                     " WHERE vitello = '#{vitello}'" end
		if sql != nil then @update.exec(sql) end
	end

	def update_prima ( matricola, fecondazione, eta, peso )

		sql = Array.new
	 
		if (eta[0] <=> "") != 0 then sql[0] = "UPDATE Prima SET eta = '#{eta}'" +
		                                      " WHERE (matricola = '#{matricola}' AND fecondazione = '#{fecondazione}')" end
		if (peso[0] <=> "") != 0 then sql[1] = "UPDATE Prima SET peso = '#{peso}'" +
		                                       " WHERE (matricola = '#{matricola}' AND fecondazione = '#{fecondazione}')" end

		for i in 0...2
			if sql[i] != nil then @update.exec(sql[i]) end
		end
	end

	def update_qualita ( matricola, lattazione, quantita, durata, grasso )

		sql = Array.new
	 
		if (quantita[0] <=> "") != 0 then sql[0] = "UPDATE Qualita SET quantita = '#{quantita}'" +
		                                           " WHERE (matricola = '#{matricola}' AND lattazione = '#{lattazione}')" end
		if (durata[0] <=> "") != 0 then sql[1] = "UPDATE Qualita SET durata = '#{durata}'" +
		                                         " WHERE (matricola = '#{matricola}' AND lattazione = '#{lattazione}')" end
		if (grasso[0] <=> "") != 0 then sql[2] = "UPDATE Qualita SET grasso = '#{grasso}'" +
		                                         " WHERE (matricola = '#{matricola}' AND lattazione = '#{lattazione}')" end

		for i in 0...3
			if sql[i] != nil then @update.exec(sql[i]) end
		end
	end

	def disconnect
		@update.close
	end

end  
