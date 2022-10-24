class CreateActivityLocationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_location_types do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :location_type, null: false, foreign_key: true

      t.timestamps
    end
    add_index :activity_location_types, [:activity_id, :location_type_id], unique: true, name: 'unique_index_on_activity_location_types'
  end
end
