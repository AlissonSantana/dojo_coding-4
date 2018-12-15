class ConsultaCarro  < Calabash::ABase

	def voltar_home
		sleep 3
		press_back_button
	end

	def selecionar_consulta
		touch("* id:'consulta'")
		sleep 5
	end

	def descer_tela(quantity)
		quantity.times do   		
		perform_action('drag', 50, 50, 90, 40, 20)
		end

	end
	

end