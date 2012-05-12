#encoding: utf-8

class BasePresenter
  def initialize(object, template)
    @object = object
    @template = template    
  end
  
  class << self
    
    def handle_presence_of(*args)
      args.each do |arg|
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{arg}
            handle_presence @object.#{arg}
          end
        RUBY
      end
    end
    
    def bool_to_text(*args)
      args.each do |arg|
        class_eval <<-RUBY
          def #{arg}
            @object.#{arg} ? "Sim" : "Não"
          end
        RUBY
      end
    end
    
  end

  private
  
  def h
    @template
  end 
  
  def self.presents(*name)
    name.each do |name|
      define_method(name) do
        @object
      end
    end
  end
  
  def method_missing(*args, &block)
    @object.send(*args, &block)
  end
  
  def handle_presence(attribute)
    if attribute.present? && block_given?
      yield
    elsif attribute.present?
      attribute
    else
      "Não informado"
    end
  end
  
  def brazilian_datetime_format(datetime)
    datetime.strftime("%d/%m/%Y %H:%M") if datetime.present?
  end

end