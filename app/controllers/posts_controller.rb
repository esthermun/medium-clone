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
    @profile = current_user.profile 
  end

# show one post
  def show
    set_post
    get_profile
  end

# edit my post
  def edit
    set_post
  end
# update my post
  def update
    set_post
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
  def set_post
    @post = Post.find(params[:id])
  end

  def get_profile
    @id = @post.user_id
    @profile = Profile.find_by_user_id(@id)
  end

  def match_profile
    @posts = Post.all
    
  end

  def post_params
  	params.require(:post).permit(:title, :content, :image)
  end

end
