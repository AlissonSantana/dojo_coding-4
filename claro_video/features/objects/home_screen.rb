require_relative '../objects/calabash_basic.rb'
require 'calabash-android/operations'

class HomeScreen

  include Calabash::Android::Operations

  def initialize
    @basic = Basic.new
  end

  def menu_principal_botao
    @basic.find_element('android.widget.ImageButton')
  end

  def opcoes_menu
    @basic.find_element("AppCompatCheckedTextView id:'menu_item'")
  end

  def cadastrese_botao
    @basic.find_element("AppCompatCheckedTextView id:'menu_item' text:'Cadastre-se'")
  end

  def cpf_edit_text
    @basic.find_element("AppCompatEditText id:'etCpf'")
  end

  def continuar_botao
    @basic.find_element("AppCompatButton id:'btContinue'")
  end



end
