module DeviseHelper
  def devise_error_messages!
    render "shared/errors_messages", :object => resource
  end
end