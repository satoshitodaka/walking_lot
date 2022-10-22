puts 'Start inserting seed "action_location_types"...'
LocationType.all.each do |location_type|
  action_location_type = location_type.action_location_types.create(
    action_id: Array.new(Action.count){|n| n }.sample
  )
  puts "action_location_type No.#{action_location_type.id} has created!"
end