class User::GuestsController < ApplicationController

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to reviews_path
  end

end
