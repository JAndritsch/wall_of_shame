Then /^the new car should have been created$/ do
  @new_car = Car.find(:first, :conditions => {
    :plate_number => @new_plate_number,
    :plate_state => @new_plate_state
  })
  @new_car.should_not be_nil
end

Then /^I should be editing the new car$/ do
  current_path.should match(edit_car_path(@new_car))
end

Given /^there is a car$/ do
  @existing_plate_number = "test123"
  @existing_plate_state  = "WI"
  @existing_car = Car.create(:plate_number => @existing_plate_number, :plate_state => @existing_plate_state)
end

Given /^the car already has a violation$/ do
  violation = ParkingViolation.create
  @existing_car.parking_violations << violation
  @existing_car.save
end
