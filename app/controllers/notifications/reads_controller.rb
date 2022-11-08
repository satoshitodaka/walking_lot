class Notifications::ReadsController < ApplicationController
  before_action :require_login

  def create
    notification = current_user.notifications.find(params[:notification_id])
    user_notification = current_user.user_notifications.find_by!(notification_id: params[:notification_id])
    user_notification.update!(read: true) unless user_notification.read?
    redirect_to notification.url
  end
end
