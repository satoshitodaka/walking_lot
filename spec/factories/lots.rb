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
FactoryBot.define do
  factory :lot do
    start_point_name { "MyString" }
    start_point_address { "MyString" }
    start_point_latitude { 1.5 }
    start_point_longitude { 1.5 }
    destination_name { "MyString" }
    destination_address { "MyString" }
    destination_latitude { 1.5 }
    destination_longitude { 1.5 }
    neaby_locations { "" }
    user { nil }
  end
end
