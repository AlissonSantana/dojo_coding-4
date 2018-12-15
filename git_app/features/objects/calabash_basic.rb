require 'calabash-android/operations'

class Basic

include Calabash::Android::Operations

  def click_element_by_text(texto)
    touch(query("* text:'#{texto}'"))
  end

  def find_element_by_id(element)
    return query("* id:'#{element}'")
  end

  def scroll_down_by_element_id(element_id)
    scroll("* id:'#{element_id}'", :down)
  end

  def find_project(nome)
    list = query("*")
    list.each do |item|
      return true if item['text'] == nome
    end
    false
  end

  def scroll_until_find_text(texto, element_id)
    while true
      if find_project(texto)==true
        break
      else
        scroll_down_by_element_id(element_id)
      end
    end
  end

  def get_text_elements_by_id(element_id)
    lista = []
    elements = query("AppCompatTextView id:'#{element_id}'")
    elements.each do |item|
      lista << item['text']
    end
    lista
  end

  def info_project_body
    return {"nome"=> '', "fork"=> '', "star"=> ''}
  end

  def merge_project_fork_star_info(nomes, forks, stars)
    lista = Array.new(nomes.count-1)
    for i in 0..nomes.count-2
      project_body = self.info_project_body
      project_body['nome'] = nomes[i]
      project_body['fork'] = forks[i]
      project_body['star'] = stars[i]
      lista[i] = project_body
    end
    lista
  end

end
