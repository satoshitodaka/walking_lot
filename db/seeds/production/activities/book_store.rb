admin_user = User.admin.first
contents_in_book_store = %w[
  目に止まった本の「はじめに」を読んでみる
  漫画雑誌を立ち読みする
]

contents_in_book_store.map do |content|
  puts 'Start inserting seed "activities in book_store"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in book_store"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 7
  )
end