admin_user = User.admin.first
contents_in_bakery = %w[
  クロワッサンを買って近くで食べる
  サンドイッチを買って近くで食べる
  塩パンを買って近くで食べる
  カレーパンを買って近くで食べる
  メロンパンを買って近くで食べる
  あんパンを買って近くで食べる
  焼きそばパンを買って近くで食べる
  ピザパンを買って近くで食べる
  トングをカチカチ鳴らす
  パンを1,000円ほど大人買いする
  店員さんに一番人気のパンを聞いて買う
  店員さんに個人的に一番好きなパンを聞いて買う
]

contents_in_bakery.map do |content|
  puts 'Start inserting seed "activities in bakery"...'
  activity = Activity.create(
    content: ,
    user_id: admin_user.id,
    released: true,
    approved: true
  )
  puts 'Start inserting seed "activity_location_types in bakery"...'
  activity_location_type = activity.activity_location_types.create(
    location_type_id: 6
  )
end