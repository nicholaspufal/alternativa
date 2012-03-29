class ActionView::Helpers::FormBuilder
  alias :orig_label :label

  # add a '*' after the field label if the field is required
  def label(method, text = nil, options = {}, &block)
    content = text unless text.nil?
    
    required_mark = ''
    required_mark = ' *'.html_safe if object.class.validators_on(method).map(&:class).include? ActiveModel::Validations::PresenceValidator

    content ||= I18n.t("activerecord.attributes.#{object.class.name.underscore}.#{method}", :default => method.to_s.humanize)
    content += required_mark

    self.orig_label(method, content, options || {}, &block)
  end
end