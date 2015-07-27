class ProfilesController < ApplicationController
  
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
    #unless user_signed_in? && current_user.id === @post.user_id 
    @profile.user_id = current_user.id
  	if @profile.save
      flash[:notice] = "Profile successfully created"
      redirect_to @profile
  	else 
      render "new"
  	end
  end

  def show
  	@profile = Profile.find(params[:id])
    @posts = @profile.posts.all
  end

  def edit
  	@profile = Profile.find(params[:id])
     unless user_signed_in? && current_user.id === @profile.user_id 
      redirect_to '/422'
    end
    
  end

  def update
  	@profile = Profile.find(params[:id])
  	if @profile.update(profile_params)
  		flash[:notice] = "Profile successfully updated"
  		redirect_to @profile
  	else
  		render "edit"
  	end
  end

  def index
  	@profiles = Profile.all.order(username: :asc)
  
  end

  private
  def profile_params
  	params.require(:profile).permit(:username, :name, :description, :avatar)
  end
end
