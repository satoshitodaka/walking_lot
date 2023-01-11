class AddDirectionsResponseToLots < ActiveRecord::Migration[7.0]
  def change
    add_column :lots, :direnctions_api_response, :json
    add_column :lots, :time_required, :string
  end
end
