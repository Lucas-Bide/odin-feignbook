class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.references :sender
      t.references :receiver
      t.timestamps
    end
  end
end
