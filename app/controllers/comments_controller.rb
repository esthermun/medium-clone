class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end
	
	def create
		@post = Post.find(params[:post_id])
		unless user_signed_in? && current_user.id != @post.user_id
			redirect_to '/422'
		else 
			@comment = @post.comments.create(comment_params).order(created_at: :desc)
			@comment.user_id = current_user.id
			@comment.save
			redirect_to @post
		end	
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
