admin_user = User.admin.first
contents_in_book_store = %w[
  お参りしてお賽銭を5円投げる
  手水舎で清める
  鐘を撞く
  御朱印をいただく
  お線香を炊く
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
    location_type_id: 9
  )
end