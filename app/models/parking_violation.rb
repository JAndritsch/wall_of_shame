class ParkingViolation < ActiveRecord::Base
  attr_accessible :car, :description
  validates :car, :presence => true
  validates :car_id, :presence => true
  validate :not_a_getty_car
  belongs_to :car

  def not_a_getty_car
    if car && car.getty?
      errors.add(:car, "Cannot assign a parking violation to a Getty car")
    end
  end
end
