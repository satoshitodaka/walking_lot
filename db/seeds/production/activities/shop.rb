admin_user = User.admin.first
contents_in_shop = %w[
  お店に入ってお気に入りを探す
  お店で気に入ったものを購入する
  近くの人にお願いしてピン写真を撮ってもらう
  近くの人にお願いしてツーショット写真を撮ってもらう
  近くを歩いて変わったものを探す
  近くでおやつを買って一休みする
  近くでガリガリ君を買って一休みする
  近くで炭酸飲料を買って一気飲みする
  近くでお水を飲んで一休みする
  誰かに突然電話して、他愛もない話をする
  探偵のフリをして周りの様子を伺う
  100mほどの後向きで歩いてみる
]

contents_in_shop.map do |content|
  puts 'Start inserting seed "activities in shop"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in shop"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 1
  )
end