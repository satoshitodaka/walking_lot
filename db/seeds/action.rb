puts 'Start inserting seed "actions"...'
User.limit(5).each do |user|
  action = user.actions.create(
    content: Faker::Lorem.sentence,
    released: false,
    approved: false,
  )
  puts "action \"#{action.content}\" has created!"
end