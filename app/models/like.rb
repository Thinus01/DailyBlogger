class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likes_counter)
  end
end
