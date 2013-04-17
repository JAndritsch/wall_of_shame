require 'spec_helper'

describe ParkingViolation do

  subject { FactoryGirl.build(:parking_violation) }

  describe "attributes" do
    it { should respond_to(:created_at) }
    it { should respond_to(:description) }
    it { should respond_to(:car) }
  end

  describe "associations" do
    it { should belong_to(:car) }
    it { should allow_mass_assignment_of(:car) }
  end

  describe "validations" do
    let(:car) { Car.new(:getty => true) }

    it { should validate_presence_of(:car) }

    it "cannot be assigned to a Getty vehicle" do
      subject.car = car
      expect(subject).to_not be_valid
    end
  end

end
