Then /^I should see the parking violation form$/ do
  page.should have_css("#new_parking_violation")
end

When /^I fill out the violation form for the new car$/ do
  @new_plate_number = "QWERTY123"
  @new_plate_state  = "WI"
  fill_in("car_plate_number", :with => @new_plate_number)
  fill_in("car_plate_state", :with => @new_plate_state)
  fill_in("violation_description", :with => "This person parked like a jerk.")
end

When /^I fill out the violation form for the existing car$/ do
  fill_in("car_plate_number", :with => @existing_plate_number)
  fill_in("car_plate_state", :with => @existing_plate_state)
  fill_in("violation_description", :with => "This person just doesn't get it")
end

Then /^I should be on the new violation page$/ do
  current_path.should match(new_parking_violation_path)
end

Then /^I should be on the violations page$/ do
  current_path.should match(parking_violations_path)
end

Then /^the new car should have "(.*?)" parking violations?$/ do |count|
  @new_car.parking_violations.count.should == count.to_i
end

Then /^the existing car should have "(.*?)" parking violations?$/ do |count|
  @existing_car.parking_violations.count.should == count.to_i
end
