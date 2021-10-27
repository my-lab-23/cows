# EQ vd #

require "utility"
require "erase"
require "insert"
require "insert_update"
require "popola"

class AllevamentoController < ApplicationController

	def popola
		popola = Popola.new
		popola.popola
	end

	def views_mucca
		@items = Mucca.find_all
	end

	def views_toro
		@items = Toro.find_all
	end

	def views_vitello
		sql = "select * from Vitello, Lattazione" +
		      " where (Vitello.vitello = Nascita.vitello and Lattazione.lattazione = Nascita.lattazione)"
		@items = Vitello.find_by_sql(sql)
	end

	def views_fecondazione
		@items = Fecondazione.find_all
	end

	def views_positive
		sql = "select * from Lattazione, Nascita, Vitello, Gestazione, Fecondazione, Paternita, Maternita" +
		      " where (Lattazione.lattazione = Nascita.lattazione and" +
		      " Vitello.vitello = Nascita.vitello and" +
		      " Vitello.vitello = Gestazione.vitello and" +
		      " Fecondazione.fecondazione = Gestazione.fecondazione and" +
		      " Vitello.vitello = Paternita.vitello and" +
		      " Vitello.vitello = Maternita.vitello)"
		@items = Fecondazione.find_by_sql(sql)
	end

	def views_prima
		@items = Prima.find_all
	end

	def views_qualita
		@items = Qualita.find_all
	end

	def views_maternita
		@items = Maternita.find_all
	end

	def views_paternita
		@items = Paternita.find_all
	end

	def insert_mucca
		unless(check(@params["matricola"])) then return end
		mucca = Insert_Update.new
		mucca.insert_mucca(@params["matricola"], @params["nome"], @params["padre"], @params["madre"],
		                   @params["data_nascita"], @params["peso_nascita"])
		mucca.disconnect
	end

	def insert_prima
		unless(check(@params["matricola"])) then return end
		unless(check(@params["fecondazione"])) then return end
		prima = Insert_Update.new
		prima.insert_prima(@params["matricola"], @params["fecondazione"], @params["eta"], @params["peso"])
		null_string = Array.new
		null_string[0] = ""
		prima.insert_fecondazione(@params["fecondazione"], null_string, @params["data"], null_string)
		prima.disconnect
	end

	def insert_toro
		unless(check(@params["toro"])) then return end
		toro = Insert_Update.new
		toro.insert_toro(@params["toro"], @params["nome"], @params["padre"], @params["madre"])
		toro.disconnect
	end

	def insert_fecondazione
		unless(check(@params["matricola"])) then return end
		unless(check(@params["fecondazione"])) then return end
		unless(check(@params["toro"])) then return end
		fecondazione = Insert_Update.new
		fecondazione.insert_fecondazione(@params["fecondazione"], @params["tipologia"], @params["data"])
		fecondazione.insert_concluse(@params["matricola"], @params["toro"], @params["fecondazione"])
		fecondazione.disconnect
	end

	def insert_lattazione
		unless(check(@params["matricola"])) then return end
		unless(check(@params["toro"])) then return end
		unless(check(@params["vitello"])) then return end
		unless(check(@params["fecondazione"])) then return end
		unless(check(@params["lattazione"])) then return end
		lattazione = Insert_Update.new
		lattazione.insert_lattazione(@params["lattazione"], @params["data"])
		lattazione.insert_qualita(@params["matricola"], @params["lattazione"],
		                          @params["quantita"], @params["durata"], @params["grasso"])
		lattazione.insert_vitello(@params["vitello"], @params["sesso"])
		lattazione.insert_maternita(@params["matricola"], @params["vitello"])
		lattazione.insert_paternita(@params["toro"], @params["vitello"])
		lattazione.insert_nascita(@params["vitello"], @params["lattazione"])
		lattazione.insert_gestazione(@params["vitello"], @params["fecondazione"])
		lattazione.disconnect
	end

	def scheda
		@mucca = Mucca.find_by_sql("SELECT * FROM Mucca WHERE Matricola='#{@params["matricola"]}'")
		@prima = Prima.find_by_sql("SELECT * FROM Prima WHERE Matricola='#{@params["matricola"]}'")
		if @prima[0] != nil then
			@feco1 = Fecondazione.find_by_sql("SELECT * FROM Fecondazione WHERE Fecondazione='#{@prima[0].fecondazione}'")
		else
			@feco1 = Array.new
		end
		sql = "select * from Lattazione, Qualita" +
		      " where (Qualita.matricola = '#{@params["matricola"]}' and" +
		      " Qualita.lattazione = Lattazione.lattazione)"
		@latta = Lattazione.find_by_sql(sql)
		sql = "select * from Lattazione, Nascita, Vitello, Gestazione, Fecondazione, Concluse" +
		      " where (Concluse.matricola = '#{@params["matricola"]}' and" +
		      " Concluse.fecondazione = Fecondazione.fecondazione and" +
		      " Gestazione.fecondazione = Fecondazione.fecondazione and" +
		      " Gestazione.vitello = Vitello.vitello and" +
		      " Nascita.vitello = Vitello.vitello and" +
		      " Nascita.lattazione = Lattazione.lattazione)"
		@felat = Fecondazione.find_by_sql(sql)
	end

	def struttura
		u = Utility.new
		u.struttura
	end

	def drop_struttura
		d = Erase.new
		d.drop_struttura
		d.disconnect
	end

	def dump
		u = Utility.new
		u.dump
	end

	def restore
		u = Utility.new
		u.restore
	end

	def erase
		erase = Erase.new
		erase.erase
		erase.disconnect
	end

	def check (key)
		if (key[0] <=> "") != 0 then return true end
		if (key[0] <=> "") == 0 then 
		render_text("Errore: chiavi non inserite.")
		return false
		end
	end

end
