require 'calabash-android/operations'

class Basic

  include Calabash::Android::Operations

  def find_element(element, time_out=5)
    wait_for_elements_exist(element, timeout: time_out)
    return query(element)
  rescue => e
    raise "Não foi possível encontrar o campo: #{element}!\nErro: #{e.message}"
  end

  def fill_text_field(element, text, time_out=5)
    touch(element)
    keyboard_enter_text(text)
    hide_soft_keyboard
  rescue => e
    raise "Erro ao preencher campo #{element}.\nErro: #{e.message}"
  end

  def touch_element(element, time_out=5)
    touch(element)
    hide_soft_keyboard
  rescue => e
    raise "Erro ao pressionar elemento: #{element}.\nErro: #{e.message}"
  end

end
