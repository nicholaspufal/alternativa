module ExamsHelper
  
  def link_to_add_fields(name, f, association, options={})  
    new_object = f.object.class.reflect_on_association(association).klass.new
    
    if new_object.is_a?(Question)
      4.times do 
        new_object.answers << Answer.new
      end
    end
    
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|          
      render(association.to_s.singularize + "_fields", :builder => builder)  
    end  
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")".html_safe, options)  
  end
  
end


