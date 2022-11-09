class Mypage::NotificationsController < Mypage::BaseController
  def index
    @user_notifications = current_user.user_notifications.includes(:notification).order(created_at: :desc)
  end
end
