# encoding: utf-8

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
  
  def flash_messages
    flash.collect do |key, message|
      css_class = (key == :alert) ? "alert alert-error" : "alert alert-success"  
      content_tag :div, :id => key, :class => css_class do
        concat(link_to "×", "#", :class => "close", :"data-dismiss" => "alert")
        concat(message)
      end
    end.join.html_safe
  end
end
