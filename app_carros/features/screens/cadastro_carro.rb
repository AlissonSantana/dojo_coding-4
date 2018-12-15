class CadastrarCarro < Calabash::ABase

	def selecionar_cadastro
		touch("* id:'cadastrar'")

	end

	def preencher_modelo(nome)
		touch("* id:'modelo'")
		keyboard_enter_text(nome)
	end

	def preencher_ano(data)
		touch("* id:'ano'")
		keyboard_enter_text(data)
	end

	def preencher_placa(placa)
		touch("* id:'placa'")
		keyboard_enter_text(placa)
	end

	def preencher_km(numero)
		touch("* id:'km'")
		keyboard_enter_text(numero)
	end

	def esconder_teclado
		hide_soft_keyboard
	end

	def preencher_valor(preco)
		touch("* id:'valor'")
		keyboard_enter_text(preco)
	end

	def salvar_cadastro
		hide_soft_keyboard
		touch("* id:'cadastrar'")
		
	end


	def preencher_cadastro(nome,data,placa,numero,preco)
		preencher_modelo(nome)
		preencher_ano(data)
		preencher_placa(placa)
		preencher_km(numero)
		hide_soft_keyboard
		preencher_valor(preco)
		
	end

	def validar_texto(*args)
		args.each do |text|
		wait_for_elements_exist(["* text:'#{text}'"], :timeout => 5)
		end
	end

	def validar_carro(placa)
		page(ConsultaCarro).descer_tela(20)
		validar_texto(placa)

		
	end

	
end