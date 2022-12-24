class User < ApplicationRecord
#   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    Include default devise modules. Others available are:
    :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   before_save :skip_confirmation!
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable
   has_many :posts, foreign_key: :author_id
   has_many :comments, foreign_key: :author_id
   has_many :likes, foreign_key: :author_id

   validates :name, presence: true
   validates :postscounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

   def recent_posts
     posts.order(created_at: :desc).last(3)
   end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  after_save :add_token

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def admin?
    is? :admin
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def add_token
    update_column(:authentication_token, ApiHelper::JsonWebToken.encode(email))
  end
end
