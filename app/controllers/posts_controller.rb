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

# to show all my posts
  def user_posts
    @posts = current_user.posts
  end

# show one post
  def show
    #@user = User.find_by_id(params[:user_id])
    #@posts = @user.posts
    @post = Post.find(params[:id])
  end

# edit my post
  def edit
    @post = Post.find(params[:id])
  end
# update my post
  def update
    #@posts = current_user.posts
    @post = Post.find(params[:id])
    if @post.update(post_params)
      #need a success alert
      redirect_to @post
    else
      #need a failed attempt message
      render "edit"
    end
  end

#show all posts from all users
  def index
  	@posts = Post.all
  end

  private
  def post_params
  	params.require(:post).permit(:title, :content)
  end

end
