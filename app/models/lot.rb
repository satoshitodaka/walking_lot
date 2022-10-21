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
#  start_point_address   :string(255)
#  start_point_latitude  :float(24)        not null
#  start_point_longitude :float(24)        not null
#  start_point_name      :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
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

  validates :user, presence: true, if: :user_id?
  validates :start_point_latitude, presence: true
  validates :start_point_longitude, presence: true

  before_create :get_neaby_locations
  before_create :set_neaby_locations
  before_create :set_destination

  private
    def get_neaby_locations
      google_map_api_key = Rails.application.credentials.google_map_api_key
      start_point = "#{self.start_point_latitude}" + ',' + "#{self.start_point_longitude}"
      url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{ start_point }&radius=3000&language=ja&key=#{ google_map_api_key }"
      uri = URI.parse(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def set_neaby_locations
      self.neaby_locations = get_neaby_locations
    end

    def set_destination
      order_number = Random.rand(1 .. 18)
      destination_infomations = self.neaby_locations['results'][order_number]

      self.destination_name = destination_infomations['name']
      self.destination_address = destination_infomations['vicinity']
      self.destination_latitude = destination_infomations['geometry']['location']['lat']
      self.destination_longitude = destination_infomations['geometry']['location']['lng']
    end
end
