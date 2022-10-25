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
  has_many :activity_location_types, dependent: :destroy
  has_many :location_types, through: :activity_location_types
  has_many :lot_activities, dependent: :destroy
  has_many :lots, through: :lot_activities

  validates :content, presence: true
  validates :released, presence: true
  validates :approved, presence: true

  scope :get_same_location_type_activities, -> (location_type)  { joins(:activity_location_types).where(activity_location_types: { location_type_id: location_type }) }

  enum released: { unreleased: false, released: true }
  enum approved: { unapproved: false, approved: true }
end
