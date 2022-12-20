# == Schema Information
#
# Table name: other_places
#
#  id         :bigint           not null, primary key
#  address    :string(255)      not null
#  latitude   :float(24)        not null
#  longitude  :float(24)        not null
#  name       :string(255)      not null
#  photo_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lot_id     :string(255)      not null
#
class OtherPlace < ApplicationRecord
  belongs_to :lot

  validates :name, presence: true
  validates :address, presence: true

  private

    def self.create_with_lot(lot)
      # 出発地点と目的地の中間地点を取得
      middle_point_latitude = (lot.start_point_latitude + lot.destination_latitude) / 2
      middle_point_longitude = (lot.start_point_longitude + lot.destination_longitude) / 2
      middle_point = "#{middle_point_latitude},#{middle_point_longitude}"

      google_map_api_key = Rails.application.credentials.google_map_api_key
      url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{ middle_point }&radius=1000&language=ja&opennow&key=#{ google_map_api_key }"
      uri = URI.parse(url)
      response = Net::HTTP.get(uri)
      other_place_options = JSON.parse(response)

      return unless other_place_options['status'] = 'OK' # statusがOK以外であれば離脱

      # OtherPlaceのレスポンスの個数
      other_place_options_count = other_place_options['results'].count

      # 使用するOtherPlaceのための配列を作成
      other_place_order_numbers = Array.new
      loop do
        other_place_order_numbers << Random.rand(0 .. other_place_options_count - 1)
        other_place_order_numbers.uniq!
        # 配列の数が2つになるか、nearby_searchの結果と配列の数が同数になれば終了
        break if other_place_order_numbers.count == 2 || other_place_order_numbers.count == other_place_options_count
      end

      [*0 .. other_place_order_numbers.count - 1].each do |i|
        other_place_informations = other_place_options['results'][other_place_order_numbers[i]]
        debugger
        other_place = OtherPlace.create(
          lot_id: lot.id,
          name: other_place_informations['name'],
          address: other_place_informations['vicinity'],
          latitude: other_place_informations['geometry']['location']['lat'],
          longitude: other_place_informations['geometry']['location']['lng']
        )

        if other_place_informations['photos']
          other_place.update(photo_url: other_place_informations['photos'][0]['photo_reference'])
        end
      end
    end
end
