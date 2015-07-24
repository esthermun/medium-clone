class PostsController < ApplicationController
  
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    if Profile.exists?(current_user.profile)
      @post.user_id = current_user.id
      if @post.save
        redirect_to @post
      else
        render "new"
      end
    else
      redirect_to new_profile_path
      flash[:notice] = "Create a Profile"
    end
  end

# show one post
  def show
    set_post
    get_profile
  end

# edit my post
  def edit
    set_post
    if current_user.id != @post.user_id
      redirect_to 'public/404.html', status: 404
    end
  end

# update my post
  def update
    set_post
    if current_user.id != @post.user_id
      redirect_to 'public/422.html', status: 422
    else
      if @post.update(post_params)
      flash[:notice] = "Successful"
      else
        flash[:error] = "Error!"
        render "edit"
      end
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

  def set_protected
    if current_user.id != @post.user_id
      redirect_to 'public/422.html'
    end
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
