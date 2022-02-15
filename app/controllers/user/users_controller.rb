class User::UsersController < ApplicationController
  before_action :authenticate_user!

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

end
