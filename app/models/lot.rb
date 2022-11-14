# == Schema Information
#
# Table name: lots
#
#  id                    :string(36)       not null, primary key
#  destination_address   :string(255)
#  destination_latitude  :float(24)
#  destination_longitude :float(24)
#  destination_name      :string(255)
#  neaby_locations       :json
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

  validates :user, presence: true, if: :user_id?
  validates :start_point_latitude, presence: true
  validates :start_point_longitude, presence: true

  after_create :create_lot_activity

  def get_neaby_locations
    google_map_api_key = Rails.application.credentials.google_map_api_key
    start_point = "#{self.start_point_latitude}" + ',' + "#{self.start_point_longitude}"
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{ start_point }&radius=3000&type=#{ self.location_type.location_type }&language=ja&opennow&key=#{ google_map_api_key }"
    uri = URI.parse(url)
    response = Net::HTTP.get(uri)
    self.neaby_locations = JSON.parse(response)
  end

  def set_destination
    order_number = Random.rand(1 .. 18)
    destination_infomations = self.neaby_locations['results'][order_number]

    self.destination_name = destination_infomations['name']
    self.destination_address = destination_infomations['vicinity']
    self.destination_latitude = destination_infomations['geometry']['location']['lat']
    self.destination_longitude = destination_infomations['geometry']['location']['lng']
    self.photo_url = destination_infomations['photos'][0]['photo_reference']
  end
  
  private
    def create_lot_activity
      LotActivity.create(
        lot_id: self.id,
        activity_id: Activity.get_same_location_type_activities(self.location_type).sample.id
      )
    end
end
