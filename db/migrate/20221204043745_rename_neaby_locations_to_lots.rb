class RenameNeabyLocationsToLots < ActiveRecord::Migration[7.0]
  def change
    rename_column :lots, :neaby_locations, :nearby_locations
  end
end
