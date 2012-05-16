#encoding: utf-8

class RegistrationsController < Devise::RegistrationsController
  
  protected
  
  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : root_path
  end
  
  def after_sign_up_path_for(resource)
    new_user_session_path
  end
  
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end
end