# EQ vd #

require 'postgres'
require 'conf'

class Utility

	def initialize
		c = Conf.new
		@system = PGconn.connect(c.add, c.port, c.opt, c.tty, c.db, c.log, c.pw)
	end

	def struttura
		@file = File.new("app/apis/file/struttura", "r")
		array = @file.readlines
		@file.close
		sql = ""
		for i in 0...array.length
			sql = sql + array[i]
		end
		@system.exec(sql)
	end

	def dump
		#system("pg_dump #{@c.db} > app/apis/file/backup")
	end

	def restore
		#system("psql #{@c.db} < app/apis/file/backup")
	end
end