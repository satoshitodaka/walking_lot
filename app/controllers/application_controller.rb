class ApplicationController < ActionController::Base
  include Pagy::Backend
  add_flash_types :primary, :success, :info, :warning, :danger

  def not_authenticated
    redirect_to main_app.login_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, warning: exception.message
  end
end
