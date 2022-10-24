class CreateLotActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :lot_activities do |t|
      t.references :activity, null: false, foreign_key: true
      t.string :lot_id, null:false, foreign_key: true

      t.timestamps
    end
    add_index :lot_activities, [:lot_id, :activity_id], unique: true
  end
end
