admin_user = User.admin.first
contents_in_park = %w[
  ベンチに座って一休みする
  公園を1周する
  ブランコに揺られてみる
]

contents_in_park.map do |content|
  puts 'Start inserting seed "activities in park"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in park"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 3
  )
end
