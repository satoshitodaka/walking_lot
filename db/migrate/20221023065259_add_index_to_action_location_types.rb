class AddIndexToActionLocationTypes < ActiveRecord::Migration[7.0]
  def change
    add_index :action_location_types, [:action_id, :location_type_id], unique: true
  end
end
