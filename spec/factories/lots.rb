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
FactoryBot.define do
  factory :lot do
    start_point_name { 'West Station' }
    start_point_address { Faker::Address.full_address }
    start_point_latitude { Random.rand(35.6..35.7) }
    start_point_longitude { Random.rand(139.70..139.78) }
    destination_name { 'Central Park' }
    destination_address { Faker::Address.full_address }
    destination_latitude { Random.rand(35.6..35.7) }
    destination_longitude { Random.rand(139.70..139.78) }
    neaby_locations { '' }
    user { nil }
  end
end
