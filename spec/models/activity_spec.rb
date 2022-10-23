# == Schema Information
#
# Table name: activities
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default("unapproved"), not null
#  content    :text(65535)      not null
#  released   :boolean          default("unreleased"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_activities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Activity, type: :model do

  describe 'バリデーション' do
    let(:user) { create(:user) }

    it 'コンテンツが必須であること' do
      activity = build(:activity, content: nil, user: user)
      activity.valid?
      expect(activity.errors[:content]).to include('を入力してください')
    end

    it 'Userが必須であること' do
      activity = build(:activity, user: nil)
      activity.valid?
      expect(activity.errors[:user]).to include('を入力してください')
    end
  end
end
