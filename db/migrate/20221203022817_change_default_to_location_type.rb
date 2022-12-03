class ChangeDefaultToLocationType < ActiveRecord::Migration[7.0]
  def change
    change_column_default :location_types, :location_type, from: 0, to: nil
  end
end
