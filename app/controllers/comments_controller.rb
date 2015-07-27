class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:notice] = "New comment successfully posted"
			redirect_to @post
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
