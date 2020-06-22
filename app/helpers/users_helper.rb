module UsersHelper
  def request_sendable?(user)
    fr1 = FriendRequest.find_by(sender_id: current_user.id, receiver_id: user.id)
    fr2 = FriendRequest.find_by(sender_id: user.id, receiver_id: current_user.id)
    !user.friends.include?(current_user) && !fr1 && !fr2
  end

  def friendship(user1, user2)
    Friendship.find_by(friend_owner_id: user1.id, friend_id: user2.id)
  end
end
