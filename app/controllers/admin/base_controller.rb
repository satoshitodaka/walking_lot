class Admin::BaseController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_user.admin?
      redirect_to root_path, warning: '権限を確認してください'
    end
  end
end
