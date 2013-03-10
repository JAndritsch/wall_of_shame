class ParkingViolation < ActiveRecord::Base
  attr_accessible :car
  validate :not_a_getty_car
  belongs_to :car

  def not_a_getty_car
    if car.getty?
      errors.add(:car, "Cannot assign a parking violation to a Getty car")
    end
  end
end
