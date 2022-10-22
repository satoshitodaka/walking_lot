class CreateLocationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :location_types do |t|
      t.integer :location_type, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
