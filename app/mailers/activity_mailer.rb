class ActivityMailer < ApplicationMailer
  def update_activity
    @activity = params[:activity]
    @user = @activity.user
    @url = mypage_activity_url(@activity)
    mail(to: @activity.user.email, subject: 'あなたのアクティビティが更新されました | 散歩くじ')
  end
end
