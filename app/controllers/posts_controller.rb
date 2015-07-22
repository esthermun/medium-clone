class PostsController < ApplicationController
  
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

# to show 
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @profile.update(profile_params)
      #need a success alert
      redirect_to @post
    else
      #need a failed attempt message
      render "edit"
    end
  end

  def index
  	@posts = Post.all
  end

  private
  def post_params
  	params.require(:post).permit(:title, :content)
  end

end
