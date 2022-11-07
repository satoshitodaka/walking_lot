class Mypage::BaseController < ApplicationController
  before_action :require_login
  # マイページ用のサイドバーを表示させるため
  layout 'mypage/layouts/application'
end
