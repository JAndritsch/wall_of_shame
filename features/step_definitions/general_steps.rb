Given /^I am on the home page$/ do
  visit(root_path)
end

Given /^I click the "(.*?)" link$/ do |link_text|
  click_link(link_text)
end

Then /^I should be on the new violation page$/ do
  current_path.should match(new_parking_violation_path)
end
