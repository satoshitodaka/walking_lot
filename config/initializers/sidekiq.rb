Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

require 'sidekiq/web'
Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV['SIDEKIQ_ADMIN_BASIC_AUTH_USER'], ENV['SIDEKIQ_ADMIN_BASIC_AUTH_PASSWORD']]
end
