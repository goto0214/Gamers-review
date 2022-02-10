class Review < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  attachment :image

  #検索のメソッド
  #打ち込まれた文字を部分一致でレビューの中から探す。
  def self.search(keyword)
    @review = Review.where("title LIKE?","%#{keyword}%")
  end


end
