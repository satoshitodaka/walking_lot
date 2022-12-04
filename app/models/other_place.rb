# == Schema Information
#
# Table name: other_places
#
#  id           :bigint           not null, primary key
#  address      :string(255)      not null
#  latitude     :float(24)        not null
#  longitude    :float(24)        not null
#  name         :string(255)      not null
#  photo_url    :string(255)
#  place_number :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lot_id       :string(255)      not null
#
# Indexes
#
#  index_other_places_on_lot_id_and_place_number  (lot_id,place_number) UNIQUE
#
class OtherPlace < ApplicationRecord
  belongs_to :lot

  validates :place_number, presence: true, uniqueness: { scope: :lot_id }
  validates :name, presence: true
  validates :address, presence: true

  private
    def self.create_with_lot(lot, place_order_numbers)
      # 寄り道スポットの数を取得
      other_place_count = place_order_numbers.size - 1
      return if other_place_count == 0
      [*1 .. other_place_count].each do |i|
        other_place_informations = lot.nearby_locations['results'][place_order_numbers[i]]
        other_place = OtherPlace.create(
          lot_id: lot.id,
          place_number: place_order_numbers[i],
          name: other_place_informations['name'],
          address: other_place_informations['vicinity'],
          latitude: other_place_informations['geometry']['location']['lat'],
          longitude: other_place_informations['geometry']['location']['lng']
        )

        if other_place_informations['photos']
          other_place.update(photo_url: other_place_informations['photos'][0]['photo_reference'])
        elsif other_place_informations['photos'].nil?
          other_place.update(photo_url: 'no_image')
        end
      end
    end
end
