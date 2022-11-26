class AdminMailer < ApplicationMailer
  default to: -> { User.admin.pluck(:email) }

  def new_activity
    @user = params[:user]
    @activity = params[:activity]
    mail(subject: '作成されたアクティビティを承認してください')
  end
end
