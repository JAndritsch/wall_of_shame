class ParkingViolationsController < ApplicationController
  def index
    @parking_violation = ParkingViolation.new
  end
end
