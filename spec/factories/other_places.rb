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
FactoryBot.define do
  factory :other_place do
    lot_id { 'MyString' }
    name { 'MyString' }
    address { 'MyString' }
    latitude { 1.5 }
    longitude { 1.5 }
    photo_url { 'MyString' }
  end
end
