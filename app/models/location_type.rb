# == Schema Information
#
# Table name: location_types
#
#  id            :bigint           not null, primary key
#  location_type :integer          default("anywhere"), not null
#  name          :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_location_types_on_location_type  (location_type) UNIQUE
#
class LocationType < ApplicationRecord
  validates :location_type, presence: true, uniqueness: true
  validates :name, presence: true

  enum location_type: { anywhere: 0,
                        cafe: 1,
                        park: 2,
                        tourist_attraction: 3,
                        spa: 4,
                        bakery: 5,
                        book_store: 6,
                        hindu_temple: 7
  }
 
end
