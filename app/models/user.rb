# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  admin            :boolean          default(FALSE), not null
#  crypted_password :string(255)
#  email            :string(255)      not null
#  name             :string(255)      not null
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :lots, dependent: :destroy
  has_many :activities, dependent: :nullify
  has_many :user_notifications, dependent: :destroy
  has_many :notifications, through: :user_notifications
  has_one_attached :avatar

  before_create :default_avatar

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :avatar, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }

  scope :admin, -> { where(admin: true) }

  private
    def default_avatar
      return if avatar.attached?
      avatar.attach(io: File.open(Rails.root.join('app/assets/images/default_avatar.png')), filename: 'default_avatar.png')
    end
end
