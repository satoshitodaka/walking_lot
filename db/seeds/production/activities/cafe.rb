admin_user = User.admin.first
contents_in_cafe = %w[
  コーヒーとスイーツを買って一休みする
  スペシャリテコーヒーを頼んでみる
]

contents_in_cafe.map do |content|
  puts 'Start inserting seed "activities in cafe"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in cafe"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 2
  )
end