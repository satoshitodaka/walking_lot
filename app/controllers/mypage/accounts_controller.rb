class Mypage::AccountsController < Mypage::BaseController
  def show
    @user = User.find(current_user.id)
    # 作成したくじの一覧
    @q = @user.lots.ransack(params[:q])
    @pagy, @lots = pagy(@q.result(distinct: true).order(created_at: :desc))
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if @user.update(profile_params)
      redirect_to mypage_account_path, success: 'プロフィールを更新しました'
    else
      flash.now[:warning] = 'プロフィールの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(current_user.id)
    user.destroy!
    redirect_to root_path, success: 'ユーザー情報を削除しました。ご利用ありがとうございました。'
  end

  private

    def profile_params
      params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation).merge(admin: false)
    end
end
