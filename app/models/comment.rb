class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  has_many :likes, as: :likeable

  validates :body, presence: true
end
