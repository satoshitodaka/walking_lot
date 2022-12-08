class AdminMailer < ApplicationMailer
  default to: -> { User.admin.pluck(:email) }

  def approval_required
    @user = params[:user]
    @activity = params[:activity]
    @url = admin_activity_url(@activity)
    mail(subject: 'アクティビティを承認してください | 散歩くじ')
  end
end
