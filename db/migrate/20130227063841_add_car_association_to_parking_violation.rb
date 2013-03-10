class AddCarAssociationToParkingViolation < ActiveRecord::Migration
  def change
    add_column :parking_violations, :car_id, :integer
  end
end
