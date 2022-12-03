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
FactoryBot.define do
  factory :location_type do
    location_type { 0 }
    name { 'どこでも' }
  end
end
