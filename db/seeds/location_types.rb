location_type = [1, 2, 3, 4, 5, 6]
location_name = %w[cafe, park, tourist_attraction, spa, bakery, book_store, hindu_temple]

puts 'Start inserting seed "location_type"...'

location_type = location_type.zip(location_name) do | type, name|
  LocationType.create!(
    location_type: type,
    name: name
  )
  puts "\"#{location_type.name}\" has created!"
end