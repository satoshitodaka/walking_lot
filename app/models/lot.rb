# == Schema Information
#
# Table name: lots
#
#  id                    :string(36)       not null, primary key
#  destination_address   :string(255)
#  destination_latitude  :float(24)
#  destination_longitude :float(24)
#  destination_name      :string(255)
#  nearby_locations      :json
#  photo_url             :string(255)
#  start_point_address   :string(255)
#  start_point_latitude  :float(24)        not null
#  start_point_longitude :float(24)        not null
#  start_point_name      :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  location_type_id      :bigint           not null
#  user_id               :bigint
#
# Indexes
#
#  index_lots_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Lot < ApplicationRecord
  include IdGenerator
  belongs_to :user, optional: true
  belongs_to :location_type
  has_one :lot_activity, dependent: :destroy
  has_one :activity, through: :lot_activity
  has_many :other_places, dependent: :destroy

  validates :user, presence: true, if: :user_id?
  validates :start_point_latitude, presence: { message: "を登録してください" } 
  # 経度のバリデーションは意図的に外した。緯度経度にバリデーションがかかり、エラーメッセージの重複を避けるため

  after_create :create_lot_activity
  after_create :create_other_places

  def get_nearby_locations
    google_map_api_key = Rails.application.credentials.google_map_api_key
    start_point = "#{self.start_point_latitude}" + ',' + "#{self.start_point_longitude}"
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{ start_point }&radius=2000&keyword=#{ self.location_type.location_type }&language=ja&opennow&key=#{ google_map_api_key }"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    # debugger
    self.nearby_locations = JSON.parse(response)
  end

  def set_destination
    # 行先を含む場所をランダムで3つ選択し、番号を配列@place_order_numbersに格納する。OtherPlacesを作成する時もこの変数を使用する。
    @place_order_numbers = set_place_order_number(self)
    destination_informations = self.nearby_locations['results'][@place_order_numbers[0]]

    self.destination_name = destination_informations['name']
    self.destination_address = destination_informations['vicinity']
    self.destination_latitude = destination_informations['geometry']['location']['lat']
    self.destination_longitude = destination_informations['geometry']['location']['lng']

    if destination_informations['photos']
      self.photo_url = destination_informations['photos'][0]['photo_reference']
    elsif destination_informations['photos'].nil?
      self.photo_url = 'no_image'
    end
  end

  private

  def create_lot_activity
    LotActivity.create(
      lot_id: self.id,
      activity_id: Activity.get_same_location_type_activities(self.location_type).available.sample.id
    )
  end

  def create_other_places
    # 寄り道スポットの数を取得
    other_place_count = @place_order_numbers.size - 1
    return if other_place_count == 0
    [*1 .. other_place_count].each do |i|
      other_place_informations = self.nearby_locations['results'][@place_order_numbers[i]]
      other_place = OtherPlace.create(
        lot_id: self.id,
        place_number: @place_order_numbers[i],
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

  def set_place_order_number(lot)
    place_order_numbers = Array.new
    loop do
      place_order_numbers << Random.rand(0 .. lot.nearby_locations['results'].size - 1)
      place_order_numbers.uniq!
      # 配列の数が3つ（行き先の1つ+OtherPlace用の2つ）になるか、nearby_searchの結果と配列の数が同数になれば終了
      break if place_order_numbers.count == 3 || place_order_numbers.count == lot.nearby_locations['results'].size
    end
    place_order_numbers
  end
end
