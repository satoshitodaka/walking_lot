class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user] 
    mail(to: @user.email, subject: '散歩くじへようこそ！')
  end

  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)
    mail( to: @user.email, subject: 'パスワードリセット | 散歩くじ')
  end
end
