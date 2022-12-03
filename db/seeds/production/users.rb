puts 'Start inserting seed "admin user"...'
admin_user = User.create!(
  name: 'admin_user',
  email: 'sample_admin@walking-lot.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password'
)
puts "\"#{admin_user.name}\" has created!"