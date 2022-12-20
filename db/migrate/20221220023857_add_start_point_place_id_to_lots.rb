class AddStartPointPlaceIdToLots < ActiveRecord::Migration[7.0]
  def change
    add_column :lots, :start_point_place_id, :string
  end
end
