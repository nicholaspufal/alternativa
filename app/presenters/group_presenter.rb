#encoding: utf-8

class GroupPresenter < BasePresenter 
  presents :group
  
  def name
    handle_presence group.name do
      h.link_to(group.name, h.edit_admin_group_path(group))
    end
  end
  
  def created_at
    "#{h.time_ago_in_words(group.created_at)} atrás"
  end
  
end