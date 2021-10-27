# EQ vd #

require 'postgres'
require 'conf'

class Erase

	def initialize
		c = Conf.new
		@erase = PGconn.connect(c.add, c.port, c.opt, c.tty, c.db, c.log, c.pw)
	end

	def erase
		@erase.exec("DELETE FROM Mucca")
		@erase.exec("DELETE FROM Toro")
		@erase.exec("DELETE FROM Fecondazione")
		@erase.exec("DELETE FROM Lattazione")
		@erase.exec("DELETE FROM Vitello")
		@erase.exec("DELETE FROM Prima")
		@erase.exec("DELETE FROM Qualita")
		@erase.exec("DELETE FROM Maternita")
		@erase.exec("DELETE FROM Paternita")
		@erase.exec("DELETE FROM Nascita")
		@erase.exec("DELETE FROM Gestazione")
		@erase.exec("DELETE FROM Concluse")
	end

	def drop_struttura
		@erase.exec("DROP TABLE Prima, Qualita, Maternita")
		@erase.exec("DROP TABLE Paternita, Nascita, Gestazione, Concluse")
		@erase.exec("DROP TABLE Mucca, Toro, Fecondazione, Lattazione, Vitello")
	end

	def disconnect
		@erase.close
	end

end
