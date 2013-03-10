class CreateParkingViolations < ActiveRecord::Migration
  def change
    create_table :parking_violations do |t|
      t.string :color
      t.string :make
      t.string :model
      t.string :license
      t.text :description

      t.timestamps
    end
  end
end
