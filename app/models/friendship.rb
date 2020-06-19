class Friendship < ApplicationRecord
  belongs_to :friend_owner, class_name: 'User'
  belongs_to :friend, class_name: 'User'
end
