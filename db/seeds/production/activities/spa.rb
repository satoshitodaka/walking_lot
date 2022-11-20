admin_user = User.admin.first
contents_in_spa = %w[
  温泉（または銭湯）に入る
  温泉（または銭湯）に入って牛乳を飲む
  温泉（または銭湯）に入ってコーヒー牛乳を飲む
  温泉（または銭湯）に入ってコーヒー牛乳を飲む
]

contents_in_spa.map do |content|
  puts 'Start inserting seed "activities in spa"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in spa"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 3
  )
end