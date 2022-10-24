class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.text :content, null: false
      t.boolean :released, default: false, null: false
      t.boolean :approved, default: false, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
