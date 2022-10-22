class CreateLots < ActiveRecord::Migration[7.0]
  def change
    create_table :lots, id: false do |t|
      t.string :id,                   limit: 36, null: false, primary_key: true
      t.string :start_point_name
      t.string :start_point_address
      t.float :start_point_latitude,  null: false
      t.float :start_point_longitude, null: false
      t.string :destination_name
      t.string :destination_address
      t.float :destination_latitude
      t.float :destination_longitude
      t.json :neaby_locations
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
