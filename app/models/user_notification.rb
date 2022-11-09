# == Schema Information
#
# Table name: user_notifications
#
#  id              :bigint           not null, primary key
#  read            :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notification_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_user_notifications_on_notification_id              (notification_id)
#  index_user_notifications_on_notification_id_and_user_id  (notification_id,user_id) UNIQUE
#  index_user_notifications_on_user_id                      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (notification_id => notifications.id)
#  fk_rails_...  (user_id => users.id)
#
class UserNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification

  validates :read, inclusion: { in: [true, false] }
  validates :notification_id, uniqueness: { scope: :user_id }

  delegate :title, to: :notification, prefix: :true
  delegate :url, to: :notification, prefix: :true
end
