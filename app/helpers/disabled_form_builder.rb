# esta clase deshabilita todos los text_field y transforma los collection_selection a text_fields deshabilitados
class DisabledFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    options[:disabled]= true
    super
  end
  
  def text_area(attribute, options={})
    options[:disabled]= true
    super
  end
  
  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    options[:disabled] = true
    text_field(method, options)
  end
  
  def check_box(attribute, options={})
    options[:disabled] = true
    super    
  end
  
  def file_field(method, options = {}) 
    options[:disabled]= true
    text_field(method, options)
    super
  end
end