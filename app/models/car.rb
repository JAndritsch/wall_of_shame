class Car < ActiveRecord::Base
  has_many :parking_violations, :dependent => :destroy
  attr_accessible :make, :model, :color, :plate_number, :plate_state, :getty

  validates :plate_number, :presence => true
  validates :plate_state,  :presence => true

  def repeat_offender?
    parking_violations.length > 1
  end

  def getty?
    getty
  end

end
