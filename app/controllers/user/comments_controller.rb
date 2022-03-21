class User::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :user_or_admin?, only: [:destroy]

  def create
    review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_params)
    comment.review_id = review.id
    if comment.save
      @review = review
      #ヴァリデーションに引っかかった場合
    else
      @review = review
      @comments = Comment.new
      @report = Report.new
      render 'user/reviews/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    @review = Review.find(params[:review_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def user_or_admin?
    if !user_signed_in? && !admin_signed_in?
      redirect_to root_path
    end
  end
end
