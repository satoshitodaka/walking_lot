puts 'Start inserting seed "user_notifications"...'
User.all.each do |user|
  user_notification = user.user_notifications.create!(
    notification_id: Random.rand(1..10)
  )
  puts "user_notification No.#{user_notification.id} has created!"
end