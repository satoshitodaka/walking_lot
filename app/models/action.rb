# == Schema Information
#
# Table name: actions
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default("unapproved"), not null
#  content    :text(65535)      not null
#  released   :boolean          default("unreleased"), not null
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
  has_many :action_location_types, dependent: :destroy
  has_many :lot_actions, dependent: :destroy
  has_many :location_types, through: :action_location_types

  validates :content, presence: true
  validates :released, presence: true
  validates :approved, presence: true

  enum released: { unreleased: false, released: true }
  enum approved: { unapproved: false, approved: true }
end
