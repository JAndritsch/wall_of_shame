class AddPlateStuffToCar < ActiveRecord::Migration
  def change
    remove_column :cars, :license
    add_column :cars, :plate_number, :string
    add_column :cars, :plate_state, :string
  end
end
