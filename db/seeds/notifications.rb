puts 'Start inserting seed "notifications"...'
10.times do
  notification = Notification.create!(
    title: Faker::Lorem.sentence,
    url: 'http://localhost:3000'
  )
  puts "\"#{notification.title}\" has created!"
end
