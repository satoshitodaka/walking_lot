# app/controllers/password_resets_controller.rb
class PasswordResetsController < ApplicationController

  def new ;end
    
  def create 
    @user = User.find_by_email(params[:email])
    @user.deliver_reset_password_instructions! if @user       
    redirect_to(root_path, :notice => 'ご登録のメールアドレスをご確認ください')
  end
    
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end
      
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    # TODO: パスワード未入力時の挙動を追加する
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to(root_path, :notice => 'パスワードをリセットしました')
    else
      render :edit, status: :unprocessable_entity
    end
  end
end