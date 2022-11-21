admin_user = User.admin.first
contents_in_anywhere = %w[
  近くの人にお願いしてピン写真を撮ってもらう
  近くの人にお願いしてツーショット写真を撮ってもらう
  近くを歩いて変わったものを探す
  近くでおやつを買って一休みする
  ガリガリ君を買って一休みする
  近くで炭酸飲料を買って一気飲みする
  お水を飲んで一休みする
  誰かに突然電話して、他愛もない話をする
  探偵のフリをして周りの様子を伺う
]

contents_in_anywhere.map do |content|
  puts 'Start inserting seed "activities in anywhere"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in anywhere"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 1
  )
end