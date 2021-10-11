class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  def post_comments(id)
    @post_comment = Comment.where(post_id: id)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @post_comment }
      format.json { render json: @post_comment }
    end
  end

  private

  def timeline_posts
    friends_ids = current_user.friends.pluck(:id)
    @friends_posts = Post.all.ordered_by_most_recent.where(user_id: friends_ids)
    @user_posts = Post.all.ordered_by_most_recent.where(user_id: current_user.id)
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
