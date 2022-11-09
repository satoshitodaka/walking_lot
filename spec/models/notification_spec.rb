# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe '#notify' do
    let!(:notification) { create(:notification) }

    context '通知先が1名の場合' do
      let!(:user) { create(:user) }
      it '通知が作成されること' do
        expect { notification.notify(user) }.to change { UserNotification.count }.by(1)
      end
    end

    context '通知先が複数名の場合' do
      let!(:users) { create_list(:user, 10) }
      it '通知が作成されること' do
        expect { notification.notify(users) }.to change { UserNotification.count }.by(10)
      end
    end
  end
end
