class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  belongs_to :friend_requests, class_name: 'User', foreign_key: 'user_id'

  def confirm_friend
    update(confirmed: true)
    Friendship.create!(friend_id: user_id,
                       user_id: friend_id,
                       confirmed: true)
  end
end
