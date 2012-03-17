Quando /^eu clico "(.*)"$/ do |value|
  begin
    click_button value
  rescue 
    click_link value
  end
end