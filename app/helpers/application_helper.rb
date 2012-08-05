# coding: utf-8

module ApplicationHelper
  # actualiza el título del layout
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  # actualiza el título de la página, retornandolo. Ej uso
  # %h2.titulo01= titulo "Título de la página %{@num_pag}"
  def titulo(titulo_pag)
    content_for(:title) { titulo_pag }
    titulo_pag
  end

  # incluye javascript en el layout
  def javascript (*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def link_button(name, url, options = {})
    options[:class] = 'button'
    link_to content_tag(:span, name), url, options
  end
  
  # genera un botón para eliminar vía ajax un subformulario
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(content_tag(:span, name), "remove_fields(this)", :class => 'button')
  end
  
  # genera el select de paginación
  def select_paginacion(per_page)
    paginas = [
      ["5 por pág.", 5],
      ["10 por pág.", 10],
      ["20 por pág.", 20],
      ["50 por pág.", 50],
      ]
    select_tag :per_page, options_for_select(paginas, per_page), {:onchange => 'this.form.submit()'}
  end
  
  # genera un botón para agregar vía ajax un subformulario
  def link_to_add_fields(name, f, association, singularize = true)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      if singularize
        render(association.to_s.singularize + "_fields", :f => builder, :form_disabled => false)
      else
        render(association.to_s + "_fields", :f => builder, :form_disabled => false)
      end
    end
    link_to_function(content_tag(:span, name), "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => 'button', :name => 'test')
  end
  
  # genera un select con los datos del mantenedor
  def manten(f, campo, datos, prompt = nil, opciones = {})
    if prompt
      f.collection_select campo, datos, :valor, :valor, {:prompt => prompt}, opciones
    else
     f.collection_select campo, datos, :valor, :valor, {}, opciones
    end
  end
end
