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
require 'rails_helper'

RSpec.describe OtherPlace, type: :model do
  # let!(:lot) = { create(:lot) }
  describe 'バリデーション' do
    it 'lot_idが必須であること' do
      other_place = build(:other_place, lot_id: nil)
      other_place.valid?
      expect(other_place.errors[:lot]).to include('を入力してください')
    end

    it 'nameが必須であること' do
      other_place = build(:other_place, name: nil)
      other_place.valid?
      expect(other_place.errors[:name]).to include('を入力してください')
    end

    it 'addressが必須であること' do
      other_place = build(:other_place, address: nil)
      other_place.valid?
      expect(other_place.errors[:address]).to include('を入力してください')
    end

    it 'place_numberが必須であること' do
      other_place = build(:other_place, place_number: nil)
      other_place.valid?
      expect(other_place.errors[:place_number]).to include('を入力してください')
    end

    xit 'lot_idとplace_numberの組み合わせが一意であること' do
      other_place = build(:other_place, lot_id: 'sample1', place_number: 1)
      other_place.valid?
      expect(other_place.errors[:place_number]).to include('はすでに存在します')
    end
  end
end
