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
# Indexes
#
#  index_location_types_on_location_type  (location_type) UNIQUE
#
class LocationType < ApplicationRecord
  has_many :activity_location_types, dependent: :destroy
  has_many :activities, through: :activity_location_types

  validates :location_type, presence: true, uniqueness: true
  validates :name, presence: true

  enum location_type: { 'shop' => 0,
                        'cafe' => 1,
                        'park' => 2,
                        'tourist-attraction' => 3,
                        'public-bath' => 4,
                        'bakery' => 5,
                        'book-store' => 6,
                        'historical-site' => 7,
                        'buddhist-temple' => 8,
                        'shrine' => 9,

  }
end
