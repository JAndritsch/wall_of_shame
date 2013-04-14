class ParkingViolation < ActiveRecord::Base
  validates :car, :presence => true
  validates :car_id, :presence => true
  validate :not_a_getty_car
  has_attached_file :photo
  attr_accessible :car, :description, :photo
  attr_accessible :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
  belongs_to :car
  accepts_nested_attributes_for :car

  def not_a_getty_car
    if car && car.getty?
      errors.add(:car, "Cannot assign a parking violation to a Getty car")
    end
  end
end
