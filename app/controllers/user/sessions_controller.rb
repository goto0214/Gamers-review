# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # ログイン後、トップページに遷移。
  def after_sign_in_path_for(resource)
    root_path
  end

  # ログアウト後、トップページに遷移
  def after_sign_out_path_for(resource)
    reviews_path
  end
end
