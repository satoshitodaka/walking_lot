# Userに紐づくLot
puts 'Start inserting seed "lots"...'
User.limit(3).each do |user|
  lot = user.lots.create(
    start_point_name: Faker::Address.city,
    start_point_address: Faker::Address.full_address,
    start_point_latitude: Random.rand(35.6..35.7),
    start_point_longitude: Random.rand(139.70..139.78),
    destination_name: Faker::Address.city,
    destination_address: Faker::Address.full_address,
    destination_latitude: Random.rand(35.6..35.7),
    destination_longitude:  Random.rand(139.70..139.78),
  )
  puts "lot for \"#{lot.destination_name}\" has created!"
end

# Userに紐付かないLot
puts 'Start inserting seed "lots"...'
5.times do
  lot = Lot.create(
    start_point_name: Faker::Address.city,
    start_point_address: Faker::Address.full_address,
    start_point_latitude: Random.rand(35.6..35.7),
    start_point_longitude: Random.rand(139.70..139.78),
    destination_name: Faker::Address.city,
    destination_address: Faker::Address.full_address,
    destination_latitude: Random.rand(35.6..35.7),
    destination_longitude:  Random.rand(139.70..139.78),
  )
  puts "lot for \"#{lot.destination_name}\" has created!"
end