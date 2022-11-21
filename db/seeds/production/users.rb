puts 'Start inserting seed "admin user"...'
admin_user = User.create!(
  name: 'admin_user',
  email: Rails.application.credentials.dig(:seed, :admin_mail),
  admin: true,
  password: Rails.application.credentials.dig(:seed, :admin_password),
  password_confirmation: Rails.application.credentials.dig(:seed, :admin_password)
)
puts "\"#{admin_user.name}\" has created!"
