class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # サインアップ画面のエラー回避の為のアクションです。
  def dummy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    # ユーザーネームが”ゲストユーザー”の場合、ユーザー詳細ページに飛ぶ
    if @user.name == "ゲストユーザー"
      redirect_to user_path(current_user)
    end
  end
end
