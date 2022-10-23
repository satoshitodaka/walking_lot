# == Schema Information
#
# Table name: activities
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE), not null
#  content    :text(65535)      not null
#  released   :boolean          default(FALSE), not null
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
require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
