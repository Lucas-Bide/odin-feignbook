class AddColToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_pic, :string, default: 'default_pfp.png'
  end
end
