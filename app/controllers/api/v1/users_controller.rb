module Api
  module V1
    class UsersController < ApiController
      skip_before_action :authenticate_user!
      def user_posts
        user = User.find(params[:id])
        result = user.posts
        render json: { message: 'success', posts: result }
      end

      def post_comments
        post = Post.find_by(id: params[:post_id])
        render json: { message: 'success', comments: post.comments }
      end

      def create_comments
        @comment = Comment.new(text: params[:text])
        @comment.author_id = params[:id]
        @comment.post = Post.find(params[:post_id])
        if @comment.save
          render json: { status: 'Success', data: @comment }
        else
          render json: { status: 'Failure', error: @comment.errors.full_messages }
        end
      end
    end
  end
end
