require 'rails_helper'

RSpec.describe "ログイン", type: :system do
  let(:user) { create(:user) }
  describe 'ログイン機能' do
    let(:user) { create(:user) }
    context '入力内容に誤りがある場合' do
      it 'エラーメッセージが表示されること' do
        visit '/login'
        within '#login-form' do
          fill_in 'メールアドレス', with: 'wrong@sample.com'
          fill_in 'パスワード', with: 'hogehoge'
          click_on 'ログイン'
        end
        expect(page).to have_content 'ログインに失敗しました'
      end
    end

    context '入力内容が正しい場合' do
      it 'ログインができること' do
        visit '/login'
        within '#login-form' do
          fill_in 'メールアドレス', with: user.email
          fill_in 'パスワード', with: 'password' 
          click_on 'ログイン'
        end
        expect(page).to have_content 'ログインしました'
      end
    end
  end

  describe 'ログアウト機能' do
    before do
      login_as(user)
    end
    it 'ログアウトできること' do
      find('#header-avatar-dropdown').click
      accept_confirm { click_on 'ログアウト' }
      expect(page).to have_content 'ログアウトしました'
    end
  end
end
