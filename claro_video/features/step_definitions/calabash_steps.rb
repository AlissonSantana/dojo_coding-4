require 'calabash-android/calabash_steps'

Dado(/^que acesse a tela de cadastro com um cpf válido$/) do
  sleep 10
  @actions = Basic.new
  @home_screen = HomeScreen.new

  @actions.touch_element @home_screen.menu_principal_botao
  @actions.touch_element @home_screen.cadastrese_botao
  @actions.fill_text_field(@home_screen.cpf_edit_text, Faker::CPF.numeric)
  @actions.touch_element @home_screen.continuar_botao
end

Quando(/^efetuo o cadastro$/) do
  @cadastro_screen = CadastroScreen.new
  @primeiro_nome = Faker::Name.first_name
  @sobrenome = Faker::Name.last_name
  @email = Faker::Internet.email
  @cadastro_screen.cadastro_usuario(@email, ENV['SENHA'], @primeiro_nome, @sobrenome)
end

Então(/^verifico que o nome do usuário é exibido no menu$/) do
  sleep 6
  @actions.touch_element @home_screen.menu_principal_botao
  @actions.touch_element @home_screen.menu_principal_botao
  expect(@home_screen.opcoes_menu.first['text']).to eq "#{@primeiro_nome} #{@sobrenome}"
end
