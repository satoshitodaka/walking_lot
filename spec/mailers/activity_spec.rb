require "rails_helper"

RSpec.describe ActivityMailer, type: :mailer do
  describe 'update activity mail' do
    let!(:user) { create(:user) }
    let!(:activity) { create(:activity, user: user) }
    let!(:mail) { ActivityMailer.with(activity: activity).update_activity }

    it 'メールが正しく作成されること' do
      expect(mail.to).to eq [user.email]
      expect(mail.from).to eq ['support@walking-lot.com']
      expect(mail.subject).to eq 'あなたのアクティビティが更新されました | 散歩くじ'
      expect(mail.body).to match [user.name]
      expect(mail.body).to match ['あなたのアクティビティが更新（承認・公開）されました。']
    end
  end
end
