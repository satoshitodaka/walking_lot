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
#  destination_place_id  :string(255)
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

  validates :start_point_latitude, presence: { message: 'を登録してください' }
  # 経度のバリデーションは意図的に外した。緯度経度にバリデーションがかかり、エラーメッセージの重複を避けるため

  def get_nearby_locations
    google_map_api_key = Rails.application.credentials.google_map_api_key
    start_point = "#{self.start_point_latitude}" + ',' + "#{self.start_point_longitude}"
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{ start_point }&radius=2000&keyword=#{ self.location_type.location_type }&language=ja&opennow&key=#{ google_map_api_key }"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    self.nearby_locations = JSON.parse(response)
  end

  def set_destination(place_order_numbers)
    destination_informations = nearby_locations['results'][place_order_numbers[0]]

    self.destination_name = destination_informations['name']
    self.destination_address = destination_informations['vicinity']
    self.destination_latitude = destination_informations['geometry']['location']['lat']
    self.destination_longitude = destination_informations['geometry']['location']['lng']
    self.destination_place_id = destination_informations['place_id']

    if destination_informations['photos']
      self.photo_url = destination_informations['photos'][0]['photo_reference']
    end
  end
end
