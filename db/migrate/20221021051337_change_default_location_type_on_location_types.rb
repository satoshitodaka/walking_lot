class ChangeDefaultLocationTypeOnLocationTypes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :location_types, :location_type, from: nil, to: 0
  end
end
