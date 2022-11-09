# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notification < ApplicationRecord
  has_many :user_notifications, dependent: :destroy
  has_many :users, through: :user_notifications

  validates :title, presence: true
  validates :url, presence: true

  def notify(*user)
    users = user.flatten
    user_notifications = users.pluck(:id).map do |user_id|{ 
      notification_id: id,
      user_id: ,
      created_at: Time.zone.now,
      updated_at: Time.zone.now,
    }
    end
    UserNotification.insert_all(user_notifications, record_timestamps: true)
  end
end

# notification_id: id,
# user_id: 
# created_at: Time.zone.now,
# updated_at: Time.zone.now

# user_notifications.each do |user_notification|
#   puts "#{user_notification.created_at}に作成しました"
# end