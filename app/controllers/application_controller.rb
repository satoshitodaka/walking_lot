class ApplicationController < ActionController::Base
  add_flash_types :primary, :success, :info, :warning, :danger

  def not_authenticated
    redirect_to main_app.login_path
  end
end
