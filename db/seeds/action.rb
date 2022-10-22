puts 'Start inserting seed "actions"...'
User.all.each do |user|
  action = user.actions.create(
    content: Faker::Lorem.sentence,
    released: false,
    approved: false,
  )
  puts "action \"#{action.content}\" has created!"
end