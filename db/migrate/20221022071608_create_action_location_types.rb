class CreateActionLocationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :action_location_types do |t|
      t.references :action, null: false, foreign_key: true
      t.references :location_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
