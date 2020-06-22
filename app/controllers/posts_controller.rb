class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = User.find(current_user.id).posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'posts/new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.where(author_id: current_user.id).or(Post.where(author_id: current_user.friend_ids)).order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'posts/edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
