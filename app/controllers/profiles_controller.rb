class ProfilesController < ApplicationController
  
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = Profile.new(profile_params)
  	@profile.user_id = current_user.id
  	if @profile.save
  		redirect_to @profile
  	else 
  		render "new"
  	end
  end

  def show
  	@profile = Profile.find(params[:id])
  end

  def edit
  	@profile = Profile.find(params[:id])
  end

  def update
  	@profile = Profile.find(params[:id])
  	if @profile.update(profile_params)
  		#need a success alert
  		redirect_to @profile
  	else
      #need a failed attempt message
  		render "edit"
  	end
  end

  def index
  	@profiles = Profile.all
  end

  private
  def profile_params
  	params.require(:profile).permit(:username, :name, :description, :avatar)
  end
end
