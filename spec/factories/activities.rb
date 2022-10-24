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
FactoryBot.define do
  factory :activity do
    content { 'MyText' }
    released { false }
    approved { false }
    user { nil }
  end
end
