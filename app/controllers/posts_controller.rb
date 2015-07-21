class PostsController < ApplicationController
  
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new()
  	@post.user_id = current_user.id
  end

  def show
  end

  def index
  	@posts = Post.all
  end

  private
  def post_params
  	params.require(:post).permit(:title, :content)
  end
end
