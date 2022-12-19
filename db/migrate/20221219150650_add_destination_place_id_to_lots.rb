class AddDestinationPlaceIdToLots < ActiveRecord::Migration[7.0]
  def change
    add_column :lots, :destination_place_id, :string
  end
end
