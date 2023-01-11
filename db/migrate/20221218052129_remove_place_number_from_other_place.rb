class RemovePlaceNumberFromOtherPlace < ActiveRecord::Migration[7.0]
  def change
    remove_index :other_places, [:lot_id, :place_number], unique: true
    remove_column :other_places, :place_number, :integer
  end
end
