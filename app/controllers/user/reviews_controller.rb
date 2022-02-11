class User::ReviewsController < ApplicationController

  def new
    @review = Review.new
    @genres = Genre.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to reviews_path
  end

  def index
    @genres = Genre.all
    #ジャンルの名前リンクから飛んできたかの確認
    if params[:genre_id]
      genre = Genre.find(params[:genre_id])
      @reviews = Review.where(genre_id:genre.id).page(params[:page]).per(15).order(created_at: :desc)
    elsif params[:keyword]
      #検索窓で入力された値をkeywordに代入
      keyword = params[:keyword]
      @reviews = Review.search(keyword).page(params[:page]).per(15)
    else
    @reviews = Review.page(params[:page]).per(15).order(created_at: :desc)
    end

  end

  def show
    @review = Review.find(params[:id])
    @comments = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
    @genres = Genre.all
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end


  private

  def review_params
    params.require(:review).permit(:user_id, :genre_id, :title, :image, :good_point, :bad_point, :evaluation)
  end


end

