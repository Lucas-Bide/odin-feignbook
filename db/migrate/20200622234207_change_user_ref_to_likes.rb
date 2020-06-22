class ChangeUserRefToLikes < ActiveRecord::Migration[6.0]
  def change
    change_column_null :likes, :user_id, true
  end
end
