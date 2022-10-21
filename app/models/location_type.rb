# == Schema Information
#
# Table name: location_types
#
#  id            :bigint           not null, primary key
#  location_type :integer          not null
#  name          :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class LocationType < ApplicationRecord
  validates :location_type, presence: true
  validates :name, presence: true

  enum location_type: { cafe: 0,
                        park: 1,
                        tourist_attraction: 2,
                        spa: 3,
                        bakery: 4,
                        book_store: 5,
                        store: 6,
                        hindu_temple: 7
  }
end
