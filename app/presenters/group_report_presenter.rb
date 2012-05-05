class GroupReportPresenter < BasePresenter 
  presents :group
  
  def name
    handle_presence group.name do
      h.link_to(group.name, h.admin_group_report_path(group))
    end
  end
end