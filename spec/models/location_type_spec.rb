# == Schema Information
#
# Table name: location_types
#
#  id            :bigint           not null, primary key
#  location_type :integer          default("anywhere"), not null
#  name          :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_location_types_on_location_type  (location_type) UNIQUE
#
require 'rails_helper'

RSpec.describe LocationType, type: :model do
  describe 'バリデーション' do
    it 'ロケーションタイプは必須であること' do
      location_type = build(:location_type, location_type: nil)
      location_type.valid?
      expect(location_type.errors[:location_type]).to include('を入力してください')
    end

    it '名称は必須であること' do
      location_type = build(:location_type, name: nil)
      location_type.valid?
      expect(location_type.errors[:name]).to include('を入力してください')
    end
  end
end
