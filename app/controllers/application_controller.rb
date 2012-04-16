class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!
  
  respond_to :html
  
  protected
  
  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : root_path
  end
  
end
