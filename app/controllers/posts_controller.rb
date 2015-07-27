class PostsController < ApplicationController
  
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    if Profile.exists?(current_user.profile)
      @post.user_id = current_user.id
      if @post.save
        flash[:notice] = "New post has been successfully created"
        redirect_to @post
      else
        render "new"
      end
    else
      flash[:alert] = "Please create a profile before writing a post"
      redirect_to new_profile_path
    end
  end

# show one post
  def show
    set_post
    get_profile
  end

  def index
    
    if params[:search]
      @posts = Post.search(params[:search]).order(created_at: :desc)
      flash[:notice] = "#{@posts.count} search results found."
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end
   
# edit my post
  def edit
    set_post
    unless user_signed_in? && current_user.id === @post.user_id 
      redirect_to '/422'
    end
  end

# update my post
  def update
    set_post
    if @post.update(post_params)
    flash[:notice] = "Post has been successfully updated"
    get_profile
    redirect_to @profile
    else
      render "edit"
    end
  end

  def destroy
    set_post
    @post.destroy
    #redirect_to '/'
    redirect_to 'index'
    #flash[:notice] = 'Post was successfully deleted.'
  end  

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def get_profile
    @id = @post.user_id
    @profile = Profile.find_by_user_id(@id)
  end

  def post_params
  	params.require(:post).permit(:title, :content, :image)
  end

end
