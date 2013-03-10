require 'spec_helper'

describe ParkingViolation do
  let(:pv) { ParkingViolation.new }

  describe "attributes" do
    it { pv.respond_to?(:created_at).should be_true }
    it { pv.respond_to?(:description).should be_true }
    it { pv.respond_to?(:car).should be_true }
  end

  describe "initialization" do
    let(:car) { nil }
    it "accepts a car" do
      pv = ParkingViolation.new(:car => car)
      pv.car.should == car
    end
  end

  describe "validations" do
    let(:car) { Car.new(:getty => true) }
    it "cannot be assigned to a Getty vehicle" do
      pv.car = car
      pv.valid?.should be_false
    end
  end

end
