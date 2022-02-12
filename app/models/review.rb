class Review < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  attachment :image

  #↓バリデーション
  validates :title, presence: true
  validates :good_point, presence: true, length: { minimum: 30 }
  validates :bad_point, presence: true, length: { minimum: 30 }
  validates :evaluation, presence: true

  #検索のメソッド
  #打ち込まれた文字を部分一致でレビューの中から探す。
  def self.search(keyword)
    @review = Review.where("title LIKE?","%#{keyword}%")
  end

  #ユーザーが通報を既にしているか？
  def reported_by?(user)
     reports.where(user_id: user.id).exists?
  end


end
