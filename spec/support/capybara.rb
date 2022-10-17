Capybara.default_max_wait_time = 5
Capybara.server = :puma, { Silent: true }

options = ::Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--window-size=1680,1050')
options.add_argument('--disable-gpu')
options.add_argument('--disable-dev-shm-usage')

if ENV['SELENIUM_DRIVER_URL']
  Capybara.register_driver :remote_chrome do |app|
    url = ENV['SELENIUM_DRIVER_URL']
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: url,
      options: options
    )
  end
  Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
  Capybara.server_port = 3001
  Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
else
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      timeout: ENV.fetch('CAPYBARA_TIMEOUT') { 10 },
      options: options
    )
  end
end

Capybara.javascript_driver = ENV['SELENIUM_DRIVER_URL'] ? :remote_chrome : :selenium_chrome_headless

RSpec.configure do |config|
  config.before(:each, type: :system) do |_example|
    driven_by Capybara.javascript_driver
  end
end