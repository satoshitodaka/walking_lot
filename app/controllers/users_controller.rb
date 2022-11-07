class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to root_path, success: 'ユーザー登録が完了しました'
    else
      flash.now[:danger] = 'ユーザー作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation).merge(admin: false)
    end
end
