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
FactoryBot.define do
  factory :other_place do
    place_number { 1 }
    lot_id { 'MyString' }
    name { 'MyString' }
    address { 'MyString' }
    latitude { 1.5 }
    longitude { 1.5 }
    photo_url { 'MyString' }
  end
end
