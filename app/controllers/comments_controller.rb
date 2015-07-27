class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end
	
	def create
		@post = Post.find(params[:post_id])
		unless user_signed_in? && current_user.id != @post.user_id
			redirect_to '/422'
		else 
			@comment = @post.comments.create(comment_params)
			@comment.user_id = current_user.id
			@profile = Profile.find_by_user_id(@comment.user_id)
			if @comment.save
				flash[:notice] = "Comment successfully posted."
				redirect_to @post
			else 
				flash[:alert] = "Comment not posted. Try again."
				redirect_to @post
			end
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
