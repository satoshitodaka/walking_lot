class AddIndexLocationTypeOnLocationTypes < ActiveRecord::Migration[7.0]
  def change
    add_index :location_types, :location_type, unique: true
  end
end
