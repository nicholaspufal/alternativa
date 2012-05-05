class ActionNotImplemented < StandardError; end

class Admin::ReportsController < Admin::AdminController
  def index
    raise ActionNotImplemented
  end
  
  def show 
    raise ActionNotImplemented
  end
end