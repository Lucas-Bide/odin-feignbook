class FriendshipsController < ApplicationController
  def destroy
    @friendship1 = Friendship.find(params[:id])
    user = @friendship1.friend_id
    @friendship2 = Friendship.find_by(friend_owner_id: @friendship1.friend_id, friend_id: @friendship1.friend_owner_id)
    @f_request1 = FriendRequest.find_by(receiver_id: @friendship1.friend_id, sender_id: @friendship1.friend_owner_id)
    @f_request2 = FriendRequest.find_by(receiver_id: @friendship1.friend_owner_id, sender_id: @friendship1.friend_id)
    @friendship1.destroy
    @friendship2.destroy
    @f_request1.destroy if @f_request1
    @f_request2.destroy if @f_request2
    redirect_to user_path(user)
  end
end
