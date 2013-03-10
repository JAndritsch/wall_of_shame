require 'spec_helper'

describe Car do
  let(:car) { Car.new }
  
  describe "attributes" do
    it { car.respond_to?(:make).should be_true }
    it { car.respond_to?(:model).should be_true }
    it { car.respond_to?(:color).should be_true }
    it { car.respond_to?(:plate_number).should be_true }
    it { car.respond_to?(:plate_state).should be_true }
    it { car.respond_to?(:parking_violations).should be_true }
    it { car.respond_to?(:getty?).should be_true }
  end

  describe "repeat_offender?" do
    it "returns true if a car has violated parking more than once" do
      car.stub(:parking_violations).and_return(["a", "b", "c"])
      car.repeat_offender?.should be_true
    end

    it "returns false if a car has violated parking 1 time" do
      car.stub(:parking_violations).and_return(["a"])
      car.repeat_offender?.should be_false
    end

    it "returns false if a car has violated parking 0 times" do
      car.stub(:parking_violations).and_return([])
      car.repeat_offender?.should be_false
    end

  end

end
