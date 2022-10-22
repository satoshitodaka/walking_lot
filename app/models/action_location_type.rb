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
#  index_action_location_types_on_action_id         (action_id)
#  index_action_location_types_on_location_type_id  (location_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (action_id => actions.id)
#  fk_rails_...  (location_type_id => location_types.id)
#
class ActionLocationType < ApplicationRecord
  belongs_to :action
  belongs_to :location_type
end
