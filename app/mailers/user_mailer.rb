class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user] 
    mail(to: @user.email, subject: '散歩くじへようこそ！')
  end
end