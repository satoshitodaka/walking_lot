puts 'Start inserting seed "activity_location_types"...'
Activity.all.each do |activity|
  activity_location_type = activity.activity_location_types.create(
    location_type_id: Random.rand(0 .. 7),
  )
  puts "activity_location_type No.#{activity_location_type.id} has created!"
end