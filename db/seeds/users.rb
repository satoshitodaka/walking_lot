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

puts 'Start inserting seed "admin user"...'
admin_user = User.create!(
  name: Faker::Name.name,
  email: 'satoshitodaka0705@gmail.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password'
)
puts "\"#{admin_user.name}\" has created!"
