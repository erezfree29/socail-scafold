class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @pending_friends = current_user.pending_friends
    @requesting_friends = current_user.friend_requests
  end

  def friend_request
     @friendship = Friendship.new
      if !current_user.sent_request_pending?(User.find(params[:user_id])) &&  current_user.id != params[:id].to_i
        @friendship = Friendship.new(friendship_params)
        if  @friendship.save
          @friendship.update(confirmed:false)
          redirect_to user_path(current_user), flash: {success: 'request sent'}
        end
      else
        redirect_to user_path(current_user), flash: {error: 'request already sent'}
      end
  end

  def approve
    Friendship.where(user_id:params[:friend_id],friend_id:params[:user_id]).update(confirmed:true)
    redirect_to user_path(current_user), flash: {success: 'you have confirmed the friend request'}
  end

  def reject
    redirect_to user_path(current_user), flash: {success: 'you have rejected the friend request'}
  end

  private
  def friendship_params
    pending = { :user_id => current_user.id, :friend_id => params[:user_id]}
  end
end

