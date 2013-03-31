Given /^I am on the home page$/ do
  visit(root_path)
end

Given /^I click the "(.*?)" link$/ do |link_text|
  click_link(link_text)
end

When /^I click the "(.*?)" button$/ do |button_text|
  click_button(button_text)
end

Then /^I should see a success message$/ do
  page.has_css?(".alert-success").should be_true
end
