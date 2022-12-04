type = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
type_name = %w[お店 カフェ 公園 観光スポット 温泉・銭湯 パン屋 本屋 歴史スポット お寺 神社]

puts 'Start inserting seed "location_type"...'

type.zip(type_name) do | type, name|
  location_type = LocationType.create!(
    location_type: type,
    name: name
  )
  puts "\"#{location_type.name}\" has created!"
end
