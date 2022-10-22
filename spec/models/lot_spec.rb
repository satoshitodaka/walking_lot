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
require 'rails_helper'

RSpec.describe Lot, type: :model do
  describe 'バリデーション' do
    it 'スタート地点の緯度は必須であること' do
      lot = build(:lot, start_point_latitude: nil)
      lot.valid?
      expect(lot.errors[:start_point_latitude]).to include('を入力してください')
    end

    it 'スタート地点の軽度は必須であること' do
      lot = build(:lot, start_point_longitude: nil)
      lot.valid?
      expect(lot.errors[:start_point_longitude]).to include('を入力してください')
    end
  end
end
