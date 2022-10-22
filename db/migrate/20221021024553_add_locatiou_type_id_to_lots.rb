class AddLocatiouTypeIdToLots < ActiveRecord::Migration[7.0]
  def change
    add_column :lots, :location_type_id, :bigint, null: false
  end
end
