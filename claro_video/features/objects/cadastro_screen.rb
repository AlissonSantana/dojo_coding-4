require_relative '../objects/calabash_basic.rb'
require 'calabash-android/operations'

class CadastroScreen

  include Calabash::Android::Operations

  def initialize
    @basic = Basic.new
  end

  def email_edit
    @basic.find_element("AppCompatEditText id:'edit_email'")
  end

  def repetir_email_edit
    @basic.find_element("AppCompatEditText id:'edit_email_repeat'")
  end

  def senha_edit
    @basic.find_element("AppCompatEditText id:'edit_password'")
  end

  def repetir_senha_edit
    @basic.find_element("AppCompatEditText id:'edit_password_repeat'")
  end

  def nome_edit
    @basic.find_element("AppCompatEditText id:'edit_name'")
  end

  def sobrenome_edit
    @basic.find_element("AppCompatEditText id:'edit_surname'")
  end

  def aceito_termos_chk
    @basic.find_element("AppCompatCheckBox id:'checkbox_terms'")
  end

  def seguinte_btn
    @basic.find_element("AppCompatButton id:'btn_continue'")
  end

  def cadastro_usuario(email, senha, nome, sobrenome)
    @basic.fill_text_field(email_edit, email)
    @basic.fill_text_field(repetir_email_edit, email)
    @basic.fill_text_field(senha_edit, senha)
    @basic.fill_text_field(repetir_senha_edit, senha)
    @basic.fill_text_field(nome_edit, nome)
    @basic.fill_text_field(sobrenome_edit, sobrenome)
    @basic.touch_element aceito_termos_chk
    @basic.touch_element seguinte_btn
  rescue => e
    raise "Erro ao efetuar cadastro do usuário.\nErro: #{e}"
  end


end
