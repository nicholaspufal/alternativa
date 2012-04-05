# encoding: utf-8

class Admin::AdminController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!, :check_admin
  
  layout 'admin'
  respond_to :html
  
  protected
  
  def check_admin
    unless current_user.admin?
     redirect_to root_url, :notice => "Você não tem permissão para acessar a administração." 
    end
  end
  
end