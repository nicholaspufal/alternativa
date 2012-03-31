class Admin::AdminController < ActionController::Base
  protect_from_forgery
  
  layout 'admin'
  respond_to :html
end