class User::ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :user_or_admin, only: [:destroy]
  def new
    @review = Review.new
    @genres = Genre.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to reviews_path
    else
      @genres = Genre.all
      render :new
    end
  end

  def index
    @genres = Genre.all
    # ↓ジャンルの名前リンクから飛んできた場合
    if params[:genre_id]
      genre = Genre.find(params[:genre_id])
      @reviews = Review.where(genre_id: genre.id).page(params[:page]).per(15).order(created_at: :desc)
    # ↓検索窓に文言を入力してきた場合
    elsif params[:keyword]
      # 検索窓で入力された値をkeywordに代入
      keyword = params[:keyword]
      @reviews = Review.search(keyword).page(params[:page]).per(15)
    # ↓タグのリンクから飛んできた場合
    elsif params[:tag_name]
      @reviews = Review.tagged_with("#{params[:tag_name]}").page(params[:page]).per(15)
    else
      @reviews = Review.page(params[:page]).per(15).order(created_at: :desc)
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @report = Report.new
  end

  def edit
    @review = Review.find(params[:id])
    @genres = Genre.all
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :genre_id, :title, :image, :good_point, :bad_point, :evaluation, :tag_list)
  end

  # ユーザーサインインもしくは管理者にサインインしてなければトップページに
  def user_or_admin
    if !user_signed_in? && !admin_signed_in?
      redirect_to root_path
    end
  end
end
