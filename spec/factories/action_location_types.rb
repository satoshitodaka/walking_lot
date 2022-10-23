# == Schema Information
#
# Table name: action_location_types
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  action_id        :bigint           not null
#  location_type_id :bigint           not null
#
# Indexes
#
#  index_action_location_types_on_action_id                       (action_id)
#  index_action_location_types_on_action_id_and_location_type_id  (action_id,location_type_id) UNIQUE
#  index_action_location_types_on_location_type_id                (location_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (action_id => actions.id)
#  fk_rails_...  (location_type_id => location_types.id)
#
FactoryBot.define do
  factory :action_location_type do
    action { nil }
    location_type { nil }
  end
end
