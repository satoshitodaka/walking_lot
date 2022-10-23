# == Schema Information
#
# Table name: activity_location_types
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  activity_id      :bigint           not null
#  location_type_id :bigint           not null
#
# Indexes
#
#  index_activity_location_types_on_activity_id       (activity_id)
#  index_activity_location_types_on_location_type_id  (location_type_id)
#  unique_index_on_activity_location_types            (activity_id,location_type_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#  fk_rails_...  (location_type_id => location_types.id)
#
require 'rails_helper'

RSpec.describe ActivityLocationType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
