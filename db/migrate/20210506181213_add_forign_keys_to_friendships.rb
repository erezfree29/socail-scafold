class AddForignKeysToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :friend, foreign_key: { to_table: :users }
    add_reference :friendships, :user, foreign_key: true
  end
end
