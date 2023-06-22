class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    redirect_to user_post_path(id: @comment.post_id) if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.admin? || current_user.id == @comment.author_id
      @comment.destroy
      flash[:success] = 'Comment deleted successfully.'
    else
      flash[:error] = 'You are not authorized to delete this comment.'
    end
    redirect_to user_post_path(@user, params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
