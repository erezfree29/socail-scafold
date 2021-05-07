class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  # all the users friends
  def friends
    friends_i_sent_invitation_to = Friendship.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation_from = Friendship.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation_to + friends_i_got_invitation_from
    User.where(id: ids)
  end

  # users that have yet to confirm friend requests
  def pending_friends
    ids = Friendship.where(user_id: id, confirmed: false).pluck(:friend_id)
    User.where(id: ids)
  end

  # Users who have requested to be friends
  def friend_requests
    ids = Friendship.where(friend_id: id, confirmed: false).pluck(:user_id)
    User.where(id: ids)
  end

  # check if user is a friend
  def friends_with(user)
    Friendship.select(:friend_id).where(user_id: id).pluck(:friend_id).include?(user.id)
  end
end
