# == Schema Information
#
# Table name: actions
#
#  id         :bigint           not null, primary key
#  approved   :string(255)      default("0"), not null
#  content    :text(65535)      not null
#  released   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_actions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Action < ApplicationRecord
  belongs_to :user
end
