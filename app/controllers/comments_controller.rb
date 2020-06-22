class CommentsController < ApplicationController
  def create
    @comment = Post.find(params[:post_id]).comments.build(body: params[:body], author_id: current_user.id)
    @comment.save
    redirect_to Post.find(params[:post_id])
  end
end
