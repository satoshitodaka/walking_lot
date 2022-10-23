class Mypage::ActionsController < ApplicationController
  def new
    @action = Action.new
  end

  def create
    logger.debug(params)
    @action = current_user.actions.new(action_params)

    if @action.save
      redirect_to root_path, success: 'アクションを作成しました。公開まで少々お待ちください' # ここのリダイレクト先は修正する。
    else
      flash.now[:danger] = 'アクションの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

    def action_params
      params.require(:action).permit(:content, { location_type_ids: [] }).merge(released: false, approved: false)
    end
end
