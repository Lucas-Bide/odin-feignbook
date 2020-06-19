class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, uniqueness: true

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :friend_owners, through: :friendships

  has_many :posts
  has_many :comments
  has_many :likes

  has_many :friend_requests
  has_many :receivers, through: :friend_requests
  has_many :senders, through: :friend_requests
end
