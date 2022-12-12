class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  validates :title, presence: true, length: { minimum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true }, comparison: {greater_than_or_equal_to: 0}

  private

  def update_post_counter
    post.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
