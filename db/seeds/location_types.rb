type = [0, 1, 2, 3, 4, 5, 6, 7]
type_name = %w[どこでも カフェ 公園 観光スポット 温泉 パン屋 本屋 神社・寺]

puts 'Start inserting seed "location_type"...'

type.zip(type_name) do | type, name|
  location_type = LocationType.create!(
    location_type: type,
    name: name
  )
  puts "\"#{location_type.name}\" has created!"
end
