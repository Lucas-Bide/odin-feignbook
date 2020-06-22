class FriendRequestsController < ApplicationController
  def index
    @requests = FriendRequest.where(receiver_id: current_user.id, declined_accepted: false)
  end

  def create
    @request  = FriendRequest.create(sender_id: current_user.id, receiver_id: params[:user_id])
    redirect_to User.find(params[:user_id])
  end

  def update
    @request = FriendRequest.find(params[:id])
    if params[:accept]
      @request.declined_accepted = true
      Friendship.create(friend_owner_id: current_user.id, friend_id: @request.sender_id)
      Friendship.create(friend_owner_id: @request.sender_id, friend_id: current_user.id)
    else
      @request.declined_accepted = true
    end
    @request.save
    redirect_to user_friend_requests_path(current_user)
  end
end
