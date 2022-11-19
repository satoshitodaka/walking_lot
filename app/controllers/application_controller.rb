class ApplicationController < ActionController::Base
  add_flash_types :primary, :success, :info, :warning, :danger

  def not_authenticated
    redirect_to main_app.login_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, warning: exception.message
  end

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end
end
