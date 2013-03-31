require 'spec_helper'

describe ParkingViolation do
  let(:violation) { ParkingViolation.new }

  describe "attributes" do
    it { violation.respond_to?(:created_at).should be_true }
    it { violation.respond_to?(:description).should be_true }
    it { violation.respond_to?(:car).should be_true }
  end

  describe "initialization" do
    let(:car) { Car.new }
    it "accepts a car" do
      violation = ParkingViolation.new(:car => car)
      violation.car.should == car
    end
  end

  describe "validations" do
    let(:car) { Car.new(:getty => true) }
    it "cannot be assigned to a Getty vehicle" do
      violation.car = car
      violation.valid?.should be_false
    end

    it "requires a car" do
      violation.valid?.should be_false
      violation.car = Car.create(:plate_number => "1", :plate_state => "WI")
      violation.valid?.should be_true
    end
  end

end
