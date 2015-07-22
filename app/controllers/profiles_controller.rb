class ProfilesController < ApplicationController
  
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
  	@profile.user_id = current_user.id
  	if @profile.save
  		redirect_to '/'
  	else 
  		render "new"
  	end
  end

  def show
  	# @id = @profile.id
  	@profile = Profile.find(params[:id])
  end

  def edit
  	@profile = Profile.find(params[:id])
  end

  def update
  	@profile = Profile.find(params[:id])
  	if @profile.update(profile_params)
  		
  		redirect_to @profile
  	else
  		render "edit"
  	end
  end

  def index
  	@profiles = Profile.all
  end

  private
  def profile_params
  	params.require(:profile).permit(:username, :name, :avatar)
  end
end
