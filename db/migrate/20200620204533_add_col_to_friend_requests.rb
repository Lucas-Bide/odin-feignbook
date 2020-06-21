class AddColToFriendRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :friend_requests, :declined_accepted, :boolean, default: false
  end
end
