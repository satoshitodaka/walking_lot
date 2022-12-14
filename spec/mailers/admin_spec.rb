require 'rails_helper'

RSpec.describe AdminMailer, type: :mailer do
  describe 'アクティビティ新規作成時' do
    let!(:user) { create(:user) }
    let!(:admin_user) { create(:user, admin: true) }
    let!(:activity) { create(:activity, user: user) }
    let!(:mail) { AdminMailer.with(user: user, activity: activity).approval_required }
    it '管理者に承認依頼通知メールが送信される' do
      expect(mail.subject).to eq 'アクティビティを承認してください | 散歩くじ'
      expect(mail.to).to eq [admin_user.email]
      expect(mail.from).to eq ['support@walking-lot.com']
      expect(mail.body).to match("#{user.name}さんがアクティビティを作成（更新）しました。ログインして承認・公開してください。")
    end
  end
end
