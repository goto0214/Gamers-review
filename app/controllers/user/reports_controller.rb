class User::ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :user_or_admin?, only: [:destroy]

  def create
    review = Review.find(params[:review_id])
    report = current_user.reports.new(report_params)
    report.review_id = review.id
    report.save
    redirect_to review_path(params[:review_id])
  end

  def destroy
    Report.find_by(id: params[:id]).destroy
    redirect_to review_path(params[:review_id])
  end

  private

  def report_params
    params.require(:report).permit(:report_text)
  end

  def user_or_admin?
    # ユーザーもしくは管理者でログインしているか？
    if !user_signed_in? && !admin_signed_in?
      redirect_to root_path
    end
  end
end
