class User::GuestsController < ApplicationController
  # ゲストサインイン
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to reviews_path
  end
end
