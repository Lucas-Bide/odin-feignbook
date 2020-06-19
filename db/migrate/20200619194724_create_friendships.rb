class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :friend_owner
      t.references :friend
      t.timestamps
    end
  end
end
