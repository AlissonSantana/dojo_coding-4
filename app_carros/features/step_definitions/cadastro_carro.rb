require 'calabash-android/calabash_steps'

Dado(/^que eu tenha acessado a funcionalidade Cadastro de Carros Web$/) do
  page(CadastrarCarro).selecionar_cadastro
  

end

Quando(/^preencher todos campos para o cadastro$/) do
	@modelo = Faker::Vehicle.manufacture
	@ano = Faker::Date.birthday
	@placa = 'ABC-1234'
	@km = Faker::Number.decimal(2, 3)
	@valor = Faker::Number.decimal(2, 5)

	page(CadastrarCarro).preencher_cadastro(@modelo,@ano,@placa,@km,@valor)

end

Quando(/^salvar o cadastro$/) do
 	page(CadastrarCarro).salvar_cadastro
end

Então(/^consultar o cadastro realizado$/) do
	page(ConsultaCarro).voltar_home
	page(ConsultaCarro).selecionar_consulta
	page(CadastrarCarro).validar_carro(@placa)
	puts "A placa #{@placa} foi encontrada"
end