class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :station_name
      t.string :category
      t.string :phone_number
      t.string :store_name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :business_hours
      t.string :HP
      t.text :text
      t.integer :favorite_flag
      t.string :size

      t.timestamps
    end
  end
end
