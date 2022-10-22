class CreateLotActions < ActiveRecord::Migration[7.0]
  def change
    create_table :lot_actions do |t|
      t.references :action, null: false, foreign_key: true
      t.string :lot_id, null:false, foreign_key: true

      t.timestamps
    end
  end
end
