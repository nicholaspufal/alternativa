module ApplicationHelper
  def nl_to_br(text)
    text.gsub(/\n/,"<br/>").html_safe
  end
  
  def presenter(object, klass = nil) 
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
