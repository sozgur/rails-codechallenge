class RenameBatteryColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :scooters, :batery_level, :battery_level
  end
end
