class AddGettyToCar < ActiveRecord::Migration
  def change
    add_column :cars, :getty, :boolean
  end
end
