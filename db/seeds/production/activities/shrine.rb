admin_user = User.admin.first
contents_in_book_store = %w[
  一礼をして鳥居をくぐる
  おみくじを買って「みくじ結び所」に結ぶ
]

contents_in_book_store.map do |content|
  puts 'Start inserting seed "activities in book_store"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in shrine"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 10
  )
end