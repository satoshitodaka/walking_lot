# == Schema Information
#
# Table name: activities
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
#  index_activities_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Activity < ApplicationRecord
  belongs_to :user
  has_many :acivity_location_types, dendent: :destroy
  has_many :location_types, through: :acivity_location_types

  validates :content, presence: true
  validates :released, presence: true
  validates :approved, presence: true

  enum released: { unreleased: false, released: true }
  enum approved: { unapproved: false, approved: true }
end
