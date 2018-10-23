class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :station_name
      t.string :large_category
      t.string :small_category
      t.string :store_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :business_hours
      t.string :regular_holiday

      t.timestamps
    end
  end
end
