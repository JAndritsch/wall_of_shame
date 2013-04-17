require 'spec_helper'

describe Car do

  subject { FactoryGirl.build(:car) }

  describe "attributes" do
    it { should respond_to(:make) }
    it { should respond_to(:model) }
    it { should respond_to(:color) }
    it { should respond_to(:plate_number) }
    it { should respond_to(:plate_state) }
    it { should respond_to(:parking_violations) }
    it { should respond_to(:getty) }
  end

  describe "validations" do
    it { should validate_presence_of(:plate_number) }
    it { should validate_presence_of(:plate_state) }
  end

  describe "#repeat_offender?" do
    it "returns true if a car has violated parking more than once" do
      car = FactoryGirl.create(:car_with_violations)
      expect(car.repeat_offender?).to be_true
    end

    it "returns false if a car has violated parking 1 time" do
      car = FactoryGirl.create(:car_with_violations, violation_count: 1)
      expect(car.repeat_offender?).to be_false
    end

    it "returns false if a car has violated parking 0 times" do
      car = FactoryGirl.create(:car)
      expect(car.repeat_offender?).to be_false
    end

  end

  describe "#parking_violations" do
    it { should have_many(:parking_violations) }
  end

end
