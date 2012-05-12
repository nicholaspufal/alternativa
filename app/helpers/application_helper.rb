# encoding: utf-8

module ApplicationHelper
  def brazilian_datetime_format(datetime)
    datetime.strftime("%d/%m/%Y %H:%M") if datetime.present?
  end
  
  def go_back_button(text, url, options = {})
    options.merge!({:class => "btn"})
    link_to "<i class='icon-arrow-left'></i> #{text}".html_safe, url, options
  end
    
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
  
  def group_table_generator(exams)
    content_tag :table, :class => "table table-striped table-bordered table-condensed reports_table" do
      content_tag :thead do
        content_tag :tr do
          content_tag :th 
          exams.each do |exam|
            content_tag :th, exam.title
          end
        end
      end
    end
  end
  
end
