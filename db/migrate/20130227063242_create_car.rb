class CreateCar < ActiveRecord::Migration
  def up
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.string :license
      t.timestamps
    end
  end

  def down
    drop_table :cars
  end
end
