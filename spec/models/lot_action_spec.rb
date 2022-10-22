# == Schema Information
#
# Table name: lot_actions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  action_id  :bigint           not null
#  lot_id     :string(255)      not null
#
# Indexes
#
#  index_lot_actions_on_action_id  (action_id)
#
# Foreign Keys
#
#  fk_rails_...  (action_id => actions.id)
#
require 'rails_helper'

RSpec.describe LotAction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
