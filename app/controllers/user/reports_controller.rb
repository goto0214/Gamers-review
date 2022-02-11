class User::ReportsController < ApplicationController

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

end
