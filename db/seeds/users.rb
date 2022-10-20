puts 'Start inserting seed "users"...'
3.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    admin: false,
    password: 'password',
    password_confirmation: 'password'
  )
  puts "\"#{user.name}\" has created!"
end
