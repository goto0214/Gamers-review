class Admin::HomesController < ApplicationController
  before_action :admin_signed_in_or_root

  def top
  end

  private

  def admin_signed_in_or_root
    unless admin_signed_in?
      #管理者ログインしていない場合はtopページに行く
      redirect_to root_path
    end
  end

end
