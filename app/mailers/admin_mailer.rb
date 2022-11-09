class AdminMailer < ApplicationMailer
  default to: -> { User.admin.pluck(:email) },
          from: 'admin_notification@walking_lot.com'
  
  def new_activity
    @user = params[:user]
    @activity = params[:activity]
    mail(subject: '作成されたアクティビティを承認してください')
  end
end
