class CreateScooters < ActiveRecord::Migration[5.2]
  def change
    create_table :scooters, id: :uuid do |t|
    	t.float :battery_level
    	t.boolean :active, default: true
    	t.st_point :lonlat, geographic: true
    	t.index :lonlat, using: "gist"
    	t.timestamps
    end
  end
end
