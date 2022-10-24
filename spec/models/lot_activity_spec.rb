# == Schema Information
#
# Table name: lot_activities
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :bigint           not null
#  lot_id      :string(255)      not null
#
# Indexes
#
#  index_lot_activities_on_activity_id             (activity_id)
#  index_lot_activities_on_lot_id_and_activity_id  (lot_id,activity_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#
require 'rails_helper'

RSpec.describe LotActivity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
