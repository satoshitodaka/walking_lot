# puts 'Start inserting seed "action_location_types"...'
# LocationType.all.each do |location_type|
#   action_location_type = location_type.action_location_types.create(
#     action_id: Array.new(Action.count){|n| n }.sample
#   )
#   puts "action_location_type No.#{action_location_type.id} has created!"
# end

puts 'Start inserting seed "action_location_types"...'
Action.all.each do |action|
  action_location_type = action.action_location_types.create(
    location_type_id: Random.rand(0 .. 7),
  )
  puts "action_location_type No.#{action_location_type.id} has created!"
end
