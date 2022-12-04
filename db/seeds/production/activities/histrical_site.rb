admin_user = User.admin.first
contents_in_book_store = %w[
  敷地内をゆっくり歩いてまわる
  案内板を丁寧に読む
  パンフレットをもらう
  帰宅した後、歴史スポットの内容を家族に話す
]

contents_in_book_store.map do |content|
  puts 'Start inserting seed "activities in book_store"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in buddhist_temple"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 8
  )
end