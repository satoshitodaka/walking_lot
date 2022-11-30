class CreateOtherPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :other_places do |t|
      t.integer :place_number, null: false
      t.string :lot_id, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :photo_url

      t.timestamps
    end
    add_index :other_places, [:lot_id, :place_number], unique: true
  end
end
