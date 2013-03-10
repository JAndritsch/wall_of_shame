class RemoveExtraColumnsFromParkingViolation < ActiveRecord::Migration
  def up
    remove_column :parking_violations, :color
    remove_column :parking_violations, :make
    remove_column :parking_violations, :model
    remove_column :parking_violations, :license
  end

  def down
  end
end
