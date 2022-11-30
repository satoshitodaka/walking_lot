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
class OtherPlace < ApplicationRecord
end
