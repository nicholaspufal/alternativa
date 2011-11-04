module ApplicationHelper
  def nl_to_br(text)
    text.gsub(/\n/,"<br/>").html_safe
  end
end
