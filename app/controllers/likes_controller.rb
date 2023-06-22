class LikesController < ApplicationController
  def create
    puts params[:post_id]
    @like = Like.new(author_id: params[:author_id], post: Post.find(params[:post_id]))
    redirect_to user_post_path(id: params[:author_id], post_id: params[:post_id]) if @like.save
  end
end
