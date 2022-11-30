require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'Welcomeメール' do
    let!(:user) { create(:user) }
    let!(:mail) { UserMailer.with(user: user).welcome_email }

    it 'Welcomeメールがユーザーに送信される' do
      expect(mail.to).to eq [user.email]
      expect(mail.from).to eq ['support@walking-lot.com']
      expect(mail.subject).to eq '散歩くじへようこそ！'
      expect(mail.body).to match user.name
    end
  end
end
