puts 'Start inserting seed "activities"...'
10.times do
  User.all.each do |user|
    activity = user.activities.create(
      content: Faker::Lorem.sentence,
    )
    puts "activity \"#{activity.content}\" has created!"
  end
end