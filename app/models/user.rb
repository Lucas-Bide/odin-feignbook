class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: true

  has_many :friendships, foreign_key: :friend_owner_id
  has_many :friends, class_name: 'User', through: :friendships

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes

  has_many :friend_requests, foreign_key: :receiver_id
  has_many :senders, class_name: 'User', through: :friend_requests
end
