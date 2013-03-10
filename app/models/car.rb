class Car < ActiveRecord::Base
  has_many :parking_violations
  attr_accessible :make, :model, :color, :plate_number, :plate_state, :getty

  def repeat_offender?
    parking_violations.length > 1
  end

  def getty?
    getty
  end

end
