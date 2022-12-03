admin_user = User.admin.first
contents_in_tourist_attraction = %w[
  近辺で写真を10枚撮る
  美味しそうなものを探して食べる
  近くのショップをぶらぶら見てまわる
  写真を撮ってSNSに投稿する
]

contents_in_tourist_attraction.map do |content|
  puts 'Start inserting seed "activities in tourist_attraction"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in tourist_attraction"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 4
  )
end