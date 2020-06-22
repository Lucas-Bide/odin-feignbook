class CommentsController < ApplicationController
  def create
    @comment = Post.find(params[:post_id]).comments.build(body: params[:body], author_id: current_user.id)
    @comment.save
    redirect_to Post.find(params[:post_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if params[:like]
      like = @comment.likes.create(user_id: current_user.id)
    elsif params[:dislike]
      like = @comment.likes.find_by(user_id: current_user.id)
      like.destroy
    end
    redirect_to @comment.post
  end
end
